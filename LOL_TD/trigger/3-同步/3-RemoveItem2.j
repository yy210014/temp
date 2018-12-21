//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig____________________002Actions takes nothing returns nothing
    local unit selectedUnit = udg_SelectedHeros[GetPlayerId(DzGetTriggerSyncPlayer())]
    call RemoveItem(UnitItemInSlot(selectedUnit, S2I(DzGetTriggerSyncData())))
  //  set udg_CellHasItem[S2I(DzGetTriggerSyncData())] = false
endfunction

//===========================================================================
function InitTrig_RemoveItem2 takes nothing returns nothing
    set gg_trg_RemoveItem2 = CreateTrigger()
    call DzTriggerRegisterSyncData( gg_trg_RemoveItem2, "AddItem2", false )
    call TriggerAddAction(gg_trg_RemoveItem2, function Trig____________________002Actions)
endfunction

