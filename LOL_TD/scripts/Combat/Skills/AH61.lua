local skill = Skills["黑暗物质"]
skill.SkillType = 3
skill.LastCastTime = 0
skill.SpellTargetX = 0
skill.SpellTargetY = 0
local mDamages1 = {200, 400, 600, 800, 1000, 1200}
local mDamages2 = {1.0, 1.4, 1.8, 2.2, 2.6, 3.0}
local mArt = "AZ_Tian.mdl"
local mDelayTime = 0.4

function skill:OnCast()
    local spellUnit = self.Owner
    DestroyEffect(AddSpecialEffect(mArt, GetSpellTargetX(), GetSpellTargetY()))
    self.SpellTargetX = GetSpellTargetX()
    self.SpellTargetY = GetSpellTargetY()
    self.CurAction = self.DelayDamage
    self.LastCastTime = GameScene.Elapsed
end

skill.DelayDamage = function(self, dt)
    if (GameScene.Elapsed - self.LastCastTime > mDelayTime) then
        local spellUnit = self.Owner
        AssetsManager.OverlapCircle(
            self.SpellTargetX,
            self.SpellTargetY,
            350,
            function(unit)
                local ap = spellUnit.Attribute:get("法术攻击")
                local damage = mDamages1[self:GetCurLevel()] + (ap * mDamages2[self:GetCurLevel()])
                EXUnitDamageTarget(spellUnit, unit, damage, EXDamageType.Magic)
            end
        )
        self:OnFinish()
    end
end
