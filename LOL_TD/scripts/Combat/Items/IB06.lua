local item = Items["SR卡碎片袋"]

function item:OnUse()
    local unit = self.Owner
    local itemID = GetId("IB04")
    local entity = CreateItem(itemID, unit:X(), unit:Y())
    local count = math.random(10, 50)
    SetItemCharges(entity, count)
    UnitAddItem(unit.Entity, entity)
    DisplayTextToPlayer(unit.Player, 0, 0, "|cffffcc00获得了" .. count .. "个SR卡碎片|r")
end