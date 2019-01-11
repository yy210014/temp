local skill = Skills["冰封陵墓"]
skill.SkillType = 1

local mRange = 400
local mDamages1 = { 300, 600, 900, 1200, 1500, 1800 }
local mDamages2 = { 2.0, 2.6, 3.2, 3.8, 4.4, 5 }

setmetatable(Buffs["冰封陵墓眩晕"], { __index = Buffs["眩晕"] })
Buffs["冰封陵墓眩晕"].Art = "bing2.mdl"
Buffs["冰封陵墓眩晕"].Durs = { 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 3.5 }

setmetatable(Buffs["冰封陵墓减速"], { __index = Buffs["移速"] })
Buffs["冰封陵墓减速"].Art2 = "Abilities\\Spells\\Other\\FrostDamage\\FrostDamage.mdl"
Buffs["冰封陵墓减速"].Durs = { 3, 3, 3, 3, 3, 3 }
Buffs["冰封陵墓减速"].values = {-0.35, -0.35, -0.35, -0.35, -0.35, -0.35 }

function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit = GetJ_EnemyUnits(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("冰封陵墓-丢失单位")
        return
    end

    DestroyEffect(AddSpecialEffect("AZ_xiaonajia01_D.mdl", spellTargetUnit:X(), spellTargetUnit:Y()))

    local comb = GetUnitAbilityLevel(spellUnit.Entity, GetId("AH75")) > 0
    spellTargetUnit:AddBuff("冰封陵墓眩晕", comb and self:GetCurLevel() + 1 or self:GetCurLevel())
    local ap = spellUnit.Attribute:get("法术攻击")
    local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
    EXUnitDamageTarget(spellUnit, spellTargetUnit, damage, EXDamageType.Magic)

    AssetsManager.OverlapCircle(
    spellTargetUnit:X(),
    spellTargetUnit:Y(),
    mRange,
    function(unit)
        if (unit ~= spellTargetUnit) then
            unit:AddBuff("冰封陵墓减速")
            EXUnitDamageTarget(spellUnit, unit, damage, EXDamageType.Magic)
        end
    end
    )
end