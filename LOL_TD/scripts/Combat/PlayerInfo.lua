require "scripts.Common.Base64"

PlayerInfo = {}
local mPlayers = {}
local mt = {}
mt.Worke = nil

ItemType = {
    MapLevel = 100, GuildName = 101, Score = 200,
    jf_gh01 = 301, jf_gh02 = 302, jf_cb01 = 401, jf_cb02 = 402, jf_pf01 = 501, jf_pf02 = 502,
    map_gh01 = 1301, map_gh02 = 1302, map_cb01 = 1401, map_cb02 = 1402, map_pf01 = 1501, map_pf02 = 1502,
    VIP = 2000, HELP = 2001, PF_LOLI = 2002, GH_PHOENIX = 2003, CB_BLUE = 2004, JBLB = 2005, MTLB = 2006,
}
local mJFItem = {
    --{ ItemType.jf_VIP, "aeger", "R006", 0 },
    { ItemType.jf_gh01, "wqe2", GetId("R006"), 300, Jglobals.udg_ghTimer }, --轻盈之花
    { ItemType.jf_gh02, "sdger", GetId("R007"), 800, Jglobals.udg_ghTimer }, --五行之轮
    { ItemType.jf_cb01, "sdxsqq", GetId("R008"), 500, Jglobals.udg_cbTimer }, --红炎翅膀
    { ItemType.jf_cb02, "235rf", GetId("R009"), 1000, Jglobals.udg_cbTimer }, --暗紫翅膀
    { ItemType.jf_pf01, "t4werw", GetId("R010"), 1500, Jglobals.udg_pfTimer }, --火柴人
    { ItemType.jf_pf02, "bres", GetId("R021"), 3000, Jglobals.udg_pfTimer }, --小红帽
}
local mMapItem = {
    { ItemType.map_gh01, "dsher4", GetId("R013"), 3, Jglobals.udg_ghTimer }, --绿意怏然
    { ItemType.map_gh02, "35war", GetId("R014"), 10, Jglobals.udg_ghTimer }, --幻天旋地
    { ItemType.map_cb01, "tsrhdf", GetId("R015"), 6, Jglobals.udg_cbTimer }, --炫紫羽翼
    { ItemType.map_cb02, "34wyhe ws", GetId("R016"), 15, Jglobals.udg_cbTimer }, --灵光蝶羽
    { ItemType.map_pf01, "2365td", GetId("R017"), 20, Jglobals.udg_pfTimer }, --潮汐
    --内测限定
    { ItemType.map_pf02, "fdhet#$%^&", GetId("R023"), 0, Jglobals.udg_pfTimer }, --冰雪女王
    --商城道具
    { ItemType.GH_PHOENIX, GetId("R019") }, --凤求凰
    { ItemType.CB_BLUE, GetId("R018") }, --蔚蓝蝶羽
    { ItemType.PF_LOLI, GetId("R020") }, --小萝莉
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
    for i = 1, #mJFItem do
        local item = LoadStr(Jglobals.udg_table, self.Id + 1, mJFItem[i][1])
        if (item ~= nil and item ~= "" and DecodeBase64(item) == mJFItem[i][2]) then
            AddPlayerTechResearched(self.Entity, mJFItem[i][3], 1)
        else
            --    AddPlayerTechResearched(self.Entity, mJFItem[i][3], 1)
        end
    end
    for i = 1, #mMapItem do
        local item = LoadStr(Jglobals.udg_table, self.Id + 1, mMapItem[i][1])
        if (item ~= nil and item ~= "" and DecodeBase64(item) == mMapItem[i][2]) then
            AddPlayerTechResearched(self.Entity, mMapItem[i][3], 1)
        else
            --    AddPlayerTechResearched(self.Entity, mMapItem[i][3], 1)
        end
    end

    if (self.GuildName == "小黄鸡内测专属") then
        local item = LoadStr(Jglobals.udg_table, self.Id + 1, mMapItem[6][1])
        if (item ~= nil and item ~= "" and DecodeBase64(item) == mMapItem[6][2]) then
        else
            AddPlayerTechResearched(self.Entity, mMapItem[6][3], 1)
            SaveStr(Jglobals.udg_table, self.Id + 1, mMapItem[6][1], EncodeBase64(mMapItem[6][2]))
            TimerStart(mMapItem[6][5], 0.01, false, nil)
            DisplayTextToPlayer(self.Entity, 0, 0, "|cFFFFFF00您已永久激活冰雪女王(内测限定皮肤)使用资格!|r")
        end
    end
--[[   local isVIP = LoadBoolean(Jglobals.udg_table, self.Id + 1, ItemType.VIP)
    if (isVIP) then
        PlayerInfo:EnableVIP(self.Entity)
    end
    local isHelp = LoadBoolean(Jglobals.udg_table, self.Id + 1, ItemType.HELP)
    if (isHelp) then
        PlayerInfo:EnableHelp(self.Entity)
    end]]
end

function PlayerInfo:New(entity)
    local newPlayer = mt:New(entity)
    newPlayer.KillCount = 0
    newPlayer.MonsterCount = 0
    newPlayer.MonsterCountMax = 30
    newPlayer.IsWatch = false
    newPlayer.IsVIP = false
    newPlayer.IsHelp = false
    --newPlayer.IsVIP = DecodeBase64(LoadStr(Jglobals.udg_table, GetPlayerId(entity), ItemType.jf_VIP)) == 1 and true or false
    --newPlayer.IsHelp = DecodeBase64(LoadStr(Jglobals.udg_table, GetPlayerId(entity), ItemType.jf_Hepl)) == 1 and true or false
    local score = LoadStr(Jglobals.udg_table, GetPlayerId(entity) + 1, ItemType.Score)
    if (score == nil or score == "") then
        newPlayer.Score = 0
    else
        local decode = DecodeBase64(score)
        if (decode == nil) then
            DisplayTextToPlayer(entity, 0, 0, "|cFFFF0000游戏积分异常，积分清零！|r")
            newPlayer.Score = 0
            SaveStr(Jglobals.udg_table, GetPlayerId(entity) + 1, ItemType.Score, "")
            TimerStart(Jglobals.udg_jfTimer, 0.01, false, nil)
        else
            score = tonumber(decode)
            if (score == nil) then
                DisplayTextToPlayer(entity, 0, 0, "|cFFFF0000游戏积分异常，积分清零！|r")
                newPlayer.Score = 0
                SaveStr(Jglobals.udg_table, GetPlayerId(entity) + 1, ItemType.Score, "")
                TimerStart(Jglobals.udg_jfTimer, 0.01, false, nil)
            else
                newPlayer.Score = score
            end
        end
    end
    newPlayer.MapLevel = LoadInteger(Jglobals.udg_table, GetPlayerId(entity) + 1, ItemType.MapLevel)
    newPlayer.GuildName = LoadStr(Jglobals.udg_table, GetPlayerId(entity) + 1, ItemType.GuildName)
    DisplayTextToPlayer(entity, 0, 0, "当前游戏积分：" .. newPlayer.Score)
    mPlayers[#mPlayers + 1] = newPlayer
    for i = 13, 21 do
        --  AddPlayerTechResearched(newPlayer.Entity, GetId("R0" .. i), 1)
    end
    return newPlayer
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
        if (Game.GetMode() == GameMode.ENDLESS and Game.GetLevel() == 3) then
            score = score * 2
        end
        if (player.IsVIP) then
            score = score * 2
        end
    end
    player.Score = player.Score + score

    SaveStr(Jglobals.udg_table, GetPlayerId(entity) + 1, ItemType.Score, EncodeBase64(tostring(player.Score)))
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

function PlayerInfo:IsHelp(entity)
    local player = GetJ_Player(entity)
    if (player ~= nil) then
        return player.IsHelp
    end
    return false
end

function PlayerInfo:EnableVIP(entity)
    local player = GetJ_Player(entity)
    if (player.IsVIP) then
        return
    end
    player.IsVIP = true
    Worke[GetPlayerId(entity)]:AddSkill("vip0")

--[[  SetPlayerName(entity, "[尊贵VIP]" .. GetPlayerName(entity))
    AddPlayerTechResearched(entity, GetId("R011"), 1)
    --SaveStr(Jglobals.udg_table, GetPlayerId(entity), ItemType.jf_VIP, EncodeBase64(tostring(player.VIP)))
    local worke = Worke[GetPlayerId(entity)]
    local timer = CreateTimer()
    TimerStart(timer, 1, true,
    function()
        AssetsManager.OverlapCircle(
        worke:X(),
        worke:Y(),
        900,
        function(unit)
            EXUnitDamageTarget(worke, unit, 20, EXAbilityType.Magic)
        end
        )
        if (player.IsHelp) then
            local lqfl = worke:GetSkill(GetId("lqfl"))
            if (lqfl ~= nil and lqfl:IsCD() == false) then
                IssueImmediateOrder(worke.Entity, lqfl.Order)
                DisplayTextToAll(player.Name .. "自动发工资获得金币", Color.yellow)
            end
        end
    end
    )
    UnitAddItem(worke.Entity, CreateItem(GetId("IB02"), worke:X(), worke:Y()))]]
end

function PlayerInfo:EnableHelp(entity)
    local player = GetJ_Player(entity)
    if (player.IsHelp) then
        return
    end
    player.IsHelp = true
    player.MonsterCountMax = 40
    Worke[GetPlayerId(entity)]:AddSkill("lqzs")

--[[local lqfl = Worke[GetPlayerId(entity)]:GetSkill(GetId("lqfl"))
    if (lqfl ~= nil) then
        lqfl:onAuto()
    end]]
    --Worke[GetPlayerId(entity)]:LearnedSkill(GetId("lqzs"))
    --SaveStr(Jglobals.udg_table, GetPlayerId(entity), ItemType.jf_VIP, EncodeBase64(tostring(player.VIP)))
end

function PlayerInfo:EnableJFItem(entity, type)
    local player = GetJ_Player(entity)
    if (player == nil) then
        Game.LogError("兑换失败,未知原因.要不重进游戏再试试吧。")
        return
    end
    for i = 1, #mJFItem do
        if (mJFItem[i][1] == type) then
            if (player.Score >= mJFItem[i][4]) then
                local item = LoadStr(Jglobals.udg_table, GetPlayerId(entity) + 1, mJFItem[i][1])
                if (item ~= nil and item ~= "" and DecodeBase64(item) == mJFItem[i][2]) then
                    DisplayTextToPlayer(entity, 0, 0, "|cFFFF0000兑换失败,道具已拥有!")
                    return
                else
                    PlayerInfo.AddScore(entity, -mJFItem[i][4])
                    AddPlayerTechResearched(entity, mJFItem[i][3], 1)
                    SaveStr(Jglobals.udg_table, GetPlayerId(entity) + 1, mJFItem[i][1], EncodeBase64(mJFItem[i][2]))
                    TimerStart(mJFItem[i][5], 0.01, false, nil)
                    DisplayTextToPlayer(entity, 0, 0, "|cFFFFFF00兑换积分道具成功,当前剩余积分：" .. player.Score)
                end
            else
                DisplayTextToPlayer(entity, 0, 0, "|cFFFF0000积分不足兑换失败,当前剩余积分：" .. player.Score)
                return
            end
        end
    end

    for i = 1, #mMapItem do
        if (mMapItem[i][1] == type) then
            if (player.MapLevel >= mMapItem[i][4]) then
                local item = LoadStr(Jglobals.udg_table, GetPlayerId(entity) + 1, mMapItem[i][1])
                if (item ~= nil and item ~= "" and DecodeBase64(item) == mMapItem[i][2]) then
                    DisplayTextToPlayer(entity, 0, 0, "|cFFFF0000兑换失败,道具已拥有!")
                    return
                else
                    AddPlayerTechResearched(entity, mMapItem[i][3], 1)
                    SaveStr(Jglobals.udg_table, GetPlayerId(entity) + 1, mMapItem[i][1], EncodeBase64(mMapItem[i][2]))
                    TimerStart(mMapItem[i][5], 0.01, false, nil)
                    DisplayTextToPlayer(entity, 0, 0, "|cFFFFFF00兑换地图等级道具成功|r")
                end
            else
                DisplayTextToPlayer(entity, 0, 0, "|cFFFF0000地图等级不足，兑换道具失败!|r")
                return
            end
        end
    end
end

function GetJ_Player(entity)
    for i = #mPlayers, 1, -1 do
        if (mPlayers[i].Entity == entity) then
            return mPlayers[i]
        end
    end
    return nil
end

function PlayerInfo:Player(id)
    return GetJ_Player(Player(id))
end

function PlayerInfo:Count()
    local count = 0
    for i = 1, #mPlayers do
        if (mPlayers[i].IsWatch == false) then
            count = count + 1
        end
    end
    return count
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