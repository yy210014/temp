UIManager = {}
local mGameUI = nil

function UIManager:Init()
    DzLoadToc("resource\\ui\\custom.toc")
    mGameUI = DzGetGameUI()
    self:Create("Slot")
end

function UIManager:Create(name)
    local ui = DzCreateFrame(name, mGameUI, 0)
    DzFrameShow(ui, true)
    return ui
end

function UIManager:Destroy()
    -- body
end
