local skill = Skills["战争节拍"]
local mDamages1 = {50, 100, 150, 200, 250, 300}
local mDamages2 = {0.5, 1.0, 1.5, 2.0, 2.5, 3.0}
local mArt = "AZ_impact01.mdl"

local buff = Buffs["战争节拍"]
buff.Durs = {2, 2, 2, 2, 2, 2}

function skill:OnCast()
end

function skill:OnBeginAttack(attactUnit, defUnit)
    if
        (IsUnitAlly(attactUnit.Entity, GetOwningPlayer(defUnit.Entity)) == false and
            defUnit:ContainBuff("战争节拍") == false)
     then
    --SetUnitAnimation(attactUnit.Entity, "attack2")
    end
end

function skill:OnAttack(attactUnit, defUnit)
    if
        (IsUnitAlly(attactUnit.Entity, GetOwningPlayer(defUnit.Entity)) == false and
            defUnit:ContainBuff("战争节拍") == false)
     then
        DestroyEffect(AddSpecialEffectTarget(mArt, defUnit.Entity, "chest"))
        defUnit:AddBuff("战争节拍")
        local ad = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
        local damage = mDamages1[self:GetCurLevel()] + (ad * mDamages2[self:GetCurLevel()])
        EXUnitDamageTarget(attactUnit, defUnit, damage, EXDamageType.Physics)
    end
end
