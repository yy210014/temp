local skill = Skills["轻盈之花"]
skill.Art = "XD_GH01.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.ghEffect ~= nil) then
        DestroyEffect(spellUnit.ghEffect)
    end
    spellUnit.ghEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "origin")
end

skill = Skills["五行之轮"]
skill.Effect = nil
skill.Art = "[AKE]war3AKE.com - 2742654800546824576218397.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.ghEffect ~= nil) then
        DestroyEffect(spellUnit.ghEffect)
    end
    spellUnit.ghEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "origin")
end