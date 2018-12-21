local skill = Skills["领取福利"]
local mArt = "Abilities\\Spells\\Other\\Transmute\\PileofGold.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    local player = spellUnit.Player
    local addMoney = (GetCurWaveIndex() - 1) * 20 + 40
    local content = ""
    local scale = 1
    if (7 > math.random(1, 10)) then
        --暴击
        scale = 1 + math.floor((math.random(1, 15))) * 0.1
        addMoney = math.floor(addMoney * scale)
        content = "（暴击x" .. math.floor(scale * 100) .. "%）"
    end
    SetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD) + addMoney)
    DestroyEffect(AddSpecialEffect(mArt, spellUnit:X(), spellUnit:Y()))
    DisplayTextToAll(GetPlayerName(player) .. "领取福利获得金币" .. addMoney .. content, Color.yellow)
end
