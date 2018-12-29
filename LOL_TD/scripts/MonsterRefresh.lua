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
local mMaxWaveIndex = 56
local mDelay = {
    60, 10, 10, 10, 10, 10, 10, 10,
    20, 10, 10, 10, 10, 10, 10, 10,
    20, 10, 10, 10, 10, 10, 10, 10,
    20, 10, 10, 10, 10, 10, 10, 10,
    20, 10, 10, 10, 10, 10, 10, 10,
    20, 10, 10, 10, 10, 10, 10, 10,
    20, 10, 10, 10, 10, 10, 10, 10,
}

local mDuration = {
    40, 40, 40, 40, 40, 40, 40, 6,
    40, 40, 40, 40, 40, 40, 40, 6,
    40, 40, 40, 40, 40, 40, 40, 6,
    40, 40, 40, 40, 40, 40, 40, 6,
    40, 40, 40, 40, 40, 40, 40, 6,
    40, 40, 40, 40, 40, 40, 40, 6,
    40, 40, 40, 40, 40, 40, 40, 6
}
local mRate = {
    0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 10,
    0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 10,
    0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 10,
    0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 10,
    0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 10,
    0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 10,
    0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 10,
}

local mDelayClear = {
    10, 10, 10, 10, 10, 10, 10, 10,
    30, 10, 10, 10, 10, 10, 10, 10,
    30, 10, 10, 10, 10, 10, 10, 10,
    30, 10, 10, 10, 10, 10, 10, 10,
    30, 10, 10, 10, 10, 10, 10, 10,
    30, 10, 10, 10, 10, 10, 10, 10,
    30, 10, 10, 10, 10, 10, 10, 10
}

local mMonsterId
local mRunTime = 0
local mTimeDt1 = 0
local mTimeDt2 = 0
local mTimeDt3 = 0
local mTimeDt4 = 0

function MonsterRefresh.GetCurWaveIndex()
    return mCurWaveIndex
end

function MonsterRefresh.SetWaveIndex(waveIndex)
    mCurWaveIndex = waveIndex
    Game.Log("设置波数：" .. waveIndex)
end

local function IsBOSS(lv)
    return 0 == math.floor(lv % 8 * 10)
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
    mMaxWaveIndex = Game.GetLevel() == 1 and 40 or 56
    MonsterRefresh.InitRegion()
    DelayPush()
end

function DelayPush()
    TimerStart(mDelayPushTimer, mDelay[mCurWaveIndex], false, PushWave)
    TimerDialogSetTitle(mDelayPushTimerDialog, "第" .. (mCurWaveIndex) .. "波")
    TimerDialogDisplay(mDelayPushTimerDialog, true)
    if (mCurWaveIndex == 40 and Game.GetLevel() == 1) then
        TimerDialogSetTitle(mDelayPushTimerDialog, "最终BOSS")
        for i = 0, 3 do
            DisplayTextToPlayer(Player(i), 0, 0, "|cFFFF0000Warning|r" .. " - 最终BOSS即将来袭，击杀全部Boss即可通关！")
        end
        return
    end
    if (mCurWaveIndex == 56) then
        if (Game.GetLevel() == 2) then
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
            return
        end
    end
    if (IsBOSS(mCurWaveIndex)) then
        for i = 0, 3 do
            DisplayTextToPlayer(Player(i), 0, 0, "|cFFFF0000Warning|r" .. " - Boss即将来袭！")
        end
    end
end

local mBossKillTimer
local mBossKillTimerDialog
local mBossIds = {["um55"] = "UB55", ["um54"] = "UB54", ["um39"] = "UB39", ["um38"] = "UB38" }
local mFirstBoss = false
function PushWave()
    mMonsterId = #tostring(mCurWaveIndex) == 1 and "um0" .. mCurWaveIndex or "um" .. mCurWaveIndex
    if (IsBOSS(mCurWaveIndex)) then
        mMonsterId = #tostring(mCurWaveIndex) == 1 and "UM0" .. mCurWaveIndex or "UM" .. mCurWaveIndex
    --[[  --Boss击杀倒计时
        mBossKillTimer = CreateTimer()
        TimerStart(mBossKillTimer, 60, false, function()
            DestroyTimer(mBossKillTimer)
            DestroyTimerDialog(mBossKillTimerDialog)
        end)
        mBossKillTimerDialog = CreateTimerDialog(mBossKillTimer)
        TimerDialogSetTitle(mBossKillTimerDialog, "击杀倒计时")
        TimerDialogDisplay(mBossKillTimerDialog, true)]]
    end
    if (mBossIds[mMonsterId] ~= nil) then
        mMonsterId = mBossIds[mMonsterId]
        table.remove(mBossIds, #mBossIds)
        mFirstBoss = true
    end
    mSpawnEnable = true
    --TimerDialogDisplay(mDelayPushTimerDialog, false)
end

function TimeToStopBOSS()
    local BossStopTimer = CreateTimer()
    local _BossDialog = CreateTimerDialog(BossStopTimer)
    TimerDialogSetTitle(_BossDialog, "剩余时间")
    TimerDialogDisplay(_BossDialog, true)
    TimerStart(BossStopTimer, 480, false, function()

    end)
end

function EndLessComing()
    DisplayTextToAll("恭喜你们开启了无尽关卡！无尽关卡即将来袭..", Color.yellow)
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
    if (MonsterNumOut()) then
        Game.Fail()
    else
        DelayPush()
    end
end

function AllWavesDie()
    local win = true
    AssetsManager.IterateEnemyUnits(
    function(unit)
        if (IsUnitType(unit.Entity, UNIT_TYPE_HERO)) then
            win = false
            return
        end
    end)
    if (win) then
        Game.Win()
        return
    end
end

local function Spawn(spawnPoint, index)
    local unit = AssetsManager.LoadUnitAtLoc(Player(index + 7), mMonsterId, spawnPoint)
    unit.Attribute:add("护甲", unit.Attribute:get("护甲") * (0.1 * Game.GetLevel() - 0.1))
    unit.Attribute:add("生命上限", unit.Attribute:get("生命上限") * (0.3 * Game.GetLevel() - 0.3))
    unit.Attribute:add("生命", unit.Attribute:get("生命上限"))
    unit.Attribute:add("魔法值", unit.Attribute:get("魔法上限"))
    unit.PrePoint = spawnPoint
    EXSetUnitCollisionType(true, unit.Entity, 1)
    RemoveGuardPosition(unit.Entity)
    IssuePointOrderLoc(unit.Entity, "move", MonsterRefresh.RectPoints[index])
    Multiboard.ShowMonsterCount(1)
    if (mFirstBoss) then
        mMonsterId = "um" .. mCurWaveIndex
        mFirstBoss = false
    end
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
                for i = 0, 3 do
                    if
                    (GetPlayerController(Player(i)) == MAP_CONTROL_USER and
                    GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING)
                    then
                        Spawn(MonsterRefresh.ChuGuaiKous[i + 1], i + 1)
                    end
                end
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