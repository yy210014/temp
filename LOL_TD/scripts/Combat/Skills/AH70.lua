local skill = Skills["影奥义！鬼斩"]
skill.SkillType = 0
local mDamages1 = {100, 200, 300, 400, 500, 600}
local mDamages2 = {0.8, 0.8, 0.8, 0.8, 0.8, 0.8}
local mRange = 600

setmetatable(Buffs["鬼斩"], {__index = Buffs["移速"]})
Buffs["鬼斩"].values = {-0.2, -0.25, -0.3, -0.35, -0.4, -0.45}
Buffs["鬼斩"].Durs = {1.5, 1.5, 1.5, 1.5, 1.5, 1.5}

function skill:OnSpellChannel()
    local spellUnit = self.Owner
    local ah69 = spellUnit:GetSkill(GetId("AH69"))
    if (ah69 ~= nil and ah69.dummy ~= nil and self.Owner.Id ~= GetId("uq06")) then
        IssueImmediateOrder(ah69.dummy.Entity, self.Order)
    end
end

function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.Id == GetId("uq06")) then
        spellUnit = spellUnit.Owner
    end
    AssetsManager.OverlapCircle(
        self.Owner:X(),
        self.Owner:Y(),
        600,
        function(unit)
            if (self.Owner.Id == GetId("uq06")) then
                unit:AddBuff("鬼斩")
            end
            local ad = spellUnit.Attribute:get("物理攻击") + spellUnit.Attribute:get("物理攻击加成")
            local damage = mDamages1[self:GetCurLevel()] + ad * mDamages2[self:GetCurLevel()]
            --伤害
            EXUnitDamageTarget(spellUnit, unit, damage, EXAbilityType.Physics_Ability)
        end
    )
end

--[[Researchubertip = "劫和他的影分身进行斩击，对附近的敌人造成物理伤害。
|n被影分身的斩击所击中的敌人，将会被减速，持续1.5秒。消耗30点能量。CD5s
|n1级：造成100+0.8*物理攻击的物理伤害。减速20%
|n2级：造成200+0.8*物理攻击的物理伤害。减速25%
|n3级：造成300+0.8*物理攻击的物理伤害。减速30%
|n4级：造成400+0.8*物理攻击的物理伤害。减速35%
|n5级：造成500+0.8*物理攻击的物理伤害。减速40%
|n6级：造成600+0.8*物理攻击的物理伤害。减速45%"]]
