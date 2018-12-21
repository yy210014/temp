require "scripts.utility"
require "scripts.Common.pairs"
require "scripts.Api.common"
require "scripts.Api.blizzard"
require "scripts.Api.japi"
require "scripts.Api.BZApi"
Jglobals = require "jass.globals"
Slk = require "jass.slk"
require "scripts.GameEventProc"
require "scripts.Common.Misc"
require "scripts.Game"
require "scripts.GameStart"

PlayerTeamFactionId = 0
EnemyTeamFactionId = 1
AllPlayerTeam = {0, 1, 2, 3, 8, 9, 10, 11}
PlayerTeam = {0, 1, 2, 3}
EnemyTeam = {8, 9, 10, 11}

function main()
    local PlayerCount = 3
    local trig = CreateTrigger()
    TriggerRegisterTimerEvent(trig, 0, false)
    TriggerAddAction(
        trig,
        function()
            GameStart.OnGameStart()
        end
    )

    trig = CreateTrigger()
    TriggerRegisterTimerEvent(trig, 0.02, true)
    TriggerAddAction(
        trig,
        function()
            Game.OnGameUpdate(GameScene.DeltaTime * Game.GetSpeed())
        end
    )

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_ATTACKED, nil)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitAttack()
        end
    )

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_CONSTRUCT_FINISH, nil)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitConstructFinish()
        end
    )

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER, nil)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitOrderBuild()
        end
    )

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_SUMMON, nil)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitSummon()
        end
    )

   --[[ trig = CreateTrigger()
    for i, v in ipairs(EnemyTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_DEATH, nil)
    end
    TriggerAddAction(
        trig,
        function()
            local killUnit = GetJ_Units(GetKillingUnit())
            local dieUnit = GetJ_Units(GetDyingUnit())
            if (killUnit == nil or dieUnit == nil) then
                if dieUnit ~= nil then
                    AssetsManager.RemoveObject(dieUnit)
                end
                return
            end
            GameScene.UnitDeath(killUnit, dieUnit)
        end
    )]]

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_HERO_LEVEL, nil)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyHeroLevelUp()
        end
    )

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_HERO_SKILL, nil)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitLearnedSkill()
        end
    )

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_SPELL_CHANNEL, nil)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitSpellChannel()
        end
    )

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_SPELL_EFFECT, nil)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitSpellEffect()
        end
    )

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_SPELL_FINISH, nil)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitSpellFinish()
        end
    )

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_USE_ITEM, nil)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitUseItem()
        end
    )

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_PICKUP_ITEM, nil)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitPickUpItem()
        end
    )

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_SELL_ITEM, nil)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitSellItem()
        end
    )

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_DROP_ITEM, nil)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitDropItem()
        end
    )

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerChatEvent(trig, Player(v), "", true)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyPlayerChat()
        end
    )

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerEvent(trig, Player(v), EVENT_PLAYER_LEAVE)
    end
    TriggerAddAction(
        trig,
        function()
            DisplayTextToAll("提示：有人掉线了，作者暂停了游戏查看bug", Color.red)
            PauseGame(true)
        end
    )
    trig = nil
end

main()
