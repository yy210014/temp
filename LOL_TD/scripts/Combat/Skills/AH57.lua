local skill = Skills["生化弹幕"]
skill.Durs = {8, 8, 8, 8, 8, 8} --持续时间
skill.LastAttactRange = 0
local mAttactRange = {50, 100, 150, 200, 250, 300}
local mDamages1 = {2, 3, 4, 5, 6, 7}
local mDamages2 = {0.01, 0.01, 0.01, 0.01, 0.01, 0.01}

function skill:OnCast()
    local spellUnit = self.Owner
    spellUnit.Attribute:add("攻击范围", mAttactRange[self:GetCurLevel()])
end

function skill:OnAttack(attactUnit, defUnit)
    local ap = attactUnit.Attribute:get("法术攻击")
    local maxHp = defUnit.Attribute:get("生命上限")
    local damage = mDamages1[self:GetCurLevel()] + mDamages2[self:GetCurLevel()] * ap
    EXUnitDamageTarget(attactUnit, defUnit, damage, EXAbilityType.Magic)
end

function skill:OnRemove()
    local spellUnit = self.Owner
    spellUnit.Attribute:add("攻击范围", self.LastAttactRange)
end
