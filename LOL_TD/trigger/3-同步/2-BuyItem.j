//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_BuyItemActions takes nothing returns nothing
    local integer goldcost = S2I(DzGetTriggerSyncData())
    call SetPlayerStateBJ(DzGetTriggerSyncPlayer(), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(DzGetTriggerSyncPlayer(), PLAYER_STATE_RESOURCE_GOLD) - goldcost )
endfunction

//===========================================================================
function InitTrig_BuyItem takes nothing returns nothing
    set gg_trg_BuyItem = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg_BuyItem, "BuyItem")
#endif
    call DzTriggerRegisterSyncData( gg_trg_BuyItem, "BuyItem", false )
    call TriggerAddAction(gg_trg_BuyItem, function Trig_BuyItemActions)
endfunction

