local item = Items["反曲"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", 0.3)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", -0.3)
end

function item:OnAttack(attactUnit, defUnit)
    --攻击额外附带30点物理伤害
    EXUnitDamageTarget(attactUnit, defUnit, 30, EXAbilityType.Physics)
end
