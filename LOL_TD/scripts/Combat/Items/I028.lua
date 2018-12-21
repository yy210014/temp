local item = Items["爆裂魔杖"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", 60)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -60)
end