local skill = Skills["无畏冲锋"]
skill.SkillType = 4
local mDamageRange = 300
local mDamages1 = { 50, 100, 200, 400, 600, 800 }
local mDamages2 = { 0.5, 0.6, 0.7, 0.8, 0.9, 1 }
local mArt = "Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl"

setmetatable(Buffs["无畏冲锋加速"], { __index = Buffs["攻速"] })
Buffs["无畏冲锋加速"].values = { 0.3, 0.35, 0.4, 0.45, 0.5, 0.55 }
Buffs["无畏冲锋加速"].Durs = { 5, 5, 5, 5, 5, 5 }

setmetatable(Buffs["无畏冲锋减速"], { __index = Buffs["移速"] })
Buffs["无畏冲锋减速"].values = {-0.3 }
Buffs["无畏冲锋减速"].Durs = { 3 }

skill.OnPathEnd = function(dummy)
    local owner = dummy.Owner
    local ad = owner.Attribute:get("物理攻击") + owner.Attribute:get("物理攻击加成")
    local self = dummy.Skill
    local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
    AssetsManager.OverlapCircle(
    dummy:X(),
    dummy:Y(),
    mDamageRange,
    function(unit)
        EXUnitDamageTarget(owner, unit, damage, EXDamageType.Physics)
        unit:AddBuff("无畏冲锋减速")
    end
    )
    DestroyEffect(AddSpecialEffect(mArt, dummy:X(), dummy:Y()))
    AssetsManager.DestroyObject(dummy)
end

function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit = GetJ_EnemyUnits(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("无畏冲锋-丢失单位")
        return
    end
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq01", spellUnit:X(), spellUnit:Y())
    dummy.Owner = spellUnit
    dummy.Skill = self
    local loc = dummy:AddLocomotion("冲锋")
    if (loc ~= nil) then
        loc:Start(spellTargetUnit, 20, self.OnPathEnd)
    end
    spellUnit:AddBuff("无畏冲锋加速", self:GetCurLevel())
end