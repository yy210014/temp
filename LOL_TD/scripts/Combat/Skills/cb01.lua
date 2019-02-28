
local skill = Skills["红炎翅膀"]
skill.Art= "zscb.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.cbEffect ~= nil) then
        DestroyEffect(spellUnit.cbEffect)
    end
    spellUnit.cbEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest")
end

skill = Skills["暗紫翅膀"]
skill.Art = "cb.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.cbEffect ~= nil) then
        DestroyEffect(spellUnit.cbEffect)
    end
    spellUnit.cbEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest")
end

skill = Skills["炫紫羽翼"]
skill.Art = "a.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.cbEffect ~= nil) then
        DestroyEffect(spellUnit.cbEffect)
    end
    spellUnit.cbEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest")
end

skill = Skills["灵光蝶羽"]
skill.Art = "cb (3).mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.cbEffect ~= nil) then
        DestroyEffect(spellUnit.cbEffect)
    end
    spellUnit.cbEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest")
end

skill = Skills["蔚蓝蝶羽"]
skill.Art = "cb (2).mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.cbEffect ~= nil) then
        DestroyEffect(spellUnit.cbEffect)
    end
    spellUnit.cbEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest")
end