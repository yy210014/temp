local skill = Skills["撸圈助手"]
skill.IntervalDt = 1
function skill:OnLearned()
    local spellUnit = self.Owner
    local player = spellUnit.Player
    AddPlayerTechResearched(player, GetId("R012"), 1)

    --[[local lqfl = spellUnit:GetSkill(GetId("lqfl"))
    if (lqfl ~= nil) then
        lqfl:onAuto()
    end]]
end

--[[5 8  12 18 25

翅膀 光环 两个皮肤

]]