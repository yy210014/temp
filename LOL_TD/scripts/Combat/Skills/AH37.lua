local skill = Skills["地狱火炮"]
skill.SkillType = 3
local mDamages1 = { 300, 600, 900, 1200, 1500, 1800 }
local mDamages2 = { 2, 2.6, 3.2, 3.8, 4.4, 5 }
local mDamageRange = 1000

local mArt = "BombMissile.mdl"

local mExplosion = "GoblinTech_R.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    dummy.Name = "地狱火炮-万能马甲"
    dummy.Effect = AddSpecialEffectTarget(mArt, dummy.Entity, "origin")
    dummy.Owner = self.Owner
    dummy.Skill = self
    local locom = dummy:AddLocomotion("跳跃")
    local angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    local dist = DistanceBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    locom:Start(angle, dist, 1, 800, self.OnPathEnd)
end


skill.OnPathEnd = function(dummy)
    local owner = dummy.Owner
    local self = dummy.Skill
    local ap = owner.Attribute:get("法术攻击")
    local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
    local comb = owner:GetComb("炸弹人-帽子")
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