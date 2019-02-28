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

skill = Skills["紫薇光环"]
skill.Effect = nil
skill.Art = "midchildernanohaaura.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.ghEffect ~= nil) then
        DestroyEffect(spellUnit.ghEffect)
    end
    spellUnit.ghEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "origin")
end

skill = Skills["幻天旋地"]
skill.Effect = nil
skill.Art = "fuwen01a.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.ghEffect ~= nil) then
        DestroyEffect(spellUnit.ghEffect)
    end
    spellUnit.ghEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "origin")
end

skill = Skills["凤求凰"]
skill.Effect = nil
skill.Art = "war3mapImported\\RedBird.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.ghEffect ~= nil) then
        DestroyEffect(spellUnit.ghEffect)
    end
    spellUnit.ghEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "origin")
end