local item = Items["仙女护符"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("魔法恢复", 1)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("魔法恢复", -1)
end