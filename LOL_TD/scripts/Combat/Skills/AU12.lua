local skill = Skills["回收"]

local list = {
    [GetId("UH11")] = GetId("IH02"),
    [GetId("UH12")] = GetId("IH03"),
    [GetId("UH01")] = GetId("IH04"),
    [GetId("UH02")] = GetId("IH05"),
    [GetId("UH23")] = GetId("IH06"),
    [GetId("UH13")] = GetId("IH07"),
    [GetId("UH14")] = GetId("IH08"),
    [GetId("UH24")] = GetId("IH09"),
    [GetId("UH03")] = GetId("IH10"),
    [GetId("UH04")] = GetId("IH11"),
    [GetId("UH25")] = GetId("IH12"),
    [GetId("UH15")] = GetId("IH13"),
    [GetId("UH05")] = GetId("IH14"),
    [GetId("UH26")] = GetId("IH15"),
    [GetId("UH16")] = GetId("IH16"),
    [GetId("UH06")] = GetId("IH17"),
    [GetId("UH18")] = GetId("IH18"),
    [GetId("UH19")] = GetId("IH19"),
    [GetId("UH07")] = GetId("IH20"),
    [GetId("UH08")] = GetId("IH21"),
    [GetId("uu01")] = GetId("IH30"),
    [GetId("uu02")] = GetId("IH31"),
    [GetId("uu03")] = GetId("IH32"),
    [GetId("uu04")] = GetId("IH33"),
    [GetId("uu05")] = GetId("IH34"),
    [GetId("uu06")] = GetId("IH35"),
    [GetId("uu07")] = GetId("IH36"),
    [GetId("uu08")] = GetId("IH37"),
    [GetId("UH35")] = GetId("IH38"),
    [GetId("UH36")] = GetId("IH41"),
    [GetId("UH37")] = GetId("IH42"),
    [GetId("UH38")] = GetId("IH43"),
    [GetId("UH39")] = GetId("IH44")
}

function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit = GetJ_Units(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        return
    end
    if (list[spellTargetUnit.Id] ~= nil) then
        if (spellTargetUnit.tianfu ~= nil) then
            AssetsManager.DestroyObject(spellTargetUnit.tianfu)
        end
        AssetsManager.RemoveObject(spellTargetUnit)
        RemoveUnit(spellTargetUnit.Entity)
        spellTargetUnit:RefreshComb()
        UnitAddItem(spellUnit.Entity, CreateItem(list[spellTargetUnit.Id], spellUnit:X(), spellUnit:Y()))
    end
end
