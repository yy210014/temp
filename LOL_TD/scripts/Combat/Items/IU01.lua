local item = Items["白金召唤"]

--使用卡片发送事件到Card
--Card收到事件从随机卡片列表里移除使用的卡片
function item:OnUse()
    local unit = self.Owner
    local itemID = Card.Random1()
    UnitAddItem(unit.Entity, CreateItem(GetId(itemID), unit:X(), unit:Y()))
end
