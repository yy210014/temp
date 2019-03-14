local skill = Skills["红buff"]

setmetatable(Buffs["红buff减速"], { __index = Buffs["移速"] })
Buffs["红buff减速"].values = {-0.3 }
Buffs["红buff减速"].Durs = { 3 }

setmetatable(Buffs["红buff灼烧"], { __index = Buffs["灼烧"] })
local buff = Buffs["红buff灼烧"]
buff.Interval = 1
--buff.Art = "Abilities\\Spells\\Other\\BreathOfFire\\BreathOfFireDamage.mdl"
buff.values = { 0 }
buff.Durs = { 3 }
buff.MaxStack = 1

function buff.Action(self, dt)
    self.IntervalDt = self.IntervalDt - dt
    if (self.IntervalDt <= 0) then
        self.IntervalDt = self.Interval

        local owner = self.Owner
        local attactUnit = self.AttactUnit
        local damage = 30 * GetUnitLevel(owner.Entity)
        EXUnitDamageTarget(attactUnit, self.Owner, damage, EXAbilityType.Real)
    end
end