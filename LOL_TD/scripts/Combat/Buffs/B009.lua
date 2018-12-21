local buff = Buffs["耀光"]
buff.Durs = {2, 2, 2, 2, 2, 2}

function buff:OnAdd()
    local unit = self.Owner
    self.Effect =
        AddSpecialEffectTarget("Abilities\\Spells\\Orc\\Bloodlust\\BloodlustTarget.mdl", unit.Entity, "hand,right")
end

function buff:OnRemove()
    if (self.Effect ~= nil) then
        DestroyEffect(self.Effect)
    end
end
