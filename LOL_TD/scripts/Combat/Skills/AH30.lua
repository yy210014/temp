local skill = Skills["蓄力一击"]
skill.SkillType = 0
skill.Flag = false
local mDamages1 = {80, 150, 200, 260, 320, 400}
local mDamages2 = {0.4, 0.4, 0.4, 0.4, 0.4, 0.4}
local mDamages3 = {0.3, 0.3, 0.3, 0.3, 0.3, 0.3}

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
        local ap = attactUnit.Attribute:get("法术攻击")
        local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]+ ap * mDamages3[self:GetCurLevel()]
        EXUnitDamageTarget(attactUnit, defUnit, damage, EXDamageType.Magic)
    end
end
