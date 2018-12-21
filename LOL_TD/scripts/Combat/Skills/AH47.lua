local skill = Skills["德玛西亚正义"]
skill.SkillType = 1
local mDamages1 = {150, 300, 450, 600, 750, 900}
local mDamages2 = {0.2, 0.24, 0.28, 0.32, 0.36, 0.4}
local mArt = "Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl"

function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit = GetJ_Units(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("德玛西亚正义-丢失单位")
        return
    end

    DestroyEffect(AddSpecialEffect(mArt, spellTargetUnit:X(), spellTargetUnit:Y()))
    local lostLift = spellTargetUnit.Attribute:get("生命上限") - spellTargetUnit.Attribute:get("生命")
    local damage = mDamages1[self:GetCurLevel()] + mDamages2[self:GetCurLevel()] * lostLift
    EXUnitDamageTarget(spellUnit, spellTargetUnit, damage, EXDamageType.Real)
end
