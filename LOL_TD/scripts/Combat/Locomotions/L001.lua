local locomotion = Locomotions["冲锋"]
locomotion.Target = nil
locomotion.Angle = 0
locomotion.Speed = 10
locomotion.MaxDistance = 100
local mMapArea = Rect(GetCameraBoundMinX(), GetCameraBoundMinY(), GetCameraBoundMaxX(), GetCameraBoundMaxY())

locomotion.OnFoward = function(self, dt)
    if (self.Target == nil or self.Target.Entity == nil) then
        self:PathEnded()
        return
    end
    local owner = self.Owner
    local angle = AngleBetweenUnits(owner.Entity, self.Target.Entity)
    local offX = self.Speed * math.cos(math.rad(angle))
    local offY = self.Speed * math.sin(math.rad(angle))
    SetUnitX(owner.Entity, owner:X() + offX)
    SetUnitY(owner.Entity, owner:Y() + offY)
    owner:SetUnitFacing(angle)
    if (DistanceBetweenUnits(owner.Entity, self.Target.Entity) < 10) then
        SetUnitPathing(owner.Entity, false)
        self:PathEnded()
    end
end

locomotion.OnFoward2 = function(self, dt)
    local owner = self.Owner
    if (RectContainsUnit(mMapArea, owner.Entity) == false) then
        self:PathEnded()
        return
    end


    local accDt = 0
    if (self.AccDur > 0) then
        accDt = self.AccDur < dt and self.AccDur or dt
        self.AccDur = Misc.Clamp(self.AccDur - dt, 0, self.AccDur)
    elseif (self.AccDur <= -1) then
        accDt = dt
    end
    self.Speed = self.Speed + self.Acc * accDt

    local offX = self.Speed * math.cos(math.rad(self.Angle))
    local offY = self.Speed * math.sin(math.rad(self.Angle))
    SetUnitX(owner.Entity, owner:X() + offX)
    SetUnitY(owner.Entity, owner:Y() + offY)

    local angle = AngleBetweenPoint(owner:X(), owner:X() + offX, owner:Y(), owner:Y() + offY)
    -- 自身旋转
    if (self.RotSpd ~= 0) then
        local angDelta = self.RotSpd * dt
        owner:SetUnitFacing(owner:Facing() + angDelta)
    else
        owner:SetUnitFacing(angle)
    end

    if (DistanceBetweenPoint(self.StartX, owner:X(), self.StartY, owner:Y()) > self.MaxDistance) then
        SetUnitPathing(owner.Entity, false)
        self:PathEnded()
    end
end

function locomotion:Start(...)
    local arg = { ... }
    self.Target = arg[1]
    self.Speed = arg[2]
    self.OnPathEnd = arg[3]
    self.OnPathUpdate = arg[4]
    self.CurAction = self.OnFoward
    arg = nil
    return self
end

function locomotion:Start2(...)
    local arg = { ... }
    self.Angle = arg[1]
    self.Speed = arg[2]
    self.MaxDistance = arg[3]
    self.OnPathEnd = arg[4]
    self.OnPathUpdate = arg[5]
    self.Acc = arg[6] or 0
    self.AccDur = arg[7] or -1
    self.RotSpd = arg[8] or 0
    self.StartX = self.Owner:X()
    self.StartY = self.Owner:Y()
    self.Owner:SetUnitFacing(self.Angle)
    SetUnitPathing(self.Owner.Entity, true)
    self.CurAction = self.OnFoward2
    arg = nil
    return self
end