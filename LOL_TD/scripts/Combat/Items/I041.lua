local item = Items["遗失的篇章"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", 40)
    unit.Attribute:add("魔法上限", 450)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -40)
    unit.Attribute:add("魔法上限", -450)
end

function item:OnUpgrade()
    local unit = self.Owner
    unit.Attribute:add("魔法值", GetUnitState(unit.Entity, UNIT_STATE_MAX_MANA) * 0.2)
end
