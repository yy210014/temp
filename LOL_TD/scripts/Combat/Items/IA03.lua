local item = Items["巨贪"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 30)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -30)
end

function item:OnKill(dieUnit)
    if (self:GetCharges() > 666 or Game.GetMode() == GameMode.ENDLESS) then
        return
    end
    local unit = self.Owner
    local count = self:GetCharges() + 1
    if (count < 666) then
        SetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD) + 3)
        CreateGoldText(3, unit.Entity)
        self:SetCharges(count)
    elseif (count == 666) then
        SetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD) + 3000)
        CreateGoldText(3000, unit.Entity)
        self:SetCharges(count)
        DisplayTextToPlayer(self.Owner.Player, 0, 0, "您的巨贪已经叠满，获得了3000金币!")
    end
end