//TESH.scrollpos=203
//TESH.alwaysfold=0
<?
 local slk = require 'slk' 

function GetId(strName)
    local i = string.byte(strName, 1)
    i = i * 256 + string.byte(strName, 2)
    i = i * 256 + string.byte(strName, 3)
    i = i * 256 + string.byte(strName, 4)
    return i
end

--合成列表
local ItemComs = {
    [GetId("I013")] = {GetId("I004"), GetId("I004")}, --反曲之弓:短剑+短剑
    [GetId("I015")] = {GetId("I004"), GetId("I006")}, --狂热黄叉:短剑+格斗手套
    [GetId("I017")] = {GetId("I005")}, --轻语:长剑
    [GetId("I019")] = {GetId("I005"), GetId("I005")}, --锯齿短匕:长剑+长剑
    [GetId("I021")] = {GetId("I005"), GetId("I005")}, --考尔菲德的战锤:长剑+长剑
    [GetId("I023")] = {GetId("I005")}, --小木槌:长剑
    [GetId("I025")] = {GetId("I005"), GetId("I005")}, --提亚马特:长剑+长剑
    [GetId("I027")] = {GetId("I015"), GetId("I004")}, --电刀:狂热黄叉+短剑
    [GetId("I031")] = {GetId("I007"), GetId("I008")}, --女神之泪:蓝水晶+仙女护符
    [GetId("I033")] = {GetId("I007")}, --耀光:蓝水晶
    [GetId("I035")] = {GetId("I009"), GetId("I008"), GetId("I008")}, --和谐圣杯:增幅典籍+仙女护符+仙女护符
    [GetId("I037")] = {GetId("I009")}, --恶魔法典:增幅典籍
    [GetId("I039")] = {GetId("I008"), GetId("I008")}, --禁忌雕像:仙女护符+仙女护符
    [GetId("I041")] = {GetId("I009"), GetId("I007")}, --遗失的章节:增幅典籍+蓝水晶
    [GetId("I043")] = {GetId("I011"), GetId("I011")}, --无尽之刃:暴风大剑+暴风大剑
    [GetId("I045")] = {GetId("I023"), GetId("I033"), GetId("I015")}, --三相之力:小木槌+耀光+狂热黄叉
    [GetId("I047")] = {GetId("I031"), GetId("I010")}, --魔宗:女神之泪+十字镐
    [GetId("I050")] = {GetId("I023"), GetId("I021")}, --黑切:小木槌+考尔菲德的战锤
    [GetId("I052")] = {GetId("I025"), GetId("I010")}, --九头蛇:提亚马特+十字镐
    [GetId("I054")] = {GetId("I021"), GetId("I019")}, --幕刃:考尔菲德的战锤+锯齿短匕
    [GetId("I056")] = {GetId("I015"), GetId("I004"), GetId("I004")}, --幻影之舞:狂热黄叉+短剑+短剑
    [GetId("I058")] = {GetId("I015"), GetId("I013")}, --飓风:狂热黄叉+反曲之弓
    [GetId("I060")] = {GetId("I023"), GetId("I010")}, --大冰锤:小木槌+十字镐
    [GetId("I064")] = {GetId("I033"), GetId("I028")}, --巫妖之祸:耀光+爆裂魔杖
    [GetId("I066")] = {GetId("I031"), GetId("I029")}, --大天使:女神之泪+无用大棒
    [GetId("I069")] = {GetId("I009"), GetId("I028")}, --法穿棒:增幅典籍+爆裂魔杖
    [GetId("I071")] = {GetId("I035"), GetId("I037"), GetId("I039")}, --大圣杯:和谐圣杯+恶魔法典+禁忌雕像
    [GetId("I073")] = {GetId("I029"), GetId("I028"), GetId("I009")}, --帽子:无用大棒+爆裂魔杖+增幅典籍
    [GetId("I075")] = {GetId("I037"), GetId("I041"), GetId("I039")}, --莫雷洛秘典:恶魔法典+遗失的章节+禁忌雕像
    [GetId("I062")] = {GetId("I001")}, --杀人剑:多兰剑+杀人剑（卷轴）
    [GetId("I077")] = {GetId("I002")} --杀人书:多兰戒+杀人书（卷轴）
}


--升级列表
local ItemUps = {
    [GetId("I001")] = {GetId("I062")},
    [GetId("I002")] = {GetId("I077")},
    [GetId("I004")] = {GetId("I013"), GetId("I015"), GetId("I027"), GetId("I056")},
    [GetId("I005")] = {GetId("I019"), GetId("I021"), GetId("I023"), GetId("I025")},
    [GetId("I006")] = {GetId("I015")},
    [GetId("I007")] = {GetId("I031"), GetId("I033"), GetId("I041")},
    [GetId("I008")] = {GetId("I031"), GetId("I035"), GetId("I039")},
    [GetId("I009")] = {GetId("I035"), GetId("I037"), GetId("I041"), GetId("I073")},
    [GetId("I010")] = {GetId("I017"), GetId("I047"), GetId("I052"), GetId("I060")},
    [GetId("I011")] = {GetId("I043")},
    [GetId("I013")] = {GetId("I058")},
    [GetId("I015")] = {GetId("I027"),GetId("I045"), GetId("I056"), GetId("I058")},
    [GetId("I019")] = {GetId("I054")},
    [GetId("I021")] = {GetId("I050"), GetId("I054")},
    [GetId("I023")] = {GetId("I045"), GetId("I050"), GetId("I060")},
    [GetId("I025")] = {GetId("I052")},
    [GetId("I028")] = {GetId("I064"), GetId("I069"), GetId("I073")},
    [GetId("I029")] = {GetId("I066"), GetId("I073")},
    [GetId("I031")] = {GetId("I047"), GetId("I066")},
    [GetId("I033")] = {GetId("I045"), GetId("I064")},
    [GetId("I035")] = {GetId("I071")},
    [GetId("I037")] = {GetId("I071"), GetId("I075")},
    [GetId("I039")] = {GetId("I071"), GetId("I075")}
}

local ItemAds = {
	GetId("I001"), GetId("I003"), GetId("I005"), GetId("I010"),GetId("I011"), 
    GetId("I017"), GetId("I019"), GetId("I021"), GetId("I023"),GetId("I025"), 
    GetId("I043"), GetId("I045"), GetId("I047"), GetId("I050"),GetId("I052"), 
    GetId("I054"),GetId("I060"), GetId("I062") 
    --, GetId("I079"), GetId("I085")
}
local ItemCrits = {
    GetId("I001"), GetId("I004"), GetId("I006"), GetId("I013"),GetId("I015"), 
    GetId("I027"),GetId("I043"), GetId("I045"),GetId("I056"),GetId("I058")
    --, GetId("I081"), GetId("I083")
}
local ItemAps = {
    GetId("I002"), GetId("I009"), GetId("I028"),GetId("I029"),GetId("I035"), 
    GetId("I037"), GetId("I041"),GetId("I064"),GetId("I066"), GetId("I069"), 
    GetId("I071"),GetId("I073"),GetId("I075"), GetId("I077") 
    --, GetId("I083")
}
local ItemCooldowns = {
    GetId("I021"), GetId("I033"), GetId("I037"), GetId("I039"),GetId("I045"), 
    GetId("I050"), GetId("I054"), GetId("I064"),GetId("I071")
    --, GetId("I081"), GetId("I083")
}
local ItemManas = {
    GetId("I002"), GetId("I007"), GetId("I008"), GetId("I031"),GetId("I033"), 
    GetId("I035"), GetId("I039"), GetId("I041"),GetId("I045"), GetId("I047"), 
    GetId("I048"), GetId("I064"),GetId("I066"), GetId("I071"), GetId("I075") 
    --, GetId("I085")
}

--物品id对应的英雄技能表
local HeroSkills = {
    [GetId("IH30")] = {GetId("AU00"), 0, 0},
    [GetId("IH31")] = {GetId("AU01"), 0, 0},
    [GetId("IH32")] = {GetId("AU03"), 0, 0},
    [GetId("IH33")] = {GetId("AU04"), 0, 0},
    [GetId("IH34")] = {GetId("AU05"), 0, 0},
    [GetId("IH35")] = {GetId("AU07"), 0, 0},
    [GetId("IH36")] = {GetId("AU08"), 0, 0},
    [GetId("IH37")] = {GetId("AU09"), 0, 0},
    [GetId("IH38")] = {GetId("AH80"), GetId("AH81"), 0},
    [GetId("IH41")] = {GetId("AH82"), GetId("AH83"), 0},
    [GetId("IH42")] = {GetId("AH84"), GetId("AH85"), 0},
    [GetId("IH43")] = {GetId("AH86"), GetId("AH87"), 0},
    [GetId("IH44")] = {GetId("AH88"), GetId("AH89"), 0},
    [GetId("IH02")] = {GetId("AH05"), GetId("AH08"), GetId("AH07")},
    [GetId("IH03")] = {GetId("AH09"), GetId("AH06"), GetId("AH10")},
    [GetId("IH04")] = {GetId("AH11"), GetId("AH12"), GetId("AH13")},
    [GetId("IH06")] = {GetId("AH17"), GetId("AH18"), GetId("AH19")},
    [GetId("IH07")] = {GetId("AH20"), GetId("AH21"), GetId("AH22")},
    [GetId("IH12")] = {GetId("AH42"), GetId("AH43"), GetId("AH44")},
    [GetId("IH17")] = {GetId("AH63"), GetId("AH64"), GetId("AH65")},
    [GetId("IH19")] = {GetId("AH23"), GetId("AH24"), GetId("AH25")},
    [GetId("IH21")] = {GetId("AH60"), GetId("AH61"), GetId("AH62")},
    [GetId("IH05")] = {GetId("AH14"), GetId("AH15"), GetId("AH16")},
    [GetId("IH10")] = {GetId("AH34"), GetId("AH36"), GetId("AH37")},
    [GetId("IH13")] = {GetId("AH45"), GetId("AH46"), GetId("AH47")},
    [GetId("IH16")] = {GetId("AH51"), GetId("AH52"), GetId("AH53")}
}
?>

native EXBlendButtonIcon takes string a, string b, string c returns boolean

//异步处理
function SetHeroSkillIcon takes integer id ,integer goldcost returns nothing
    call DzFrameSetText( DzFrameFindByName("ZTTEXT", 0), YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id, "Name") )
    call DzFrameSetTexture( DzFrameFindByName("ZTTouX1UP", 0), YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id, "Art"), 0 )
    call DzFrameSetAlpha( DzFrameFindByName("ABBLACK", 0), 188 )
    call DzFrameShow( DzFrameFindByName("ABBLACK", 0), true )
    call DzFrameShow( DzFrameFindByName("BAG3", 0), true )
    call DzFrameShow( DzFrameFindByName("ZTJIN1UP", 0), false )
    call DzFrameShow( DzFrameFindByName("ZTJIN2UP", 0), false )
    
    call DzSyncData("AddItem", I2S(id) )
    call DzSyncData("BuyItem", I2S(goldcost) )
    <?for k,v in pairs(HeroSkills) do?> 
        if (id  == <?=k?>)then
            call DzFrameSetTexture( DzFrameFindByName("ZTJINUP", 0), YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ABILITY, <?=v[1]?>, "Art"), 0 )
            if(<?=v[2]?> !=0)then
                call DzFrameSetTexture( DzFrameFindByName("ZTJIN1UP", 0), YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ABILITY, <?=v[2]?>, "Art"), 0 )
                call DzFrameShow( DzFrameFindByName("ZTJIN1UP", 0), true )
            endif
            if(<?=v[3]?> !=0)then
                call DzFrameSetTexture( DzFrameFindByName("ZTJIN2UP", 0), YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ABILITY, <?=v[3]?>, "Art"), 0 )
                call DzFrameShow( DzFrameFindByName("ZTJIN2UP", 0), true )
            endif
        endif
    <?end?> 
endfunction

function ClearUI takes nothing returns nothing
    //隐藏所有界面
    call DzFrameShow(udg_Frames[0], false)  
    call DzFrameShow(udg_Frames[3], false) 
    call DzFrameShow(udg_Frames[6], false) 
    <?for i = 0, 5 do?>
         set udg_CellHasItem[<?=i?>] = false
    <?end?>
endfunction

//异步处理
function BtnSelect takes nothing returns nothing
    local integer index = 0
    local integer itemIndex = 0
    local integer goldcost = 0
    local string newArt
    local unit selectedUnit = udg_SelectedHeros[GetPlayerId(DzGetTriggerUIEventPlayer())]
    local integer id = YDWEGetIntegerByString("ItemCell", I2S(DzGetTriggerUIEventFrame()))
    local boolean hasItem
    local item it
    
    call ClearUI()
    
 //   call DzSyncData( "SelectedItem", I2S(id) )
    
    set udg_SelectedItemId[GetPlayerId(DzGetTriggerUIEventPlayer())] = id 
    
    call DzFrameShow(DzFrameFindByName("HCUP", 0), true)
    call DzFrameShow(DzFrameFindByName("HCCUP", 0), true)
    call DzFrameSetTexture( DzFrameFindByName("HCUP", 0), YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id, "Art"), 0 )
    call DzFrameSetTexture( DzFrameFindByName("HCCUP", 0), YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id, "Art"), 0 )
    call DzFrameSetText( DzFrameFindByName("HCA1", 0), "|cfff5fcb9"+YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id, "goldcost")+"|r" )
    call DzFrameSetText( DzFrameFindByName("HC1A1", 0), "" )
    call DzFrameSetText( DzFrameFindByName("HC1A2", 0), "" )
    call DzFrameSetText( DzFrameFindByName("HC1A3", 0), "" )
    call DzFrameSetText( DzFrameFindByName("HC2A1", 0), YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id, "Name") )
    call DzFrameSetText( DzFrameFindByName("HC2A2", 0), "|cfff5fcb9"+YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id, "goldcost")+"|r" )
    call DzFrameSetText( DzFrameFindByName("HC2A3", 0), YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id, "Description") )
   // call DzFrameSetText( DzFrameFindByName("HC2A4", 0), "+ 500法强" )
   // call DzFrameSetText( DzFrameFindByName("HC2A5", 0), "+ 500智力" )
    //合成列表
    set goldcost = S2I(YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id, "goldcost"))
    
    <?for k,v in pairs(ItemComs) do?> 
        if (id  == <?=k?>)then
            <?for k2, v2 in pairs(v) do ?> 
                set hasItem = false
                set bj_forLoopAIndex = itemIndex
                loop
                    exitwhen bj_forLoopAIndex > 5
                    set it = UnitItemInSlot(selectedUnit, bj_forLoopAIndex)
                    if it !=null and  GetItemTypeId(it)==<?=v2?>  then
                        set hasItem = true
                      //  set udg_CellHasItem[bj_forLoopAIndex] = true 
                        set goldcost = goldcost - S2I(YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=v2?>, "goldcost"))
                        call DzFrameSetText(DzFrameFindByName("HC2A2", 0),"|cfff5fcb9"+I2S(goldcost)+"|r" )

                       // set udg_SellItems[udg_SellCount] = it
                     //  set udg_SellItems[bj_forLoopAIndex] = it
                        set udg_SellCount = udg_SellCount+1
                        set itemIndex = bj_forLoopAIndex + 1
                        set bj_forLoopAIndex = 5
                    endif
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop       
                if hasItem == true then
                    set newArt = I2S(<?=v2?>)+"newArt.blp"
                    call EXBlendButtonIcon("ui\\ItemSelected_red.blp",YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM,<?=v2?>, "Art"), newArt)
                else
                    set newArt = YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM,<?=v2?>, "Art")
                endif
           //     call YDWESaveIntegerByString( "ItemCell", I2S(udg_Frames[index]), <?=v2?> )       
           //     call DzFrameSetScript(udg_Frames[index], 1, "BtnSelect", false)
                call DzFrameShow(udg_Frames[index], true)  
                set index = index+1
                call DzFrameSetTexture(udg_Frames[index], newArt, 0)  
                set index = index+1
                call DzFrameSetText(udg_Frames[index], YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=v2?>, "Name") )
                set index = index+1
              //  call DzFrameSetScript(udg_Frames[index], 2, "BtnTipsOn" , false )
              //  call DzFrameSetScript(udg_Frames[index], 3, "BtnTipsOff", false)       
            <?end?>
        endif
    <?end?>
endfunction

function InitItemAds takes nothing returns nothing
    local integer framesId=100
    local string  str=""
    
    <?for i = 1, 25 do?>
        <?if i>#ItemAds then?>
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
        <?else?>
            //按钮
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 4
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                if GetLocalPlayer() == ConvertedPlayer(bj_forLoopAIndex) then
                    call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect", false)
                endif
            
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
    
            //      call DzFrameSetScript(udg_Frames[framesId], 2, "BtnTipsOn" , false )
            //      call DzFrameSetScript(udg_Frames[framesId], 3, "BtnTipsOff", false)
            call YDWESaveIntegerByString( "ItemCell", I2S(udg_Frames[framesId]), <?=ItemAds[i]?> )
            call DzFrameShow(udg_Frames[framesId], true)
            //图片
            set framesId=framesId+1
            set str =  YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=ItemAds[i]?>, "Art")
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetTexture(udg_Frames[framesId], str, 0)
            call DzFrameShow(udg_Frames[framesId], true)
            //名字
            set framesId=framesId+1
            set str =  YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=ItemAds[i]?>, "Name")
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText( udg_Frames[framesId], str )
            call DzFrameSetScale(udg_Frames[framesId], 0.8)
            call DzFrameShow(udg_Frames[framesId], true)
            //  call DzFrameSetText( udg_Frames[framesId], "|cfff5fcb9" + str + "|r" )
            //价格
            set framesId=framesId+1
            set str =  YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=ItemAds[i]?>, "goldcost")
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText( udg_Frames[framesId], "|cfff5fcb9" + str + "|r" )
            call DzFrameSetScale(udg_Frames[framesId], 0.8)
            call DzFrameShow(udg_Frames[framesId], true)
            set framesId=framesId+1
       <?end?>
    <?end?>
endfunction


function InitItemAps takes nothing returns nothing
    local integer framesId=200
    local string  str=""
    
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellAds", 0)
    call DzFrameShow(udg_Frames[framesId], false)
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellAps", 0)
    call DzFrameShow(udg_Frames[framesId], true)
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellCrits", 0)
    call DzFrameShow(udg_Frames[framesId], false)
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellCooldowns", 0)
    call DzFrameShow(udg_Frames[framesId], false)
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellManas", 0)
    call DzFrameShow(udg_Frames[framesId], false)
    
    <?for i = 1, 25 do?>
     <?if i>#ItemAps then?>
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
       <?else?>
            //按钮
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 4
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                if GetLocalPlayer() == ConvertedPlayer(bj_forLoopAIndex) then
                    call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect", false)
                endif
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            
            //      call DzFrameSetScript(udg_Frames[framesId], 2, "BtnTipsOn" , false )
            //      call DzFrameSetScript(udg_Frames[framesId], 3, "BtnTipsOff", false)
            call YDWESaveIntegerByString( "ItemCell", I2S(udg_Frames[framesId]), <?=ItemAps[i]?> )
            call DzFrameShow(udg_Frames[framesId], true)
            //图片
            set framesId=framesId+1
            set str =  YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=ItemAps[i]?>, "Art")
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetTexture(udg_Frames[framesId], str, 0)
            call DzFrameShow(udg_Frames[framesId], true)
            //名字
            set framesId=framesId+1
            set str =  YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=ItemAps[i]?>, "Name")
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText( udg_Frames[framesId], str )
            call DzFrameSetScale(udg_Frames[framesId], 0.8)
            call DzFrameShow(udg_Frames[framesId], true)
            //  call DzFrameSetText( udg_Frames[framesId], "|cfff5fcb9" + str + "|r" )
            //价格
            set framesId=framesId+1
            set str =  YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=ItemAps[i]?>, "goldcost")
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText( udg_Frames[framesId], "|cfff5fcb9" + str + "|r" )
            call DzFrameSetScale(udg_Frames[framesId], 0.8)
            call DzFrameShow(udg_Frames[framesId], true)
            set framesId=framesId+1
      <?end?>
    <?end?>
endfunction


function InitItemCrits takes nothing returns nothing
    local integer framesId=300
    local string  str=""
    
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellAds", 0)
    call DzFrameShow(udg_Frames[framesId], false)
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellAps", 0)
    call DzFrameShow(udg_Frames[framesId], false)
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellCrits", 0)
    call DzFrameShow(udg_Frames[framesId], true)
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellCooldowns", 0)
    call DzFrameShow(udg_Frames[framesId], false)
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellManas", 0)
    call DzFrameShow(udg_Frames[framesId], false)
    
    <?for i = 1, 25 do?>
     <?if i>#ItemCrits  then?>
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
       <?else?>
            //按钮
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 4
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                if GetLocalPlayer() == ConvertedPlayer(bj_forLoopAIndex) then
                    call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect", false)
                endif
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            
            //call DzFrameSetScript(udg_Frames[framesId], 2, "BtnTipsOn" , false )
            //call DzFrameSetScript(udg_Frames[framesId], 3, "BtnTipsOff", false)
            call YDWESaveIntegerByString( "ItemCell", I2S(udg_Frames[framesId]), <?=ItemCrits[i]?> )
            call DzFrameShow(udg_Frames[framesId], true)
            //图片
            set framesId=framesId+1
            set str =  YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=ItemCrits[i]?>, "Art")
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetTexture(udg_Frames[framesId], str, 0)
            call DzFrameShow(udg_Frames[framesId], true)
            //名字
            set framesId=framesId+1
            set str =  YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=ItemCrits[i]?>, "Name")
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText( udg_Frames[framesId], str )
            call DzFrameSetScale(udg_Frames[framesId], 0.8)
            call DzFrameShow(udg_Frames[framesId], true)
            //  call DzFrameSetText( udg_Frames[framesId], "|cfff5fcb9" + str + "|r" )
            //价格
            set framesId=framesId+1
            set str =  YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=ItemCrits[i]?>, "goldcost")
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText( udg_Frames[framesId], "|cfff5fcb9" + str + "|r" )
            call DzFrameSetScale(udg_Frames[framesId], 0.8)
            call DzFrameShow(udg_Frames[framesId], true)
            set framesId=framesId+1
      <?end?>
    <?end?>
endfunction

function InitItemCooldowns takes nothing returns nothing
    local integer framesId=400
    local string  str
    
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellAds", 0)
    call DzFrameShow(udg_Frames[framesId], false)
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellAps", 0)
    call DzFrameShow(udg_Frames[framesId], false)
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellCrits", 0)
    call DzFrameShow(udg_Frames[framesId], false)
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellCooldowns", 0)
    call DzFrameShow(udg_Frames[framesId], true)
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellManas", 0)
    call DzFrameShow(udg_Frames[framesId], false)
    
    <?for i = 1, 25 do?>
     <?if i>#ItemCooldowns  then?>
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
       <?else?>
            //按钮
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 4
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                if GetLocalPlayer() == ConvertedPlayer(bj_forLoopAIndex) then
                    call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect", false)
                endif
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            
            //      call DzFrameSetScript(udg_Frames[framesId], 2, "BtnTipsOn" , false )
            //      call DzFrameSetScript(udg_Frames[framesId], 3, "BtnTipsOff", false)
            call YDWESaveIntegerByString( "ItemCell", I2S(udg_Frames[framesId]), <?=ItemCooldowns[i]?> )
            call DzFrameShow(udg_Frames[framesId], true)
            //图片
            set framesId=framesId+1
            set str =  YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=ItemCooldowns[i]?>, "Art")
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetTexture(udg_Frames[framesId], str, 0)
            call DzFrameShow(udg_Frames[framesId], true)
            //名字
            set framesId=framesId+1
            set str =  YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=ItemCooldowns[i]?>, "Name")
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText( udg_Frames[framesId], str )
            call DzFrameSetScale(udg_Frames[framesId], 0.8)
            call DzFrameShow(udg_Frames[framesId], true)
            //  call DzFrameSetText( udg_Frames[framesId], "|cfff5fcb9" + str + "|r" )
            //价格
            set framesId=framesId+1
            set str =  YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=ItemCooldowns[i]?>, "goldcost")
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText( udg_Frames[framesId], "|cfff5fcb9" + str + "|r" )
            call DzFrameSetScale(udg_Frames[framesId], 0.8)
            call DzFrameShow(udg_Frames[framesId], true)
            set framesId=framesId+1
      <?end?>
    <?end?>
endfunction

function InitItemManas takes nothing returns nothing
    local integer framesId=500
    local string  str
    
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellAds", 0)
    call DzFrameShow(udg_Frames[framesId], false)
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellAps", 0)
    call DzFrameShow(udg_Frames[framesId], false)
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellCrits", 0)
    call DzFrameShow(udg_Frames[framesId], false)
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellCooldowns", 0)
    call DzFrameShow(udg_Frames[framesId], false)
    set udg_Frames[framesId]=DzFrameFindByName("ItemCellManas", 0)
    call DzFrameShow(udg_Frames[framesId], true)
    
    <?for i = 1, 25 do?>
     <?if i>#ItemManas then?>
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameShow(udg_Frames[framesId], false)
            set framesId=framesId+1
       <?else?>
            //按钮
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 4
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                if GetLocalPlayer() == ConvertedPlayer(bj_forLoopAIndex) then
                    call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect", false)
                endif
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            
            //      call DzFrameSetScript(udg_Frames[framesId], 2, "BtnTipsOn" , false )
            //      call DzFrameSetScript(udg_Frames[framesId], 3, "BtnTipsOff", false)
            call YDWESaveIntegerByString( "ItemCell", I2S(udg_Frames[framesId]), <?=ItemManas[i]?> )
            call DzFrameShow(udg_Frames[framesId], true)
            //图片
            set framesId=framesId+1
            set str =  YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=ItemManas[i]?>, "Art")
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetTexture(udg_Frames[framesId], str, 0)
            call DzFrameShow(udg_Frames[framesId], true)
            //名字
            set framesId=framesId+1
            set str =  YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=ItemManas[i]?>, "Name")
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText( udg_Frames[framesId], str )
            call DzFrameSetScale(udg_Frames[framesId], 0.8)
            call DzFrameShow(udg_Frames[framesId], true)
            //  call DzFrameSetText( udg_Frames[framesId], "|cfff5fcb9" + str + "|r" )
            //价格
            set framesId=framesId+1
            set str =  YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=ItemManas[i]?>, "goldcost")
            set udg_Frames[framesId]=DzFrameFindByName(I2S(framesId), 0)
            call DzFrameSetText( udg_Frames[framesId], "|cfff5fcb9" + str + "|r" )
            call DzFrameSetScale(udg_Frames[framesId], 0.8)
            call DzFrameShow(udg_Frames[framesId], true)
            set framesId=framesId+1
      <?end?>
    <?end?>
endfunction

function InitItemCell takes nothing returns nothing
    call InitItemAds()
    call InitItemAps()
    call InitItemCrits()
    call InitItemCooldowns()
    call InitItemManas()
    call DzFrameShow(DzFrameFindByName("ItemCellAds", 0), false)
    call DzFrameShow(DzFrameFindByName("ItemCellAps", 0), false)
    call DzFrameShow(DzFrameFindByName("ItemCellCrits", 0), false)
    call DzFrameShow(DzFrameFindByName("ItemCellCooldowns", 0), false)
    call DzFrameShow(DzFrameFindByName("ItemCellManas", 0), false)
endfunction

function GetIndexOfItem takes unit whichUnit, item it returns integer
    local integer index
    local item    indexItem

    set index = 0
    loop
        set indexItem = UnitItemInSlot(whichUnit, index)
        if (indexItem != null) and (indexItem == it ) then
            return index
        endif

        set index = index + 1
        exitwhen index >= bj_MAX_INVENTORY
    endloop
    return -1
endfunction


function BtnTipsOn takes nothing returns nothing
    local integer id
    local string tip
    if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
        set id = YDWEGetIntegerByString("ItemCell", I2S(DzGetTriggerUIEventFrame()))
        if id  != 0 then
            set tip =YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id, "Name") + "|n|n" + YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id, "Description")
            call DzFrameClearAllPoints(udg_Frames[100])
            call DzFrameSetPoint(udg_Frames[100], 0, DzGetTriggerUIEventFrame(), 8, 0.0, 0.0)
            call DzFrameShow(udg_Frames[100], true)
            call DzFrameSetText(udg_Frames[101], tip)
        endif
    endif
endfunction

function BtnTipsOff takes nothing returns nothing 
    call DzFrameShow(udg_Frames[100], false)
endfunction


function BtnSelect2 takes nothing returns nothing
    local integer index
    if (udg_Frames[10] == DzGetTriggerUIEventFrame()) then
        set index = 1
    endif
    if (udg_Frames[12] == DzGetTriggerUIEventFrame()) then
        set index = 2
    endif
    if (udg_Frames[14] == DzGetTriggerUIEventFrame()) then
        set index = 3
    endif
    if (udg_Frames[16] == DzGetTriggerUIEventFrame()) then
        set index = 4
    endif
    if (udg_Frames[18] == DzGetTriggerUIEventFrame()) then
        set index = 5
    endif
    if (udg_Frames[20] == DzGetTriggerUIEventFrame()) then
        set index = 6
    endif
    call DzSyncData( "AddItem3", I2S(index) )    
endfunction

function RefreshItemCell takes player play returns nothing
    local unit selectedUnit
    local item it
    local integer id = 0
    local integer framesId=10
    if ((udg_ui_isHEOpen[GetPlayerId(play)] == false)) then
        return
    endif
    return
    call DzFrameSetText( DzFrameFindByName("HeroGold", 0), I2S(GetPlayerState(play, PLAYER_STATE_RESOURCE_GOLD)) )
    set selectedUnit = udg_SelectedHeros[GetPlayerId(play)]
    if selectedUnit != null then
        <? for i = 0, 5 do ?>
            set it = UnitItemInSlot(selectedUnit,<?=i?>)
            set id = GetItemTypeId(it)
            if it != null then
                call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect2", false)
            //    call DzFrameSetScript(udg_Frames[framesId], 2, "BtnTipsOn" , false )
            //    call DzFrameSetScript(udg_Frames[framesId], 3, "BtnTipsOff", false)
             //   call YDWESaveIntegerByString("ItemCell", I2S(udg_Frames[framesId]), id  )  
                call DzFrameShow(udg_Frames[framesId], true)
            else
                call DzFrameShow(udg_Frames[framesId], false)
            endif
            set framesId = framesId+1
            if it != null then
                call DzFrameSetTexture(udg_Frames[framesId], YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, id , "Art"), 0)
                call DzFrameShow(udg_Frames[framesId], true)
            else
                call DzFrameShow(udg_Frames[framesId], false)
            endif
            set framesId = framesId+1
        <?end?>
    endif
endfunction



