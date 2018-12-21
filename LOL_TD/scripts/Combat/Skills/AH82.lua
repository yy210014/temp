local skill = Skills["减速和弦"]

setmetatable(Buffs["减速和弦"], {__index = Buffs["移速"]})
Buffs["减速和弦"].values = {-0.1}
Buffs["减速和弦"].Durs = {2}


function skill:OnAttack(attactUnit, defUnit, isCrit)
    defUnit:AddBuff("减速和弦")
end

Ubertip = "被动：琴女每次攻击会降低目标10%的移动速度"
