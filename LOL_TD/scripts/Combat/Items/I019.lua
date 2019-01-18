local item = Items["锯齿匕首"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 40)
    unit.Attribute:add("物理穿透", 0.05)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -40)
    unit.Attribute:add("物理穿透", -0.05)
end