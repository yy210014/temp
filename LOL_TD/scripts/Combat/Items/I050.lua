local item = Items["黑切"]

setmetatable(Buffs["黑切"], {__index = Buffs["护甲"]})
Buffs["黑切"].values = {-3}
Buffs["黑切"].Durs = {3}
Buffs["黑切"].MaxStack = 5

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
    defUnit:AddBuff("黑切")
end