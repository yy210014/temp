local skill = Skills["穿刺"]
skill.DamageList = nil
local mArt = "Abilities\\Spells\\Orc\\TrollBerserk\\HeadhunterWEAPONSRight.mdl"
local mSpeed = 12
local mMaxDistance = 900
local mDamages1 = {20, 40, 60, 80, 120, 140}
local mDamages2 = {0.6, 0.6, 0.6, 0.6, 0.6, 0.6}

function skill:OnCast()
    self.DamageList = {}
    local spellUnit = self.Owner
    local angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    dummy.Effect = AddSpecialEffectTarget(mArt, dummy.Entity, "chest")
    dummy.Owner = spellUnit
    dummy.Skill = self
    SetUnitFlyHeight(dummy.Entity, 50, 0.00)
    dummy:SetUnitFacing(angle)
    local locom = dummy:AddLocomotion("冲锋")
    locom:Start2(angle, mSpeed, mMaxDistance, self.OnPathEnd, self.OnPathUpdate)
end


skill.OnPathUpdate = function(dummy)
    AssetsManager.OverlapCircle(
        dummy:X(),
        dummy:Y(),
        100,
        function(unit)
            if (IsInTable(unit, dummy.Skill.DamageList) == -1) then
                --特效
                DestroyEffect(
                    AddSpecialEffectTarget(
                        "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",
                        unit.Entity,
                        "chest"
                    )
                )
                local owner = dummy.Owner
                local self = dummy.Skill
                --伤害
                local ad = spellUnit.Attribute:get("物理攻击") + spellUnit.Attribute:get("物理攻击加成")
                local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
                EXUnitDamageTarget(spellUnit, unit, damage, EXDamageType.Physics)
                self.DamageList[#self.DamageList + 1] = unit
                unit:AddBuff("撕裂")
            end
        end
    )
end

skill.OnPathEnd = function(dummy)
    dummy.Skill.DamageList = nil
    AssetsManager.RemoveObject(dummy)
end
