Locomotion = {}
Locomotion.__index = Locomotion
Locomotion.Target = nil

function Locomotion:New(owner, name)
    local newLocomotion = {}
    setmetatable(newLocomotion, {__index = Locomotions[name]})
    newLocomotion.Owner = owner
    return newLocomotion
end

function Locomotion:Start(...)
    return self
end

function Locomotion:OnRemove()
    self.CurAction = nil
    self.OnPathUpdate = nil
end

function Locomotion:PathEnded()
    self:OnRemove()
    if (self.OnPathEnd ~= nil) then
        self.OnPathEnd(self.Owner)
        self.OnPathEnd = nil
    end
    --self.Owner:RemoveLocomotion()
    return true
end

function Locomotion:OnGameUpdate(dt)
    if (self.CurAction ~= nil) then
        self.CurAction(self, dt)
        if (self.OnPathUpdate ~= nil) then
            self.OnPathUpdate(self.Owner)
        end
    end
end

Locomotions =
    setmetatable(
    {},
    {
        __index = function(self, name)
            self[name] = {}
            setmetatable(self[name], {__index = Locomotion})
            self[name].Name = name
            return self[name]
        end
    }
)
