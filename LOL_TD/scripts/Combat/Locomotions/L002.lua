local locomotion = Locomotions["击飞"]
locomotion.Target = nil
locomotion.Duration = 1
locomotion.InitHigh = 0
locomotion.High = 100
locomotion.TimeDt = 0
local mArt = "Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageDeathCaster.mdl"

locomotion.OnUp = function(self, dt)
    if (self.Target == nil or self.Target.Entity == nil) then
        self:PathEnded()
        return
    end
    self.TimeDt = self.TimeDt + dt
    local targetUnit = self.Target.Entity
    local h = Lerp(self.InitHigh, self.InitHigh + self.High, self.TimeDt / self.Duration)
    SetUnitFlyHeight(targetUnit, h, 0)
    if (h > self.InitHigh + self.High) then
        self.TimeDt = 0
        self.CurAction = self.OnDown
    end
end

locomotion.OnDown = function(self, dt)
    if (self.Target == nil or self.Target.Entity == nil) then
        self:PathEnded()
        return
    end
    self.TimeDt = self.TimeDt + dt
    local targetUnit = self.Target.Entity
    local h = Lerp(self.Target:Z(), self.InitHigh, self.TimeDt / self.Duration * 0.5)
    SetUnitFlyHeight(targetUnit, h, 0)
    if (h <= self.InitHigh) then
        PauseUnit(targetUnit, false)
        self:PathEnded()
    end
end

function locomotion:Start(...)
    local arg = { ... }
    self.Target = arg[1]
    self.Duration = arg[2]
    self.High = arg[3]
    self.OnPathEnd = arg[4]

    local targetUnit = self.Target.Entity
    UnitAddAbility(targetUnit, GetId("Arav"))
    UnitRemoveAbility(targetUnit, GetId("Arav"))
    PauseUnit(targetUnit, true)
    DestroyEffect(AddSpecialEffect(mArt, self.Target:X(), self.Target:Y()))
    self.TimeDt = 0
    self.InitHigh = self.Target:Z()
    self.CurAction = self.OnUp
    arg = nil
    return self
end