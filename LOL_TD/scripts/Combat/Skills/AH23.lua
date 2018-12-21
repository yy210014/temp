local skill = Skills["阿尔法突袭"]
skill.SkillType = 1
skill.DamageList = nil
skill.Interval = 0.1
skill.IntervalDt = 0
local mRange = 400
local mMaxCount = 6
local mDamages1 = {100, 200, 300, 500, 800, 1000}
local mDamages2 = {1, 1.2, 1.4, 1.6, 1.8, 2}
local mArt1 = "AZ_jingzi_jiansheng01_E1.mdl"
local mArt2 = "AZ_jingzi_jiansheng01_E2.mdl"

function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit = GetJ_Units(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("阿尔法突袭-丢失单位")
        return
    end
    self.dummy =
        spellUnit:CreateDummy(
        "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile_mini.mdl",
        spellUnit:X(),
        spellUnit:Y()
    )
    self.spellTargetUnit = spellTargetUnit
    self.DamageList = {}
    self.DamageList[#self.DamageList + 1] = spellTargetUnit
    self.CurAction = self.Action
end

skill.Action = function(self, dt)
    self.IntervalDt = self.IntervalDt - dt
    if (self.IntervalDt <= 0) then
        self.IntervalDt = self.Interval
        --寻找下一个目标
        SetUnitX(self.dummy, self.spellTargetUnit:X())
        SetUnitY(self.dummy, self.spellTargetUnit:Y())
        --特效
        local dummy =
            AssetsManager.LoadUnit(self.Owner.Player, "uq00", self.spellTargetUnit:X(), self.spellTargetUnit:Y())
        dummy.Effect = AddSpecialEffectTarget(mArt1, dummy.Entity, "origin")
        dummy:SetUnitFacing(GetRandomReal(0, 6.28))
        AssetsManager.RemoveObject(dummy)

        local closeUnit = nil
        AssetsManager.OverlapCircle(
            GetUnitX(self.dummy),
            GetUnitY(self.dummy),
            mRange,
            function(unit)
                if (closeUnit == nil and IsInTable(unit, self.DamageList) == -1) then
                    closeUnit = unit
                end
                if (closeUnit ~= nil) then
                    local dist1 = DistanceBetweenPoint(GetUnitX(self.dummy), unit:X(), GetUnitY(self.dummy), unit:Y())
                    local dist2 =
                        DistanceBetweenPoint(GetUnitX(self.dummy), closeUnit:X(), GetUnitY(self.dummy), closeUnit:Y())
                    if (dist1 < dist2 and unit.IsDying == false and IsInTable(unit, self.DamageList) == -1) then
                        closeUnit = unit
                    end
                end
            end
        )
        if (closeUnit ~= nil and #self.DamageList <= mMaxCount) then
            self.spellTargetUnit = closeUnit
            self.DamageList[#self.DamageList + 1] = closeUnit
        else
            local ad = self.Owner.Attribute:get("物理攻击") + self.Owner.Attribute:get("物理攻击加成")
            local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
            for i = 1, #self.DamageList do
                DestroyEffect(AddSpecialEffectTarget(mArt2, self.DamageList[i].Entity, "chest"))
                EXUnitDamageTarget(self.Owner, self.DamageList[i], damage, EXDamageType.Physics)
            end
            SetUnitX(self.dummy, self.Owner:X())
            SetUnitY(self.dummy, self.Owner:Y())
            RemoveUnit(self.dummy)
            self.DamageList = nil
            self.CurAction = nil
        end
    end
end
