local skill = Skills["爆炸火花"]
skill.SkillType = 1
skill.LastTime = 0
local mDamages1 = { 60, 120, 180, 240, 300, 360 }
local mDamages2 = { 0.25, 0.3, 0.35, 0.4, 0.45, 0.5 }
local mRange = 800
local mSpecialArt = "Abilities\\Spells\\Other\\Volcano\\VolcanoDeath.mdl"
local mTargetArt = "Abilities\\Spells\\Other\\SoulBurn\\SoulBurnbuff.mdl"

local buff = Buffs["爆炸火花"]
buff.Durs = { 4, 4, 4, 4, 4, 4 }
buff.MaxStack = 4

function buff:OnAdd()
    local unit = self.Owner
    if (self.Effect ~= nil) then
        DestroyEffect(self.Effect)
    end
    self.Effect = AddSpecialEffectTarget(mTargetArt, unit.Entity, "overhead")
end

function buff:OnRemove()
    if (self.Effect ~= nil) then
        DestroyEffect(self.Effect)
    end
    local spellUnit = self.SpellUnit
    local ah19 = spellUnit:GetSkill(GetId("AH19"))
    if (spellUnit ~= nil and ah19 ~= nil) then
        local owner = self.Owner
        --属性
        local ad = spellUnit.Attribute:get("物理攻击") + spellUnit.Attribute:get("物理攻击加成")
        local damage = (mDamages1[ah19:GetCurLevel()] + ad * mDamages2[ah19:GetCurLevel()]) * 2
        damage = damage + damage * (self.Stack * 0.3)
        --伤害
        AssetsManager.OverlapCircle(
        owner:X(),
        owner:Y(),
        mRange,
        function(unit)
            DestroyEffect(AddSpecialEffectTarget(mSpecialArt, unit.Entity, "chest"))
            EXUnitDamageTarget(spellUnit, unit, damage, EXAbilityType.Magic)
        end
        )
    end
end

function buff:AddStack()
    if (self.Stack < self.MaxStack) then
        self.Stack = self.Stack + 1
        self:OnAdd()
    else
        self.Owner:RemoveBuff(self.Name)
    end
end

function skill:OnCast()
    local spellTargetUnit = GetJ_EnemyUnits(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("爆炸火花-丢失单位")
        return
    end
    local bf = spellTargetUnit:AddBuff("爆炸火花", self:GetCurLevel())
    bf.SpellUnit = self.Owner
end

function skill:OnAttack(attactUnit, defUnit, isCrit)
    local bf = defUnit:GetBuff("爆炸火花")
    if (bf ~= nil) then
        defUnit:AddBuff("爆炸火花", self:GetCurLevel())
    end
end

function skill:OnKill(dieUnit)
    if (GameScene.Elapsed - self.LastTime < 0.1) then
        return
    end
    self.LastTime = GameScene.Elapsed
    local spellUnit = self.Owner
    --属性
    local ad = spellUnit.Attribute:get("物理攻击") + spellUnit.Attribute:get("物理攻击加成")
    local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
    --伤害
    AssetsManager.OverlapCircle(
    dieUnit:X(),
    dieUnit:Y(),
    mRange,
    function(unit)
        DestroyEffect(AddSpecialEffectTarget(mSpecialArt, unit.Entity, "chest"))
        EXUnitDamageTarget(spellUnit, unit, damage, EXAbilityType.Magic)
    end
    )
end