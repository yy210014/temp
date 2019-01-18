local item = Items["大天使之杖"]
item.LastValue = 0
local mMaxCount = 1500

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("魔法恢复", 2)
    self:SetCharges(Clamp(GetItemCharges(self.Entity), 0, mMaxCount))
    unit.Attribute:add("法术攻击", 150)
    unit.Attribute:add("魔法上限", 600 + self:GetCharges())
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("魔法恢复", -2 - self.LastValue)
    unit.Attribute:add("法术攻击", -150)
    unit.Attribute:add("魔法上限", -(600 + self:GetCharges()))
end

function item:OnCast()
    local unit = self.Owner
    local charges = self:GetCharges() + 8
    if (charges > mMaxCount) then
        return
    end
    unit.Attribute:add("魔法上限", 8)
    self:SetCharges(charges)
    if (self:GetCharges() >= mMaxCount) then
        RemoveItem(self.Entity)
        local newItem = CreateItem(GetId("I067"), unit:X(), unit:Y())
        UnitAddItem(unit.Entity, newItem)
    end
end

function item:OnRefresh()
    --提供最大魔法值2%的攻击力
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -self.LastValue)
    self.LastValue = unit.Attribute:get("魔法上限") * 0.02
    unit.Attribute:add("法术攻击", self.LastValue)
end
