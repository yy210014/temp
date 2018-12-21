local item = Items["女神之泪"]
local mMaxCount = 1500

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("魔法恢复", 2)
    self:SetCharges(Clamp(GetItemCharges(self.Entity), 0, mMaxCount))
    unit.Attribute:add("魔法上限", 500 + self:GetCharges())
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("魔法恢复", -2)
    unit.Attribute:add("魔法上限", -(500 + self:GetCharges()))
end

function item:OnCast()
    local unit = self.Owner
    unit.Attribute:add("魔法上限", 4)
    self:SetCharges(Clamp(self:GetCharges() + 4, 0, mMaxCount))
end
