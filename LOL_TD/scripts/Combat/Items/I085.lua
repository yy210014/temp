local item = Items["吸蓝刀"]
local mArt = "Abilities\\Spells\\Undead\\ReplenishMana\\SpiritTouchTarget.mdl"

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 85)
    unit.Attribute:add("魔法上限", 400)
    unit.Attribute:add("冷却缩减", 0.2)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -85)
    unit.Attribute:add("魔法上限", -400)
    unit.Attribute:add("冷却缩减", -0.2)
end

function item:OnAttack(attactUnit, defUnit)
    local mana = attactUnit.Attribute:get("魔法值")
    local maxMana = attactUnit.Attribute:get("魔法上限")
    attactUnit.Attribute:add("魔法值", (maxMana - mana) * 0.01)
    DestroyEffect(AddSpecialEffectTarget(mArt, attactUnit.Entity, "chest"))
end