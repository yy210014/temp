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

local mPlayerRewardFlag = { 0, 0, 0, 0 }
function Repick(player, playerID)
    if (1 == mPlayerRewardFlag[playerID + 1]) then
        return
    end
    if (nil == Worke[playerID]) then
        DisplayTextToPlayer(player, 0, 0, "|cffffcc00请等初始化完后再试。|r")
        return
    end
    local item
    for i, v in ipairs(Worke[playerID].Items) do
        if (13 == GetItemLevel(v.Entity)) then
            item = v
        end
    end
    if (nil == item) then
        DisplayTextToPlayer(player, 0, 0, "|cffffcc00请确认物品栏拥有SR卡片。|r")
        return
    end
    mPlayerRewardFlag[playerID + 1] = 1
    RemoveItem(item.Entity)
    local itemID = Card.RandomSR()
    UnitAddItem(Worke[playerID].Entity, CreateItem(GetId(itemID), Worke[playerID]:X(), Worke[playerID]:Y()))
end

local mCheatItems = {
    "03", --赵信
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
    "44"
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
        offX = math.random(0, 600) * math.cos(math.random(0, 360))
        offY = math.random(0, 600) * math.sin(math.random(0, 360))
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
function FilterStringColor(s)
    local startIndex = string.find(s, "|C" or "|c")
    if (startIndex ~= nil) then
        local endIndex = string.find(s, "|r")
        s = string.sub(s, startIndex + 10, endIndex - 1)
    end
    return s
end

function Clamp(value, min, max)
    if (value > max) then
        return max
    end
    if (value < min) then
        return min
    end
    return value
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