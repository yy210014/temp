local skill = Skills["闪现"]
-- 效果 - 施法者
local mCasterArt = "Abilities\\Spells\\NightElf\\Blink\\BlinkCaster.mdl"
-- 效果 - 目标
local mEffectArt = "Abilities\\Spells\\NightElf\\Blink\\BlinkTarget.mdl"
function skill:OnCast()
    local unit = self.Owner
    if (IsTerrainPathable(GetSpellTargetX(), GetSpellTargetY(), PATHING_TYPE_BUILDABILITY)) then
        DisplayTimedTextToPlayer(unit.Player, 0, 0, 5, "|cffEE0000该区域不能进行闪现。|r")
    else
        local x = unit:X()
        local y = unit:Y()
        DestroyEffect(AddSpecialEffect(mCasterArt, unit:X(), unit:Y()))
        SetUnitPosition(unit.Entity, GetSpellTargetX(), GetSpellTargetY())
        if (IsTerrainPathable(unit:X(), unit:Y(), PATHING_TYPE_BUILDABILITY)) then
            SetUnitPosition(unit.Entity, x, y)
            DisplayTimedTextToPlayer(unit.Player, 0, 0, 5, "|cffEE0000该区域不能进行闪现。|r")
        else
            unit:RemoveSkill(self.Id)
            DestroyEffect(AddSpecialEffect(mEffectArt, unit:X(), unit:Y()))
        end
    end
end