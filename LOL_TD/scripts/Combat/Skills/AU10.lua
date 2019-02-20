local skill = Skills["出售"]
local mLastTime = 0
local mArt = "Abilities\\Spells\\Other\\Transmute\\PileofGold.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (IsUnitType(spellUnit.Entity, UNIT_TYPE_HERO)) then
        if (GameScene.Elapsed - mLastTime <= 1) then
            self:OnSell()
            return
        end
        mLastTime = GameScene.Elapsed
        DisplayTextToPlayer(spellUnit.Player, 0, 0, "|cFFFF0000双击出售英雄|r")
    else
        self:OnSell()
    end
end

function skill:OnSell()
    local spellUnit = self.Owner
    --特效
    DestroyEffect(AddSpecialEffect(mArt, spellUnit:X(), spellUnit:Y()))
    local sellGold = Slk.unit[spellUnit.Id]["goldcost"] * 0.5
    SetPlayerState(
    spellUnit.Player,
    PLAYER_STATE_RESOURCE_GOLD,
    GetPlayerState(spellUnit.Player, PLAYER_STATE_RESOURCE_GOLD) + sellGold
    )
    if (spellUnit.UseNum ~= nil) then
        local num = math.floor(spellUnit.UseNum * 0.5)
        SetPlayerState(spellUnit.Player, PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(spellUnit.Player, PLAYER_STATE_RESOURCE_LUMBER) + num)
    end
    CreateGoldText(sellGold, spellUnit.Entity)

    spellUnit:IterateItems(
    function(item)
        UnitRemoveItem(spellUnit.Entity, item.Entity)
    end
    )
    GameStart.AnyUnitSell(spellUnit)
end