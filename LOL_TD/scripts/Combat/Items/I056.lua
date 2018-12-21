local item = Items["幻影之舞"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", 0.45)
    unit.Attribute:add("暴击", 0.35)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", -0.45)
    unit.Attribute:add("暴击", -0.35)
end