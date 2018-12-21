local item = Items["十字镐"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 40)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -40)
end