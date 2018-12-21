local locomotion = Locomotions["冲锋"]
locomotion.Target = nil
locomotion.Angle = 0
locomotion.Speed = 10
locomotion.MaxDistance = 100

locomotion.OnFoward = function(self, dt)
    local angle = AngleBetweenUnits(self.Owner.Entity, self.Target.Entity)
    local offX = self.Speed * math.cos(angle)
    local offY = self.Speed * math.sin(angle)
    SetUnitX(self.Owner.Entity, self.Owner:X() + offX)
    SetUnitY(self.Owner.Entity, self.Owner:Y() + offY)
    self.Owner:SetUnitFacing(angle)
    if (DistanceBetweenUnits(self.Owner.Entity, self.Target.Entity) < 10) then
        SetUnitPathing(self.Owner.Entity, false)
        self:PathEnded()
    end
end

locomotion.OnFoward2 = function(self, dt)
    local offX = self.Speed * math.cos(self.Angle)
    local offY = self.Speed * math.sin(self.Angle)
    SetUnitX(self.Owner.Entity, self.Owner:X() + offX)
    SetUnitY(self.Owner.Entity, self.Owner:Y() + offY)
    if (DistanceBetweenPoint(self.StartX, self.Owner:X(), self.StartY, self.Owner:Y()) > self.MaxDistance) then
        SetUnitPathing(self.Owner.Entity, false)
        self:PathEnded()
    end
end

function locomotion:Start(...)
    local arg = {...}
    self.Target = arg[1]
    self.Speed = arg[2]
    self.OnPathEnd = arg[3]
    self.OnPathUpdate = arg[4]
    self.CurAction = self.OnFoward
    arg = nil
    return self
end

function locomotion:Start2(...)
    local arg = {...}
    self.Angle = arg[1]
    self.Speed = arg[2]
    self.MaxDistance = arg[3]
    self.OnPathEnd = arg[4]
    self.OnPathUpdate = arg[5]
    self.StartX = self.Owner:X()
    self.StartY = self.Owner:Y()
    self.Owner:SetUnitFacing(self.Angle)
    SetUnitPathing(self.Owner.Entity, true)
    self.CurAction = self.OnFoward2
    arg = nil
    return self
end
