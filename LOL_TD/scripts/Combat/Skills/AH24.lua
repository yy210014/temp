local skill = Skills["无极剑道"]
skill.SkillType = 0
local mAttack = {20, 15, 15, 15, 15, 20}
local mDamages = {0.05, 0.10, 0.15, 0.20, 0.25, 0.30}

local buff = Buffs["无极剑道"]
buff.Durs = {5, 5, 5, 5, 5, 5}

function skill:OnCast()
    local unit = self.Owner
    unit:AddBuff("无极剑道", self:GetCurLevel())
end

function skill:OnLearned()
    self.Owner.Attribute:add("物理攻击加成", mAttack[self:GetCurLevel()])
end

function skill:OnAttack(attactUnit, defUnit)
    if (attactUnit:ContainBuff("无极剑道")) then
        local ad = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
        local damage = ad * mDamages[self:GetCurLevel()]
        EXUnitDamageTarget(attactUnit, defUnit, damage, EXDamageType.Real)
    end
end
