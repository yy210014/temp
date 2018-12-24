Item = {}
local mt = {}
Item.__index = mt
mt.Owner = nil
mt.Entity = nil --实体
mt.Name = ""
mt.Id = 0

--合成列表
local mItemComList = {
    ["I012"] = { GetId("I013"), GetId("I004"), GetId("I004") }, --反曲之弓（卷轴）:短剑+短剑+反曲之弓
    ["I014"] = { GetId("I015"), GetId("I004"), GetId("I006") }, --狂热黄叉（卷轴）:短剑+格斗手套+狂热黄叉
    ["I016"] = { GetId("I017"), GetId("I005") }, --轻语（卷轴）:长剑+轻语
    ["I018"] = { GetId("I019"), GetId("I005"), GetId("I005") }, --锯齿短匕（卷轴）:长剑+长剑+锯齿短匕
    ["I020"] = { GetId("I021"), GetId("I005"), GetId("I005") }, --考尔菲德的战锤（卷轴）:长剑+长剑+考尔菲德的战锤
    ["I022"] = { GetId("I023"), GetId("I005") }, --小木槌（卷轴）:长剑+小木槌
    ["I024"] = { GetId("I025"), GetId("I005"), GetId("I005") }, --提亚马特（卷轴）:长剑+长剑+提亚马特
    ["I026"] = { GetId("I027"), GetId("I015"), GetId("I004") }, --电刀（卷轴）:狂热黄叉+短剑+电刀
    ["I030"] = { GetId("I031"), GetId("I007"), GetId("I008") }, --女神之泪（卷轴）:蓝水晶+仙女护符+女神之泪
    ["I032"] = { GetId("I033"), GetId("I007") }, --耀光（卷轴）:蓝水晶+耀光
    ["I034"] = { GetId("I035"), GetId("I009"), GetId("I008"), GetId("I008") }, --和谐圣杯（卷轴）:增幅典籍+仙女护符+仙女护符+和谐圣杯
    ["I036"] = { GetId("I037"), GetId("I009") }, --恶魔法典（卷轴）:增幅典籍+恶魔法典
    ["I038"] = { GetId("I039"), GetId("I008"), GetId("I008") }, --禁忌雕像（卷轴）:仙女护符+仙女护符+禁忌雕像
    ["I040"] = { GetId("I041"), GetId("I009"), GetId("I007") }, --遗失的章节（卷轴）:增幅典籍+蓝水晶+遗失的章节
    ["I042"] = { GetId("I043"), GetId("I011"), GetId("I011") }, --无尽之刃（卷轴）:暴风大剑+暴风大剑+无尽之刃
    ["I044"] = { GetId("I045"), GetId("I023"), GetId("I033"), GetId("I015") }, --三相之力（卷轴）:小木槌+耀光+狂热黄叉+三相之力
    ["I046"] = { GetId("I047"), GetId("I031"), GetId("I010") }, --魔宗（卷轴）:女神之泪+十字镐+魔宗
    ["I049"] = { GetId("I050"), GetId("I023"), GetId("I021") }, --黑切（卷轴）:小木槌+考尔菲德的战锤+黑切
    ["I051"] = { GetId("I052"), GetId("I025"), GetId("I010") }, --九头蛇（卷轴）:提亚马特+十字镐+九头蛇
    ["I053"] = { GetId("I054"), GetId("I021"), GetId("I019") }, --幕刃（卷轴）:考尔菲德的战锤+锯齿短匕+幕刃
    ["I055"] = { GetId("I056"), GetId("I015"), GetId("I004"), GetId("I004") }, --幻影之舞（卷轴）:狂热黄叉+短剑+短剑+幻影之舞
    ["I057"] = { GetId("I058"), GetId("I015"), GetId("I013") }, --飓风（卷轴）:狂热黄叉+反曲之弓+飓风
    ["I059"] = { GetId("I060"), GetId("I023"), GetId("I010") }, --大冰锤（卷轴）:小木槌+十字镐+大冰锤
    ["I063"] = { GetId("I064"), GetId("I033"), GetId("I028") }, --巫妖之祸（卷轴）:耀光+爆裂魔杖+巫妖之祸
    ["I065"] = { GetId("I066"), GetId("I031"), GetId("I029") }, --大天使（卷轴）:女神之泪+无用大棒+大天使
    ["I068"] = { GetId("I069"), GetId("I009"), GetId("I028") }, --法穿棒（卷轴）:增幅典籍+爆裂魔杖+法穿棒
    ["I070"] = { GetId("I071"), GetId("I035"), GetId("I037"), GetId("I039") }, --大圣杯（卷轴）:和谐圣杯+恶魔法典+禁忌雕像+大圣杯
    ["I072"] = { GetId("I073"), GetId("I029"), GetId("I028"), GetId("I009") }, --帽子（卷轴）:无用大棒+爆裂魔杖+增幅典籍+帽子
    ["I074"] = { GetId("I075"), GetId("I037"), GetId("I041"), GetId("I039") }, --莫雷洛秘典（卷轴）:恶魔法典+遗失的章节+禁忌雕像+莫雷洛秘典
    ["I061"] = { GetId("I062"), GetId("I001") }, --杀人剑（卷轴）:多兰剑+杀人剑
    ["I076"] = { GetId("I077"), GetId("I002") }, --杀人书（卷轴）:多兰戒+杀人书
    ["I078"] = { GetId("I079"), GetId("I017") }, --大轻雨（卷轴）:轻语+大轻语
    ["I080"] = { GetId("I081"), GetId("I004"), GetId("I004") }, --峰刺（卷轴）:短剑+短剑+蜂刺
    ["I082"] = { GetId("I083"), GetId("I081"), GetId("I037") }, --纳什之牙（卷轴）:蜂刺+恶魔法典+纳什之牙
    ["I084"] = { GetId("I085"), GetId("I007"), GetId("I021"), GetId("I011") }, --吸蓝刀（卷轴）:蓝水晶+考尔菲德的战锤+暴风大剑+吸蓝刀
    ["I086"] = { GetId("I087"), GetId("I088") }, --日炎斗篷（卷轴）:巨人熔渣+日炎斗篷
    ["I091"] = { GetId("I090"), GetId("I013"), GetId("I010"), GetId("I028") } --羊刀（卷轴）:反曲之弓+十字镐+爆裂魔杖+羊刀
}
--叠加列表
local mItemOverlayList = {
    ["IB01"] = 0,
    ["IB02"] = 0,
    ["IB03"] = 0,
    ["IB04"] = 0,
    ["IB05"] = 0,
    ["IB06"] = 0,
    ["IB07"] = 0
}
--唯一列表
local mItemUniquenessList = {
    ["I003"] = 0
}

function Item.HasItem(unit, itemId, list)
    local item
    for i = 5, 0, -1 do
        item = UnitItemInSlot(unit.Entity, i)
        if item ~= nil and itemId == GetItemTypeId(item) and IsInTable(item, list) == -1 then
            return item
        end
    end
    return nil
end

function Item.ItemUniquenessList(unit, item)
    if (mItemUniquenessList[ID2Str(item.Id)] ~= nil) then
        local v
        for i = 5, 0, -1 do
            v = UnitItemInSlot(unit.Entity, i)
            if v ~= nil and item.Id == GetItemTypeId(v) and v ~= item.Entity then
                DisplayTextToPlayer(unit.Player, 0, 0, "|cffffcc00该装备最多只能携带一件！|r")
                UnitRemoveItem(unit.Entity, item.Entity)
                return
            end
        end
    end
end

function Item.ItemOverlay(unit, item)
    if (mItemOverlayList[ID2Str(item.Id)] ~= nil) then
        local v
        for i = 5, 0, -1 do
            v = UnitItemInSlot(unit.Entity, i)
            if v ~= nil and item.Id == GetItemTypeId(v) and v ~= item.Entity then
                SetItemCharges(v, GetItemCharges(v) + GetItemCharges(item.Entity))
                RemoveItem(item.Entity)
                if (item.Id == GetId("IB04") and GetItemCharges(v) >= 300) then
                    SetItemCharges(v, GetItemCharges(v) - 300)
                    if GetItemCharges(v) == 0 then
                        RemoveItem(v)
                    end
                    local itemAXAD = CreateItem(GetId(Card.RandomSR()), unit:X(), unit:Y())
                    Game.Log("合成卡片： " .. GetItemName(itemAXAD))
                    DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl", unit.Entity, "origin"))
                    UnitAddItem(unit.Entity, itemAXAD)
                elseif (item.Id == GetId("IB05") and GetItemCharges(v) >= 500) then
                    SetItemCharges(v, GetItemCharges(v) - 500)
                    if GetItemCharges(v) == 0 then
                        RemoveItem(v)
                    end
                    local itemAXAD = CreateItem(GetId(Card.RandomSSR()), unit:X(), unit:Y())
                    Game.Log("合成卡片： " .. GetItemName(itemAXAD))
                    DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl", unit.Entity, "origin"))
                    UnitAddItem(unit.Entity, itemAXAD)
                end
                return
            end
        end
    end
end

function Item.ItemCompound(unit)
    local item
    local falg = false
    local deleteList = {}
    for i = 5, 0, -1 do
        item = UnitItemInSlot(unit.Entity, i)
        if (item ~= nil) then
            local list = mItemComList[ID2Str(GetItemTypeId(item))]
            if (list ~= nil) then
                deleteList[#deleteList + 1] = item
                for j = 2, #list do
                    local delfItem = Item.HasItem(unit, list[j], deleteList)
                    if (delfItem == nil) then
                        return false
                    end
                    deleteList[#deleteList + 1] = delfItem
                end
                falg = true
                break
            end
        end
    end

    if (falg == false) then
        return
    end
    local itemId = mItemComList[ID2Str(GetItemTypeId(item))][1]
    for i = #deleteList, 1, -1 do
        RemoveItem(deleteList[i])
        table.remove(deleteList, i)
    end
    deleteList = nil
    local itemAXAD = CreateItem(itemId, unit:X(), unit:Y())
    Game.Log("合成物品： " .. GetItemName(itemAXAD))
    UnitAddItem(unit.Entity, itemAXAD)
    DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl", unit.Entity, "origin"))
    return true
end

local dbg = require "jass.debug"
local gchash = 0

function Item:New(owner, entity)
    local newItem = {}
    local name = FilterStringColor(GetItemName(entity))

    gchash = gchash + 1
    dbg.gchash(newItem, gchash)
    newItem.gchash = gchash

    setmetatable(newItem, { __index = Items[name] })
    newItem.Owner = owner
    newItem.Entity = entity
    newItem.Id = GetItemTypeId(entity)
    newItem.Guid = GetGuid()
    newItem.Charges = 0
    return newItem
end

function Item:OnAdd()
end

function Item:OnRemove()
end

function Item:OnCast()
end

function Item:OnUse()
end

function Item:OnAttack(attactUnit, defUnit)
end

function Item:OnKill(dieUnit)
end

function Item:OnUpgrade()
end

function Item:OnRefresh()
end

function Item:SetIcon(art)
    EXSetItemDataString(self.Id, ITEM_DATA_ART, art)
end

function Item:GetCharges()
    return self.Charges
end

function Item:SetCharges(value)
    if (value <= 0) then
        return
    end
    self.Charges = value
    SetItemCharges(self.Entity, value)
end

Items = setmetatable(
{},
{
    __index = function(self, name)
        self[name] = {}
        setmetatable(self[name], { __index = Item })
        self[name].Name = name
        return self[name]
    end
}
)