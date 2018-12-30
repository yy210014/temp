local skill = Skills["魔法水晶箭"]
skill.SkillType = 2
--local mArt1 = "AZModel\\AZ_PotM(1)_R2.mdl"
local mArt = "AZ_PotM(1)_R1_Misslie.mdl"
local mSpeed = 15
local mMaxDistance = 15000
local mDamages1 = {200, 300, 400, 500, 600, 800}
local mDamages2 = {1, 1.2, 1.4, 1.6, 1.8, 2}

setmetatable(Buffs["魔法水晶箭"], {__index = Buffs["眩晕"]})
Buffs["魔法水晶箭"].Durs = {3, 3, 3, 3, 3, 3}

function skill:OnCast()
    local spellUnit = self.Owner
    local angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    --  dummy.Effect1 = AddSpecialEffectTarget(mArt1, dummy.Entity, "overhead")
    dummy.Effect = AddSpecialEffectTarget(mArt, dummy.Entity, "origin")
    SetUnitScale(dummy.Entity, 1.3, 1.3, 1.3)
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
        function(u1)
            AssetsManager.OverlapCircle(
                u1:X(),
                u1:Y(),
                400,
                function(u2)
                    --特效
                    DestroyEffect(
                        AddSpecialEffectTarget(
                            "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",
                            u2.Entity,
                            "chest"
                        )
                    )
                    local owner = dummy.Owner
                    local self = dummy.Skill
                    --伤害
                    local ad = owner.Attribute:get("物理攻击") + owner.Attribute:get("物理攻击加成")
                    local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
                    EXUnitDamageTarget(owner, u2, damage, EXDamageType.Magic)
                    u2:AddBuff("魔法水晶箭")
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
