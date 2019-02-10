Attribute = {}
Attribute.__index = Attribute
Attribute.Owner = nil

-- 资源相关
-- 能量类型
Attribute.resource_type = "魔法"

--ap
Attribute.Ap = 0
--物理穿透
Attribute.AdPenetrate = 0
--法术穿透
Attribute.APPenetrate = 0
--冷却缩减
Attribute.Cooldown = 0
--冷却缩减上限（默认最高40%）
Attribute.CooldownMax = 0.4
--暴击率（最高100%）
Attribute.Crit = 0
--暴击伤害
Attribute.CritDamage = 2
--ad伤害加成
Attribute.ADDamage = 1
--ap伤害加成
Attribute.APDamage = 1
--回蓝速度/s
Attribute.RegenMana = 0
--移动速度加成
Attribute.MoveSpeed = 0

local attribute = {
    ["物理攻击"] = true, --ad(基础攻击)
    ["物理攻击加成"] = true, --ad加成
    ["物理伤害加成"] = true, --ad伤害加成
    ["法术攻击"] = true,
    ["法术伤害加成"] = true, --ap伤害加成
    ["物理穿透"] = true,
    ["法术穿透"] = true,
    ["攻击速度"] = true,
    ["移动速度加成"] = true,
    ["魔法恢复"] = true, --回蓝速度/s
    ["冷却缩减"] = true,
    ["冷却缩减上限"] = true,
    ["暴击"] = true, --（最高100%）
    ["暴击伤害"] = true,
    ["生命"] = true,
    ["生命上限"] = true,
    ["魔法值"] = true,
    ["魔法上限"] = true,
    ["能量值"] = true,
    ["攻击范围"] = true,
    ["怒气值"] = true,
    ["护甲"] = true
}

local set = {}
local get = {}

function Attribute:New(owner)
    local newAtt = {}
    setmetatable(newAtt, { __index = Attribute })
    newAtt.Owner = owner
    return newAtt
end

function Attribute:add(name, value)
    if not attribute[name] then
        Game.LogError("错误的属性名:" .. tostring(name))
        return
    end
    self:set(name, get[name](self) + value)
end

function Attribute:set(name, value)
    if not attribute[name] then
        Game.LogError("错误的属性名:" .. tostring(name))
        return
    end
    if set[name] then
        set[name](self, value)
    end
end

function Attribute:get(name)
    if not attribute[name] then
        error("错误的属性名:" .. tostring(name))
        return
    end
    return get[name](self)
end

get["物理攻击"] = function(self)
    return GetUnitState(self.Owner.Entity, ConvertUnitState(18))
end

set["物理攻击"] = function(self, value)
    SetUnitState(self.Owner.Entity, ConvertUnitState(18), Misc.Clamp(value, 0, value))
end

get["物理攻击加成"] = function(self)
    return GetUnitState(self.Owner.Entity, ConvertUnitState(19))
end

set["物理攻击加成"] = function(self, value)
    SetUnitState(self.Owner.Entity, ConvertUnitState(19), Misc.Clamp(value, 0, value))
end

get["物理伤害加成"] = function(self)
    return self.ADDamage
end

set["物理伤害加成"] = function(self, value)
    self.ADDamage = Misc.Clamp(value, 1, value)
end

get["法术攻击"] = function(self)
    return Misc.Clamp(self.Ap, 0, self.Ap)
end

set["法术攻击"] = function(self, value)
    if (IsUnitType(self.Owner.Entity, UNIT_TYPE_HERO) == false) then
        return
    end
    self.Ap = Misc.Clamp(value, 0, value)
    SetHeroStr(self.Owner.Entity, self.Ap, true)
end

get["法术伤害加成"] = function(self)
    return self.APDamage
end

set["法术伤害加成"] = function(self, value)
    self.APDamage = Misc.Clamp(value, 1, value)
end

get["物理穿透"] = function(self)
    return Misc.Clamp(self.AdPenetrate, 0, 1)
end

set["物理穿透"] = function(self, value)
    self.AdPenetrate = Misc.Clamp(value, 0, 1)
end

get["法术穿透"] = function(self)
    return Misc.Clamp(self.APPenetrate, 0, self.APPenetrate)
end

set["法术穿透"] = function(self, value)
    self.APPenetrate = Misc.Clamp(value, 0, value)
end

get["攻击范围"] = function(self)
    return GetUnitState(self.Owner.Entity, ConvertUnitState(22))
end

set["攻击范围"] = function(self, value)
    SetUnitState(self.Owner.Entity, ConvertUnitState(22), Misc.Clamp(value, 0, value))
end

get["护甲"] = function(self)
    return GetUnitState(self.Owner.Entity, ConvertUnitState(32))
end

set["护甲"] = function(self, value)
    SetUnitState(self.Owner.Entity, ConvertUnitState(32), value)
end

get["攻击速度"] = function(self)
    return GetUnitState(self.Owner.Entity, ConvertUnitState(81))
end

set["攻击速度"] = function(self, value)
    SetUnitState(self.Owner.Entity, ConvertUnitState(81), Misc.Clamp(value, 0, value))
end

get["移动速度加成"] = function(self)
    return self.MoveSpeed
end

set["移动速度加成"] = function(self, value)
    self.MoveSpeed = value
    SetUnitMoveSpeed(self.Owner.Entity, Misc.Clamp(GetUnitDefaultMoveSpeed(self.Owner.Entity) + value, 0, 522))
end

get["生命"] = function(self)
    return GetUnitState(self.Owner.Entity, UNIT_STATE_LIFE)
end

set["生命"] = function(self, value)
    SetUnitState(self.Owner.Entity, UNIT_STATE_LIFE, Misc.Clamp(value, 0, value))
end

get["生命上限"] = function(self)
    return GetUnitState(self.Owner.Entity, UNIT_STATE_MAX_LIFE)
end

set["生命上限"] = function(self, value)
    SetUnitState(self.Owner.Entity, UNIT_STATE_MAX_LIFE, Misc.Clamp(value, 0, value))
end

get["魔法值"] = function(self)
    return GetUnitState(self.Owner.Entity, UNIT_STATE_MANA)
end

set["魔法值"] = function(self, value)
    if (self.Owner.ManaType ~= 0 or value < 0) then
        return
    end
    SetUnitState(self.Owner.Entity, UNIT_STATE_MANA, Misc.Clamp(value, 0, value))
end

get["魔法上限"] = function(self)
    return GetUnitState(self.Owner.Entity, UNIT_STATE_MAX_MANA)
end

set["魔法上限"] = function(self, value)
    if (self.Owner.ManaType ~= 0) then
        return
    end
    local premana = get["魔法值"](self)
    local preMaxmana = get["魔法上限"](self)
    local laterMaxmana = Misc.Clamp(value, 0, value)
    SetUnitState(self.Owner.Entity, UNIT_STATE_MAX_MANA, laterMaxmana)
    self:set("魔法值", premana + premana / preMaxmana * (laterMaxmana - preMaxmana))
end

get["魔法恢复"] = function(self)
    return Misc.Clamp(self.RegenMana, 0, self.RegenMana)
end

set["魔法恢复"] = function(self, value)
    self.RegenMana = Misc.Clamp(value, 0, value)
end

get["能量值"] = function(self)
    return Misc.Clamp(GetUnitState(self.Owner.Entity, UNIT_STATE_MANA), 0, 100)
end

set["能量值"] = function(self, value)
    if (self.Owner.ManaType ~= 1 or value - get["能量值"](self) <= 0) then
        return
    end
    SetUnitState(self.Owner.Entity, UNIT_STATE_MANA, Misc.Clamp(value, 0, 100))
end

get["怒气值"] = function(self)
    return Misc.Clamp(GetUnitState(self.Owner.Entity, UNIT_STATE_MANA), 0, 100)
end

set["怒气值"] = function(self, value)
    value = Misc.Clamp(value, 0, 100)
    if (self.Owner.ManaType ~= 2 or value == get["怒气值"](self)) then
        return
    end
    GameEventProc.SendEvent("任意单位怒气值改变", self.Owner, value - get["怒气值"](self))
    SetUnitState(self.Owner.Entity, UNIT_STATE_MANA, value)
end

get["冷却缩减"] = function(self)
    return Misc.Clamp(self.Cooldown, 0, self.CooldownMax)
end

set["冷却缩减"] = function(self, value)
    if (IsUnitType(self.Owner.Entity, UNIT_TYPE_HERO) == false) then
        return
    end
    self.Cooldown = Misc.Clamp(value, 0, self.CooldownMax)
    SetHeroInt(self.Owner.Entity, self.Cooldown * 100, true)
    self.Owner:UpdateSkillCD()
end

get["冷却缩减上限"] = function(self)
    return self.CooldownMax
end

set["冷却缩减上限"] = function(self, value)
    self.CooldownMax = value
end

get["暴击"] = function(self)
    return Misc.Clamp(self.Crit, 0, 1)
end

set["暴击"] = function(self, value)
    if (IsUnitType(self.Owner.Entity, UNIT_TYPE_HERO) == false) then
        return
    end
    self.Crit = Misc.Clamp(value, 0, 1)
    SetHeroAgi(self.Owner.Entity, math.floor(self.Crit * 100), true)
end

get["暴击伤害"] = function(self)
    return self.CritDamage
end

set["暴击伤害"] = function(self, value)
    self.CritDamage = value
end