local item = Items["魔宗"]
item.Count = 0
item.LastValue = 0
local mMaxCount = 1500

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 75)
    unit.Attribute:add("魔法恢复", 2)
    self.Count = Clamp(GetItemCharges(self.Entity), 0, mMaxCount)
    unit.Attribute:add("魔法上限", 600 + self.Count)
    self:SetCharges(self.Count)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -75 - self.LastValue)
    unit.Attribute:add("魔法恢复", -2)
    unit.Attribute:add("魔法上限", -(600 + self.Count))
end

function item:OnAttack(attactUnit, defUnit)
    self:AddCount(attactUnit)
end

function item:OnCast()
    self:AddCount(self.Owner)
end

function item:AddCount(unit)
    self.Count = Clamp(self.Count + 4, 0, mMaxCount)
    unit.Attribute:add("魔法上限", 4)
    self:SetCharges(self.Count)
    if (self.Count >= mMaxCount) then
        RemoveItem(self.Entity)
        local newItem = CreateItem(GetId("I048"), unit:X(), unit:Y())
        UnitAddItem(unit.Entity, newItem)
    end
end

function item:OnRefresh()
    --提供最大魔法值2%的攻击力
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -self.LastValue)
    self.LastValue = unit.Attribute:get("魔法上限") * 0.02
    unit.Attribute:add("物理攻击加成", self.LastValue)
end
