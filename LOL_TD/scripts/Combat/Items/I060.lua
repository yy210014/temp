local item = Items["冰锤"]

setmetatable(Buffs["冰锤"], {__index = Buffs["移速"]})
--Buffs["冰锤"].Art2 = "bilities\\Spells\\Other\\FrostDamage\\FrostDamage.mdl"
--Buffs["冰杖"].AttachPoint = "chest"
Buffs["冰锤"].values = {-0.3}
Buffs["冰锤"].Durs = {2}

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 90)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -90)
end

function item:OnAttack(attactUnit,defUnit)
    defUnit:AddBuff("冰锤")
end