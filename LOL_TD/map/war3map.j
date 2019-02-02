globals
//globals from BzAPI:
constant boolean LIBRARY_BzAPI=true
trigger array BzAPI___DamageEventQueue
integer BzAPI___DamageEventNumber= 0
//endglobals from BzAPI
//globals from DzAPI:
constant boolean LIBRARY_DzAPI=true
//endglobals from DzAPI
//globals from YDTriggerSaveLoadSystem:
constant boolean LIBRARY_YDTriggerSaveLoadSystem=true
hashtable YDHT
hashtable YDLOC
//endglobals from YDTriggerSaveLoadSystem
//globals from YDWEBase:
constant boolean LIBRARY_YDWEBase=true
//ȫ�ֹ�ϣ�� 
string bj_AllString=".................................!.#$%&'()*+,-./0123456789:;<=>.@ABCDEFGHIJKLMNOPQRSTUVWXYZ[.]^_`abcdefghijklmnopqrstuvwxyz{|}~................................................................................................................................"
//全局系统变量
unit bj_lastAbilityCastingUnit=null
unit bj_lastAbilityTargetUnit=null
unit bj_lastPoolAbstractedUnit=null
unitpool bj_lastCreatedUnitPool=null
item bj_lastPoolAbstractedItem=null
itempool bj_lastCreatedItemPool=null
attacktype bj_lastSetAttackType= ATTACK_TYPE_NORMAL
damagetype bj_lastSetDamageType= DAMAGE_TYPE_NORMAL
weapontype bj_lastSetWeaponType= WEAPON_TYPE_WHOKNOWS
real yd_MapMaxX= 0
real yd_MapMinX= 0
real yd_MapMaxY= 0
real yd_MapMinY= 0
string array YDWEBase___yd_PlayerColor
trigger array YDWEBase___AbilityCastingOverEventQueue
integer array YDWEBase___AbilityCastingOverEventType
integer YDWEBase___AbilityCastingOverEventNumber= 0
//endglobals from YDWEBase
//globals from YDWEGetItemOfTypeFromUnitBJNull:
constant boolean LIBRARY_YDWEGetItemOfTypeFromUnitBJNull=true
item yd_NullTempItem
//endglobals from YDWEGetItemOfTypeFromUnitBJNull
//globals from YDWEUnitHasItemOfTypeBJNull:
constant boolean LIBRARY_YDWEUnitHasItemOfTypeBJNull=true
//endglobals from YDWEUnitHasItemOfTypeBJNull
//globals from YDWEYDWEJapiScript:
constant boolean LIBRARY_YDWEYDWEJapiScript=true
constant integer YDWE_OBJECT_TYPE_ABILITY= 0
constant integer YDWE_OBJECT_TYPE_BUFF= 1
constant integer YDWE_OBJECT_TYPE_UNIT= 2
constant integer YDWE_OBJECT_TYPE_ITEM= 3
constant integer YDWE_OBJECT_TYPE_UPGRADE= 4
constant integer YDWE_OBJECT_TYPE_DOODAD= 5
constant integer YDWE_OBJECT_TYPE_DESTRUCTABLE= 6
//endglobals from YDWEYDWEJapiScript
    // User-defined
integer array udg_SAVEYXZH
boolean array udg_sysCharIsSyn
integer array udg_sysEQHCId
integer array udg_sysEQHCNeedBZ
integer array udg_sysEQHCIdCurr
integer array udg_sysEQHCNeedLH
integer array udg_ui
boolean array udg_ui_isHEOpen
integer array udg_Frames
unit array udg_SelectedHeros
item array udg_SellItems
integer udg_SellCount= 0
boolean array udg_CellHasItem
item array udg_RemoveItems
integer array udg_UI_ab
integer array udg_SelectedItemId
trigger array udg_Trigs
integer array udg_SelectedItemIndex
integer array udg_NCards
integer array udg_SRCards
integer array udg_RCards
integer array udg_SSRCards
integer array udg_ItemAds
integer array udg_ItemAps
integer array udg_ItemCrits
integer array udg_ItemCooldowns
integer array udg_ItemManas
integer udg_ClickFrameID= 0
integer array udg_SellItemId
hashtable udg_table= null
timer udg_jfTimer= null
timer udg_cbTimer= null
timer udg_ghTimer= null
timer udg_pfTimer= null
integer array udg_TipsID
    // Generated
rect gg_rct_chuguaikou1= null
rect gg_rct_chuguaikou2= null
rect gg_rct_chuguaikou3= null
rect gg_rct_chuguaikou4= null
rect gg_rct_rect006= null
rect gg_rct_rect005= null
rect gg_rct_rect007= null
rect gg_rct_rect001= null
rect gg_rct_rect002= null
rect gg_rct_rect004= null
rect gg_rct_rect003= null
rect gg_rct_rect011= null
rect gg_rct_rect012= null
rect gg_rct_rect010= null
rect gg_rct_rect009= null
rect gg_rct_rect008= null
rect gg_rct_effect001= null
rect gg_rct_effect002= null
rect gg_rct_effect003= null
rect gg_rct_effect004= null
rect gg_rct_rect013= null
rect gg_rct_rect014= null
rect gg_rct_rect015= null
rect gg_rct_rect016= null
trigger gg_trg______________________u= null
trigger gg_trg_InitItemCell= null
trigger gg_trg_initButton= null
trigger gg_trg_BtnClick= null
trigger gg_trg_Trig0= null
trigger gg_trg_Trig1= null
trigger gg_trg_Trig2= null
trigger gg_trg_Trig3= null
trigger gg_trg_Trig4= null
trigger gg_trg_Trig5= null
trigger gg_trg_Trig6= null
trigger gg_trg_Trig7_1= null
trigger gg_trg_Trig7_2= null
trigger gg_trg_Trig7_3= null
trigger gg_trg_Trig9= null
trigger gg_trg_InitItemCel2l= null
trigger gg_trg___________________u= null
trigger gg_trg__________________________u= null
trigger gg_trg_ESC= null
trigger gg_trg_P= null
trigger gg_trg_GetItem= null
trigger gg_trg_DropItem= null
trigger gg_trg_InitUi= null
trigger gg_trg_Fram2Action= null
trigger gg_trg_Fram6Action= null
trigger gg_trg_Fram10Action= null
trigger gg_trg_Fram14Action= null
trigger gg_trg_Fram18Action= null
trigger gg_trg_Fram22Action= null
trigger gg_trg_Fram45Action= null
trigger gg_trg_Fram60Action= null
trigger gg_trg_Fram104Action= null
trigger gg_trg_Fram105Action= null
trigger gg_trg_Fram202Action= null
trigger gg_trg_SelectedHero= null
trigger gg_trg_BuyItem= null
trigger gg_trg_SellItem= null
trigger gg_trg_jf001= null
trigger gg_trg_jf002= null
trigger gg_trg_ghTimer= null
trigger gg_trg_cbTimer= null
trigger gg_trg_pfTimer= null
trigger gg_trg_SellItem2= null
trigger gg_trg_SelectedItem2= null
trigger gg_trg_RefrshItemCell= null

trigger l__library_init

//JASSHelper struct globals:

endglobals
    native DzGetMouseTerrainX takes nothing returns real
    native DzGetMouseTerrainY takes nothing returns real
    native DzGetMouseTerrainZ takes nothing returns real
    native DzIsMouseOverUI takes nothing returns boolean
    native DzGetMouseX takes nothing returns integer
    native DzGetMouseY takes nothing returns integer
    native DzGetMouseXRelative takes nothing returns integer
    native DzGetMouseYRelative takes nothing returns integer
    native DzSetMousePos takes integer x, integer y returns nothing
    native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
    native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzGetTriggerKey takes nothing returns integer
    native DzGetWheelDelta takes nothing returns integer
    native DzIsKeyDown takes integer iKey returns boolean
    native DzGetTriggerKeyPlayer takes nothing returns player
    native DzGetWindowWidth takes nothing returns integer
    native DzGetWindowHeight takes nothing returns integer
    native DzGetWindowX takes nothing returns integer
    native DzGetWindowY takes nothing returns integer
    native DzTriggerRegisterWindowResizeEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterWindowResizeEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzIsWindowActive takes nothing returns boolean
    native DzDestructablePosition takes destructable d, real x, real y returns nothing
    native DzSetUnitPosition takes unit whichUnit, real x, real y returns nothing
    native DzExecuteFunc takes string funcName returns nothing
    native DzGetUnitUnderMouse takes nothing returns unit
    native DzSetUnitTexture takes unit whichUnit, string path, integer texId returns nothing
    native DzSetMemory takes integer address, real value returns nothing
    native DzSetUnitID takes unit whichUnit, integer id returns nothing
    native DzSetUnitModel takes unit whichUnit, string path returns nothing
    native DzSetWar3MapMap takes string map returns nothing
    native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing
    native DzSyncData takes string prefix, string data returns nothing
    native DzGetTriggerSyncData takes nothing returns string
    native DzGetTriggerSyncPlayer takes nothing returns player
    native DzFrameHideInterface takes nothing returns nothing
    native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing
    native DzFrameGetPortrait takes nothing returns integer
    native DzFrameGetMinimap takes nothing returns integer
    native DzFrameGetCommandBarButton takes integer row, integer column returns integer
    native DzFrameGetHeroBarButton takes integer buttonId returns integer
    native DzFrameGetHeroHPBar takes integer buttonId returns integer
    native DzFrameGetHeroManaBar takes integer buttonId returns integer
    native DzFrameGetItemBarButton takes integer buttonId returns integer
    native DzFrameGetMinimapButton takes integer buttonId returns integer
    native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer
    native DzFrameGetTooltip takes nothing returns integer
    native DzFrameGetChatMessage takes nothing returns integer
    native DzFrameGetUnitMessage takes nothing returns integer
    native DzFrameGetTopMessage takes nothing returns integer
    native DzGetColor takes integer r, integer g, integer b, integer a returns integer
    native DzFrameSetUpdateCallback takes string func returns nothing
    native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing
    native DzFrameShow takes integer frame, boolean enable returns nothing
    native DzCreateFrame takes string frame, integer parent, integer id returns integer
    native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer
    native DzDestroyFrame takes integer frame returns nothing
    native DzLoadToc takes string fileName returns nothing
    native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing
    native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing
    native DzFrameClearAllPoints takes integer frame returns nothing
    native DzFrameSetEnable takes integer name, boolean enable returns nothing
    native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
    native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
    native DzGetTriggerUIEventPlayer takes nothing returns player
    native DzGetTriggerUIEventFrame takes nothing returns integer
    native DzFrameFindByName takes string name, integer id returns integer
    native DzSimpleFrameFindByName takes string name, integer id returns integer
    native DzSimpleFontStringFindByName takes string name, integer id returns integer
    native DzSimpleTextureFindByName takes string name, integer id returns integer
    native DzGetGameUI takes nothing returns integer
    native DzClickFrame takes integer frame returns nothing
    native DzSetCustomFovFix takes real value returns nothing
    native DzEnableWideScreen takes boolean enable returns nothing
    native DzFrameSetText takes integer frame, string text returns nothing
    native DzFrameGetText takes integer frame returns string
    native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing
    native DzFrameGetTextSizeLimit takes integer frame returns integer
    native DzFrameSetTextColor takes integer frame, integer color returns nothing
    native DzGetMouseFocus takes nothing returns integer
    native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean
    native DzFrameSetFocus takes integer frame, boolean enable returns boolean
    native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing
    native DzFrameGetEnable takes integer frame returns boolean
    native DzFrameSetAlpha takes integer frame, integer alpha returns nothing
    native DzFrameGetAlpha takes integer frame returns integer
    native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing
    native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing
    native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing
    native DzFrameSetScale takes integer frame, real scale returns nothing
    native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing
    native DzFrameCageMouse takes integer frame, boolean enable returns nothing
    native DzFrameGetValue takes integer frame returns real
    native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing
    native DzFrameSetStepValue takes integer frame, real step returns nothing
    native DzFrameSetValue takes integer frame, real value returns nothing
    native DzFrameSetSize takes integer frame, real w, real h returns nothing
    native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer
    native DzFrameSetVertexColor takes integer frame, integer color returns nothing
	native DzAPI_Map_SaveServerValue takes player whichPlayer, string key, string value returns boolean
    native DzAPI_Map_GetServerValue takes player whichPlayer, string key returns string
    native DzAPI_Map_Ladder_SetStat takes player whichPlayer, string key, string value returns nothing
    native DzAPI_Map_IsRPGLadder takes nothing returns boolean
    native DzAPI_Map_GetGameStartTime takes nothing returns integer
    native DzAPI_Map_Stat_SetStat takes player whichPlayer, string key, string value returns nothing
    native DzAPI_Map_GetMatchType takes nothing returns integer
    native DzAPI_Map_Ladder_SetPlayerStat takes player whichPlayer, string key, string value returns nothing
	native DzAPI_Map_GetServerValueErrorCode takes player whichPlayer returns integer
    native DzAPI_Map_GetLadderLevel takes player whichPlayer returns integer
	native DzAPI_Map_IsRedVIP takes player whichPlayer returns boolean
	native DzAPI_Map_IsBlueVIP takes player whichPlayer returns boolean
	native DzAPI_Map_GetLadderRank takes player whichPlayer returns integer
	native DzAPI_Map_GetMapLevelRank takes player whichPlayer returns integer
	native DzAPI_Map_GetGuildName takes player whichPlayer returns string
	native DzAPI_Map_GetGuildRole takes player whichPlayer returns integer
	native DzAPI_Map_IsRPGLobby takes nothing returns boolean
	native DzAPI_Map_GetMapLevel takes player whichPlayer returns integer
	native DzAPI_Map_MissionComplete takes player whichPlayer, string key, string value returns nothing
	native DzAPI_Map_GetActivityData takes nothing returns string
	native DzAPI_Map_GetMapConfig takes string key returns string
	native DzAPI_Map_HasMallItem takes player whichPlayer, string key returns boolean
	native DzAPI_Map_SavePublicArchive takes player whichPlayer, string key, string value returns boolean
	native DzAPI_Map_GetPublicArchive takes player whichPlayer, string key returns string
	native DzAPI_Map_UseConsumablesItem takes player whichPlayer, string key returns nothing
	native DzAPI_Map_OrpgTrigger takes player whichPlayer, string key returns nothing
	native DzAPI_Map_GetServerArchiveDrop takes player whichPlayer, string key returns string
	native DzAPI_Map_GetServerArchiveEquip takes player whichPlayer, string key returns integer
	native EXExecuteScript takes string script returns string
native EXBlendButtonIcon takes string a, string b, string c returns boolean


//library BzAPI:
    //hardware




























    //plus









    //sync




    //gui
































































    function DzTriggerRegisterMouseEventTrg takes trigger trg,integer status,integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterKeyEventTrg takes trigger trg,integer status,integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterKeyEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterMouseMoveEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseMoveEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterMouseWheelEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseWheelEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterWindowResizeEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterWindowResizeEvent(trg, true, null)
    endfunction
    function DzF2I takes integer i returns integer
        return i
    endfunction
    function DzI2F takes integer i returns integer
        return i
    endfunction
    function DzK2I takes integer i returns integer
        return i
    endfunction
    function DzI2K takes integer i returns integer
        return i
    endfunction

//library BzAPI ends
//library DzAPI:




























 function GetPlayerServerValueSuccess takes player whichPlayer returns boolean
		if ( DzAPI_Map_GetServerValueErrorCode(whichPlayer) == 0 ) then
			return true
		else
			return false
		endif
	endfunction
  function DzAPI_Map_StoreInteger takes player whichPlayer,string key,integer value returns nothing
        set key="I" + key
        call DzAPI_Map_SaveServerValue(whichPlayer, key, I2S(value))
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GetStoredInteger takes player whichPlayer,string key returns integer
        local integer value
        set key="I" + key
        set value=S2I(DzAPI_Map_GetServerValue(whichPlayer, key))
        set key=null
        set whichPlayer=null
        return value
    endfunction
    function DzAPI_Map_StoreReal takes player whichPlayer,string key,real value returns nothing
        set key="R" + key
        call DzAPI_Map_SaveServerValue(whichPlayer, key, R2S(value))
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GetStoredReal takes player whichPlayer,string key returns real
        local real value
        set key="R" + key
        set value=S2R(DzAPI_Map_GetServerValue(whichPlayer, key))
        set key=null
        set whichPlayer=null
        return value
    endfunction
    function DzAPI_Map_StoreBoolean takes player whichPlayer,string key,boolean value returns nothing
        set key="B" + key
        if ( value ) then
            call DzAPI_Map_SaveServerValue(whichPlayer, key, "1")
        else
            call DzAPI_Map_SaveServerValue(whichPlayer, key, "0")
        endif
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GetStoredBoolean takes player whichPlayer,string key returns boolean
        local boolean value
        set key="B" + key
        set key=DzAPI_Map_GetServerValue(whichPlayer, key)
        if ( key == "1" ) then
            set value=true
        else
            set value=false
        endif
        set key=null
        set whichPlayer=null
        return value
    endfunction
    function DzAPI_Map_StoreString takes player whichPlayer,string key,string value returns nothing
        set key="S" + key
        call DzAPI_Map_SaveServerValue(whichPlayer, key, value)
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GetStoredString takes player whichPlayer,string key returns string
        return DzAPI_Map_GetServerValue(whichPlayer, "S" + key)
    endfunction
 function DzAPI_Map_GetStoredUnitType takes player whichPlayer,string key returns integer
        local integer value
        set key="I" + key
        set value=S2I(DzAPI_Map_GetServerValue(whichPlayer, key))
        set key=null
        set whichPlayer=null
        return value
    endfunction
 function DzAPI_Map_GetStoredAbilityId takes player whichPlayer,string key returns integer
        local integer value
        set key="I" + key
        set value=S2I(DzAPI_Map_GetServerValue(whichPlayer, key))
        set key=null
        set whichPlayer=null
        return value
    endfunction
    function DzAPI_Map_FlushStoredMission takes player whichPlayer,string key returns nothing
        call DzAPI_Map_SaveServerValue(whichPlayer, key, null)
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_Ladder_SubmitIntegerData takes player whichPlayer,string key,integer value returns nothing
        call DzAPI_Map_Ladder_SetStat(whichPlayer, key, I2S(value))
    endfunction
    function DzAPI_Map_Stat_SubmitUnitIdData takes player whichPlayer,string key,integer value returns nothing
        if ( value == 0 ) then
            //call DzAPI_Map_Ladder_SetStat(whichPlayer,key,"0")
        else
            call DzAPI_Map_Ladder_SetStat(whichPlayer, key, I2S(value))
        endif
    endfunction
    function DzAPI_Map_Stat_SubmitUnitData takes player whichPlayer,string key,unit value returns nothing
        call DzAPI_Map_Stat_SubmitUnitIdData(whichPlayer , key , GetUnitTypeId(value))
    endfunction
    function DzAPI_Map_Ladder_SubmitAblityIdData takes player whichPlayer,string key,integer value returns nothing
        if ( value == 0 ) then
            //call DzAPI_Map_Ladder_SetStat(whichPlayer,key,"0")
        else
            call DzAPI_Map_Ladder_SetStat(whichPlayer, key, I2S(value))
        endif
    endfunction
    function DzAPI_Map_Ladder_SubmitItemIdData takes player whichPlayer,string key,integer value returns nothing
        local string S
        if ( value == 0 ) then
            set S="0"
        else
            set S=I2S(value)
            call DzAPI_Map_Ladder_SetStat(whichPlayer, key, S)
        endif
        //call DzAPI_Map_Ladder_SetStat(whichPlayer,key,S)
        set S=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_Ladder_SubmitItemData takes player whichPlayer,string key,item value returns nothing
        call DzAPI_Map_Ladder_SubmitItemIdData(whichPlayer , key , GetItemTypeId(value))
    endfunction
    function DzAPI_Map_Ladder_SubmitBooleanData takes player whichPlayer,string key,boolean value returns nothing
        if ( value ) then
            call DzAPI_Map_Ladder_SetStat(whichPlayer, key, "1")
        else
            call DzAPI_Map_Ladder_SetStat(whichPlayer, key, "0")
        endif
    endfunction
    function DzAPI_Map_Ladder_SubmitTitle takes player whichPlayer,string value returns nothing
        call DzAPI_Map_Ladder_SetStat(whichPlayer, value, "1")
    endfunction
 function DzAPI_Map_Ladder_SubmitPlayerRank takes player whichPlayer,integer value returns nothing
        call DzAPI_Map_Ladder_SetPlayerStat(whichPlayer, "RankIndex", I2S(value))
    endfunction
 function DzAPI_Map_Ladder_SubmitPlayerExtraExp takes player whichPlayer,integer value returns nothing
        call DzAPI_Map_Ladder_SetStat(whichPlayer, "ExtraExp", I2S(value))
	endfunction

//library DzAPI ends
//library YDTriggerSaveLoadSystem:
    function YDTriggerSaveLoadSystem___Init takes nothing returns nothing
            set YDHT=InitHashtable()
        set YDLOC=InitHashtable()
    endfunction

//library YDTriggerSaveLoadSystem ends
//library YDWEBase:
//===========================================================================
//HashTable
//===========================================================================
//===========================================================================
//Return bug
//===========================================================================
function YDWEH2I takes handle h returns integer
    return GetHandleId(h)
endfunction
//����
function YDWEFlushAllData takes nothing returns nothing
    call FlushParentHashtable(YDHT)
endfunction
function YDWEFlushMissionByInteger takes integer i returns nothing
    call FlushChildHashtable(YDHT, i)
endfunction
function YDWEFlushMissionByString takes string s returns nothing
    call FlushChildHashtable(YDHT, StringHash(s))
endfunction
function YDWEFlushStoredIntegerByInteger takes integer i,integer j returns nothing
    call RemoveSavedInteger(YDHT, i, j)
endfunction
function YDWEFlushStoredIntegerByString takes string s1,string s2 returns nothing
    call RemoveSavedInteger(YDHT, StringHash(s1), StringHash(s2))
endfunction
function YDWEHaveSavedIntegerByInteger takes integer i,integer j returns boolean
    return HaveSavedInteger(YDHT, i, j)
endfunction
function YDWEHaveSavedIntegerByString takes string s1,string s2 returns boolean
    return HaveSavedInteger(YDHT, StringHash(s1), StringHash(s2))
endfunction
//store and get integer
function YDWESaveIntegerByInteger takes integer pTable,integer pKey,integer i returns nothing
    call SaveInteger(YDHT, pTable, pKey, i)
endfunction
function YDWESaveIntegerByString takes string pTable,string pKey,integer i returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), i)
endfunction
function YDWEGetIntegerByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetIntegerByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//store and get real
function YDWESaveRealByInteger takes integer pTable,integer pKey,real r returns nothing
    call SaveReal(YDHT, pTable, pKey, r)
endfunction
function YDWESaveRealByString takes string pTable,string pKey,real r returns nothing
    call SaveReal(YDHT, StringHash(pTable), StringHash(pKey), r)
endfunction
function YDWEGetRealByInteger takes integer pTable,integer pKey returns real
    return LoadReal(YDHT, pTable, pKey)
endfunction
function YDWEGetRealByString takes string pTable,string pKey returns real
    return LoadReal(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//store and get string
function YDWESaveStringByInteger takes integer pTable,integer pKey,string s returns nothing
    call SaveStr(YDHT, pTable, pKey, s)
endfunction
function YDWESaveStringByString takes string pTable,string pKey,string s returns nothing
    call SaveStr(YDHT, StringHash(pTable), StringHash(pKey), s)
endfunction
function YDWEGetStringByInteger takes integer pTable,integer pKey returns string
    return LoadStr(YDHT, pTable, pKey)
endfunction
function YDWEGetStringByString takes string pTable,string pKey returns string
    return LoadStr(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//store and get boolean
function YDWESaveBooleanByInteger takes integer pTable,integer pKey,boolean b returns nothing
    call SaveBoolean(YDHT, pTable, pKey, b)
endfunction
function YDWESaveBooleanByString takes string pTable,string pKey,boolean b returns nothing
    call SaveBoolean(YDHT, StringHash(pTable), StringHash(pKey), b)
endfunction
function YDWEGetBooleanByInteger takes integer pTable,integer pKey returns boolean
    return LoadBoolean(YDHT, pTable, pKey)
endfunction
function YDWEGetBooleanByString takes string pTable,string pKey returns boolean
    return LoadBoolean(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Unit
function YDWESaveUnitByInteger takes integer pTable,integer pKey,unit u returns nothing
    call SaveUnitHandle(YDHT, pTable, pKey, u)
endfunction
function YDWESaveUnitByString takes string pTable,string pKey,unit u returns nothing
    call SaveUnitHandle(YDHT, StringHash(pTable), StringHash(pKey), u)
endfunction
function YDWEGetUnitByInteger takes integer pTable,integer pKey returns unit
    return LoadUnitHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetUnitByString takes string pTable,string pKey returns unit
    return LoadUnitHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert UnitID
function YDWESaveUnitIDByInteger takes integer pTable,integer pKey,integer uid returns nothing
    call SaveInteger(YDHT, pTable, pKey, uid)
endfunction
function YDWESaveUnitIDByString takes string pTable,string pKey,integer uid returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), uid)
endfunction
function YDWEGetUnitIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetUnitIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert AbilityID
function YDWESaveAbilityIDByInteger takes integer pTable,integer pKey,integer abid returns nothing
    call SaveInteger(YDHT, pTable, pKey, abid)
endfunction
function YDWESaveAbilityIDByString takes string pTable,string pKey,integer abid returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), abid)
endfunction
function YDWEGetAbilityIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetAbilityIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Player
function YDWESavePlayerByInteger takes integer pTable,integer pKey,player p returns nothing
    call SavePlayerHandle(YDHT, pTable, pKey, p)
endfunction
function YDWESavePlayerByString takes string pTable,string pKey,player p returns nothing
    call SavePlayerHandle(YDHT, StringHash(pTable), StringHash(pKey), p)
endfunction
function YDWEGetPlayerByInteger takes integer pTable,integer pKey returns player
    return LoadPlayerHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetPlayerByString takes string pTable,string pKey returns player
    return LoadPlayerHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Item
function YDWESaveItemByInteger takes integer pTable,integer pKey,item it returns nothing
    call SaveItemHandle(YDHT, pTable, pKey, it)
endfunction
function YDWESaveItemByString takes string pTable,string pKey,item it returns nothing
    call SaveItemHandle(YDHT, StringHash(pTable), StringHash(pKey), it)
endfunction
function YDWEGetItemByInteger takes integer pTable,integer pKey returns item
    return LoadItemHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetItemByString takes string pTable,string pKey returns item
    return LoadItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert ItemID
function YDWESaveItemIDByInteger takes integer pTable,integer pKey,integer itid returns nothing
    call SaveInteger(YDHT, pTable, pKey, itid)
endfunction
function YDWESaveItemIDByString takes string pTable,string pKey,integer itid returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), itid)
endfunction
function YDWEGetItemIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetItemIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Timer
function YDWESaveTimerByInteger takes integer pTable,integer pKey,timer t returns nothing
    call SaveTimerHandle(YDHT, pTable, pKey, t)
endfunction
function YDWESaveTimerByString takes string pTable,string pKey,timer t returns nothing
    call SaveTimerHandle(YDHT, StringHash(pTable), StringHash(pKey), t)
endfunction
function YDWEGetTimerByInteger takes integer pTable,integer pKey returns timer
    return LoadTimerHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTimerByString takes string pTable,string pKey returns timer
    return LoadTimerHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Trigger
function YDWESaveTriggerByInteger takes integer pTable,integer pKey,trigger trg returns nothing
    call SaveTriggerHandle(YDHT, pTable, pKey, trg)
endfunction
function YDWESaveTriggerByString takes string pTable,string pKey,trigger trg returns nothing
    call SaveTriggerHandle(YDHT, StringHash(pTable), StringHash(pKey), trg)
endfunction
function YDWEGetTriggerByInteger takes integer pTable,integer pKey returns trigger
    return LoadTriggerHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerByString takes string pTable,string pKey returns trigger
    return LoadTriggerHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Location
function YDWESaveLocationByInteger takes integer pTable,integer pKey,location pt returns nothing
    call SaveLocationHandle(YDHT, pTable, pKey, pt)
endfunction
function YDWESaveLocationByString takes string pTable,string pKey,location pt returns nothing
    call SaveLocationHandle(YDHT, StringHash(pTable), StringHash(pKey), pt)
endfunction
function YDWEGetLocationByInteger takes integer pTable,integer pKey returns location
    return LoadLocationHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetLocationByString takes string pTable,string pKey returns location
    return LoadLocationHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Group
function YDWESaveGroupByInteger takes integer pTable,integer pKey,group g returns nothing
    call SaveGroupHandle(YDHT, pTable, pKey, g)
endfunction
function YDWESaveGroupByString takes string pTable,string pKey,group g returns nothing
    call SaveGroupHandle(YDHT, StringHash(pTable), StringHash(pKey), g)
endfunction
function YDWEGetGroupByInteger takes integer pTable,integer pKey returns group
    return LoadGroupHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetGroupByString takes string pTable,string pKey returns group
    return LoadGroupHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Multiboard
function YDWESaveMultiboardByInteger takes integer pTable,integer pKey,multiboard m returns nothing
    call SaveMultiboardHandle(YDHT, pTable, pKey, m)
endfunction
function YDWESaveMultiboardByString takes string pTable,string pKey,multiboard m returns nothing
    call SaveMultiboardHandle(YDHT, StringHash(pTable), StringHash(pKey), m)
endfunction
function YDWEGetMultiboardByInteger takes integer pTable,integer pKey returns multiboard
    return LoadMultiboardHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetMultiboardByString takes string pTable,string pKey returns multiboard
    return LoadMultiboardHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert MultiboardItem
function YDWESaveMultiboardItemByInteger takes integer pTable,integer pKey,multiboarditem mt returns nothing
    call SaveMultiboardItemHandle(YDHT, pTable, pKey, mt)
endfunction
function YDWESaveMultiboardItemByString takes string pTable,string pKey,multiboarditem mt returns nothing
    call SaveMultiboardItemHandle(YDHT, StringHash(pTable), StringHash(pKey), mt)
endfunction
function YDWEGetMultiboardItemByInteger takes integer pTable,integer pKey returns multiboarditem
    return LoadMultiboardItemHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetMultiboardItemByString takes string pTable,string pKey returns multiboarditem
    return LoadMultiboardItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert TextTag
function YDWESaveTextTagByInteger takes integer pTable,integer pKey,texttag tt returns nothing
    call SaveTextTagHandle(YDHT, pTable, pKey, tt)
endfunction
function YDWESaveTextTagByString takes string pTable,string pKey,texttag tt returns nothing
    call SaveTextTagHandle(YDHT, StringHash(pTable), StringHash(pKey), tt)
endfunction
function YDWEGetTextTagByInteger takes integer pTable,integer pKey returns texttag
    return LoadTextTagHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTextTagByString takes string pTable,string pKey returns texttag
    return LoadTextTagHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Lightning
function YDWESaveLightningByInteger takes integer pTable,integer pKey,lightning ln returns nothing
    call SaveLightningHandle(YDHT, pTable, pKey, ln)
endfunction
function YDWESaveLightningByString takes string pTable,string pKey,lightning ln returns nothing
    call SaveLightningHandle(YDHT, StringHash(pTable), StringHash(pKey), ln)
endfunction
function YDWEGetLightningByInteger takes integer pTable,integer pKey returns lightning
    return LoadLightningHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetLightningByString takes string pTable,string pKey returns lightning
    return LoadLightningHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Region
function YDWESaveRegionByInteger takes integer pTable,integer pKey,region rn returns nothing
    call SaveRegionHandle(YDHT, pTable, pKey, rn)
endfunction
function YDWESaveRegionByString takes string pTable,string pKey,region rt returns nothing
    call SaveRegionHandle(YDHT, StringHash(pTable), StringHash(pKey), rt)
endfunction
function YDWEGetRegionByInteger takes integer pTable,integer pKey returns region
    return LoadRegionHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetRegionByString takes string pTable,string pKey returns region
    return LoadRegionHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Rect
function YDWESaveRectByInteger takes integer pTable,integer pKey,rect rn returns nothing
    call SaveRectHandle(YDHT, pTable, pKey, rn)
endfunction
function YDWESaveRectByString takes string pTable,string pKey,rect rt returns nothing
    call SaveRectHandle(YDHT, StringHash(pTable), StringHash(pKey), rt)
endfunction
function YDWEGetRectByInteger takes integer pTable,integer pKey returns rect
    return LoadRectHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetRectByString takes string pTable,string pKey returns rect
    return LoadRectHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Leaderboard
function YDWESaveLeaderboardByInteger takes integer pTable,integer pKey,leaderboard lb returns nothing
    call SaveLeaderboardHandle(YDHT, pTable, pKey, lb)
endfunction
function YDWESaveLeaderboardByString takes string pTable,string pKey,leaderboard lb returns nothing
    call SaveLeaderboardHandle(YDHT, StringHash(pTable), StringHash(pKey), lb)
endfunction
function YDWEGetLeaderboardByInteger takes integer pTable,integer pKey returns leaderboard
    return LoadLeaderboardHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetLeaderboardByString takes string pTable,string pKey returns leaderboard
    return LoadLeaderboardHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Effect
function YDWESaveEffectByInteger takes integer pTable,integer pKey,effect e returns nothing
    call SaveEffectHandle(YDHT, pTable, pKey, e)
endfunction
function YDWESaveEffectByString takes string pTable,string pKey,effect e returns nothing
    call SaveEffectHandle(YDHT, StringHash(pTable), StringHash(pKey), e)
endfunction
function YDWEGetEffectByInteger takes integer pTable,integer pKey returns effect
    return LoadEffectHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetEffectByString takes string pTable,string pKey returns effect
    return LoadEffectHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Destructable
function YDWESaveDestructableByInteger takes integer pTable,integer pKey,destructable da returns nothing
    call SaveDestructableHandle(YDHT, pTable, pKey, da)
endfunction
function YDWESaveDestructableByString takes string pTable,string pKey,destructable da returns nothing
    call SaveDestructableHandle(YDHT, StringHash(pTable), StringHash(pKey), da)
endfunction
function YDWEGetDestructableByInteger takes integer pTable,integer pKey returns destructable
    return LoadDestructableHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetDestructableByString takes string pTable,string pKey returns destructable
    return LoadDestructableHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert triggercondition
function YDWESaveTriggerConditionByInteger takes integer pTable,integer pKey,triggercondition tc returns nothing
    call SaveTriggerConditionHandle(YDHT, pTable, pKey, tc)
endfunction
function YDWESaveTriggerConditionByString takes string pTable,string pKey,triggercondition tc returns nothing
    call SaveTriggerConditionHandle(YDHT, StringHash(pTable), StringHash(pKey), tc)
endfunction
function YDWEGetTriggerConditionByInteger takes integer pTable,integer pKey returns triggercondition
    return LoadTriggerConditionHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerConditionByString takes string pTable,string pKey returns triggercondition
    return LoadTriggerConditionHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert triggeraction
function YDWESaveTriggerActionByInteger takes integer pTable,integer pKey,triggeraction ta returns nothing
    call SaveTriggerActionHandle(YDHT, pTable, pKey, ta)
endfunction
function YDWESaveTriggerActionByString takes string pTable,string pKey,triggeraction ta returns nothing
    call SaveTriggerActionHandle(YDHT, StringHash(pTable), StringHash(pKey), ta)
endfunction
function YDWEGetTriggerActionByInteger takes integer pTable,integer pKey returns triggeraction
    return LoadTriggerActionHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerActionByString takes string pTable,string pKey returns triggeraction
    return LoadTriggerActionHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert event
function YDWESaveTriggerEventByInteger takes integer pTable,integer pKey,event et returns nothing
    call SaveTriggerEventHandle(YDHT, pTable, pKey, et)
endfunction
function YDWESaveTriggerEventByString takes string pTable,string pKey,event et returns nothing
    call SaveTriggerEventHandle(YDHT, StringHash(pTable), StringHash(pKey), et)
endfunction
function YDWEGetTriggerEventByInteger takes integer pTable,integer pKey returns event
    return LoadTriggerEventHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerEventByString takes string pTable,string pKey returns event
    return LoadTriggerEventHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert force
function YDWESaveForceByInteger takes integer pTable,integer pKey,force fc returns nothing
    call SaveForceHandle(YDHT, pTable, pKey, fc)
endfunction
function YDWESaveForceByString takes string pTable,string pKey,force fc returns nothing
    call SaveForceHandle(YDHT, StringHash(pTable), StringHash(pKey), fc)
endfunction
function YDWEGetForceByInteger takes integer pTable,integer pKey returns force
    return LoadForceHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetForceByString takes string pTable,string pKey returns force
    return LoadForceHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert boolexpr
function YDWESaveBoolexprByInteger takes integer pTable,integer pKey,boolexpr be returns nothing
    call SaveBooleanExprHandle(YDHT, pTable, pKey, be)
endfunction
function YDWESaveBoolexprByString takes string pTable,string pKey,boolexpr be returns nothing
    call SaveBooleanExprHandle(YDHT, StringHash(pTable), StringHash(pKey), be)
endfunction
function YDWEGetBoolexprByInteger takes integer pTable,integer pKey returns boolexpr
    return LoadBooleanExprHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetBoolexprByString takes string pTable,string pKey returns boolexpr
    return LoadBooleanExprHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert sound
function YDWESaveSoundByInteger takes integer pTable,integer pKey,sound sd returns nothing
    call SaveSoundHandle(YDHT, pTable, pKey, sd)
endfunction
function YDWESaveSoundByString takes string pTable,string pKey,sound sd returns nothing
    call SaveSoundHandle(YDHT, StringHash(pTable), StringHash(pKey), sd)
endfunction
function YDWEGetSoundByInteger takes integer pTable,integer pKey returns sound
    return LoadSoundHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetSoundByString takes string pTable,string pKey returns sound
    return LoadSoundHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert timerdialog
function YDWESaveTimerDialogByInteger takes integer pTable,integer pKey,timerdialog td returns nothing
    call SaveTimerDialogHandle(YDHT, pTable, pKey, td)
endfunction
function YDWESaveTimerDialogByString takes string pTable,string pKey,timerdialog td returns nothing
    call SaveTimerDialogHandle(YDHT, StringHash(pTable), StringHash(pKey), td)
endfunction
function YDWEGetTimerDialogByInteger takes integer pTable,integer pKey returns timerdialog
    return LoadTimerDialogHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTimerDialogByString takes string pTable,string pKey returns timerdialog
    return LoadTimerDialogHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert trackable
function YDWESaveTrackableByInteger takes integer pTable,integer pKey,trackable ta returns nothing
    call SaveTrackableHandle(YDHT, pTable, pKey, ta)
endfunction
function YDWESaveTrackableByString takes string pTable,string pKey,trackable ta returns nothing
    call SaveTrackableHandle(YDHT, StringHash(pTable), StringHash(pKey), ta)
endfunction
function YDWEGetTrackableByInteger takes integer pTable,integer pKey returns trackable
    return LoadTrackableHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTrackableByString takes string pTable,string pKey returns trackable
    return LoadTrackableHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert dialog
function YDWESaveDialogByInteger takes integer pTable,integer pKey,dialog d returns nothing
    call SaveDialogHandle(YDHT, pTable, pKey, d)
endfunction
function YDWESaveDialogByString takes string pTable,string pKey,dialog d returns nothing
    call SaveDialogHandle(YDHT, StringHash(pTable), StringHash(pKey), d)
endfunction
function YDWEGetDialogByInteger takes integer pTable,integer pKey returns dialog
    return LoadDialogHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetDialogByString takes string pTable,string pKey returns dialog
    return LoadDialogHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert button
function YDWESaveButtonByInteger takes integer pTable,integer pKey,button bt returns nothing
    call SaveButtonHandle(YDHT, pTable, pKey, bt)
endfunction
function YDWESaveButtonByString takes string pTable,string pKey,button bt returns nothing
    call SaveButtonHandle(YDHT, StringHash(pTable), StringHash(pKey), bt)
endfunction
function YDWEGetButtonByInteger takes integer pTable,integer pKey returns button
    return LoadButtonHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetButtonByString takes string pTable,string pKey returns button
    return LoadButtonHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert quest
function YDWESaveQuestByInteger takes integer pTable,integer pKey,quest qt returns nothing
    call SaveQuestHandle(YDHT, pTable, pKey, qt)
endfunction
function YDWESaveQuestByString takes string pTable,string pKey,quest qt returns nothing
    call SaveQuestHandle(YDHT, StringHash(pTable), StringHash(pKey), qt)
endfunction
function YDWEGetQuestByInteger takes integer pTable,integer pKey returns quest
    return LoadQuestHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetQuestByString takes string pTable,string pKey returns quest
    return LoadQuestHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert questitem
function YDWESaveQuestItemByInteger takes integer pTable,integer pKey,questitem qi returns nothing
    call SaveQuestItemHandle(YDHT, pTable, pKey, qi)
endfunction
function YDWESaveQuestItemByString takes string pTable,string pKey,questitem qi returns nothing
    call SaveQuestItemHandle(YDHT, StringHash(pTable), StringHash(pKey), qi)
endfunction
function YDWEGetQuestItemByInteger takes integer pTable,integer pKey returns questitem
    return LoadQuestItemHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetQuestItemByString takes string pTable,string pKey returns questitem
    return LoadQuestItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
function YDWES2I takes string s returns integer
    return StringHash(s)
endfunction
function YDWESaveAbilityHandleBJ takes integer AbilityID,integer key,integer missionKey,hashtable table returns nothing
    call SaveInteger(table, missionKey, key, AbilityID)
endfunction
function YDWESaveAbilityHandle takes hashtable table,integer parentKey,integer childKey,integer AbilityID returns nothing
    call SaveInteger(table, parentKey, childKey, AbilityID)
endfunction
function YDWELoadAbilityHandleBJ takes integer key,integer missionKey,hashtable table returns integer
    return LoadInteger(table, missionKey, key)
endfunction
function YDWELoadAbilityHandle takes hashtable table,integer parentKey,integer childKey returns integer
    return LoadInteger(table, parentKey, childKey)
endfunction
//===========================================================================
//返回参数
//===========================================================================
//地图边界判断
function YDWECoordinateX takes real x returns real
    return RMinBJ(RMaxBJ(x, yd_MapMinX), yd_MapMaxX)
endfunction
function YDWECoordinateY takes real y returns real
    return RMinBJ(RMaxBJ(y, yd_MapMinY), yd_MapMaxY)
endfunction
//两个单位之间的距离
function YDWEDistanceBetweenUnits takes unit a,unit b returns real
    return SquareRoot(( GetUnitX(a) - GetUnitX(b) ) * ( GetUnitX(a) - GetUnitX(b) ) + ( GetUnitY(a) - GetUnitY(b) ) * ( GetUnitY(a) - GetUnitY(b) ))
endfunction
//两个单位之间的角度
function YDWEAngleBetweenUnits takes unit fromUnit,unit toUnit returns real
    return bj_RADTODEG * Atan2(GetUnitY(toUnit) - GetUnitY(fromUnit), GetUnitX(toUnit) - GetUnitX(fromUnit))
endfunction
//生成区域
function YDWEGetRect takes real x,real y,real width,real height returns rect
    return Rect(x - width * 0.5, y - height * 0.5, x + width * 0.5, y + height * 0.5)
endfunction
//===========================================================================
//设置单位可以飞行
//===========================================================================
function YDWEFlyEnable takes unit u returns nothing
    call UnitAddAbility(u, 'Amrf')
    call UnitRemoveAbility(u, 'Amrf')
endfunction
//===========================================================================
//字符窜与ID转换
//===========================================================================
function YDWEId2S takes integer value returns string
    local string charMap=bj_AllString
    local string result= ""
    local integer remainingValue= value
    local integer charValue
    local integer byteno
    set byteno=0
    loop
        set charValue=ModuloInteger(remainingValue, 256)
        set remainingValue=remainingValue / 256
        set result=SubString(charMap, charValue, charValue + 1) + result
        set byteno=byteno + 1
        exitwhen byteno == 4
    endloop
    return result
endfunction
function YDWES2Id takes string targetstr returns integer
    local string originstr=bj_AllString
    local integer strlength=StringLength(targetstr)
    local integer a=0
local integer b=0
local integer numx=1
local integer result=0
    loop
    exitwhen b > strlength - 1
        set numx=R2I(Pow(256, strlength - 1 - b))
        set a=1
        loop
            exitwhen a > 255
            if SubString(targetstr, b, b + 1) == SubString(originstr, a, a + 1) then
                set result=result + a * numx
                set a=256
            endif
            set a=a + 1
        endloop
        set b=b + 1
    endloop
    return result
endfunction
function YDWES2UnitId takes string targetstr returns integer
    return YDWES2Id(targetstr)
endfunction
function YDWES2ItemId takes string targetstr returns integer
    return YDWES2Id(targetstr)
endfunction
function GetLastAbilityCastingUnit takes nothing returns unit
    return bj_lastAbilityCastingUnit
endfunction
function GetLastAbilityTargetUnit takes nothing returns unit
    return bj_lastAbilityTargetUnit
endfunction
function YDWESetMapLimitCoordinate takes real MinX,real MaxX,real MinY,real MaxY returns nothing
    set yd_MapMaxX=MaxX
    set yd_MapMinX=MinX
    set yd_MapMaxY=MaxY
    set yd_MapMinY=MinY
endfunction
//===========================================================================
//===========================================================================
//地图初始化
//===========================================================================
//YDWE特殊技能结束事件 
function YDWESyStemAbilityCastingOverTriggerAction takes unit hero,integer index returns nothing
 local integer i= 0
    loop
        exitwhen i >= YDWEBase___AbilityCastingOverEventNumber
        if YDWEBase___AbilityCastingOverEventType[i] == index then
            set bj_lastAbilityCastingUnit=hero
			if YDWEBase___AbilityCastingOverEventQueue[i] != null and TriggerEvaluate(YDWEBase___AbilityCastingOverEventQueue[i]) and IsTriggerEnabled(YDWEBase___AbilityCastingOverEventQueue[i]) then
				call TriggerExecute(YDWEBase___AbilityCastingOverEventQueue[i])
			endif
		endif
        set i=i + 1
    endloop
endfunction
//===========================================================================  
//YDWE技能捕捉事件 
//===========================================================================  
function YDWESyStemAbilityCastingOverRegistTrigger takes trigger trg,integer index returns nothing
	set YDWEBase___AbilityCastingOverEventQueue[YDWEBase___AbilityCastingOverEventNumber]=trg
	set YDWEBase___AbilityCastingOverEventType[YDWEBase___AbilityCastingOverEventNumber]=index
	set YDWEBase___AbilityCastingOverEventNumber=YDWEBase___AbilityCastingOverEventNumber + 1
endfunction 
//===========================================================================
//系统函数完善
//===========================================================================
function YDWECreateUnitPool takes nothing returns nothing
    set bj_lastCreatedUnitPool=CreateUnitPool()
endfunction
function YDWEPlaceRandomUnit takes unitpool up,player p,real x,real y,real face returns nothing
set bj_lastPoolAbstractedUnit=PlaceRandomUnit(up, p, x, y, face)
endfunction
function YDWEGetLastUnitPool takes nothing returns unitpool
    return bj_lastCreatedUnitPool
endfunction
function YDWEGetLastPoolAbstractedUnit takes nothing returns unit
    return bj_lastPoolAbstractedUnit
endfunction
function YDWECreateItemPool takes nothing returns nothing
    set bj_lastCreatedItemPool=CreateItemPool()
endfunction
function YDWEPlaceRandomItem takes itempool ip,real x,real y returns nothing
set bj_lastPoolAbstractedItem=PlaceRandomItem(ip, x, y)
endfunction
function YDWEGetLastItemPool takes nothing returns itempool
    return bj_lastCreatedItemPool
endfunction
function YDWEGetLastPoolAbstractedItem takes nothing returns item
    return bj_lastPoolAbstractedItem
endfunction
function YDWESetAttackDamageWeaponType takes attacktype at,damagetype dt,weapontype wt returns nothing
    set bj_lastSetAttackType=at
    set bj_lastSetDamageType=dt
    set bj_lastSetWeaponType=wt
endfunction
//unitpool bj_lastCreatedPool=null
//unit bj_lastPoolAbstractedUnit=null
function YDWEGetPlayerColorString takes player p,string s returns string
    return YDWEBase___yd_PlayerColor[GetHandleId(GetPlayerColor(p))] + s + "|r"
endfunction
//===========================================================================
//===========================================================================
//系统函数补充
//===========================================================================
//===========================================================================
function YDWEGetUnitItemSoftId takes unit hero,item it returns integer
    local integer i= 0
    loop
         exitwhen i > 5
         if UnitItemInSlot(hero, i) == it then
            return i + 1
         endif
         set i=i + 1
    endloop
    return 0
endfunction
//===========================================================================
//===========================================================================
//地图初始化
//===========================================================================
//===========================================================================
//显示版本
function YDWEVersion_Display takes nothing returns boolean
    call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 30, "|cFF1E90FF当前编辑器版本为： |r|cFF00FF00YDWE 1.31.8.1850")
    return false
endfunction
function YDWEVersion_Init takes nothing returns nothing
    local trigger t= CreateTrigger()
    local integer i= 0
    loop
        exitwhen i == 12
        call TriggerRegisterPlayerChatEvent(t, Player(i), "YDWE Version", true)
        set i=i + 1
    endloop
    call TriggerAddCondition(t, Condition(function YDWEVersion_Display))
    set t=null
endfunction
function InitializeYD takes nothing returns nothing
     set YDHT=InitHashtable()
	//=================设置变量=====================
	set yd_MapMinX=GetCameraBoundMinX() - GetCameraMargin(CAMERA_MARGIN_LEFT)
	set yd_MapMinY=GetCameraBoundMinY() - GetCameraMargin(CAMERA_MARGIN_BOTTOM)
	set yd_MapMaxX=GetCameraBoundMaxX() + GetCameraMargin(CAMERA_MARGIN_RIGHT)
	set yd_MapMaxY=GetCameraBoundMaxY() + GetCameraMargin(CAMERA_MARGIN_TOP)
	
    set YDWEBase___yd_PlayerColor[0]="|cFFFF0303"
    set YDWEBase___yd_PlayerColor[1]="|cFF0042FF"
    set YDWEBase___yd_PlayerColor[2]="|cFF1CE6B9"
    set YDWEBase___yd_PlayerColor[3]="|cFF540081"
    set YDWEBase___yd_PlayerColor[4]="|cFFFFFC01"
    set YDWEBase___yd_PlayerColor[5]="|cFFFE8A0E"
    set YDWEBase___yd_PlayerColor[6]="|cFF20C000"
    set YDWEBase___yd_PlayerColor[7]="|cFFE55BB0"
    set YDWEBase___yd_PlayerColor[8]="|cFF959697"
    set YDWEBase___yd_PlayerColor[9]="|cFF7EBFF1"
    set YDWEBase___yd_PlayerColor[10]="|cFF106246"
    set YDWEBase___yd_PlayerColor[11]="|cFF4E2A04"
    set YDWEBase___yd_PlayerColor[12]="|cFF282828"
    set YDWEBase___yd_PlayerColor[13]="|cFF282828"
    set YDWEBase___yd_PlayerColor[14]="|cFF282828"
    set YDWEBase___yd_PlayerColor[15]="|cFF282828"
    //=================显示版本=====================
    call YDWEVersion_Init()
endfunction

//library YDWEBase ends
//library YDWEGetItemOfTypeFromUnitBJNull:
function YDWEGetItemOfTypeFromUnitBJNull takes unit whichUnit,integer itemId returns item
    local integer index= 0
    loop
        set yd_NullTempItem=UnitItemInSlot(whichUnit, index)
        if GetItemTypeId(yd_NullTempItem) == itemId then
            return yd_NullTempItem
        endif
        set index=index + 1
        exitwhen index >= bj_MAX_INVENTORY
    endloop
    return null
endfunction

//library YDWEGetItemOfTypeFromUnitBJNull ends
//library YDWEUnitHasItemOfTypeBJNull:
function YDWEUnitHasItemOfTypeBJNull takes unit whichUnit,integer itemId returns boolean
    local integer index= 0
	if itemId != 0 then
		loop
			if GetItemTypeId(UnitItemInSlot(whichUnit, index)) == itemId then
				return true
			endif
			set index=index + 1
			exitwhen index >= bj_MAX_INVENTORY
		endloop
	endif
    return false
endfunction

//library YDWEUnitHasItemOfTypeBJNull ends
//library YDWEYDWEJapiScript:


//library YDWEYDWEJapiScript ends
//===========================================================================
// 
// 撸圈TD内测版1.10
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Sat Feb 02 18:25:01 2019
//   Map Author: 渣康传奇
// 
//===========================================================================
//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************
function InitGlobals takes nothing returns nothing
    local integer i= 0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_SAVEYXZH[i]=0
        set i=i + 1
    endloop
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_sysCharIsSyn[i]=false
        set i=i + 1
    endloop
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_sysEQHCId[i]=0
        set i=i + 1
    endloop
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_sysEQHCNeedBZ[i]=0
        set i=i + 1
    endloop
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_sysEQHCIdCurr[i]=0
        set i=i + 1
    endloop
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_sysEQHCNeedLH[i]=0
        set i=i + 1
    endloop
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ui[i]=0
        set i=i + 1
    endloop
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ui_isHEOpen[i]=false
        set i=i + 1
    endloop
    set udg_SellCount=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_CellHasItem[i]=false
        set i=i + 1
    endloop
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_SelectedItemId[i]=0
        set i=i + 1
    endloop
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_SelectedItemIndex[i]=0
        set i=i + 1
    endloop
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_NCards[i]=0
        set i=i + 1
    endloop
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_SRCards[i]=0
        set i=i + 1
    endloop
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_RCards[i]=0
        set i=i + 1
    endloop
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_SSRCards[i]=0
        set i=i + 1
    endloop
    set udg_ClickFrameID=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_SellItemId[i]=0
        set i=i + 1
    endloop
    set udg_jfTimer=CreateTimer()
    set udg_cbTimer=CreateTimer()
    set udg_ghTimer=CreateTimer()
    set udg_pfTimer=CreateTimer()
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_TipsID[i]=0
        set i=i + 1
    endloop
endfunction
//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************
//===========================================================================
function CreateNeutralPassiveBuildings takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'uw11', 0.0, 192.0, 270.000)
    set u=CreateUnit(p, 'uw10', - 828.5, - 390.9, 31.926)
    set u=CreateUnit(p, 'uw02', - 821.7, 408.1, 341.064)
    set u=CreateUnit(p, 'uw04', 839.1, - 382.3, 157.384)
    set u=CreateUnit(p, 'uw01', 29.4, 1047.0, 270.669)
    set u=CreateUnit(p, 'uw05', 54.3, - 884.4, 91.704)
    set u=CreateUnit(p, 'uw03', 843.6, 455.6, 182.015)
endfunction
//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
endfunction
//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
endfunction
//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreateNeutralPassiveBuildings()
    call CreatePlayerBuildings()
    call CreatePlayerUnits()
endfunction
//***************************************************************************
//*
//*  Regions
//*
//***************************************************************************
function CreateRegions takes nothing returns nothing
    local weathereffect we
    set gg_rct_chuguaikou1=Rect(- 1600.0, 768.0, - 928.0, 1408.0)
    set gg_rct_chuguaikou2=Rect(864.0, 1024.0, 1344.0, 1664.0)
    set gg_rct_chuguaikou3=Rect(1024.0, - 1280.0, 1504.0, - 832.0)
    set gg_rct_chuguaikou4=Rect(- 1312.0, - 1536.0, - 832.0, - 1088.0)
    set gg_rct_rect006=Rect(4320.0, - 128.0, 4608.0, 192.0)
    set gg_rct_rect005=Rect(- 192.0, 4288.0, 96.0, 4640.0)
    set gg_rct_rect007=Rect(- 96.0, - 4640.0, 224.0, - 4288.0)
    set gg_rct_rect001=Rect(- 3616.0, 4384.0, - 3424.0, 4544.0)
    set gg_rct_rect002=Rect(4416.0, 3456.0, 4544.0, 3648.0)
    set gg_rct_rect004=Rect(- 4512.0, - 3648.0, - 4384.0, - 3424.0)
    set gg_rct_rect003=Rect(3424.0, - 4512.0, 3648.0, - 4320.0)
    set gg_rct_rect011=Rect(- 96.0, - 5472.0, 192.0, - 5120.0)
    set gg_rct_rect012=Rect(- 5472.0, - 224.0, - 5216.0, 96.0)
    set gg_rct_rect010=Rect(5184.0, - 64.0, 5440.0, 192.0)
    set gg_rct_rect009=Rect(- 160.0, 5152.0, 96.0, 5408.0)
    set gg_rct_rect008=Rect(- 4576.0, - 320.0, - 4288.0, 160.0)
    set gg_rct_effect001=Rect(- 4256.0, - 6816.0, - 2336.0, - 6080.0)
    set we=AddWeatherEffect(gg_rct_effect001, 'FDbh')
    call EnableWeatherEffect(we, true)
    set gg_rct_effect002=Rect(- 6560.0, - 6464.0, - 5984.0, - 5312.0)
    set we=AddWeatherEffect(gg_rct_effect002, 'FDbh')
    call EnableWeatherEffect(we, true)
    set gg_rct_effect003=Rect(- 6784.0, - 6688.0, - 6208.0, - 5536.0)
    set we=AddWeatherEffect(gg_rct_effect003, 'FDbh')
    call EnableWeatherEffect(we, true)
    set gg_rct_effect004=Rect(- 6368.0, - 7200.0, - 5504.0, - 6240.0)
    set we=AddWeatherEffect(gg_rct_effect004, 'FDbh')
    call EnableWeatherEffect(we, true)
    set gg_rct_rect013=Rect(- 5408.0, 5280.0, - 5280.0, 5376.0)
    set gg_rct_rect014=Rect(5280.0, 5280.0, 5376.0, 5376.0)
    set gg_rct_rect015=Rect(5280.0, - 5376.0, 5376.0, - 5280.0)
    set gg_rct_rect016=Rect(- 5440.0, - 5376.0, - 5312.0, - 5248.0)
endfunction
//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************
//TESH.scrollpos=196
//TESH.alwaysfold=0


//异步处理
function SetHeroSkillIcon takes integer id,integer goldcost returns nothing
    call DzFrameSetText(DzFrameFindByName("ZTTEXT", 0), ( EXExecuteScript("(require'jass.slk').item[" + I2S(id) + "].Name") ))
    call DzFrameSetTexture(DzFrameFindByName("ZTTouX1UP", 0), ( EXExecuteScript("(require'jass.slk').item[" + I2S(id) + "].Art") ), 0)
    call DzFrameSetAlpha(DzFrameFindByName("ABBLACK", 0), 188)
    call DzFrameShow(DzFrameFindByName("ABBLACK", 0), true)
    call DzFrameShow(DzFrameFindByName("BAG3", 0), true)
    call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), false)
    call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), false)
    
    call DzSyncData("BuyItem", I2S(id) + ",0,0,0," + I2S(goldcost))
    
     
        if ( id == 1229467958 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095251249)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095251249) + "].Art") ), 0)
            if ( 1095251250 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095251250)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095251250) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 1095251251 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 1095251251)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095251251) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229467955 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095250997)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250997) + "].Art") ), 0)
            if ( 1095250998 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095250998)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250998) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 1095250999 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 1095250999)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250999) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229467952 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095250740)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250740) + "].Art") ), 0)
            if ( 1095250742 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095250742)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250742) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 1095250743 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 1095250743)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250743) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229467701 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095250228)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250228) + "].Art") ), 0)
            if ( 1095250229 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095250229)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250229) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 1095250230 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 1095250230)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250230) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229468209 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095251504)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095251504) + "].Art") ), 0)
            if ( 1095251505 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095251505)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095251505) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 1095251506 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 1095251506)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095251506) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229467700 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095250225)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250225) + "].Art") ), 0)
            if ( 1095250226 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095250226)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250226) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 1095250227 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 1095250227)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250227) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229467959 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095251507)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095251507) + "].Art") ), 0)
            if ( 1095251508 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095251508)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095251508) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 1095251509 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 1095251509)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095251509) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229467954 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095250994)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250994) + "].Art") ), 0)
            if ( 1095250995 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095250995)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250995) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 1095250996 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 1095250996)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250996) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229467703 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095250480)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250480) + "].Art") ), 0)
            if ( 1095250481 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095250481)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250481) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 1095250482 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 1095250482)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250482) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229467702 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095250231)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250231) + "].Art") ), 0)
            if ( 1095250232 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095250232)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250232) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 1095250233 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 1095250233)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250233) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229468464 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1096101936)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1096101936) + "].Art") ), 0)
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229468465 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1096101937)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1096101937) + "].Art") ), 0)
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229468466 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1096101939)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1096101939) + "].Art") ), 0)
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229468467 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1096101940)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1096101940) + "].Art") ), 0)
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229468468 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1096101941)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1096101941) + "].Art") ), 0)
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229468469 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1096101943)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1096101943) + "].Art") ), 0)
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229468470 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1096101944)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1096101944) + "].Art") ), 0)
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229468471 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1096101945)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1096101945) + "].Art") ), 0)
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229468472 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095252016)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095252016) + "].Art") ), 0)
            if ( 1095252017 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095252017)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095252017) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229467961 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095250483)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250483) + "].Art") ), 0)
            if ( 1095250484 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095250484)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250484) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 1095250485 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 1095250485)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250485) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229467699 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095249977)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095249977) + "].Art") ), 0)
            if ( 1095249974 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095249974)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095249974) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 1095250224 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 1095250224)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095250224) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229467698 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095249973)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095249973) + "].Art") ), 0)
            if ( 1095249976 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095249976)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095249976) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 1095249975 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 1095249975)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095249975) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229468724 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095252024)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095252024) + "].Art") ), 0)
            if ( 1095252025 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095252025)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095252025) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229468723 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095252022)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095252022) + "].Art") ), 0)
            if ( 1095252023 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095252023)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095252023) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229468722 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095252020)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095252020) + "].Art") ), 0)
            if ( 1095252021 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095252021)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095252021) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
        if ( id == 1229468721 ) then
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 2, "BtnTipsOn", false)
            call DzFrameSetScript(DzFrameFindByName("ZTJIN", 0), 3, "BtnTipsOff", false)
            call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN", 0)) )), ( 1095252018)) // INLINED!!
            call DzFrameSetTexture(DzFrameFindByName("ZTJINUP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095252018) + "].Art") ), 0)
            if ( 1095252019 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN1", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN1", 0)) )), ( 1095252019)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN1UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(1095252019) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN1", 0), true)
            endif
            if ( 0 != 0 ) then
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 2, "BtnTipsOn", false)
                call DzFrameSetScript(DzFrameFindByName("ZTJIN2", 0), 3, "BtnTipsOff", false)
                call SaveInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzFrameFindByName("ZTJIN2", 0)) )), ( 0)) // INLINED!!
                call DzFrameSetTexture(DzFrameFindByName("ZTJIN2UP", 0), ( EXExecuteScript("(require'jass.slk').ability[" + I2S(0) + "].Art") ), 0)
                call DzFrameShow(DzFrameFindByName("ZTJIN2", 0), true)
            endif
        endif
     
endfunction
function GetIndexOfItemType takes unit whichUnit,integer itemId,integer filterIndex returns integer
    local integer index
    local item indexItem
    set index=0
    loop
        set indexItem=UnitItemInSlot(whichUnit, index)
        if indexItem != null and GetItemTypeId(indexItem) == itemId and index != filterIndex then
            return index
        endif
        set index=index + 1
        exitwhen index >= bj_MAX_INVENTORY
    endloop
    return - 1
endfunction
function GetIndexOfItem takes unit whichUnit,item it,integer filterIndex returns integer
    local integer index
    local item indexItem
    set index=0
    loop
        set indexItem=UnitItemInSlot(whichUnit, index)
        if indexItem != null and indexItem == it and index == filterIndex then
            return index
        endif
        set index=index + 1
        exitwhen index >= bj_MAX_INVENTORY
    endloop
    return - 1
endfunction
function BtnTipsOn takes nothing returns nothing
    local integer id
    local string tip
    if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
        set id=(LoadInteger(YDHT, StringHash(("Tips" )), StringHash(( I2S(DzGetTriggerUIEventFrame()))))) // INLINED!!
        if id != 0 then
            set tip=( EXExecuteScript("(require'jass.slk').ability[" + I2S(id) + "].Name") )
            call DzFrameClearAllPoints(udg_Frames[30])
            call DzFrameSetPoint(udg_Frames[30], 0, DzGetTriggerUIEventFrame(), 2, 0.0, 0.0)
            call DzFrameSetText(udg_Frames[31], tip)
            call DzFrameShow(udg_Frames[30], true)
          //  call DzFrameShow(udg_Frames[31], true)
        endif
    endif
endfunction
function BtnTipsOff takes nothing returns nothing
    call DzFrameShow(udg_Frames[30], false)
endfunction
function BtnSelect2 takes nothing returns nothing
    local integer index
    if ( udg_Frames[10] == DzGetTriggerUIEventFrame() ) then
        set index=1
    endif
    if ( udg_Frames[12] == DzGetTriggerUIEventFrame() ) then
        set index=2
    endif
    if ( udg_Frames[14] == DzGetTriggerUIEventFrame() ) then
        set index=3
    endif
    if ( udg_Frames[16] == DzGetTriggerUIEventFrame() ) then
        set index=4
    endif
    if ( udg_Frames[18] == DzGetTriggerUIEventFrame() ) then
        set index=5
    endif
    if ( udg_Frames[20] == DzGetTriggerUIEventFrame() ) then
        set index=6
    endif
    call DzSyncData("AddItem3", I2S(index))
endfunction
//刷新物品栏
function RefreshItemCell takes player play returns nothing
    local unit selectedUnit
    local integer index
    local item indexItem
    local integer indexid= 0
    local integer framesId=10
    if ( play != GetLocalPlayer() ) then
        return
    endif
        
    call DzFrameSetText(DzFrameFindByName("HeroGold", 0), I2S(GetPlayerState(play, PLAYER_STATE_RESOURCE_GOLD)))
    set selectedUnit=udg_SelectedHeros[GetPlayerId(play)]
    
    set index=0
    loop
        set indexItem=UnitItemInSlot(selectedUnit, index)
        set indexid=GetItemTypeId(indexItem)
        if indexItem != null then
            //call DzFrameSetScript(udg_Frames[framesId], 1, "Trig_BtnSelectActions", false)
            call SaveInteger(YDHT, StringHash(("ItemCell" )), StringHash(( I2S(udg_Frames[framesId]) )), ( indexid)) // INLINED!!
            call DzFrameShow(udg_Frames[framesId], true)
        else
            call DzFrameShow(udg_Frames[framesId], false)
        endif
        set framesId=framesId + 1
        if indexItem != null then
            call DzFrameSetTexture(udg_Frames[framesId], ( EXExecuteScript("(require'jass.slk').item[" + I2S(indexid) + "].Art") ), 0)
            call DzFrameShow(udg_Frames[framesId], true)
        else
            call DzFrameShow(udg_Frames[framesId], false)
        endif
        set framesId=framesId + 1
        set index=index + 1
        exitwhen index >= bj_MAX_INVENTORY
    endloop
endfunction
//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************
//===========================================================================
// Trigger: 初始化装备列表
//===========================================================================
function Trig______________________uActions takes nothing returns nothing
    call SetTimeOfDay(12)
    call FogEnable(false)
    call FogMaskEnableOff()
    set udg_table=( InitHashtable() )
    call Cheat("exec-lua:scripts.main")
    call DzLoadToc("custom2.toc")
    // 装备商店
    set udg_UI_ab[0]=DzCreateFrame("BAG", DzGetGameUI(), 0)
    call DzFrameSetPoint(udg_UI_ab[0], 4, DzGetGameUI(), 4, 0, 0.06)
    call DzFrameShow(udg_UI_ab[0], false)
    // 商店按钮
    set udg_UI_ab[1]=DzCreateFrame("BAG1", DzGetGameUI(), 0)
    call DzFrameSetPoint(udg_UI_ab[1], 4, DzGetGameUI(), 4, - 0.33, - 0.093)
    call DzFrameSetSize(DzFrameFindByName("AA", 0), 0.037, 0.037)
    call DzFrameShow(udg_UI_ab[1], true)
    // 英雄商店
    set udg_UI_ab[2]=DzCreateFrame("BAG2", DzGetGameUI(), 0)
    call DzFrameSetPoint(udg_UI_ab[2], 4, DzGetGameUI(), 4, 0, 0.06)
    call DzFrameShow(udg_UI_ab[2], false)
    // 英雄商店购买成功界面
    call DzFrameShow(DzFrameFindByName("ABBLACK", 0), false)
    call DzFrameShow(DzFrameFindByName("BAG3", 0), false)
    call DzFrameSetText(DzFrameFindByName("AA11", 0), "|cff00ffff装 备|r")
    call DzFrameSetText(DzFrameFindByName("AA22", 0), "|cFFFCC403英 雄|r")
    call DzFrameSetText(DzFrameFindByName("AA33", 0), "|cff00ffff物理|r|n|cff00ffff攻击|r")
    call DzFrameSetText(DzFrameFindByName("AA44", 0), "|cFFFCC403攻速|r|n|cFFFCC403暴击|r")
    call DzFrameSetText(DzFrameFindByName("AA55", 0), "|cFFFCC403法术|r|n|cFFFCC403攻击|r")
    call DzFrameSetText(DzFrameFindByName("AA66", 0), "|cFFFCC403冷却|r|n|cFFFCC403缩减|r")
    call DzFrameSetText(DzFrameFindByName("AA77", 0), "|cFFFCC403蓝量|r|n|cFFFCC403回复|r")
    call DzFrameSetText(DzFrameFindByName("AB11", 0), "|cFFFCC403装 备|r")
    call DzFrameSetText(DzFrameFindByName("AB22", 0), "|cFFFCC403英 雄|r")
    call DzFrameSetText(DzFrameFindByName("ABBB1", 0), "|cfff5fcb9出售|r")
    call DzFrameSetText(DzFrameFindByName("ABBB2", 0), "|cfff5fcb9购买|r")
    call DzFrameSetText(DzFrameFindByName("ABBB3", 0), "|cfff5fcb9关闭|r")
    call DzFrameSetText(DzFrameFindByName("HeroCardshowtext", 0), "|cfff5fcb91000|r")
    call DzFrameSetText(DzFrameFindByName("HeroCardshowtext1", 0), "|cfff5fcb93000|r")
    call DzFrameSetText(DzFrameFindByName("HeroCardshowtext2", 0), "|cfff5fcb95000|r")
    call DzFrameShow(DzFrameFindByName("HCUP", 0), false)
    set udg_Frames[0]=DzFrameFindByName("HC1", 0)
    call DzFrameShow(udg_Frames[0], false)
    set udg_Frames[1]=DzFrameFindByName("HC1UP", 0)
    set udg_Frames[2]=DzFrameFindByName("HC1A1", 0)
    set udg_Frames[3]=DzFrameFindByName("HC2", 0)
    call DzFrameShow(udg_Frames[3], false)
    set udg_Frames[4]=DzFrameFindByName("HC2UP", 0)
    set udg_Frames[5]=DzFrameFindByName("HC1A2", 0)
    set udg_Frames[6]=DzFrameFindByName("HC3", 0)
    call DzFrameShow(udg_Frames[6], false)
    set udg_Frames[7]=DzFrameFindByName("HC3UP", 0)
    set udg_Frames[8]=DzFrameFindByName("HC1A3", 0)
    call DzFrameShow(DzFrameFindByName("HCCUP", 0), false)
    call DzFrameSetText(DzFrameFindByName("HCA1", 0), "")
    call DzFrameSetText(DzFrameFindByName("HC1A1", 0), "")
    call DzFrameSetText(DzFrameFindByName("HC1A2", 0), "")
    call DzFrameSetText(DzFrameFindByName("HC1A3", 0), "")
    call DzFrameSetText(DzFrameFindByName("HC2A1", 0), "")
    call DzFrameSetText(DzFrameFindByName("HC2A2", 0), "")
    call DzFrameSetText(DzFrameFindByName("HC2A3", 0), "")
    call DzFrameSetText(DzFrameFindByName("HC2A4", 0), "")
    call DzFrameSetText(DzFrameFindByName("HC2A5", 0), "")
    set udg_Frames[10]=DzFrameFindByName("Hero1", 0)
    set udg_Frames[11]=DzFrameFindByName("Hero1UP", 0)
    call DzFrameShow(udg_Frames[10], false)
    set udg_Frames[12]=DzFrameFindByName("Hero2", 0)
    set udg_Frames[13]=DzFrameFindByName("Hero2UP", 0)
    call DzFrameShow(udg_Frames[12], false)
    set udg_Frames[14]=DzFrameFindByName("Hero3", 0)
    set udg_Frames[15]=DzFrameFindByName("Hero3UP", 0)
    call DzFrameShow(udg_Frames[14], false)
    set udg_Frames[16]=DzFrameFindByName("Hero4", 0)
    set udg_Frames[17]=DzFrameFindByName("Hero4UP", 0)
    call DzFrameShow(udg_Frames[16], false)
    set udg_Frames[18]=DzFrameFindByName("Hero5", 0)
    set udg_Frames[19]=DzFrameFindByName("Hero5UP", 0)
    call DzFrameShow(udg_Frames[18], false)
    set udg_Frames[20]=DzFrameFindByName("Hero6", 0)
    set udg_Frames[21]=DzFrameFindByName("Hero6UP", 0)
    call DzFrameShow(udg_Frames[20], false)
    set udg_Frames[30]=DzCreateFrameByTagName("BACKDROP", "30", DzGetGameUI(), "template", 30)
    call DzFrameSetTexture(udg_Frames[30], "UI\\notice.blp", 0)
    call DzFrameSetSize(udg_Frames[30], 0.06, 0.03)
    call DzFrameSetPoint(udg_Frames[30], 0, DzGetGameUI(), 0, 0, 0.06)
    set udg_Frames[31]=DzCreateFrameByTagName("TEXT", "31", udg_Frames[30], "template", 31)
    call DzFrameSetText(udg_Frames[31], "装备tips")
    call DzFrameSetSize(udg_Frames[31], 0.06, 0.03)
    call DzFrameSetPoint(udg_Frames[31], 0, udg_Frames[30], 0, 0.01, - 0.01)
    call DzFrameShow(udg_Frames[30], false)
    call TriggerExecute(gg_trg_InitItemCell)
    call TriggerExecute(gg_trg_initButton)
    call DzFrameShow(DzFrameFindByName("ItemCellAds", 0), true)
    call DzFrameShow(DzFrameFindByName("ItemCellAps", 0), false)
    call DzFrameShow(DzFrameFindByName("ItemCellCrits", 0), false)
    call DzFrameShow(DzFrameFindByName("ItemCellCooldowns", 0), false)
    call DzFrameShow(DzFrameFindByName("ItemCellManas", 0), false)
endfunction
//===========================================================================
function InitTrig______________________u takes nothing returns nothing
    set gg_trg______________________u=CreateTrigger()
    call TriggerAddAction(gg_trg______________________u, function Trig______________________uActions)
endfunction
//===========================================================================
// Trigger: InitItemCell
//
// call DzFrameSetText( DzFrameFindByName("HeroGold", 0), I2S(GetPlayerState(play, PLAYER_STATE_RESOURCE_GOLD)) )
//     set selectedUnit = udg_SelectedHeros[GetPlayerId(play)]
//     if selectedUnit != null then
//         
//             set it = UnitItemInSlot(selectedUnit,0)
//             set id = GetItemTypeId(it)
//             if it != null then
//                 call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect2", false)
//             //    call DzFrameSetScript(udg_Frames[framesId], 2, "BtnTipsOn" , false )
//             //    call DzFrameSetScript(udg_Frames[framesId], 3, "BtnTipsOff", false)
//              //   call YDWESaveIntegerByString("ItemCell", I2S(udg_Frames[framesId]), id  )  
//                 call DzFrameShow(udg_Frames[framesId], true)
//             else
//                 call DzFrameShow(udg_Frames[framesId], false)
//             endif
//             set framesId = framesId+1
//             if it != null then
//                 call DzFrameSetTexture(udg_Frames[framesId], YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id , "Art"), 0)
//                 call DzFrameShow(udg_Frames[framesId], true)
//             else
//                 call DzFrameShow(udg_Frames[framesId], false)
//             endif
//             set framesId = framesId+1
//         
//             set it = UnitItemInSlot(selectedUnit,1)
//             set id = GetItemTypeId(it)
//             if it != null then
//                 call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect2", false)
//             //    call DzFrameSetScript(udg_Frames[framesId], 2, "BtnTipsOn" , false )
//             //    call DzFrameSetScript(udg_Frames[framesId], 3, "BtnTipsOff", false)
//              //   call YDWESaveIntegerByString("ItemCell", I2S(udg_Frames[framesId]), id  )  
//                 call DzFrameShow(udg_Frames[framesId], true)
//             else
//                 call DzFrameShow(udg_Frames[framesId], false)
//             endif
//             set framesId = framesId+1
//             if it != null then
//                 call DzFrameSetTexture(udg_Frames[framesId], YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id , "Art"), 0)
//                 call DzFrameShow(udg_Frames[framesId], true)
//             else
//                 call DzFrameShow(udg_Frames[framesId], false)
//             endif
//             set framesId = framesId+1
//         
//             set it = UnitItemInSlot(selectedUnit,2)
//             set id = GetItemTypeId(it)
//             if it != null then
//                 call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect2", false)
//             //    call DzFrameSetScript(udg_Frames[framesId], 2, "BtnTipsOn" , false )
//             //    call DzFrameSetScript(udg_Frames[framesId], 3, "BtnTipsOff", false)
//              //   call YDWESaveIntegerByString("ItemCell", I2S(udg_Frames[framesId]), id  )  
//                 call DzFrameShow(udg_Frames[framesId], true)
//             else
//                 call DzFrameShow(udg_Frames[framesId], false)
//             endif
//             set framesId = framesId+1
//             if it != null then
//                 call DzFrameSetTexture(udg_Frames[framesId], YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id , "Art"), 0)
//                 call DzFrameShow(udg_Frames[framesId], true)
//             else
//                 call DzFrameShow(udg_Frames[framesId], false)
//             endif
//             set framesId = framesId+1
//         
//             set it = UnitItemInSlot(selectedUnit,3)
//             set id = GetItemTypeId(it)
//             if it != null then
//                 call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect2", false)
//             //    call DzFrameSetScript(udg_Frames[framesId], 2, "BtnTipsOn" , false )
//             //    call DzFrameSetScript(udg_Frames[framesId], 3, "BtnTipsOff", false)
//              //   call YDWESaveIntegerByString("ItemCell", I2S(udg_Frames[framesId]), id  )  
//                 call DzFrameShow(udg_Frames[framesId], true)
//             else
//                 call DzFrameShow(udg_Frames[framesId], false)
//             endif
//             set framesId = framesId+1
//             if it != null then
//                 call DzFrameSetTexture(udg_Frames[framesId], YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id , "Art"), 0)
//                 call DzFrameShow(udg_Frames[framesId], true)
//             else
//                 call DzFrameShow(udg_Frames[framesId], false)
//             endif
//             set framesId = framesId+1
//         
//             set it = UnitItemInSlot(selectedUnit,4)
//             set id = GetItemTypeId(it)
//             if it != null then
//                 call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect2", false)
//             //    call DzFrameSetScript(udg_Frames[framesId], 2, "BtnTipsOn" , false )
//             //    call DzFrameSetScript(udg_Frames[framesId], 3, "BtnTipsOff", false)
//              //   call YDWESaveIntegerByString("ItemCell", I2S(udg_Frames[framesId]), id  )  
//                 call DzFrameShow(udg_Frames[framesId], true)
//             else
//                 call DzFrameShow(udg_Frames[framesId], false)
//             endif
//             set framesId = framesId+1
//             if it != null then
//                 call DzFrameSetTexture(udg_Frames[framesId], YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id , "Art"), 0)
//                 call DzFrameShow(udg_Frames[framesId], true)
//             else
//                 call DzFrameShow(udg_Frames[framesId], false)
//             endif
//             set framesId = framesId+1
//         
//             set it = UnitItemInSlot(selectedUnit,5)
//             set id = GetItemTypeId(it)
//             if it != null then
//                 call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect2", false)
//             //    call DzFrameSetScript(udg_Frames[framesId], 2, "BtnTipsOn" , false )
//             //    call DzFrameSetScript(udg_Frames[framesId], 3, "BtnTipsOff", false)
//              //   call YDWESaveIntegerByString("ItemCell", I2S(udg_Frames[framesId]), id  )  
//                 call DzFrameShow(udg_Frames[framesId], true)
//             else
//                 call DzFrameShow(udg_Frames[framesId], false)
//             endif
//             set framesId = framesId+1
//             if it != null then
//                 call DzFrameSetTexture(udg_Frames[framesId], YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id , "Art"), 0)
//                 call DzFrameShow(udg_Frames[framesId], true)
//             else
//                 call DzFrameShow(udg_Frames[framesId], false)
//             endif
//             set framesId = framesId+1
//         
//     endif
//===========================================================================
function Trig_InitItemCellActions takes nothing returns nothing
    local integer framesId= 100
    set udg_ItemAds[0]='I001'
    set udg_ItemAds[1]='I003'
    set udg_ItemAds[2]='I005'
    set udg_ItemAds[3]='I010'
    set udg_ItemAds[4]='I011'
    set udg_ItemAds[5]='I017'
    set udg_ItemAds[6]='I023'
    set udg_ItemAds[7]='I019'
    set udg_ItemAds[8]='I021'
    set udg_ItemAds[9]='I025'
    set udg_ItemAds[10]='I047'
    set udg_ItemAds[11]='I060'
    set udg_ItemAds[12]='I052'
    set udg_ItemAds[13]='I085'
    set udg_ItemAds[14]='I054'
    set udg_ItemAds[15]='I079'
    set udg_ItemAds[16]='I050'
    set udg_ItemAds[17]='I090'
    set udg_ItemAds[18]='I045'
    set udg_ItemAds[19]='I043'
    set udg_ItemAds[20]='I062'
    set bj_forLoopAIndex=0
    set bj_forLoopAIndexEnd=24
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( ( bj_forLoopAIndex > 20 ) ) then
            set bj_forLoopBIndex=1
            set bj_forLoopBIndexEnd=4
            loop
                exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
                set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
                call DzFrameShow(udg_Frames[framesId], false)
                set framesId=framesId + 1
                set bj_forLoopBIndex=bj_forLoopBIndex + 1
            endloop
        else
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call SaveInteger(YDHT, StringHash(("ItemCell" )), StringHash(( I2S(udg_Frames[framesId]) )), ( udg_ItemAds[bj_forLoopAIndex])) // INLINED!!
            // 图片
            set framesId=framesId + 1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetTexture(udg_Frames[framesId], ( EXExecuteScript("(require'jass.slk').item[" + I2S(udg_ItemAds[bj_forLoopAIndex]) + "].Art") ), 0)
            // 名字
            set framesId=framesId + 1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText(udg_Frames[framesId], ( EXExecuteScript("(require'jass.slk').item[" + I2S(udg_ItemAds[bj_forLoopAIndex]) + "].Name") ))
            // 价格
            set framesId=framesId + 1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText(udg_Frames[framesId], ( EXExecuteScript("(require'jass.slk').item[" + I2S(udg_ItemAds[bj_forLoopAIndex]) + "].goldcost") ))
            call DzFrameSetScale(udg_Frames[framesId], 0.80)
            set framesId=framesId + 1
        endif
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
    call DzFrameShow(DzFrameFindByName("ItemCellAds", 0), false)
    set framesId=200
    set udg_ItemAps[1]='I002'
    set udg_ItemAps[2]='I009'
    set udg_ItemAps[3]='I028'
    set udg_ItemAps[4]='I029'
    set udg_ItemAps[5]='I035'
    set udg_ItemAps[6]='I041'
    set udg_ItemAps[7]='I037'
    set udg_ItemAps[8]='I066'
    set udg_ItemAps[9]='I071'
    set udg_ItemAps[10]='I083'
    set udg_ItemAps[11]='I064'
    set udg_ItemAps[12]='I075'
    set udg_ItemAps[13]='I069'
    set udg_ItemAps[14]='I090'
    set udg_ItemAps[15]='I073'
    set udg_ItemAps[16]='I077'
    set bj_forLoopAIndex=1
    set bj_forLoopAIndexEnd=25
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( ( bj_forLoopAIndex > 16 ) ) then
            set bj_forLoopBIndex=1
            set bj_forLoopBIndexEnd=4
            loop
                exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
                set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
                call DzFrameShow(udg_Frames[framesId], false)
                set framesId=framesId + 1
                set bj_forLoopBIndex=bj_forLoopBIndex + 1
            endloop
        else
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call SaveInteger(YDHT, StringHash(("ItemCell" )), StringHash(( I2S(udg_Frames[framesId]) )), ( udg_ItemAps[bj_forLoopAIndex])) // INLINED!!
            // 图片
            set framesId=framesId + 1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetTexture(udg_Frames[framesId], ( EXExecuteScript("(require'jass.slk').item[" + I2S(udg_ItemAps[bj_forLoopAIndex]) + "].Art") ), 0)
            // 名字
            set framesId=framesId + 1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText(udg_Frames[framesId], ( EXExecuteScript("(require'jass.slk').item[" + I2S(udg_ItemAps[bj_forLoopAIndex]) + "].Name") ))
            // 价格
            set framesId=framesId + 1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText(udg_Frames[framesId], ( EXExecuteScript("(require'jass.slk').item[" + I2S(udg_ItemAps[bj_forLoopAIndex]) + "].goldcost") ))
            call DzFrameSetScale(udg_Frames[framesId], 0.80)
            set framesId=framesId + 1
        endif
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
    call DzFrameShow(DzFrameFindByName("ItemCellAps", 0), false)
    set framesId=300
    set udg_ItemCrits[0]='I001'
    set udg_ItemCrits[1]='I004'
    set udg_ItemCrits[2]='I006'
    set udg_ItemCrits[3]='I013'
    set udg_ItemCrits[4]='I081'
    set udg_ItemCrits[5]='I015'
    set udg_ItemCrits[6]='I027'
    set udg_ItemCrits[7]='I058'
    set udg_ItemCrits[8]='I083'
    set udg_ItemCrits[9]='I056'
    set udg_ItemCrits[10]='I045'
    set udg_ItemCrits[11]='I090'
    set udg_ItemCrits[12]='I043'
    set bj_forLoopAIndex=0
    set bj_forLoopAIndexEnd=24
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( ( bj_forLoopAIndex > 12 ) ) then
            set bj_forLoopBIndex=1
            set bj_forLoopBIndexEnd=4
            loop
                exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
                set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
                call DzFrameShow(udg_Frames[framesId], false)
                set framesId=framesId + 1
                set bj_forLoopBIndex=bj_forLoopBIndex + 1
            endloop
        else
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call SaveInteger(YDHT, StringHash(("ItemCell" )), StringHash(( I2S(udg_Frames[framesId]) )), ( udg_ItemCrits[bj_forLoopAIndex])) // INLINED!!
            // 图片
            set framesId=framesId + 1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetTexture(udg_Frames[framesId], ( EXExecuteScript("(require'jass.slk').item[" + I2S(udg_ItemCrits[bj_forLoopAIndex]) + "].Art") ), 0)
            // 名字
            set framesId=framesId + 1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText(udg_Frames[framesId], ( EXExecuteScript("(require'jass.slk').item[" + I2S(udg_ItemCrits[bj_forLoopAIndex]) + "].Name") ))
            // 价格
            set framesId=framesId + 1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText(udg_Frames[framesId], ( EXExecuteScript("(require'jass.slk').item[" + I2S(udg_ItemCrits[bj_forLoopAIndex]) + "].goldcost") ))
            call DzFrameSetScale(udg_Frames[framesId], 0.80)
            set framesId=framesId + 1
        endif
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
    call DzFrameShow(DzFrameFindByName("ItemCellCrits", 0), false)
    set framesId=400
    set udg_ItemCooldowns[0]='I039'
    set udg_ItemCooldowns[1]='I092'
    set udg_ItemCooldowns[2]='I037'
    set udg_ItemCooldowns[3]='I081'
    set udg_ItemCooldowns[4]='I033'
    set udg_ItemCooldowns[5]='I021'
    set udg_ItemCooldowns[6]='I087'
    set udg_ItemCooldowns[7]='I054'
    set udg_ItemCooldowns[8]='I050'
    set udg_ItemCooldowns[9]='I071'
    set udg_ItemCooldowns[10]='I075'
    set udg_ItemCooldowns[11]='I083'
    set udg_ItemCooldowns[12]='I064'
    set udg_ItemCooldowns[13]='I085'
    set udg_ItemCooldowns[14]='I045'
    set bj_forLoopAIndex=0
    set bj_forLoopAIndexEnd=24
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( ( bj_forLoopAIndex > 12 ) ) then
            set bj_forLoopBIndex=1
            set bj_forLoopBIndexEnd=4
            loop
                exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
                set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
                call DzFrameShow(udg_Frames[framesId], false)
                set framesId=framesId + 1
                set bj_forLoopBIndex=bj_forLoopBIndex + 1
            endloop
        else
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call SaveInteger(YDHT, StringHash(("ItemCell" )), StringHash(( I2S(udg_Frames[framesId]) )), ( udg_ItemCooldowns[bj_forLoopAIndex])) // INLINED!!
            // 图片
            set framesId=framesId + 1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetTexture(udg_Frames[framesId], ( EXExecuteScript("(require'jass.slk').item[" + I2S(udg_ItemCooldowns[bj_forLoopAIndex]) + "].Art") ), 0)
            // 名字
            set framesId=framesId + 1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText(udg_Frames[framesId], ( EXExecuteScript("(require'jass.slk').item[" + I2S(udg_ItemCooldowns[bj_forLoopAIndex]) + "].Name") ))
            // 价格
            set framesId=framesId + 1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText(udg_Frames[framesId], ( EXExecuteScript("(require'jass.slk').item[" + I2S(udg_ItemCooldowns[bj_forLoopAIndex]) + "].goldcost") ))
            call DzFrameSetScale(udg_Frames[framesId], 0.80)
            set framesId=framesId + 1
        endif
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
    call DzFrameShow(DzFrameFindByName("ItemCellCooldowns", 0), false)
    set framesId=500
    set udg_ItemManas[0]='I002'
    set udg_ItemManas[1]='I008'
    set udg_ItemManas[2]='I007'
    set udg_ItemManas[3]='I039'
    set udg_ItemManas[4]='I031'
    set udg_ItemManas[5]='I035'
    set udg_ItemManas[6]='I041'
    set udg_ItemManas[7]='I033'
    set udg_ItemManas[8]='I047'
    set udg_ItemManas[9]='I066'
    set udg_ItemManas[10]='I071'
    set udg_ItemManas[11]='I064'
    set udg_ItemManas[12]='I075'
    set udg_ItemManas[13]='I085'
    set udg_ItemManas[14]='I045'
    set bj_forLoopAIndex=0
    set bj_forLoopAIndexEnd=24
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( ( bj_forLoopAIndex > 14 ) ) then
            set bj_forLoopBIndex=1
            set bj_forLoopBIndexEnd=4
            loop
                exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
                set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
                call DzFrameShow(udg_Frames[framesId], false)
                set framesId=framesId + 1
                set bj_forLoopBIndex=bj_forLoopBIndex + 1
            endloop
        else
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call SaveInteger(YDHT, StringHash(("ItemCell" )), StringHash(( I2S(udg_Frames[framesId]) )), ( udg_ItemManas[bj_forLoopAIndex])) // INLINED!!
            // 图片
            set framesId=framesId + 1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetTexture(udg_Frames[framesId], ( EXExecuteScript("(require'jass.slk').item[" + I2S(udg_ItemManas[bj_forLoopAIndex]) + "].Art") ), 0)
            // 名字
            set framesId=framesId + 1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText(udg_Frames[framesId], ( EXExecuteScript("(require'jass.slk').item[" + I2S(udg_ItemManas[bj_forLoopAIndex]) + "].Name") ))
            // 价格
            set framesId=framesId + 1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText(udg_Frames[framesId], ( EXExecuteScript("(require'jass.slk').item[" + I2S(udg_ItemManas[bj_forLoopAIndex]) + "].goldcost") ))
            call DzFrameSetScale(udg_Frames[framesId], 0.80)
            set framesId=framesId + 1
        endif
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
    call DzFrameShow(DzFrameFindByName("ItemCellManas", 0), false)
    call SaveInteger(YDHT, 'I081', 0x437E2A40, 'I004')
    call SaveInteger(YDHT, 'I081', 0xD963A09F, 'I004')
    call SaveInteger(YDHT, 'I013', 0x437E2A40, 'I004')
    call SaveInteger(YDHT, 'I013', 0xD963A09F, 'I004')
    call SaveInteger(YDHT, 'I015', 0x437E2A40, 'I004')
    call SaveInteger(YDHT, 'I015', 0xD963A09F, 'I006')
    call SaveInteger(YDHT, 'I017', 0x437E2A40, 'I005')
    call SaveInteger(YDHT, 'I079', 0x437E2A40, 'I010')
    call SaveInteger(YDHT, 'I079', 0xD963A09F, 'I017')
    call SaveInteger(YDHT, 'I019', 0x437E2A40, 'I005')
    call SaveInteger(YDHT, 'I019', 0xD963A09F, 'I005')
    call SaveInteger(YDHT, 'I021', 0x437E2A40, 'I005')
    call SaveInteger(YDHT, 'I021', 0xD963A09F, 'I005')
    call SaveInteger(YDHT, 'I023', 0x437E2A40, 'I005')
    call SaveInteger(YDHT, 'I025', 0x437E2A40, 'I005')
    call SaveInteger(YDHT, 'I025', 0xD963A09F, 'I005')
    call SaveInteger(YDHT, 'I027', 0x437E2A40, 'I004')
    call SaveInteger(YDHT, 'I027', 0xD963A09F, 'I015')
    call SaveInteger(YDHT, 'I058', 0x437E2A40, 'I013')
    call SaveInteger(YDHT, 'I058', 0xD963A09F, 'I015')
    call SaveInteger(YDHT, 'I052', 0x437E2A40, 'I025')
    call SaveInteger(YDHT, 'I052', 0xD963A09F, 'I010')
    call SaveInteger(YDHT, 'I047', 0x437E2A40, 'I031')
    call SaveInteger(YDHT, 'I047', 0xD963A09F, 'I010')
    call SaveInteger(YDHT, 'I060', 0x437E2A40, 'I023')
    call SaveInteger(YDHT, 'I060', 0xD963A09F, 'I010')
    call SaveInteger(YDHT, 'I050', 0x437E2A40, 'I023')
    call SaveInteger(YDHT, 'I050', 0xD963A09F, 'I021')
    call SaveInteger(YDHT, 'I054', 0x437E2A40, 'I021')
    call SaveInteger(YDHT, 'I054', 0xD963A09F, 'I019')
    call SaveInteger(YDHT, 'I056', 0x437E2A40, 'I004')
    call SaveInteger(YDHT, 'I056', 0xD963A09F, 'I004')
    call SaveInteger(YDHT, 'I056', 0xCD1043F3, 'I015')
    call SaveInteger(YDHT, 'I045', 0x437E2A40, 'I023')
    call SaveInteger(YDHT, 'I045', 0xD963A09F, 'I033')
    call SaveInteger(YDHT, 'I045', 0xCD1043F3, 'I015')
    call SaveInteger(YDHT, 'I043', 0x437E2A40, 'I011')
    call SaveInteger(YDHT, 'I043', 0xD963A09F, 'I011')
    call SaveInteger(YDHT, 'I031', 0x437E2A40, 'I008')
    call SaveInteger(YDHT, 'I031', 0xD963A09F, 'I007')
    call SaveInteger(YDHT, 'I033', 0x437E2A40, 'I007')
    call SaveInteger(YDHT, 'I037', 0x437E2A40, 'I009')
    call SaveInteger(YDHT, 'I035', 0x437E2A40, 'I008')
    call SaveInteger(YDHT, 'I035', 0xD963A09F, 'I008')
    call SaveInteger(YDHT, 'I035', 0xCD1043F3, 'I009')
    call SaveInteger(YDHT, 'I039', 0x437E2A40, 'I008')
    call SaveInteger(YDHT, 'I039', 0xD963A09F, 'I008')
    call SaveInteger(YDHT, 'I041', 0x437E2A40, 'I007')
    call SaveInteger(YDHT, 'I041', 0xD963A09F, 'I009')
    call SaveInteger(YDHT, 'I064', 0x437E2A40, 'I028')
    call SaveInteger(YDHT, 'I064', 0xD963A09F, 'I033')
    call SaveInteger(YDHT, 'I066', 0x437E2A40, 'I031')
    call SaveInteger(YDHT, 'I066', 0xD963A09F, 'I029')
    call SaveInteger(YDHT, 'I069', 0x437E2A40, 'I028')
    call SaveInteger(YDHT, 'I069', 0xD963A09F, 'I028')
    call SaveInteger(YDHT, 'I071', 0x437E2A40, 'I039')
    call SaveInteger(YDHT, 'I071', 0xD963A09F, 'I035')
    call SaveInteger(YDHT, 'I071', 0xCD1043F3, 'I037')
    call SaveInteger(YDHT, 'I075', 0x437E2A40, 'I039')
    call SaveInteger(YDHT, 'I075', 0xD963A09F, 'I041')
    call SaveInteger(YDHT, 'I075', 0xCD1043F3, 'I037')
    call SaveInteger(YDHT, 'I073', 0x437E2A40, 'I009')
    call SaveInteger(YDHT, 'I073', 0xD963A09F, 'I028')
    call SaveInteger(YDHT, 'I073', 0xCD1043F3, 'I029')
    call SaveInteger(YDHT, 'I062', 0x437E2A40, 'I001')
    call SaveInteger(YDHT, 'I077', 0x437E2A40, 'I002')
    call SaveInteger(YDHT, 'I083', 0x437E2A40, 'I081')
    call SaveInteger(YDHT, 'I083', 0xD963A09F, 'I037')
    call SaveInteger(YDHT, 'I090', 0x437E2A40, 'I010')
    call SaveInteger(YDHT, 'I090', 0xD963A09F, 'I028')
    call SaveInteger(YDHT, 'I090', 0xCD1043F3, 'I013')
    call SaveInteger(YDHT, 'I085', 0x437E2A40, 'I007')
    call SaveInteger(YDHT, 'I085', 0xD963A09F, 'I021')
    call SaveInteger(YDHT, 'I085', 0xCD1043F3, 'I011')
    call SaveInteger(YDHT, 'I087', 0x437E2A40, 'I092')
    call SaveInteger(YDHT, 'I087', 0xD963A09F, 'I088')
endfunction
//===========================================================================
function InitTrig_InitItemCell takes nothing returns nothing
    set gg_trg_InitItemCell=CreateTrigger()
    call TriggerAddAction(gg_trg_InitItemCell, function Trig_InitItemCellActions)
endfunction
//===========================================================================
// Trigger: initButton
//===========================================================================
function Trig_initButtonFunc002003 takes nothing returns nothing
    call TriggerExecute(gg_trg_Trig0)
endfunction
function Trig_initButtonFunc004003 takes nothing returns nothing
    call TriggerExecute(gg_trg_Trig1)
endfunction
function Trig_initButtonFunc006003 takes nothing returns nothing
    call TriggerExecute(gg_trg_Trig2)
endfunction
function Trig_initButtonFunc008003 takes nothing returns nothing
    call TriggerExecute(gg_trg_Trig3)
endfunction
function Trig_initButtonFunc010003 takes nothing returns nothing
    call TriggerExecute(gg_trg_Trig4)
endfunction
function Trig_initButtonFunc012003 takes nothing returns nothing
    call TriggerExecute(gg_trg_Trig5)
endfunction
function Trig_initButtonFunc014003 takes nothing returns nothing
    call TriggerExecute(gg_trg_Trig6)
endfunction
function Trig_initButtonFunc016003 takes nothing returns nothing
    call TriggerExecute(gg_trg_Trig6)
endfunction
function Trig_initButtonFunc019003 takes nothing returns nothing
    call TriggerExecute(gg_trg_Trig7_1)
endfunction
function Trig_initButtonFunc020003 takes nothing returns nothing
    call TriggerExecute(gg_trg_Trig7_2)
endfunction
function Trig_initButtonFunc021003 takes nothing returns nothing
    call TriggerExecute(gg_trg_Trig7_3)
endfunction
function Trig_initButtonFunc025003 takes nothing returns nothing
    call TriggerExecute(gg_trg_Trig9)
endfunction
function Trig_initButtonActions takes nothing returns nothing
    // 商店按钮
    call DzFrameSetScriptByCode(DzFrameFindByName("AA", 0), 1, function Trig_initButtonFunc002003, true)
    // 物理攻击按钮
    call DzFrameSetScriptByCode(DzFrameFindByName("AA3", 0), 1, function Trig_initButtonFunc004003, true)
    // 攻速暴击按钮
    call DzFrameSetScriptByCode(DzFrameFindByName("AA4", 0), 1, function Trig_initButtonFunc006003, true)
    // 法术攻击按钮
    call DzFrameSetScriptByCode(DzFrameFindByName("AA5", 0), 1, function Trig_initButtonFunc008003, true)
    // 冷却缩减按钮
    call DzFrameSetScriptByCode(DzFrameFindByName("AA6", 0), 1, function Trig_initButtonFunc010003, true)
    // 法力回复按钮
    call DzFrameSetScriptByCode(DzFrameFindByName("AA7", 0), 1, function Trig_initButtonFunc012003, true)
    // 关闭按钮
    call DzFrameSetScriptByCode(DzFrameFindByName("ABB3", 0), 1, function Trig_initButtonFunc014003, true)
    // 关闭按钮2
    call DzFrameSetScriptByCode(DzFrameFindByName("CBB3", 0), 1, function Trig_initButtonFunc016003, true)
    // 英雄卡牌
    set udg_NCards[0]='IH30'
    set udg_NCards[1]='IH31'
    set udg_NCards[2]='IH32'
    set udg_NCards[3]='IH33'
    set udg_NCards[4]='IH34'
    set udg_NCards[5]='IH35'
    set udg_NCards[6]='IH36'
    set udg_NCards[7]='IH37'
    set udg_RCards[0]='IH38'
    set udg_RCards[1]='IH41'
    set udg_RCards[2]='IH42'
    set udg_RCards[3]='IH43'
    set udg_RCards[4]='IH44'
    set udg_SRCards[0]='IH02'
    set udg_SRCards[1]='IH03'
    set udg_SRCards[2]='IH04'
    set udg_SRCards[3]='IH06'
    set udg_SRCards[4]='IH07'
    set udg_SRCards[5]='IH12'
    set udg_SRCards[6]='IH16'
    set udg_SRCards[7]='IH19'
    set udg_SRCards[8]='IH21'
    set udg_SSRCards[0]='IH05'
    set udg_SSRCards[1]='IH10'
    set udg_SSRCards[2]='IH13'
    set udg_SSRCards[3]='IH17'
    call DzFrameSetScriptByCode(DzFrameFindByName("HeroCard", 0), 1, function Trig_initButtonFunc019003, true)
    call DzFrameSetScriptByCode(DzFrameFindByName("HeroCard1", 0), 1, function Trig_initButtonFunc020003, true)
    call DzFrameSetScriptByCode(DzFrameFindByName("HeroCard2", 0), 1, function Trig_initButtonFunc021003, true)
    // 出售按钮
    // 关闭卡片召唤界面
    call DzFrameSetScriptByCode(DzFrameFindByName("ABBLACK", 0), 1, function Trig_initButtonFunc025003, true)
endfunction
//===========================================================================
function InitTrig_initButton takes nothing returns nothing
    set gg_trg_initButton=CreateTrigger()
    call TriggerAddAction(gg_trg_initButton, function Trig_initButtonActions)
endfunction
//===========================================================================
// Trigger: BtnClick
//===========================================================================
function Trig_BtnClickActions takes nothing returns nothing
    local integer id= 0
    local unit selectedUnit
    local string newArt
    local integer goldcost= 0
    local integer item1= 0
    local integer item2= 0
    local integer item3= 0
    local integer filterIndex= - 1
    if ( ( ( DzGetTriggerKeyPlayer() != GetLocalPlayer() ) or ( udg_ui_isHEOpen[GetPlayerId(DzGetTriggerKeyPlayer())] == false ) or ( DzGetMouseFocus() == 0 ) ) ) then
        return
    else
    endif
    set id=(LoadInteger(YDHT, StringHash(("ItemCell" )), StringHash(( I2S(DzGetMouseFocus()))))) // INLINED!!
    set selectedUnit=udg_SelectedHeros[GetPlayerId(DzGetTriggerKeyPlayer())]
    if ( ( id == 0 ) ) then
        if ( ( ((DzGetMouseFocus())) == ((DzFrameFindByName("AB1", 0))) ) ) then // INLINED!!
            call DzFrameShow(udg_UI_ab[0], true)
            call DzFrameShow(udg_UI_ab[2], false)
            call DzFrameSetText(DzFrameFindByName("AA11", 0), "|cff00ffff装 备|r")
            call DzFrameSetText(DzFrameFindByName("AA22", 0), "|cFFFCC403英 雄|r")
        else
        endif
        if ( ( ((DzGetMouseFocus())) == ((DzFrameFindByName("AA2", 0))) ) ) then // INLINED!!
            call DzFrameSetText(DzFrameFindByName("AB22", 0), "|cff00ffff英 雄|r")
            call DzFrameSetText(DzFrameFindByName("AB11", 0), "|cFFFCC403装 备|r")
            call DzFrameShow(udg_UI_ab[2], true)
            call DzFrameShow(udg_UI_ab[0], false)
        else
        endif
        if ( ( ((DzGetMouseFocus())) == ((DzFrameFindByName("ABB2", 0))) ) ) then // INLINED!!
            set id=udg_SelectedItemId[GetPlayerId(DzGetTriggerKeyPlayer())]
            if ( ( id == 0 ) ) then
                call DisplayTextToPlayer(DzGetTriggerKeyPlayer(), 0, 0, "|cffff0000购买失败！|r")
                return
            else
            endif
            if ( ( selectedUnit == null ) ) then
                call DisplayTextToPlayer(DzGetTriggerKeyPlayer(), 0, 0, "|cffff0000请确认您当前选择的单位拥有道具栏！|r")
                return
            else
            endif
            if ( ( UnitInventoryCount(selectedUnit) >= 6 ) ) then
                call DisplayTextToPlayer(DzGetTriggerKeyPlayer(), 0, 0, "|cffff0000道具栏已满，购买失败！|r")
                return
            else
            endif
            set goldcost=S2I(( EXExecuteScript("(require'jass.slk').item[" + I2S(id) + "].goldcost") ))
            set item1=LoadInteger(YDHT, id, 0x437E2A40)
            set item2=LoadInteger(YDHT, id, 0xD963A09F)
            set item3=LoadInteger(YDHT, id, 0xCD1043F3)
            if ( ( item1 != 0 ) ) then
                call DzFrameShow(udg_Frames[0], true)
                call DzFrameSetText(udg_Frames[2], ( EXExecuteScript("(require'jass.slk').item[" + I2S(item1) + "].Name") ))
                set filterIndex=GetIndexOfItemType(selectedUnit , item1 , filterIndex)
                if ( ( filterIndex != - 1 ) ) then
                    set goldcost=goldcost - S2I(( EXExecuteScript("(require'jass.slk').item[" + I2S(item1) + "].goldcost") ))
                    set newArt=I2S(item1) + "newArt.blp"
                    call EXBlendButtonIcon("ui\\ItemSelected_red.blp", ( EXExecuteScript("(require'jass.slk').item[" + I2S(item1) + "].Art") ), newArt)
                    set item1=filterIndex + 1
                else
                    set newArt=( EXExecuteScript("(require'jass.slk').item[" + I2S(item1) + "].Art") )
                    set item1=0
                endif
                call DzFrameSetTexture(udg_Frames[1], newArt, 0)
            else
            endif
            if ( ( item2 != 0 ) ) then
                call DzFrameShow(udg_Frames[3], true)
                call DzFrameSetText(udg_Frames[5], ( EXExecuteScript("(require'jass.slk').item[" + I2S(item2) + "].Name") ))
                set filterIndex=GetIndexOfItemType(selectedUnit , item2 , filterIndex)
                if ( ( filterIndex != - 1 ) ) then
                    set goldcost=goldcost - S2I(( EXExecuteScript("(require'jass.slk').item[" + I2S(item2) + "].goldcost") ))
                    set newArt=I2S(item2) + "newArt.blp"
                    call EXBlendButtonIcon("ui\\ItemSelected_red.blp", ( EXExecuteScript("(require'jass.slk').item[" + I2S(item2) + "].Art") ), newArt)
                    set item2=filterIndex + 1
                else
                    set newArt=( EXExecuteScript("(require'jass.slk').item[" + I2S(item2) + "].Art") )
                    set item2=0
                endif
                call DzFrameSetTexture(udg_Frames[4], newArt, 0)
            else
            endif
            if ( ( item3 != 0 ) ) then
                call DzFrameShow(udg_Frames[6], true)
                call DzFrameSetText(udg_Frames[8], ( EXExecuteScript("(require'jass.slk').item[" + I2S(item3) + "].Name") ))
                set filterIndex=GetIndexOfItemType(selectedUnit , item3 , - 1)
                if ( ( filterIndex != - 1 ) ) then
                    set goldcost=goldcost - S2I(( EXExecuteScript("(require'jass.slk').item[" + I2S(item3) + "].goldcost") ))
                    set newArt=I2S(item3) + "newArt.blp"
                    call EXBlendButtonIcon("ui\\ItemSelected_red.blp", ( EXExecuteScript("(require'jass.slk').item[" + I2S(item3) + "].Art") ), newArt)
                    set item3=filterIndex + 1
                else
                    set newArt=( EXExecuteScript("(require'jass.slk').item[" + I2S(item3) + "].Art") )
                    set item3=0
                endif
                call DzFrameSetTexture(udg_Frames[7], newArt, 0)
            else
            endif
            if ( ( goldcost <= GetPlayerState(DzGetTriggerKeyPlayer(), PLAYER_STATE_RESOURCE_GOLD) ) ) then
                call DisplayTextToPlayer(DzGetTriggerKeyPlayer(), 0, 0, "|cFFFFFF00购买道具成功！|r")
                call DzSyncData("BuyItem", I2S(id) + "," + I2S(item1) + "," + I2S(item2) + "," + I2S(item3) + "," + I2S(goldcost))
            else
                call DisplayTextToPlayer(DzGetTriggerKeyPlayer(), 0, 0, "|cffff0000金币不足，购买失败！|r")
            endif
        else
        endif
        if ( ( ((DzGetMouseFocus())) == ((DzFrameFindByName("ABB1", 0))) ) ) then // INLINED!!
            set id=udg_SellItemId[GetPlayerId(DzGetTriggerKeyPlayer())]
            if ( ( id == 0 ) ) then
                call DisplayTextToPlayer(DzGetTriggerKeyPlayer(), 0, 0, "|cffff0000出售失败！|r")
                return
            else
            endif
            if ( ( selectedUnit == null ) ) then
                call DisplayTextToPlayer(DzGetTriggerKeyPlayer(), 0, 0, "|cffff0000请确认您当前选择的单位拥有道具栏！|r")
                return
            else
            endif
            call DisplayTextToPlayer(DzGetTriggerKeyPlayer(), 0, 0, "|cFFFFFF00出售道具成功！|r")
            call DzSyncData("SellItem", I2S(id))
        else
        endif
        return
    else
    endif
    call DzFrameShow(udg_Frames[0], false)
    call DzFrameShow(udg_Frames[3], false)
    call DzFrameShow(udg_Frames[6], false)
    if ( ( SubString(I2S(id), 0, 5) == "12278" ) ) then
        call DzFrameSetText(DzFrameFindByName("ABBB2", 0), "|cfff5fcb9购买|r")
        set udg_SelectedItemId[GetPlayerId(DzGetTriggerKeyPlayer())]=id
        set udg_SellItemId[GetPlayerId(DzGetTriggerKeyPlayer())]=id
    else
        call DzFrameSetText(DzFrameFindByName("ABBB2", 0), "|cFFFF0000不可购买|r")
        set udg_SelectedItemId[GetPlayerId(DzGetTriggerKeyPlayer())]=0
        set udg_SellItemId[GetPlayerId(DzGetTriggerKeyPlayer())]=0
    endif
    call DzFrameShow(DzFrameFindByName("HCUP", 0), true)
    call DzFrameSetTexture(DzFrameFindByName("HCUP", 0), ( EXExecuteScript("(require'jass.slk').item[" + I2S(id) + "].Art") ), 0)
    call DzFrameShow(DzFrameFindByName("HCCUP", 0), true)
    call DzFrameSetTexture(DzFrameFindByName("HCCUP", 0), ( EXExecuteScript("(require'jass.slk').item[" + I2S(id) + "].Art") ), 0)
    call DzFrameSetText(DzFrameFindByName("HC1A1", 0), "")
    call DzFrameSetText(DzFrameFindByName("HC1A2", 0), "")
    call DzFrameSetText(DzFrameFindByName("HC1A3", 0), "")
    call DzFrameSetText(DzFrameFindByName("HCA1", 0), ( EXExecuteScript("(require'jass.slk').item[" + I2S(id) + "].Name") ))
    call DzFrameSetText(DzFrameFindByName("HC2A1", 0), ( ( "|cfff5fcb9" ) + ( ( EXExecuteScript("(require'jass.slk').item[" + I2S(id) + "].Name") ) ) + ( "|r" ) ))
    call DzFrameSetText(DzFrameFindByName("HC2A3", 0), ( EXExecuteScript("(require'jass.slk').item[" + I2S(id) + "].Description") ))
    set goldcost=S2I(( EXExecuteScript("(require'jass.slk').item[" + I2S(id) + "].goldcost") ))
    set item1=LoadInteger(YDHT, id, 0x437E2A40)
    set item2=LoadInteger(YDHT, id, 0xD963A09F)
    set item3=LoadInteger(YDHT, id, 0xCD1043F3)
    if ( ( item1 != 0 ) ) then
        set filterIndex=GetIndexOfItemType(selectedUnit , item1 , filterIndex)
        if ( ( filterIndex != - 1 ) ) then
            set goldcost=goldcost - S2I(( EXExecuteScript("(require'jass.slk').item[" + I2S(item1) + "].goldcost") ))
            set newArt=I2S(item1) + "newArt.blp"
            call EXBlendButtonIcon("ui\\ItemSelected_red.blp", ( EXExecuteScript("(require'jass.slk').item[" + I2S(item1) + "].Art") ), newArt)
        else
            set newArt=( EXExecuteScript("(require'jass.slk').item[" + I2S(item1) + "].Art") )
        endif
        call DzFrameShow(udg_Frames[0], true)
        call SaveInteger(YDHT, StringHash(("ItemCell" )), StringHash(( I2S(udg_Frames[0]) )), ( item1)) // INLINED!!
        call DzFrameSetTexture(udg_Frames[1], newArt, 0)
        call DzFrameSetText(udg_Frames[2], ( EXExecuteScript("(require'jass.slk').item[" + I2S(item1) + "].Name") ))
    else
    endif
    if ( ( item2 != 0 ) ) then
        set filterIndex=GetIndexOfItemType(selectedUnit , item2 , filterIndex)
        if ( ( filterIndex != - 1 ) ) then
            set goldcost=goldcost - S2I(( EXExecuteScript("(require'jass.slk').item[" + I2S(item2) + "].goldcost") ))
            set newArt=I2S(item2) + "newArt.blp"
            call EXBlendButtonIcon("ui\\ItemSelected_red.blp", ( EXExecuteScript("(require'jass.slk').item[" + I2S(item2) + "].Art") ), newArt)
        else
            set newArt=( EXExecuteScript("(require'jass.slk').item[" + I2S(item2) + "].Art") )
        endif
        call DzFrameShow(udg_Frames[3], true)
        call SaveInteger(YDHT, StringHash(("ItemCell" )), StringHash(( I2S(udg_Frames[3]) )), ( item2)) // INLINED!!
        call DzFrameSetTexture(udg_Frames[4], newArt, 0)
        call DzFrameSetText(udg_Frames[5], ( EXExecuteScript("(require'jass.slk').item[" + I2S(item2) + "].Name") ))
    else
    endif
    if ( ( item3 != 0 ) ) then
        if ( ( YDWEUnitHasItemOfTypeBJNull(selectedUnit , item3) == true ) ) then
            set goldcost=goldcost - S2I(( EXExecuteScript("(require'jass.slk').item[" + I2S(item3) + "].goldcost") ))
            set newArt=I2S(item3) + "newArt.blp"
            call EXBlendButtonIcon("ui\\ItemSelected_red.blp", ( EXExecuteScript("(require'jass.slk').item[" + I2S(item3) + "].Art") ), newArt)
        else
            set newArt=( EXExecuteScript("(require'jass.slk').item[" + I2S(item3) + "].Art") )
        endif
        call DzFrameShow(udg_Frames[6], true)
        call SaveInteger(YDHT, StringHash(("ItemCell" )), StringHash(( I2S(udg_Frames[6]) )), ( item3)) // INLINED!!
        call DzFrameSetTexture(udg_Frames[7], newArt, 0)
        call DzFrameSetText(udg_Frames[8], ( EXExecuteScript("(require'jass.slk').item[" + I2S(item3) + "].Name") ))
    else
    endif
    call DzFrameSetText(DzFrameFindByName("HC2A2", 0), "|cfff5fcb9" + I2S(goldcost) + "|r")
endfunction
//===========================================================================
function InitTrig_BtnClick takes nothing returns nothing
    set gg_trg_BtnClick=CreateTrigger()
    call DzTriggerRegisterMouseEventTrg(gg_trg_BtnClick , 1 , 1)
    call TriggerAddAction(gg_trg_BtnClick, function Trig_BtnClickActions)
endfunction
//===========================================================================
// Trigger: Trig0
//
//     set udg_Frames[framesId]=DzFrameFindByName("ItemCellAds", 0)
//     call DzFrameShow(udg_Frames[framesId], false)
//     set udg_Frames[framesId]=DzFrameFindByName("ItemCellAps", 0)
//     call DzFrameShow(udg_Frames[framesId], false)
//     set udg_Frames[framesId]=DzFrameFindByName("ItemCellCrits", 0)
//     call DzFrameShow(udg_Frames[framesId], false)
//     set udg_Frames[framesId]=DzFrameFindByName("ItemCellCooldowns", 0)
//     call DzFrameShow(udg_Frames[framesId], false)
//     set udg_Frames[framesId]=DzFrameFindByName("ItemCellManas", 0)
//     call DzFrameShow(udg_Frames[framesId], false)
//===========================================================================
function Trig_Trig0Actions takes nothing returns nothing
    if ( ( udg_ui_isHEOpen[GetPlayerId(DzGetTriggerUIEventPlayer())] == false ) ) then
        set udg_ui_isHEOpen[GetPlayerId(DzGetTriggerUIEventPlayer())]=true
        call RefreshItemCell(DzGetTriggerUIEventPlayer())
        if ( ( DzGetTriggerUIEventPlayer() == GetLocalPlayer() ) ) then
            call DzFrameShow(udg_UI_ab[0], true)
        else
        endif
    else
        set udg_ui_isHEOpen[GetPlayerId(DzGetTriggerUIEventPlayer())]=false
        if ( ( DzGetTriggerUIEventPlayer() == GetLocalPlayer() ) ) then
            call DzFrameShow(udg_UI_ab[0], false)
            call DzFrameShow(udg_UI_ab[2], false)
        else
        endif
    endif
endfunction
//===========================================================================
function InitTrig_Trig0 takes nothing returns nothing
    set gg_trg_Trig0=CreateTrigger()
    call TriggerAddAction(gg_trg_Trig0, function Trig_Trig0Actions)
endfunction
//===========================================================================
// Trigger: Trig1
//===========================================================================
function Trig_Trig1Actions takes nothing returns nothing
    if ( ( DzGetTriggerUIEventPlayer() == GetLocalPlayer() ) ) then
        call DzFrameSetText(DzFrameFindByName("AA33", 0), "|cff00ffff物理|r|n|cff00ffff攻击|r")
        call DzFrameSetText(DzFrameFindByName("AA44", 0), "|cFFFCC403攻速|r|n|cFFFCC403暴击|r")
        call DzFrameSetText(DzFrameFindByName("AA55", 0), "|cFFFCC403法术|r|n|cFFFCC403攻击|r")
        call DzFrameSetText(DzFrameFindByName("AA66", 0), "|cFFFCC403冷却|r|n|cFFFCC403缩减|r")
        call DzFrameSetText(DzFrameFindByName("AA77", 0), "|cFFFCC403法力|r|n|cFFFCC403回复|r")
        call DzFrameShow(DzFrameFindByName("ItemCellAds", 0), true)
        call DzFrameShow(DzFrameFindByName("ItemCellAps", 0), false)
        call DzFrameShow(DzFrameFindByName("ItemCellCrits", 0), false)
        call DzFrameShow(DzFrameFindByName("ItemCellCooldowns", 0), false)
        call DzFrameShow(DzFrameFindByName("ItemCellManas", 0), false)
    else
    endif
endfunction
//===========================================================================
function InitTrig_Trig1 takes nothing returns nothing
    set gg_trg_Trig1=CreateTrigger()
    call TriggerAddAction(gg_trg_Trig1, function Trig_Trig1Actions)
endfunction
//===========================================================================
// Trigger: Trig2
//===========================================================================
function Trig_Trig2Actions takes nothing returns nothing
    if ( ( DzGetTriggerUIEventPlayer() == GetLocalPlayer() ) ) then
        call DzFrameSetText(DzFrameFindByName("AA33", 0), "|cFFFCC403物理|r|n|cFFFCC403攻击|r")
        call DzFrameSetText(DzFrameFindByName("AA44", 0), "|cff00ffff攻速|r|n|cff00ffff暴击|r")
        call DzFrameSetText(DzFrameFindByName("AA55", 0), "|cFFFCC403法术|r|n|cFFFCC403攻击|r")
        call DzFrameSetText(DzFrameFindByName("AA66", 0), "|cFFFCC403冷却|r|n|cFFFCC403缩减|r")
        call DzFrameSetText(DzFrameFindByName("AA77", 0), "|cFFFCC403法力|r|n|cFFFCC403回复|r")
        call DzFrameShow(DzFrameFindByName("ItemCellAds", 0), false)
        call DzFrameShow(DzFrameFindByName("ItemCellAps", 0), false)
        call DzFrameShow(DzFrameFindByName("ItemCellCrits", 0), true)
        call DzFrameShow(DzFrameFindByName("ItemCellCooldowns", 0), false)
        call DzFrameShow(DzFrameFindByName("ItemCellManas", 0), false)
    else
    endif
endfunction
//===========================================================================
function InitTrig_Trig2 takes nothing returns nothing
    set gg_trg_Trig2=CreateTrigger()
    call TriggerAddAction(gg_trg_Trig2, function Trig_Trig2Actions)
endfunction
//===========================================================================
// Trigger: Trig3
//===========================================================================
function Trig_Trig3Actions takes nothing returns nothing
    if ( ( DzGetTriggerUIEventPlayer() == GetLocalPlayer() ) ) then
        call DzFrameSetText(DzFrameFindByName("AA33", 0), "|cFFFCC403物理|r|n|cFFFCC403攻击|r")
        call DzFrameSetText(DzFrameFindByName("AA44", 0), "|cFFFCC403攻速|r|n|cFFFCC403暴击|r")
        call DzFrameSetText(DzFrameFindByName("AA55", 0), "|cff00ffff法术|r|n|cff00ffff攻击|r")
        call DzFrameSetText(DzFrameFindByName("AA66", 0), "|cFFFCC403冷却|r|n|cFFFCC403缩减|r")
        call DzFrameSetText(DzFrameFindByName("AA77", 0), "|cFFFCC403法力|r|n|cFFFCC403回复|r")
        call DzFrameShow(DzFrameFindByName("ItemCellAds", 0), false)
        call DzFrameShow(DzFrameFindByName("ItemCellAps", 0), true)
        call DzFrameShow(DzFrameFindByName("ItemCellCrits", 0), false)
        call DzFrameShow(DzFrameFindByName("ItemCellCooldowns", 0), false)
        call DzFrameShow(DzFrameFindByName("ItemCellManas", 0), false)
    else
    endif
endfunction
//===========================================================================
function InitTrig_Trig3 takes nothing returns nothing
    set gg_trg_Trig3=CreateTrigger()
    call TriggerAddAction(gg_trg_Trig3, function Trig_Trig3Actions)
endfunction
//===========================================================================
// Trigger: Trig4
//===========================================================================
function Trig_Trig4Actions takes nothing returns nothing
    if ( ( DzGetTriggerUIEventPlayer() == GetLocalPlayer() ) ) then
        call DzFrameSetText(DzFrameFindByName("AA33", 0), "|cFFFCC403物理|r|n|cFFFCC403攻击|r")
        call DzFrameSetText(DzFrameFindByName("AA44", 0), "|cFFFCC403攻速|r|n|cFFFCC403暴击|r")
        call DzFrameSetText(DzFrameFindByName("AA55", 0), "|cFFFCC403法术|r|n|cFFFCC403攻击|r")
        call DzFrameSetText(DzFrameFindByName("AA66", 0), "|cff00ffff冷却|r|n|cff00ffff缩减|r")
        call DzFrameSetText(DzFrameFindByName("AA77", 0), "|cFFFCC403法力|r|n|cFFFCC403回复|r")
        call DzFrameShow(DzFrameFindByName("ItemCellAds", 0), false)
        call DzFrameShow(DzFrameFindByName("ItemCellAps", 0), false)
        call DzFrameShow(DzFrameFindByName("ItemCellCrits", 0), false)
        call DzFrameShow(DzFrameFindByName("ItemCellCooldowns", 0), true)
        call DzFrameShow(DzFrameFindByName("ItemCellManas", 0), false)
    else
    endif
endfunction
//===========================================================================
function InitTrig_Trig4 takes nothing returns nothing
    set gg_trg_Trig4=CreateTrigger()
    call TriggerAddAction(gg_trg_Trig4, function Trig_Trig4Actions)
endfunction
//===========================================================================
// Trigger: Trig5
//===========================================================================
function Trig_Trig5Actions takes nothing returns nothing
    if ( ( DzGetTriggerUIEventPlayer() == GetLocalPlayer() ) ) then
        call DzFrameSetText(DzFrameFindByName("AA33", 0), "|cFFFCC403物理|r|n|cFFFCC403攻击|r")
        call DzFrameSetText(DzFrameFindByName("AA44", 0), "|cFFFCC403攻速|r|n|cFFFCC403暴击|r")
        call DzFrameSetText(DzFrameFindByName("AA55", 0), "|cFFFCC403法术|r|n|cFFFCC403攻击|r")
        call DzFrameSetText(DzFrameFindByName("AA66", 0), "|cFFFCC403冷却|r|n|cFFFCC403缩减|r")
        call DzFrameSetText(DzFrameFindByName("AA77", 0), "|cff00ffff法力|r|n|cff00ffff回复|r")
        call DzFrameShow(DzFrameFindByName("ItemCellAds", 0), false)
        call DzFrameShow(DzFrameFindByName("ItemCellAps", 0), false)
        call DzFrameShow(DzFrameFindByName("ItemCellCrits", 0), false)
        call DzFrameShow(DzFrameFindByName("ItemCellCooldowns", 0), false)
        call DzFrameShow(DzFrameFindByName("ItemCellManas", 0), true)
    else
    endif
endfunction
//===========================================================================
function InitTrig_Trig5 takes nothing returns nothing
    set gg_trg_Trig5=CreateTrigger()
    call TriggerAddAction(gg_trg_Trig5, function Trig_Trig5Actions)
endfunction
//===========================================================================
// Trigger: Trig6
//===========================================================================
function Trig_Trig6Actions takes nothing returns nothing
    if ( ( udg_ui_isHEOpen[GetPlayerId(DzGetTriggerUIEventPlayer())] == true ) ) then
        set udg_ui_isHEOpen[GetPlayerId(DzGetTriggerUIEventPlayer())]=false
        if ( ( DzGetTriggerUIEventPlayer() == GetLocalPlayer() ) ) then
            call DzFrameShow(udg_UI_ab[0], false)
            call DzFrameShow(udg_UI_ab[2], false)
        else
        endif
    else
    endif
endfunction
//===========================================================================
function InitTrig_Trig6 takes nothing returns nothing
    set gg_trg_Trig6=CreateTrigger()
    call TriggerAddAction(gg_trg_Trig6, function Trig_Trig6Actions)
endfunction
//===========================================================================
// Trigger: Trig7_1
//
// 随机数不能异步处理 只能在同步环境处理
//===========================================================================
function Trig_Trig7_1Actions takes nothing returns nothing
    local unit selectedUnit=udg_SelectedHeros[GetPlayerId(DzGetTriggerUIEventPlayer())]
    local integer random= GetRandomInt(1, 10)
    local integer card= 0
    if ( ( GetPlayerState(DzGetTriggerUIEventPlayer(), PLAYER_STATE_RESOURCE_GOLD) < 1000 ) ) then
        call DisplayTextToPlayer(DzGetTriggerUIEventPlayer(), 0, 0, "|cffff0000金币不足，卡片召唤失败！|r")
        return
    else
    endif
    if ( ( selectedUnit == null ) ) then
        call DisplayTextToPlayer(DzGetTriggerUIEventPlayer(), 0, 0, "|cffff0000请确认您当前选择的单位拥有道具栏！|r")
        return
    else
    endif
    if ( ( random <= 2 ) ) then
        set card=udg_NCards[GetRandomInt(0, 7)]
    else
        if ( ( ( random > 2 ) and ( random <= 9 ) ) ) then
            set card=udg_RCards[GetRandomInt(0, 4)]
        else
            set card=udg_SRCards[GetRandomInt(0, 8)]
        endif
    endif
    if ( ( DzGetTriggerUIEventPlayer() == GetLocalPlayer() ) ) then
        call SetHeroSkillIcon(card , 1000)
    else
    endif
endfunction
//===========================================================================
function InitTrig_Trig7_1 takes nothing returns nothing
    set gg_trg_Trig7_1=CreateTrigger()
    call TriggerAddAction(gg_trg_Trig7_1, function Trig_Trig7_1Actions)
endfunction
//===========================================================================
// Trigger: Trig7_2
//===========================================================================
function Trig_Trig7_2Actions takes nothing returns nothing
    local unit selectedUnit=udg_SelectedHeros[GetPlayerId(DzGetTriggerUIEventPlayer())]
    local integer random= GetRandomInt(1, 10)
    local integer card= 0
    if ( ( GetPlayerState(DzGetTriggerUIEventPlayer(), PLAYER_STATE_RESOURCE_GOLD) < 3000 ) ) then
        call DisplayTextToPlayer(DzGetTriggerUIEventPlayer(), 0, 0, "|cffff0000金币不足，卡片召唤失败！|r")
        return
    else
    endif
    if ( ( selectedUnit == null ) ) then
        call DisplayTextToPlayer(DzGetTriggerUIEventPlayer(), 0, 0, "|cffff0000请确认您当前选择的单位拥有道具栏！|r")
        return
    else
    endif
    if ( ( random <= 2 ) ) then
        set card=udg_RCards[GetRandomInt(0, 4)]
    else
        if ( ( ( random > 2 ) and ( random <= 9 ) ) ) then
            set card=udg_SRCards[GetRandomInt(0, 8)]
        else
            set card=udg_SSRCards[GetRandomInt(0, 3)]
        endif
    endif
    if ( ( DzGetTriggerUIEventPlayer() == GetLocalPlayer() ) ) then
        call SetHeroSkillIcon(card , 3000)
    else
    endif
endfunction
//===========================================================================
function InitTrig_Trig7_2 takes nothing returns nothing
    set gg_trg_Trig7_2=CreateTrigger()
    call TriggerAddAction(gg_trg_Trig7_2, function Trig_Trig7_2Actions)
endfunction
//===========================================================================
// Trigger: Trig7_3
//===========================================================================
function Trig_Trig7_3Actions takes nothing returns nothing
    local unit selectedUnit=udg_SelectedHeros[GetPlayerId(DzGetTriggerUIEventPlayer())]
    local integer random= GetRandomInt(1, 10)
    local integer card= 0
    if ( ( GetPlayerState(DzGetTriggerUIEventPlayer(), PLAYER_STATE_RESOURCE_GOLD) < 5000 ) ) then
        call DisplayTextToPlayer(DzGetTriggerUIEventPlayer(), 0, 0, "|cffff0000金币不足，卡片召唤失败！|r")
        return
    else
    endif
    if ( ( selectedUnit == null ) ) then
        call DisplayTextToPlayer(DzGetTriggerUIEventPlayer(), 0, 0, "|cffff0000请确认您当前选择的单位拥有道具栏！|r")
        return
    else
    endif
    if ( ( random <= 2 ) ) then
        set card=udg_SRCards[GetRandomInt(0, 8)]
    else
        set card=udg_SSRCards[GetRandomInt(0, 3)]
    endif
    if ( ( DzGetTriggerUIEventPlayer() == GetLocalPlayer() ) ) then
        call SetHeroSkillIcon(card , 5000)
    else
    endif
endfunction
//===========================================================================
function InitTrig_Trig7_3 takes nothing returns nothing
    set gg_trg_Trig7_3=CreateTrigger()
    call TriggerAddAction(gg_trg_Trig7_3, function Trig_Trig7_3Actions)
endfunction
//===========================================================================
// Trigger: Trig9
//===========================================================================
function Trig_Trig9Actions takes nothing returns nothing
    if ( ( DzGetTriggerUIEventPlayer() == GetLocalPlayer() ) ) then
        call DzFrameShow(DzFrameFindByName("BAG3", 0), false)
        call DzFrameShow(DzFrameFindByName("ABBLACK", 0), false)
    else
    endif
endfunction
//===========================================================================
function InitTrig_Trig9 takes nothing returns nothing
    set gg_trg_Trig9=CreateTrigger()
    call TriggerAddAction(gg_trg_Trig9, function Trig_Trig9Actions)
endfunction
//===========================================================================
// Trigger: ESC
//===========================================================================
function Trig_ESCActions takes nothing returns nothing
    if ( ( udg_ui_isHEOpen[GetPlayerId(GetTriggerPlayer())] == true ) ) then
        set udg_ui_isHEOpen[GetPlayerId(GetTriggerPlayer())]=false
        if ( ( GetTriggerPlayer() == GetLocalPlayer() ) ) then
            call DzFrameShow(udg_UI_ab[0], false)
            call DzFrameShow(udg_UI_ab[2], false)
        else
        endif
    else
    endif
endfunction
//===========================================================================
function InitTrig_ESC takes nothing returns nothing
    set gg_trg_ESC=CreateTrigger()

        call TriggerRegisterPlayerEventEndCinematic(gg_trg_ESC, Player(0))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_ESC, Player(1))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_ESC, Player(2))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_ESC, Player(3))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_ESC, Player(4))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_ESC, Player(5))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_ESC, Player(6))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_ESC, Player(7))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_ESC, Player(8))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_ESC, Player(9))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_ESC, Player(10))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_ESC, Player(11))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_ESC, Player(12))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_ESC, Player(13))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_ESC, Player(14))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_ESC, Player(15))
    call TriggerAddAction(gg_trg_ESC, function Trig_ESCActions)
endfunction
//===========================================================================
// Trigger: P
//===========================================================================
function Trig_PActions takes nothing returns nothing
    if ( ( udg_ui_isHEOpen[GetPlayerId(DzGetTriggerKeyPlayer())] == false ) ) then
        set udg_ui_isHEOpen[GetPlayerId(DzGetTriggerKeyPlayer())]=true
        call RefreshItemCell(DzGetTriggerKeyPlayer())
        if ( ( DzGetTriggerKeyPlayer() == GetLocalPlayer() ) ) then
            call DzFrameShow(udg_UI_ab[0], true)
        else
        endif
    else
        set udg_ui_isHEOpen[GetPlayerId(DzGetTriggerKeyPlayer())]=false
        if ( ( DzGetTriggerKeyPlayer() == GetLocalPlayer() ) ) then
            call DzFrameShow(udg_UI_ab[0], false)
            call DzFrameShow(udg_UI_ab[2], false)
        else
        endif
    endif
endfunction
//===========================================================================
function InitTrig_P takes nothing returns nothing
    set gg_trg_P=CreateTrigger()
    call DzTriggerRegisterKeyEventTrg(gg_trg_P , 1 , 'P')
    call TriggerAddAction(gg_trg_P, function Trig_PActions)
endfunction
//===========================================================================
// Trigger: GetItem
//===========================================================================
function Trig_GetItemConditions takes nothing returns boolean
    return ( ( GetItemTypeId(GetManipulatedItem()) == 'jf06' ) )
endfunction
function Trig_GetItemActions takes nothing returns nothing
    local string gui= DzAPI_Map_GetGuildName(GetOwningPlayer(GetManipulatingUnit()))
    if ( ( ( gui == "小黄鸡1号" ) or ( gui == "小黄鸡2号" ) or ( gui == "小黄鸡3号" ) or ( gui == "小黄鸡4号" ) or ( gui == "小黄鸡5号" ) or ( gui == "小黄鸡6号" ) or ( gui == "小黄鸡7号" ) or ( gui == "小黄鸡8号" ) or ( gui == "小黄鸡9号" ) or ( gui == "小黄鸡10号" ) or ( gui == "小黄鸡军团1号" ) or ( gui == "小黄鸡军团2号" ) or ( gui == "小黄鸡军团3号" ) or ( gui == "小黄鸡军团4号" ) or ( gui == "小黄鸡军团5号" ) ) ) then
        call SetPlayerStateBJ(GetOwningPlayer(GetManipulatingUnit()), PLAYER_STATE_RESOURCE_LUMBER, ( ( GetPlayerState(GetOwningPlayer(GetManipulatingUnit()), PLAYER_STATE_RESOURCE_LUMBER) ) + ( 1 ) ))
        call UnitAddItemByIdSwapped('IB01', GetManipulatingUnit())
        call DisplayTextToPlayer(GetOwningPlayer(GetManipulatingUnit()), 0, 0, "领取成功!")
    else
        call DisplayTextToPlayer(GetOwningPlayer(GetManipulatingUnit()), 0, 0, "|cffff0000领取失败,未加入小黄鸡公会,请加入小黄鸡1~10号或小黄鸡军团1~5号公会.|r")
    endif
endfunction
//===========================================================================
function InitTrig_GetItem takes nothing returns nothing
    set gg_trg_GetItem=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_GetItem, EVENT_PLAYER_UNIT_PICKUP_ITEM)
    call TriggerAddCondition(gg_trg_GetItem, Condition(function Trig_GetItemConditions))
    call TriggerAddAction(gg_trg_GetItem, function Trig_GetItemActions)
endfunction
//===========================================================================
// Trigger: DropItem
//===========================================================================
function Trig_DropItemConditions takes nothing returns boolean
    return ( ( GetManipulatingUnit() == udg_SelectedHeros[GetPlayerId(GetTriggerPlayer())] ) )
endfunction
function Trig_DropItemActions takes nothing returns nothing
    if ( ( udg_ui_isHEOpen[GetPlayerId(GetTriggerPlayer())] == true ) ) then
        set udg_ui_isHEOpen[GetPlayerId(GetTriggerPlayer())]=false
        if ( ( GetTriggerPlayer() == GetLocalPlayer() ) ) then
            call DzFrameShow(udg_UI_ab[0], false)
            call DzFrameShow(udg_UI_ab[2], false)
        else
        endif
    else
    endif
endfunction
//===========================================================================
function InitTrig_DropItem takes nothing returns nothing
    set gg_trg_DropItem=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_DropItem, EVENT_PLAYER_UNIT_DROP_ITEM)
    call TriggerAddCondition(gg_trg_DropItem, Condition(function Trig_DropItemConditions))
    call TriggerAddAction(gg_trg_DropItem, function Trig_DropItemActions)
endfunction
//===========================================================================
// Trigger: Fram60Action
//===========================================================================
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
    
    set selectedUnit=udg_SelectedHeros[GetPlayerId(DzGetTriggerUIEventPlayer())]
    set id=udg_SelectedItemId[GetPlayerId(DzGetTriggerUIEventPlayer())]
    if id != 0 then
        call DzSyncData("SellItem", I2S(id))
        set udg_SelectedItemId[GetPlayerId(DzGetTriggerUIEventPlayer())]=0
    endif
endfunction
//===========================================================================
function InitTrig_Fram60Action takes nothing returns nothing
    set gg_trg_Fram60Action=CreateTrigger()
    call TriggerAddAction(gg_trg_Fram60Action, function Trig_Fram60ActionActions)
endfunction
//===========================================================================
// Trigger: SelectedHero
//
// udg_ui_isHEOpen[GetPlayerId(DzGetTriggerUIEventPlayer())] == false 
//===========================================================================
function Trig_SelectedHeroActions takes nothing returns nothing
    if ( ( GetUnitAbilityLevel(GetTriggerUnit(), 'AInv') > 0 ) and ( IsUnitOwnedByPlayer(GetTriggerUnit(), GetTriggerPlayer()) == true ) ) then
        set udg_SelectedHeros[GetPlayerId(GetTriggerPlayer())]=GetTriggerUnit()
    else
        set udg_SelectedHeros[GetPlayerId(GetTriggerPlayer())]=null
    endif
    if ( ( udg_ui_isHEOpen[GetPlayerId(GetTriggerPlayer())] == true ) ) then
        call RefreshItemCell(GetTriggerPlayer())
    else
    endif
endfunction
//===========================================================================
function InitTrig_SelectedHero takes nothing returns nothing
    set gg_trg_SelectedHero=CreateTrigger()
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_SelectedHero, Player(0), true)
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_SelectedHero, Player(1), true)
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_SelectedHero, Player(2), true)
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_SelectedHero, Player(3), true)
    call TriggerAddAction(gg_trg_SelectedHero, function Trig_SelectedHeroActions)
endfunction
//===========================================================================
// Trigger: BuyItem
//
// 
//     local unit selectedUnit = udg_SelectedHeros[GetPlayerId(DzGetTriggerSyncPlayer())]
//     call RemoveItem(UnitItemInSlot(selectedUnit, S2I(DzGetTriggerSyncData())))
//===========================================================================
function Trig_BuyItemActions takes nothing returns nothing
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6F96F2D2, S2I(SubString(DzGetTriggerSyncData(), 0, 10)))
    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE7A3603E, S2I(SubString(DzGetTriggerSyncData(), 11, 12)))
    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x019ECA7A, S2I(SubString(DzGetTriggerSyncData(), 13, 14)))
    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB1AA3700, S2I(SubString(DzGetTriggerSyncData(), 15, 16)))
    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x183A9461, S2I(SubString(DzGetTriggerSyncData(), 17, StringLength(DzGetTriggerSyncData()))))
    if ( ( GetPlayerState(DzGetTriggerSyncPlayer(), PLAYER_STATE_RESOURCE_GOLD) < LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x183A9461) ) ) then
        call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
        return
    else
    endif
    call SetPlayerStateBJ(DzGetTriggerSyncPlayer(), PLAYER_STATE_RESOURCE_GOLD, ( ( GetPlayerState(DzGetTriggerSyncPlayer(), PLAYER_STATE_RESOURCE_GOLD) ) - ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x183A9461) ) ))
    call DisableTrigger(gg_trg_DropItem)
    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xBEC6909A, 0)
    if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE7A3603E) > 0 ) ) then
        call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xBEC6909A, GetItemCharges(UnitItemInSlotBJ(udg_SelectedHeros[GetPlayerId(DzGetTriggerSyncPlayer())], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE7A3603E))))
        call RemoveItem(UnitItemInSlotBJ(udg_SelectedHeros[GetPlayerId(DzGetTriggerSyncPlayer())], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE7A3603E)))
    else
    endif
    if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x019ECA7A) > 0 ) ) then
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xBEC6909A) == 0 ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xBEC6909A, GetItemCharges(UnitItemInSlotBJ(udg_SelectedHeros[GetPlayerId(DzGetTriggerSyncPlayer())], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x019ECA7A))))
        else
        endif
        call RemoveItem(UnitItemInSlotBJ(udg_SelectedHeros[GetPlayerId(DzGetTriggerSyncPlayer())], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x019ECA7A)))
    else
    endif
    if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB1AA3700) > 0 ) ) then
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xBEC6909A) == 0 ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xBEC6909A, GetItemCharges(UnitItemInSlotBJ(udg_SelectedHeros[GetPlayerId(DzGetTriggerSyncPlayer())], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB1AA3700))))
        else
        endif
        call RemoveItem(UnitItemInSlotBJ(udg_SelectedHeros[GetPlayerId(DzGetTriggerSyncPlayer())], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB1AA3700)))
    else
    endif
    call UnitAddItemByIdSwapped(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6F96F2D2), udg_SelectedHeros[GetPlayerId(DzGetTriggerSyncPlayer())])
    if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xBEC6909A) != 0 ) ) then
        call SetItemCharges(GetLastCreatedItem(), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xBEC6909A))
    else
    endif
    call EnableTrigger(gg_trg_DropItem)
    call RefreshItemCell(DzGetTriggerSyncPlayer())
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_BuyItem takes nothing returns nothing
    set gg_trg_BuyItem=CreateTrigger()
    call DzTriggerRegisterSyncData(gg_trg_BuyItem, "BuyItem", false)
    call TriggerAddAction(gg_trg_BuyItem, function Trig_BuyItemActions)
endfunction
//===========================================================================
// Trigger: SellItem
//
//     local unit selectedUnit = udg_SelectedHeros[GetPlayerId(DzGetTriggerSyncPlayer())]
//     local item it = GetItemOfTypeFromUnitBJ(selectedUnit ,S2I(DzGetTriggerSyncData()))
//     local integer id = GetItemTypeId(it)
//     local integer goldcost = YDWEGetObjectPropertyInteger(YDWE_OBJECT_TYPE_ITEM, id , "goldcost")
//     call SetPlayerState(DzGetTriggerSyncPlayer(), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(DzGetTriggerSyncPlayer(), PLAYER_STATE_RESOURCE_GOLD) + R2I(goldcost*0.5))
//     call DisableTrigger(gg_trg_DropItem)
//     call RemoveItem(it)
//     call EnableTrigger(gg_trg_DropItem)
//     call RefreshItemCell(DzGetTriggerSyncPlayer())
//===========================================================================
function Trig_SellItemActions takes nothing returns nothing
    local unit selectedUnit= udg_SelectedHeros[GetPlayerId(DzGetTriggerSyncPlayer())]
    local item it= YDWEGetItemOfTypeFromUnitBJNull(selectedUnit , S2I(DzGetTriggerSyncData()))
    local integer id= GetItemTypeId(it)
    local integer goldcost= S2I(EXExecuteScript("(require'jass.slk').item[" + I2S(id) + "].goldcost"))
    call SetPlayerStateBJ(DzGetTriggerSyncPlayer(), PLAYER_STATE_RESOURCE_GOLD, ( ( GetPlayerState(DzGetTriggerSyncPlayer(), PLAYER_STATE_RESOURCE_GOLD) ) + ( R2I(goldcost * 0.5) ) ))
    call DisableTrigger(gg_trg_DropItem)
    call RemoveItem(it)
    call EnableTrigger(gg_trg_DropItem)
    set udg_SellItemId[GetPlayerId(DzGetTriggerSyncPlayer())]=0
    call RefreshItemCell(DzGetTriggerSyncPlayer())
endfunction
//===========================================================================
function InitTrig_SellItem takes nothing returns nothing
    set gg_trg_SellItem=CreateTrigger()
    call DzTriggerRegisterSyncData(gg_trg_SellItem, "SellItem", false)
    call TriggerAddAction(gg_trg_SellItem, function Trig_SellItemActions)
endfunction
//===========================================================================
// Trigger: jf001
//===========================================================================
function Trig_jf001Actions takes nothing returns nothing
    set bj_forLoopAIndex=1
    set bj_forLoopAIndexEnd=4
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( ( GetPlayerController(ConvertedPlayer(bj_forLoopAIndex)) == MAP_CONTROL_USER ) and ( GetPlayerSlotState(ConvertedPlayer(bj_forLoopAIndex)) == PLAYER_SLOT_STATE_PLAYING ) ) then
            call SaveStr(udg_table, bj_forLoopAIndex, 200, (DzAPI_Map_GetServerValue((ConvertedPlayer(bj_forLoopAIndex) ), "S" + ( "Score")))) // INLINED!!
            call SaveStr(udg_table, bj_forLoopAIndex, 201, (DzAPI_Map_GetServerValue((ConvertedPlayer(bj_forLoopAIndex) ), "S" + ( "VIP")))) // INLINED!!
            call SaveStr(udg_table, bj_forLoopAIndex, 301, (DzAPI_Map_GetServerValue((ConvertedPlayer(bj_forLoopAIndex) ), "S" + ( "gh01")))) // INLINED!!
            call SaveStr(udg_table, bj_forLoopAIndex, 302, (DzAPI_Map_GetServerValue((ConvertedPlayer(bj_forLoopAIndex) ), "S" + ( "gh02")))) // INLINED!!
            call SaveStr(udg_table, bj_forLoopAIndex, 401, (DzAPI_Map_GetServerValue((ConvertedPlayer(bj_forLoopAIndex) ), "S" + ( "cb01")))) // INLINED!!
            call SaveStr(udg_table, bj_forLoopAIndex, 402, (DzAPI_Map_GetServerValue((ConvertedPlayer(bj_forLoopAIndex) ), "S" + ( "cb02")))) // INLINED!!
            call SaveStr(udg_table, bj_forLoopAIndex, 501, (DzAPI_Map_GetServerValue((ConvertedPlayer(bj_forLoopAIndex) ), "S" + ( "pf01")))) // INLINED!!
        else
        endif
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
endfunction
//===========================================================================
function InitTrig_jf001 takes nothing returns nothing
    set gg_trg_jf001=CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg_jf001, 0.00)
    call TriggerAddAction(gg_trg_jf001, function Trig_jf001Actions)
endfunction
//===========================================================================
// Trigger: jf002
//===========================================================================
function Trig_jf002Actions takes nothing returns nothing
    set bj_forLoopAIndex=1
    set bj_forLoopAIndexEnd=4
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( ( GetPlayerController(ConvertedPlayer(bj_forLoopAIndex)) == MAP_CONTROL_USER ) and ( GetPlayerSlotState(ConvertedPlayer(bj_forLoopAIndex)) == PLAYER_SLOT_STATE_PLAYING ) ) then
            call DzAPI_Map_StoreString(ConvertedPlayer(bj_forLoopAIndex) , "Score" , LoadStr(udg_table, bj_forLoopAIndex, 200))
        else
        endif
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
endfunction
//===========================================================================
function InitTrig_jf002 takes nothing returns nothing
    set gg_trg_jf002=CreateTrigger()
    call TriggerRegisterTimerExpireEvent(gg_trg_jf002, udg_jfTimer)
    call TriggerAddAction(gg_trg_jf002, function Trig_jf002Actions)
endfunction
//===========================================================================
// Trigger: ghTimer
//===========================================================================
function Trig_ghTimerActions takes nothing returns nothing
    set bj_forLoopAIndex=1
    set bj_forLoopAIndexEnd=4
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( ( GetPlayerController(ConvertedPlayer(bj_forLoopAIndex)) == MAP_CONTROL_USER ) and ( GetPlayerSlotState(ConvertedPlayer(bj_forLoopAIndex)) == PLAYER_SLOT_STATE_PLAYING ) ) then
            call DzAPI_Map_StoreString(ConvertedPlayer(bj_forLoopAIndex) , "gh01" , LoadStr(udg_table, bj_forLoopAIndex, 301))
            call DzAPI_Map_StoreString(ConvertedPlayer(bj_forLoopAIndex) , "gh02" , LoadStr(udg_table, bj_forLoopAIndex, 302))
        else
        endif
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
endfunction
//===========================================================================
function InitTrig_ghTimer takes nothing returns nothing
    set gg_trg_ghTimer=CreateTrigger()
    call TriggerRegisterTimerExpireEvent(gg_trg_ghTimer, udg_ghTimer)
    call TriggerAddAction(gg_trg_ghTimer, function Trig_ghTimerActions)
endfunction
//===========================================================================
// Trigger: cbTimer
//===========================================================================
function Trig_cbTimerActions takes nothing returns nothing
    set bj_forLoopAIndex=1
    set bj_forLoopAIndexEnd=4
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( ( GetPlayerController(ConvertedPlayer(bj_forLoopAIndex)) == MAP_CONTROL_USER ) and ( GetPlayerSlotState(ConvertedPlayer(bj_forLoopAIndex)) == PLAYER_SLOT_STATE_PLAYING ) ) then
            call DzAPI_Map_StoreString(ConvertedPlayer(bj_forLoopAIndex) , "cb01" , LoadStr(udg_table, bj_forLoopAIndex, 401))
            call DzAPI_Map_StoreString(ConvertedPlayer(bj_forLoopAIndex) , "cb02" , LoadStr(udg_table, bj_forLoopAIndex, 402))
        else
        endif
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
endfunction
//===========================================================================
function InitTrig_cbTimer takes nothing returns nothing
    set gg_trg_cbTimer=CreateTrigger()
    call TriggerRegisterTimerExpireEvent(gg_trg_cbTimer, udg_cbTimer)
    call TriggerAddAction(gg_trg_cbTimer, function Trig_cbTimerActions)
endfunction
//===========================================================================
// Trigger: pfTimer
//===========================================================================
function Trig_pfTimerActions takes nothing returns nothing
    set bj_forLoopAIndex=1
    set bj_forLoopAIndexEnd=4
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( ( GetPlayerController(ConvertedPlayer(bj_forLoopAIndex)) == MAP_CONTROL_USER ) and ( GetPlayerSlotState(ConvertedPlayer(bj_forLoopAIndex)) == PLAYER_SLOT_STATE_PLAYING ) ) then
            call DzAPI_Map_StoreString(ConvertedPlayer(bj_forLoopAIndex) , "pf01" , LoadStr(udg_table, bj_forLoopAIndex, 501))
        else
        endif
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
endfunction
//===========================================================================
function InitTrig_pfTimer takes nothing returns nothing
    set gg_trg_pfTimer=CreateTrigger()
    call TriggerRegisterTimerExpireEvent(gg_trg_pfTimer, udg_pfTimer)
    call TriggerAddAction(gg_trg_pfTimer, function Trig_pfTimerActions)
endfunction
//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig______________________u()
    call InitTrig_InitItemCell()
    call InitTrig_initButton()
    call InitTrig_BtnClick()
    call InitTrig_Trig0()
    call InitTrig_Trig1()
    call InitTrig_Trig2()
    call InitTrig_Trig3()
    call InitTrig_Trig4()
    call InitTrig_Trig5()
    call InitTrig_Trig6()
    call InitTrig_Trig7_1()
    call InitTrig_Trig7_2()
    call InitTrig_Trig7_3()
    call InitTrig_Trig9()
    call InitTrig_ESC()
    call InitTrig_P()
    call InitTrig_GetItem()
    call InitTrig_DropItem()
    call InitTrig_Fram60Action()
    call InitTrig_SelectedHero()
    call InitTrig_BuyItem()
    call InitTrig_SellItem()
    call InitTrig_jf001()
    call InitTrig_jf002()
    call InitTrig_ghTimer()
    call InitTrig_cbTimer()
    call InitTrig_pfTimer()
endfunction
//===========================================================================
function RunInitializationTriggers takes nothing returns nothing
    call ConditionalTriggerExecute(gg_trg______________________u)
endfunction
//***************************************************************************
//*
//*  Players
//*
//***************************************************************************
function InitCustomPlayerSlots takes nothing returns nothing
    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call ForcePlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(0), true)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)
    // Player 1
    call SetPlayerStartLocation(Player(1), 1)
    call ForcePlayerStartLocation(Player(1), 1)
    call SetPlayerColor(Player(1), ConvertPlayerColor(1))
    call SetPlayerRacePreference(Player(1), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(1), true)
    call SetPlayerController(Player(1), MAP_CONTROL_USER)
    // Player 2
    call SetPlayerStartLocation(Player(2), 2)
    call ForcePlayerStartLocation(Player(2), 2)
    call SetPlayerColor(Player(2), ConvertPlayerColor(2))
    call SetPlayerRacePreference(Player(2), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(2), true)
    call SetPlayerController(Player(2), MAP_CONTROL_USER)
    // Player 3
    call SetPlayerStartLocation(Player(3), 3)
    call ForcePlayerStartLocation(Player(3), 3)
    call SetPlayerColor(Player(3), ConvertPlayerColor(3))
    call SetPlayerRacePreference(Player(3), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(3), true)
    call SetPlayerController(Player(3), MAP_CONTROL_USER)
    // Player 8
    call SetPlayerStartLocation(Player(8), 4)
    call SetPlayerColor(Player(8), ConvertPlayerColor(11))
    call SetPlayerRacePreference(Player(8), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(8), false)
    call SetPlayerController(Player(8), MAP_CONTROL_CREEP)
    // Player 9
    call SetPlayerStartLocation(Player(9), 5)
    call SetPlayerColor(Player(9), ConvertPlayerColor(11))
    call SetPlayerRacePreference(Player(9), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(9), false)
    call SetPlayerController(Player(9), MAP_CONTROL_CREEP)
    // Player 10
    call SetPlayerStartLocation(Player(10), 6)
    call SetPlayerColor(Player(10), ConvertPlayerColor(11))
    call SetPlayerRacePreference(Player(10), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(10), false)
    call SetPlayerController(Player(10), MAP_CONTROL_CREEP)
    // Player 11
    call SetPlayerStartLocation(Player(11), 7)
    call SetPlayerColor(Player(11), ConvertPlayerColor(11))
    call SetPlayerRacePreference(Player(11), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(11), true)
    call SetPlayerController(Player(11), MAP_CONTROL_COMPUTER)
endfunction
function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_022
    call SetPlayerTeam(Player(0), 0)
    call SetPlayerState(Player(0), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(1), 0)
    call SetPlayerState(Player(1), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(2), 0)
    call SetPlayerState(Player(2), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(3), 0)
    call SetPlayerState(Player(3), PLAYER_STATE_ALLIED_VICTORY, 1)
    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)
    // Force: TRIGSTR_023
    call SetPlayerTeam(Player(8), 1)
    call SetPlayerState(Player(8), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(9), 1)
    call SetPlayerState(Player(9), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(10), 1)
    call SetPlayerState(Player(10), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(11), 1)
    call SetPlayerState(Player(11), PLAYER_STATE_ALLIED_VICTORY, 1)
    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(10), true)
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(10), true)
endfunction
function InitAllyPriorities takes nothing returns nothing
    call SetStartLocPrioCount(0, 3)
    call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 1, 2, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(0, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(1, 3)
    call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 2, 3, MAP_LOC_PRIO_LOW)
    call SetStartLocPrioCount(2, 3)
    call SetStartLocPrio(2, 0, 0, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(2, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(3, 3)
    call SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 1, 1, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(3, 2, 2, MAP_LOC_PRIO_HIGH)
endfunction
//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================
function main takes nothing returns nothing
    local weathereffect we
    call SetCameraBounds(- 7552.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 7552.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 7552.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 7552.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 7552.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 7552.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 7552.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 7552.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCAshenvale\\DNCAshenvaleTerrain\\DNCAshenvaleTerrain.mdl", "Environment\\DNC\\DNCAshenvale\\DNCAshenvaleUnit\\DNCAshenvaleUnit.mdl")
    call SetTerrainFogEx(0, 1200.0, 7000.0, 0.500, 0.784, 0.471, 0.314)
    set we=AddWeatherEffect(Rect(- 8192.0, - 8192.0, 8192.0, 8192.0), 'RLlr')
    call EnableWeatherEffect(we, true)
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("LordaeronSummerDay")
    call SetAmbientNightSound("LordaeronSummerNight")
    call SetMapMusic("Music", true, 0)
    call CreateRegions()
    call CreateAllUnits()
    call InitBlizzard()

call ExecuteFunc("YDTriggerSaveLoadSystem___Init")
call ExecuteFunc("InitializeYD")

    call InitGlobals()
    call InitCustomTriggers()
    call ConditionalTriggerExecute(gg_trg______________________u) // INLINED!!
endfunction
//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************
function config takes nothing returns nothing
    call SetMapName("撸圈TD内测版1.10")
    call SetMapDescription("没有说明")
    call SetPlayers(8)
    call SetTeams(8)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
    call DefineStartLocation(0, - 3072.0, 1600.0)
    call DefineStartLocation(1, 1600.0, 2944.0)
    call DefineStartLocation(2, 3008.0, - 1664.0)
    call DefineStartLocation(3, - 1600.0, - 2944.0)
    call DefineStartLocation(4, 0.0, 128.0)
    call DefineStartLocation(5, 0.0, 128.0)
    call DefineStartLocation(6, 0.0, 128.0)
    call DefineStartLocation(7, 0.0, 128.0)
    // Player setup
    call InitCustomPlayerSlots()
    call InitCustomTeams()
    call InitAllyPriorities()
endfunction




//Struct method generated initializers/callers:

