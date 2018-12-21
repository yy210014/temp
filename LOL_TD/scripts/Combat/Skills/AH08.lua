local skill = Skills["德邦军旗"]
skill.SkillType = 3
skill.Durs = {8, 8, 8, 8, 8, 8} --持续时间
local mDamages = {150, 300, 450, 600, 750, 900}
local mDamageRange = 300

function skill:OnCast()
    self.dummy = CreateUnit(self.Owner.Player, GetId("uq02"), GetSpellTargetX(), GetSpellTargetY(), self.Owner:Facing())
    SetUnitAbilityLevel(self.dummy, "AQ01", self:GetCurLevel())
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
            EXUnitDamageTarget(self.Owner, unit, mDamages[self:GetCurLevel()], EXDamageType.Physics)
        end
    )
end

function skill:OnRemove()
    RemoveUnit(self.dummy)
    self.dummy = nil
end
