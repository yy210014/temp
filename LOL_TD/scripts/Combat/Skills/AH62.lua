local skill = Skills["能量爆裂"]
skill.SkillType = 1
local mDamages1 = { 400, 800, 1200, 1600, 2000, 2400 }
local mDamages2 = { 3, 4, 5, 6, 7, 8 }
--local mArt = "blackhole.mdl"
local mArt = "Blind Aura.mdl"
local mArt2 = "ShadowSlam(Normal Size).mdl"


function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit = GetJ_EnemyUnits(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("能量爆裂-丢失单位")
        return
    end

    --创建运动马甲
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    dummy.Effect = AddSpecialEffectTarget(mArt, dummy.Entity, "origin")
    local angle = AngleBetweenPoint(spellTargetUnit:X(), dummy:X(), spellTargetUnit:Y(), dummy:Y())
    dummy:SetUnitFacing(angle)
    SetUnitFlyHeight(dummy.Entity, 60, 0)
    dummy.Owner = spellUnit
    dummy.Target = spellTargetUnit
    dummy.Skill = self
    --创建运动
    local loc = dummy:AddLocomotion("冲锋")
    if (loc ~= nil) then
        loc:Start(spellTargetUnit, 16, self.OnPathEnd)
    end
end

skill.OnPathEnd = function(dummy)
    --伤害
    local owner = dummy.Owner
    local spellTargetUnit = dummy.Target
    if (spellTargetUnit == nil or spellTargetUnit.Entity == nil) then
        AssetsManager.RemoveObject(dummy)
        return
    end
    local self = dummy.Skill
    local ap = owner.Attribute:get("法术攻击")
    local damage = mDamages1[self:GetCurLevel()] + (ap * mDamages2[self:GetCurLevel()])
    local comb = owner:GetComb("小法师-大圣杯")
    if (comb ~= nil and comb.Enable) then
        damage = damage + damage * 0.5
    end
    DestroyEffect(AddSpecialEffectTarget(mArt2, spellTargetUnit.Entity, "origin"))
    EXUnitDamageTarget(owner, spellTargetUnit, damage, EXAbilityType.Magic_Ability)
    AssetsManager.RemoveObject(dummy)
end