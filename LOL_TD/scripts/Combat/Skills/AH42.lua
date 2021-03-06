local skill = Skills["冰霜射击"]
local mDamages = {0.2, 0.4, 0.6, 0.8, 1.0, 1.2}

setmetatable(Buffs["冰霜射击"], {__index = Buffs["移速"]})
Buffs["冰霜射击"].values = {-0.05, -0.1, -0.15, -0.2, -0.25, -0.3}
Buffs["冰霜射击"].Durs = {3, 3, 3, 3, 3, 3}

function skill:OnCast()
end

function skill:OnAttack(attactUnit, defUnit)
    defUnit:AddBuff("冰霜射击", self:GetCurLevel())
    local ad = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
    local damage = ad * mDamages[self:GetCurLevel()]
    EXUnitDamageTarget(attactUnit, defUnit, damage, EXAbilityType.Magic)
end