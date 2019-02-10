local item = Items["炽天使"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("魔法恢复", 2)
    self:SetCharges(Misc.Clamp(GetItemCharges(self.Entity), 0, mMaxCount))
    unit.Attribute:add("法术攻击", 200)
    unit.Attribute:add("魔法上限", 600 + self:GetCharges())
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("魔法恢复", -2)
    unit.Attribute:add("法术攻击", -200)
    unit.Attribute:add("魔法上限", -(600 + self:GetCharges()))
end