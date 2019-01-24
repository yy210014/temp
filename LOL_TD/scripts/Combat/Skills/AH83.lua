local skill = Skills["狂躁律动"]
skill.SkillType = 2
local mArt = "AZ_Sona_R.mdl"

setmetatable(Buffs["狂躁律动"], { __index = Buffs["眩晕"] })
Buffs["狂躁律动"].Durs = { 1.5 }

function skill:OnCast()
    local spellUnit = self.Owner
    self.angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    dummy:SetUnitFacing(self.angle)
    SetUnitFlyHeight(dummy.Entity, 70, 0)
    dummy.Effect = AddSpecialEffectTarget(mArt, dummy.Entity, "origin")
    AssetsManager.RemoveObject(dummy)

    local dummy2 = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
    dummy2:AddSkill("AQ05")
    dummy2.Owner = spellUnit
    IssuePointOrder(dummy2.Entity, "carrionswarm", GetSpellTargetX(), GetSpellTargetY())
    local timer = CreateTimer()
    TimerStart(timer, 1, true,
    function()
        AssetsManager.RemoveObject(dummy2)
        DestroyTimer(timer)
    end
    )
end