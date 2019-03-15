local item = Items["杀人剑"]
item.Count = 0
item.MaxCount = 1500

function item:OnAdd()
    local unit = self.Owner
    self.Count = Misc.Clamp(GetItemCharges(self.Entity), 0, self.MaxCount)
    unit.Attribute:add("物理攻击加成", 30 + self.Count / 3)
    self:SetCharges(self.Count)
    if (self.Count == self.MaxCount) then
        unit.Attribute:add("物理伤害加成", 0.3)
    end
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -(30 + self.Count / 3))
    if (self.Count == self.MaxCount) then
        unit.Attribute:add("物理伤害加成", -0.3)
    end
end

function item:OnKill(dieUnit)
    --每次击杀小怪增加一点能量值，最多累计1500点，每2点能量增加1AD。
    local unit = self.Owner
    self.Count = self.Count + 1
    if (self.Count > self.MaxCount) then
        self.Count = self.MaxCount
        return
    end
    if (self.Count % 3 == 0) then
        unit.Attribute:add("物理攻击加成", 1)
    end
    self:SetCharges(self.Count)
    if (self.Count == self.MaxCount) then
        unit.Attribute:add("物理伤害加成", 0.3)
    end
end