local skill = Skills["出血"]
local mDamages = {10, 20, 30, 40, 50, 60}

function skill:OnAttack(attactUnit, defUnit)
    --buff
    local buff = defUnit:AddBuff("出血", self:GetCurLevel())
    if (buff ~= nil) then
        buff.AttactUnit = attactUnit
        buff.values = {10, 20, 30, 40, 50, 60}
    end
end
