//TESH.scrollpos=24
//TESH.alwaysfold=0
function Trig_Fram45ActionActions takes nothing returns nothing
    local unit selectedUnit 
    local item it
    local integer id 
    local integer goldcost    
    local integer indexItem    
    
    return
    set selectedUnit = udg_SelectedHeros[GetPlayerId(DzGetTriggerUIEventPlayer())]
    set id = YDWEGetIntegerByString("ItemCell", "SelectedItemId")
    call DisplayTextToPlayer(DzGetTriggerUIEventPlayer(), 0, 0, "购买不掉线" )
    if selectedUnit != null and id!=0 then
        if(UnitInventoryCount(selectedUnit)>=6)then
            call DisplayTextToPlayer(DzGetTriggerUIEventPlayer(), 0, 0, "道具栏已满，购买失败！" )
            return
        endif 
        set goldcost = YDWEGetObjectPropertyInteger(YDWE_OBJECT_TYPE_ITEM, id , "goldcost")
        set bj_forLoopAIndex = 0
        loop
            exitwhen bj_forLoopAIndex > 5
            set it = UnitItemInSlot(selectedUnit, bj_forLoopAIndex)
            if udg_CellHasItem[bj_forLoopAIndex] == true then
                set goldcost = goldcost - S2I(YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, GetItemTypeId(it), "goldcost"))
            endif
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop  
        
        if goldcost<=GetPlayerState(DzGetTriggerUIEventPlayer(), PLAYER_STATE_RESOURCE_GOLD) then
            call DisplayTextToPlayer(DzGetTriggerUIEventPlayer(), 0, 0, "购买道具成功！" )
       //     call DisableTrigger( gg_trg_RefrshItemCell )
            
            set bj_forLoopAIndex = 0
            loop
                exitwhen bj_forLoopAIndex > 5
                set it = UnitItemInSlot(selectedUnit, bj_forLoopAIndex)
                if udg_CellHasItem[bj_forLoopAIndex] == true then
                    set udg_CellHasItem[bj_forLoopAIndex] = false 
                    call RemoveItem(udg_SellItems[bj_forLoopAIndex])
                  //  call DisplayTextToPlayer( Player(0), 0, 0, ( "同步移除道具"  )+I2S(bj_forLoopAIndex) )
                 //   call DzSyncData( "RemoveItem", I2S(bj_forLoopAIndex) )
                endif
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop  
                
            call SetPlayerState(DzGetTriggerUIEventPlayer(), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(DzGetTriggerUIEventPlayer(), PLAYER_STATE_RESOURCE_GOLD) - goldcost)
            //创建道具
         //   set it = CreateItem(id, GetUnitX(selectedUnit), GetUnitY(selectedUnit))
        //    call UnitAddItem(selectedUnit, it)
            call DzSyncData( "AddItem", I2S(id))
            call RefreshItemCell(DzGetTriggerUIEventPlayer())
      //      set indexItem = GetIndexOfItem(selectedUnit,it)
      //      call DzClickFrame(udg_Frames[47+indexItem*2] )
     //       call EnableTrigger( gg_trg_RefrshItemCell )
        else
            call DisplayTextToPlayer(DzGetTriggerUIEventPlayer(), 0, 0, "金币不足，购买失败！" )
        endif 
    endif
endfunction

//===========================================================================
function InitTrig_Fram45Action takes nothing returns nothing
    set gg_trg_Fram45Action = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg_Fram45Action, "Fram45Action")
#endif
    call TriggerAddAction(gg_trg_Fram45Action, function Trig_Fram45ActionActions)
endfunction

