local item = Items["燃烧宝石"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("冷却缩减", 0.1)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("冷却缩减", -0.1)
end