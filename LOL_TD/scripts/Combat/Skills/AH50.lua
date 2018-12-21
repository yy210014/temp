local skill = Skills["撕裂"]
local mDamages1 = {20, 40, 60, 80, 120, 140}
local mDamages2 = {0.6, 0.6, 0.6, 0.6, 0.6, 0.6}
local mDamageRange = 1200

function skill:OnCast()
    local spellUnit = self.Owner
    AssetsManager.OverlapCircle(
        spellUnit:X(),
        spellUnit:Y(),
        mDamageRange,
        function(unit)
            if (unit:ContainBuff("撕裂")) then
                local buff = unit:GetBuff("撕裂")
                local maxStack = buff.MaxStack
                local ad = spellUnit.Attribute:get("物理攻击") + spellUnit.Attribute:get("物理攻击加成")
                local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
                unit:RemoveBuff("撕裂")
                EXUnitDamageTarget(spellUnit, unit, damage * maxStack, EXDamageType.Physics)
            end
        end
    )
end

function skill:OnAttack(attactUnit, defUnit)
    defUnit:AddBuff("撕裂")
end
