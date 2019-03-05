local item = Items["贪婪"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 5)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -5)
end

function item:OnKill(dieUnit)
    if (self:GetCharges() > 100 or Game.GetMode() == GameMode.ENDLESS) then
        return
    end
    local unit = self.Owner
    local count = self:GetCharges() + 1
    if (count < 100) then
        SetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD) + 1)
        CreateGoldText(1, unit.Entity)
        self:SetCharges(count)
    elseif (count == 100) then
        SetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD) + 300)
        CreateGoldText(300, unit.Entity)
        self:SetCharges(count)
    end
end