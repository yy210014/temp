local item = Items["魔宗之刃"]
item.Count = 0
item.LastValue = 0
local mMaxCount = 1500

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("魔法恢复", 4)
    unit.Attribute:add("物理攻击加成", 75)
    unit.Attribute:add("魔法上限", 600)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("魔法恢复", -4)
    unit.Attribute:add("物理攻击加成", -75 - self.LastValue)
    unit.Attribute:add("魔法上限", -600 - self.Count)
end

function item:OnAttack(attactUnit, defUnit)
    self:AddCount(attactUnit)
end

function item:AddCount(unit)
    if (self.Count == mMaxCount) then
        return
    end
    self.Count = self.Count + 4
    if (self.Count > mMaxCount) then
        unit.Attribute:add("魔法上限", self.Count - mMaxCount)
        self.Count = mMaxCount
    else
        unit.Attribute:add("魔法上限", 4)
    end
    SetItemCharges(self.Entity, self.Count)
    if (self.Count >= mMaxCount) then
        RemoveItem(self.Entity)
        local newItem = CreateItem(GetId("I048"), unit:X(), unit:Y())
        UnitAddItem(unit.Entity, newItem)
    end
end

function item:OnRefresh()
    --提供最大魔法值2%的攻击力
    local unit = self.Owner
    unit.Attribute:add("魔法上限", -self.Count)
    self.Count = Clamp(GetItemCharges(self.Entity), 0, mMaxCount)
    unit.Attribute:add("魔法上限", self.Count)
    unit.Attribute:add("物理攻击加成", -self.LastValue)
    self.LastValue = unit.Attribute:get("魔法上限") * 0.02
    unit.Attribute:add("物理攻击加成", self.LastValue)
end