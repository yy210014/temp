local skill = Skills["藐视"]
skill.SkillType = 0
local mRange = 1000
local mArt = "Abilities\\Spells\\NightElf\\BattleRoar\\RoarCaster.mdl"

setmetatable(Buffs["藐视"], {__index = Buffs["移速"]})
Buffs["藐视"].values = {-0.2, -0.25, -0.3, -0.35, -0.4, -0.45}
Buffs["藐视"].Durs = {4, 4, 4, 4, 4, 4}

function skill:OnCast()
    local spellUnit = self.Owner
    DestroyEffect(AddSpecialEffectTarget(mArt, spellUnit.Entity, "overhead"))
    AssetsManager.OverlapCircle(
        spellUnit:X(),
        spellUnit:Y(),
        mRange,
        function(unit)
            unit:AddBuff("藐视")
        end
    )
end
