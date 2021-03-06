local skill = Skills["光之束缚"]
skill.SkillType = 2
skill.DamageList = nil
local mDamages1 = { 120, 240, 360, 480, 600, 720 }
local mDamages2 = { 0.5, 0.6, 0.7, 0.8, 0.9, 1 }
local mSpeed = 15
local mMaxDistance = 1000
local mArt = "AZ_MGN_Q01.mdl"
local mArt2 = "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl"

setmetatable(Buffs["光之束缚"], { __index = Buffs["禁锢"] })
Buffs["光之束缚"].Durs = { 1.5, 1.5, 1.5, 1.5, 1.5, 1.5 }

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
    local owner = dummy.Owner
    local self = dummy.Skill
    --伤害
    local ap = owner.Attribute:get("法术攻击")
    local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
    AssetsManager.OverlapCircle(
    dummy:X(),
    dummy:Y(),
    150,
    function(unit)
        if (IsInTable(unit, dummy.Skill.DamageList) == -1) then
            --特效
            DestroyEffect(AddSpecialEffectTarget(mArt2, unit.Entity, "chest"))
            EXUnitDamageTarget(owner, unit, damage, EXAbilityType.Magic_Ability)
            unit:AddBuff("光之束缚", self:GetCurLevel())
            self.DamageList[#self.DamageList + 1] = unit
        end
    end
    )
end

skill.OnPathEnd = function(dummy)
    dummy.Skill.DamageList = nil
    AssetsManager.RemoveObject(dummy)
end