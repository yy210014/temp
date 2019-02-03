local skill = Skills["寒冰碎片"]
skill.SkillType = 2

local mSpeed = 15
local mMaxDistance = 800
local mDamages1 = { 200, 400, 600, 800, 1000, 1200 }
local mDamages2 = { 1, 1.4, 1.8, 2.2, 2.6, 3 }
local mDummyArt = "AZ_blueDragonpf_Missile.mdl"
local mTargetArt = "AZ_Mr.War3_GJSxh1_R.mdl"
local mTargetArt2 = "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl"

setmetatable(Buffs["寒冰碎片"], { __index = Buffs["移速"] })
Buffs["寒冰碎片"].values = {-0.15, -0.175, -0.2, -0.225, -0.25, -0.275 }
Buffs["寒冰碎片"].Durs = { 1.5, 1.5, 1.5, 1.5, 1.5, 1.5 }

function skill:OnCast()
    local spellUnit = self.Owner
    --创建运动马甲
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    dummy.Effect = AddSpecialEffectTarget(mDummyArt, dummy.Entity, "origin")
    local angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    dummy:SetUnitFacing(angle)
    SetUnitFlyHeight(dummy.Entity, 80, 0)
    dummy.Owner = spellUnit
    dummy.Skill = self
    dummy.Angle = angle

    --创建运动
    local loc = dummy:AddLocomotion("冲锋")
    if (loc ~= nil) then
        loc:Start2(angle, mSpeed, mMaxDistance, self.OnPathEnd, self.OnPathUpdate)
    end
end

skill.OnPathUpdate = function(dummy)
    local owner = dummy.Owner
    local self = dummy.Skill
    local ap = owner.Attribute:get("法术攻击")
    local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
    local comb = owner:GetComb("冰女-鬼书")
    if (comb ~= nil and comb.Enable) then
        damage = damage + damage * 0.5
    end
    AssetsManager.OverlapCircle(
    dummy:X(),
    dummy:Y(),
    100,
    function(unit)
        DestroyEffect(AddSpecialEffectTarget(mTargetArt2, unit.Entity, "chest"))
        --伤害
        EXUnitDamageTarget(owner, unit, damage, EXDamageType.Magic)
        unit:AddBuff("寒冰碎片", self:GetCurLevel())

        AssetsManager.OverlapCircle(
        dummy:X(),
        dummy:Y(),
        600,
        function(unit2)
            --创建运动马甲
            local dummy2 = AssetsManager.LoadUnit(dummy.Owner.Player, "uq00", dummy:X(), dummy:Y())
            -- SetUnitScale(dummy2.Entity, 0.02, 0.02, 0.02)
            SetUnitFlyHeight(dummy2.Entity, 80, 0)
            dummy2.Effect = AddSpecialEffectTarget(mTargetArt, dummy2.Entity, "origin")
            local angle = AngleBetweenPoint(dummy:X(), unit2:X(), dummy:Y(), unit2:Y())
            dummy2.Owner = dummy.Owner
            dummy2.Skill = dummy.Skill
            dummy2.Target = unit2
            --创建运动
            local loc = dummy2:AddLocomotion("冲锋")
            if (loc ~= nil) then
                loc:Start(unit2, 10, self.OnPathEnd2)
            end
        end
        )
        dummy.Locomotion:PathEnded()
        return
    end
    )
end

skill.OnPathEnd = function(dummy)
    AssetsManager.RemoveObject(dummy)
end

skill.OnPathEnd2 = function(dummy)
    --伤害
    local owner = dummy.Owner
    if (dummy.Target == nil or dummy.Target.Entity == nil) then
        AssetsManager.RemoveObject(dummy)
        return
    end
    local self = dummy.Skill
    local ap = owner.Attribute:get("法术攻击")
    local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
    local comb = owner:GetComb("冰女-帽子")
    if (comb ~= nil and comb.Enable) then
        damage = damage + damage * 0.3
    end
    EXUnitDamageTarget(owner, dummy.Target, damage, EXDamageType.Magic)
    AssetsManager.RemoveObject(dummy)
end