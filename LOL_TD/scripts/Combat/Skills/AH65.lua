local skill = Skills["冰封陵墓"]
skill.SkillType = 1

local mRange = 400
local mDamages1 = {200, 320, 440, 560, 680, 800}
local mDamages2 = {1.5, 1.8, 2.1, 2.4, 2.7, 3}

setmetatable(Buffs["冰封陵墓眩晕"], {__index = Buffs["眩晕"]})
Buffs["冰封陵墓眩晕"].Art = "bing2.mdl"
Buffs["冰封陵墓眩晕"].Durs = {2.5, 2.5, 2.5, 2.5, 2.5, 2.5}

setmetatable(Buffs["冰封陵墓减速"], {__index = Buffs["移速"]})
Buffs["冰封陵墓减速"].Art2 = "Abilities\\Spells\\Other\\FrostDamage\\FrostDamage.mdl"
Buffs["冰封陵墓减速"].Durs = {3, 3, 3, 3, 3, 3}
Buffs["冰封陵墓减速"].values = {-0.9, -0.2, -0.2, -0.2, -0.2, -0.2}

function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit = GetJ_EnemyUnits(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("冰封陵墓-丢失单位")
        return
    end

    DestroyEffect(AddSpecialEffect("AZ_xiaonajia01_D.mdl", spellTargetUnit:X(), spellTargetUnit:Y()))

    spellTargetUnit:AddBuff("冰封陵墓眩晕")
    local ap = spellUnit.Attribute:get("法术攻击")
    local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
    EXUnitDamageTarget(spellUnit, spellTargetUnit, damage, EXDamageType.Magic)

    AssetsManager.OverlapCircle(
        spellTargetUnit:X(),
        spellTargetUnit:Y(),
        mRange,
        function(unit)
            unit:AddBuff("冰封陵墓减速")
            EXUnitDamageTarget(spellUnit, unit, damage, EXDamageType.Magic)
        end
    )
end
