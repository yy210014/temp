local item = Items["杀人书"]
item.Count = 0
item.MaxCount = 1500

function item:OnAdd()
    local unit = self.Owner
    self.Count = Clamp(GetItemCharges(self.Entity), 0, self.MaxCount)
    unit.Attribute:add("法术攻击", 50 + self.Count / 3)
    self:SetCharges(self.Count)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -(50 + self.Count  / 3))
end

function item:OnKill(dieUnit)
    --每次击杀小怪增加一点能量值，最多累计1500点，每5点能量增加1AD。
    local unit = self.Owner
    self.Count = Clamp(self.Count + 1, 0, self.MaxCount)
    if (self.Count % 3 == 0) then
        unit.Attribute:add("法术攻击", 1)
    end
    self:SetCharges(self.Count)
    unit.Attribute:add("魔法值", 10)
end