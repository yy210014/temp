local skill = Skills["军旗"]
skill.SkillType = 3
skill.Durs = { 8, 8, 8, 8, 8, 8 } --持续时间
local mDamages = { 150, 300, 450, 600, 750, 900 }
local mDamageRange = 300

function skill:OnCast()
    if (self.dummy ~= nil) then
        RemoveUnit(self.dummy)
    end
    self.dummy = CreateUnit(self.Owner.Player, GetId("uq02"), GetSpellTargetX(), GetSpellTargetY(), self.Owner:Facing())
    SetUnitAbilityLevel(self.dummy, GetId("AQ01"), self:GetCurLevel())
    AssetsManager.OverlapCircle(
    GetUnitX(self.dummy),
    GetUnitY(self.dummy),
    mDamageRange,
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
        EXUnitDamageTarget(self.Owner, unit, mDamages[self:GetCurLevel()], EXAbilityType.Physics_Ability)
    end
    )
end

function skill:OnRemove()
    RemoveUnit(self.dummy)
    self.dummy = nil
end