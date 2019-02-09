--通用buff，不叠加，相同buff会覆盖,需要先继承在用则可以叠加
local buff = Buffs["眩晕"]
buff.Durs = {1}
buff.Art = "Abilities\\Spells\\Human\\Thunderclap\\ThunderclapTarget.mdl"

function buff:OnAdd()
    local unit = self.Owner
    self.Effect = AddSpecialEffectTarget(self.Art, unit.Entity, "overhead")
    EXPauseUnit(unit.Entity, true)
end

function buff:OnRemove()
    if (self.Effect ~= nil) then
        DestroyEffect(self.Effect)
    end
    EXPauseUnit(self.Owner.Entity, false)
end
