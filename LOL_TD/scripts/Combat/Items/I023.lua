local item = Items["小木槌"]

setmetatable(Buffs["小冰锤"], {__index = Buffs["移速"]})
Buffs["小冰锤"].values = {-0.1}
Buffs["小冰锤"].Durs = {2}

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 30)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -30)
end

function item:OnAttack(attactUnit, defUnit)
    --攻击降低目标移速10%
    defUnit:AddBuff("小冰锤")
end
