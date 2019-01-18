local item = Items["切割者"]

setmetatable(Buffs["切割者"], {__index = Buffs["护甲"]})
Buffs["切割者"].values = {-3}
Buffs["切割者"].Durs = {3}
Buffs["切割者"].MaxStack = 5

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 90)
    unit.Attribute:add("冷却缩减", 0.15)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -90)
    unit.Attribute:add("冷却缩减", -0.15)
end

function item:OnAttack(attactUnit, defUnit)
    defUnit:AddBuff("切割者")
end