local item = Items["无用大棒"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", 90)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -90)
end