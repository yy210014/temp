local skill = Skills["剑圣突袭"]
skill.SkillType = 4
skill.DamageList = nil
skill.Interval = 0.1
skill.IntervalDt = 0
local mRange = 400
local mMaxCount = { 6, 6, 7, 7, 8, 8 }
local mDamages1 = { 200, 400, 600, 800, 1000, 1200 }
local mDamages2 = { 1, 1.2, 1.4, 1.6, 1.8, 2 }
local mArt0 = "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile_mini.mdl"
local mArt1 = "AZ_jingzi_jiansheng01_E1.mdl"
local mArt2 = "AZ_jingzi_jiansheng01_E2.mdl"

function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit = GetJ_EnemyUnits(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("剑圣突袭-丢失单位")
        return
    end
    self.dummy = AssetsManager.LoadUnit(self.Owner.Player, "uq00", spellUnit:X(), spellUnit:Y())
    self.dummy.Name = "剑圣突袭1"
    self.dummy.Effect = AddSpecialEffectTarget(mArt0, self.dummy.Entity, "origin")

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
        self.dummy:SetPosition(self.spellTargetUnit:X(), self.spellTargetUnit:Y())
        --特效
        local dummy = AssetsManager.LoadUnit(self.Owner.Player, "uq00", self.spellTargetUnit:X(), self.spellTargetUnit:Y())
        dummy.Name = "剑圣突袭2"
        dummy.Effect = AddSpecialEffectTarget(mArt1, dummy.Entity, "origin")
        dummy:SetUnitFacing(math.deg(GetRandomReal(0, 6.28)))
        AssetsManager.RemoveObject(dummy)

        local closeUnit = nil

        local enemyTeamUnits = GetEnemyTeamUnits()
        for j = 1, #enemyTeamUnits do
            local list = enemyTeamUnits[j]
            for i = 1, #list do
                if (list[i] ~= nil and list[i].IsDying == false) then
                    local dist = DistanceBetweenPoint(self.dummy:X(), list[i]:X(), self.dummy:Y(), list[i]:Y())
                    if (dist < mRange and list[i].IsDying == false) then
                        if (closeUnit == nil and IsInTable(list[i], self.DamageList) == -1) then
                            closeUnit = list[i]
                        end
                        if (closeUnit ~= nil) then
                            local dist1 = DistanceBetweenPoint(self.dummy:X(), list[i]:X(), self.dummy:Y(), list[i]:Y())
                            local dist2 = DistanceBetweenPoint(self.dummy:X(), closeUnit:X(), self.dummy:Y(), closeUnit:Y())
                            if (dist1 < dist2 and list[i].IsDying == false and IsInTable(list[i], self.DamageList) == -1) then
                                closeUnit = list[i]
                            end
                        end
                    end
                end
            end
        end
        if (closeUnit ~= nil and #self.DamageList <= mMaxCount[self:GetCurLevel()]) then
            self.spellTargetUnit = closeUnit
            self.DamageList[#self.DamageList + 1] = closeUnit
        else
            local ad = self.Owner.Attribute:get("物理攻击") + self.Owner.Attribute:get("物理攻击加成")
            local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
            for i = 1, #self.DamageList do
                DestroyEffect(AddSpecialEffectTarget(mArt2, self.DamageList[i].Entity, "chest"))
                EXUnitDamageTarget(self.Owner, self.DamageList[i], damage, EXDamageType.Physics)
            end
            self.dummy:SetPosition(self.Owner:X(), self.Owner:Y())
            AssetsManager.RemoveObject(self.dummy)
            self.DamageList = nil
            self:OnFinish()
        end
    end
end