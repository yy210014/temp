require "scripts.utility"
require "scripts.Common.pairs"
require "scripts.Api.common"
require "scripts.Api.blizzard"
require "scripts.Api.japi"
--require "scripts.Api.BZApi"
Jglobals = require "jass.globals"
Slk = require "jass.slk"
require "scripts.GameEventProc"
require "scripts.Common.Misc"
require "scripts.Game"
require "scripts.GameStart"

PlayerTeamFactionId = 0
EnemyTeamFactionId = 1
AllPlayerTeam = { 0, 1, 2, 3, 8, 9, 10, 11 }
PlayerTeam = { 0, 1, 2, 3 }
EnemyTeam = { 8, 9, 10, 11 }

function main()
    local PlayerCount = 3
    local trig = CreateTrigger()
    TriggerRegisterTimerEvent(trig, 0, false)
    TriggerAddAction(trig, GameStart.OnGameStart)

    trig = CreateTrigger()
    TriggerRegisterTimerEvent(trig, 0.02, true)
    TriggerAddAction(trig, Game.OnGameUpdate)

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_ATTACKED, nil)
    end
    TriggerAddAction(trig, GameStart.AnyUnitAttack)

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_CONSTRUCT_FINISH, nil)
    end
    TriggerAddAction(trig, GameStart.AnyUnitConstructFinish)

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER, nil)
    end
    TriggerAddAction(trig, GameStart.AnyUnitOrderBuild)

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_SUMMON, nil)
    end
    TriggerAddAction(trig, GameStart.AnyUnitSummon)

    trig = CreateTrigger()
    for i, v in ipairs(EnemyTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_DEATH, nil)
    end
    TriggerAddAction(
    trig,
    function()
        local killUnit = GetJ_PlayerUnits(GetKillingUnit())
        local dieUnit = GetJ_EnemyUnits(GetDyingUnit())
        if (killUnit == nil or dieUnit == nil) then
            return
        end
        GameStart.AnyUnitDeath(killUnit, dieUnit)
    end
    )

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_HERO_LEVEL, nil)
    end
    TriggerAddAction(trig, GameStart.AnyHeroLevelUp)

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_HERO_SKILL, nil)
    end
    TriggerAddAction(trig, GameStart.AnyUnitLearnedSkill)

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_SPELL_CHANNEL, nil)
    end
    TriggerAddAction(trig, GameStart.AnyUnitSpellChannel)

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_SPELL_EFFECT, nil)
    end
    TriggerAddAction(trig, GameStart.AnyUnitSpellEffect)

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_SPELL_FINISH, nil)
    end
    TriggerAddAction(trig, GameStart.AnyUnitSpellFinish)

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_USE_ITEM, nil)
    end
    TriggerAddAction(trig, GameStart.AnyUnitUseItem)

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_PICKUP_ITEM, nil)
    end
    TriggerAddAction(trig, GameStart.AnyUnitPickUpItem)

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_SELL_ITEM, nil)
    end
    TriggerAddAction(trig, GameStart.AnyUnitSellItem)

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerUnitEvent(trig, Player(v), EVENT_PLAYER_UNIT_DROP_ITEM, nil)
    end
    TriggerAddAction(trig, GameStart.AnyUnitDropItem)

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerChatEvent(trig, Player(v), "", true)
    end
    TriggerAddAction(trig, GameStart.AnyPlayerChat)

    trig = CreateTrigger()
    for i, v in ipairs(PlayerTeam) do
        TriggerRegisterPlayerEvent(trig, Player(v), EVENT_PLAYER_LEAVE)
    end
    TriggerAddAction(
    trig,
    function()
        --DisplayTextToAll(GetPlayerName(GetTriggerPlayer()) .. "离开了游戏，系统把他所有的装备都仍在了地上。", Color.red)
        AssetsManager.IteratePlayerUnits(GetPlayerId(GetTriggerPlayer()), function(u)
            u:IterateItems(
            function(item)
                UnitRemoveItem(u.Entity, item.Entity)
            end
            )
            AssetsManager.DestroyObject(u)
        end)
        PlayerInfo:Player(GetPlayerId(GetTriggerPlayer())).IsWatch = true
    end
    )
    trig = nil
end

main()