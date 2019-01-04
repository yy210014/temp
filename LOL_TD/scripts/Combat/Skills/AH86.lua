local skill = Skills["智慧时光"]
function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit = GetJ_PlayerUnits(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("智慧时光-丢失单位")
        return
    end
    if (GetUnitLevel(spellTargetUnit.Entity) < 18 or spellTargetUnit.CombEnableCount >= 3) then
        SetHeroLevel(spellTargetUnit.Entity, GetHeroLevel(spellTargetUnit.Entity) + 1, true)
    end
end
Ubertip = "选择一个友军单位使其提升1级。|nCD240s。消耗200点蓝量"