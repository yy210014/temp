Multiboard = {}
local mMultiboard = nil
local mMultiboardCurNum = 0
local mMultiboardMaxNum = 60

local mTimeStrs = { "游戏时间: (", 0, "：", 0, "：", 0, ")" }
local mTime1 = 0
local mTime2 = 0
local mTime3 = 0
local mTimeDt = 0

function MonsterNumOut()
    return mMultiboardCurNum > mMultiboardMaxNum
end

function Multiboard.CreateMultiboard()
    mMultiboard = CreateMultiboard()
    MultiboardMinimize(mMultiboard, false)
    MultiboardSetRowCount(mMultiboard, PlayerInfo:Count() + 2)
    MultiboardSetColumnCount(mMultiboard, 3)
    MultiboardSetItemsWidth(mMultiboard, 0.03)
    MultiboardSetItemValue(MultiboardGetItem(mMultiboard, 0, 0), "|cffFF6633玩家|r")
    MultiboardSetItemValue(MultiboardGetItem(mMultiboard, 0, 1), "|cffFF6633杀敌数|r")
    MultiboardSetItemValue(MultiboardGetItem(mMultiboard, 0, 2), "")
    MultiboardSetItemValue(MultiboardGetItem(mMultiboard, PlayerInfo:Count() + 1, 0), "圈内/最大")

    MultiboardSetItemsStyle(mMultiboard, true, false)
    MultiboardDisplay(mMultiboard, true)

    -- 怪物最大数量
    mMultiboardMaxNum = 40 + PlayerInfo:Count() * (60 - 10 * Game.GetLevel())

    for i = 0, 3 do
        if
        (GetPlayerController(Player(i)) == MAP_CONTROL_USER and
        GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING)
        then
            MultiboardSetItemValue(MultiboardGetItem(mMultiboard, i + 1, 0), GetPlayerName(Player(i)))
        end
    end
end

function Multiboard.UpdateEndLessInfo()
    MultiboardSetItemValue(MultiboardGetItem(mMultiboard, 0, 1), "|cffFF6633积分|r")
    MultiboardSetItemValue(MultiboardGetItem(mMultiboard, 0, 2), "|cffFF6633剩余怪兽数量|r")
    MultiboardSetItemValue(MultiboardGetItem(mMultiboard, PlayerInfo:Count() + 1, 0), "|cffffcc00无尽模式|r")
    MultiboardSetItemValue(MultiboardGetItem(mMultiboard, PlayerInfo:Count() + 1, 1), "")
    MultiboardSetItemValue(MultiboardGetItem(mMultiboard, PlayerInfo:Count() + 1, 2), "")
    for i = 1, PlayerInfo:Count() do
        MultiboardSetItemValue(MultiboardGetItem(mMultiboard, i, 1), 0)
    end
end

function Multiboard.ShowScore(i, score)
    MultiboardSetItemValue(MultiboardGetItem(mMultiboard, i, 1), score)
end

function Multiboard.ShowKillCount(i, killCount)
    MultiboardSetItemValue(MultiboardGetItem(mMultiboard, i, 1), killCount)
end

function Multiboard.ShowLevel(level)
    if (Game.GetLevel() > 2) then
        MultiboardSetItemValue(MultiboardGetItem(mMultiboard, PlayerInfo:Count() + 1, 2), "|cffffcc00难度" .. level .. "|r/" .. "|cffffcc00无尽|r")
    else
        MultiboardSetItemValue(MultiboardGetItem(mMultiboard, PlayerInfo:Count() + 1, 2), "|cffffcc00难度" .. level .. "|r")
    end
end

function Multiboard.ShowMonsterCount(count, i)
    if (Game.GetMode() == GameMode.NORMAL) then
        local colorSTR = ""
        mMultiboardCurNum = mMultiboardCurNum + count
        local subNum = mMultiboardMaxNum - mMultiboardCurNum
        if (0 >= subNum) then
            colorSTR = "|cffEE0000"
        elseif (20 >= subNum) then
            colorSTR = "|cffEE7621"
        else
            colorSTR = "|cff66CD00"
        end
        MultiboardSetItemValue(
        MultiboardGetItem(mMultiboard, PlayerInfo:Count() + 1, 1),
        colorSTR .. mMultiboardCurNum .. "|r|cffFFFFFF/" .. mMultiboardMaxNum .. "|r"
        )
    elseif (Game.GetMode() == GameMode.ENDLESS) then
        MultiboardSetItemValue(MultiboardGetItem(mMultiboard, i, 2), count .. "|cffFFFFFF/30|r")
    end

end

function Multiboard.OnGameUpdate(dt)
    if (mMultiboard == nil) then
        return
    end
    mTimeDt = mTimeDt + dt
    if (mTimeDt > 1) then
        mTimeDt = 0
        mTime1 = mTime1 + 1
        if (mTime1 == 60) then
            mTime1 = 1
            mTime2 = mTime2 + 1
            if (mTime2 == 60) then
                mTime2 = 1
                mTime3 = mTime3 + 1
            end
        end
        mTimeStrs[2] = mTime3
        mTimeStrs[4] = mTime2
        mTimeStrs[6] = mTime1
        MultiboardSetTitleText(mMultiboard, table.concat(mTimeStrs))
    end
end