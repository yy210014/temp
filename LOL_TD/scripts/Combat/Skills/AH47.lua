local skill = Skills["大宝剑"]
skill.SkillType = 1
local mDamages1 = {150, 300, 450, 600, 750, 900}
local mDamages2 = {0.1, 0.14, 0.18, 0.22, 0.26, 0.3}
local mArt = "Garen_R.mdl"

function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit = GetJ_EnemyUnits(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("大宝剑-丢失单位")
        return
    end

    DestroyEffect(AddSpecialEffect(mArt, spellTargetUnit:X(), spellTargetUnit:Y()))
    local lostLift = spellTargetUnit.Attribute:get("生命上限") - spellTargetUnit.Attribute:get("生命")
    local damage = mDamages1[self:GetCurLevel()] + mDamages2[self:GetCurLevel()] * lostLift
    EXUnitDamageTarget(spellUnit, spellTargetUnit, damage, EXAbilityType.Real_Ability)
end
