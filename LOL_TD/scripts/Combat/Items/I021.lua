local item = Items["考尔菲德的战锤"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 40)
    unit.Attribute:add("冷却缩减", 0.1)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -40)
    unit.Attribute:add("冷却缩减", -0.1)
end
