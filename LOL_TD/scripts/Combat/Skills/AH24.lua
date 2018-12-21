local skill = Skills["无极剑道"]
skill.SkillType = 0
local mAttack = {20, 10, 20, 20, 20, 30}
local mDamages = {0.1, 0.15, 0.2, 0.25, 0.3, 0.35}

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
