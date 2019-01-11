local skill = Skills["冰霜之环"]
skill.SkillType = 0

local mDamages1 = { 150, 300, 450, 600, 750, 900 }
local mDamages2 = { 0.5, 0.7, 1.9, 1.1, 1.3, 1.5 }
local mRange = 600
local mArt1 = "bing1.mdl"

setmetatable(Buffs["冰霜之环"], { __index = Buffs["禁锢"] })
Buffs["冰霜之环"].Art = "bing2.mdl"
Buffs["冰霜之环"].Durs = { 2, 2, 2, 2, 2, 2, 3 }

function skill:OnCast()
    local spellUnit = self.Owner
    --  DestroyEffect(AddSpecialEffect(mArt1, spellUnit:X(), spellUnit:Y()))
    DestroyEffect(AddSpecialEffect("AZ_xiaonajia01_D.mdl", spellUnit:X(), spellUnit:Y()))

    local comb = GetUnitAbilityLevel(spellUnit.Entity, GetId("AH75")) > 0
    AssetsManager.OverlapCircle(
    spellUnit:X(),
    spellUnit:Y(),
    mRange,
    function(unit)
        unit:AddBuff("冰霜之环", comb and self:GetCurLevel() + 1 or self:GetCurLevel())
        local ap = spellUnit.Attribute:get("法术攻击")
        local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
        EXUnitDamageTarget(spellUnit, unit, damage, EXDamageType.Magic)
    end
    )
end