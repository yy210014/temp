//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Fram105ActionActions takes nothing returns nothing
    if ( ( DzGetTriggerUIEventPlayer() == GetLocalPlayer() ) ) then
        call DzFrameShow(udg_Frames[3], false)
        call DzFrameShow(udg_Frames[106], true)
    endif
endfunction

//===========================================================================
function InitTrig_Fram105Action takes nothing returns nothing
    set gg_trg_Fram105Action = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg_Fram105Action, "Fram105Action")
#endif
    call TriggerAddAction(gg_trg_Fram105Action, function Trig_Fram105ActionActions)
endfunction

