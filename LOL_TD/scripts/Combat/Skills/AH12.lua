local skill = Skills["透光奇点"]
skill.SkillType = 3
local mDamages1 = {180, 360, 540, 720, 900, 1080}
local mDamages2 = {0.75, 1, 1.25, 1.5, 1.75, 2}
local mArt = "Abilities\\Weapons\\VengeanceMissile\\VengeanceMissile.mdl"

local mArt1 = "AZ_Lina(2)_T1_MagicMatrix.mdl"
local mArt2 = "AZ_Lina(2)_T2_Blast.mdl"
local mDelayTime = 0.7
local mDamageRange = 300

function skill:OnCast()
    local spellUnit = self.Owner
    DestroyEffect(AddSpecialEffect(mArt1, GetSpellTargetX(), GetSpellTargetY()))
    self.SpellTargetX = GetSpellTargetX()
    self.SpellTargetY = GetSpellTargetY()
    self.CurAction = self.DelayDamage
    self.LastCastTime = GameScene.Elapsed
end

skill.DelayDamage = function(self, dt)
    if (GameScene.Elapsed - self.LastCastTime > mDelayTime) then
        local spellUnit = self.Owner
        DestroyEffect(AddSpecialEffect(mArt2, self.SpellTargetX, self.SpellTargetY))
        AssetsManager.OverlapCircle(
            self.SpellTargetX,
            self.SpellTargetY,
            mDamageRange,
            function(unit)
                --伤害
                local ap = spellUnit.Attribute:get("法术攻击")
                local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
                EXUnitDamageTarget(spellUnit, unit, damage, EXDamageType.Magic)
            end
        )
        self:OnFinish()
    end
end
