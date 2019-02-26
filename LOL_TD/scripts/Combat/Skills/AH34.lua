local skill = Skills["弹跳炸弹"]
skill.SkillType = 2
local mDamages1 = { 200, 400, 600, 800, 1000, 1200 }
local mDamages2 = { 1, 1.4, 1.8, 2.2, 2.6, 3 }
local mDamageRange = 350
--local mArt = "Abilities\\Weapons\\Mortar\\MortarMissile.mdl"
local mArt = "BombMissile.mdl"
local mExplosion = "Abilities\\Spells\\Other\\Incinerate\\FireLordDeathExplode.mdl"

function skill:OnCast()
    local spellUnit = self.Owner
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    dummy.Name = "弹跳炸弹-万能马甲"
    dummy.Effect = AddSpecialEffectTarget(mArt, dummy.Entity, "origin")
    dummy.Owner = self.Owner
    dummy.Skill = self
    --UnitApplyTimedLife(dummy.Entity, "BHwe", 2)
    local locom = dummy:AddLocomotion("跳跃")
    local angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    local dist = DistanceBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    locom:Start(angle, dist, 0.5, 350, self.OnPathEnd)
end

skill.OnPathEnd = function(dummy)
    local owner = dummy.Owner
    local self = dummy.Skill
    local ap = owner.Attribute:get("法术攻击")
    local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
    local comb = owner:GetComb("炸弹人-大圣杯")
    if (comb ~= nil and comb.Enable) then
        damage = damage + damage * 0.5
    end
    AssetsManager.OverlapCircle(
    dummy:X(),
    dummy:Y(),
    mDamageRange,
    function(unit)
        EXUnitDamageTarget(owner, unit, damage, EXAbilityType.Magic_Ability)
    end
    )
    DestroyEffect(AddSpecialEffect(mExplosion, dummy:X(), dummy:Y()))
    AssetsManager.RemoveObject(dummy)
end