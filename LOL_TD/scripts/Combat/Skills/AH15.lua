local skill = Skills["痛苦腐蚀"]
skill.SkillType = 3
skill.Interval = 1
skill.IntervalDt = 0
skill.Duration = 5.5
local mDamageRange = 450
local mDamages1 = { 50, 80, 110, 140, 170, 200 }
local mDamages2 = { 0.3, 0.4, 0.5, 0.6, 0.7, 0.8 }
local mArt = "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl"

skill.Action = function(self, dt)
    self.TimeDt = self.TimeDt + dt
    if (self.TimeDt >= self.Duration) then
        self.TimeDt = 0
        RemoveUnit(self.dummy)
        self.dummy = nil
        self:OnFinish()
    end

    self.IntervalDt = self.IntervalDt + dt
    if (self.IntervalDt >= self.Interval) then
        self.IntervalDt = 0
        local spellUnit = self.Owner
        local ap = spellUnit.Attribute:get("法术攻击")
        local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
        local comb = spellUnit:GetComb("堕天使-冰杖")
        if (comb ~= nil and comb.Enable) then
            damage = damage + damage * 0.5
        end
        AssetsManager.OverlapCircle(
        GetUnitX(self.dummy),
        GetUnitY(self.dummy),
        mDamageRange,
        function(unit)
            --特效
            DestroyEffect(AddSpecialEffectTarget(mArt, unit.Entity, "chest"))
            EXUnitDamageTarget(spellUnit, unit, damage, EXAbilityType.Magic_Ability)
        end
        )
    end
end

function skill:OnCast()
    if (self.dummy ~= nil) then
        RemoveUnit(self.dummy)
    end
    self.dummy = CreateUnit(self.Owner.Player, GetId("uq03"), GetSpellTargetX(), GetSpellTargetY(), self.Owner:Facing())
    self.IntervalDt = 0
    self.CurAction = self.Action
end