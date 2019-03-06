local item = Items["钻石召唤"]

--使用卡片发送事件到Card
--Card收到事件从随机卡片列表里移除使用的卡片
function item:OnUse()
    local unit = self.Owner
    local itemID = GetId(Card.Random2())
    local item1 = CreateItem(itemID, unit:X(), unit:Y())

    local gold = Slk.item[itemID]["goldcost"]
    local item2 = nil
    local text = nil

    local isHelp = PlayerInfo:IsHelp(unit.Player)
    local count = 5
    if (gold == "5000") then
        count = isHelp and 22 or 15
        text = "|r召唤出了:|cFFFFFF00" .. GetItemName(item1) .. "|r |cffffcc00,额外获得SSR碎片X" .. count
        item2 = CreateItem(GetId("IB05"), unit:X(), unit:Y())
        SetItemCharges(item2, count)
    elseif (gold == "3000") then
        count = isHelp and 18 or 12
        text = "|r召唤出了:|cFFFF00FF" .. GetItemName(item1) .. "|r |cffffcc00,额外获得SR碎片X" .. count
        item2 = CreateItem(GetId("IB04"), unit:X(), unit:Y())
        SetItemCharges(item2, count)
    else
        count = isHelp and 7 or 5
        text = "|r召唤出了:|cFF00FF00" .. GetItemName(item1) .. "|r |cffffcc00,额外获得SR碎片X" .. count
        item2 = CreateItem(GetId("IB04"), unit:X(), unit:Y())
        SetItemCharges(item2, count)
    end
    for i = 0, 3 do
        DisplayTextToPlayer(Player(i), 0, 0, "|cffffcc00" .. GetPlayerName(unit.Player) .. text)
    end
    UnitAddItem(unit.Entity, item2)
    UnitAddItem(unit.Entity, item1)
end