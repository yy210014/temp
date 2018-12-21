local skill = Skills["枪林弹雨"]
skill.SkillType = 3
local mDamages1 = {10, 15, 20, 25, 30, 40}
local mDamages2 = {0.4, 0.4, 0.4, 0.4, 0.4, 0.4}

setmetatable(Buffs["枪林弹雨"], {__index = Buffs["移速"]})
Buffs["枪林弹雨"].values = {-0.2, -0.28, -0.36, -0.44, -0.52, -0.60}
Buffs["枪林弹雨"].Durs = {0.5, 0.5, 0.5, 0.5, 0.5, 0.5}

function skill:OnCast()
    local spellUnit = self.Owner
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    dummy.Owner = spellUnit
    dummy.Skill = self
    dummy:AddSkill("AQ02")
    IssuePointOrder(dummy.Entity, self.Order, GetSpellTargetX(), GetSpellTargetY())
    UnitApplyTimedLife(dummy.Entity, "BHwe", 3.00)
end
