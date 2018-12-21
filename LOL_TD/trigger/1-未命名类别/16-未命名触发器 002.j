//TESH.scrollpos=1
//TESH.alwaysfold=0
function Trig____________________002Func001FT takes nothing returns nothing
    local unit selectedUnit
    local item it
    local integer id
    local integer goldcost
    local integer indexItem 
    set selectedUnit = udg_SelectedHeros[GetPlayerId(DzGetTriggerUIEventPlayer())]
    set id = udg_SelectedItemId[GetPlayerId(DzGetTriggerUIEventPlayer())]
    if (             (selectedUnit != null and id!=0 )) then
        if ((UnitInventoryCount(selectedUnit) >= 6)) then
            call DisplayTextToPlayer( DzGetTriggerUIEventPlayer(), 0, 0, "TRIGSTR_3222" )
        else
            set goldcost = YDWEGetObjectPropertyInteger(YDWE_OBJECT_TYPE_ITEM, id , "goldcost")
            set bj_forLoopAIndex = 0
            set bj_forLoopAIndexEnd = 5
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set it = UnitItemInSlot(selectedUnit, bj_forLoopAIndex)
                if ((udg_CellHasItem[bj_forLoopAIndex] == true)) then
                    set goldcost = goldcost - S2I(YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, GetItemTypeId(it), "goldcost"))
                else
                endif
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            if ((goldcost <= GetPlayerState(DzGetTriggerUIEventPlayer(), PLAYER_STATE_RESOURCE_GOLD))) then
                call DisplayTextToPlayer( DzGetTriggerUIEventPlayer(), 0, 0, "TRIGSTR_3223" )
                set bj_forLoopAIndex = 0
                set bj_forLoopAIndexEnd = 5
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    set it = UnitItemInSlot(selectedUnit, bj_forLoopAIndex)
                    if ((udg_CellHasItem[bj_forLoopAIndex] == true)) then
                        call DzSyncData( "AddItem2", I2S(bj_forLoopAIndex) )
                    else
                    endif
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
                call DzSyncData( "AddItem", I2S(id) )
                call DzSyncData( "BuyItem", I2S(goldcost) )
            else
                call DisplayTextToPlayer( DzGetTriggerUIEventPlayer(), 0, 0, "TRIGSTR_3224" )
            endif
        endif
    else
    endif
endfunction

function Trig____________________002Actions takes nothing returns nothing
    YDLocalInitialize()
    if GetLocalPlayer() == ConvertedPlayer(ydul_p) then
    	call DzFrameSetScriptByCode( DzFrameFindByName("ABB2", 0), 1, function Trig____________________002Func001FT, false)
    endif
    call YDLocal1Release()
endfunction

//===========================================================================
function InitTrig____________________002 takes nothing returns nothing
    set gg_trg____________________002 = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg____________________002, "未命名触发器 002")
#endif
    call TriggerAddAction(gg_trg____________________002, function Trig____________________002Actions)
endfunction

