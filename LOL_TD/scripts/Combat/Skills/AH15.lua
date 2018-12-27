local skill = Skills["痛苦腐蚀"]
skill.SkillType = 3
skill.Interval = 1
skill.IntervalDt = 0
skill.Duration = 5.5
local mDamageRange = 450
local mDamages1 = {55, 70, 85, 100, 115, 130}
local mDamages2 = {0.3, 0.4, 0.5, 0.6, 0.7, 0.8}

skill.Action = function(self, dt)
    self.IntervalDt = self.IntervalDt + dt
    if (self.IntervalDt >= self.Interval) then
        self.IntervalDt = 0
        AssetsManager.OverlapCircle(
            GetUnitX(self.dummy),
            GetUnitY(self.dummy),
            mDamageRange,
            function(unit)
                --特效
                DestroyEffect(
                    AddSpecialEffectTarget(
                        "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",
                        unit.Entity,
                        "chest"
                    )
                )
                --伤害
                local ap = self.Owner.Attribute:get("法术攻击")
                local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
                EXUnitDamageTarget(self.Owner, unit, damage, EXDamageType.Magic)
            end
        )
    end
    
    self.TimeDt = self.TimeDt + dt
    if (self.TimeDt >= self.Duration) then
        self.TimeDt = 0
        self:OnFinish()
    end
end

function skill:OnCast()
    self.dummy = CreateUnit(self.Owner.Player, GetId("uq03"), GetSpellTargetX(), GetSpellTargetY(), self.Owner:Facing())
    self.IntervalDt = 0
    self.CurAction = self.Action
end

function skill:OnRemove()
    RemoveUnit(self.dummy)
    self.dummy = nil
end
