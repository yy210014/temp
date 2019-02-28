local skill = Skills["龙族血脉"]
local mAttactSpeed = { 0.1, 0.05, 0.05, 0.05, 0.05, 0.05 }

function skill:OnLearned()
    local spellUnit = self.Owner
    AddPlayerTechResearched(spellUnit.Player, GetId("R022"), 1)
    spellUnit.Attribute:add("攻击速度", mAttactSpeed[self:GetCurLevel()])
    if (self:GetCurLevel() == 1) then
        spellUnit.Attribute:add("物理穿透", 0.1)
    end
end


