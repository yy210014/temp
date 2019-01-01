local skill = Skills["巨龙撞击"]
skill.SkillType = 2
local mDamageRange = 200
local mDistance = 1200
local mDamages1 = { 150, 250, 350, 500, 700, 900 }
local mDamages2 = { 0.1, 0.2, 0.4, 0.6, 0.8, 1 }
local mArt = "AZ_youlongtuci.mdl"

setmetatable(Buffs["巨龙撞击"], { __index = Buffs["护甲"] })
Buffs["巨龙撞击"].values = {-5, -10, -15, -20, -25, -30, -35, -40 }
Buffs["巨龙撞击"].Durs = { 3, 3, 3, 3, 3, 3, 3, 3 }

function skill:OnCast()
    local spellUnit = self.Owner
    local comb = spellUnit:GetComb("皇子-黑切")
    local angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())


    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    dummy.Effect = AddSpecialEffectTarget(mArt, dummy.Entity, "origin")
    dummy:SetUnitFacing(angle)
    SetUnitFlyHeight(dummy.Entity, 80, 0)
    AssetsManager.RemoveObject(dummy)

    --SetUnitAnimation(spellUnit.Entity, "birth")
    AssetsManager.OverlapLine(
    spellUnit:X(),
    spellUnit:Y(),
    mDistance,
    mDamageRange,
    angle,
    function(unit)
        --特效
        DestroyEffect(
        AddSpecialEffectTarget(
        "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",
        unit.Entity,
        "chest"
        )
        )
        --伤害
        local ad = spellUnit.Attribute:get("物理攻击") + spellUnit.Attribute:get("物理攻击加成")
        local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
        EXUnitDamageTarget(spellUnit, unit, damage, EXDamageType.Physics)
        if (comb ~= nil and comb.Enable) then
            unit:AddBuff("巨龙撞击", self:GetCurLevel() + 2)
        else
            unit:AddBuff("巨龙撞击", self:GetCurLevel())
        end
    end
    )
end