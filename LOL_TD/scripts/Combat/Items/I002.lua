local item = Items["多兰戒"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", 25)
    unit.Attribute:add("魔法上限", 100)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -25)
    unit.Attribute:add("魔法上限", -100)
end

function item:OnKill(dieUnit)
    local unit = self.Owner
    unit.Attribute:add("魔法值", 2)
end
