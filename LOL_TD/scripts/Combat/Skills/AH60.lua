local skill = Skills["超凡邪力"]
skill.SkillType = 2
skill.DamageList = nil
local mArt = "Shadow_Frost_Weapon_Effect.mdl"
local mSpeed = 15
local mMaxDistance = 800
local mDamages1 = {150, 300, 450, 600, 750, 900}
local mDamages2 = {1, 1.3, 1.6, 1.9, 2.2, 2.5}

function skill:OnCast()
    local spellUnit = self.Owner
    local angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    dummy.Effect = AddSpecialEffectTarget(mArt, dummy.Entity, "chest")
    dummy.Owner = spellUnit
    dummy.Skill = self
    self.DamageList = {}
    --  SetUnitFlyHeight(dummy.Entity, 50, 0.00)
    dummy:SetUnitFacing(angle)
    local locom = dummy:AddLocomotion("冲锋")
    locom:Start2(angle, mSpeed, mMaxDistance, self.OnPathEnd, self.OnPathUpdate)
end

function skill:OnKill(dieUnit)
    self.Owner.Attribute:add("法术攻击", 1)
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
                local ap = owner.Attribute:get("法术攻击")
                local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
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
