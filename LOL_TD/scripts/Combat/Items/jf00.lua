local item = Items["轻盈之花"]
function item:OnAdd()
    local unit = self.Owner
    PlayerInfo:EnableJFItem(unit.Player, ItemType.jf_gh01)
end

item = Items["五行之轮"]
function item:OnAdd()
    local unit = self.Owner
    PlayerInfo:EnableJFItem(unit.Player, ItemType.jf_gh02)
end

item = Items["红炎翅膀"]
function item:OnAdd()
    local unit = self.Owner
    PlayerInfo:EnableJFItem(unit.Player, ItemType.jf_cb01)
end

item = Items["暗紫翅膀"]
function item:OnAdd()
    local unit = self.Owner
    PlayerInfo:EnableJFItem(unit.Player, ItemType.jf_cb02)
end

item = Items["火柴人"]
function item:OnAdd()
    local unit = self.Owner
    PlayerInfo:EnableJFItem(unit.Player, ItemType.jf_pf01)
end

item = Items["金猪"]
function item:OnAdd()
    local unit = self.Owner
    PlayerInfo:EnableJFItem(unit.Player, ItemType.jf_pf02)
end

--地图等级
item = Items["绿意怏然"]
function item:OnAdd()
    local unit = self.Owner
    PlayerInfo:EnableJFItem(unit.Player, ItemType.map_gh01)
end

item = Items["幻天旋地"]
function item:OnAdd()
    local unit = self.Owner
    PlayerInfo:EnableJFItem(unit.Player, ItemType.map_gh02)
end

item = Items["炫紫羽翼"]
function item:OnAdd()
    local unit = self.Owner
    PlayerInfo:EnableJFItem(unit.Player, ItemType.map_cb01)
end

item = Items["灵光蝶羽"]
function item:OnAdd()
    local unit = self.Owner
    PlayerInfo:EnableJFItem(unit.Player, ItemType.map_cb02)
end

item = Items["柯基犬"]
function item:OnAdd()
    local unit = self.Owner
    PlayerInfo:EnableJFItem(unit.Player, ItemType.map_pf01)
end