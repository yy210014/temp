Item = {}
local mt = {}
Item.__index = mt
mt.Owner = nil
mt.Entity = nil --实体
mt.Name = ""
mt.Id = 0

--合成列表
local mItemComList = {
    ["I012"] = { GetId("I013"), GetId("I004"), GetId("I004") }, --反曲（卷轴）:反曲+短剑+短剑
    ["I014"] = { GetId("I015"), GetId("I004"), GetId("I006") }, --黄叉（卷轴）:黄叉+短剑+暴击拳套
    ["I016"] = { GetId("I017"), GetId("I005") }, --穿甲弓（卷轴）:穿甲弓+长剑
    ["I018"] = { GetId("I019"), GetId("I005"), GetId("I005") }, --锯齿匕首（卷轴）:锯齿匕首+长剑+长剑
    ["I020"] = { GetId("I021"), GetId("I005"), GetId("I005") }, --战锤（卷轴）:战锤+长剑+长剑
    ["I022"] = { GetId("I023"), GetId("I005") }, --小木槌（卷轴）:小木槌+长剑
    ["I024"] = { GetId("I025"), GetId("I005"), GetId("I005") }, --九头蛇（卷轴）:九头蛇+长剑+长剑
    ["I026"] = { GetId("I027"), GetId("I015"), GetId("I004") }, --电刀（卷轴）:电刀+黄叉+短剑
    ["I030"] = { GetId("I031"), GetId("I007"), GetId("I008") }, --天使之泪（卷轴）:天使之泪+蓝宝石+仙女吊坠
    ["I032"] = { GetId("I033"), GetId("I007") }, --耀光之剑（卷轴）:耀光之剑+蓝宝石
    ["I034"] = { GetId("I035"), GetId("I009"), GetId("I008"), GetId("I008") }, --圣杯（卷轴）:圣杯+增幅法典+仙女吊坠+仙女吊坠
    ["I036"] = { GetId("I037"), GetId("I009") }, --恶魔法书（卷轴）:恶魔法书+增幅法典
    ["I038"] = { GetId("I039"), GetId("I008"), GetId("I008") }, --神秘雕像（卷轴）:神秘雕像+仙女吊坠+仙女吊坠
    ["I040"] = { GetId("I041"), GetId("I009"), GetId("I007") }, --遗失的篇章（卷轴）:遗失的篇章+增幅法典+蓝宝石
    ["I042"] = { GetId("I043"), GetId("I011"), GetId("I011"), GetId("I101") }, --无尽利刃（卷轴）:无尽利刃+暴风大剑+暴风大剑+灵活披风
    ["I044"] = { GetId("I045"), GetId("I023"), GetId("I033"), GetId("I015") }, --三相（卷轴）:三相+小木槌+耀光之剑+黄叉
    ["I046"] = { GetId("I047"), GetId("I031"), GetId("I010") }, --魔宗之刃（卷轴）:魔宗之刃+天使之泪+十字镐
    ["I049"] = { GetId("I050"), GetId("I023"), GetId("I021") }, --切割者（卷轴）:切割者+小木槌+战锤
    ["I051"] = { GetId("I052"), GetId("I025"), GetId("I010") }, --大九头蛇（卷轴）:大九头蛇+九头蛇+十字镐
    ["I053"] = { GetId("I054"), GetId("I021"), GetId("I019") }, --幕刃（卷轴）:幕刃+战锤+锯齿匕首
    ["I055"] = { GetId("I056"), GetId("I015"), GetId("I101"), GetId("I004") }, --红叉（卷轴）:红叉+黄叉+灵活披风+短剑
    ["I057"] = { GetId("I058"), GetId("I015"), GetId("I013") }, --飓风（卷轴）:飓风+黄叉+反曲
    ["I059"] = { GetId("I060"), GetId("I023"), GetId("I010") }, --冰锤（卷轴）:冰锤+小木槌+十字镐
    ["I063"] = { GetId("I064"), GetId("I033"), GetId("I028") }, --巫术法杖（卷轴）:巫术法杖+耀光之剑+小魔杖
    ["I065"] = { GetId("I066"), GetId("I031"), GetId("I029") }, --大天使之杖（卷轴）:大天使之杖+天使之泪+大魔杖
    ["I068"] = { GetId("I069"), GetId("I028"), GetId("I028") }, --法穿棒（卷轴）:法穿棒+小魔杖+小魔杖
    ["I070"] = { GetId("I071"), GetId("I035"), GetId("I037"), GetId("I039") }, --大圣杯（卷轴）:大圣杯+圣杯+恶魔法书+神秘雕像
    ["I072"] = { GetId("I073"), GetId("I029"), GetId("I029"), GetId("I028") }, --帽子（卷轴）:帽子+大魔杖+大魔杖+小魔杖
    ["I074"] = { GetId("I075"), GetId("I037"), GetId("I041"), GetId("I039") }, --鬼书（卷轴）:鬼书+恶魔法书+遗失的篇章+神秘雕像
    ["I061"] = { GetId("I062"), GetId("I001") }, --杀人剑（卷轴）:杀人剑+新手剑
    ["I076"] = { GetId("I077"), GetId("I002") }, --杀人书（卷轴）:杀人书+新手戒
    ["I078"] = { GetId("I079"), GetId("I010"), GetId("I017") }, --破甲弓（卷轴）:破甲弓+十字镐+穿甲弓
    ["I080"] = { GetId("I081"), GetId("I004"), GetId("I004") }, --速刃（卷轴）:速刃+短剑+短剑
    ["I082"] = { GetId("I083"), GetId("I081"), GetId("I037") }, --纳什之牙（卷轴）:纳什之牙+速刃+恶魔法书
    ["I084"] = { GetId("I085"), GetId("I007"), GetId("I021"), GetId("I011") }, --吸蓝刀（卷轴）:吸蓝刀+蓝宝石+战锤+暴风大剑
    ["I086"] = { GetId("I087"), GetId("I088"), GetId("I092") }, --烈焰斗篷（卷轴）:烈焰斗篷+火焰之心+火焰宝石
    ["I091"] = { GetId("I090"), GetId("I013"), GetId("I010"), GetId("I028") }, --羊刀（卷轴）:羊刀+反曲+十字镐+小魔杖
    ["I093"] = { GetId("I094"), GetId("I041"), GetId("I029") }, --回声法杖（卷轴）:回声法杖+遗失的篇章+大魔杖
    ["I097"] = { GetId("I098"), GetId("I009"), GetId("I007") }, --面具（卷轴）:面具+增幅法典+蓝宝石
    ["I099"] = { GetId("I100"), GetId("I098"), GetId("I028") }, --痛苦面具（卷轴）:痛苦面具+面具+小魔杖
    ["I095"] = { GetId("I096"), GetId("I028"), GetId("I009"), GetId("I007") }, --冰杖（卷轴）:冰杖+小魔杖+增幅典籍+蓝宝石
}
--叠加列表
local mItemOverlayList = {
    ["IB01"] = 0,
    ["IB02"] = 0,
    ["IB03"] = 0,
    ["IB04"] = 0,
    ["IB05"] = 0,
    ["IB06"] = 0,
    ["IB07"] = 0,
    ["I089"] = 0
}
--唯一列表
local mItemUniquenessList = {
    ["I003"] = 0,
    ["I062"] = 0,
    ["I077"] = 0,
    ["I067"] = 0,
    ["I048"] = 0,
}

function Item.HasItem(unit, itemId, list)
    local item = nil
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
        unit:IterateItems(
        function(v)
            if item.Id == v.Id and v ~= item then
                DisplayTextToPlayer(unit.Player, 0, 0, "|cffffcc00该装备最多只能携带一件！|r")
                UnitRemoveItem(unit.Entity, item.Entity)
                return
            end
        end
        )
    end
end

function Item.ItemOverlay(unit, item)
    if (mItemOverlayList[ID2Str(item.Id)] ~= nil) then
        unit:IterateItems(
        function(v)
            if item.Id == v.Id and v ~= item then
                local entity = v.Entity
                local entityCount = GetItemCharges(entity)
                SetItemCharges(entity, entityCount + GetItemCharges(item.Entity))
                entityCount = GetItemCharges(entity)
                RemoveItem(item.Entity)
                if (item.Id == GetId("IB04") and entityCount >= 120) then
                    SetItemCharges(entity, entityCount - 120)
                    if entityCount == 120 then
                        RemoveItem(entity)
                    end
                    local itemAXAD = CreateItem(GetId(Card.RandomSR()), unit:X(), unit:Y())
                    DisplayTextToPlayer(unit.Player, 0, 0, "|cffffcc00合成卡片：" .. GetItemName(itemAXAD) .. "|r")
                    DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl", unit.Entity, "origin"))
                    UnitAddItem(unit.Entity, itemAXAD)
                elseif (item.Id == GetId("IB05") and entityCount >= 150) then
                    SetItemCharges(entity, entityCount - 150)
                    if entityCount == 150 then
                        RemoveItem(entity)
                    end
                    local itemAXAD = CreateItem(GetId(Card.RandomSSR()), unit:X(), unit:Y())
                    DisplayTextToPlayer(unit.Player, 0, 0, "|cffffcc00合成卡片：" .. GetItemName(itemAXAD) .. "|r")
                    DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl", unit.Entity, "origin"))
                    UnitAddItem(unit.Entity, itemAXAD)
                end
                return
            end
        end
        )
    end
end

function Item.ItemCompound(unit)
    local item
    local falg = false
    local deleteList = nil
    local id
    for i = 5, 0, -1 do
        item = UnitItemInSlot(unit.Entity, i)
        if (item ~= nil and GetItemLevel(item) == 12) then
            id = ID2Str(GetItemTypeId(item))
            local list = mItemComList[id]
            if (list ~= nil) then
                deleteList = {}
                deleteList[#deleteList + 1] = item
                for j = 2, #list do
                    local delfItem = Item.HasItem(unit, list[j], deleteList)
                    if (delfItem == nil) then
                        break
                    end
                    deleteList[#deleteList + 1] = delfItem
                end
                if (#deleteList == #list) then
                    falg = true
                    break
                end
            end
        end
    end

    if (falg == false) then
        return
    end
    local itemId = mItemComList[ID2Str(GetItemTypeId(item))][1]
    local num = 0
    for i = #deleteList, 1, -1 do
        if (GetItemCharges(deleteList[i]) > 1) then
            num = GetItemCharges(deleteList[i])
        end
        RemoveItem(deleteList[i])
        table.remove(deleteList, i)
    end
    deleteList = nil
    local itemAXAD = CreateItem(itemId, unit:X(), unit:Y())
    if (num ~= 0) then
        SetItemCharges(itemAXAD, num)
    end
    Game.Log("合成物品： " .. GetItemName(itemAXAD))
    UnitAddItem(unit.Entity, itemAXAD)

    DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl", unit.Entity, "origin"))
    return true
end


function Item:New(owner, entity)
    local newItem = {}
    local name = FilterStringColor(GetItemName(entity))
    setmetatable(newItem, { __index = Items[name] })
    newItem.Owner = owner
    newItem.Entity = entity
    newItem.Id = GetItemTypeId(entity)
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

function Item:OnSkillDamage(defUnit)
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
    return GetItemCharges(self.Entity)
end

function Item:SetCharges(value)
    if (value <= 0) then
        return
    end
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