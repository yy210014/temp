local item = Items["帽子"]
item.LastValue = 0

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", 300)
    unit.Attribute:add("法术伤害加成", 0.3)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -300 - self.LastValue)
    unit.Attribute:add("法术伤害加成", -0.3)
end
