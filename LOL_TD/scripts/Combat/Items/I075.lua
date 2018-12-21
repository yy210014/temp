local item = Items["莫雷洛秘典"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", 200)
    unit.Attribute:add("魔法上限", 600)
    unit.Attribute:add("魔法恢复", 5)
    unit.Attribute:add("冷却缩减", 0.2)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -200)
    unit.Attribute:add("魔法上限", -600)
    unit.Attribute:add("魔法恢复", -5)
    unit.Attribute:add("冷却缩减", -0.2)
end