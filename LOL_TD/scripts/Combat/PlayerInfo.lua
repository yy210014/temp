PlayerInfo = {}
local mPlayers = { Count = 0 }
local mt = {}
mt.Worke = nil

local jfType = { Score = 200, VIP = 201 }

function mt:New(player)
    local newPlayer = {}
    setmetatable(newPlayer, { __index = mt })
    newPlayer.Name = GetPlayerName(player)
    newPlayer.Entity = player
    newPlayer.Id = GetPlayerId(player)
    return newPlayer
end

function PlayerInfo:New(entity)
    local newPlayer = mt:New(entity)
    newPlayer.KillCount = 0
    newPlayer.MonsterCount = 0
    newPlayer.IsWatch = false
    newPlayer.IsVIP = LoadInteger(Jglobals.udg_table, GetPlayerId(entity), jfType.VIP) == 1 and true or false
    newPlayer.Score = LoadInteger(Jglobals.udg_table, GetPlayerId(entity), jfType.Score) or 0
    mPlayers[newPlayer.Id + 1] = newPlayer
    mPlayers.Count = mPlayers.Count + 1
    return newPlayer
end

function PlayerInfo:Kill(killUnit, dieUnit)
    local index = GetPlayerId(killUnit.Player) + 1
    local player = mPlayers[index]
    if (Game.GetMode() == GameMode.NORMAL) then
        player.KillCount = player.KillCount + 1
        if (player.KillCount % 100 == 0) then
            SetPlayerState(
            player.Entity,
            PLAYER_STATE_RESOURCE_LUMBER,
            GetPlayerState(player.Entity, PLAYER_STATE_RESOURCE_LUMBER) + 1
            )
            DisplayTextToAll(player.Name .. "杀怪满100个，奖励一个天赋点", Color.yellow)
        end
        Multiboard.ShowKillCount(index, player.KillCount)
        Multiboard.ShowMonsterCount(-1)
    elseif (Game.GetMode() == GameMode.ENDLESS) then
        index = GetPlayerId(dieUnit.Player) - 7
        player = mPlayers[index]
        player.MonsterCount = player.MonsterCount - 1
        Multiboard.ShowMonsterCount(player.MonsterCount, index)
    end
end

function PlayerInfo:GetScore(entity)
    local index = GetPlayerId(entity) + 1
    local player = mPlayers[index]
    return player.Score
end

function PlayerInfo.AddScore(entity, score)
    local index = GetPlayerId(entity) + 1
    local player = mPlayers[index]
    if (score > 0) then
        if (Game.GetMode() == GameMode.ENDLESS and Game.GetLevel() == 4) then
            score = score * 2
        end
        if (player.IsVIP) then
            score = score * 2
        end
    end
    player.Score = player.Score + score

    --DzAPI_Map_Ladder_SetStat(entity, "Sorce", tostring(player.Score))
    SaveStr(Jglobals.udg_table, GetPlayerId(entity), jfType.Score, player.Score)
    Multiboard.ShowScore(index, player.Score)
end

function PlayerInfo:AddMonsterCount(entity)
    local index = GetPlayerId(entity) + 1
    local player = mPlayers[index]
    player.MonsterCount = player.MonsterCount + 1
    Multiboard.ShowMonsterCount(player.MonsterCount, index)
end

function PlayerInfo:IsVIP(entity)
    local index = GetPlayerId(entity) + 1
    local player = mPlayers[index]
    return player.IsVIP
end

function PlayerInfo:EnableVIP(entity)
    local index = GetPlayerId(entity) + 1
    local player = mPlayers[index]
    player.IsVIP = true
    AddPlayerTechResearched(entity, GetId("R011"), 1)
    --DzAPI_Map_Ladder_SetStat(entity, "VIP", tostring(1))
    SaveStr(Jglobals.udg_table, GetPlayerId(entity), jfType.VIP, player.Score)
    local worke = Worke[GetPlayerId(entity)]
    local timer = CreateTimer()
    TimerStart(timer, 1, true,
    function()
        AssetsManager.OverlapCircle(
        worke:X(),
        worke:Y(),
        900,
        function(unit)
            EXUnitDamageTarget(worke, unit, 20, EXDamageType.Magic)
        end
        )
    end
    )
    UnitAddItem(worke.Entity, CreateItem(GetId("IB02"), worke:X(), worke:Y()))
end

function PlayerInfo:Player(id)
    local index = id + 1
    return mPlayers[index]
end

function PlayerInfo:Count()
    return mPlayers.Count
end

function PlayerInfo:IteratePlayer(call)
    if (mPlayers ~= nil) then
        for i = 1, #mPlayers do
            if (mPlayers[i] ~= nil) then
                call(mPlayers[i])
            end
        end
    end
end