local item = Items["萃取"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 5)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -5)
end

function item:OnKill(dieUnit)
    if (self:GetCharges() > 100) then
        return
    end
    local gold = GetPlayerState(self.Owner.Player, PLAYER_STATE_RESOURCE_GOLD)
    local unit = self.Owner
    local count = self:GetCharges() + 1
    if (count < 100) then
        SetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD, gold + 1)
        self:SetCharges(count)
    elseif (count == 100) then
        SetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD, gold + 300)
        self:SetCharges(count)
    end
end