require "scripts.Combat.PlayerInfo"
require "scripts.AssetsManager"
require "scripts.MonsterRefresh"
require "scripts.Multiboard"
require "scripts.Combat.Unit"
require "scripts.Combat.Attribute"
require "scripts.Combat.Buffs.InitBuff"
require "scripts.Combat.Items.InitItem"
require "scripts.Combat.Skills.InitSkill"
require "scripts.Combat.Emitters.InitEmitter"
require "scripts.Combat.Locomotions.InitLocomotion"
require "scripts.Combat.Comb"

GameScene = {}
Worke = _array_()
GameScene.Elapsed = 0
GameScene.DeltaTime = 0.02
HeroInfoDialog = {}

local function InitPlayerResource()
    for i = 0, 3 do
        SetPlayerState(Player(i), PLAYER_STATE_FOOD_CAP_CEILING, 100)
        --修改了人口上限
        SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_FOOD_CAP, 100)
        SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD, 2000)

        if LoadBoolean(Jglobals.udg_table, i + 1, ItemType.JBLB) then
            DisplayTextToPlayer(Player(i), 0, 0, "你已激活金币礼包，开局获得一个白银宝藏!")
            UnitAddItem(Worke[i].Entity, CreateItem(GetId("IB02"), Worke[i]:X(), Worke[i]:Y()))
        end

        if LoadBoolean(Jglobals.udg_table, i + 1, ItemType.MTLB) then
            DisplayTextToPlayer(Player(i), 0, 0, "你已激活木头礼包，开局获得1点天赋点!")
            SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_LUMBER, 1)
        else
            SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_LUMBER, 0)
        end
    end
    for i, v in ipairs(EnemyTeam) do
        SetPlayerState(Player(v), PLAYER_STATE_GIVES_BOUNTY, 1)
    end
end

local function InitPlayerUnit()
    local rectPoints = {
        GetRectCenter(Jglobals.gg_rct_yeguai1),
        GetRectCenter(Jglobals.gg_rct_yeguai2),
        GetRectCenter(Jglobals.gg_rct_yeguai3),
        GetRectCenter(Jglobals.gg_rct_yeguai4)
    }
    for i = 0, 3 do
        if
        (GetPlayerController(Player(i)) == MAP_CONTROL_USER and
        GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING)
        then
            local newPlayer = PlayerInfo:New(Player(i))
            local p = GetStartLocationLoc(GetPlayerStartLocation(Player(i)))
            Worke[i] = AssetsManager.LoadUnitAtLoc(Player(i), "ug00", p)
            --[[ if GetLocalPlayer() == Player(i) then
                ClearSelection()
                SelectUnit(Worke[i].Entity, true)
            end]]
            --Worke[i]:AddSkill("AU12")
            UnitAddItem(Worke[i].Entity, CreateItem(GetId("IU03"), Worke[i]:X(), Worke[i]:Y()))
            UnitAddItem(Worke[i].Entity, CreateItem(GetId("IA88"), Worke[i]:X(), Worke[i]:Y()))
            RemoveLocation(p)
            RemoveGuardPosition(Worke[i].Entity)
            SuspendHeroXP(Worke[i].Entity, true)

            HeroInfoDialog[i + 1] = DialogCreate()
            DialogAddButton(HeroInfoDialog[i + 1], "确定", 0)
            -- UnitAddItem(Worke[i].Entity, CreateItem(GetId("IH25"), Worke[i]:X(), Worke[i]:Y()))
            -- UnitAddItem(Worke[i].Entity, CreateItem(GetId("IH46"), Worke[i]:X(), Worke[i]:Y()))
            --  UnitAddItem(Worke[i].Entity, CreateItem(GetId("IH47"), Worke[i]:X(), Worke[i]:Y()))
            --  UnitAddItem(Worke[i].Entity, CreateItem(GetId("IH27"), Worke[i]:X(), Worke[i]:Y()))
            Worke[i]:LearnedSkill(GetId("lqfl"))
            newPlayer:CheckJFItem()
            Worke[i]:LearnedSkill(GetId("cb01"))
            Worke[i]:LearnedSkill(GetId("cb02"))
            Worke[i]:LearnedSkill(GetId("cb03"))
            Worke[i]:LearnedSkill(GetId("cb04"))
            --Worke[i]:LearnedSkill(GetId("cb05"))
            Worke[i]:LearnedSkill(GetId("gh01"))
            Worke[i]:LearnedSkill(GetId("gh02"))
            Worke[i]:LearnedSkill(GetId("gh03"))
            Worke[i]:LearnedSkill(GetId("gh04"))
            --Worke[i]:LearnedSkill(GetId("gh05"))
            Worke[i]:LearnedSkill(GetId("pf01"))
            Worke[i]:LearnedSkill(GetId("pf02"))
            --Worke[i]:LearnedSkill(GetId("pf03"))
            Worke[i]:LearnedSkill(GetId("pf04"))

            local tz = AssetsManager.LoadUnitAtLoc(Player(i), "uw09", rectPoints[i + 1])
            newPlayer.TiaoZhan = tz
            tz.CurSkill = tz:AddSkill("A01" .. math.random(1, 3))
            local abilityCode = EXGetUnitAbility(tz.Entity, tz.CurSkill.Id)
            EXSetAbilityState(abilityCode, ABILITY_STATE_COOLDOWN, 60)
            tz.TZCount = 0
            local timer = CreateTimer()
            TimerStart(timer, 360, true, function()
                if (tz.CurSkill ~= nil) then
                    tz:RemoveSkill(tz.CurSkill.Id)
                end
                tz.CurSkill = tz:AddSkill("A01" .. math.random(1, 3))
                local abilityCode = EXGetUnitAbility(tz.Entity, tz.CurSkill.Id)
                EXSetAbilityState(abilityCode, ABILITY_STATE_COOLDOWN, 1)
                DisplayTextToPlayer(tz.Player, 0, 0, "|cffffcc00新的野怪已经抵达战场，可通过野怪挑战商店进行挑战!|r")
                PingMinimap(tz:X(), tz:Y(), 15)
            end
            )
        end
    end
    rectPoints = nil
end

function GameScene.OnGameStart()
    InitPlayerUnit()
    InitPlayerResource()
    Multiboard.CreateMultiboard()
    MonsterRefresh.OnGameStart()
    DisplayTextToAll("-提示：输入‘-swap’可以重新随机一次SR英雄。", Color.yellow)
    DisplayTextToAll("-提示：优先做出人物的装备羁绊可以明显的提升人物的战斗力。", Color.yellow)--EndLessComing()
    DisplayTextToAll("-提示：建议新手玩家开局购买火焰之心（商店UI法术攻击栏中），帮助更好度过前期!!!", Color.yellow)--EndLessComing()
    DisplayTextToAll("-提示：建议新手玩家开局购买火焰之心（商店UI法术攻击栏中），帮助更好度过前期!!!", Color.yellow)--EndLessComing()
    if (os.time() < 1552838760) then
        DisplayTextToAll("-为了感谢玩家对本游戏的支持，即日起开启两天的疯狂周末活动，无尽积分翻倍!!!！", Color.magenta)--EndLessComing()
    end
    --UIManager:Init()
    --Game.Log(os.date("%c"))
    --Game.Log(os.time())
end

local mSelectedUnit = {}
function GameScene.AnyUnitSelected()
    local id = GetPlayerId(GetTriggerPlayer()) + 1
    mSelectedUnit[id] = GetJ_PlayerUnits(GetTriggerUnit())
end

function GameScene.OnGameUpdate(dt)
    GameScene.Elapsed = GameScene.Elapsed + dt
    AssetsManager.OnGameUpdate(dt)
    MonsterRefresh.OnGameUpdate(dt)
    local id = GetPlayerId(GetLocalPlayer()) + 1
    if mSelectedUnit[id] ~= nil and mSelectedUnit[id].Attribute ~= nil and mSelectedUnit[id].Attribute:get("生命") > 0 then
        Jglobals.udg_Attribute[0] = tostring(math.ceil(mSelectedUnit[id].Attribute:get("法术攻击")))
        Jglobals.udg_Attribute[1] = tostring(string.format("%.0f", mSelectedUnit[id].Attribute:get("物理穿透") * 100)) .. "%"
        Jglobals.udg_Attribute[2] = tostring(string.format("%.0f", mSelectedUnit[id].Attribute:get("法术穿透") * 100)) .. "%"
        Jglobals.udg_Attribute[3] = tostring(string.format("%.1f", mSelectedUnit[id].Attribute:get("物理伤害加成") * 100)) - 100 .. "%"
        Jglobals.udg_Attribute[4] = tostring(string.format("%.1f", mSelectedUnit[id].Attribute:get("法术伤害加成") * 100)) - 100 .. "%"
        Jglobals.udg_Attribute[5] = tostring(string.format("%.0f", mSelectedUnit[id].Attribute:get("暴击") * 100)) .. "%"
        Jglobals.udg_Attribute[6] = tostring(math.ceil(Misc.Clamp(mSelectedUnit[id].Attribute:get("冷却缩减"), 0, mSelectedUnit[id].Attribute:get("冷却缩减上限")) * 100)) .. "%"
        Jglobals.udg_Attribute[7] = tostring(string.format("%.0f", mSelectedUnit[id].Attribute:get("暴击伤害") * 100)) .. "%"
        Jglobals.udg_Attribute[8] = string.format("%.2f", mSelectedUnit[id].Attribute:get("攻击速度"))
        --tostring(mSelectedUnit[id].Attribute:get("攻击速度")), 1, 4)
        Jglobals.udg_Attribute[9] = "+" .. tostring(math.ceil(mSelectedUnit[id].Attribute:get("魔法恢复")))
    else
        Jglobals.udg_Attribute[0] = "0"
        Jglobals.udg_Attribute[1] = "0"
        Jglobals.udg_Attribute[2] = "0"
        Jglobals.udg_Attribute[3] = "0"
        Jglobals.udg_Attribute[4] = "0"
        Jglobals.udg_Attribute[5] = "0"
        Jglobals.udg_Attribute[6] = "0"
        Jglobals.udg_Attribute[7] = "0"
        Jglobals.udg_Attribute[8] = "0"
        Jglobals.udg_Attribute[9] = "0"
    end
    --Multiboard.OnGameUpdate(dt)
end