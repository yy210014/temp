local item = Items["纳什之牙"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", 0.35)
    unit.Attribute:add("法术攻击", 80)
    unit.Attribute:add("冷却缩减", 0.2)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", -0.35)
    unit.Attribute:add("法术攻击", -80)
    unit.Attribute:add("冷却缩减", -0.2)
end

function item:OnAttack(attactUnit, defUnit)
    local ap = attactUnit.Attribute:get("法术攻击")
    local damage = 50 + ap * 0.2
    EXUnitDamageTarget(attactUnit, defUnit, damage, EXAbilityType.Magic)
end
