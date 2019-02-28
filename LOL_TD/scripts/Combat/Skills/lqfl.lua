local skill = Skills["发工资"]
skill.IntervalDt = 1
skill.IsAutoUse = false
local mArt = "Abilities\\Spells\\Other\\Transmute\\PileofGold.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    local player = spellUnit.Player
    local addMoney = (MonsterRefresh.GetCurWaveIndex() - 1) * 20 + 30
    local content = ""
    local scale = 1

    if (PlayerInfo:IsHelp(player) or 7 >= math.random(1, 10)) then
        --暴击
        scale = (PlayerInfo:IsHelp(player) and 1.5 or 1) + math.random(1, 15) * 0.1
        addMoney = math.floor(addMoney * scale)
        content = "（暴击x" .. math.floor(scale * 100) .. "%）"
    end
    CreateGoldText(addMoney, spellUnit.Entity)
    SetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD) + addMoney)
    DestroyEffect(AddSpecialEffect(mArt, spellUnit:X(), spellUnit:Y()))

    if (self.IsAutoUse) then
        DisplayTextToAll(GetPlayerName(player) .. "发工资获得金币" .. addMoney .. content .. "|r|cffffcc00[撸圈助手]", Color.yellow)
    else
        DisplayTextToAll(GetPlayerName(player) .. "发工资获得金币" .. addMoney .. content, Color.yellow)
    end
end

function skill:onAuto()
    self.CurAction = self.Action
end

skill.Action = function(self, dt)
    self.TimeDt = self.TimeDt + dt
    if (self.TimeDt >= self.IntervalDt) then
        self.TimeDt = 0
        if (self:IsCD() == false) then
            self.IsAutoUse = true
            local spellUnit = self.Owner
            IssueImmediateOrder(spellUnit.Entity, self.Order)
            self.IsAutoUse = false
        end
    end
end