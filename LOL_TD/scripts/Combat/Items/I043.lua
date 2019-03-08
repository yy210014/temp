local item = Items["无尽利刃"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 200)
    unit.Attribute:add("暴击", 0.25)
    unit.Attribute:add("暴击伤害", 1)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -200)
    unit.Attribute:add("暴击", -0.25)
    unit.Attribute:add("暴击伤害", -1)
end