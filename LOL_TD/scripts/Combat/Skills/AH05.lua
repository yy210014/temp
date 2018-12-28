local skill = Skills["战阵律动"]
local mDamages1 = {50, 60, 70, 80, 100, 120}
local mDamages2 = {0.2, 0.3, 0.4, 0.6, 0.8, 1}
local mArt = "AZ_impact01.mdl"

local buff = Buffs["战阵律动"]
buff.Durs = {2, 2, 2, 2, 2, 2}

function skill:OnCast()
end

function skill:OnBeginAttack(attactUnit, defUnit)
    if
        (IsUnitAlly(attactUnit.Entity, GetOwningPlayer(defUnit.Entity)) == false and
            defUnit:ContainBuff("战阵律动") == false)
     then
    --SetUnitAnimation(attactUnit.Entity, "attack2")
    end
end

function skill:OnAttack(attactUnit, defUnit)
    if
        (IsUnitAlly(attactUnit.Entity, GetOwningPlayer(defUnit.Entity)) == false and
            defUnit:ContainBuff("战阵律动") == false)
     then
        DestroyEffect(AddSpecialEffectTarget(mArt, defUnit.Entity, "chest"))
        defUnit:AddBuff("战阵律动")
        local ad = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
        local damage = mDamages1[self:GetCurLevel()] + (ad * mDamages2[self:GetCurLevel()])
        EXUnitDamageTarget(attactUnit, defUnit, damage, EXDamageType.Physics)
    end
end
