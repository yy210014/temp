local skill = Skills["毒性射击"]
skill.Missileart = false
local mDamages1 = { 50, 100, 150, 200, 250, 300 }
local mDamages2 = { 0.1, 0.2, 0.3, 0.4, 0.5, 0.6 }

setmetatable(Buffs["毒性射击"], { __index = Buffs["灼烧"] })
local buff = Buffs["毒性射击"]
buff.Interval = 1
buff.Art = "Abilities\\Weapons\\PoisonSting\\PoisonStingTarget.mdl"
buff.values = { 0, 0, 0, 0, 0, 0 }
buff.Durs = { 4, 4, 4, 4, 4, 4 }
buff.MaxStack = 1
buff.Damages1 = { 25, 50, 75, 100, 125, 150 }
buff.Damages2 = { 0.3, 0.3, 0.3, 0.3, 0.3, 0.3 }

function buff.Action(self, dt)
    self.IntervalDt = self.IntervalDt - dt
    if (self.IntervalDt <= 0) then
        self.IntervalDt = self.Interval

        local owner = self.Owner
        local attactUnit = self.AttactUnit
        local ap = attactUnit.Attribute:get("法术攻击")
        local damage = self.Damages1[self.Level] + ap * self.Damages2[self.Level]
        local comb1 = attactUnit:GetComb("提百万-纳什之牙")
        local comb2 = attactUnit:GetComb("提百万+冰杖")
        if ((comb1 ~= nil and comb1.Enable) or (comb2 ~= nil and comb2.Enable)) then
            damage = damage * 2
        end
        EXUnitDamageTarget(attactUnit, owner, damage, EXAbilityType.Magic)
    end
end

function skill:OnLearned()
    if (self.Missileart == false) then
        UnitAddAbility(self.Owner.Entity, GetId("AIll"))
        UnitMakeAbilityPermanent(self.Owner.Entity, true, GetId("AIll"))
    end
    self.Missileart = true
end

function skill:OnAttack(attactUnit, defUnit, isCrit)
    local ap = attactUnit.Attribute:get("法术攻击")
    local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
    EXUnitDamageTarget(attactUnit, defUnit, damage, EXAbilityType.Magic)
    local buf = defUnit:AddBuff("毒性射击", self:GetCurLevel())
    if (buf ~= nil) then
        buf.AttactUnit = attactUnit
    end
end