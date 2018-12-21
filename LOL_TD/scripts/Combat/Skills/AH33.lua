local skill = Skills["弹幕时间"]
skill.SkillType = 2

skill.Interval = 0.25
skill.IntervalDt = 0
skill.angle = 0
skill.Duration = 0

local mSpeed = 20
local mMaxDistance = 1200
local mDamages = {0, 100, 100, 200, 200, 300}
local mDurations = {3, 3, 3.5, 3.5, 4, 4}

function skill:OnCast()
    local spellUnit = self.Owner
    self.angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    self.Duration = mDurations[self:GetCurLevel()]
    self.CurAction = self.Action
end

skill.Action = function(self, dt)
    self.TimeDt = self.TimeDt + dt
    if (self.TimeDt >= self.Duration) then
        self.TimeDt = 0
        self:OnFinish()
        return
    end

    self.IntervalDt = self.IntervalDt - dt
    if (self.IntervalDt <= 0) then
        self.IntervalDt = self.Interval
        local spellUnit = self.Owner
        local dummy = nil
        local locom = nil
        local angle = 0
        for i = 1, 9 do
            dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq04", spellUnit:X(), spellUnit:Y())
            dummy.Owner = self.Owner
            dummy.Skill = self
            dummy.DamageList = {}
            locom = dummy:AddLocomotion("冲锋")
            angle = self.angle + math.rad(-20 + 5 * i)
            locom:Start2(angle, mSpeed, mMaxDistance, self.OnPathEnd, self.OnPathUpdate)
        end
        dummy = nil
        locom = nil
    end
end

skill.OnPathUpdate = function(dummy)
    AssetsManager.OverlapCircle(
        dummy:X(),
        dummy:Y(),
        100,
        function(unit)
            if (IsInTable(unit,  dummy.DamageList) == -1) then
                local owner = dummy.Owner
                local self = dummy.Skill
                local ad = owner.Attribute:get("物理攻击") + owner.Attribute:get("物理攻击加成")
                local ap = owner.Attribute:get("法术攻击")
                local damage = mDamages[self:GetCurLevel()] + (ad * 0.45) + (ap * 0.25)
                DestroyEffect(
                    AddSpecialEffectTarget(
                        "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",
                        unit.Entity,
                        "chest"
                    )
                )
                EXUnitDamageTarget(owner, unit, damage, EXDamageType.Physics)
                dummy.DamageList[#dummy.DamageList + 1] = unit
            end
            return
        end
    )
end

skill.OnPathEnd = function(dummy)
    dummy.DamageList = nil
    AssetsManager.DestroyObject(dummy)
end
