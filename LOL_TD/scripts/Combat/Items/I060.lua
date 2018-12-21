local item = Items["大冰锤"]

setmetatable(Buffs["大冰锤"], {__index = Buffs["移速"]})
Buffs["大冰锤"].values = {-0.2}
Buffs["大冰锤"].Durs = {2}

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 90)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -90)
end

function item:OnAttack(attactUnit,defUnit)
    --攻击降低目标移速20%，持续2s
    defUnit:AddBuff("大冰锤")
end