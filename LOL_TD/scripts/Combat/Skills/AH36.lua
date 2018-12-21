local skill = Skills["海克斯爆破雷区"]
skill.SkillType = 2
local mDuration = 15
local mDamages1 = {80, 120, 180, 240, 300, 360}
local mDamages2 = {0.3, 0.4, 0.5, 0.6, 0.7, 0.8}

setmetatable(Buffs["海克斯爆破雷区"], {__index = Buffs["移速"]})
Buffs["海克斯爆破雷区"].values = {-0.2, -0.25, -0.3, -0.35, -0.4, -0.5}
Buffs["海克斯爆破雷区"].Durs = {1.5, 1.5, 1.5, 1.5, 1.5, 1.5}

function skill:OnCast()
    local spellUnit = self.Owner

    local offX = 0
    local offY = 0
    local dummy = nil
    for i = 1, 3 do
        offX = 50 * math.cos(math.rad((360 / 3) * i))
        offY = 50 * math.sin(math.rad((360 / 3) * i))
        dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq05", GetSpellTargetX() + offX, GetSpellTargetY() + offY)
        dummy.Owner = self.Owner
        dummy.Skill = self
        UnitApplyTimedLife(dummy.Entity, "BHwe", mDuration)
    end
    for i = 1, 8 do
        offX = 100 * math.cos(math.rad((360 / 8) * i))
        offY = 100 * math.sin(math.rad((360 / 8) * i))
        dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq05", GetSpellTargetX() + offX, GetSpellTargetY() + offY)
        dummy.Owner = self.Owner
        dummy.Skill = self
        UnitApplyTimedLife(dummy.Entity, "BHwe", mDuration)
    end
    --地雷没有自动排泄，需要开启计时器4秒后统一排泄，AssetsManager.RemoveObject(dieUnit)
end
