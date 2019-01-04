local skill = Skills["飓风龙卷"]
skill.SkillType = 2
local mArt = "AZ_Goods_Eul's Scepter of Divinity(3).mdl"
local mSpeed = 12
local mMaxDistance = 1000
local mDelayTime = 1

function skill:OnCast()
    local spellUnit = self.Owner
    self.angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    local offX = 100 * math.cos(self.angle)
    local offY = 100 * math.sin(self.angle)
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X() + offX, spellUnit:Y() + offY)
    dummy.Effect = AddSpecialEffectTarget(mArt, dummy.Entity, "origin")
    dummy:SetUnitFacing(self.angle)
    dummy:SetScale(0.2, 0.2, 0.2)

    dummy.Owner = spellUnit
    dummy.Skill = self
    self.dummy = dummy
    self.TimeDt = 0
    self.LastCastTime = GameScene.Elapsed
    self.CurAction = self.Delay
    self.DamageList = {}
end

skill.Delay = function(self, dt)
    if (GameScene.Elapsed - self.LastCastTime > mDelayTime) then
        local loc = self.dummy:AddLocomotion("冲锋")
        if (loc ~= nil) then
            loc:Start2(self.angle, mSpeed, mMaxDistance, self.OnPathEnd, self.OnPathUpdate)
        end
        self:OnFinish()
    else
        self.TimeDt = self.TimeDt + dt
        local scale = Lerp(0.2, 0.7, self.TimeDt / mDelayTime)
        self.dummy:SetScale(scale, scale, scale)
    end
end

skill.OnPathUpdate = function(dummy)
    AssetsManager.OverlapCircle(
        dummy:X(),
        dummy:Y(),
        150,
        function(unit)
            if (IsInTable(unit, dummy.Skill.DamageList) == -1) then
                local owner = dummy.Owner
                local self = dummy.Skill
                if (unit.Id ~= GetId("End0")) then
                    local loc = unit:AddLocomotion("击飞")
                    if (loc ~= nil) then
                        loc:Start(unit, 0.6, 300, nil)
                    end
                end
                --伤害
                local ap = owner.Attribute:get("法术攻击")
                local damage = 100 + ap
                EXUnitDamageTarget(owner, unit, damage, EXDamageType.Magic)
                self.DamageList[#self.DamageList + 1] = unit
            end
        end
    )
end

skill.OnPathEnd = function(dummy)
    dummy.Skill.DamageList = nil
    AssetsManager.RemoveObject(dummy)
end
