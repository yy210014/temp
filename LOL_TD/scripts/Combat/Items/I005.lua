local item = Items["长剑"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 15)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -15)
end