local skill = Skills["暗之禁锢"]
skill.SkillType = 1
local mDamages1 = {100, 200, 300, 400, 500, 600}
local mDamages2 = {1, 1.1, 1.2, 1.3, 1.4, 1.5}

setmetatable(Buffs["暗之禁锢"], {__index = Buffs["禁锢"]})
Buffs["暗之禁锢"].Durs = {1, 1.25, 1.5, 2, 2.5, 3}

skill.OnPathUpdate = function(dummy)
    AssetsManager.OverlapCircle(
        dummy:X(),
        dummy:Y(),
        100,
        function(unit)
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
            unit:AddBuff("暗之禁锢", self:GetCurLevel())
            dummy.Locomotion:PathEnded()
            return
        end
    )
end

skill.OnPathEnd = function(dummy)
    AssetsManager.RemoveObject(dummy)
end

function skill:OnCast()
    local spellUnit = self.Owner
    local angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    dummy.Effect =
        AddSpecialEffectTarget(
        "Abilities\\Spells\\Other\\CrushingWave\\CrushingWaveMissile.mdl",
        dummy.Entity,
        "origin"
    )
    dummy:SetUnitFacing(angle)
    dummy.Owner = spellUnit
    dummy.Skill = self
    local loc = dummy:AddLocomotion("冲锋")
    if (loc ~= nil) then
        loc:Start2(angle, 10, 1000, self.OnPathEnd, self.OnPathUpdate)
    end
end
