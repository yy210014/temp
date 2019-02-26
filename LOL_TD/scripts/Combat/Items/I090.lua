local item = Items["羊刀"]
item.LastPenetrate = 0

setmetatable(Buffs["羊刀"], {__index = Buffs["攻速"]})
Buffs["羊刀"].values = {0.05}
Buffs["羊刀"].Durs = {2}
Buffs["羊刀"].MaxStack = 6

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 50)
    unit.Attribute:add("法术攻击", 90)
    unit.Attribute:add("攻击速度", 0.3)

    self.LastPenetrate = 0.06 + 0.005 * GetUnitLevel(unit.Entity)
    unit.Attribute:add("物理穿透", self.LastPenetrate)
    unit.Attribute:add("法术穿透", self.LastPenetrate)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -50)
    unit.Attribute:add("法术攻击", -90)
    unit.Attribute:add("攻击速度", -0.3)
    unit.Attribute:add("物理穿透", -self.LastPenetrate)
    unit.Attribute:add("法术穿透", -self.LastPenetrate)
end

function item:OnAttack(attactUnit, defUnit)
    EXUnitDamageTarget(attactUnit, defUnit, 50, EXAbilityType.Magic)
    local buff = attactUnit:AddBuff("羊刀")
    --在满层时，每间隔一次普攻会触发两次攻击特效。
    if (buff.MaxStack == 6) then
    end
end

function item:OnUpgrade()
    local unit = self.Owner
    self.LastPenetrate = self.LastPenetrate + 0.005
    unit.Attribute:add("物理穿透", 0.005)
    unit.Attribute:add("法术穿透", 0.005)
end
