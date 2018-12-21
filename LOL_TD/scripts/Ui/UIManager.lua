require "scripts.Ui.UiBase"
require "scripts.Ui.KeyCode"

UIManager = {}
local MapAllUi = {}
local mGameUI = nil

function UIManager:Init()
    --DzLoadToc("resource\\ui\\custom.toc")
    DzLoadToc("custom2.toc")
    mGameUI = DzGetGameUI()

    --装备商店
    local ui = self:Create("BAG")
    DzFrameSetPoint(ui, AnchorPoint.CENTER, mGameUI, AnchorPoint.CENTER, 0, 0.06)
    DzFrameShow(ui, false)

    -- 商店按钮
    ui = self:Create("BAG1")
    DzFrameSetPoint(ui, AnchorPoint.RIGHT, DzGetGameUI(), AnchorPoint.RIGHT, 0, -0.1)
    DzFrameShow(ui, true)
    -- 英雄商店
    ui = self:Create("BAG2")
    DzFrameSetPoint(ui, AnchorPoint.CENTER, DzGetGameUI(), AnchorPoint.CENTER, 0, 0.06)
    DzFrameShow(ui, false)

    local xxs = function()
        Game.Log("xxs")
        DzFrameShow(DzFrameFindByName("BAG", 0), true)
    end

    for i = 0, 3 do
        if GetLocalPlayer() == Player(i) then
            DzFrameSetScriptByCode(DzFrameFindByName("AA", 0), 1, xxs, false)
        end
    end

    local trig = CreateTrigger()
    DzTriggerRegisterKeyEvent(trig, 71, CFrameEvents.FRAME_EVENT_PRESSED, true, nil)
    TriggerAddAction(
        trig,
        function()
            Game.Log("G")
            DzFrameShow(DzFrameFindByName("BAG", 0), true)
        end
    )

    trig = CreateTrigger()
    DzTriggerRegisterKeyEvent(trig, 72, CFrameEvents.FRAME_EVENT_PRESSED, true, nil)
    TriggerAddAction(trig, xxs)

    trig = CreateTrigger()
    DzTriggerRegisterKeyEvent(trig, 74, CFrameEvents.FRAME_EVENT_PRESSED, true, nil)
    TriggerAddAction(trig, Trig____________________002Func001Func001FT)
end

function Trig____________________002Func001Func001FT()
    Game.Log("点击")
    DzFrameShow(DzFrameFindByName("BAG", 0), true)
end

function UIManager:Create(name)
    local ui = DzCreateFrame(name, mGameUI, 0)
    MapAllUi[name] = ui

    local newSkill = {}
    setmetatable(newSkill, {__index = Skills[name]})
    return ui
end

function UIManager:Destroy()
    -- body
end

AllUis =
    setmetatable(
    {},
    {
        __index = function(self, name)
            self[name] = {}
            setmetatable(self[name], {__index = UiBase})
            self[name].Name = name

            return self[name]
        end
    }
)
