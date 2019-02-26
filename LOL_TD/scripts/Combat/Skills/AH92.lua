local skill = Skills["大闹天宫"]

skill.SkillType = 0
skill.Interval = 0.5
skill.IntervalDt = 0
skill.Duration = 2
local mArt = "AZ_jingzi_jiansheng01_F1.mdl"
local mArt2 = "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl"

local mDamageRange = 800
local mDamages1 = { 40, 80, 120, 160, 200, 240 }
local mDamages2 = { 0.8, 0.9, 1, 1.1, 1.2, 1.3 }

function skill:OnCast()
    local spellUnit = self.Owner
    self.Dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq12", spellUnit:X(), spellUnit:Y())
    self.Dummy.Effect = AddSpecialEffectTarget(mArt, self.Dummy.Entity, "origin")
    SetUnitAnimationByIndex(self.Dummy.Entity, 3)
    self.IntervalDt = 0
    self.CurAction = self.Action
    self.DamageList = {}
end

skill.Action = function(self, dt)
    self.TimeDt = self.TimeDt + dt
    if (self.TimeDt >= self.Duration) then
        self.TimeDt = 0
        AssetsManager.DestroyObject(self.Dummy)
        self.DamageList = nil
        self:OnFinish()
        return
    end

    self.IntervalDt = self.IntervalDt - dt
    if (self.IntervalDt <= 0) then
        self.IntervalDt = self.Interval
        local spellUnit = self.Owner
        AssetsManager.OverlapCircle(
        spellUnit:X(),
        spellUnit:Y(),
        mDamageRange,
        function(unit)
            --特效
            DestroyEffect(AddSpecialEffectTarget(mArt, unit.Entity, "chest"))
            if (IsInTable(unit, self.DamageList) == -1 and unit.Id ~= GetId("End0")) then
                local loc = unit:AddLocomotion("击飞")
                if (loc ~= nil) then
                    self.DamageList[#self.DamageList + 1] = unit
                    loc:Start(unit, 0.5, 160, nil)
                end
            end
            --伤害
            local ad = spellUnit.Attribute:get("物理攻击") + spellUnit.Attribute:get("物理攻击加成")
            local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
            EXUnitDamageTarget(spellUnit, unit, damage, EXAbilityType.Physics_Ability)
        end
        )
    end
end