//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Fram104ActionActions takes nothing returns nothing
    if ( ( DzGetTriggerUIEventPlayer() == GetLocalPlayer() ) ) then
        call DzFrameShow(udg_Frames[3], true)
        call DzFrameShow(udg_Frames[106], false)
    endif
endfunction

//===========================================================================
function InitTrig_Fram104Action takes nothing returns nothing
    set gg_trg_Fram104Action = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg_Fram104Action, "Fram104Action")
#endif
    call TriggerAddAction(gg_trg_Fram104Action, function Trig_Fram104ActionActions)
endfunction

