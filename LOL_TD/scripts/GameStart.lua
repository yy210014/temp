require "scripts.GameScene"
require "scripts.GameEventProc"

GameStart = {}

--游戏开始
function GameStart.OnGameStart()
    --禁用黑色阴影（开全图）
    FogMaskEnable(false)
    --禁用战争迷雾
    FogEnable(false)
    SuspendTimeOfDay(true)
    SetMapMusic("war3mapImported\\bgm.mp3", true, 0)
    SetCameraField(CAMERA_FIELD_ZOFFSET, 200, 0)
    CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "新手必看", "前期建议购买贪婪可以获得更多的经济。|n前期偏弱的英雄可以开局购买装备火焰之心帮助你更好的清怪.UI商店的道具右键可以直接购买。|n战士出物理攻击装备，法师出法术强度装备，优先把人物的装备羁绊做出来然后在慢慢熟悉游戏环境。|n欢迎玩家加入召唤师联盟TD官方群：278856237", "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp")
    CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "指令说明", "输入+/-可以抬高或者降低镜头视角|n输入-swap可以把一张SR卡重新免费随机一次|n输入-jf可以查看自己当前游戏积分", "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp")
    CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "积分说明", "通关难1获得10积分,通关难2获得20积分,通关难3获得30积分|n进入无尽模式后难2每守住1波奖励1积分，每5波为1轮守住1轮奖励3积分.难3积分翻倍。购买会员获得的所有积分翻倍。", "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp")
    CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "天赋系统", "开局领取小黄鸡福利赠送1天赋点，每击杀100个小兵或击杀一条小龙可以获得1天赋点，天赋点用于给英雄学习天赋技能。游戏内共有十几种不同的天赋，每个天赋分为C,B,A,S四种等级，并且达成任意两个羁绊可以解锁强力的超能天赋，天赋系统能更好的强化你的英雄。", "Icon\\TianFu.blp")
    CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "羁绊系统", "每个英雄都有个羁绊技能，羁绊可以和人物点亮也可以和装备点亮，点亮的羁绊可以为英雄提供额外属性。任意英雄点亮两个以上羁绊可以解锁超能天赋，点亮三个以上羁绊可以突破18级等级限制。", "ReplaceableTextures\\CommandButtons\\BTNMetamorphosis.blp")

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
        EXUnitDamageTarget(spellUnit, defUnit, damage, EXAbilityType.Magic_Ability)
    end

    if GetUnitAbilityLevel(attactUnit.Entity, GetId("AQ05")) > 0 then
        local spellUnit = attactUnit.Owner
        defUnit:AddBuff("狂躁律动")
        local ap = spellUnit.Attribute:get("法术攻击")
        EXUnitDamageTarget(spellUnit, defUnit, 100 + ap, EXAbilityType.Magic_Ability)
    end

    if GetUnitTypeId(attactUnit.Entity) == GetId("uq05") then
        mDamages1 = { 80, 120, 180, 240, 300, 360 }
        mDamages2 = { 0.3, 0.4, 0.5, 0.6, 0.7, 0.8 }
        local spellUnit = attactUnit.Owner
        local self = attactUnit.Skill
        defUnit:AddBuff("爆破雷区", self:GetCurLevel())
        local ap = spellUnit.Attribute:get("法术攻击")
        local damage = mDamages1[self:GetCurLevel()] + (ap * mDamages2[self:GetCurLevel()])
        EXUnitDamageTarget(spellUnit, defUnit, damage, EXAbilityType.Magic_Ability)
    end

    if GetUnitTypeId(attactUnit.Entity) == GetId("uq13") then
        mDamages1 = { 80, 120, 180, 240, 300, 360 }
        mDamages2 = { 0.3, 0.4, 0.5, 0.6, 0.7, 0.8 }
        local spellUnit = attactUnit.Owner
        local self = attactUnit.Skill
        defUnit:AddBuff("蘑菇减少移速", self:GetCurLevel())
        local buf = defUnit:AddBuff("蘑菇毒", self:GetCurLevel())
        if (buf ~= nil) then
            buf.AttactUnit = spellUnit
        end
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

            if GetUnitAbilityLevel(attactUnit.Entity, GetId("B031")) > 0 then
                defUnit:AddBuff("红buff减速")
                local buff = defUnit:AddBuff("红buff灼烧")
                if (buff ~= nil) then
                    buff.AttactUnit = attactUnit
                end
            end
        else
            --飓风
            if (attactUnit:ContainItemId(GetId("I058"))) then
                local comb = attactUnit:GetComb("寒冰-飓风")
                if (comb ~= nil and comb.Enable) then
                    damage = damage
                else
                    damage = damage * 0.5
                end
            end
            --提莫E
            local ah72 = attactUnit:GetSkill(GetId("AH72"))
            if (ah72 ~= nil) then
                ah72:OnAttack(attactUnit, defUnit, isCritDamage)
            end
        end
    else
        if (EXGetAttackType() == EXAbilityType.Magic) then
            --幽冥冷火
            local skil = attactUnit:GetSkill(GetId("AX5Z"))
            if (skil ~= nil) then
                local ad = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
                local ap = attactUnit.Attribute:get("法术攻击")
                local buff = defUnit:AddBuff("幽冥冷火")
                --buff
                if (buff ~= nil) then
                    buff.AttactUnit = attactUnit
                    buff.values = { 10 + 0.1 * ad + 0.1 * ap }
                end
            end
        end
        if (EXGetAttackType() == EXAbilityType.Physics_Ability or EXGetAttackType() == EXAbilityType.Magic_Ability) then
            --迭代物品
            attactUnit:IterateItems(
            function(item)
                item:OnSkillDamage(defUnit)
            end
            )
        end
    end

    --重新计算伤害
    if (EXGetAttackType() ~= EXAbilityType.Real) then
        --计算护甲
        local def = defUnit.Attribute:get("护甲")
        if (def > 0) then
            local pen = 0
            if (EXGetAttackType() == EXAbilityType.Physics or EXGetAttackType() == EXAbilityType.Physics_Ability) then
                pen = attactUnit.Attribute:get("物理穿透")
            elseif (EXGetAttackType() == EXAbilityType.Magic or EXGetAttackType() == EXAbilityType.Magic_Ability) then
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
    if (EXGetAttackType() == EXAbilityType.Physics or EXGetAttackType() == EXAbilityType.Physics_Ability) then
        damage = damage * attactUnit.Attribute:get("物理伤害加成")
    elseif (EXGetAttackType() == EXAbilityType.Magic or EXGetAttackType() == EXAbilityType.Magic_Ability) then
        damage = damage * attactUnit.Attribute:get("法术伤害加成")
    end

    --死神裁决
    if GetUnitAbilityLevel(attactUnit.Entity, GetId("AX6Z")) > 0 then
        if (defUnit.Attribute:get("生命") < defUnit.Attribute:get("生命上限") * 0.5) then
            damage = damage + damage * 0.35
        end
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
    if (GetUnitAbilityLevel(attactUnit.Entity, GetId("B007")) > 0 and EXGetAttackType() ~= EXAbilityType.Real) then
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
                    local radius = Misc.Clamp(skill:GetCurRange() - 200, 0, 1000)

                    --可以优化从对于的敌人开始进行索引
                    local enemyTeamUnits = GetEnemyTeamUnits()
                    for j = 1, #enemyTeamUnits do
                        local list = enemyTeamUnits[j]
                        for i = 1, #list do
                            if (list[i] ~= nil and list[i].IsDying == false) then
                                local dist = DistanceBetweenPoint(attactUnit:X(), list[i]:X(), attactUnit:Y(), list[i]:Y())
                                if (list[i] ~= defUnit and dist < radius and list[i].IsDying == false) then
                                    IssueTargetOrder(attactUnit.Entity, skill.Order, list[i].Entity)
                                    return
                                end
                            end
                        end
                    end
                end
            else
                AssetsManager.OverlapCircle(
                attactUnit:X(),
                attactUnit:Y(),
                Misc.Clamp(skill:GetCurRange() - 200, 0, 1000),
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
        if (mUnitDeathDropCount[playerId] >= (PlayerInfo:IsVIP(killUnit.Player) and 24 or 25)) then
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
    local abilityId = nil
    if (IsUnitType(dieUnit.Entity, UNIT_TYPE_HERO)) then
        if (MonsterRefresh.GetCurWaveIndex() == 57) then
            if (Game.GetLevel() <= 1) then
                if (dieUnit.Id == GetId("UM56")) then
                    Game.Win()
                    return
                end
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
        if (dieUnit.Id == GetId("UA08") or dieUnit.Id == GetId("UA16") or dieUnit.Id == GetId("UA24") or dieUnit.Id == GetId("UA32") or dieUnit.Id == GetId("UA40") or dieUnit.Id == GetId("UA48")) then
            abilityId = "A004"
        elseif (dieUnit.Id == GetId("UB08") or dieUnit.Id == GetId("UB16") or dieUnit.Id == GetId("UB24") or dieUnit.Id == GetId("UB32") or dieUnit.Id == GetId("UB40") or dieUnit.Id == GetId("UB48")) then
            abilityId = "A005"
        elseif (dieUnit.Id == GetId("UC08") or dieUnit.Id == GetId("UC16") or dieUnit.Id == GetId("UC24") or dieUnit.Id == GetId("UC32") or dieUnit.Id == GetId("UC40") or dieUnit.Id == GetId("UC48")) then
            abilityId = "A006"
        elseif (dieUnit.Id == GetId("UD08") or dieUnit.Id == GetId("UD16") or dieUnit.Id == GetId("UD24") or dieUnit.Id == GetId("UD32") or dieUnit.Id == GetId("UD40") or dieUnit.Id == GetId("UD48")) then
            abilityId = "A007"
        elseif dieUnit.Id == GetId("Ye01") then
            abilityId = "A014"
            local money = 100 + 20 * MonsterRefresh.GetCurWaveIndex()
            SetPlayerState(killUnit.Player, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(killUnit.Player, PLAYER_STATE_RESOURCE_GOLD) + money)
            DisplayTextToPlayer(killUnit.Player, 0, 0, "击杀了|cffffcc00蓝爸爸|r,奖励金币数量：|cffffcc00" .. money .. "|r,并获得蓝BUFF增益，持续60秒。")
        elseif dieUnit.Id == GetId("Ye02") then
            abilityId = "A015"
            local money = 100 + 20 * MonsterRefresh.GetCurWaveIndex()
            SetPlayerState(killUnit.Player, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(killUnit.Player, PLAYER_STATE_RESOURCE_GOLD) + money)
            DisplayTextToPlayer(killUnit.Player, 0, 0, "击杀了|cffffcc00红爸爸|r,奖励金币数量：|cffffcc00" .. money .. "|r,并获得红BUFF增益，持续60秒。")
        end
    else
        if dieUnit.Id == GetId("ye03") then
            local money = 100 + 30 * MonsterRefresh.GetCurWaveIndex()
            SetPlayerState(killUnit.Player, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(killUnit.Player, PLAYER_STATE_RESOURCE_GOLD) + money)
            DisplayTextToPlayer(killUnit.Player, 0, 0, "击杀了|cffffcc00河蟹|r,奖励金币数量：|cffffcc00" .. money .. "|r")
        end
    end
    if (abilityId ~= nil) then
        AssetsManager.IteratePlayerUnits(GetPlayerId(killUnit.Player), function(hero)
            if (IsUnitType(hero.Entity, UNIT_TYPE_HERO)) then
                local dummy = AssetsManager.LoadUnit(hero.Player, "uq00", hero:X(), hero:Y())
                dummy.Name = "野怪buff"
                local skill = dummy:AddSkill(abilityId)
                IssueTargetOrder(dummy.Entity, skill.Order, hero.Entity)
                AssetsManager.RemoveObject(dummy)
            end
        end)
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
    --EXSetUnitCollisionType(true, unit.Entity, 1)
    if (IsUnitType(unit.Entity, UNIT_TYPE_HERO)) then
        local goldcost = Slk.unit[unit.Id]["goldcost"]
        if (tonumber(goldcost) >= 1000) then
            --天赋
            unit:AddTianfu()
            --羁绊
            AddComb(unit)
        end
        --开启AI
        IssueImmediateOrder(unit.Entity, "manashieldon")

        --[[   unit.Attribute:add("魔法恢复", 100)
        unit.Attribute:add("攻击速度", 2)
        unit.Attribute:add("暴击", 0.5)
        unit.Attribute:add("冷却缩减上限", 0.8)
        unit.Attribute:add("冷却缩减", 0.8)
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

    local tim = CreateTimer()
    TimerStart(
    tim,
    0,
    false,
    function()
        unit:RefreshComb()
        RemoveUnit(unit.Entity)
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
        Game.LogError("技能:" .. GetObjectName(abilityId) .. "开始学习,丢失单位:" .. GetUnitName(GetSpellAbilityUnit()))
        return
    end
    local skill = learnedUnit:LearnedSkill(abilityId)
end

--任意准备施放技能
function GameStart.AnyUnitSpellChannel()
    local spellUnit = GetJ_PlayerUnits(GetSpellAbilityUnit())
    local abilityId = GetSpellAbilityId()
    if (spellUnit == nil) then
        Game.LogError("技能:" .. GetObjectName(abilityId) .. "准备施放,丢失单位:" .. GetUnitName(GetSpellAbilityUnit()))
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

    --破败之刃
    if (abilityId == GetId("A016")) then
        local target = GetJ_EnemyUnits(GetSpellTargetUnit())
        if (target == nil) then
            Game.LogError("破败之刃-丢失目标")
            return
        end
        EXUnitDamageTarget(spellUnit, target, 1000, EXAbilityType.Magic)
        spellUnit:AddBuff("破败之刃加速")
        target:AddBuff("破败之刃减速")
        return
    end

    --小弯刀
    if (abilityId == GetId("A018")) then
        local target = GetJ_EnemyUnits(GetSpellTargetUnit())
        if (target == nil) then
            Game.LogError("小弯刀-丢失目标")
            return
        end
        EXUnitDamageTarget(spellUnit, target, 500, EXAbilityType.Magic)
        target:AddBuff("小弯刀")
        return
    end

    if (spellUnit == nil) then
        Game.LogError("技能:" .. GetObjectName(abilityId) .. "发动效果,丢失单位:" .. GetUnitName(GetSpellAbilityUnit()))
        return
    end

    local skill = spellUnit:GetSkill(abilityId)
    if (skill ~= nil) then
        skill:OnSpell()
        if (abilityId ~= GetId("AT00") and abilityId ~= GetId("A009") and abilityId ~= GetId("AU10")) then
            --迭代物品
            spellUnit:IterateItems(
            function(item)
                item:OnCast()
            end
            )
        end
    end
    if (abilityId == GetId("AI47")) then
        if (IsTerrainPathable(GetSpellTargetX(), GetSpellTargetY(), PATHING_TYPE_BUILDABILITY)) then
            DisplayTimedTextToPlayer(spellUnit.Player, 0, 0, 5, "|cffEE0000该区域不能进行闪现。|r")
        else
            local x = spellUnit:X()
            local y = spellUnit:Y()
            SetUnitPosition(spellUnit.Entity, GetSpellTargetX(), GetSpellTargetY())
            if (IsTerrainPathable(spellUnit:X(), spellUnit:Y(), PATHING_TYPE_BUILDABILITY)) then
                SetUnitPosition(spellUnit.Entity, x, y)
                DisplayTimedTextToPlayer(spellUnit.Player, 0, 0, 5, "|cffEE0000该区域不能进行闪现。|r")
            end
        end
    end
end

--任意单位施放技能结束
function GameStart.AnyUnitSpellFinish()
    local spellUnit = GetJ_PlayerUnits(GetSpellAbilityUnit())
    local abilityId = GetSpellAbilityId()
    if (spellUnit == nil) then
        if (abilityId ~= GetId("AU10")) then
            Game.LogError("技能:" .. GetObjectName(abilityId) .. "施放结束,丢失单位:" .. GetUnitName(GetSpellAbilityUnit()))
        end
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
    local level = GetItemLevel(entity)
    unit:AddItem(entity)
    local tim = CreateTimer()
    TimerStart(
    tim,
    0,
    false,
    function()
        --刷新所有道具
        unit:IterateItems(
        function(item)
            if (item ~= nil) then
                item:OnRefresh()
            end
        end
        )
        if (level == 11) then
            unit:RefreshComb()
        end
        DestroyTimer(tim)
    end
    )
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
        0,
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
        0,
        false,
        function()
            unit:RefreshComb()
            DestroyTimer(tim)
        end
        )
    end
end

local mEmitters = { "简单弹幕", "旋转弹幕", "圆形弹幕", "圆形弹幕-交叉", "扇形弹幕", "旋转X4", "仙女散花", "E008", "倒勾" }
local mEmitterIndex = 0
--任意玩家输入字符串
function GameStart.AnyPlayerChat()
    local player = GetTriggerPlayer()
    local playerID = GetPlayerId(player)
    local str = string.lower(GetEventPlayerChatString())

    if (str == "天天rpg") then
        AddMoney(player, playerID)
        return
    end

    if (str == "+") then
        AddCameraFieldForPlayer()
        return
    end

    if (str == "-") then
        MinusCameraFieldForPlayer()
        return
    end

    if (str == "-swap") then
        Repick(player, playerID)
        return
    end

    if (str == "-jf") then
        DisplayTextToPlayer(player, 0, 0, "|cffffcc00您当前积分为：|r" .. PlayerInfo:Player(playerID).Score)
        return
    end

    if (str == "debug") then
        require("jass.console").enable = true
        return
    end
end