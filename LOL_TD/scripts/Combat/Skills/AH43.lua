local skill = Skills["万箭齐发"]
skill.SkillType = 2
local mArt = "Abilities\\Weapons\\LichMissile\\LichMissile.mdl"
local mArt1 = "AZModel\\AZ_PotM(1)_R2.mdl"
local mArt2 = "AZ_PotM(1)_R1_Misslie.mdl"
local mArt3 = "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl"
local mSpeed = 15
local mMaxDistance = 1200
local mDamages1 = { 200, 400, 600, 800, 1000, 1200 }
local mDamages2 = { 1, 1.1, 1.2, 1.3, 1.4, 1.5 }

function skill:OnCast()
    local spellUnit = self.Owner
    local dummy, locom, angle
    angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    for i = 1, 9 do
        dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
        dummy.Effect = AddSpecialEffectTarget(mArt1, dummy.Entity, "origin")
        SetUnitFlyHeight(dummy.Entity, 50, 0)
        dummy.Owner = spellUnit
        dummy.Skill = self
        locom = dummy:AddLocomotion("冲锋")
        locom:Start2(angle + (-40 + 8 * i), mSpeed, mMaxDistance, self.OnPathEnd, self.OnPathUpdate)
    end
end

skill.OnPathUpdate = function(dummy)
    local owner = dummy.Owner
    local self = dummy.Skill
    --伤害
    local ad = owner.Attribute:get("物理攻击") + owner.Attribute:get("物理攻击加成")
    local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
    AssetsManager.OverlapCircle(
    dummy:X(),
    dummy:Y(),
    100,
    function(unit)
        --特效
        DestroyEffect(AddSpecialEffectTarget(mArt3, unit.Entity, "chest"))
        EXUnitDamageTarget(owner, unit, damage, EXDamageType.Physics)
        dummy.Locomotion:PathEnded()
        return
    end
    )
end

skill.OnPathEnd = function(dummy)
    AssetsManager.RemoveObject(dummy)
end