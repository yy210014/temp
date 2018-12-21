local skill = Skills["无情连打"]

setmetatable(Buffs["无情连打"], {__index = Buffs["攻速"]})
Buffs["无情连打"].values = {0.01, 0.02, 0.04, 0.06, 0.08, 0.10}
Buffs["无情连打"].Durs = {2, 2, 2, 2, 2, 2}
Buffs["无情连打"].MaxStack = 6

function skill:OnCast()
end

function skill:OnAttack(attactUnit, defUnit)
    --buff
    attactUnit:AddBuff("无情连打", self:GetCurLevel())
end
