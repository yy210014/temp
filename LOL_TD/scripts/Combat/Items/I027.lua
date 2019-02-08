local item = Items["电刀"]
item.Count = 0
item.Count2 = 0
local mRange = 1200
local mMaxNum = 7

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", 0.4)
    unit.Attribute:add("暴击", 0.15)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", -0.4)
    unit.Attribute:add("暴击", -0.15)
end

function item:OnAttack(attactUnit, defUnit)
    --每7次攻击会触发闪电效果，对每个目标造成1250点法术伤害
    self.Count = self.Count + 1
    if self.Count >= 7 then
        self.Count = 0
        self.Count2 = 0
        AssetsManager.OverlapCircle(
            defUnit:X(),
            defUnit:Y(),
            mRange,
            function(unit)
                if (self.Count2 <= mMaxNum) then
                    self.Count2 = self.Count2 + 1
                    EXUnitDamageTarget(attactUnit, unit, 1250, EXDamageType.Magic)
                    DestroyEffect(
                        AddSpecialEffectTarget(
                            "Abilities\\Spells\\Items\\AIlb\\AIlbSpecialArt.mdl",
                            unit.Entity,
                            "chest"
                        )
                    )
                end
            end
        )
    end
    self:SetCharges(self.Count)
end
