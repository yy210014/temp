local item = Items["蜂刺"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", 0.3)
    unit.Attribute:add("冷却缩减", 0.1)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", -0.3)
    unit.Attribute:add("冷却缩减", -0.1)
end