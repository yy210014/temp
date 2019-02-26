local item = Items["耀光之剑"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("魔法上限", 600)
    unit.Attribute:add("冷却缩减", 0.1)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("魔法上限", -600)
    unit.Attribute:add("冷却缩减", -0.1)
end

function item:OnCast()
    local unit = self.Owner
    unit:AddBuff("耀光之剑")
end

function item:OnAttack(attactUnit, defUnit)
    if (attactUnit:ContainBuff("耀光之剑")) then
        local damage = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
        EXUnitDamageTarget(attactUnit, defUnit, damage, EXAbilityType.Physics)
        attactUnit:RemoveBuff("耀光之剑")
    end
end
