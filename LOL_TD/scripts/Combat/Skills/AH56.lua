local skill = Skills["断头台"]
local mDamages1 = {100, 200, 300, 400, 500, 600}
local mDamages2 = {0.6, 0.6, 0.6, 0.6, 0.6, 0.6}
local mArt = "Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl"

function skill:OnCast()
    local spellUnit = self.Owner
    local spellTargetUnit = GetJ_EnemyUnits(GetSpellTargetUnit())
    if (spellTargetUnit == nil) then
        Game.LogError("断头台-丢失单位")
        return
    end
    self.spellTargetUnit = spellTargetUnit
    local buff = spellTargetUnit:GetBuff("出血")
    local maxStack = buff ~= nil and buff.MaxStack or 0

    DestroyEffect(AddSpecialEffect(mArt, spellTargetUnit:X(), spellTargetUnit:Y()))
    local ad = self.Owner.Attribute:get("物理攻击") + self.Owner.Attribute:get("物理攻击加成")
    local damage = mDamages1[self:GetCurLevel()] + mDamages2[self:GetCurLevel()] * ad
    damage = damage + damage * maxStack * 0.2
    EXUnitDamageTarget(spellUnit, spellTargetUnit, damage, EXDamageType.Real)
end

function skill:OnRemove()
    if (self.spellTargetUnit.IsDying) then
        self:SubCD(self:GetBeginCD())
    end
    self.spellTargetUnit = nil
end
