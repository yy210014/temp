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
        local comb = spellUnit:GetComb("小法师-大圣杯")
        AssetsManager.OverlapCircle(
            self.SpellTargetX,
            self.SpellTargetY,
            350,
            function(unit)
                local ap = spellUnit.Attribute:get("法术攻击")
                local damage = mDamages1[self:GetCurLevel()] + (ap * mDamages2[self:GetCurLevel()])
                if (comb ~= nil and comb.Enable) then
                    damage = damage + damage * 0.5
                end
                EXUnitDamageTarget(spellUnit, unit, damage, EXDamageType.Magic)
            end
        )
        self:OnFinish()
    end
end
