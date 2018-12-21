//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AddItemActions takes nothing returns nothing
   // local integer indexItem
    local integer itemId = S2I(DzGetTriggerSyncData())
    local unit selectedUnit = udg_SelectedHeros[GetPlayerId(DzGetTriggerSyncPlayer())]
    local item it = CreateItem(itemId, GetUnitX(selectedUnit), GetUnitY(selectedUnit))
    call UnitAddItem(selectedUnit, it)
    //set indexItem = GetIndexOfItem(selectedUnit,it)
   // call DzClickFrame(udg_Frames[47+indexItem*2] )
  //  call DisplayTextToPlayer( Player(0), 0, 0, ( "AddItem:" + DzGetTriggerSyncData() ) )
endfunction

//===========================================================================
function InitTrig_AddItem takes nothing returns nothing
    set gg_trg_AddItem = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg_AddItem, "AddItem")
#endif
    call DzTriggerRegisterSyncData( gg_trg_AddItem, "AddItem", false )
    call TriggerAddAction(gg_trg_AddItem, function Trig_AddItemActions)
endfunction

