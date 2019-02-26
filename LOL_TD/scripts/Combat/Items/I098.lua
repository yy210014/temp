local item = Items["面具"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", 60)
    unit.Attribute:add("法术穿透", 0.1)
    unit.Attribute:add("魔法上限", 200)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -60)
    unit.Attribute:add("法术穿透", -0.1)
    unit.Attribute:add("魔法上限", -200)
end
