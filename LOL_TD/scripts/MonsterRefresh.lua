MonsterRefresh = {}
--MonsterRefresh.Point = {Jglobals.gg_rct_ChuGuaiKou_1, Jglobals.gg_rct_ChuGuaiKou_2, Jglobals.gg_rct_ChuGuaiKou_Boss}
MonsterRefresh.ChuGuaiKous = {
    GetRectCenter(Jglobals.gg_rct_chuguaikou1),
    GetRectCenter(Jglobals.gg_rct_chuguaikou2),
    GetRectCenter(Jglobals.gg_rct_chuguaikou3),
    GetRectCenter(Jglobals.gg_rct_chuguaikou4)
}
MonsterRefresh.RectPoints = {
    GetRectCenter(Jglobals.gg_rct_rect001),
    GetRectCenter(Jglobals.gg_rct_rect002),
    GetRectCenter(Jglobals.gg_rct_rect003),
    GetRectCenter(Jglobals.gg_rct_rect004),
    GetRectCenter(Jglobals.gg_rct_rect005),
    GetRectCenter(Jglobals.gg_rct_rect006),
    GetRectCenter(Jglobals.gg_rct_rect007),
    GetRectCenter(Jglobals.gg_rct_rect008),
    GetRectCenter(Jglobals.gg_rct_rect009),
    GetRectCenter(Jglobals.gg_rct_rect010),
    GetRectCenter(Jglobals.gg_rct_rect011),
    GetRectCenter(Jglobals.gg_rct_rect012),
    GetRectCenter(Jglobals.gg_rct_rect013),
    GetRectCenter(Jglobals.gg_rct_rect014),
    GetRectCenter(Jglobals.gg_rct_rect015),
    GetRectCenter(Jglobals.gg_rct_rect016),
}

MonsterRefresh.Regions = {}
MonsterRefresh.PathMaps = {
    [1] = { 5, 8 },
    [2] = { 5, 6 },
    [3] = { 6, 7 },
    [4] = { 7, 8 },
    [5] = { 1, 2, 9 },
    [6] = { 2, 3, 10 },
    [7] = { 3, 4, 11 },
    [8] = { 1, 4, 12 },
    [9] = { 5, 13, 14 },
    [10] = { 6, 14, 15 },
    [11] = { 7, 15, 16 },
    [12] = { 8, 13, 16 },
    [13] = { 9, 12 },
    [14] = { 9, 10 },
    [15] = { 10, 11 },
    [16] = { 11, 12 },
}
local mDelayPushTimer = nil
local mDelayPushTimerDialog = nil
local mSpawnEnable = false
--当前波数
local mCurWaveIndex = 1
local mEndlessWaveIndex = 1
local mMaxWaveIndex = 56
local mDelay = {
    60, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10,
}

local mDuration = {
    40, 40, 40, 40, 40, 40, 40, 20,
    40, 40, 40, 40, 40, 40, 40, 20,
    40, 40, 40, 40, 40, 40, 40, 20,
    40, 40, 40, 40, 40, 40, 40, 20,
    40, 40, 40, 40, 40, 40, 40, 20,
    40, 40, 40, 40, 40, 40, 40, 20,
    40, 40, 40, 40, 40, 40, 40, 1
}
local mRate = {
    0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 5,
    0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 5,
    0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 5,
    0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 5,
    0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 5,
    0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 5,
    0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 1,
}

local mDelayClear = {
    10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 0,
}

local mMonsterId
local mRunTime = 0
local mTimeDt1 = 0
local mTimeDt2 = 0
local mTimeDt3 = 0
local mTimeDt4 = 0
local mMonTimerTimer
local mMonTimerTimerDialog
local mInterest = 0.03

function MonsterRefresh.GetCurWaveIndex()
    return mCurWaveIndex
end

function MonsterRefresh.SetWaveIndex(waveIndex)
    mCurWaveIndex = waveIndex
    Game.Log("设置波数：" .. waveIndex)
end

function IsBOSS()
    return 0 == math.floor(mCurWaveIndex % 8 * 10)
end

function MonsterRefresh.InitRegion()
    MonsterRefresh.Regions[1] = CreateRegion()
    RegionAddRect(MonsterRefresh.Regions[1], Jglobals.gg_rct_rect001)
    MonsterRefresh.Regions[2] = CreateRegion()
    RegionAddRect(MonsterRefresh.Regions[2], Jglobals.gg_rct_rect002)
    MonsterRefresh.Regions[3] = CreateRegion()
    RegionAddRect(MonsterRefresh.Regions[3], Jglobals.gg_rct_rect003)
    MonsterRefresh.Regions[4] = CreateRegion()
    RegionAddRect(MonsterRefresh.Regions[4], Jglobals.gg_rct_rect004)
    MonsterRefresh.Regions[5] = CreateRegion()
    RegionAddRect(MonsterRefresh.Regions[5], Jglobals.gg_rct_rect005)
    MonsterRefresh.Regions[6] = CreateRegion()
    RegionAddRect(MonsterRefresh.Regions[6], Jglobals.gg_rct_rect006)
    MonsterRefresh.Regions[7] = CreateRegion()
    RegionAddRect(MonsterRefresh.Regions[7], Jglobals.gg_rct_rect007)
    MonsterRefresh.Regions[8] = CreateRegion()
    RegionAddRect(MonsterRefresh.Regions[8], Jglobals.gg_rct_rect008)
    MonsterRefresh.Regions[9] = CreateRegion()
    RegionAddRect(MonsterRefresh.Regions[9], Jglobals.gg_rct_rect009)
    MonsterRefresh.Regions[10] = CreateRegion()
    RegionAddRect(MonsterRefresh.Regions[10], Jglobals.gg_rct_rect010)
    MonsterRefresh.Regions[11] = CreateRegion()
    RegionAddRect(MonsterRefresh.Regions[11], Jglobals.gg_rct_rect011)
    MonsterRefresh.Regions[12] = CreateRegion()
    RegionAddRect(MonsterRefresh.Regions[12], Jglobals.gg_rct_rect012)
    MonsterRefresh.Regions[13] = CreateRegion()
    RegionAddRect(MonsterRefresh.Regions[13], Jglobals.gg_rct_rect013)
    MonsterRefresh.Regions[14] = CreateRegion()
    RegionAddRect(MonsterRefresh.Regions[14], Jglobals.gg_rct_rect014)
    MonsterRefresh.Regions[15] = CreateRegion()
    RegionAddRect(MonsterRefresh.Regions[15], Jglobals.gg_rct_rect015)
    MonsterRefresh.Regions[16] = CreateRegion()
    RegionAddRect(MonsterRefresh.Regions[16], Jglobals.gg_rct_rect016)

    local trig = nil
    for i = 1, #MonsterRefresh.Regions do
        trig = CreateTrigger()
        TriggerRegisterEnterRegion(trig, MonsterRefresh.Regions[i], nil)
        TriggerAddAction(
        trig,
        function()
            local playerId = GetPlayerId(GetOwningPlayer(GetEnteringUnit()))
            if (playerId <= 4) then
                return
            end
            local enteringUnit = GetJ_EnemyUnits(GetEnteringUnit())
            if (enteringUnit == nil or enteringUnit.FactionId == PlayerTeamFactionId) then
                return
            end
            for index = 1, #MonsterRefresh.Regions do
                if (GetTriggeringRegion() == MonsterRefresh.Regions[index]) then
                    IssuePointOrderLoc(enteringUnit.Entity, "move", GetNextPoint(enteringUnit.PrePoint, index))
                    enteringUnit.PrePoint = MonsterRefresh.RectPoints[index]
                    return
                end
            end
        end
        )
    end
    trig = nil
end

function GetNextPoint(prePoint, index)
    local random = math.random(1, #MonsterRefresh.PathMaps[index])
    local randomPoint = MonsterRefresh.RectPoints[MonsterRefresh.PathMaps[index][random]]
    if (prePoint ~= randomPoint) then
        return randomPoint
    end
    return GetNextPoint(prePoint, index)
end

function MonsterRefresh.OnGameStart()
    mDelayPushTimer = CreateTimer()
    mDelayPushTimerDialog = CreateTimerDialog(mDelayPushTimer)
    mMaxWaveIndex = 56
    MonsterRefresh.InitRegion()
    DelayPush()
end

function DelayPush()
    TimerStart(mDelayPushTimer, mDelay[mCurWaveIndex], false, PushWave)
    TimerDialogSetTitle(mDelayPushTimerDialog, "第" .. (mCurWaveIndex) .. "波")
    TimerDialogDisplay(mDelayPushTimerDialog, true)
    if (mCurWaveIndex == 56) then
        if (Game.GetLevel() == 1) then
            TimerDialogSetTitle(mDelayPushTimerDialog, "最终BOSS")
            for i = 0, 3 do
                DisplayTextToPlayer(Player(i), 0, 0, "|cFFFF0000Warning|r" .. " - 最终BOSS即将来袭，击杀全部Boss即可通关！")
            end
            return
        else
            TimerDialogSetTitle(mDelayPushTimerDialog, "最终BOSS")
            for i = 0, 3 do
                DisplayTextToPlayer(Player(i), 0, 0, "|cFFFF0000Warning|r" .. " - 最终BOSS即将来袭，杀死至少一个BOSS即可解锁无尽关卡！")
            end
            DisplayTextToAll("BOSS结算奖励：所有玩家获得杀死BOSS数量x5000的金币。|r", Color.yellow)
            TimeToStopBOSS()
            return
        end
    end
    if (IsBOSS()) then
        for i = 0, 3 do
            DisplayTextToPlayer(Player(i), 0, 0, "|cFFFF0000Warning|r" .. " - Boss即将来袭！")
        end
        local timer = CreateTimer()
        TimerStart(timer, 3, false, function()
            DestroyTimer(GetExpiredTimer())
            DisplayTextToAll("击杀Boss除了金币奖励外还会额外获得1点天赋点和buff奖励。", Color.yellow)
        end)
    end
end

local mBossIds = {}

--boss出现 弹出击杀倒计时计时器窗口
function PushWave()
    if (Game.GetMode() == GameMode.NORMAL) then
        mMonsterId = #tostring(mCurWaveIndex) == 1 and "um0" .. mCurWaveIndex or "um" .. mCurWaveIndex
        if (IsBOSS()) then
            if (mCurWaveIndex ~= 56) then
                --Boss击杀倒计时
                mBossIds[#mBossIds + 1] = #tostring(mCurWaveIndex) == 1 and "UD0" .. mCurWaveIndex or "UD" .. mCurWaveIndex
                mBossIds[#mBossIds + 1] = #tostring(mCurWaveIndex) == 1 and "UC0" .. mCurWaveIndex or "UC" .. mCurWaveIndex
                mBossIds[#mBossIds + 1] = #tostring(mCurWaveIndex) == 1 and "UB0" .. mCurWaveIndex or "UB" .. mCurWaveIndex
                mBossIds[#mBossIds + 1] = #tostring(mCurWaveIndex) == 1 and "UA0" .. mCurWaveIndex or "UA" .. mCurWaveIndex
            else
                mBossIds[#mBossIds + 1] = "UM56"
            end
        end
    elseif (Game.GetMode() == GameMode.ENDLESS) then
        mMonsterId = "End" .. mCurWaveIndex
    end
    mSpawnEnable = true
    --TimerDialogDisplay(mDelayPushTimerDialog, false)
end

function DelayEndLessPush()
    TimerStart(mDelayPushTimer, mDelay[mCurWaveIndex], false, PushWave)
    TimerDialogSetTitle(mDelayPushTimerDialog, "无尽第" .. mEndlessWaveIndex .. "波")
    TimerDialogDisplay(mDelayPushTimerDialog, true)
end

--1000 2000 4000 8000 16000
--200 300 500 800
function Damage2Money(damage, base, money, count) --1000, 200, 1
    if (damage >= base) then
        return Damage2Money(damage, base * 2, money + (count - 1) * 100, count + 1)
    end
    return money
end

local fuliguai = {}
local b = { 1, 5, 20, 35, 60, 120 }
local c = { 8, 15, 55, 90, 165, 350 }
function MoneyShow_showDialog()
    local monTimer = CreateTimer()
    local _timerMoney = CreateTimerDialog(monTimer)
    TimerDialogSetTitle(_timerMoney, "远古龙挑战")
    TimerDialogDisplay(_timerMoney, true)
    TimerStart(monTimer, 10, false, function()
        mMonsterId = "End0"
        for i = 0, 3 do
            if (GetPlayerController(Player(i)) == MAP_CONTROL_USER and
            GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING) then
                fuliguai[i + 1] = Spawn(MonsterRefresh.ChuGuaiKous[i + 1], i + 1)
                fuliguai[i + 1].DamageSum = 0
            end
        end
        DisplayTextToAll("远古龙出现！对远古龙造成的伤害越高，奖励的金币就越多！", "ffffcc00")

        DestroyTimer(monTimer)
        DestroyTimerDialog(_timerMoney)
        local monTimer2 = CreateTimer()
        local _timerMoney2 = CreateTimerDialog(monTimer2)
        TimerDialogSetTitle(_timerMoney2, "奖励结算")
        TimerDialogDisplay(_timerMoney2, true)
        TimerStart(monTimer2, 25, false, function()
            DestroyTimer(monTimer2)
            DestroyTimerDialog(_timerMoney2)
            for i = 0, 3 do
                DisplayTextToPlayer(Player(i), 0, 0, "|cffffcc00本次挑战结束：|r")
            end
            for i = 0, 3 do
                if (GetPlayerController(Player(i)) == MAP_CONTROL_USER and
                GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING) then
                    local a = (mCurWaveIndex - 1) / 8
                    --local money = Damage2Money(fuliguai[i + 1].DamageSum, 1000, 200, 1)
                    --local money2 = math.floor((500 + (a - 1) * 1000) * fuliguai[i + 1].DamageSum * 0.001 / (fuliguai[i + 1].DamageSum * 0.001 + b[a]))
                    --local money3 = math.floor((1000 + (a - 1) * 2000) * fuliguai[i + 1].DamageSum * 0.001 / (fuliguai[i + 1].DamageSum * 0.001 + c[a]))
                    local money2 = 0
                    if (a == 1) then
                        money2 = math.floor((1000 + (a - 1) * 2000) * fuliguai[i + 1].DamageSum * 0.001 / (fuliguai[i + 1].DamageSum * 0.001 + c[a]))
                    else
                        money2 = math.floor((500 + (a - 1) * 1000) * fuliguai[i + 1].DamageSum * 0.001 / (fuliguai[i + 1].DamageSum * 0.001 + b[a]))
                    end
                    --Game.Log("money: " .. money .. " ,money2: " .. money2 .. " ,money3: " .. money3)
                    AssetsManager.DestroyObject(fuliguai[i + 1])
                    Multiboard.ShowMonsterCount(-1)
                    for j = 0, 3 do
                        DisplayTextToPlayer(Player(j), 0, 0, "|cffffcc00" .. GetPlayerName(Player(i)) .. "|r对远古龙造成的伤害：|cFF00FF00" .. math.modf(fuliguai[i + 1].DamageSum) .. "|r 奖励金币数量：|cffffcc00" .. money2 .. "|r")
                    end
                    SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD) + money2)
                end
            end
            DelayPush()
        end)
    end)
end

local mKillBossCount = 0
function AddKillBossCount()
    mKillBossCount = mKillBossCount + 1
    return mKillBossCount
end

local BossStopTimer
local _BossDialog
function TimeToStopBOSS()
    BossStopTimer = CreateTimer()
    _BossDialog = CreateTimerDialog(BossStopTimer)
    TimerDialogSetTitle(_BossDialog, "剩余时间")
    TimerDialogDisplay(_BossDialog, true)
    TimerStart(BossStopTimer, 480, false, EndLessComing)
end

function EndLessComing()
    mSpawnEnable = false
    DestroyTimer(BossStopTimer)
    DestroyTimerDialog(_BossDialog)
    local money = mKillBossCount * 5000
    DisplayTextToAll("你们一共杀死了" .. mKillBossCount .. "只男爵，每个玩家奖励" .. money .. "金币", Color.yellow)
    if (mKillBossCount <= 0) then
        Game.Win()
        return
    end
    PlayerInfo:IteratePlayer(
    function(player)
        if (player.IsWatch == false) then
            SetPlayerState(player.Entity, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(player.Entity, PLAYER_STATE_RESOURCE_GOLD) + money)
            PlayerInfo.AddScore(player.Entity, Game.GetLevel() * 10)
            DisplayTextToPlayer(player.Entity, 0, 0, "|cffffcc00恭喜你们开启了无尽关卡!所有进入无尽模式的玩家获得" .. (Game.GetLevel() * 10) .. "点游戏积分!|r")
        end
    end)
    local enemyTeamUnits = GetEnemyTeamUnits()
    for j = 1, #enemyTeamUnits do
        local list = enemyTeamUnits[j]
        for i = #list, 1, -1 do
            if (list[i] ~= nil and list[i].IsDying == false) then
                AssetsManager.DestroyObject(list[i])
            end
        end
    end
    mCurWaveIndex = 1
    Game.SetMode(GameMode.ENDLESS)
    Multiboard.UpdateEndLessInfo()
    for i = 0, 3 do
        if
        (GetPlayerController(Player(i)) == MAP_CONTROL_USER and
        GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING)
        then
            if (Worke[i] ~= nil) then
                Worke[i]:RemoveSkill(GetId("lqfl"))
                Worke[i]:RemoveSkill(GetId("sp10"))
                Worke[i]:RemoveSkill(GetId("sp11"))
                local gh05 = Worke[i]:GetSkill(GetId("gh05"))
                if (gh05 ~= nil) then
                    gh05.CurAction = nil
                end
                local cb05 = Worke[i]:GetSkill(GetId("cb05"))
                if (cb05 ~= nil) then
                    cb05.CurAction = nil
                end
            end
        end
    end

    mDelay = { 5, 5, 5, 5, 10 }
    mDuration = { 15, 15, 15, 15, 15 }
    mRate = { 1, 1, 1, 1, 1 }
    TimerStart(mDelayPushTimer, 30, false, PushWave)
    TimerDialogSetTitle(mDelayPushTimerDialog, "无尽第1波")
    TimerDialogDisplay(mDelayPushTimerDialog, true)
end

function AutoMoney()
    for i = 0, 3 do
        local money = math.floor(GetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD) * mInterest)
        SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD) + money)
        DisplayTextToPlayer(Player(i), 0, 0, "-- 发放存款奖励,获得金币：|cFFFFFF00" .. money)
    end
end

function WavesClear()
    mTimeDt1 = 0
    mTimeDt2 = 0
    mTimeDt3 = 0
    mTimeDt4 = 0
    mSpawnEnable = false
    mCurWaveIndex = mCurWaveIndex + 1
    if (mCurWaveIndex > mMaxWaveIndex) then
        return
    end
    if (Game.GetMode() == GameMode.NORMAL) then
        --[[AutoMoney()
        if (IsBOSS()) then
            mInterest = mInterest + 0.01
            for i = 0, 3 do
                DisplayTextToPlayer(Player(i), 0, 0, "-- 存款利率上升了1%个点，当前利率：|cFFFFFF00" .. (mInterest * 100) .. "%")
            end
        end]]
        if (MonsterNumOut()) then
            Game.Fail()
        else
            if (0 == (mCurWaveIndex - 1) % 8) then
                MoneyShow_showDialog()
            else
                DelayPush()
            end
        end
    elseif (Game.GetMode() == GameMode.ENDLESS) then
        PlayerInfo:IteratePlayer(
        function(player)
            if (player.MonsterCount > 30) then
                if (player.IsWatch == false) then
                    player.IsWatch = true
                    DisplayTextToAll("|cffffcc00玩家:|r" .. GetPlayerName(player.Entity) .. "|cffffcc00的怪物数量超出限制，切换为观看模式|r。", Color.white)
                    local playerTeamUnits = GetPlayerTeamUnits(player.Id)
                    for i = #playerTeamUnits, 1, -1 do
                        if (playerTeamUnits[i] ~= nil and playerTeamUnits[i].IsDying == false) then
                        playerTeamUnits[i]:IterateItems(
                            function(item)
                                UnitRemoveItem(playerTeamUnits[i].Entity, item.Entity)
                            end
                            )
                            AssetsManager.DestroyObject(playerTeamUnits[i])
                        end
                    end

                    local enemyTeamUnits = GetEnemyTeamUnits()
                    for j = 1, #enemyTeamUnits do
                        if (player.Id + 1 == j) then
                            local list = enemyTeamUnits[j]
                            for i = #list, 1, -1 do
                                if (list[i] ~= nil and list[i].IsDying == false) then
                                    AssetsManager.DestroyObject(list[i])
                                end
                            end
                        end
                    end
                end
            else
                if (player.IsWatch == false) then
                    PlayerInfo.AddScore(player.Entity, 1)
                end
            end
        end)
        mEndlessWaveIndex = mEndlessWaveIndex + 1
        if (mCurWaveIndex > 5) then
            mCurWaveIndex = 1
            PlayerInfo:IteratePlayer(
            function(player)
                if (player.IsWatch == false) then
                    DisplayTextToPlayer(player.Entity, 0, 0, "|cffffcc00成功守住了一轮无尽，奖励3点积分|r")
                    PlayerInfo.AddScore(player.Entity, 3)
                end
            end)
        end
        local fail = true
        PlayerInfo:IteratePlayer(
        function(player)
            if (player.IsWatch == false) then
                fail = false
            end
        end)
        if (fail) then
            Game.Fail()
        else
            DelayEndLessPush()
        end
    end
end

function AllWavesDie()
    local win = true
    AssetsManager.IterateEnemyUnits(
    function(unit)
        if (IsUnitType(unit.Entity, UNIT_TYPE_HERO) and unit.Id ~= GetId("End0")) then
            win = false
            return
        end
    end)
    if (win) then
        Game.Win()
        return
    end
end

function Spawn(spawnPoint, index)
    local unit = AssetsManager.LoadUnitAtLoc(Player(index + 7), mMonsterId, spawnPoint)
    unit.PrePoint = spawnPoint
    EXSetUnitCollisionType(true, unit.Entity, 1)
    RemoveGuardPosition(unit.Entity)
    IssuePointOrderLoc(unit.Entity, "move", MonsterRefresh.RectPoints[index])
    if (Game.GetMode() == GameMode.NORMAL) then
        unit.Attribute:add("生命上限", unit.Attribute:get("生命上限") * (0.2 * Game.GetLevel()))
        Multiboard.ShowMonsterCount(1, index)
    elseif (Game.GetMode() == GameMode.ENDLESS) then
        unit.Attribute:add("护甲", mEndlessWaveIndex * 2)
        if (Game.GetLevel() == 3) then
            unit.Attribute:add("生命上限", unit.Attribute:get("生命上限") * (0.2 * mEndlessWaveIndex + 0.3))
        else
            unit.Attribute:add("生命上限", unit.Attribute:get("生命上限") * (0.1 * mEndlessWaveIndex + 0.25))
        end
        PlayerInfo:AddMonsterCount(Player(index - 1))
    end
    unit.Attribute:add("生命", unit.Attribute:get("生命上限"))
    unit.Attribute:add("魔法值", unit.Attribute:get("魔法上限"))
    return unit
end

function MonsterRefresh.OnGameUpdate(dt)
    if (mSpawnEnable) then
        mTimeDt2 = mTimeDt2 + dt
        --持续时间
        if (mTimeDt2 <= mDuration[mCurWaveIndex]) then
            --出兵频率
            mTimeDt3 = mTimeDt3 - dt
            if (mTimeDt3 <= 0) then
                mTimeDt3 = mRate[mCurWaveIndex]
                if (IsBOSS()) then
                    if (#mBossIds > 0) then
                        mMonsterId = mBossIds[#mBossIds]
                        table.remove(mBossIds, #mBossIds)
                    end
                end
                PlayerInfo:IteratePlayer(
                function(player)
                    if (player.IsWatch == false) then
                        Spawn(MonsterRefresh.ChuGuaiKous[player.Id + 1], player.Id + 1)
                    end
                end)
                return
            end
        else
            --每波兵在上一波兵出现后多久倒计时
            mTimeDt4 = mTimeDt4 + dt
            if (mTimeDt4 > mDelayClear[mCurWaveIndex]) then
                WavesClear()
            end
        end
    end
end