local skill = Skills["破晓"]
skill.SkillType = 0
skill.Durs = { 2, 2, 2, 2, 2, 2 }

setmetatable(Buffs["破晓"], { __index = Buffs["眩晕"] })
Buffs["破晓"].Durs = { 1, 1, 1, 1, 1, 1 }

function skill:OnBeginAttack(attactUnit, defUnit)
    if self.IsSpell then
        SetUnitAnimationByIndex(attactUnit.Entity, 7)
    else
        SetUnitAnimationByIndex(attactUnit.Entity, 2)
    end
end

function skill:OnAttack(attactUnit, defUnit)
    if (self.IsSpell) then
        self:OnFinish()
        defUnit:AddBuff("破晓")
        local ad = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
        local ap = attactUnit.Attribute:get("法术攻击")
        local damage = 50 + ad * 0.5 + ap * 0.3
        EXUnitDamageTarget(attactUnit, defUnit, damage, EXAbilityType.Magic_Ability)
    end
end