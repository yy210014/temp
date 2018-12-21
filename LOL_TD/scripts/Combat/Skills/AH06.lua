local skill = Skills["疾风斩击"]
skill.SkillType = 2

local mArt = "AZ_Hengsao.mdl"
local mDamages1 = {100, 200, 300, 500, 800, 1000}
local mDamages2 = {0.25, 0.5, 0.75, 1, 1.25, 1.5}

function skill:OnCast()
    local spellUnit = self.Owner
    local angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    local offX = 50 * math.cos(angle)
    local offY = 50 * math.sin(angle)
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    dummy.Effect = AddSpecialEffectTarget(mArt, dummy.Entity, "origin")
    dummy:SetUnitFacing(angle)
    SetUnitFlyHeight(dummy.Entity, 80, 0)
    AssetsManager.OverlapCircle(
        spellUnit:X(),
        spellUnit:Y(),
        500,
        function(unit)
            --特效
            DestroyEffect(
                AddSpecialEffectTarget(
                    "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",
                    unit.Entity,
                    "chest"
                )
            )
            local ad = spellUnit.Attribute:get("物理攻击") + spellUnit.Attribute:get("物理攻击加成")
            local damage = mDamages1[self:GetCurLevel()] + (ad * mDamages2[self:GetCurLevel()])
            --伤害
            EXUnitDamageTarget(spellUnit, unit, damage, EXDamageType.Physics)
        end
    )
    AssetsManager.RemoveObject(dummy)
end
