local item = Items["青铜宝藏"]

function item:OnUse()
    local unit = self.Owner
    local itemID = Card.RandomBox1()
    UnitAddItem(unit.Entity, CreateItem(itemID, unit:X(), unit:Y()))
end
