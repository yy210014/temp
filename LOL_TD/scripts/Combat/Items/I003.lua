local item = Items["萃取"]
item.Count = 0

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 5)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -5)
end

function item:OnKill(dieUnit)
    if (self.Count > 100) then
        return
    end
    self.Count = self.Count + 1
    local gold = GetPlayerState(self.Owner.Player, PLAYER_STATE_RESOURCE_GOLD)
    local unit = self.Owner
    if (self.Count < 100) then
        SetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD, gold + 1)
        self:SetCharges(self.Count)
    elseif (self.Count == 100) then
        SetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD, gold + 300)
        self:SetCharges(self.Count)
    end
end
