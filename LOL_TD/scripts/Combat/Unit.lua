Unit = {}
local mt = {}
Unit.__index = mt
Unit.Locomotion = nil
--Unit.__index = mt
mt.Entity = nil --实体
mt.Attribute = nil
mt.Skills = nil
mt.Buffs = nil
mt.Items = nil
mt.Player = nil
mt.Name = "name"
mt.Id = 0
mt.ManaType = 0 -- -1什么都没有 0蓝量英雄 1能量英雄 2怒气英雄
mt.LastFightTime = 0

local mHeroRegenManaList = {
    --ad
    [GetId("UH12")] = {1.6, 0.1}, --赵信
    [GetId("UH11")] = {1.6, 0.1}, --皇子
    [GetId("UH19")] = {1.6, 0.1}, --易大师
    [GetId("UH25")] = {2.4, 0.1}, --寒冰
    [GetId("UH23")] = {2.4, 0.1}, --小炮
    [GetId("UH13")] = {1.6, 0.2}, --天使
    --ap
    [GetId("UH02")] = {3, 0.2}, --莫甘娜
    [GetId("UH08")] = {3, 0.2}, --小法
    [GetId("UH03")] = {3, 0.2}, --炸弹人
    [GetId("UH06")] = {3, 0.2}, --丽桑卓
    [GetId("UH01")] = {3, 0.2}, --拉克丝
    --辅助
    [GetId("UH35")] = {3, 0.2}, --风女
    [GetId("UH36")] = {3, 0.2}, --琴女
    [GetId("UH37")] = {3, 0.2}, --日女
    [GetId("UH38")] = {3, 0.2}, --时光老头
    [GetId("UH39")] = {3, 0.2} --牛头
}

function Unit:New(entity)
    if (entity == nil) then
        Game.LogError("单位为null")
        return nil
    end
    local newUnit = {}
    setmetatable(newUnit, {__index = Unit})
    newUnit.Entity = entity
    newUnit.Attribute = Attribute:New(newUnit)
    newUnit.Player = GetOwningPlayer(entity)
    newUnit.Name = GetUnitName(entity)
    newUnit.Id = GetUnitTypeId(entity)
    newUnit.FactionId = GetPlayerId(newUnit.Player) < 4 and PlayerTeamFactionId or EnemyTeamFactionId
    newUnit.IsDying = false
    newUnit.LastFightTime = 0
    newUnit.DieTime = 5
    newUnit.LifeDt = 0
    newUnit.TextDt = 0
    newUnit.Skills = {}
    newUnit.Buffs = {}
    newUnit.Items = {}
    newUnit.Combs = {}
    newUnit.CombEnableCount = 0
    newUnit.Texts = {}
    newUnit.ManaType = 0

    if GetUnitAbilityLevel(entity, GetId("AHZ3")) > 0 then
        SetUnitState(entity, UNIT_STATE_MAX_MANA, 0)
        newUnit.ManaType = -1
    elseif GetUnitAbilityLevel(entity, GetId("AHZ4")) > 0 then
        SetUnitState(entity, UNIT_STATE_MAX_MANA, 100)
        SetUnitState(entity, UNIT_STATE_MANA, 100)
        newUnit.ManaType = 1
    elseif GetUnitAbilityLevel(entity, GetId("AHZ5")) > 0 then
        SetUnitState(entity, UNIT_STATE_MAX_MANA, 100)

        SetUnitState(entity, UNIT_STATE_MANA, 0)
        newUnit.ManaType = 2
    end
    --初始回蓝
    if (mHeroRegenManaList[newUnit.Id] ~= nil) then
        newUnit.Attribute:add("魔法恢复", mHeroRegenManaList[newUnit.Id][1])
        newUnit.Primary = Slk.unit[newUnit.Id]["Primary"]
    end
    return newUnit
end

function Unit:CreateDummy(modelName, x, y)
    local unit = CreateUnit(self.Player, GetId("uq00"), x, y, self:Facing())
    if (unit == nil) then
        Game.LogError("单位为null")
        return nil
    end
    if (modelName ~= "") then
        AddSpecialEffectTarget(modelName, unit, "origin")
    end
    return unit
end

function Unit:OnKill(killer)
    --[[   local tim = CreateTimer()
    TimerStart(
        tim,
        0.01,
        false,
        function()
            AssetsManager.RemoveObject(self)
            GameStart.AnyUnitDeath(killer, self)
            DestroyTimer(GetExpiredTimer())
        end
    )]]
end

function Unit:AddSkill(abilityid)
    abilityid = GetId(abilityid)
    UnitAddAbility(self.Entity, abilityid)
    UnitMakeAbilityPermanent(self.Entity, true, abilityid)
    local skill = Skill:New(self, abilityid)
    self.Skills[#self.Skills + 1] = skill
    return skill
end

function Unit:LearnedSkill(abilityid)
    local skill = self:GetSkill(abilityid)
    if (skill == nil) then
        skill = Skill:New(self, abilityid)
        self.Skills[#self.Skills + 1] = skill
    end
    skill:OnLearned()
    skill:SetStack(skill.Stack)
    return skill
end

function Unit:AddItem(entity)
    local item = Item:New(self, entity)
    self.Items[#self.Items + 1] = item
    Item.ItemUniquenessList(self, item)
    Item.ItemOverlay(self, item)
    Item.ItemCompound(self)
    item:OnAdd()
    item:OnRefresh()
    return item
end

function Unit:AddLocomotion(name)
    if (self.Attribute:get("生命") <= 0 or self.IsDying) then
        return
    end
    if (self.Locomotion ~= nil) then
        self:RemoveLocomotion()
    end
    self.Locomotion = Locomotion:New(self, name)
    return self.Locomotion
end

function Unit:RefreshComb()
    local heros = GetPlayerTeamUnits(GetPlayerId(self.Player))
    for i = 1, #heros do
        if (IsUnitType(heros[i].Entity, UNIT_TYPE_HERO)) then
            for j = 1, #heros[i].Combs do
                if heros[i].Combs[j]:Conditions() then
                    if (heros[i].Combs[j].Enable == false) then
                        heros[i].Combs[j].Enable = true
                        heros[i].Combs[j]:OnEnable()
                        heros[i].CombEnableCount = heros[i].CombEnableCount + 1
                        if (heros[i].tianfu ~= nil) then
                            if (heros[i].CombEnableCount >= 2 and heros[i].tianfu:GetSkill(GetId("AX06")) ~= nil) then
                                heros[i].tianfu:RemoveSkill("AX06")
                                heros[i].tianfu:AddSkill("AT06")
                            end
                        end
                    end
                else
                    if (heros[i].Combs[j].Enable == true) then
                        heros[i].Combs[j].Enable = false
                        heros[i].Combs[j]:OnDisable()
                        heros[i].CombEnableCount = heros[i].CombEnableCount - 1
                    end
                end
            end
            heros[i]:RefreshCombInfo()
        end
    end
end

function Unit:RefreshCombInfo()
    local art = ""
    for k, v in ipairs(self.Combs) do
        art = art .. "|c" .. (v.Enable and Color.yellow or Color.gray) .. v.Ubertip .. "|r"
    end
    EXSetAbilityDataString(EXGetUnitAbility(self.Entity, self.CombId), 1, ABILITY_DATA_UBERTIP, art)
end

--羁绊
function Unit:AddComb(comb)
    if (self.CombId == nil) then
        self.CombId = GetId("J" .. GetPlayerId(self.Player) .. string.sub(ID2Str(self.Id), 3, 4))
        UnitAddAbility(self.Entity, self.CombId)
        UnitMakeAbilityPermanent(self.Entity, true, self.CombId)
    end
    comb.Owner = self
    self.Combs[#self.Combs + 1] = comb

    --检查所有单位羁绊关系
    self:RefreshComb()
end

function Unit:GetComb(name)
    for i, v in ipairs(self.Combs) do
        if (v.Name == name) then
            return v
        end
    end
    return nil
end

--天赋
function Unit:AddTianfu()
    self:AddSkill("AT00")
    local tianfu = AssetsManager.LoadUnit(self.Player, "ut99", self:X(), self:Y())
    SetUnitPathing(tianfu.Entity, false)
    self.tianfu = tianfu
    tianfu.SelectUnit = self
    tianfu:LearnedSkill(GetId("AT01"))
    tianfu:LearnedSkill(GetId("AT02"))
    tianfu:LearnedSkill(GetId("AT03"))
    tianfu:LearnedSkill(GetId("AT07"))
end

function Unit:AddDamageText(damage, isCritDamage, color)
    self.Texts[#self.Texts + 1] = {damage, isCritDamage, color}
end

function Unit:AddBuff(name, level)
    if (self.Attribute:get("生命") <= 0 or self.IsDying) then
        return
    end

    local buff = self:GetBuff(name)
    if (buff ~= nil) then
        if (buff.MaxStack > 1) then
            buff:AddStack()
            return buff
        end
        self:RemoveBuff(name)
    end
    buff = Buff:New(self, name, level or 1)
    self.Buffs[#self.Buffs + 1] = buff
    buff:OnAdd()
    return buff
end

function Unit:ContainBuff(name)
    for i, v in ipairs(self.Buffs) do
        if (v.Name == name) then
            return true
        end
    end
    return false
end

function Unit:ContainSkill(abilityid)
    for i, v in ipairs(self.Skills) do
        if (v.Id == abilityid) then
            return true
        end
    end
    return false
end

function Unit:ContainItem(entity)
    for i, v in ipairs(self.Items) do
        if (v.Entity == entity) then
            return true
        end
    end
    return false
end

function Unit:GetBuff(name)
    for i = 1, #self.Buffs do
        if (self.Buffs[i].Name == name) then
            return self.Buffs[i]
        end
    end
    return nil
end

function Unit:GetSkill(abilityid)
    for i = 1, #self.Skills do
        if (self.Skills[i].Id == abilityid) then
            return self.Skills[i]
        end
    end
    return nil
end

function Unit:GetItem(entity)
    for i = 1, #self.Items do
        if (self.Items[i].Entity == entity) then
            return self.Items[i]
        end
    end
    return nil
end

function Unit:RemoveSkill(abilityid)
    abilityid = GetId(abilityid)
    for i = #self.Skills, 1, -1 do
        if (self.Skills[i].Id == abilityid) then
            UnitRemoveAbility(self.Entity, abilityid)
            self.Skills[i] = nil
            table.remove(self.Skills, i)
            break
        end
    end
end

function Unit:RemoveBuff(name)
    for i = #self.Buffs, 1, -1 do
        if (self.Buffs[i].Name == name) then
            self.Buffs[i]:OnRemove()
            self.Buffs[i] = nil
            table.remove(self.Buffs, i)
            break
        end
    end
end

function Unit:_RemoveItem(entity)
    for i = #self.Items, 1, -1 do
        if (self.Items[i].Entity == entity) then
            self.Items[i]:OnRemove()
            self.Items[i] = nil
            table.remove(self.Items, i)
            break
        end
    end
end

function Unit:RemoveLocomotion()
    if (self.Locomotion ~= nil) then
        self.Locomotion = nil
    end
end

function Unit:DestroyItem(entity)
    self:_RemoveItem(entity)
    RemoveItem(entity)
end

--走AssetsManager.DestroyObject(unit)删除逻辑，不要直接从这删除
--运动中的单位中途死亡也要让运动继续下去，死亡单位5秒后销毁，并释放相关内存
function Unit:Destroy(destroy)
    for i = #self.Buffs, 1, -1 do
        if (self.Buffs[i] ~= nil) then
            self.Buffs[i]:OnRemove()
            table.remove(self.Buffs, i)
        end
    end
    if (self.Effect ~= nil) then
        DestroyEffect(self.Effect)
    end
    if (destroy) then
        --释放内存
        for i = #self.Buffs, 1, -1 do
            self.Buffs[i]:OnRemove()
            self.Buffs[i] = nil
        end
        self.Buffs = nil
        for i = #self.Skills, 1, -1 do
            self.Skills[i]:OnRemove()
            self.Skills[i] = nil
        end
        self.Skills = nil
        for i = #self.Items, 1, -1 do
            self.Items[i]:OnRemove()
            self.Items[i] = nil
        end
        self.Items = nil
        for i = #self.Texts, 1, -1 do
            self.Texts[i] = nil
        end
        self.Texts = nil
        for i = #self.Combs, 1, -1 do
            self.Combs[i] = nil
        end
        self.Combs = nil
        for i = #self.Attribute, 1, -1 do
            self.Attribute[i] = nil
        end
        self.Locomotion = nil
        self.Attribute = nil
        self.Player = nil
        self.Effect = nil
        if (self.Entity ~= nil) then
            RemoveUnit(self.Entity)
        end
        self.Entity = nil
    end
end

function Unit:UpdateSkillCD()
    if (self.Skills ~= nil) then
        for i = #self.Skills, 1, -1 do
            if (self.Skills[i] ~= nil) then
                self.Skills[i]:UpdateCD()
            else
                Game.LogError("丢失Skill")
            end
        end
    end
end

function Unit:Fighting()
    return GameScene.Elapsed - self.LastFightTime <= 2
end

function Unit:X()
    return GetUnitX(self.Entity)
end

function Unit:Y()
    return GetUnitY(self.Entity)
end

function Unit:Z()
    return GetUnitFlyHeight(self.Entity)
end

function Unit:Facing()
    return GetUnitFacing(self.Entity)
end

function Unit:SetPosition(x, y, z)
    SetUnitX(self.Entity, x)
    SetUnitY(self.Entity, y)
    if (z ~= nil) then
        SetUnitFlyHeight(self.Entity, z, 0)
    end
end

function Unit:SetScale(scaleX, scaleY, scaleZ)
    SetUnitScale(self.Entity, scaleX, scaleY, scaleZ)
end

function Unit:SetUnitRotation(zAngle)
    local i = zAngle * 0.7 + 0.5
    if i > 0 then
        SetUnitAnimationByIndex(self.Entity, i)
    else
        SetUnitAnimationByIndex(self.Entity, i + 252)
    end
end

function Unit:SetUnitFacing(facingAngle)
    EXSetUnitFacing(self.Entity, math.deg(facingAngle))
end

function Unit:SetUnitOwner(Player)
    SetUnitOwner(self.Entity, Player, true)
    self.Player = Player
end

function Unit:SetActive(value)
    PauseUnit(self.Entity, value)
end

function Unit:OnLevelUp()
    --成长回蓝
    if (mHeroRegenManaList[self.Id] ~= nil) then
        self.Attribute:add("魔法恢复", mHeroRegenManaList[self.Id][2])
    end
    --成长攻击
    if (self.Primary == "INT") then
        self.Attribute:add("物理攻击", 10)
        self.Attribute:add("魔法上限", 80)
        self.Attribute:add("魔法值", 80)
        self.Attribute:add("攻击速度", 0.01)
    else
        self.Attribute:add("物理攻击", 18)
        self.Attribute:add("魔法上限", 50)
        self.Attribute:add("魔法值", 50)
        self.Attribute:add("攻击速度", 0.025)
    end
    if (self.onLevelUp ~= nil) then
        self.onLevelUp(self)
    end
end

function Unit:OnGameUpdate(dt)
    if (self.Locomotion ~= nil) then
        self.Locomotion:OnGameUpdate(dt)
    end

    if (self.Attribute ~= nil) then
        local regenMana = self.Attribute:get("魔法恢复")
        if (regenMana ~= 0) then
            self.Attribute:add("魔法值", regenMana * dt)
        end

        if (self.ManaType == 1) then
            self.Attribute:add("能量值", 10 * dt)
        end

        if (self:Fighting() == false and self.ManaType == 2) then
            self.Attribute:add("怒气值", -10 * dt)
        end
    end

    if (self.Texts ~= nil and #self.Texts > 0) then
        self.TextDt = self.TextDt - dt
        if (self.TextDt <= 0) then
            self.TextDt = 0.16
            local text = self.Texts[#self.Texts]
            CreateDamageText(text[1], self.Entity, text[2], text[3])
            table.remove(self.Texts, #self.Texts)
            text = nil
        end
    end

    if (self.Skills ~= nil) then
        for i = #self.Skills, 1, -1 do
            if (self.Skills[i] ~= nil) then
                self.Skills[i]:OnGameUpdate(dt)
            else
                Game.LogError("丢失Skill")
            end
        end
    end

    if (self.Buffs ~= nil) then
        for i = #self.Buffs, 1, -1 do
            if (self.Buffs[i] ~= nil) then
                self.Buffs[i]:OnGameUpdate(dt)
            else
                Game.LogError("丢失Buff")
            end
        end
    end
end

--死亡后还会调用的更新
function Unit:OnDyingUpdate(dt)
    if (self.Locomotion ~= nil) then
        self.Locomotion:OnGameUpdate(dt)
    end

    if (self.Texts ~= nil and #self.Texts > 0) then
        self.TextDt = self.TextDt - dt
        if (self.TextDt <= 0) then
            self.TextDt = 0.16
            local text = self.Texts[#self.Texts]
            CreateDamageText(text[1], self.Entity, text[2], text[3])
            table.remove(self.Texts, #self.Texts)
            text = nil
        end
    end
end

function Unit:IterateSkills(call)
    if (self.Skills ~= nil) then
        for i = #self.Skills, 1, -1 do
            if (self.Skills[i] ~= nil) then
                call(self.Skills[i])
            else
                Game.LogError("丢失Skill")
            end
        end
    end
end

function Unit:IterateBuffs(call)
    if (self.Buffs ~= nil) then
        for i = #self.Buffs, 1, -1 do
            if (self.Buffs[i] ~= nil) then
                call(self.Buffs[i])
            else
                Game.LogError("丢失Buff")
            end
        end
    end
end

function Unit:IterateItems(call)
    if (self.Items ~= nil) then
        for i = #self.Items, 1, -1 do
            if (self.Items[i] ~= nil) then
                call(self.Items[i])
            else
                Game.LogError("丢失道具")
            end
        end
    end
end
