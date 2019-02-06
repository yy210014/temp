local skill = Skills["灵魂镣铐"]
skill.SkillType = 0
skill.DamageList = nil
skill.Interval = 1
skill.IntervalDt = 0
skill.Duration = 5
local mDamageRange = 800
local mDamages1 = { 75, 100, 125, 150, 175, 200 }
local mDamages2 = { 0.7, 0.8, 0.9, 1, 1.1, 1.2 }
local mArt = "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl"

setmetatable(Buffs["灵魂镣铐"], { __index = Buffs["移速"] })
Buffs["灵魂镣铐"].values = {-0.25, -0.3, -0.35, -0.4, -0.45, -0.5 }
Buffs["灵魂镣铐"].Durs = { 5, 5, 5, 5, 5, 5 }

skill.Action = function(self, dt)
    self.TimeDt = self.TimeDt + dt
    if (self.TimeDt >= self.Duration) then
        self.TimeDt = 0
        for i = #self.DamageList, 1, -1 do
            DestroyLightning(self.DamageList[i][2])
        end
        self.DamageList = nil
        self:OnFinish()
        return
    end

    local spellUnit = self.Owner
    for i = #self.DamageList, 1, -1 do
        local unit = self.DamageList[i][1]
        local lightning = self.DamageList[i][2]
        if (unit.IsDying == false) then
            MoveLightningEx(lightning, false, spellUnit:X(), spellUnit:Y(), spellUnit:Z() + 60, unit:X(), unit:Y(), unit:Z() + 60)
        else
            DestroyLightning(lightning)
            table.remove(self.DamageList, i)
        end
    end

    self.IntervalDt = self.IntervalDt - dt
    if (self.IntervalDt <= 0) then
        self.IntervalDt = self.Interval
        local ap = self.Owner.Attribute:get("法术攻击")
        local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
        for i = #self.DamageList, 1, -1 do
            local unit = self.DamageList[i][1]
            local lightning = self.DamageList[i][2]
            if (unit.IsDying == false) then
                --特效
                DestroyEffect(AddSpecialEffectTarget(mArt, unit.Entity, "chest"))
                EXUnitDamageTarget(self.Owner, unit, damage, EXDamageType.Magic)
            else
                DestroyLightning(lightning)
                table.remove(self.DamageList, i)
            end
        end
    end
end

function skill:OnCast()
    local spellUnit = self.Owner
    self.DamageList = {}
    AssetsManager.OverlapCircle(
    spellUnit:X(),
    spellUnit:Y(),
    mDamageRange,
    function(unit)
        local lightning = AddLightningEx("DRAL", true, spellUnit:X(), spellUnit:Y(), spellUnit:Z() + 60, unit:X(), unit:Y(), unit:Z() + 60)
        self.DamageList[#self.DamageList + 1] = { unit, lightning }
        SetLightningColor(lightning, 1, 0, 1, 1)
        unit:AddBuff("灵魂镣铐", self:GetCurLevel())
    end
    )
    self.CurAction = self.Action
end