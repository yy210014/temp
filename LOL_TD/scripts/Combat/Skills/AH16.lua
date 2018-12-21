local skill = Skills["灵魂镣铐"]
skill.SkillType = 0
skill.DamageList = nil
skill.Interval = 1
skill.IntervalDt = 0
skill.Duration = 5
local mDamageRange = 800
local mDamages1 = { 75, 100, 125, 150, 175, 200 }
local mDamages2 = { 0.7, 0.8, 0.9, 1, 1.1, 1.2 }

setmetatable(Buffs["灵魂镣铐"], { __index = Buffs["移速"] })
Buffs["灵魂镣铐"].values = {-0.5 }
Buffs["灵魂镣铐"].Durs = { 5 }

skill.Action = function(self, dt)
    self.TimeDt = self.TimeDt + dt
    if (self.TimeDt >= self.Duration) then
        self.TimeDt = 0
        self:OnFinish()
        return
    end

    local spellUnit = self.Owner
    for i = #self.DamageList, 1, -1 do
        local v = self.DamageList[i]
        if (v.IsDying == false) then
            MoveLightningEx(
            v.AH16lightning,
            false,
            spellUnit:X(),
            spellUnit:Y(),
            spellUnit:Z() + 60,
            v:X(),
            v:Y(),
            v:Z() + 60
            )
        else
            DestroyLightning(v.AH16lightning)
            v.AH16lightning = nil
            table.remove(self.DamageList, i)
        end
    end

    self.IntervalDt = self.IntervalDt - dt
    if (self.IntervalDt <= 0) then
        self.IntervalDt = self.Interval
        for i = #self.DamageList, 1, -1 do
            local v = self.DamageList[i]
            if (v.IsDying == false) then
                --特效
                DestroyEffect(
                AddSpecialEffectTarget(
                "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",
                v.Entity,
                "chest"
                )
                )
                --伤害
                local ap = self.Owner.Attribute:get("法术攻击")
                local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
                EXUnitDamageTarget(self.Owner, v, damage, EXDamageType.Magic)
            else
                DestroyLightning(v.AH16lightning)
                v.AH16lightning = nil
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
        self.DamageList[#self.DamageList + 1] = unit
        unit.AH16lightning =         AddLightningEx(
        "DRAL",
        true,
        spellUnit:X(),
        spellUnit:Y(),
        spellUnit:Z() + 60,
        unit:X(),
        unit:Y(),
        unit:Z() + 60
        )
        SetLightningColor(unit.AH16lightning, 1, 0, 1, 1)
        unit:AddBuff("灵魂镣铐")
    end
    )
    self.CurAction = self.Action
end

function skill:OnRemove()
    for i = #self.DamageList, 1, -1 do
        DestroyLightning(self.DamageList[i].AH16lightning)
        self.DamageList[i].AH16lightning = nil
    end
    self.DamageList = nil
end