local skill = Skills["瞄准"]
local mDamages = {0.3, 0.4, 0.5, 0.6, 0.7, 0.8}
local mAttactRange = {100, 50, 50, 50, 50, 100}

function skill:OnCast()
end

function skill:OnLearned()
    self.Owner.Attribute:add("攻击范围", mAttactRange[self:GetCurLevel()])
end

function skill:OnAttack(attactUnit, defUnit)
    local ad = self.Owner.Attribute:get("物理攻击") + self.Owner.Attribute:get("物理攻击加成")
    local damage = mDamages[self:GetCurLevel()] * ad
    EXUnitDamageTarget(self.Owner, defUnit, damage, EXAbilityType.Physics)
end
