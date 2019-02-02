local item = Items["大天使之杖"]
item.Count = 0
item.LastValue = 0
local mMaxCount = 1500

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("魔法恢复", 8)
    unit.Attribute:add("法术攻击", 150)
    unit.Attribute:add("魔法上限", 600)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("魔法恢复", -8)
    unit.Attribute:add("法术攻击", -150 - self.LastValue)
    unit.Attribute:add("魔法上限", -600 - self.Count)
end

function item:OnCast()
    self:AddCount(self.Owner)
end

function item:AddCount(unit)
    if (self.Count == mMaxCount) then
        return
    end
    self.Count = self.Count + 8
    if (self.Count > mMaxCount) then
        unit.Attribute:add("魔法上限", self.Count - mMaxCount)
        self.Count = mMaxCount
    else
        unit.Attribute:add("魔法上限", 8)
    end
    SetItemCharges(self.Entity, self.Count)
    if (self.Count >= mMaxCount) then
        --创建炽天使
    end
end

function item:OnRefresh()
    --提供最大魔法值2%的攻击力
    local unit = self.Owner
    unit.Attribute:add("魔法上限", -self.Count)
    self.Count = Clamp(GetItemCharges(self.Entity), 0, mMaxCount)
    unit.Attribute:add("魔法上限", self.Count)
    unit.Attribute:add("法术攻击", -self.LastValue)
    self.LastValue = unit.Attribute:get("魔法上限") * 0.02
    unit.Attribute:add("法术攻击", self.LastValue)
end