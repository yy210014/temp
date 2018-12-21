Card = {}

CardType = { SR, UR, GR }

local NId = { "30", "31", "32", "33", "34", "35", "36", "37" }
local RId = { "38", "41", "42", "43", "44" }

--皇子,赵信,拉克丝,小炮,天使凯尔,艾希 ,丽桑卓,易大师,小法师
local SRId = { "02", "03", "04", "06", "07", "12", "17", "19", "21" }

--莫甘娜,炸弹人,盖伦 ,蛮王
local SSRId = { "05", "10", "13", "16" }
local GRId = { 1, 1 }

local mBox1Item = {
    GetId("I001"),
    GetId("I002"),
    GetId("I003"),
    GetId("I004"),
    GetId("I005"),
    GetId("I006"),
    GetId("I007"),
    GetId("I008"),
    GetId("I009")
}
local mBox2Item = {
    GetId("I010"),
    GetId("I011"),
    GetId("I013"),
    GetId("I028"),
    GetId("I029"),
    GetId("I031"),
    GetId("I035"),
    GetId("I037"),
    GetId("I039"),
    GetId("I041"),
    GetId("I081"),
    GetId("I088"),
    GetId("I089")
}
local mBox3Item = {
    GetId("I015"),
    GetId("I017"),
    GetId("I019"),
    GetId("I021"),
    GetId("I023"),
    GetId("I025"),
    GetId("I033"),
    GetId("I062"),
    GetId("I077")
}

function Card.RandomSR()
    return "IH" .. SRId[math.random(1, #SRId)]
end

function Card.RandomSSR()
    return "IH" .. SSRId[math.random(1, #SSRId)]
end

function Card.Random1()
    local random = math.random(1, 10)
    if (random <= 4) then
        return "IH" .. NId[math.random(1, #NId)]
    elseif (random > 4 and random <= 8) then
        return "IH" .. RId[math.random(1, #RId)]
    elseif (random > 8) then
        return "IH" .. SRId[math.random(1, #SRId)]
    end
end

function Card.Random2()
    local random = math.random(1, 10)
    if (random <= 3) then
        return "IH" .. RId[math.random(1, #RId)]
    elseif (random > 3 and random <= 9) then
        return "IH" .. SRId[math.random(1, #SRId)]
    elseif (random > 9) then
        return "IH" .. SSRId[math.random(1, #SSRId)]
    end
end


function Card.Random4()
    local random = math.random(1, 10)
    if (random <= 7) then
        return "IH" .. SRId[math.random(1, #SRId)]
    elseif (random > 7) then
        return "IH" .. SSRId[math.random(1, #SSRId)]
    end
end

--[[所有350金币一下的装备，小兵塔

白银箱子：所有1300金币一下的装备，R卡，SR卡碎片
SR卡碎片1~15
黄金箱子：所有2级装备，SR卡 10~30
SSR 1~20 100个

SR卡需要50碎片 ssr120
]]
local b = {}
function Card.RandomBox1()
    local random = math.random(1, 3)
    if (random <= 2) then
        return mBox1Item[math.random(1, #mBox1Item)]
    else
        return GetId("IH" .. NId[math.random(1, #NId)])
    end
end

function Card.RandomBox2()
    local random = math.random(1, 2)
    if (random == 1) then
        return mBox2Item[math.random(1, #mBox2Item)]
    elseif (random == 2) then
        return GetId("IH" .. RId[math.random(1, #RId)])
    else
        return GetId("IB04")
    end
end

function Card.RandomBox3()
    local random = math.random(1, 2)
    if (random == 1) then
        return mBox3Item[math.random(1, #mBox3Item)]
    elseif (random == 2) then
        return GetId("IB04")
    else
        return GetId("IB05")
    end
end

local mDropList = {
    GetId("IB01"),
    GetId("IB01"),
    GetId("IB01"),
    GetId("IB02"),
    GetId("IB02"),
    GetId("IB03"),
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
}

function Card.RandomDrop()
    return mDropList[math.random(1, #mDropList)]
end