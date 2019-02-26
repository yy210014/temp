local skill = Skills["如意打击"]
skill.SkillType = 0
skill.Durs = { 2, 2, 2, 2, 2, 2 } --持续时间
local mDamages1 = { 50, 150, 250, 350, 450, 550 }
local mDamages2 = { 0.3, 0.6, 0.9, 1.2, 1.5, 1.8 }
local mArt = "AZ_Monkeykingbattle_Q_Impact.mdl"

setmetatable(Buffs["如意打击"], { __index = Buffs["护甲"] })
Buffs["如意打击"].values = {-3, -6, -9, -12, -14, -16, -18 }
Buffs["如意打击"].Durs = { 6, 6, 6, 6, 6, 6, 6, 6 }

function skill:OnBeginAttack(attactUnit, defUnit)
    if (self.IsSpell) then
        SetUnitAnimationByIndex(attactUnit.Entity, 1)
    end
end

function skill:OnAttack(attactUnit, defUnit)
    if (self.IsSpell) then
        self:OnFinish()
        local comb = attactUnit:GetComb("齐天大圣-吸蓝刀")
        DestroyEffect(AddSpecialEffect(mArt, defUnit:X(), defUnit:Y()))
        local ad = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
        local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
        if (comb ~= nil and comb.Enable) then
            damage = damage + damage * 0.5
        end
        EXUnitDamageTarget(attactUnit, defUnit, damage, EXAbilityType.Physics_Ability)
        defUnit:AddBuff("如意打击")
    end
end