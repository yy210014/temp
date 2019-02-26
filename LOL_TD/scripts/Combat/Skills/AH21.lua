local skill = Skills["清算"]
skill.SkillType = 1

local mSpeed = 10
local mMaxDistance = 800
local mDamages1 = { 300, 600, 900, 1200, 1500, 1800 }
local mDamages2 = { 0.5, 0.6, 0.7, 0.8, 0.9, 1 }
local mDamages3 = { 0.1, 0.2, 0.3, 0.4, 0.5, 0.6 }
local mDummyArt = "AZ_RedDragonpf_Missile.mdl"

setmetatable(Buffs["清算"], { __index = Buffs["移速"] })
Buffs["清算"].values = {-0.2, -0.25, -0.3, -0.35, -0.4, -0.45 }
Buffs["清算"].Durs = { 3, 3, 3, 3, 3, 3 }
function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit = GetJ_EnemyUnits(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("清算-丢失单位")
        return
    end
    --创建运动马甲
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    dummy.Effect = AddSpecialEffectTarget(mDummyArt, dummy.Entity, "origin")
    local angle = AngleBetweenPoint(dummy:X(), spellTargetUnit:X(), dummy:Y(), spellTargetUnit:Y())
    dummy:SetUnitFacing(angle)
    SetUnitFlyHeight(dummy.Entity, 80, 0)
    dummy.Owner = spellUnit
    dummy.Target = spellTargetUnit
    dummy.Skill = self
    --创建运动
    local loc = dummy:AddLocomotion("冲锋")
    if (loc ~= nil) then
        loc:Start(spellTargetUnit, 10, self.OnPathEnd)
    end
end

skill.OnPathEnd = function(dummy)
    --伤害
    local spellTargetUnit = dummy.Target
    if (spellTargetUnit == nil or spellTargetUnit.Entity == nil) then
        AssetsManager.RemoveObject(dummy)
        return
    end
    local owner = dummy.Owner
    local self = dummy.Skill
    local ad = owner.Attribute:get("物理攻击") + owner.Attribute:get("物理攻击加成")
    local ap = owner.Attribute:get("法术攻击")
    local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()] + ad * mDamages3[self:GetCurLevel()]
    EXUnitDamageTarget(owner, spellTargetUnit, damage, EXAbilityType.Magic_Ability)
    spellTargetUnit:AddBuff("清算", self:GetCurLevel())
    local ah20 = owner:GetSkill(GetId("AH20"))
    if (ah20 ~= nil) then
        spellTargetUnit:AddBuff("圣焰", ah20:GetCurLevel())
    end
    AssetsManager.RemoveObject(dummy)
end