require "scripts.Common.Base64"

PlayerInfo = {}
local mPlayers = {}
local mt = {}
mt.Worke = nil

jfType = { Score = 200, VIP = 201, gh01 = 301, gh02 = 302, cb01 = 401, cb02 = 402, pf01 = 501 }
local JFItem = {
    --{ jfType.VIP, "aeger", "R006", 0 },
    { jfType.gh01, "wqe2", GetId("R006"), 300, Jglobals.udg_ghTimer },
    { jfType.gh02, "sdger", GetId("R007"), 800, Jglobals.udg_ghTimer },
    { jfType.cb01, "sdxsqq", GetId("R008"), 500, Jglobals.udg_cbTimer },
    { jfType.cb02, "235rf", GetId("R009"), 1000, Jglobals.udg_cbTimer },
    { jfType.pf01, "t4werw", GetId("R010"), 1500, Jglobals.udg_pfTimer },
}

function mt:New(player)
    local newPlayer = {}
    setmetatable(newPlayer, { __index = mt })
    newPlayer.Name = GetPlayerName(player)
    newPlayer.Entity = player
    newPlayer.Id = GetPlayerId(player)
    return newPlayer
end

function mt:CheckJFItem()
    for i = 1, #JFItem do
        local item = LoadStr(Jglobals.udg_table, self.Id + 1, JFItem[i][1])
        if (item ~= nil and item ~= "" and DecodeBase64(item) == JFItem[i][2]) then
            AddPlayerTechResearched(self.Entity, JFItem[i][3], 1)
        end
    end
end

function PlayerInfo:New(entity)
    local newPlayer = mt:New(entity)
    newPlayer.KillCount = 0
    newPlayer.MonsterCount = 0
    newPlayer.IsWatch = false

    --newPlayer.IsVIP = DecodeBase64(LoadStr(Jglobals.udg_table, GetPlayerId(entity), jfType.VIP)) == 1 and true or false
    local score = LoadStr(Jglobals.udg_table, GetPlayerId(entity) + 1, jfType.Score)
    if (score == nil or score == "") then
        newPlayer.Score = 0
    else
        score = tonumber(DecodeBase64(score))
        if (score == nil) then
            DisplayTextToPlayer(entity, 0, 0, "|cFFFF0000游戏积分异常，积分清零！|r")
            newPlayer.Score = 0
            SaveStr(Jglobals.udg_table, GetPlayerId(entity) + 1, jfType.Score, "")
            TimerStart(Jglobals.udg_jfTimer, 0.01, false, nil)
        else
            newPlayer.Score = score
        end
        --newPlayer.Score = tonumber(DecodeBase64(score))
    end
    newPlayer:CheckJFItem()
    DisplayTextToPlayer(entity, 0, 0, "当前游戏积分：" .. newPlayer.Score)
    mPlayers[#mPlayers + 1] = newPlayer
    return newPlayer
end

function GetJ_Player(entity)
    for i = #mPlayers, 1, -1 do
        if (mPlayers[i].Entity == entity) then
            return mPlayers[i]
        end
    end
    return nil
end

function PlayerInfo:Kill(killUnit, dieUnit)
    local index = GetPlayerId(killUnit.Player) + 1
    local player = GetJ_Player(killUnit.Player)
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
        player = GetJ_Player(Player(index - 1))
        player.MonsterCount = player.MonsterCount - 1
        Multiboard.ShowMonsterCount(player.MonsterCount, index)
    end
end

function PlayerInfo:GetScore(entity)
    local player = GetJ_Player(entity)
    if (player ~= nil) then
        return player.Score
    end
    return 0
end

function PlayerInfo.AddScore(entity, score)
    local index = GetPlayerId(entity) + 1
    local player = GetJ_Player(entity)
    if (score > 0) then
        if (Game.GetMode() == GameMode.ENDLESS and Game.GetLevel() == 4) then
            score = score * 2
        end
        if (player.IsVIP) then
            score = score * 2
        end
    end
    player.Score = player.Score + score

    SaveStr(Jglobals.udg_table, GetPlayerId(entity) + 1, jfType.Score, EncodeBase64(tostring(player.Score)))
    TimerStart(Jglobals.udg_jfTimer, 0.01, false, nil)
    if (Game.GetMode() == GameMode.ENDLESS) then
        Multiboard.ShowScore(index, player.Score)
    end
end

function PlayerInfo:AddMonsterCount(entity)
    local index = GetPlayerId(entity) + 1
    local player = GetJ_Player(entity)
    player.MonsterCount = player.MonsterCount + 1
    Multiboard.ShowMonsterCount(player.MonsterCount, index)
end

function PlayerInfo:IsVIP(entity)
    local player = GetJ_Player(entity)
    if (player ~= nil) then
        return player.IsVIP
    end
    return false
end

function PlayerInfo:EnableVIP(entity)
    local index = GetPlayerId(entity) + 1
    local player = GetJ_Player(entity)
    player.IsVIP = true
    AddPlayerTechResearched(entity, GetId("R011"), 1)
    --SaveStr(Jglobals.udg_table, GetPlayerId(entity), jfType.VIP, EncodeBase64(tostring(player.VIP)))
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

function PlayerInfo:EnableJFItem(entity, type)
    for i = 1, #JFItem do
        if (JFItem[i][1] == type) then
            if (PlayerInfo:GetScore(entity) >= JFItem[i][4]) then
                PlayerInfo.AddScore(entity, -JFItem[i][4])
                AddPlayerTechResearched(entity, JFItem[i][3], 1)
                SaveStr(Jglobals.udg_table, GetPlayerId(entity) + 1, JFItem[i][1], EncodeBase64(JFItem[i][2]))
                TimerStart(JFItem[i][5], 0.01, false, nil)
                DisplayTextToAll("兑换皮肤成功,当前剩余积分：" .. self:GetScore(entity), Color.yellow)
            else
                DisplayTextToAll("积分不足兑换失败,当前剩余积分：" .. self:GetScore(entity), Color.yellow)
            end
        end
    end
end

function PlayerInfo:Player(id)
    return GetJ_Player(Player(id))
end

function PlayerInfo:Count()
    return #mPlayers
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