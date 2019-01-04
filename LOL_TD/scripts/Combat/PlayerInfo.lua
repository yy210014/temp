PlayerInfo = {}
local mPlayers = { Count = 0 }
local mt = {}
mt.Worke = nil

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
    newPlayer.Score = 0
    mPlayers[newPlayer.Id + 1] = newPlayer
    mPlayers.Count = mPlayers.Count + 1
    return newPlayer
end

function PlayerInfo:Kill(entity)
    local index = GetPlayerId(entity) + 1
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
        player.MonsterCount = player.MonsterCount - 1
        Multiboard.ShowMonsterCount(player.MonsterCount, GetPlayerId(entity) + 1)
    end
end

function PlayerInfo.AddScore(entity, score)
    local index = GetPlayerId(entity) + 1
    local player = mPlayers[index]
    player.Score = player.Score + score
    Multiboard.ShowScore(index, player.Score)
end

function PlayerInfo:AddMonsterCount(entity)
    local index = GetPlayerId(entity) + 1
    local player = mPlayers[index]
    player.MonsterCount = player.MonsterCount + 1
    Multiboard.ShowMonsterCount(player.MonsterCount, index)
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
        for i = #mPlayers, 1, -1 do
            if (mPlayers[i] ~= nil) then
                call(mPlayers[i])
            end
        end
    end
end