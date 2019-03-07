local item = Items["杀人书"]
item.Count = 0
item.MaxCount = 1500

function item:OnAdd()
    local unit = self.Owner
    self.Count = Misc.Clamp(GetItemCharges(self.Entity), 0, self.MaxCount)
    unit.Attribute:add("法术攻击", 50 + self.Count / 3)
    self:SetCharges(self.Count)
    if (self.Count == self.MaxCount) then
        unit.Attribute:add("法术伤害加成", 0.3)
    end
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -(50 + self.Count  / 3))
    if (self.Count == self.MaxCount) then
        unit.Attribute:add("法术伤害加成", -0.3)
    end
end

function item:OnKill(dieUnit)
    --每次击杀小怪增加一点能量值，最多累计1500点，每5点能量增加1AD。
    local unit = self.Owner
    self.Count = self.Count + 1
    if (self.Count > self.MaxCount) then
        self.Count = self.MaxCount
        return
    end
    if (self.Count % 3 == 0) then
        unit.Attribute:add("法术攻击", 1)
    end
    self:SetCharges(self.Count)
    unit.Attribute:add("魔法值", 10)
    if (self.Count == self.MaxCount) then
        unit.Attribute:add("法术伤害加成", 0.3)
    end
end