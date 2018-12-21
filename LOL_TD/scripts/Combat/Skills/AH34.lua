local skill = Skills["弹跳炸弹"]
skill.SkillType = 2
local mDamages1 = {150, 300, 450, 600, 750, 900}
local mDamages2 = {0.75, 1, 1.25, 1.5, 1.75, 2}
local mDamageRange = 350
--local mArt = "Abilities\\Weapons\\Mortar\\MortarMissile.mdl"
local mArt = "BombMissile.mdl"
local mExplosion = "Abilities\\Spells\\Other\\Incinerate\\FireLordDeathExplode.mdl"

function skill:OnCast()
    local spellUnit = self.Owner
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    dummy.Effect =AddSpecialEffectTarget(mArt, dummy.Entity, "origin")
    dummy.Owner = self.Owner
    UnitApplyTimedLife(dummy.Entity, "BHwe", 2)
    local locom = dummy:AddLocomotion("跳跃")
    local angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    local dist = DistanceBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    locom:Start(
        angle,
        dist,
        0.5,
        350,
        function(dummy)
            DestroyEffect(AddSpecialEffect(mExplosion, dummy:X(), dummy:Y()))
            local ap = dummy.Owner.Attribute:get("法术攻击")
            local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
            AssetsManager.OverlapCircle(
                dummy:X(),
                dummy:Y(),
                mDamageRange,
                function(unit)
                    EXUnitDamageTarget(self.Owner, unit, damage, EXDamageType.Magic)
                end
            )
            AssetsManager.RemoveObject(dummy)
        end
    )
end
