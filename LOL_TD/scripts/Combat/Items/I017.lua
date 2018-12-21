local item = Items["轻语"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 30)
    unit.Attribute:add("物理穿透", 0.1)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -30)
    unit.Attribute:add("物理穿透", -0.1)
end