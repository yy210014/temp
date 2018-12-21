AssetsManager = {}

local mPlayerTeamUnits = {{}, {}, {}, {}}
local mEnemyTeamUnits = {}
local mDefUnitFacing = 270
local mJ_Units = {}
local mDyingUnits = {}

function GetJ_Units(unit)
    for i = #mJ_Units, 1, -1 do
        if (mJ_Units[i].Entity == unit) then
            return mJ_Units[i]
        end
    end
    return nil
end

function GetJ_DyingUnits()
    return mDyingUnits
end

function GetPlayerTeamUnits(playerId)
    return mPlayerTeamUnits[playerId + 1]
end

function GetEnemyTeamUnits()
    return mEnemyTeamUnits
end

function AssetsManager.LoadUnit(player, id, x, y)
    local entity = CreateUnit(player, GetId(id), x, y, mDefUnitFacing)
    local unit = Unit:New(entity)
    if (unit.FactionId == PlayerTeamFactionId) then
        mPlayerTeamUnits[GetPlayerId(player) + 1][#mPlayerTeamUnits[GetPlayerId(player) + 1] + 1] = unit
    else
        mEnemyTeamUnits[#mEnemyTeamUnits + 1] = unit
    end
    mJ_Units[#mJ_Units + 1] = unit

    local trig = CreateTrigger()
    TriggerRegisterUnitEvent(trig, entity, EVENT_UNIT_DAMAGED)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitDamaged()
        end
    )
    unit.Trigger = trig
    trig = nil
    return unit
end

function AssetsManager.LoadUnitAtLoc(player, id, point)
    local entity = CreateUnitAtLoc(player, GetId(id), point, mDefUnitFacing)
    local unit = Unit:New(entity)
    if (unit.FactionId == PlayerTeamFactionId) then
        mPlayerTeamUnits[GetPlayerId(player) + 1][#mPlayerTeamUnits[GetPlayerId(player) + 1] + 1] = unit
    else
        mEnemyTeamUnits[#mEnemyTeamUnits + 1] = unit
    end
    mJ_Units[#mJ_Units + 1] = unit
    local trig = CreateTrigger()
    TriggerRegisterUnitEvent(trig, entity, EVENT_UNIT_DAMAGED)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitDamaged()
        end
    )
    unit.Trigger = trig
    trig = nil
    return unit
end

function AssetsManager.LoadEntity(entity)
    local unit = Unit:New(entity)
    if (unit.FactionId == PlayerTeamFactionId) then
        mPlayerTeamUnits[GetPlayerId(unit.Player) + 1][#mPlayerTeamUnits[GetPlayerId(unit.Player) + 1] + 1] = unit
    else
        mEnemyTeamUnits[#mEnemyTeamUnits + 1] = unit
    end
    mJ_Units[#mJ_Units + 1] = unit
    local trig = CreateTrigger()
    TriggerRegisterUnitEvent(trig, entity, EVENT_UNIT_DAMAGED)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitDamaged()
        end
    )
    unit.Trigger = trig
    trig = nil
    return unit
end

local function DestroyPlayerObject(unit, destroy)
    if (unit.Trigger ~= nil) then
        DestroyTrigger(unit.Trigger)
    end

    for i = #mPlayerTeamUnits[GetPlayerId(unit.Player) + 1], 1, -1 do
        if (mPlayerTeamUnits[GetPlayerId(unit.Player) + 1][i] == unit) then
            table.remove(mPlayerTeamUnits[GetPlayerId(unit.Player) + 1], i)
            break
        end
    end
    for i = #mJ_Units, 1, -1 do
        if (mJ_Units[i] == unit) then
            table.remove(mJ_Units, i)
            break
        end
    end
    unit:Destroy(destroy)
    if (destroy == false) then
        mDyingUnits[#mDyingUnits + 1] = unit
    end
end

local function DestroyEnemyObject(unit, destroy)
    if (unit.Trigger ~= nil) then
        DestroyTrigger(unit.Trigger)
        unit.Trigger = nil
    end
    for i = #mEnemyTeamUnits, 1, -1 do
        if (mEnemyTeamUnits[i] == unit) then
            table.remove(mEnemyTeamUnits, i)
            break
        end
    end
    for i = #mJ_Units, 1, -1 do
        if (mJ_Units[i] == unit) then
            table.remove(mJ_Units, i)
            break
        end
    end
    unit:Destroy(destroy)
    if (destroy == false) then
        mDyingUnits[#mDyingUnits + 1] = unit
    end
end

function AssetsManager.RemoveObject(unit)
    if (unit.FactionId == PlayerTeamFactionId) then
        DestroyPlayerObject(unit, false)
    else
        DestroyEnemyObject(unit, false)
    end
end

function AssetsManager.DestroyObject(unit)
    if (unit.FactionId == PlayerTeamFactionId) then
        DestroyPlayerObject(unit, true)
    else
        DestroyEnemyObject(unit, true)
    end
end

function AssetsManager.OnGameUpdate(dt)
    for i = #mJ_Units, 1, -1 do
        if (mJ_Units[i] ~= nil) then
            mJ_Units[i]:OnGameUpdate(dt)
        end
    end

    for i = #mDyingUnits, 1, -1 do
        if (mDyingUnits[i] ~= nil) then
            mDyingUnits[i]:OnDyingUpdate(dt)
            mDyingUnits[i].LifeDt = mDyingUnits[i].LifeDt + dt
            if (mDyingUnits[i].LifeDt >= mDyingUnits[i].DieTime) then
                mDyingUnits[i]:Destroy(true)
                table.remove(mDyingUnits, i)
            end
        end
    end
end

function AssetsManager.IterateUnits(call)
    for i = #mJ_Units, 1, -1 do
        if (mJ_Units[i] ~= nil) then
            if (mJ_Units[i].IsDying == false) then
                call(mJ_Units[i])
            end
        end
    end
end

function AssetsManager.IteratePlayerUnits(playerId, call)
    for i = #mPlayerTeamUnits[playerId + 1], 1, -1 do
        if (mPlayerTeamUnits[playerId + 1][i] ~= nil) then
            if (mPlayerTeamUnits[playerId + 1][i].IsDying == false) then
                call(mPlayerTeamUnits[playerId + 1][i])
            end
        end
    end
end

function AssetsManager.IterateEnemyUnits(call)
    for i = #mEnemyTeamUnits, 1, -1 do
        if (mEnemyTeamUnits[i] ~= nil) then
            if (mEnemyTeamUnits[i].IsDying == false) then
                call(mEnemyTeamUnits[i])
            end
        end
    end
end

function AssetsManager.OverlapRandom(x1, y1, radius)
    if (#mEnemyTeamUnits == 0) then
        return nil
    end
    local list = {}
    for i = #mEnemyTeamUnits, 1, -1 do
        if (mEnemyTeamUnits[i] ~= nil) then
            local dist = DistanceBetweenPoint(x1, mEnemyTeamUnits[i]:X(), y1, mEnemyTeamUnits[i]:Y())
            if (dist < radius and mEnemyTeamUnits[i].IsDying == false) then
                list[#list + 1] = mEnemyTeamUnits[i]
            end
        end
    end
    local unit = list[math.random(1, #list)]
    list = nil
    return unit
end

function AssetsManager.OverlapLine(x1, y1, dis, rng, angle, call)
    for i = #mEnemyTeamUnits, 1, -1 do
        if (mEnemyTeamUnits[i] ~= nil) then
            local x2 = x1 + dis * math.cos(angle)
            local y2 = y1 + dis * math.sin(angle)
            local x, y = (x1 + x2) / 2, (y1 + y2) / 2
            local r = dis / 2
            local dist1 = DistanceBetweenPoint(x, mEnemyTeamUnits[i]:X(), y, mEnemyTeamUnits[i]:Y())
            if (dist1 < r and mEnemyTeamUnits[i].IsDying == false) then --先选一个圆
                local a, b = y1 - y2, x2 - x1
                local c = -a * x1 - b * y1
                local l = (a * a + b * b) ^ 0.5
                local w = rng / 2
                local dist2 = math.abs(a * mEnemyTeamUnits[i]:X() + b * mEnemyTeamUnits[i]:Y() + c) / l
                if (dist2 <= w) then
                    call(mEnemyTeamUnits[i])
                end
            end
        end
    end
end

function AssetsManager.OverlapCircle(x1, y1, radius, call)
    for i = #mEnemyTeamUnits, 1, -1 do
        if (mEnemyTeamUnits[i] ~= nil) then
            local dist = DistanceBetweenPoint(x1, mEnemyTeamUnits[i]:X(), y1, mEnemyTeamUnits[i]:Y())
            if (dist < radius and mEnemyTeamUnits[i].IsDying == false) then
                call(mEnemyTeamUnits[i])
            end
        end
    end
end

function AssetsManager.OverlapBox()
    for i, v in ipairs(mEnemyTeamUnits) do
        if (v.IsDying == false) then
        -- call(v)
        end
    end
end

function AssetsManager.OverlapSector()
    for i, v in ipairs(mEnemyTeamUnits) do
        if (v.IsDying == false) then
        -- call(v)
        end
    end
end
