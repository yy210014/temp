local skill = Skills["审判"]
skill.SkillType = 0
skill.Interval = 1
skill.IntervalDt = 0
skill.Duration = 4

local mDamageRange = 800
local mDamages1 = { 40, 80, 120, 160, 200, 240 }
local mDamages2 = { 0.8, 0.9, 1, 1.1, 1.2, 1.3 }

function skill:OnCast()
    local spellUnit = self.Owner
    self.Dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq08", spellUnit:X(), spellUnit:Y())
    self.CurAction = self.Action
end

skill.Action = function(self, dt)
    self.TimeDt = self.TimeDt + dt
    if (self.TimeDt >= self.Duration) then
        self.TimeDt = 0
        AssetsManager.RemoveObject(self.Dummy)
        self:OnFinish()
        return
    end

    self.IntervalDt = self.IntervalDt - dt
    if (self.IntervalDt <= 0) then
        self.IntervalDt = self.Interval
        local spellUnit = self.Owner
        local comb = spellUnit:GetComb("正义兄妹-草丛伦")
        AssetsManager.OverlapCircle(
        spellUnit:X(),
        spellUnit:Y(),
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
            local ad = spellUnit.Attribute:get("物理攻击") + spellUnit.Attribute:get("物理攻击加成")
            local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
            if (comb ~= nil and comb.Enable) then
                damage = damage + damage * 1
            end
            EXUnitDamageTarget(spellUnit, unit, damage, EXDamageType.Physics)
        end
        )
    end
end