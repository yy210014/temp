
skill = Skills["红炎翅膀"]
skill.Art= "zscb.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.cbEffect ~= nil) then
        DestroyEffect(spellUnit.cbEffect)
    end
    spellUnit.cbEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest")
end

local skill = Skills["暗紫翅膀"]
skill.Art = "cb.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.cbEffect ~= nil) then
        DestroyEffect(spellUnit.cbEffect)
    end
    spellUnit.cbEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest")
end