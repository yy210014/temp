--通用buff，不叠加，相同buff会覆盖,需要先继承在用则可以叠加
local buff = Buffs["出血"]
buff.Art = "Abilities\\Weapons\\Blood\\BloodImpact.mdl"
buff.Interval = 0.2
buff.IntervalDt = 0
buff.MaxStack = 5
buff.Durs = {4, 4, 4, 4, 4, 4}
buff.values = {0, 0, 0, 0, 0, 0}

function buff:OnAdd()
    self.CurAction = self.Action
end

function buff.Action(self, dt)
    self.IntervalDt = self.IntervalDt - dt
    if (self.IntervalDt <= 0) then
        self.IntervalDt = self.Interval
        DestroyEffect(AddSpecialEffectTarget(self.Art, self.Owner.Entity, "chest"))
        EXUnitDamageTarget(
            self.AttactUnit,
            self.Owner,
            self.values[self.Level] * self.Stack,
            EXAbilityType.Physics
        )
    end
end
