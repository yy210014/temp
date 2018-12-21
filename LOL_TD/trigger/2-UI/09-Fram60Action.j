//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Fram60ActionActions takes nothing returns nothing
    local unit selectedUnit
    local item it
    local integer id
    local integer goldcost 
    if DzGetTriggerUIEventPlayer() != GetLocalPlayer() or udg_ui_isHEOpen[GetPlayerId(DzGetTriggerUIEventPlayer())] == false then
        return
    endif
    
    set selectedUnit = udg_SelectedHeros[GetPlayerId(DzGetTriggerUIEventPlayer())]
    set id = udg_SelectedItemId[GetPlayerId(DzGetTriggerUIEventPlayer())]
    if id!=0 then
        call DzSyncData( "SellItem", I2S(id))
        set udg_SelectedItemId[GetPlayerId(DzGetTriggerUIEventPlayer())] = 0
    endif
endfunction

//===========================================================================
function InitTrig_Fram60Action takes nothing returns nothing
    set gg_trg_Fram60Action = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg_Fram60Action, "Fram60Action")
#endif
    call TriggerAddAction(gg_trg_Fram60Action, function Trig_Fram60ActionActions)
endfunction

