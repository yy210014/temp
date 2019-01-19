local item = Items["轻盈之花"]

function item:OnAdd()
    local unit = self.Owner
    if (PlayerInfo:GetScore(unit.Player) >= 300) then
        PlayerInfo.AddScore(unit.Player, -300)
        AddPlayerTechResearched(unit.Player, GetId("R006"), 1)
        DisplayTextToAll("兑换皮肤成功,当前剩余积分：" .. PlayerInfo:GetScore(unit.Player), Color.yellow)
    else
        DisplayTextToAll("积分不足兑换失败,当前剩余积分：" .. PlayerInfo:GetScore(unit.Player), Color.yellow)
    end
end

local item = Items["时光之轮"]

function item:OnAdd()
    local unit = self.Owner
    if (PlayerInfo:GetScore(unit.Player) >= 800) then
        PlayerInfo.AddScore(unit.Player, -800)
        AddPlayerTechResearched(unit.Player, GetId("R007"), 1)
        DisplayTextToAll("兑换皮肤成功,当前剩余积分：" .. PlayerInfo:GetScore(unit.Player), Color.yellow)
    else
        DisplayTextToAll("积分不足兑换失败,当前剩余积分：" .. PlayerInfo:GetScore(unit.Player), Color.yellow)
    end
end

local item = Items["红炎翅膀"]

function item:OnAdd()
    local unit = self.Owner
    if (PlayerInfo:GetScore(unit.Player) >= 500) then
        PlayerInfo.AddScore(unit.Player, -500)
        AddPlayerTechResearched(unit.Player, GetId("R008"), 1)
        DisplayTextToAll("兑换皮肤成功,当前剩余积分：" .. PlayerInfo:GetScore(unit.Player), Color.yellow)
    else
        DisplayTextToAll("积分不足兑换失败,当前剩余积分：" .. PlayerInfo:GetScore(unit.Player), Color.yellow)
    end
end

local item = Items["暗紫翅膀"]

function item:OnAdd()
    local unit = self.Owner
    if (PlayerInfo:GetScore(unit.Player) >= 1000) then
        PlayerInfo.AddScore(unit.Player, -1000)
        AddPlayerTechResearched(unit.Player, GetId("R009"), 1)
        DisplayTextToAll("兑换皮肤成功,当前剩余积分：" .. PlayerInfo:GetScore(unit.Player), Color.yellow)
    else
        DisplayTextToAll("积分不足兑换失败,当前剩余积分：" .. PlayerInfo:GetScore(unit.Player), Color.yellow)
    end
end

local item = Items["火柴人"]

function item:OnAdd()
    local unit = self.Owner
    if (PlayerInfo:GetScore(unit.Player) >= 1500) then
        PlayerInfo.AddScore(unit.Player, -1500)
        AddPlayerTechResearched(unit.Player, GetId("R010"), 1)
        DisplayTextToAll("兑换皮肤成功,当前剩余积分：" .. PlayerInfo:GetScore(unit.Player), Color.yellow)
    else
        DisplayTextToAll("积分不足兑换失败,当前剩余积分：" .. PlayerInfo:GetScore(unit.Player), Color.yellow)
    end
end