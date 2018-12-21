//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_RefrshItemCellConditions takes nothing returns boolean
    return ((GetTriggerUnit() == udg_SelectedHeros[GetPlayerId(GetTriggerPlayer())]))
endfunction

function Trig_RefrshItemCellActions takes nothing returns nothing
    if ( ( GetTriggerPlayer() == GetLocalPlayer() ) ) then
        call RefreshItemCell(GetTriggerPlayer())
    endif
endfunction

//===========================================================================
function InitTrig_RefrshItemCell takes nothing returns nothing
    set gg_trg_RefrshItemCell = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( gg_trg_RefrshItemCell, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition(gg_trg_RefrshItemCell, Condition(function Trig_RefrshItemCellConditions))
    call TriggerAddAction(gg_trg_RefrshItemCell, function Trig_RefrshItemCellActions)
    
    set gg_trg_RefrshItemCell = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( gg_trg_RefrshItemCell, EVENT_PLAYER_UNIT_DROP_ITEM )
    call TriggerAddCondition(gg_trg_RefrshItemCell, Condition(function Trig_RefrshItemCellConditions))
    call TriggerAddAction(gg_trg_RefrshItemCell, function Trig_RefrshItemCellActions)
endfunction

