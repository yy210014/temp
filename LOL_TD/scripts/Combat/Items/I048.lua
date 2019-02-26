local item = Items["魔法切割者"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 120)
    unit.Attribute:add("魔法上限", 2200)
    unit.Attribute:add("魔法恢复", 4)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -120)
    unit.Attribute:add("魔法上限", -2200)
    unit.Attribute:add("魔法恢复", -4)
end

function item:OnAttack(attactUnit, defUnit)
    --每次攻击附带自身当前蓝量5%的物理伤害
    local damage = attactUnit.Attribute:get("魔法值") * 0.1
    EXUnitDamageTarget(attactUnit, defUnit, damage, EXAbilityType.Real)
end
