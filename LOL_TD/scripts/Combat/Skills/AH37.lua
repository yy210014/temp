local skill = Skills["地狱火炮"]
skill.SkillType = 3
local mDamages1 = {300, 600, 900, 1200, 1500, 1800}
local mDamages2 = {2.0, 2.6, 3.2, 3.8, 4.4, 5.0}
local mDamageRange = 1000

local mArt = "BombMissile.mdl"

local mExplosion = "GoblinTech_R.mdl"
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
        1,
        800,
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
