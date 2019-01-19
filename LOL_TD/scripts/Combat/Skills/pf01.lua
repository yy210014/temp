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
    spellUnit.Entity = CreateUnit(spellUnit.Player, GetId("ug01"), x, y, facing)
    RemoveUnit(deleteEntity)
    for i = 1, #tempList do
        UnitAddItem(spellUnit.Entity, tempList[i])
    end
    tempList = nil
    if GetLocalPlayer() == spellUnit.Player then
        ClearSelection()
        SelectUnit(spellUnit.Entity, true)
    end
    DestroyEffect(AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest"))
    --    DzSetUnitModel(spellUnit.Entity, self.Art)
end