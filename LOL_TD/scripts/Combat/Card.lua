Card = {}

CardType = { SR, UR, GR }

--"31",暂时屏蔽蓝色远古魔像
local NId = { "30", "32", "33", "34", "35", "36", "37" }
local RId = { "38", "41", "42", "43", "44" }

--皇子,菊花信,光辉,小炮,大天使,寒冰 ,蛮子,剑圣,小法师
local SRId = { "02", "03", "04", "06", "07", "12", "16", "19", "21", "25" }

--堕天使,炸弹人,草丛伦 ,冰女，猴子
local SSRId = { "05", "10", "13", "17", "45" }
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
    GetId("I077"),

    GetId("I081"),
    GetId("I088"),
    GetId("I089"),
    GetId("I098"),
    GetId("I101")
}

function Card.RandomN()
    return "IH" .. NId[math.random(1, #NId)]
end

function Card.RandomR()
    return "IH" .. RId[math.random(1, #RId)]
end

function Card.RandomSR()
    return "IH" .. SRId[math.random(1, #SRId)]
end

function Card.RandomSSR()
    return "IH" .. SSRId[math.random(1, #SSRId)]
end

function Card.Random1()
    local random = math.random(1, 10)
    if (random <= 5) then
        return Card.RandomN()
    elseif (random > 5 and random <= 9) then
        return Card.RandomR()
    else
        return Card.RandomSR()
    end
end

function Card.Random2()
    local random = math.random(1, 10)
    if (random <= 2) then
        return "IH" .. RId[math.random(1, #RId)]
    elseif (random > 2 and random <= 9) then
        return "IH" .. SRId[math.random(1, #SRId)]
    else
        return "IH" .. SSRId[math.random(1, #SSRId)]
    end
end

function Card.Random3()
    local random = math.random(1, 20)
    if (random <= 19) then
        return Card.RandomSR()
    else
        return Card.RandomSSR()
    end
end

function Card.Random4()
    local random = math.random(1, 10)
    if (random <= 2) then
        return Card.RandomSR()
    elseif (random > 2) then
        return Card.RandomSSR()
    end
end

--[[所有350金币一下的装备，小兵塔

白银箱子：所有1300金币一下的装备，R卡，SR卡碎片
SR卡碎片1~15
黄金箱子：所有2级装备，SR卡 10~30
SSR 1~20 100个

SR卡需要50碎片 ssr120

开出SR卡碎片箱->开出50个碎片自动合成sr卡
]]
local mRandomBoxCount = 0
function Card.RandomBox1()
    if (mRandomBoxCount <= 0) then
        mRandomBoxCount = math.random(0, 3)
    end
    mRandomBoxCount = mRandomBoxCount - 1
    if (mRandomBoxCount <= 2) then
        return mBox1Item[math.random(1, #mBox1Item)]
    else
        return GetId("IH" .. NId[math.random(1, #NId)])
    end
end

function Card.RandomBox2()
    if (mRandomBoxCount <= 0) then
        mRandomBoxCount = math.random(0, 3)
    end
    mRandomBoxCount = mRandomBoxCount - 1
    if (mRandomBoxCount <= 1) then
        return GetId("IB06")
    elseif (mRandomBoxCount <= 2) then
        return GetId("IH" .. RId[math.random(1, #RId)])
    else
        return mBox2Item[math.random(1, #mBox2Item)]
    end
end

function Card.RandomBox3()
    if (mRandomBoxCount <= 0) then
        mRandomBoxCount = math.random(0, 4)
    end
    mRandomBoxCount = mRandomBoxCount - 1
    if (mRandomBoxCount <= 2) then
        return GetId("IB07")
    else
        return mBox3Item[math.random(1, #mBox3Item)]
    end
end

local mDropList = {
    GetId("IB01"),
    GetId("IB01"),
    GetId("IB01"),
    GetId("IB01"),
    GetId("IB01"),
    GetId("IB01"),
    0,
    GetId("IB02"),
    0,
    GetId("IB02"),
    0,
    GetId("IB02"),
    0,
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