local item = Items["巫术法杖"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", 160)
    unit.Attribute:add("魔法上限", 600)
    unit.Attribute:add("冷却缩减", 0.2)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -160)
    unit.Attribute:add("魔法上限", -600)
    unit.Attribute:add("冷却缩减", -0.2)
end

function item:OnCast()
    local unit = self.Owner
    unit:AddBuff("光耀之剑")
end

function item:OnAttack(attactUnit, defUnit)
    if (attactUnit:ContainBuff("光耀之剑")) then
        local damage =
            attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成") + attactUnit.Attribute:get("法术攻击")
        EXUnitDamageTarget(attactUnit, defUnit, damage, EXDamageType.Magic)
        attactUnit:RemoveBuff("光耀之剑")
    end
end
