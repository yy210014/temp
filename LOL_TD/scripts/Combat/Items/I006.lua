local item = Items["暴击拳套"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("暴击", 0.05)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("暴击", -0.05)
end