Buff = {}
Buff.__index = Buff

local dbg = require 'jass.debug'
local gchash = 0

function Buff:New(owner, name, level)
    local newbuff = {}
    
    gchash = gchash + 1
    dbg.gchash(newbuff, gchash)
    newbuff.gchash = gchash

    setmetatable(newbuff, {__index = Buffs[name]})
    newbuff.Owner = owner
    newbuff.Level = level
    return newbuff
end

function Buff:OnAdd()
end

function Buff:OnRemove()
end

function Buff:OnAttack(attactUnit, defUnit)
end

function Buff:OnHurt(attactUnit, defUnit)
end

function Buff:OnGameUpdate(dt)
    local dur = self.Durs[self.Level]
    if (dur <= 0) then
        return
    end
    if (GetUnitAbilityLevel(self.Owner.Entity, GetId("B009")) > 0) then
        dur = dur * 0.5
    end
    if (self.CurAction ~= nil) then
        self.CurAction(self, dt)
    end
    self.TimeDt = self.TimeDt + dt
    if (self.TimeDt > dur) then
        self.Owner:RemoveBuff(self.Name)
    end
end

function Buff:AddStack()
    if (self.Stack < self.MaxStack) then
        self.Stack = self.Stack + 1
        self:OnRemove()
        self:OnAdd()
    end
    self.TimeDt = 0
end

Buffs =
    setmetatable(
    {},
    {
        __index = function(self, name)
            self[name] = {}
            setmetatable(self[name], {__index = Buff})
            self[name].Name = name
            self[name].Effect = nil
            self[name].Attach = "origin"
            self[name].Durs = {-1}
            self[name].TimeDt = 0
            self[name].Cover = false
            self[name].Stack = 1
            self[name].MaxStack = 1
            return self[name]
        end
    }
)
