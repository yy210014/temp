local skill = Skills["爆炸火花"]
skill.SkillType = 1
skill.DamageList = nil
skill.LastTime = 0
local mDamages1 = {60, 80, 120, 160, 240, 320}
local mDamages2 = {0.25, 0.3, 0.35, 0.4, 0.45, 0.5}
local mRange = 800
local mDelay = 4

local mSpecialArt = "Abilities\\Spells\\Other\\Volcano\\VolcanoDeath.mdl"
local mTargetArt = "Abilities\\Spells\\Other\\SoulBurn\\SoulBurnbuff.mdl"

function skill:OnCast()
    local spellTargetUnit = GetJ_EnemyUnits(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("爆炸火花-丢失单位")
        return
    end
    self.Target = spellTargetUnit
    self.CurAction = self.DelayExplosion
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
            EXUnitDamageTarget(spellUnit, unit, damage, EXDamageType.Magic)
        end
    )
end

function skill:OnRemove()
    if (GameScene.Elapsed - self.LastTime < 0.1) then
        return
    end
    self.LastTime = GameScene.Elapsed

    if (self.Target == nil) then
        --Game.LogError("爆炸火花-丢失单位") --如果怪兽被删除了技能还没引爆会报错，不管
        return
    end
    local spellUnit = self.Owner
    --属性
    local ad = spellUnit.Attribute:get("物理攻击") + spellUnit.Attribute:get("物理攻击加成")
    local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
    damage = damage * 2
    --伤害
    AssetsManager.OverlapCircle(
        self.Target:X(),
        self.Target:Y(),
        mRange,
        function(unit)
            DestroyEffect(AddSpecialEffectTarget(mSpecialArt, unit.Entity, "chest"))
            EXUnitDamageTarget(spellUnit, unit, damage, EXDamageType.Magic)
        end
    )
    self.Target = nil
end

skill.DelayExplosion = function(self, dt)
    self.TimeDt = self.TimeDt + dt
    if (self.TimeDt > mDelay or self.Target.IsDying) then
        self:OnFinish()
    end
end
