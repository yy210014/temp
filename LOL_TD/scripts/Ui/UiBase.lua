UiBase = {}

local mt = {}
mt.active = false
mt.Entity = nil --实体

UiBase.__index = mt

function UiBase:New(name)
    local newUi = {}
    local ui = DzCreateFrame(name, mGameUI, 0)
    setmetatable(newUi, {__index = Items[name]})
    newUi.Entity = ui
    newUi.Id = ui
    return newItem
end

function UiBase:SetActive(value)
    self.active = value
end
