local skill = Skills["能量爆裂"]
skill.SkillType = 1
local mDamages1 = {400, 800, 1200, 1600, 2000, 2400}
local mDamages2 = {2, 2.4, 2.8, 3.2, 3.6, 4}
local mArt = "blackhole.mdl"

function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit =  GetJ_EnemyUnits(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("能量爆裂-丢失单位")
        return
    end

    --创建运动马甲
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    dummy.Effect = AddSpecialEffectTarget(mArt, dummy.Entity, "origin")
    local angle = AngleBetweenPoint(dummy:X(), spellTargetUnit:X(), dummy:Y(), spellTargetUnit:Y())
    dummy:SetUnitFacing(angle)
    dummy.Owner = spellUnit
    dummy.Target = spellTargetUnit
    dummy.Skill = self
    --创建运动
    local loc = dummy:AddLocomotion("冲锋")
    if (loc ~= nil) then
        loc:Start(spellTargetUnit, 10, self.OnPathEnd)
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
    EXUnitDamageTarget(owner, spellTargetUnit, damage, EXDamageType.Magic)
    AssetsManager.RemoveObject(dummy)
end
