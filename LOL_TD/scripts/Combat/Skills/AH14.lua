local skill = Skills["暗之禁锢"]
skill.SkillType = 1
skill.DamageList = nil
local mDamages1 = { 150, 300, 450, 600, 750, 900 }
local mDamages2 = { 0.5, 0.7, 0.9, 1.1, 1.3, 1.5 }
local mSpeed = 15
local mMaxDistance = 1000

local mArt = "AZ_MGN_Q01.mdl"
local mArt2 = "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl"

setmetatable(Buffs["暗之禁锢"], { __index = Buffs["禁锢"] })
Buffs["暗之禁锢"].Durs = { 1, 1.25, 1.5, 2, 2.5, 3 }

skill.OnPathUpdate = function(dummy)
    local owner = dummy.Owner
    local self = dummy.Skill
    --伤害
    local ap = owner.Attribute:get("法术攻击")
    local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
    AssetsManager.OverlapCircle(
    dummy:X(),
    dummy:Y(),
    100,
    function(unit)
        if (IsInTable(unit, dummy.Skill.DamageList) == -1) then
            --特效
            DestroyEffect(AddSpecialEffectTarget(mArt2, unit.Entity, "chest"))
            EXUnitDamageTarget(owner, unit, damage, EXDamageType.Magic)
            unit:AddBuff("暗之禁锢", self:GetCurLevel())
            self.DamageList[#self.DamageList + 1] = unit
        end
    end
    )
end

skill.OnPathEnd = function(dummy)
    dummy.Skill.DamageList = nil
    AssetsManager.RemoveObject(dummy)
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