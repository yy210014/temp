local item = Items["穿甲弓"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 30)
    unit.Attribute:add("物理穿透", 0.15)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -30)
    unit.Attribute:add("物理穿透", -0.15)
end