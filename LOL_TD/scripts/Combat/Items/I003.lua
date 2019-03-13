local item = Items["贪婪"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", 5)

    local p = GetJ_Player(unit.Player)
    if (p.I003Count == nil) then
        p.I003Count = 0
    end
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
        SetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD) + 2)
        CreateGoldText(2, unit.Entity)
        self:SetCharges(count)
    elseif (count == 100) then
        SetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD) + 400)
        CreateGoldText(400, unit.Entity)
        DisplayTextToPlayer(self.Owner.Player, 0, 0, "|cFF00FF00您的贪婪已经叠满，获得了400金币!|r")
        --self:SetCharges(count)
        --[[   if (PlayerInfo:IsHelp(unit.Player)) then
            SetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD) - 200)
            self:SetCharges(0)
        end]]
        RemoveItem(self.Entity)
        local p = GetJ_Player(unit.Player)
        p.I003Count = p.I003Count + 1
        if (p.I003Count == 6) then
            local newItem = CreateItem(GetId("IA03"), unit:X(), unit:Y())
            UnitAddItem(unit.Entity, newItem)
        end
    end
end