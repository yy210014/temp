local skill = Skills["影奥义！诸刃"]
skill.SkillType = 2
skill.DamageList = nil

local mDamages1 = {100, 200, 300, 400, 500, 600}
local mDamages2 = {0.9, 0.9, 0.9, 0.9, 0.9, 0.9}
local mMaxDistance = 500
local mSpeed = 15
local mRange = 100
local mArt = "Abilities\\Weapons\\ShadowHunterMissile\\ShadowHunterMissile.mdl"

function skill:OnSpellChannel()
    local spellUnit = self.Owner
    local ah69 = spellUnit:GetSkill(GetId("AH69"))
    if (ah69 ~= nil and ah69.dummy ~= nil and self.Owner.Id ~= GetId("uq06")) then
        IssuePointOrder(ah69.dummy.Entity, self.Order, GetSpellTargetX(), GetSpellTargetY())
    end
end

function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.Id == GetId("uq06")) then
        spellUnit = spellUnit.Owner
    end
    --创建运动马甲
    local angle = AngleBetweenPoint(self.Owner:X(), GetSpellTargetX(), self.Owner:Y(), GetSpellTargetY())
    local dummy = AssetsManager.LoadUnit(self.Owner.Player, "uq00", self.Owner:X(), self.Owner:Y())
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
                local ad = owner.Attribute:get("物理攻击") + owner.Attribute:get("物理攻击加成")
                local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
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
