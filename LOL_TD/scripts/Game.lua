require "scripts.Common.Color"
local console = require "jass.console"
local debug = debug
Game = {}

Game.DamageFactor = 0.06 --伤害因子
local mGameLevel = 0
local mGameSpeed = 1

IsDebug = false
local mIsPause = false
console.enable = IsDebug
function Game.Log(text)
    if (IsDebug) then
        console.write("------------------" .. text .. "---------------------")
        for i = 0, 3 do
            DisplayTextToPlayer(Player(i), 0, 0, "|cffffcc00" .. text .. "|r")
        end
    end
end

GameMode = {
    NORMAL = 0,
    ENDLESS = 1
}

local mGameMode = GameMode.NORMAL

function Game.LogError(text)
    if (IsDebug) then
        console.write("---------------------------------------")
        console.write("              LUA ERROR!!              ")
        console.write("---------------------------------------")
        console.write(tostring(text) .. "\n")
        console.write(tostring(debug.traceback()) .. "\n")
        console.write("---------------------------------------")
        --Game.Pause(true)
        for i = 0, 3, 1 do
            --DisplayTextToPlayer(Player(i), 0, 0, "|cffff0000" .. text .. "|r")
        end
    end
end

function DisplayTextToAll(text, color)
    color = color or Color.white
    for i = 0, 3 do
        DisplayTextToPlayer(Player(i), 0, 0, "|c" .. color .. text .. "|r")
    end
end

--更新
function Game.OnGameUpdate()
    if (mIsPause) then
        return
    end
    GameScene.OnGameUpdate(GameScene.DeltaTime * Game.GetSpeed())
end

function Game.GetMode()
    return mGameMode
end

function Game.SetMode(mode)
    mGameMode = mode
end

function Game.GetLevel()
    return mGameLevel
end

function Game.SetLevel(level)
    mGameLevel = level
end

function Game.GetSpeed()
    return mGameSpeed
end

function Game.SetSpeed(speed)
    mGameSpeed = speed
    Game.Log("设置游戏速度：" .. speed)
end

local mChooseTimer, mChooseTimerDialog, mChooseTriggers, mDialog
local mDifficultyTest = { "难一(56波)", "难二(无尽)", "难三(无尽,双倍积分)"}
function Game.ChooseLevel()
    mChooseTimer = CreateTimer()
    mChooseTimerDialog = CreateTimerDialog(mChooseTimer)
    mChooseTriggers = {}
    local chooseLevel = true
    for i = 0, 3, 1 do
        if
        (chooseLevel and GetPlayerController(Player(i)) == MAP_CONTROL_USER and
        GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING)
        then
            mDialog = DialogCreate()
            DialogSetMessage(mDialog, "难度选择")
            DisplayTextToPlayer(Player(i), 0, 0, "|cffffcc00请选择难度...|r")
            for j = 1, #mDifficultyTest do
                mChooseTriggers[j] = CreateTrigger()
                TriggerRegisterDialogButtonEvent(mChooseTriggers[j], DialogAddButton(mDialog, mDifficultyTest[j], 0))
                TriggerAddAction(
                mChooseTriggers[j],
                function()
                    DisplayTextToAll("当前难度等级" .. j, Color.yellow)
                    Game.SetLevel(j)
                    GameScene.OnGameStart()
                    Multiboard.ShowLevel(j)
                    DialogDestroy(mDialog)
                    DestroyTimer(mChooseTimer)
                    DestroyTimerDialog(mChooseTimerDialog)
                    for i, v in ipairs(mChooseTriggers) do
                        DestroyTrigger(v)
                    end
                    mChooseTimer = nil
                    mChooseTimerDialog = nil
                    mChooseTriggers = nil
                end
                )
            end
            DialogDisplay(Player(i), mDialog, true)
            chooseLevel = false
        elseif (false == chooseLevel) then
            DisplayTextToPlayer(Player(i), 0, 0, "|cffffcc00等待主机选取难度...|r")
        end
    end

    TimerDialogSetTitle(mChooseTimerDialog, "选择难度时间")
    TimerDialogDisplay(mChooseTimerDialog, true)
    TimerStart(
    mChooseTimer,
    20,
    false,
    function()
        DisplayTextToAll("当前难度等级" .. (1), Color.yellow)
        for i = 0, 3, 1 do
            DialogDisplay(Player(i), mDialog, false)
        end
        if (nil == mChooseTimerDialog) then
            return
        end
        Game.SetLevel(1)
        GameScene.OnGameStart()
        DialogDestroy(mDialog)
        DestroyTimer(mChooseTimer)
        DestroyTimerDialog(mChooseTimerDialog)
        for i, v in ipairs(mChooseTriggers) do
            DestroyTrigger(v)
        end
    end
    )
end

function Game.Pause(pause)
    mIsPause = pause
    AssetsManager.IterateEnemyUnits(
    function(unit)
        unit:SetActive(pause)
        --PauseUnit(unit.Entity, mIsPause)
        -- body
    end
    )
end

function Game.Win()
    PlayerInfo:IteratePlayer(
    function(player)
        if (player.IsWatch == false) then
            PlayerInfo.AddScore(player.Entity, Game.GetLevel() * 10)
            DisplayTextToPlayer(player.Entity, 0, 0, "|cffffcc00恭喜通关，所有坚守在最后的玩家获得" .. (Game.GetLevel() * 10) .. "点游戏积分!|r")
        end
    end)
    local timer = CreateTimer()
    TimerStart(timer, 5, false, VictoryHandler)
end

function Game.Fail()
    DisplayTextToAll("很遗憾！圈内怪物已经超出上限，游戏5秒后结束...", Color.red)
    local timer = CreateTimer()
    TimerStart(timer, 5, false, DefeatHandler)
end

function VictoryHandler()
    local dialog = DialogCreate()
    DialogSetMessage(dialog, "胜利！")
    local trig = CreateTrigger()
    TriggerRegisterDialogButtonEvent(trig, DialogAddButton(dialog, "确定", 81))
    TriggerAddAction(
    trig,
    function()
        EndGame(true)
    end
    )
    for i = 0, 3, 1 do
        DialogDisplay(Player(i), dialog, true)
    end
end

function DefeatHandler()
    local dialog = DialogCreate()
    DialogSetMessage(dialog, "很遗憾，再努力努力吧！")
    local trig = CreateTrigger()
    TriggerRegisterDialogButtonEvent(trig, DialogAddButton(dialog, "退出", 81))
    TriggerAddAction(
    trig,
    function()
        EndGame(true)
    end
    )
    for i = 0, 3, 1 do
        DialogDisplay(Player(i), dialog, true)
    end
end