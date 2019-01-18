local item = Items["神秘雕像"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("冷却缩减", 0.05)
    unit.Attribute:add("魔法恢复", 4)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("冷却缩减", -0.05)
    unit.Attribute:add("魔法恢复", -4)
end