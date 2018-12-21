local skill = Skills["致命打击"]
skill.SkillType = 0
skill.Flag = false
local mDamages1 = {50, 150, 250, 350, 450, 550}
local mDamages2 = {1.3, 1.4, 1.5, 1.6, 1.7, 1.8}

function skill:OnCast()
    self.Flag = true
end

function skill:OnBeginAttack(attactUnit, defUnit)
    if (self.Flag) then
        SetUnitAnimation(attactUnit.Entity, "attack slam")
    end
end

function skill:OnAttack(attactUnit, defUnit)
    if (self.Flag) then
        self.Flag = false
        local ad = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
        local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
        EXUnitDamageTarget(attactUnit, defUnit, damage, EXDamageType.Physics)
    end
end
