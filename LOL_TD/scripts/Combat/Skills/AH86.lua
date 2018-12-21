local skill = Skills["智慧时光"]
function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit = GetJ_Units(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("智慧时光-丢失单位")
        return
    end
    SetHeroLevel(spellTargetUnit.Entity, GetHeroLevel(spellTargetUnit.Entity) + 1, true)
end
Ubertip = "选择一个友军单位使其提升1级。|nCD240s。消耗200点蓝量"
