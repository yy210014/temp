local item = Items["轻盈之花"]
function item:OnAdd()
    local unit = self.Owner
    PlayerInfo:EnableJFItem(unit.Player, jfType.gh01)
end

local item = Items["时光之轮"]

function item:OnAdd()
    local unit = self.Owner
    PlayerInfo:EnableJFItem(unit.Player, jfType.gh02)
end

local item = Items["红炎翅膀"]

function item:OnAdd()
    local unit = self.Owner
    PlayerInfo:EnableJFItem(unit.Player, jfType.cb01)
end

local item = Items["暗紫翅膀"]

function item:OnAdd()
    local unit = self.Owner
    PlayerInfo:EnableJFItem(unit.Player, jfType.cb02)
end

local item = Items["火柴人"]

function item:OnAdd()
    local unit = self.Owner
    PlayerInfo:EnableJFItem(unit.Player, jfType.pf01)
end