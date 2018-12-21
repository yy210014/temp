//TESH.scrollpos=15
//TESH.alwaysfold=0
function Trig_Trig8Actions takes nothing returns nothing
    local unit selectedUnit
    local item it
    local integer goldcost
    local integer id
    local integer index = 0
    local integer itemIndex = 5
    local string newArt
    if ((DzGetTriggerUIEventPlayer() == GetLocalPlayer())) then
        set selectedUnit = udg_SelectedHeros[GetPlayerId(DzGetTriggerUIEventPlayer())]
        set id = udg_SelectedItemId[GetPlayerId(DzGetTriggerUIEventPlayer())]
        set goldcost = S2I(YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id, "goldcost"))
        if (selectedUnit == null or id==0 ) then
            call DisplayTextToPlayer( DzGetTriggerUIEventPlayer(), 0, 0, "|cffff0000请确认您当前选择的单位拥有道具栏！|r" )
            return
        endif
         if ((UnitInventoryCount(selectedUnit) >= 6)) then
            call DisplayTextToPlayer( DzGetTriggerUIEventPlayer(), 0, 0, "道具栏已满，购买失败！" )
         else
            <?for k,v in pairs(ItemComs) do?> //一重循环
                if (id  == <?=k?>)then
                    <?for k2, v2 in pairs(v) do ?> //二重循环
                        //三重循环
                        set bj_forLoopAIndex = itemIndex
                        loop
                            exitwhen bj_forLoopAIndex < 0
                            set it = UnitItemInSlot(selectedUnit, bj_forLoopAIndex)
                            if it !=null and  GetItemTypeId(it)==<?=v2?>then
                                set goldcost = goldcost - S2I(YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=v2?>, "goldcost"))
                                set itemIndex = bj_forLoopAIndex - 1
                                set bj_forLoopAIndex = 0
                            endif
                            set bj_forLoopAIndex = bj_forLoopAIndex - 1
                        endloop     
                    <?end?>
                endif
            <?end?>
            if ((goldcost <= GetPlayerState(DzGetTriggerUIEventPlayer(), PLAYER_STATE_RESOURCE_GOLD))) then
                call DisplayTextToPlayer(DzGetTriggerUIEventPlayer(), 0, 0, "购买道具成功！" )
                set itemIndex = 5
                <?for k,v in pairs(ItemComs) do?> //一重循环
                    if (id  == <?=k?>)then
                        <?for k2, v2 in pairs(v) do ?> //二重循环
                            //三重循环
                            set bj_forLoopAIndex = itemIndex
                            loop
                                exitwhen bj_forLoopAIndex <0
                                set it = UnitItemInSlot(selectedUnit, bj_forLoopAIndex)
                                if it !=null and  GetItemTypeId(it)==<?=v2?>then
                                    call DzSyncData( "AddItem2", I2S(bj_forLoopAIndex) )
                                    set itemIndex = bj_forLoopAIndex - 1
                                    set bj_forLoopAIndex = 0
                                endif
                                set bj_forLoopAIndex = bj_forLoopAIndex - 1
                            endloop     
                        <?end?>
                    endif
                <?end?>
                call DzSyncData("AddItem", I2S(id))
                call DzSyncData("BuyItem", I2S(goldcost))
            else
                call DisplayTextToPlayer(DzGetTriggerUIEventPlayer(), 0, 0, "金币不足，购买失败！" )
            endif
         endif
    endif
endfunction

//===========================================================================
function InitTrig_Trig8 takes nothing returns nothing
    set gg_trg_Trig8 = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg_Trig8, "Trig8")
#endif
    call TriggerAddAction(gg_trg_Trig8, function Trig_Trig8Actions)
endfunction

