local item = Items["大轻语"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 100)
    unit.Attribute:add("物理穿透", 0.3)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -100)
    unit.Attribute:add("物理穿透", -0.3)
end