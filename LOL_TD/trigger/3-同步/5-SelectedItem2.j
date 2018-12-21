//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_SelectedItemActions takes nothing returns nothing
    set udg_SelectedItemIndex[GetPlayerId(DzGetTriggerSyncPlayer())] = S2I(DzGetTriggerSyncData())
endfunction

//===========================================================================
function InitTrig_SelectedItem2 takes nothing returns nothing
    set gg_trg_SelectedItem2 = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg_SelectedItem2, "SelectedItem2")
#endif
    call DzTriggerRegisterSyncData( gg_trg_SelectedItem2, "AddItem3", false )
    call TriggerAddAction(gg_trg_SelectedItem2, function Trig_SelectedItemActions)
endfunction

