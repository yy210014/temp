local item = Items["三相之力"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 45)
    unit.Attribute:add("攻击速度", 0.3)
    unit.Attribute:add("暴击", 0.15)
    unit.Attribute:add("魔法上限", 800)
    unit.Attribute:add("冷却缩减", 0.2)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -45)
    unit.Attribute:add("攻击速度", -0.3)
    unit.Attribute:add("暴击", -0.15)
    unit.Attribute:add("魔法上限", -800)
    unit.Attribute:add("冷却缩减", -0.2)
end

function item:OnCast()
    local unit = self.Owner
    unit:AddBuff("耀光")
end

function item:OnAttack(attactUnit, defUnit)
    defUnit:AddBuff("小冰锤")
    if (attactUnit:ContainBuff("耀光")) then
        local damage = (attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")) * 1.5
        EXUnitDamageTarget(attactUnit, defUnit, damage, EXDamageType.Physics)
        attactUnit:RemoveBuff("耀光")
    end
end
