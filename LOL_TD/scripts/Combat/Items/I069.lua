local item = Items["法穿棒"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", 150)
    unit.Attribute:add("法术穿透", 0.25)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -150)
    unit.Attribute:add("法术穿透", -0.25)
end