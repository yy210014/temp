--通用buff，不叠加，相同buff会覆盖,需要先继承在用则可以叠加
local buff = Buffs["灼烧"]
buff.Art = "Abilities\\Spells\\Other\\BreathOfFire\\BreathOfFireDamage.mdl"
buff.Interval = 1
buff.IntervalDt = 0
buff.MaxStack = 100
buff.Durs = { 3, 3, 3, 3, 3, 3 }
buff.values = { 0, 0, 0, 0, 0, 0 }

function buff:OnAdd()
    self.CurAction = self.Action
    self.Effect = AddSpecialEffectTarget(self.Art, self.Owner.Entity, "chest")
end

function buff.Action(self, dt)
    self.IntervalDt = self.IntervalDt - dt
    if (self.IntervalDt <= 0) then
        self.IntervalDt = self.Interval
        EXUnitDamageTarget(self.AttactUnit, self.Owner, self.values[self.Level] * self.Stack, EXAbilityType.Real)
    end
end

function buff:OnRemove()
    self.CurAction = nil
    if (self.Effect ~= nil) then
        DestroyEffect(self.Effect)
    end
end