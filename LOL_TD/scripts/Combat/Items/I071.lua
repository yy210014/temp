local item = Items["大圣杯"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", 120)
    unit.Attribute:add("冷却缩减", 0.15)
    unit.Attribute:add("魔法恢复", 15)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -120)
    unit.Attribute:add("冷却缩减", -0.15)
    unit.Attribute:add("魔法恢复", -15)
end

function item:OnKill(dieUnit)
    --每击杀1个敌人回复自身最大法力值的1%
    local unit = self.Owner
    unit.Attribute:add("魔法值", unit.Attribute:get("魔法上限") * 0.01)
    DestroyEffect(
        AddSpecialEffectTarget("Abilities\\Spells\\Undead\\ReplenishMana\\SpiritTouchTarget.mdl", unit.Entity, "chest")
    )
end
