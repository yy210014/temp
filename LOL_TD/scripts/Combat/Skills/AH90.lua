local skill = Skills["如意打击"]
skill.SkillType = 0
skill.Flag = false
local mDamages1 = { 50, 150, 250, 350, 450, 550 }
local mDamages2 = { 1.3, 1.4, 1.5, 1.6, 1.7, 1.8 }
local mArt = "AZ_Monkeykingbattle_Q_Impact.mdl"

setmetatable(Buffs["如意打击"], { __index = Buffs["护甲"] })
Buffs["如意打击"].values = {-5, -10, -15, -20, -25, -30, -35, -40 }
Buffs["如意打击"].Durs = { 3, 3, 3, 3, 3, 3, 3, 3 }
function skill:OnCast()
    self.Flag = true
end

function skill:OnBeginAttack(attactUnit, defUnit)
    if (self.Flag) then
        --SetUnitAnimation(attactUnit.Entity, "spell")
    end
end

function skill:OnAttack(attactUnit, defUnit)
    if (self.Flag) then
        self.Flag = false
        local comb = attactUnit:GetComb("齐天大圣-切割者")
        DestroyEffect(AddSpecialEffect(mArt, defUnit:X(), defUnit:Y()))
        local ad = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
        local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
        EXUnitDamageTarget(attactUnit, defUnit, damage, EXDamageType.Physics)
        if (comb ~= nil and comb.Enable) then
            defUnit:AddBuff("如意打击", self:GetCurLevel() + 2)
        else
            defUnit:AddBuff("如意打击", self:GetCurLevel())
        end
    end
end