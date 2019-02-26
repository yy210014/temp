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
    if (gold == "5000") then
        text = "|r召唤出了:|cFFFFFF00" .. GetItemName(item1) .. "|r |cffffcc00,额外获得SSR碎片X15|r"
        item2 = CreateItem(GetId("IB05"), unit:X(), unit:Y())
        SetItemCharges(item2, 15)
    elseif (gold == "3000") then
        text = "|r召唤出了:|cFFFF00FF" .. GetItemName(item1) .. "|r |cffffcc00,额外获得SSR碎片X12|r"
        item2 = CreateItem(GetId("IB04"), unit:X(), unit:Y())
        SetItemCharges(item2, 12)
    else
        text = "|r召唤出了:|cFF00FF00" .. GetItemName(item1) .. "|r |cffffcc00,额外获得SR碎片X5|r"
        item2 = CreateItem(GetId("IB04"), unit:X(), unit:Y())
        SetItemCharges(item2, 5)
    end
    for i = 0, 3 do
        DisplayTextToPlayer(Player(i), 0, 0, "|cffffcc00" .. GetPlayerName(Player(i)) .. text)
    end
    UnitAddItem(unit.Entity, item2)
    UnitAddItem(unit.Entity, item1)
end