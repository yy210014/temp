local item = Items["大轻雨"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 70)
    unit.Attribute:add("物理穿透", 0.4)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -70)
    unit.Attribute:add("物理穿透", -0.4)
end