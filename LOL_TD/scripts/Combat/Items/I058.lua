local item = Items["飓风"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", 0.35)
    unit.Attribute:add("暴击", 0.25)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", -0.35)
    unit.Attribute:add("暴击", -0.25)
end