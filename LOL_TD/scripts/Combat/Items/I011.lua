local item = Items["暴风大剑"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 60)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -60)
end