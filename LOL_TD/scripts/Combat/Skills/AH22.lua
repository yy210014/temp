local skill = Skills["正义之怒"]
skill.SkillType = 0

local mDamages1 = {20, 40, 60, 80, 100, 120}
local mDamages2 = {0.15, 0.2, 0.25, 0.3, 0.35, 0.4}

function skill:OnCast()
end

function skill:OnAttack(attactUnit, defUnit)
    local ap = attactUnit.Attribute:get("法术攻击")
    local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
    if (GetUnitTypeId(attactUnit.Entity) ~= GetId("UH13")) then
        damage = damage * 2
    end
    EXUnitDamageTarget(attactUnit, defUnit, damage, EXDamageType.Magic)
end