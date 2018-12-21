local item = Items["多兰剑"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 15)
    unit.Attribute:add("攻击速度", 0.1)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -15)
    unit.Attribute:add("攻击速度", -0.1)
end