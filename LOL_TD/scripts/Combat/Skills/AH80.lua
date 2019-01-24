local skill = Skills["风之祝福"]

setmetatable(Buffs["风之祝福"], { __index = Buffs["物理攻击"] })
Buffs["风之祝福"].values = { 100 }
Buffs["风之祝福"].Durs = { 10 }
Buffs["风之祝福"].MaxStack = 1
Buffs["风之祝福"].Art1 = ""

function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit = GetJ_PlayerUnits(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("风之祝福-丢失单位")
        return
    end
    spellTargetUnit:AddBuff("风之祝福")
end