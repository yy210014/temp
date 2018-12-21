local skill = Skills["厄运的眷顾"]
local mDamages = {0.5, 0.6, 0.7, 0.8, 0.9, 1}

local buff = Buffs["厄运的眷顾"]

function skill:OnCast()

end

function skill:OnAttack(attactUnit, defUnit)
    if
        (IsUnitAlly(attactUnit.Entity, GetOwningPlayer(defUnit.Entity)) == false and
            defUnit:ContainBuff("厄运的眷顾") == false)
     then
        defUnit:AddBuff("厄运的眷顾")
        local ad = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
        local damage = ad * mDamages[self:GetCurLevel()]
        DestroyEffect(
            AddSpecialEffectTarget(
                "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",
                defUnit.Entity,
                "chest"
            )
        )
        EXUnitDamageTarget(attactUnit, defUnit, damage, EXDamageType.Physics)
    end
end
    