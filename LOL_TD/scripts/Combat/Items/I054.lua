local item = Items["幕刃"]
item.mLastAttackTime = 0

setmetatable(Buffs["幕刃"], {__index = Buffs["移速"]})
Buffs["幕刃"].values = {-0.5}
Buffs["幕刃"].Durs = {2}


function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 110)
    unit.Attribute:add("冷却缩减", 0.1)
    unit.Attribute:add("物理穿透", 0.15)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -110)
    unit.Attribute:add("冷却缩减", -0.1)
    unit.Attribute:add("物理穿透", -0.15)
end

function item:OnAttack(attactUnit, defUnit)
    if (GetUnitState(defUnit.Entity, UNIT_STATE_LIFE) <= 0) then
        return
    end
    --每10s，使英雄的下次攻击附带300点物理伤害，并使目标减速50%
    if (GameScene.Elapsed - self.mLastAttackTime > 10) then
        self.mLastAttackTime = GameScene.Elapsed
        EXUnitDamageTarget(attactUnit, defUnit, 300, EXDamageType.Physics)
        defUnit:AddBuff("幕刃")
    end
end
