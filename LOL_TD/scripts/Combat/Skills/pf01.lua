function tihuan(spellUnit, id, art)
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
    spellUnit.Entity = CreateUnit(spellUnit.Player, id, x, y, facing)
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
        local abilityCode = EXGetUnitAbility(spellUnit.Entity, GetId("lqfl"))
        EXSetAbilityState(abilityCode, ABILITY_STATE_COOLDOWN, lqflCD)
    end

    DestroyEffect(AddSpecialEffectTarget(art, spellUnit.Entity, "chest"))
    UnitRemoveAbility(spellUnit.Entity, GetId("xzpf"))
    spellUnit:LearnedSkill(GetId("cb01"))
    spellUnit:LearnedSkill(GetId("cb02"))
    spellUnit:LearnedSkill(GetId("cb03"))
    spellUnit:LearnedSkill(GetId("cb04"))
    --spellUnit:LearnedSkill(GetId("cb05"))
    spellUnit:LearnedSkill(GetId("gh01"))
    spellUnit:LearnedSkill(GetId("gh02"))
    spellUnit:LearnedSkill(GetId("gh03"))
    spellUnit:LearnedSkill(GetId("gh04"))
    --spellUnit:LearnedSkill(GetId("gh05"))
    spellUnit:LearnedSkill(GetId("pf01"))
    spellUnit:LearnedSkill(GetId("pf02"))
    --spellUnit:LearnedSkill(GetId("pf03"))
    spellUnit:LearnedSkill(GetId("pf04"))
end

local skill = Skills["火柴人"]
skill.Art = "Abilities\\Spells\\NightElf\\FaerieDragonInvis\\FaerieDragon_Invis.mdl"
function skill:OnCast()
    tihuan(self.Owner, GetId("ug01"), self.Art)
end

skill = Skills["小红帽"]
skill.Art = "Abilities\\Spells\\NightElf\\FaerieDragonInvis\\FaerieDragon_Invis.mdl"
function skill:OnCast()
    tihuan(self.Owner, GetId("ug02"), self.Art)
    self.Owner:AddSkill("sp10")
end

skill = Skills["潮汐"]
skill.Art = "Abilities\\Spells\\NightElf\\FaerieDragonInvis\\FaerieDragon_Invis.mdl"
function skill:OnCast()
    tihuan(self.Owner, GetId("ug03"), self.Art)
    self.Owner:AddSkill("sp10")
end

skill = Skills["小萝莉"]
skill.Art = "Abilities\\Spells\\NightElf\\FaerieDragonInvis\\FaerieDragon_Invis.mdl"
function skill:OnCast()
    tihuan(self.Owner, GetId("ug04"), self.Art)
    self.Owner:AddSkill("sp11")
end

function tihuanHero(spellUnit, id, art)
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
    spellUnit.Entity = CreateUnit(spellUnit.Player, id, x, y, facing)
    RemoveUnit(deleteEntity)
    for i = #tempList, 1, -1 do
        UnitAddItem(spellUnit.Entity, tempList[i])
    end
    tempList = nil
    if GetLocalPlayer() == spellUnit.Player then
        ClearSelection()
        SelectUnit(spellUnit.Entity, true)
    end
    DestroyEffect(AddSpecialEffectTarget(art, spellUnit.Entity, "chest"))
    AddComb(spellUnit)
    IssueImmediateOrder(spellUnit.Entity, "manashieldon")
end

skill = Skills["冰雪女王"]
function skill:OnCast()
    local unit = self.Owner
    --tihuanHero(unit, GetId("UP25"), self.Art)
    --DzSetUnitModel(unit.Entity, "juese8.mdl")
    UnitRemoveAbility(unit.Entity, GetId("H25p"))
    --UnitAddAbility(unit.Entity, GetId("pfX5"))
    unit.Attribute:add("暴击伤害", 0.1)
    unit.Attribute:add("物理攻击加成", 25)
    unit.Attribute:add("魔法恢复", 3)
end