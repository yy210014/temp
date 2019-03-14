local skill = Skills["蓝buff"]

local buff = Buffs["蓝buff"]
buff.Durs = { 60 }
buff.Art = "Abilities\\Spells\\Human\\Thunderclap\\ThunderclapTarget.mdl"

function buff:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("魔法恢复", 10)
    unit.Attribute:add("冷却缩减", 0.1)

end

function buff:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("魔法恢复", -10)
    unit.Attribute:add("冷却缩减", -0.1)
end

function skill:OnCast()
    local spellTargetUnit = GetJ_PlayerUnits(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("蓝buff-丢失单位")
        return
    end
    spellTargetUnit:AddBuff("蓝buff")
end