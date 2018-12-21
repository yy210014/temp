local skill = Skills["旋风斩"]
skill.SkillType = 2
skill.DamageList = nil

local mSpeed = 15
local mMaxDistance = 800
local mArt = "AZ_jingzi_jiansheng01_F1.mdl"
local mDamages1 = {80, 120, 180, 260, 360, 480}
local mDamages2 = {1, 1.1, 1.2, 1.3, 1.4, 1.5}
local mDamages3 = {1, 1.1, 1.2, 1.3, 1.4, 1.5}

skill.OnCrit = function(attactUnit, defUnit)
    local self = attactUnit:GetSkill(GetId("AH53"))
    if (self == nil) then
        return
    end
    self:SubCD(1)
end

function skill:OnCast()
    local spellUnit = self.Owner
    local angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    dummy.Effect = AddSpecialEffectTarget(mArt, dummy.Entity, "origin")
    dummy:SetUnitFacing(angle)
    dummy.Owner = spellUnit
    dummy.Skill = self
    self.DamageList = {}
    local loc = dummy:AddLocomotion("冲锋")
    if (loc ~= nil) then
        loc:Start2(angle, mSpeed, mMaxDistance, self.OnPathEnd, self.OnPathUpdate)
    end
end

skill.OnPathUpdate = function(dummy)
    AssetsManager.OverlapCircle(
        dummy:X(),
        dummy:Y(),
        300,
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
                local ad = owner.Attribute:get("物理攻击") + owner.Attribute:get("物理攻击加成")
                local ap = owner.Attribute:get("法术攻击")
                local damage =
                    mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()] +
                    ap * mDamages3[self:GetCurLevel()]
                EXUnitDamageTarget(owner, unit, damage, EXDamageType.Physics)
                self.DamageList[#self.DamageList + 1] = unit
            end
        end
    )
end

skill.OnPathEnd = function(dummy)
    dummy.Skill.DamageList = nil
    AssetsManager.RemoveObject(dummy)
end

--GameEventProc.RegisterEventHandler("任意单位暴击", skill.OnCrit)
