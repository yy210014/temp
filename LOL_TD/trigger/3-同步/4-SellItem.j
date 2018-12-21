//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_SellItemActions takes nothing returns nothing
    local unit selectedUnit = udg_SelectedHeros[GetPlayerId(DzGetTriggerSyncPlayer())]
    local item it = GetItemOfTypeFromUnitBJ(selectedUnit ,S2I(DzGetTriggerSyncData()))
    local integer id = GetItemTypeId(it)
    local integer goldcost = YDWEGetObjectPropertyInteger(YDWE_OBJECT_TYPE_ITEM, id , "goldcost")
    call DisplayTextToPlayer(DzGetTriggerSyncPlayer(), 0, 0, "出售"+YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id , "Name")+"成功！" )
    call SetPlayerState(DzGetTriggerSyncPlayer(), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(DzGetTriggerSyncPlayer(), PLAYER_STATE_RESOURCE_GOLD) + R2I(goldcost*0.5))
    call RemoveItem(it)
    
    if DzGetTriggerSyncPlayer() == GetLocalPlayer()then
        call DisableTrigger(gg_trg_RefrshItemCell)
        call RefreshItemCell(DzGetTriggerSyncPlayer())
        call EnableTrigger(gg_trg_RefrshItemCell)
    endif
endfunction

//===========================================================================
function InitTrig_SellItem takes nothing returns nothing
    set gg_trg_SellItem = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg_SellItem, "SellItem")
#endif
    call DzTriggerRegisterSyncData( gg_trg_SellItem, "SellItem", false )
    call TriggerAddAction(gg_trg_SellItem, function Trig_SellItemActions)
endfunction

