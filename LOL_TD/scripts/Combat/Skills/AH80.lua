local skill = Skills["风之祝福"]

setmetatable(Buffs["风之祝福"], { __index = Buffs["法术攻击"] })
Buffs["风之祝福"].values = { 1 }
Buffs["风之祝福"].Durs = { 10 }
Buffs["风之祝福"].MaxStack = 5

function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit = GetJ_PlayerUnits(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("风之祝福-丢失单位")
        return
    end
    --看不懂技能描述
    Buffs["风之祝福"].values = { spellTargetUnit.Attribute:get("法术攻击") * 0.2 }
    spellTargetUnit:AddBuff("风之祝福")
end

local Ubertip = "选择一名友方单位，献上风的祝福，给该单位提供（20%+0.01*法术攻击%）的攻击力，持续10s。CD12s。右键自动释放。|n消耗50点蓝量"