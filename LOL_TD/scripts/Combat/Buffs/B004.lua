--通用buff，不叠加，相同buff会覆盖,需要先继承在用则可以叠加
local buff = Buffs["攻速"]
buff.Effect1 = nil
buff.Effect2 = nil
buff.Durs = {2, 2, 2, 2, 2, 2}
buff.values = {0, 0, 0, 0, 0, 0}
buff.LastSpeed = 0

function buff:OnAdd()
    local unit = self.Owner
    self.LastSpeed = unit.Attribute:get("攻击速度") * self.values[self.Level] * self.Stack
    if (self.LastSpeed > 0) then
        self.Effect1 =
            AddSpecialEffectTarget("Abilities\\Spells\\Orc\\Bloodlust\\BloodlustTarget.mdl", unit.Entity, "hand,left")
        self.Effect2 =
            AddSpecialEffectTarget("Abilities\\Spells\\Orc\\Bloodlust\\BloodlustSpecial.mdl", unit.Entity, "hand,right")
    elseif (self.LastSpeed < 0) then
        self.Effect =
            AddSpecialEffectTarget("Abilities\\Spells\\Undead\\Cripple\\CrippleTarget.mdl", unit.Entity, "chest")
    end
    unit.Attribute:add("攻击速度", self.LastSpeed)
end

function buff:OnRemove()
    if (self.Effect ~= nil) then
        DestroyEffect(self.Effect)
    end
    if (self.Effect1 ~= nil and self.Effect2 ~= nil) then
        DestroyEffect(self.Effect1)
        DestroyEffect(self.Effect2)
    end
    local unit = self.Owner
    unit.Attribute:add("攻击速度", -self.LastSpeed)
end
