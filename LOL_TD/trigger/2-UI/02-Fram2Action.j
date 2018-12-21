//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Fram2Action takes nothing returns nothing
    if ( ( DzGetTriggerUIEventPlayer() == GetLocalPlayer() ) ) then
        if udg_ui_isHEOpen[GetPlayerId(DzGetTriggerUIEventPlayer())] == false then
            call DzFrameShow(udg_Frames[3], true)
            set udg_ui_isHEOpen[GetPlayerId(DzGetTriggerUIEventPlayer())] = true
            call RefreshItemCell(DzGetTriggerUIEventPlayer())
        else
            call DzFrameShow(udg_Frames[3], false)
            set udg_ui_isHEOpen[GetPlayerId(DzGetTriggerUIEventPlayer())] = false
        endif
    endif
endfunction

//===========================================================================
function InitTrig_Fram2Action takes nothing returns nothing
    set gg_trg_Fram2Action = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg_Fram2Action, "Fram2Action")
#endif
    call TriggerAddAction(gg_trg_Fram2Action, function Trig_Fram2Action)
endfunction

