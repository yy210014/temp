local item = Items["小圣杯"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", 40)
    unit.Attribute:add("魔法恢复", 4)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -40)
    unit.Attribute:add("魔法恢复", -4)
end