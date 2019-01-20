require "scripts.GameScene"
require "scripts.GameEventProc"

GameStart = {}

--游戏开始
function GameStart.OnGameStart()
    --禁用黑色阴影（开全图）
    FogMaskEnable(false)
    --禁用战争迷雾
    FogEnable(false)
    SetCameraField(CAMERA_FIELD_ZOFFSET, 200, 0)
    Game.ChooseLevel()
end

function GameStart.AnyUnitAttack()
    local attactUnit = GetJ_PlayerUnits(GetAttacker())
    local defUnit = GetJ_EnemyUnits(GetTriggerUnit())
    if (attactUnit == nil or defUnit == nil) then
        return
    end
    --迭代技能
    attactUnit:IterateSkills(
    function(skill)
        skill:OnBeginAttack(attactUnit, defUnit)
    end
    )
end

--任意马甲伤害
function GameStart.AnyDummyDamaged(attactUnit, defUnit)
    local mDamages1
    local mDamages2
    if GetUnitAbilityLevel(attactUnit.Entity, GetId("AQ02")) > 0 then
        mDamages1 = { 10, 15, 20, 25, 30, 40 }
        mDamages2 = { 0.4, 0.4, 0.4, 0.4, 0.4, 0.4 }
        local spellUnit = attactUnit.Owner
        local self = attactUnit.Skill
        defUnit:AddBuff("枪林弹雨", self:GetCurLevel())
        local ap = spellUnit.Attribute:get("法术攻击")
        local damage = mDamages1[self:GetCurLevel()] + (ap * mDamages2[self:GetCurLevel()])
        EXUnitDamageTarget(spellUnit, defUnit, damage, EXDamageType.Magic)
    end

    if GetUnitAbilityLevel(attactUnit.Entity, GetId("AQ05")) > 0 then
        local spellUnit = attactUnit.Owner
        defUnit:AddBuff("狂躁律动")
        local ap = spellUnit.Attribute:get("法术攻击")
        EXUnitDamageTarget(spellUnit, defUnit, 100 + ap, EXDamageType.Magic)
    end

    if GetUnitTypeId(attactUnit.Entity) == GetId("uq05") then
        mDamages1 = { 80, 120, 180, 240, 300, 360 }
        mDamages2 = { 0.3, 0.4, 0.5, 0.6, 0.7, 0.8 }
        local spellUnit = attactUnit.Owner
        local self = attactUnit.Skill
        defUnit:AddBuff("爆破雷区", self:GetCurLevel())
        local ap = spellUnit.Attribute:get("法术攻击")
        local damage = mDamages1[self:GetCurLevel()] + (ap * mDamages2[self:GetCurLevel()])
        EXUnitDamageTarget(spellUnit, defUnit, damage, EXDamageType.Magic)
    end

    mDamages1 = nil
    mDamages2 = nil
end

--任意单位伤害
function GameStart.AnyUnitDamaged()
    local attactUnit = GetJ_PlayerUnits(GetEventDamageSource())
    local defUnit = GetJ_EnemyUnits(GetTriggerUnit())
    local damage = GetEventDamage()
    if (attactUnit == nil or defUnit == nil) then
        return
    end
    if (damage == 0 or defUnit.Attribute:get("生命") <= 0 or defUnit.IsDying) then
        return
    end
    attactUnit.LastFightTime = GameScene.Elapsed

    local isCritDamage = false

    --普通攻击
    if (0 ~= EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK)) then
        --模拟暴击
        if (attactUnit.Attribute.Crit > 0) then
            local crit = attactUnit.Attribute.Crit * 100
            local random = GetRandomReal(0, 1) * 100
            if (crit > random) then
                damage = damage * attactUnit.Attribute.CritDamage
                isCritDamage = true
                GameEventProc.SendEvent("任意单位暴击", attactUnit, defUnit)
            end
        end
        if (0 ~= EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_PHYSICAL)) then
            --攻击主目标
            --怒气
            if (attactUnit.ManaType == 2) then
                attactUnit.Attribute:add("怒气值", 10)
            end
            --迭代技能
            attactUnit:IterateSkills(
            function(skill)
                skill:OnAttack(attactUnit, defUnit, isCritDamage)
            end
            )
            --迭代物品
            attactUnit:IterateItems(
            function(item)
                item:OnAttack(attactUnit, defUnit, isCritDamage)
            end
            )
            --迭代Buff
            attactUnit:IterateBuffs(
            function(buff)
                buff:OnAttack(attactUnit, defUnit, isCritDamage)
            end
            )
            --迭代Buff
            defUnit:IterateBuffs(
            function(buff)
                buff:OnHurt(attactUnit, defUnit)
            end
            )
        else
            --飓风
            if (attactUnit:ContainItemId(GetId("I058"))) then
                local comb = attactUnit:GetComb("寒冰-飓风")
                if (comb ~= nil and comb.Enable) then
                    damage = damage * 0.8
                else
                    damage = damage * 0.4
                end
            end
        end
    else
        --幽冥冷火
        local skil = attactUnit:GetSkill(GetId("AX5Z"))
        if (skil ~= nil) then
            local ad = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
            local ap = attactUnit.Attribute:get("法术攻击")
            local buff = defUnit:AddBuff("幽冥冷火")
            --buff
            if (buff ~= nil) then
                buff.AttactUnit = attactUnit
                buff.values = { 10 + 0.4 * ad + 0.4 * ap }
            end
        end
    end

    --重新计算伤害
    if (EXGetDamageType() ~= EXDamageType.Real) then
        --计算护甲
        local def = defUnit.Attribute:get("护甲")
        if (def > 0) then
            local pen = 0
            if (EXGetDamageType() == EXDamageType.Physics) then
                pen = attactUnit.Attribute:get("物理穿透")
            elseif (EXGetDamageType() == EXDamageType.Magic) then
                pen = attactUnit.Attribute:get("法术穿透")
            end
            def = def - def * pen
            local attenuation = def * Game.DamageFactor / (def * Game.DamageFactor + 1)
            damage = damage - damage * attenuation
        else
            attenuation = 2 - (1 - Game.DamageFactor) ^ math.abs(def)
            damage = damage * attenuation
        end
    end
    --计算伤害加成
    if (EXGetDamageType() == EXDamageType.Physics) then
        damage = damage * attactUnit.Attribute:get("物理伤害加成")
    elseif (EXGetDamageType() == EXDamageType.Magic) then
        damage = damage * attactUnit.Attribute:get("法术伤害加成")
    end

    if GetUnitAbilityLevel(attactUnit.Entity, GetId("Aloc")) > 0 then
        EXSetEventDamage(0)
        GameStart.AnyDummyDamaged(attactUnit, defUnit)
    else
        defUnit:AddDamageText(damage, isCritDamage, EXGetDamageColor())
        EXSetEventDamage(damage)
        if (defUnit.Id == GetId("End0")) then
            defUnit.DamageSum = defUnit.DamageSum + damage
        end
    end
    --智能施法
    if (GetUnitAbilityLevel(attactUnit.Entity, GetId("B007")) > 0) then
        attactUnit:IterateSkills(
        function(skill)
            --   -1被动 0无目标 1单位目标 2点目标 3点范围
            if (skill.Order == nil or skill.SkillType == -1 or skill:IsCD()) then
                return
            end
            if (skill.SkillType == 0) then
                IssueImmediateOrder(attactUnit.Entity, skill.Order)
            elseif (skill.SkillType == 4) then
                if (defUnit.Attribute:get("生命") > damage and defUnit.IsDying == false) then
                    IssueTargetOrder(attactUnit.Entity, skill.Order, defUnit.Entity)
                else
                    local enemys = GetEnemyTeamUnits()
                    local radius = Clamp(skill:GetCurRange() - 200, 0, 1000)
                    for i = 1, #enemys do
                        if (enemys[i] ~= nil) then
                            local dist = DistanceBetweenPoint(attactUnit:X(), enemys[i]:X(), attactUnit:Y(), enemys[i]:Y())
                            if (enemys[i] ~= defUnit and dist < radius and enemys[i].IsDying == false) then
                                IssueTargetOrder(attactUnit.Entity, skill.Order, enemys[i].Entity)
                                return
                            end
                        end
                    end
                end
            else
                AssetsManager.OverlapCircle(
                attactUnit:X(),
                attactUnit:Y(),
                Clamp(skill:GetCurRange() - 200, 0, 1000),
                function(enemy)
                    if (skill.SkillType == 1) then
                        IssueTargetOrder(attactUnit.Entity, skill.Order, enemy.Entity)
                    elseif (skill.SkillType == 2 or skill.SkillType == 3) then
                        IssuePointOrder(attactUnit.Entity, skill.Order, enemy:X(), enemy:Y())
                    end
                end
                )
            end
        end
        )
    end
end

local mExpList = { 1, 2, 2, 3, 3, 4, 4 }
local mUnitDeathDropCount = { 0, 0, 0, 0 }
--任意单位死亡
function GameStart.AnyUnitDeath(killUnit, dieUnit)
    if (dieUnit.IsDying == false) then
        dieUnit.IsDying = true
        PlayerInfo:Kill(killUnit, dieUnit)
    end
    --凶手单位是玩家单位
    if
    (GetPlayerController(killUnit.Player) == MAP_CONTROL_USER and
    GetPlayerSlotState(killUnit.Player) == PLAYER_SLOT_STATE_PLAYING and
    IsUnitEnemy(dieUnit.Entity, killUnit.Player) == true)
    then
        --模拟经验
        local units = GetPlayerTeamUnits(GetPlayerId(killUnit.Player))
        local exp = mExpList[GetUnitLevel(dieUnit.Entity)]
        if (exp ~= nil) then
            if IsUnitType(dieUnit.Entity, UNIT_TYPE_HERO) then
                exp = exp * 50
            end
            for i = 1, #units do
                if IsUnitType(units[i].Entity, UNIT_TYPE_HERO) then
                    if (GetUnitLevel(units[i].Entity) < 18 or units[i].CombEnableCount >= 3) then
                        if (Game.GetMode() == GameMode.ENDLESS) then
                            AddHeroXP(units[i].Entity, 1, false)
                        else
                            AddHeroXP(units[i].Entity, exp, false)
                        end
                    end
                end
            end
        end
    end
    --怪兽掉落
    if (Game.GetMode() == GameMode.NORMAL) then
        local playerId = GetPlayerId(killUnit.Player) + 1
        mUnitDeathDropCount[playerId] = mUnitDeathDropCount[playerId] + 1
        if (mUnitDeathDropCount[playerId] >= (PlayerInfo:IsVIP(killUnit.Player) and 20 or 25)) then
            local itemId = Card.RandomDrop()
            if (itemId ~= 0) then
                CreateItem(itemId, dieUnit:X(), dieUnit:Y())
            end
            mUnitDeathDropCount[playerId] = 0
        end
    end
    --迭代技能
    killUnit:IterateSkills(
    function(skill)
        skill:OnKill(dieUnit)
    end
    )
    if (killUnit.tianfu ~= nil) then
        killUnit.tianfu:IterateSkills(
        function(skill)
            skill:OnKill(dieUnit)
        end
        )
    end

    --迭代物品
    killUnit:IterateItems(
    function(item)
        item:OnKill(dieUnit)
    end
    )

    --死亡单位是英雄
    if (IsUnitType(dieUnit.Entity, UNIT_TYPE_HERO)) then
        if (MonsterRefresh.GetCurWaveIndex() == 41 and Game.GetLevel() == 1) then
            AllWavesDie()
        end
        if (MonsterRefresh.GetCurWaveIndex() == 57) then
            if (Game.GetLevel() <= 2) then
                AllWavesDie()
            else
                if (dieUnit.Id == GetId("UM56")) then
                    if (AddKillBossCount() >= PlayerInfo:Count()) then
                        AssetsManager.RemoveObject(dieUnit)
                        EndLessComing()
                        return
                    end
                end
            end
        end
        local abilityId
        if (dieUnit.Id == GetId("UA08") or dieUnit.Id == GetId("UA16") or dieUnit.Id == GetId("UA24") or dieUnit.Id == GetId("UA32") or dieUnit.Id == GetId("UA40") or dieUnit.Id == GetId("UA48")) then
            abilityId = "A004"
        elseif (dieUnit.Id == GetId("UB08") or dieUnit.Id == GetId("UB16") or dieUnit.Id == GetId("UB24") or dieUnit.Id == GetId("UB32") or dieUnit.Id == GetId("UB40") or dieUnit.Id == GetId("UB48")) then
            abilityId = "A005"
        elseif (dieUnit.Id == GetId("UC08") or dieUnit.Id == GetId("UC16") or dieUnit.Id == GetId("UC24") or dieUnit.Id == GetId("UC32") or dieUnit.Id == GetId("UC40") or dieUnit.Id == GetId("UC48")) then
            abilityId = "A006"
        elseif (dieUnit.Id == GetId("UD08") or dieUnit.Id == GetId("UD16") or dieUnit.Id == GetId("UD24") or dieUnit.Id == GetId("UD32") or dieUnit.Id == GetId("UD40") or dieUnit.Id == GetId("UD48")) then
            abilityId = "A007"
        end
        if (abilityId ~= nil) then
            AssetsManager.IteratePlayerUnits(GetPlayerId(killUnit.Player), function(hero)
                if (IsUnitType(hero.Entity, UNIT_TYPE_HERO)) then
                    local dummy = AssetsManager.LoadUnit(hero.Player, "uq00", hero:X(), hero:Y())
                    dummy.Name = "小龙buff"
                    local skill = dummy:AddSkill(abilityId)
                    IssueTargetOrder(dummy.Entity, skill.Order, hero.Entity)
                    AssetsManager.RemoveObject(dummy)
                end
            end)
        end
    end
    AssetsManager.RemoveObject(dieUnit)
end

--任意单位完成建造
function GameStart.AnyUnitConstructFinish()
    local unit = AssetsManager.LoadEntity(GetConstructedStructure()) --完成的建筑
    if (IsUnitType(unit.Entity, UNIT_TYPE_MELEE_ATTACKER) == true) then
        --  UnitAddAbility(unit.Entity, GetId("AHZ1"))
        --  UnitMakeAbilityPermanent(unit.Entity, true, GetId("AHZ1"))
    else
        --  UnitAddAbility(unit.Entity, GetId("AHZ2"))
        --  UnitMakeAbilityPermanent(unit.Entity, true, GetId("AHZ2"))
    end
    EXSetUnitCollisionType(true, unit.Entity, 1)
    if (IsUnitType(unit.Entity, UNIT_TYPE_HERO)) then
        --天赋
        unit:AddTianfu()

        --AddSpecialEffectTarget("blazingwind.mdl", unit.Entity, "origin")
        --羁绊
        AddComb(unit)
        --开启AI
        IssueImmediateOrder(unit.Entity, "manashieldon")

       --[[ unit.Attribute:add("魔法恢复", 100)
        unit.Attribute:add("攻击速度", 2)
        unit.Attribute:add("暴击", 0.5)
        unit.Attribute:add("冷却缩减上限", 0.5)
        unit.Attribute:add("冷却缩减", 0.5)
        unit.Attribute:add("物理攻击", 300000)
        unit.Attribute:add("法术攻击", 100000)]]
        --辅助英雄写死
        if (unit.Id == GetId("UH35")) then
            unit:LearnedSkill(GetId("AH80"))
            unit:LearnedSkill(GetId("AH81"))
        elseif (unit.Id == GetId("UH36")) then
            unit:LearnedSkill(GetId("AH82"))
            unit:LearnedSkill(GetId("AH83"))
        elseif (unit.Id == GetId("UH37")) then
            unit:LearnedSkill(GetId("AH84"))
            unit:LearnedSkill(GetId("AH85"))
        elseif (unit.Id == GetId("UH38")) then
            unit:LearnedSkill(GetId("AH86"))
            unit:LearnedSkill(GetId("AH87"))
        elseif (unit.Id == GetId("UH39")) then
            unit:LearnedSkill(GetId("AH88"))
            unit:LearnedSkill(GetId("AH89"))
        end
    end

    unit:LearnedSkill(GetId("AU10")) --出售
    unit:AddSkill("A009") --闪现
end

--任意单位被出售
function GameStart.AnyUnitSell(unit)
    if (unit.tianfu ~= nil) then
        AssetsManager.DestroyObject(unit.tianfu)
    end
    AssetsManager.RemoveObject(unit)
    RemoveUnit(unit.Entity)

    local tim = CreateTimer()
    TimerStart(
    tim,
    0.01,
    false,
    function()
        unit:RefreshComb()
        DestroyTimer(tim)
    end
    )
end

--任意单位发布建造命令
function GameStart.AnyUnitOrderBuild()
    local orderPos = GetOrderPointLoc()
    local orderID = GetIssuedOrderId()
    local orderUnit = GetOrderedUnit()
    if (852008 <= orderID and 852013 >= orderID) then
        --不可建造地面
        local item = UnitItemInSlot(orderUnit, orderID - 852008)
        if (IsTerrainPathable(GetLocationX(orderPos), GetLocationY(orderPos), PATHING_TYPE_BUILDABILITY)) then
            DisplayTimedTextToPlayer(GetOwningPlayer(orderUnit), 0, 0, 5, "|cffEE0000该区域不能进行建造。|r")
            IssueImmediateOrder(orderUnit, "stop")
            IssuePointOrderLoc(orderUnit, "move", GetUnitLoc(orderUnit))
        elseif
        (GetWidgetLife(item) + GetPlayerState(GetOwningPlayer(orderUnit), PLAYER_STATE_RESOURCE_FOOD_USED) >
        (GetPlayerState(GetOwningPlayer(orderUnit), PLAYER_STATE_FOOD_CAP_CEILING)))
        then
            DisplayTimedTextToPlayer(GetOwningPlayer(orderUnit), 0, 0, 5, "|cffEE0000人口已满。|r")
            IssueImmediateOrder(orderUnit, "stop")
            IssuePointOrderLoc(orderUnit, "move", GetUnitLoc(orderUnit))
        end
    end
end

--任意单位被召唤
function GameStart.AnyUnitSummon()
    local summoningUnit = GetJ_PlayerUnits(GetSummoningUnit())
    --召唤者
    if (summoningUnit == nil) then
        return
    end
    local summonedUnit = AssetsManager.LoadEntity(GetSummonedUnit()) --召唤单位
end

--任意单位提升等级
function GameStart.AnyHeroLevelUp()
    local unit = GetJ_PlayerUnits(GetTriggerUnit())
    if (unit == nil) then
        Game.LogError("任意单位提升等级-丢失单位")
        return
    end

    --迭代物品
    unit:IterateItems(
    function(item)
        item:OnUpgrade()
        item:OnRefresh()
    end
    )
    unit:OnLevelUp()
end

--任意单位学习技能
function GameStart.AnyUnitLearnedSkill()
    local learnedUnit = GetJ_PlayerUnits(GetLearningUnit())
    local abilityId = GetLearnedSkill()
    if (learnedUnit == nil) then
        Game.LogError("任意单位学习技能-丢失单位")
        return
    end
    local skill = learnedUnit:LearnedSkill(abilityId)
end

--任意准备施放技能
function GameStart.AnyUnitSpellChannel()
    local spellUnit = GetJ_PlayerUnits(GetSpellAbilityUnit())
    local abilityId = GetSpellAbilityId()
    if (spellUnit == nil) then
        return
    end

    local skill = spellUnit:GetSkill(abilityId)
    if (skill ~= nil) then
        skill:OnSpellChannel()
    end
end

--任意单位发动技能效果
function GameStart.AnyUnitSpellEffect()
    local spellUnit = GetJ_PlayerUnits(GetSpellAbilityUnit())
    local abilityId = GetSpellAbilityId()
    if (spellUnit == nil) then
        Game.LogError("任意单位发动技能效果-丢失单位")
        return
    end

    local skill = spellUnit:GetSkill(abilityId)
    if (skill ~= nil) then
        skill:OnSpell()

        --迭代物品
        spellUnit:IterateItems(
        function(item)
            item:OnCast()
        end
        )
    end

    if (abilityId == GetId("AI47")) then
        SetUnitPosition(spellUnit.Entity, GetSpellTargetX(), GetSpellTargetY())
    end
end

--任意单位施放技能结束
function GameStart.AnyUnitSpellFinish()
    local spellUnit = GetJ_PlayerUnits(GetSpellAbilityUnit())
    if (spellUnit == nil) then
        Game.LogError("任意单位施放技能结束-丢失单位")
        return
    end
    IssueImmediateOrder(spellUnit.Entity, "stop")
end

--任意单位获得物品
function GameStart.AnyUnitPickUpItem()
    local unit = GetJ_PlayerUnits(GetManipulatingUnit())
    local entity = GetManipulatedItem()
    if (unit == nil) then
        Game.LogError("任意单位获得物品-丢失单位")
        return
    end
    unit:AddItem(entity)

    --刷新所有道具
    unit:IterateItems(
    function(item)
        item:OnRefresh()
    end
    )

    if (GetItemLevel(GetManipulatedItem()) == 11) then
        local tim = CreateTimer()
        TimerStart(
        tim,
        0.01,
        false,
        function()
            unit:RefreshComb()
            DestroyTimer(tim)
        end
        )
    end
end

--任意单位使用物品
function GameStart.AnyUnitUseItem()
    local unit = GetJ_PlayerUnits(GetManipulatingUnit())
    if (unit == nil) then
        Game.LogError("任意单位使用物品-丢失单位")
        return
    end
    local item = unit:GetItem(GetManipulatedItem())
    if (item ~= nil) then
        item:OnUse()
    end
end

--任意单位出售物品
function GameStart.AnyUnitSellItem()
    local unit = GetJ_PlayerUnits(GetBuyingUnit())
    if (unit == nil) then
        Game.LogError("任意单位出售物品-丢失单位")
        return
    end
    unit:_RemoveItem(GetSoldItem())

    if (GetItemLevel(GetSoldItem()) == 11) then
        local tim = CreateTimer()
        TimerStart(
        tim,
        0.01,
        false,
        function()
            unit:RefreshComb()
            DestroyTimer(tim)
        end
        )
    end
end

--任意单位丢弃物品
function GameStart.AnyUnitDropItem()
    local unit = GetJ_PlayerUnits(GetManipulatingUnit())
    if (unit == nil) then
        Game.LogError("任意单位丢弃物品-丢失单位")
        return
    end
    unit:_RemoveItem(GetManipulatedItem())

    if (GetItemLevel(GetManipulatedItem()) == 11) then
        local tim = CreateTimer()
        TimerStart(
        tim,
        0.01,
        false,
        function()
            unit:RefreshComb()
            DestroyTimer(tim)
        end
        )
    end
end

--任意玩家输入字符串
function GameStart.AnyPlayerChat()
    local player = GetTriggerPlayer()
    local playerID = GetPlayerId(player)
    local str = string.lower(GetEventPlayerChatString())

    if (str == "++") then
        AddCameraFieldForPlayer()
        return
    end

    if (str == "--") then
        MinusCameraFieldForPlayer()
        return
    end

    if (str == "-repick") then
        Repick(player, playerID)
        return
    end

    if (str == "-jf") then
        DisplayTextToPlayer(player, 0, 0, "|cffffcc00您当前积分为：|r" .. PlayerInfo:Player(playerID).Score)
        return
    end

    if (IsDebug == false) then
        return
    end

    if (str == "cheat") then
        cheat(playerID)
        return
    end
    local index = string.find(str, "jf:")
    if (index ~= nil) then
        local score = tonumber(string.sub(str, index + 3, #str))
        if (score ~= nil) then
            PlayerInfo.AddScore(player, score)
        end
        return
    end

    local index = string.find(str, "item:")
    if (index ~= nil) then
        local itemId = string.sub(str, index + 5, #str)
        if (#itemId == 4) then
            UnitAddItem(
            Worke[playerID].Entity,
            CreateItem(GetId(string.upper(itemId)), Worke[playerID]:X(), Worke[playerID]:Y())
            )
        end
        return
    end

    if (str == "pause") then
        DisplayTextToAll("暂停游戏", Color.red)
        Game.Pause(true)
        return
    end
    if (str == "restart") then
        DisplayTextToAll("恢复游戏", Color.red)
        Game.Pause(false)
        PauseGame(false)
        return
    end
    if (str == "kill") then
        for i = #GetEnemyTeamUnits(), 1, -1 do
            AssetsManager.DestroyObject(GetEnemyTeamUnits()[i])
        end
        return
    end

    if (str == "up") then
        local units = GetPlayerTeamUnits(playerID)
        for i = #units, 1, -1 do
            if (IsUnitType(units[i].Entity, UNIT_TYPE_HERO)) then
                SetHeroLevel(units[i].Entity, GetHeroLevel(units[i].Entity) + 1, true)
            end
        end
        return
    end

    index = string.find(str, "up:")
    if (index ~= nil) then
        local level = tonumber(string.sub(str, index + 3, #str))
        if (level ~= nil) then
            local units = GetPlayerTeamUnits(playerID)
            for i = #units, 1, -1 do
                if (IsUnitType(units[i].Entity, UNIT_TYPE_HERO)) then
                    for j = 1, level do
                        SetHeroLevel(units[i].Entity, GetHeroLevel(units[i].Entity) + 1, true)
                    end
                end
            end
        end
        return
    end

    index = string.find(str, "speed:")
    if (index ~= nil) then
        local speed = tonumber(string.sub(str, index + 6, #str))
        if (speed ~= nil) then
            Game.SetSpeed(speed)
        end
        return
    end

    index = string.find(str, "wave:")
    if (index ~= nil) then
        local waveIndex = tonumber(string.sub(str, index + 5, #str))
        if (waveIndex ~= nil) then
            MonsterRefresh.SetWaveIndex(waveIndex)
        end
        return
    end
end