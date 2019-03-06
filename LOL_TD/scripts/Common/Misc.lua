Misc = {}
Misc.PI = 3.14159274

function Misc.Clamp(value, min, max)
    if (value > max) then
        return max
    end
    if (value < min) then
        return min
    end
    return value
end

function Misc.Split(str, reps)
    local resultStrList = {}
    string.gsub(str, '[^' .. reps .. ']+', function(w)
        table.insert(resultStrList, tonumber(w))
    end)
    return resultStrList
end

function Misc.FracIfGreater(v, f)
    local n = v / f
    if (n <= 0) then
        n = 1
    end
    return v - n * f
end

--镜头+
function AddCameraFieldForPlayer()
    local player = GetTriggerPlayer()
    local nowCameraField = GetCameraTargetPositionZ()
    nowCameraField = nowCameraField + 100
    if (nowCameraField > 600) then
        nowCameraField = 600
    end
    SetCameraFieldForPlayer(player, CAMERA_FIELD_ZOFFSET, nowCameraField, 0)
end

--镜头-
function MinusCameraFieldForPlayer()
    local player = GetTriggerPlayer()
    local nowCameraField = GetCameraTargetPositionZ()
    nowCameraField = nowCameraField - 50
    if (nowCameraField < 150) then
        nowCameraField = 150
    end
    SetCameraFieldForPlayer(player, CAMERA_FIELD_ZOFFSET, nowCameraField, 0)
end

local mPlayerMoneyFlag = { 0, 0, 0, 0 }
function AddMoney(player, playerID)
    if (mPlayerMoneyFlag[playerID + 1] == 1) then
        return
    end
    UnitAddItem(Worke[i].Entity, CreateItem(GetId("IB01"), Worke[i]:X(), Worke[i]:Y()))

    --SetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD) + 500)
    DisplayTextToPlayer(player, 0, 0, "|cffffcc00领取天天RPG福利获得一个青铜宝箱!|r")
    mPlayerMoneyFlag[playerID + 1] = mPlayerMoneyFlag[playerID + 1] + 1
end

local mPlayerRewardFlag = { 0, 0, 0, 0 }
function Repick(player, playerID)
    if (mPlayerRewardFlag[playerID + 1] == (PlayerInfo:IsVIP(player) and 2 or 1)) then
        return
    end
    if (nil == Worke[playerID]) then
        DisplayTextToPlayer(player, 0, 0, "|cffffcc00请等初始化完后再试。|r")
        return
    end
    local item, itemId
    for i, v in ipairs(Worke[playerID].Items) do
        if (GetItemLevel(v.Entity) == 13) then
            item = v
            itemId = GetItemTypeId(item.Entity)
        end
    end
    if (nil == item) then
        DisplayTextToPlayer(player, 0, 0, "|cffffcc00请确认物品栏拥有SR卡片。|r")
        return
    end
    mPlayerRewardFlag[playerID + 1] = mPlayerRewardFlag[playerID + 1] + 1
    RemoveItem(item.Entity)
    local tempId = GetId(Card.RandomSR())
    while itemId == tempId do --true 进入
        tempId = GetId(Card.RandomSR())
    end
    UnitAddItem(Worke[playerID].Entity, CreateItem(tempId, Worke[playerID]:X(), Worke[playerID]:Y()))
end

local mCheatItems = {
    "03", --菊花信
    "04",
    "05",
    "06",
    "10",
    "17",
    "21",
    "07",
    "12",
    "13",
    "19",
    "16",
    "02",
    "38",
    "41",
    "42",
    "43",
    "44",
    "45"
}
--作弊
function cheat(playerId)
    if (Worke[playerId] == nil) then
        return
    end
    --创建所有道具到工人身边
    local x = GetUnitX(Worke[playerId].Entity)
    local y = GetUnitY(Worke[playerId].Entity)
    local offX = 0
    local offY = 0
    local id = "IH"
    for i, v in ipairs(mCheatItems) do
        offX = math.random(0, 600) * math.cos(GetRandomReal(0, 6.28))
        offY = math.random(0, 600) * math.sin(GetRandomReal(0, 6.28))
        CreateItem(GetId(id .. v), x + offX, y + offY)
    end
    SetPlayerState(
    Player(playerId),
    PLAYER_STATE_RESOURCE_GOLD,
    GetPlayerState(Player(playerId), PLAYER_STATE_RESOURCE_GOLD) + 100000
    )
    SetPlayerState(
    Player(playerId),
    PLAYER_STATE_RESOURCE_LUMBER,
    GetPlayerState(Player(playerId), PLAYER_STATE_RESOURCE_LUMBER) + 10000
    )
    PlayerInfo:EnableVIP(Player(playerId))
    PlayerInfo:EnableHelp(Player(playerId))
end

function GetGuid()
    local seed = { "e", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" }
    local tb = {}
    for i = 1, 32 do
        table.insert(tb, seed[math.random(1, #seed)])
    end
    local sid = table.concat(tb)
    return string.format(
    "%s-%s-%s-%s-%s",
    string.sub(sid, 1, 8),
    string.sub(sid, 9, 12),
    string.sub(sid, 13, 16),
    string.sub(sid, 17, 20),
    string.sub(sid, 21, 32)
    )
end

function GetId(strName)
    if (strName == nil) then
        Game.LogError("字符串为空")
        return
    end
    local i = string.byte(strName, 1)
    i = i * 256 + string.byte(strName, 2)
    i = i * 256 + string.byte(strName, 3)
    i = i * 256 + string.byte(strName, 4)
    return i
end

function ID2Str(id)
    local s1, s2, s3, s4
    local i, j = math.modf(id / 256)
    s4 = string.char(j * 256)
    i, j = math.modf(i / 256)
    s3 = string.char(j * 256)
    i, j = math.modf(i / 256)
    s2 = string.char(j * 256)
    i, j = math.modf(i / 256)
    s1 = string.char(j * 256)
    return s1 .. s2 .. s3 .. s4
end

--判断数组中某个数是否存在
function IsInTable(value, arr)
    if (arr ~= nil) then
        for i = 1, #arr do
            if arr[i] == value then
                return i
            end
        end
    end
    return -1
end

--过滤字符串颜色代码
function FilterStringColor(str)
    local s = string.lower(str)
    local startIndex = string.find(s, "|c")
    if (startIndex ~= nil) then
        local endIndex = string.find(s, "|r")
        str = string.sub(str, startIndex + 10, endIndex - 1)
    end
    return str
end

function HasItem(unit, itemID)
    local soltIndex = 0
    local item
    while (6 > soltIndex) do
        item = UnitItemInSlot(unit, soltIndex)
        if (itemID == GetItemTypeId(item) and item ~= GetManipulatedItem()) then
            return item
        end
        soltIndex = soltIndex + 1
    end
    return nil
end

function HasItemAtIndex(unit, itemIDList)
    local indexArr = {}
    local soltIndex = 0
    local hasAll = true
    for i, v in ipairs(itemIDList) do
        if (1 < i) then
            hasAll = false
            soltIndex = 0
            while (6 > soltIndex) do
                if (v == GetItemTypeId(UnitItemInSlot(unit, soltIndex)) and -1 == IsInTable(soltIndex, indexArr)) then
                    indexArr[#indexArr + 1] = soltIndex
                    hasAll = true
                    break
                end
                soltIndex = soltIndex + 1
            end
            if (false == hasAll) then
                break
            end
        end
    end
    if (false == hasAll) then
        indexArr = {}
    end
    return indexArr
end