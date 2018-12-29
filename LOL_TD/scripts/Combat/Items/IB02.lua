local item = Items["白银宝藏"]

function item:OnUse()
    local unit = self.Owner
    local itemID = Card.RandomBox2()
    UnitAddItem(unit.Entity, CreateItem(itemID, unit:X(), unit:Y()))
end
