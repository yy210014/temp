local item = Items["SSR卡碎片袋"]

function item:OnUse()
    local unit = self.Owner
    local itemID = GetId("IB05")
    local entity = CreateItem(itemID, unit:X(), unit:Y())
    SetItemCharges(entity, math.random(10, 50))
    UnitAddItem(unit.Entity, entity)
end
