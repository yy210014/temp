local item = Items["九头蛇"]
local mRange = 600
local mArt = "AZ_ShockWave01.mdl"
function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 40)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -40)
end

function item:OnAttack(attactUnit, defUnit)
    if (0 ~= EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_RANGED)) then
        --远程伤害返回
        return
    end
    DestroyEffect(AddSpecialEffectTarget(mArt, attactUnit.Entity, "origin"))
    AssetsManager.OverlapCircle(
    attactUnit:X(),
    attactUnit:Y(),
    mRange,
    function(unit)
        if (unit ~= defUnit) then
            local damage = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
            EXUnitDamageTarget(attactUnit, unit, damage * 0.6, EXAbilityType.Physics)
        end
    end
    )
end