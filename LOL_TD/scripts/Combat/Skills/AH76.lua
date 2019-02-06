local skill = Skills["专注射击"]

setmetatable(Buffs["专注射击"], {__index = Buffs["攻速"]})
Buffs["专注射击"].values = {0.1}
Buffs["专注射击"].Durs = {5}
Buffs["专注射击"].MaxStack = 5

function skill:OnAttack(attactUnit, defUnit)
    attactUnit:AddBuff("专注射击")
end