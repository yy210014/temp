local item = Items["光耀之剑"]

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
    unit:AddBuff("光耀之剑")
end

function item:OnAttack(attactUnit, defUnit)
    if (attactUnit:ContainBuff("光耀之剑")) then
        local damage = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
        EXUnitDamageTarget(attactUnit, defUnit, damage, EXDamageType.Physics)
        attactUnit:RemoveBuff("光耀之剑")
    end
end
