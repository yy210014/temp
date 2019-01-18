local item = Items["蓝宝石"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("魔法上限", 150)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("魔法上限", -150)
end