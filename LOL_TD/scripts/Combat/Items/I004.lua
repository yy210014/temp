local item = Items["短剑"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", 0.15)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", -0.15)
end