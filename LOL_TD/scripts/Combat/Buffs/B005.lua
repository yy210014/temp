--通用buff，不叠加，相同buff会覆盖,需要先继承在用则可以叠加
local buff = Buffs["暂停"]
buff.Durs = {1}

function buff:OnAdd()
    SetUnitAnimation(self.Owner.Entity, "stand")
    self.LastSpeed = (GetUnitDefaultMoveSpeed(unit.Entity) + unit.Attribute:get("移动速度加成")) * -1
    self.Owner.Attribute:add("移动速度加成", self.LastSpeed)
end

function buff:OnRemove()
    self.Owner.Attribute:add("移动速度加成", -self.LastSpeed)
end
