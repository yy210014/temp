local skill = Skills["破晓"]
skill.SkillType = 0
skill.Flag = false

setmetatable(Buffs["破晓"], { __index = Buffs["眩晕"] })
Buffs["破晓"].Durs = { 1, 1, 1, 1, 1, 1 }

function skill:OnCast()
    self.Flag = true
end

function skill:OnBeginAttack(attactUnit, defUnit)
    if (self.Flag) then
        SetUnitAnimation(attactUnit.Entity, "attack slam")
    end
end

function skill:OnAttack(attactUnit, defUnit)
    if (self.Flag) then
        self.Flag = false
        defUnit:AddBuff("破晓")
        local ad = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
        local ap = attactUnit.Attribute:get("法术攻击")
        local damage = 50 + ad * 0.5 + ap * 0.3
        EXUnitDamageTarget(attactUnit, defUnit, damage, EXDamageType.Magic)
    end
end
