--通用buff，不叠加，相同buff会覆盖,需要先继承在用则可以叠加
local buff = Buffs["护甲"]
buff.Durs = {2, 2, 2, 2, 2, 2}
buff.values = {0, 0, 0, 0, 0, 0}
buff.LastDefense = 0

function buff:OnAdd()
    local unit = self.Owner
    self.LastDefense = self.values[self.Level] * self.Stack
    if (self.LastDefense > 0) then
        self.Effect = AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIda\\AIdaTarget.mdl", unit.Entity, "overhead")
    elseif (self.LastDefense < 0) then
        self.Effect =
            AddSpecialEffectTarget(
            "Abilities\\Spells\\NightElf\\FaerieFire\\FaerieFireTarget.mdl",
            unit.Entity,
            "chest"
        )
    end
    unit.Attribute:add("护甲", self.LastDefense)
end

function buff:OnRemove()
    if (self.Effect ~= nil) then
        DestroyEffect(self.Effect)
    end
    local unit = self.Owner
    unit.Attribute:add("护甲", -self.LastDefense)
end
