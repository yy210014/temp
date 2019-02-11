local jass = require "jass.common"
local japi = require "jass.japi"
local ai = require "jass.ai"
local console = require "jass.console"
local runtime = require "jass.runtime"

local setmetatable = setmetatable
local tostring = tostring
local debug = debug
local rawset = rawset
local rawget = rawget
local error = error

local mt = {}
function mt:__index(i)
    if i < 0 or i > 8191 then
        warning("数组索引越界:" .. i)
    end
    return rawget(self, "_default")
end

function mt:__newindex(i, v)
    if i < 0 then
        error("数组索引越界:" .. i)
    elseif i > 8191 then
        warning("数组索引越界:" .. i)
    end
    rawset(self, i, v)
end

function _native_(name)
    return _G[name] or japi[name] or jass[name] or ai[name]
end

function _array_(default)
    return setmetatable({ _default = default }, mt)
end

function _loop_()
    local i = 0
    return function()
        if i > 1000000 then
            error("循环次数太多")
        end
        i = i + 1
        return true
    end
end

--两个单位之间的距离
function DistanceBetweenUnits(u1, u2)
    local x1 = GetUnitX(u1)
    local x2 = GetUnitX(u2)
    local y1 = GetUnitY(u1)
    local y2 = GetUnitY(u2)
    return DistanceBetweenPoint(x1, x2, y1, y2)
end

function DistanceBetweenPoint(x1, x2, y1, y2)
    return math.sqrt((x1 - x2) ^ 2 + (y1 - y2) ^ 2)
end

--两个单位之间的角度,取值-180~180
function AngleBetweenUnits(u1, u2)
    return AngleBetweenPoint(GetUnitX(u1), GetUnitX(u2), GetUnitY(u1), GetUnitY(u2))
end

--两点之间的角度,取值-180~180
function AngleBetweenPoint(x1, x2, y1, y2)
    return math.deg(Atan2(y2 - y1, x2 - x1))
end

--插值运算
function Lerp(a, b, x)
    return a + x * (b - a)
end

--创建漂浮文字
function CreateDamageText(str, whichUnit, isCritDamage, color)
    local tt = CreateTextTag()
    local t1 = math.modf(str)
    local text = isCritDamage and t1 .. "!" or t1, isCritDamage and 0.03 or 0.022
    SetTextTagText(tt, text)
    SetTextTagPosUnit(tt, whichUnit, -5)
    SetTextTagColor(tt, color.r, color.g, color.b, color.a)
    local xvel = 0.05 * Cos(290 * (math.pi / 180))
    local yvel = 0.05 * Sin(290 * (math.pi / 180))
    SetTextTagVelocity(tt, xvel, yvel)
    SetTextTagPermanent(tt, false)
    SetTextTagFadepoint(tt, 0.6)

    local ydl_timer = CreateTimer()
    local index = 0
    TimerStart(
    ydl_timer,
    0.02,
    true,
    function()
        index = index + 1
        if (index > 30) then
            DestroyTextTag(tt)
            DestroyTimer(GetExpiredTimer())
        else
            if (index <= 15) then
                SetTextTagTextBJ(tt, text, 10 + index)
            else
                SetTextTagTextBJ(tt, text, 25 - (index - 15))
            end
        end
    end
    )
--[[    local xvel = 0.18 * Cos(90 * (math.pi / 180.0))
    local yvel = 0.18 * Sin(90 * (math.pi / 180.0))
    SetTextTagVelocity(tt, xvel, yvel)
    SetTextTagPermanent(tt, false)
    SetTextTagLifespan(tt, 1)
    SetTextTagFadepoint(tt, 1)]]
end

function CreateText(text, whichUnit, color)
    local tt = CreateTextTag()
    SetTextTagText(tt, text, 0.022)
    SetTextTagPosUnit(tt, whichUnit, 10)
    SetTextTagColor(tt, color.r, color.g, color.b, color.a)

    local xvel = 0.18 * Cos(90 * (math.pi / 180))
    local yvel = 0.18 * Sin(90 * (math.pi / 180))
    SetTextTagVelocity(tt, xvel, yvel)
    SetTextTagPermanent(tt, false)
    SetTextTagLifespan(tt, 1)
    SetTextTagFadepoint(tt, 1)
    tt = nil
end

function CreateGoldText(text, whichUnit)
    local tt = CreateTextTag()
    SetTextTagPosUnit(tt, whichUnit, -150)
    SetTextTagLifespan(tt, 2)
    SetTextTagFadepoint(tt, 1)
    SetTextTagColor(tt, 255, 220, 0, 255)
    SetTextTagVelocity(tt, 0, 0.03)
    SetTextTagText(tt, "+" .. math.modf(text), 0.024)
    SetTextTagPermanent(tt, false)
end

EXDamageType = {
    Physics = 1,
    Magic = 2,
    Real = 3
}

function EXGetDamageColor()
    if (EXGetDamageType() == EXDamageType.Magic) then
        return Color.Magenta
    elseif (EXGetDamageType() == EXDamageType.Real) then
        return Color.White
    end
    return Color.Red
end

function EXGetDamageType()
    local at = ConvertAttackType(EXGetEventDamageData(EVENT_DAMAGE_DATA_ATTACK_TYPE))
    local dt = ConvertDamageType(EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE))
    if (at == ATTACK_TYPE_HERO and dt == DAMAGE_TYPE_NORMAL) then
        return EXDamageType.Physics
    elseif (at == ATTACK_TYPE_MAGIC and dt == DAMAGE_TYPE_NORMAL) then
        return EXDamageType.Magic
    elseif (at == ATTACK_TYPE_CHAOS and dt == DAMAGE_TYPE_UNIVERSAL) then
        return EXDamageType.Real
    end
    return 0
end

function EXUnitDamageTarget(damageSource, target, damage, damageType)
    if (IsUnitAlly(damageSource.Entity, target.Player) == true or target.IsDying) then
        return
    end
    if (damageType == EXDamageType.Physics) then
        UnitDamageTarget(
        damageSource.Entity,
        target.Entity,
        damage,
        false,
        false,
        ATTACK_TYPE_HERO,
        DAMAGE_TYPE_NORMAL,
        WEAPON_TYPE_WHOKNOWS
        )
    elseif (damageType == EXDamageType.Magic) then
        UnitDamageTarget(
        damageSource.Entity,
        target.Entity,
        damage,
        false,
        false,
        ATTACK_TYPE_MAGIC,
        DAMAGE_TYPE_NORMAL,
        WEAPON_TYPE_WHOKNOWS
        )
    elseif (damageType == EXDamageType.Real) then
        UnitDamageTarget(
        damageSource.Entity,
        target.Entity,
        damage,
        false,
        false,
        ATTACK_TYPE_CHAOS,
        DAMAGE_TYPE_UNIVERSAL,
        WEAPON_TYPE_WHOKNOWS
        )
    end
end