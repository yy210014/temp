local skill = Skills["火柴人"]
skill.Art = "Abilities\\Spells\\NightElf\\FaerieDragonInvis\\FaerieDragon_Invis.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    local x = spellUnit:X()
    local y = spellUnit:Y()
    local facing = spellUnit:Facing()
    local deleteEntity = spellUnit.Entity
    local tempList = {}
    spellUnit:IterateItems(
    function(item)
        tempList[#tempList + 1] = item.Entity
        UnitRemoveItem(spellUnit.Entity, item.Entity)
    end
    )

    local lqfl = spellUnit:GetSkill(GetId("lqfl"))
    local lqflCD = 0
    if (lqfl ~= nil) then
        lqflCD = lqfl:GetCurCd()
    end
    spellUnit.Entity = CreateUnit(spellUnit.Player, GetId("ug01"), x, y, facing)
    RemoveUnit(deleteEntity)
    for i = #tempList, 1, -1 do
        UnitAddItem(spellUnit.Entity, tempList[i])
    end
    tempList = nil
    if GetLocalPlayer() == spellUnit.Player then
        ClearSelection()
        SelectUnit(spellUnit.Entity, true)
    end
    local lqfl = spellUnit:GetSkill(GetId("lqfl"))
    if (lqfl ~= nil) then
        local abilityCode = EXGetUnitAbility(self.Owner.Entity, GetId("lqfl"))
        EXSetAbilityState(abilityCode, ABILITY_STATE_COOLDOWN, lqflCD)
    end

    DestroyEffect(AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest"))
    --    DzSetUnitModel(spellUnit.Entity, self.Art)
end

local skill = Skills["金猪"]
skill.Art = "Abilities\\Spells\\NightElf\\FaerieDragonInvis\\FaerieDragon_Invis.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    local x = spellUnit:X()
    local y = spellUnit:Y()
    local facing = spellUnit:Facing()
    local deleteEntity = spellUnit.Entity
    local tempList = {}
    spellUnit:IterateItems(
    function(item)
        tempList[#tempList + 1] = item.Entity
        UnitRemoveItem(spellUnit.Entity, item.Entity)
    end
    )

    local lqfl = spellUnit:GetSkill(GetId("lqfl"))
    local lqflCD = 0
    if (lqfl ~= nil) then
        lqflCD = lqfl:GetCurCd()
    end
    spellUnit.Entity = CreateUnit(spellUnit.Player, GetId("ug02"), x, y, facing)
    RemoveUnit(deleteEntity)
    for i = #tempList, 1, -1 do
        UnitAddItem(spellUnit.Entity, tempList[i])
    end
    tempList = nil
    if GetLocalPlayer() == spellUnit.Player then
        ClearSelection()
        SelectUnit(spellUnit.Entity, true)
    end
    local lqfl = spellUnit:GetSkill(GetId("lqfl"))
    if (lqfl ~= nil) then
        local abilityCode = EXGetUnitAbility(self.Owner.Entity, GetId("lqfl"))
        EXSetAbilityState(abilityCode, ABILITY_STATE_COOLDOWN, lqflCD)
    end

    DestroyEffect(AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest"))
    --    DzSetUnitModel(spellUnit.Entity, self.Art)
end

local skill = Skills["柯基犬"]
skill.Art = "Abilities\\Spells\\NightElf\\FaerieDragonInvis\\FaerieDragon_Invis.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    local x = spellUnit:X()
    local y = spellUnit:Y()
    local facing = spellUnit:Facing()
    local deleteEntity = spellUnit.Entity
    local tempList = {}
    spellUnit:IterateItems(
    function(item)
        tempList[#tempList + 1] = item.Entity
        UnitRemoveItem(spellUnit.Entity, item.Entity)
    end
    )

    local lqfl = spellUnit:GetSkill(GetId("lqfl"))
    local lqflCD = 0
    if (lqfl ~= nil) then
        lqflCD = lqfl:GetCurCd()
    end
    spellUnit.Entity = CreateUnit(spellUnit.Player, GetId("ug03"), x, y, facing)
    RemoveUnit(deleteEntity)
    for i = #tempList, 1, -1 do
        UnitAddItem(spellUnit.Entity, tempList[i])
    end
    tempList = nil
    if GetLocalPlayer() == spellUnit.Player then
        ClearSelection()
        SelectUnit(spellUnit.Entity, true)
    end
    local lqfl = spellUnit:GetSkill(GetId("lqfl"))
    if (lqfl ~= nil) then
        local abilityCode = EXGetUnitAbility(self.Owner.Entity, GetId("lqfl"))
        EXSetAbilityState(abilityCode, ABILITY_STATE_COOLDOWN, lqflCD)
    end

    DestroyEffect(AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest"))
    --    DzSetUnitModel(spellUnit.Entity, self.Art)
end

local skill = Skills["小萝莉"]
skill.Art = "Abilities\\Spells\\NightElf\\FaerieDragonInvis\\FaerieDragon_Invis.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    local x = spellUnit:X()
    local y = spellUnit:Y()
    local facing = spellUnit:Facing()
    local deleteEntity = spellUnit.Entity
    local tempList = {}
    spellUnit:IterateItems(
    function(item)
        tempList[#tempList + 1] = item.Entity
        UnitRemoveItem(spellUnit.Entity, item.Entity)
    end
    )

    local lqfl = spellUnit:GetSkill(GetId("lqfl"))
    local lqflCD = 0
    if (lqfl ~= nil) then
        lqflCD = lqfl:GetCurCd()
    end
    spellUnit.Entity = CreateUnit(spellUnit.Player, GetId("ug04"), x, y, facing)
    RemoveUnit(deleteEntity)
    for i = #tempList, 1, -1 do
        UnitAddItem(spellUnit.Entity, tempList[i])
    end
    tempList = nil
    if GetLocalPlayer() == spellUnit.Player then
        ClearSelection()
        SelectUnit(spellUnit.Entity, true)
    end
    local lqfl = spellUnit:GetSkill(GetId("lqfl"))
    if (lqfl ~= nil) then
        local abilityCode = EXGetUnitAbility(self.Owner.Entity, GetId("lqfl"))
        EXSetAbilityState(abilityCode, ABILITY_STATE_COOLDOWN, lqflCD)
    end

    DestroyEffect(AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest"))
    --    DzSetUnitModel(spellUnit.Entity, self.Art)
end