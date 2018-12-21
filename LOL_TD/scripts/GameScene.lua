require "scripts.Combat.PlayerInfo"
require "scripts.AssetsManager"
require "scripts.MonsterRefresh"
require "scripts.Multiboard"
require "scripts.Combat.Unit"
require "scripts.Combat.Attribute"
require "scripts.Combat.Buffs.InitBuff"
require "scripts.Combat.Items.InitItem"
require "scripts.Combat.Skills.InitSkill"
require "scripts.Combat.Locomotions.InitLocomotion"
require "scripts.Combat.Comb"

GameScene = {}
Worke = _array_()
GameScene.Elapsed = 0
GameScene.DeltaTime = 0.02

local function InitPlayerResource()
    for i, v in ipairs(PlayerTeam) do
        SetPlayerState(Player(v), PLAYER_STATE_RESOURCE_GOLD, 2000)
        SetPlayerState(Player(v), PLAYER_STATE_RESOURCE_LUMBER, 1)
        SetPlayerState(Player(v), PLAYER_STATE_FOOD_CAP_CEILING, 100)
        --修改了人口上限
        SetPlayerState(Player(v), PLAYER_STATE_RESOURCE_FOOD_CAP, 100)
    end
    for i, v in ipairs(EnemyTeam) do
        SetPlayerState(Player(v), PLAYER_STATE_GIVES_BOUNTY, 1)
    end
    --锁定资源交易
    SetMapFlag(MAP_LOCK_RESOURCE_TRADING, true)
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
            Worke[i]:AddSkill("lqfl")
            --Worke[i]:AddSkill("AU12")
            UnitAddItem(Worke[i].Entity, CreateItem(GetId("IU03"), Worke[i]:X(), Worke[i]:Y()))
            RemoveLocation(p)
            RemoveGuardPosition(Worke[i].Entity)
            SuspendHeroXP(Worke[i].Entity, true)
        --    UnitAddItem(Worke[i].Entity, CreateItem(GetId("IH06"), Worke[i]:X(), Worke[i]:Y()))
        --   cheat(i)
        -- UnitAddItem(Worke[i].Entity, CreateItem(GetId("I087"), Worke[i]:X(), Worke[i]:Y()))
        --   UnitAddItem(Worke[i].Entity, CreateItem(GetId("IH42"), Worke[i]:X(), Worke[i]:Y()))
        --   UnitAddItem(Worke[i].Entity, CreateItem(GetId("IH43"), Worke[i]:X(), Worke[i]:Y()))
        end
    end
end

function GameScene.OnGameStart()
    InitPlayerResource()
    InitPlayerUnit()
    Multiboard.CreateMultiboard()
    MonsterRefresh.OnGameStart()
    DisplayTextToAll("温馨提示：输入‘-repick’可以重新随机一次英雄。", Color.yellow)
    --UIManager:Init()
    --Game.Log(os.date("%c"))
    --Game.Log(os.time())
end

local mDeathUnitList = {}
function GameScene.UnitDeath(killUnit, dieUnit)
    if (dieUnit.IsDying == false) then
        dieUnit.IsDying = true
        PlayerInfo:Kill(killUnit.Player)
        GameStart.AnyUnitDeath(killUnit, dieUnit)
    end
    --mDeathUnitList[#mDeathUnitList + 1] = {killUnit, dieUnit}
end

function GameScene.OnGameUpdate(dt)
    GameScene.Elapsed = GameScene.Elapsed + dt
    AssetsManager.OnGameUpdate(dt)
    MonsterRefresh.OnGameUpdate(dt)
    Multiboard.OnGameUpdate(dt)

   --[[ if (mDeathUnitList ~= nil and #mDeathUnitList > 0) then
        local list = mDeathUnitList[1]
        if (list[2].IsDying == false) then
            list[2].IsDying = true
            PlayerInfo:Kill(list[1].Player)
            GameStart.AnyUnitDeath(list[1], list[2])
        end
        table.remove(mDeathUnitList, 1)
        list = nil
    end]]
end
