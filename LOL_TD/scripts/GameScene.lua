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
    for i = 0, 3 do
        if
        (GetPlayerController(Player(i)) == MAP_CONTROL_USER and
        GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING)
        then
            PlayerInfo:New(Player(i))
            local p = GetStartLocationLoc(GetPlayerStartLocation(Player(i)))
            Worke[i] = AssetsManager.LoadUnitAtLoc(Player(i), "ug00", p)

            --Worke[i]:AddSkill("AU12")
            UnitAddItem(Worke[i].Entity, CreateItem(GetId("IU03"), Worke[i]:X(), Worke[i]:Y()))
            RemoveLocation(p)
            RemoveGuardPosition(Worke[i].Entity)
            SuspendHeroXP(Worke[i].Entity, true)

            HeroInfoDialog[i + 1] = DialogCreate()
            DialogAddButton(HeroInfoDialog[i + 1], "确定", 0)
            --UnitAddItem(Worke[i].Entity, CreateItem(GetId("IH45"), Worke[i]:X(), Worke[i]:Y()))
            --   cheat(i)
            --UnitAddItem(Worke[i].Entity, CreateItem(GetId("IH07"), Worke[i]:X(), Worke[i]:Y()))
            --UnitAddItem(Worke[i].Entity, CreateItem(GetId("IH42"), Worke[i]:X(), Worke[i]:Y()))
            --UnitAddItem(Worke[i].Entity, CreateItem(GetId("IH43"), Worke[i]:X(), Worke[i]:Y()))
            Worke[i]:LearnedSkill(GetId("lqfl"))
            PlayerInfo:IteratePlayer(function(p)
                p:CheckJFItem()
            end)
            Worke[i]:LearnedSkill(GetId("cb01"))
            Worke[i]:LearnedSkill(GetId("cb02"))
            Worke[i]:LearnedSkill(GetId("cb03"))
            Worke[i]:LearnedSkill(GetId("cb04"))
            Worke[i]:LearnedSkill(GetId("cb05"))
            Worke[i]:LearnedSkill(GetId("gh01"))
            Worke[i]:LearnedSkill(GetId("gh02"))
            Worke[i]:LearnedSkill(GetId("gh03"))
            Worke[i]:LearnedSkill(GetId("gh04"))
            Worke[i]:LearnedSkill(GetId("gh05"))
            Worke[i]:LearnedSkill(GetId("pf01"))
            Worke[i]:LearnedSkill(GetId("pf02"))
            Worke[i]:LearnedSkill(GetId("pf03"))
            Worke[i]:LearnedSkill(GetId("pf04"))
        end
    end
end

function GameScene.OnGameStart()
    InitPlayerUnit()
    InitPlayerResource()
    Multiboard.CreateMultiboard()
    MonsterRefresh.OnGameStart()
    DisplayTextToAll("-提示：输入‘-swap’可以重新随机一次SR英雄。", Color.yellow)
    DisplayTextToAll("-提示：优先做出人物的装备羁绊可以明显的提升人物的战斗力。", Color.yellow)--EndLessComing()
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
        Jglobals.udg_Attribute[0] = tostring(mSelectedUnit[id].Attribute:get("法术攻击"))
        Jglobals.udg_Attribute[1] = tostring(math.ceil(mSelectedUnit[id].Attribute:get("物理穿透") * 100)) .. "%"
        Jglobals.udg_Attribute[2] = tostring(math.ceil(mSelectedUnit[id].Attribute:get("法术穿透") * 100)) .. "%"
        Jglobals.udg_Attribute[3] = tostring(math.ceil(mSelectedUnit[id].Attribute:get("物理伤害加成") * 100) - 100) .. "%"
        Jglobals.udg_Attribute[4] = tostring(math.ceil(mSelectedUnit[id].Attribute:get("法术伤害加成") * 100) - 100) .. "%"
        Jglobals.udg_Attribute[5] = tostring(math.ceil(mSelectedUnit[id].Attribute:get("暴击") * 100)) .. "%"
        Jglobals.udg_Attribute[6] = tostring(math.ceil(mSelectedUnit[id].Attribute:get("冷却缩减") * 100)) .. "%"
        Jglobals.udg_Attribute[7] = tostring(math.ceil(mSelectedUnit[id].Attribute:get("暴击伤害") * 100)) .. "%"
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