local item = Items["黄金宝箱"]

function item:OnUse()
    local unit = self.Owner
    local itemID = Card.RandomBox3()
    UnitAddItem(unit.Entity, CreateItem(itemID, unit:X(), unit:Y()))
end
