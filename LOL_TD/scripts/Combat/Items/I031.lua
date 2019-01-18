local item = Items["天使之泪"]
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
    local charges = self:GetCharges() + 2
    if (charges > mMaxCount) then
        return
    end
    unit.Attribute:add("魔法上限", 2)
    self:SetCharges(charges)
end