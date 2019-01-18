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
            Worke[i]:AddSkill("cb01")
            Worke[i]:AddSkill("cb02")
            Worke[i]:AddSkill("gh01")
            Worke[i]:AddSkill("gh02")
            Worke[i]:AddSkill("pf01")
            
            --Worke[i]:AddSkill("AU12")
            UnitAddItem(Worke[i].Entity, CreateItem(GetId("IU03"), Worke[i]:X(), Worke[i]:Y()))
            RemoveLocation(p)
            RemoveGuardPosition(Worke[i].Entity)
            SuspendHeroXP(Worke[i].Entity, true)
            --UnitAddItem(Worke[i].Entity, CreateItem(GetId("IH07"), Worke[i]:X(), Worke[i]:Y()))
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
    DisplayTextToAll("-提示：输入‘-repick’可以重新随机一次SR英雄。", Color.yellow)
    DisplayTextToAll("-提示：优先做出人物的装备羁绊可以明显的提升人物的战斗力。", Color.yellow)
    CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "新手必看", "工人头像旁边有UI商店，前期建议购买贪婪，当贪婪叠加满后卖了可以获得更多的经济。|n前期偏弱的英雄可以开局购买装备火焰之心帮助你更好的清怪.不懂后续出装的优先把人物的装备羁绊做出来然后在慢慢熟悉游戏环境。", "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp")
    CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "指令说明", "输入++/--可以抬高或者降低镜头视角|n输入-repack可以把一张SR卡重新免费随机一次|n输入-jf可以查看自己当前游戏积分", "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp")
    CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "积分说明", "通关难1获得5积分,通关难2获得10积分,通关难3获得15积分,通关难4获得20积分|n进入无尽模式后难3每守住1波奖励1积分，每5波为1轮守住1轮奖励3积分.难4积分翻倍。购买会员获得的所有积分翻倍。", "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp")
    CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "天赋系统", "开局赠送1天赋点，每击杀100个小兵或击杀一条小龙可以获得1天赋点，天赋点用于给英雄学习天赋技能。游戏内共有十几种不同的天赋，每个天赋分为C,B,A,S四种等级，强力的天赋能更好的强化你的英雄。", "Icon\\TianFu.blp")
    CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "羁绊系统", "每个英雄都有个羁绊技能，羁绊可以和人物点亮也可以和装备点亮，点亮的羁绊可以为英雄提供额外属性。任意英雄点亮两个以上羁绊可以解锁超能天赋，点亮三个以上羁绊可以突破18级等级限制。", "ReplaceableTextures\\CommandButtons\\BTNMetamorphosis.blp")
    --EndLessComing()
    --UIManager:Init()
    --Game.Log(os.date("%c"))
    --Game.Log(os.time())
end


function GameScene.OnGameUpdate(dt)
    GameScene.Elapsed = GameScene.Elapsed + dt
    AssetsManager.OnGameUpdate(dt)
    MonsterRefresh.OnGameUpdate(dt)
    Multiboard.OnGameUpdate(dt)
end