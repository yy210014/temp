local item = Items["大师召唤"]

--使用卡片发送事件到Card
--Card收到事件从随机卡片列表里移除使用的卡片
function item:OnUse()
    local unit = self.Owner
    local itemID = GetId(Card.Random3())
    UnitAddItem(unit.Entity, CreateItem(itemID, unit:X(), unit:Y()))
end
