local item = Items["灵活披风"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("暴击", 0.2)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("暴击", -0.2)
end