local skill = Skills["大杀四方"]
local mDamageRange = 500
local mDamages1 = {50, 150, 250, 350, 450, 550}
local mDamages2 = {1.1, 1.1, 1.1, 1.1, 1.1, 1.1}
local mArt = "6\\006.mdl"

function skill:OnCast()
    local spellUnit = self.Owner
    --  DestroyEffect(AddSpecialEffect(mArt, spellUnit:X(), spellUnit:Y()))
    AddSpecialEffect(mArt, spellUnit:X(), spellUnit:Y())
    AssetsManager.OverlapCircle(
        spellUnit:X(),
        spellUnit:Y(),
        mDamageRange,
        function(unit)
            local ad = spellUnit.Attribute:get("物理攻击") + spellUnit.Attribute:get("物理攻击加成")
            local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
            EXUnitDamageTarget(spellUnit, unit, damage, EXDamageType.Physics)
            local ah54 = spellUnit:GetSkill(GetId("AH54"))
            if (ah54 ~= nil) then
                --buff
                local buff = unit:AddBuff("出血", ah54:GetCurLevel())
                if (buff ~= nil) then
                    buff.AttactUnit = spellUnit
                    buff.values = {10, 20, 30, 40, 50, 60}
                end
            end
        end
    )
end
