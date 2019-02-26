local skill = Skills["腾云突击"]

skill.SkillType = 4
local mDamageRange = 300
local mDamages1 = { 150, 300, 450, 600, 750, 900 }
local mDamages2 = { 0.5, 0.7, 0.9, 1.1, 1.3, 1.5 }
local mArt = "Abilities\\Spells\\Human\\CloudOfFog\\CloudOfFog.mdl"
local mArt2 = "Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageDeathCaster.mdl"

setmetatable(Buffs["腾云突击"], { __index = Buffs["攻速"] })
Buffs["腾云突击"].values = { 0.3, 0.35, 0.4, 0.45, 0.5, 0.55 }
Buffs["腾云突击"].Durs = { 5, 5, 5, 5, 5, 5 }

skill.OnPathEnd = function(dummy)
    --伤害
    local owner = dummy.Owner
    local spellTargetUnit = dummy.Target
    if (spellTargetUnit == nil or spellTargetUnit.Entity == nil) then
        AssetsManager.DestroyObject(dummy)
        return
    end
    local self = dummy.Skill
    local ad = owner.Attribute:get("物理攻击") + owner.Attribute:get("物理攻击加成")
    local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
    EXUnitDamageTarget(owner, spellTargetUnit, damage, EXAbilityType.Magic_Ability)
    DestroyEffect(AddSpecialEffectTarget(mArt2, spellTargetUnit.Entity, "chest"))
    AssetsManager.DestroyObject(dummy)
end

function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit = GetJ_EnemyUnits(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("腾云突击-丢失单位")
        return
    end
    spellUnit:AddBuff("腾云突击", self:GetCurLevel())
    AssetsManager.OverlapCircle(
    spellTargetUnit:X(),
    spellTargetUnit:Y(),
    600,
    function(unit)
        local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq12", spellUnit:X(), spellUnit:Y())
        dummy.Owner = spellUnit
        dummy.Skill = self
        dummy.Target = unit
        dummy.Effect = AddSpecialEffectTarget(mArt, dummy.Entity, "chest")
        SetUnitAnimationByIndex(dummy.Entity, 1)
        local loc = dummy:AddLocomotion("冲锋")
        if (loc ~= nil) then
            loc:Start(unit, 18, self.OnPathEnd)
        end
    end
    )
end