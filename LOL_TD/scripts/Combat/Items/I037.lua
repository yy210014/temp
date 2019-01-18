local item = Items["恶魔之书"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", 40)
    unit.Attribute:add("冷却缩减", 0.1)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -40)
    unit.Attribute:add("冷却缩减", -0.1)
end