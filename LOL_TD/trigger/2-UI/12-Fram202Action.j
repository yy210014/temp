//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Fram202ActionActions takes nothing returns nothing
    if ( ( DzGetTriggerUIEventPlayer() == GetLocalPlayer() ) ) then
        if udg_ui_isHEOpen[GetPlayerId(DzGetTriggerUIEventPlayer())] == false then
            call DzFrameShow(udg_Frames[203], true)
            set udg_ui_isHEOpen[GetPlayerId(DzGetTriggerUIEventPlayer())] = true
         //   call RefreshItemCell(DzGetTriggerUIEventPlayer())
        else
            call DzFrameShow(udg_Frames[203], false)
            set udg_ui_isHEOpen[GetPlayerId(DzGetTriggerUIEventPlayer())] = false
        endif
    endif
endfunction

//===========================================================================
function InitTrig_Fram202Action takes nothing returns nothing
    set gg_trg_Fram202Action = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg_Fram202Action, "Fram202Action")
#endif
    call TriggerAddAction(gg_trg_Fram202Action, function Trig_Fram202ActionActions)
endfunction

