local item = Items["黄叉"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", 0.25)
    unit.Attribute:add("暴击", 0.1)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", -0.25)
    unit.Attribute:add("暴击", -0.1)
end