--通用buff，不叠加，相同buff会覆盖,需要先继承在用则可以叠加
local buff = Buffs["禁锢"]
buff.Durs = {1}
buff.Art = "AZ_MGN_Q2.mdl"

function buff:OnAdd()
    local unit = self.Owner
    self.Effect = AddSpecialEffectTarget(self.Art, unit.Entity, "origin")
    PauseUnit(unit.Entity, true)
    self.CurAction = self.Action
end

function buff:OnRemove()
    if (self.Effect ~= nil) then
        DestroyEffect(self.Effect)
    end
    self.CurAction = nil
    PauseUnit(self.Owner.Entity, false)
end

buff.Action = function(self, dt)
    if IsUnitPaused(self.Owner.Entity) == false then
        PauseUnit(self.Owner.Entity, true)
    end
end
