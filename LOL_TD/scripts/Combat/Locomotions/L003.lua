local locomotion = Locomotions["跳跃"]

locomotion.OnJump = function(self, dt)
    local hero = self.Owner.Entity
    local angle = self.Angle
    local steeps = self.steeps
    local steepsMax = self.steepsMax
    local heightMax = self.High
    local dist = self.dist
    local dheig = self.dheig
    local OriginHeight = self.OriginHeight
    local x = self.X
    local y = self.Y

    local height = 0
    if steeps < steepsMax then
        local x1 = x + steeps * dist * math.cos(angle)
        local y1 = y + steeps * dist * math.sin(angle)
        SetUnitX(hero, x1)
        SetUnitY(hero, y1)
        self.steeps = self.steeps + 1
        height = (-(2 * steeps * dheig - 1) * (2 * steeps * dheig - 1) + 1) * heightMax + OriginHeight
        SetUnitFlyHeight(hero, height, 0)
        SetUnitFacing(hero, angle)
    else
        SetUnitFlyHeight(hero, OriginHeight, 0)
        SetUnitPathing(hero, true)
        PauseUnit(self.Owner.Entity, false)
        self:PathEnded()
    end
end

function locomotion:Start(...)
    local arg = {...}
    self.Angle = arg[1]
    self.MaxDistance = arg[2]
    self.Duration = arg[3]
    self.High = arg[4]
    self.OnPathEnd = arg[5]
    self.OnPathUpdate = arg[6]

    local targetUnit = self.Owner.Entity
    UnitAddAbility(targetUnit, GetId("Arav"))
    UnitRemoveAbility(targetUnit, GetId("Arav"))
    SetUnitPathing(targetUnit, false)
    PauseUnit(targetUnit, true)
    self.X = self.Owner:X()
    self.Y = self.Owner:Y()
    self.OriginHeight = self.Owner:Z()
    self.steepsMax = self.Duration / GameScene.DeltaTime
    self.steeps = 0
    self.dist = self.MaxDistance / self.steepsMax
    self.dheig = 1 / self.steepsMax

    self.CurAction = self.OnJump
    arg = nil
    return self
end
