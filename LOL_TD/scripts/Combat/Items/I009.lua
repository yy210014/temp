local item = Items["增幅法典"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", 35)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -35)
end