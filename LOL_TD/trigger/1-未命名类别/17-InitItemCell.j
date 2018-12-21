//TESH.scrollpos=369
//TESH.alwaysfold=0
globals
    trigger gg_trg_ItemAds= null
    trigger gg_trg_ItemAps= null
    trigger gg_trg_ItemCrits= null
    trigger gg_trg_ItemCooldowns= null
    trigger gg_trg_ItemManas= null
endglobals
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

Items={}
?>

function ClearUI takes nothing returns nothing
    //隐藏所有界面
    call DzFrameShow(udg_Frames[0], false)  
    call DzFrameShow(udg_Frames[3], false) 
    call DzFrameShow(udg_Frames[6], false) 
    <?for i = 0, 5 do?>
         set udg_CellHasItem[<?=i?>] = false
    <?end?>
endfunction


function BtnSelect takes nothing returns nothing
    local integer index = 0
    local integer goldcost = 0
    local string newArt
    local integer key = 0
    local unit selectedUnit = udg_SelectedHeros[GetPlayerId(DzGetTriggerUIEventPlayer())]
    local integer id = YDWEGetIntegerByString("ItemCell", I2S(DzGetTriggerUIEventFrame()))
    local boolean hasItem
    local item it
    
    call ClearUI()
    call YDWESaveIntegerByString("ItemCell", "SelectedItemId", id )   
    call DzFrameShow(DzFrameFindByName("HCUP", 0), true)  
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
    <?for k,v in pairs(ItemComs) do?> //一重循环
        set key=<?=k?>
        if key == id then
            <?for k2, v2 in pairs(v) do ?> //二重循环
                set hasItem = false
                //三重循环
                set bj_forLoopAIndex = 0
                loop
                    exitwhen bj_forLoopAIndex > 5
                    set it = UnitItemInSlot(selectedUnit, bj_forLoopAIndex)
                    if it !=null and  GetItemTypeId(it)==<?=v2?> and udg_CellHasItem[bj_forLoopAIndex] == false  then
                        set hasItem = true
                        set udg_CellHasItem[bj_forLoopAIndex] = true 
                        set goldcost = goldcost - S2I(YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ITEM, <?=v2?>, "goldcost"))
                        call DzFrameSetText(DzFrameFindByName("HC2A2", 0),"|cfff5fcb9"+I2S(goldcost)+"|r" )

                       // set udg_SellItems[udg_SellCount] = it
                       set udg_SellItems[bj_forLoopAIndex] = it
                        set udg_SellCount = udg_SellCount+1
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
                call YDWESaveIntegerByString( "ItemCell", I2S(udg_Frames[index]), <?=v2?> )       
                call DzFrameSetScript(udg_Frames[index], 1, "BtnSelect", false)
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
            call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect", false)
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
    local integer framesId=100
    local string  str=""
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
            call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect", false)
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
    local integer framesId=100
    local string  str=""
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
            call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect", false)
            //      call DzFrameSetScript(udg_Frames[framesId], 2, "BtnTipsOn" , false )
            //      call DzFrameSetScript(udg_Frames[framesId], 3, "BtnTipsOff", false)
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
    local integer framesId=100
    local string  str
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
            call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect", false)
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
    local integer framesId=100
    local string  str
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
            call DzFrameSetScript(udg_Frames[framesId], 1, "BtnSelect", false)
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

function Trig_InitItemCellActions takes nothing returns nothing
    set gg_trg_ItemAds = CreateTrigger()
    call TriggerAddAction(gg_trg_ItemAds, function InitItemAds)
    set gg_trg_ItemAps = CreateTrigger()
    call TriggerAddAction(gg_trg_ItemAps, function InitItemAps)
    set gg_trg_ItemCrits = CreateTrigger()
    call TriggerAddAction(gg_trg_ItemCrits , function InitItemCrits)
    set gg_trg_ItemCooldowns = CreateTrigger()
    call TriggerAddAction(gg_trg_ItemCooldowns , function InitItemCooldowns)
    set gg_trg_ItemManas = CreateTrigger()
    call TriggerAddAction(gg_trg_ItemManas , function InitItemManas)
endfunction

//===========================================================================
function InitTrig_InitItemCell takes nothing returns nothing
    set gg_trg_InitItemCell = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg_InitItemCell, "InitItemCell")
#endif
    call TriggerAddAction(gg_trg_InitItemCell, function Trig_InitItemCellActions)
endfunction

