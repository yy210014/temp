AssetsManager = {}

local mPlayerTeamUnits = { {}, {}, {}, {} }
local mEnemyTeamUnits = { {}, {}, {}, {} }
local mDefUnitFacing = 270
local mDyingUnits = {}


function GetJ_PlayerUnits(entity)
    local playerId = GetPlayerId(GetOwningPlayer(entity))
    if (playerId > 3) then
        return nil
    end
    local list = mPlayerTeamUnits[playerId + 1]
    for i = #list, 1, -1 do
        if (list[i].Entity == entity) then
            return list[i]
        end
    end
    return nil
end

function GetJ_EnemyUnits(entity)
    local playerId = GetPlayerId(GetOwningPlayer(entity))
    if (playerId < 8) then
        return nil
    end
    local list = mEnemyTeamUnits[playerId - 7]
    if (list == nil) then
        Game.LogError("空list ， playerId：" .. playerId)
    end
    for i = #list, 1, -1 do
        if (list[i].Entity == entity) then
            return list[i]
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
        mEnemyTeamUnits[GetPlayerId(player) - 7][#mEnemyTeamUnits[GetPlayerId(player) - 7] + 1] = unit
    end

    local trig = CreateTrigger()
    TriggerRegisterUnitEvent(trig, entity, EVENT_UNIT_DAMAGED)
    TriggerAddAction(trig, GameStart.AnyUnitDamaged)
    unit.Trigger = trig
    return unit
end

function AssetsManager.LoadUnitAtLoc(player, id, point)
    local entity = CreateUnitAtLoc(player, GetId(id), point, mDefUnitFacing)
    if (entity == nil) then
        Game.Log("LoadUnitAtLoc id: " .. id)
    end
    local unit = Unit:New(entity)
    if (unit.FactionId == PlayerTeamFactionId) then
        mPlayerTeamUnits[GetPlayerId(player) + 1][#mPlayerTeamUnits[GetPlayerId(player) + 1] + 1] = unit
    else
        mEnemyTeamUnits[GetPlayerId(player) - 7][#mEnemyTeamUnits[GetPlayerId(player) - 7] + 1] = unit
    end
    local trig = CreateTrigger()
    TriggerRegisterUnitEvent(trig, entity, EVENT_UNIT_DAMAGED)
    TriggerAddAction(trig, GameStart.AnyUnitDamaged)
    unit.Trigger = trig
    return unit
end

function AssetsManager.LoadEntity(entity)
    local unit = Unit:New(entity)
    if (unit.FactionId == PlayerTeamFactionId) then
        mPlayerTeamUnits[GetPlayerId(unit.Player) + 1][#mPlayerTeamUnits[GetPlayerId(unit.Player) + 1] + 1] = unit
    else
        mEnemyTeamUnits[GetPlayerId(unit.player) - 7][#mEnemyTeamUnits[GetPlayerId(unit.player) - 7] + 1] = unit
    end
    local trig = CreateTrigger()
    TriggerRegisterUnitEvent(trig, entity, EVENT_UNIT_DAMAGED)
    TriggerAddAction(trig, GameStart.AnyUnitDamaged)
    unit.Trigger = trig
    return unit
end

local function DestroyPlayerObject(unit, destroy)
    if (unit.Trigger ~= nil) then
        DestroyTrigger(unit.Trigger)
        unit.Trigger = nil
    end

    for i = #mPlayerTeamUnits[GetPlayerId(unit.Player) + 1], 1, -1 do
        if (mPlayerTeamUnits[GetPlayerId(unit.Player) + 1][i] == unit) then
            table.remove(mPlayerTeamUnits[GetPlayerId(unit.Player) + 1], i)
            break
        end
    end
    unit:Destroy(destroy)
    if (destroy == false) then
        mDyingUnits[#mDyingUnits + 1] = unit
    else
        unit = nil
    end
end

local function DestroyEnemyObject(unit, destroy)
    if (unit.Trigger ~= nil) then
        DestroyTrigger(unit.Trigger)
        unit.Trigger = nil
    end
    for i = #mEnemyTeamUnits[GetPlayerId(unit.Player) - 7], 1, -1 do
        if (mEnemyTeamUnits[GetPlayerId(unit.Player) - 7][i] == unit) then
            table.remove(mEnemyTeamUnits[GetPlayerId(unit.Player) - 7], i)
            break
        end
    end
    unit:Destroy(destroy)
    if (destroy == false) then
        mDyingUnits[#mDyingUnits + 1] = unit
    else
        unit = nil
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
    for i = 1, #mPlayerTeamUnits do
        local list = mPlayerTeamUnits[i]
        for j = #list, 1, -1 do
            if (list[j] ~= nil) then
                list[j]:OnGameUpdate(dt)
            end
        end
    end

    for i = 1, #mEnemyTeamUnits do
        local list = mEnemyTeamUnits[i]
        for j = #list, 1, -1 do
            if (list[j] ~= nil) then
                list[j]:OnGameUpdate(dt)
            end
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
    for i = 1, #mEnemyTeamUnits do
        local list = mEnemyTeamUnits[i]
        for j = #list, 1, -1 do
            if (list[j] ~= nil and list[j].IsDying == false) then
                call(list[j])
            end
        end
    end
end

function AssetsManager.OverlapLine(x1, y1, dis, rng, angle, call)
    for i = 1, #mEnemyTeamUnits do
        local list = mEnemyTeamUnits[i]
        for j = #list, 1, -1 do
            if (list[j] ~= nil and list[j].IsDying == false) then
                local x2 = x1 + dis * math.cos(math.rad(angle))
                local y2 = y1 + dis * math.sin(math.rad(angle))
                local x, y = (x1 + x2) / 2, (y1 + y2) / 2
                local r = dis / 2
                local dist1 = DistanceBetweenPoint(x, list[j]:X(), y, list[j]:Y())
                if (dist1 < r) then --先选一个圆
                    local a, b = y1 - y2, x2 - x1
                    local c = -a * x1 - b * y1
                    local l = (a * a + b * b) ^ 0.5
                    local w = rng / 2
                    local dist2 = math.abs(a * list[j]:X() + b * list[j]:Y() + c) / l
                    if (dist2 <= w) then
                        call(list[j])
                    end
                end
            end
        end
    end
end

function AssetsManager.OverlapCircle(x1, y1, radius, call)
    for i = 1, #mEnemyTeamUnits do
        local list = mEnemyTeamUnits[i]
        for j = #list, 1, -1 do
            if (list[j] ~= nil and list[j].IsDying == false) then
                local dist = DistanceBetweenPoint(x1, list[j]:X(), y1, list[j]:Y())
                if (dist < radius) then
                    call(list[j])
                end
            end
        end
    end
end


--[[function AssetsManager.OverlapRandom(x1, y1, radius)
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
end]]