local skill = Skills["三重爪击"]
local mDamages = {1, 1.4, 1.8, 2.2, 2.6, 3}
skill.Count = 1

function skill:OnCast()
end

function skill:OnBeginAttack(attactUnit, defUnit)
    if (self.Count > 2) then
        SetUnitAnimation(attactUnit.Entity, "attack slam")
    end
end

function skill:OnAttack(attactUnit, defUnit)
    if (self.Count >= 3) then
        self.Count = 1
        local ad = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
        local damage = ad * mDamages[self:GetCurLevel()]
        DestroyEffect(
            AddSpecialEffectTarget(
                "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",
                defUnit.Entity,
                "chest"
            )
        )
        local loc = defUnit:AddLocomotion("击飞")
        if (loc ~= nil) then
            loc:Start(defUnit, 0.4, 150, nil)
        end
        EXUnitDamageTarget(attactUnit, defUnit, damage, EXDamageType.Physics)
    else
        self.Count = self.Count + 1
    end
end
