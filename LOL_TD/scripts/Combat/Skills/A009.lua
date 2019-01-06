local skill = Skills["闪现"]
-- 效果 - 施法者
local mCasterArt = "Abilities\\Spells\\NightElf\\Blink\\BlinkCaster.mdl"
-- 效果 - 目标
local mEffectArt = "Abilities\\Spells\\NightElf\\Blink\\BlinkTarget.mdl"
function skill:OnCast()
    local unit = self.Owner
    DestroyEffect(AddSpecialEffect(mCasterArt, unit:X(), unit:Y()))
    SetUnitPosition(unit.Entity, GetSpellTargetX(), GetSpellTargetY())
    unit:RemoveSkill(self.Id)
    DestroyEffect(AddSpecialEffect(mEffectArt, unit:X(), unit:Y()))
    
end