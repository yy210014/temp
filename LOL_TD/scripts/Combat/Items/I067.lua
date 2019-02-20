local item = Items["炽天使"]
item.LastValue = 0

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("魔法恢复", 8)
    unit.Attribute:add("法术攻击", 200)
    unit.Attribute:add("魔法上限", 2200)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("魔法恢复", -8)
    unit.Attribute:add("法术攻击", -200 - self.LastValue)
    unit.Attribute:add("魔法上限", -2200)
end

function item:OnRefresh()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -self.LastValue)
    self.LastValue = unit.Attribute:get("魔法上限") * 0.02
    unit.Attribute:add("法术攻击", self.LastValue)
end