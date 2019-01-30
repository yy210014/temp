local skill = Skills["正义之怒"]
skill.SkillType = 0
skill.Durs = { 8, 8, 8, 8, 8, 8 } --持续时间

local mDamages1 = { 40, 80, 120, 160, 200, 240 }
local mDamages2 = { 0.25, 0.3, 0.35, 0.4, 0.45, 0.5 }
local mArt = "AZ_UrsaPsionic_E.mdl"
local mRange = 600

function skill:OnCast()
    self.Owner.Attribute:add("攻击范围", 400)
end

function skill:OnRemove()
    self.Owner.Attribute:add("攻击范围", -400)
end

function skill:OnAttack(attactUnit, defUnit)
    local ap = attactUnit.Attribute:get("法术攻击")
    local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
    if GetUnitAbilityLevel(attactUnit.Entity, GetId("B017")) > 0 then
        damage = damage * 2
        DestroyEffect(AddSpecialEffect(mArt, defUnit:X(), defUnit:Y()))
        local ah20 = attactUnit:GetSkill(GetId("AH20"))
        AssetsManager.OverlapCircle(
        defUnit:X(),
        defUnit:Y(),
        mRange,
        function(unit)
            if (unit ~= defUnit) then
                EXUnitDamageTarget(attactUnit, unit, damage, EXDamageType.Magic)
                if (ah20 ~= nil) then
                    unit:AddBuff("圣焰", ah20:GetCurLevel())
                end
            end
        end
        )
    else
        EXUnitDamageTarget(attactUnit, defUnit, damage, EXDamageType.Magic)
    end
end