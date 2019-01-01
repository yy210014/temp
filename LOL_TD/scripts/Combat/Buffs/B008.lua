--通用buff，不叠加，相同buff会覆盖,需要先继承在用则可以叠加
local buff = Buffs["移速"]
buff.Durs = { 2, 2, 2, 2, 2, 2 }
buff.values = { 0, 0, 0, 0, 0, 0 }
buff.LastSpeed = 0
buff.Art1 = "Abilities\\Spells\\Items\\AIsp\\SpeedTarget.mdl"
buff.Art2 = "Abilities\\Spells\\Human\\slow\\slowtarget.mdl"

function buff:OnAdd()
    local unit = self.Owner
    if (GetUnitDefaultMoveSpeed(unit.Entity) + unit.Attribute:get("移动速度加成") <= 0) then
        return
    end
    self.LastSpeed = (GetUnitDefaultMoveSpeed(unit.Entity) + unit.Attribute:get("移动速度加成")) * self.values[self.Level] * self.Stack
    if (self.LastSpeed > 0) then
        self.Effect = AddSpecialEffectTarget(self.Art1, unit.Entity, "overhead")
    elseif (self.LastSpeed < 0) then
        self.Effect = AddSpecialEffectTarget(self.Art2, unit.Entity, "origin")
    end
    unit.Attribute:add("移动速度加成", self.LastSpeed)
end

function buff:OnRemove()
    if (self.Effect ~= nil) then
        DestroyEffect(self.Effect)
    end
    local unit = self.Owner
    if (GetUnitDefaultMoveSpeed(unit.Entity) + unit.Attribute:get("移动速度加成") <= 0) then
        return
    end
    unit.Attribute:add("移动速度加成", -self.LastSpeed)
end