--通用buff，不叠加，相同buff会覆盖,需要先继承在用则可以叠加
local buff = Buffs["物理攻击"]
buff.Durs = {2, 2, 2, 2, 2, 2}
buff.values = {0, 0, 0, 0, 0, 0}
buff.LastValue = 0
buff.MaxStack = 5

function buff:OnAdd()
    local unit = self.Owner
    self.LastValue = self.values[self.Level] * self.Stack
    if (self.LastValue > 0) then
        self.Effect =
            AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\BattleRoar\\RoarTarget.mdl", unit.Entity, "overhead")
    elseif (self.LastValue < 0) then
        self.Effect =
            AddSpecialEffectTarget("Abilities\\Spells\\Other\\HowlOfTerror\\HowlTarget.mdl", unit.Entity, "overhead")
    end
    unit.Attribute:add("物理攻击加成", self.LastValue)
end

function buff:OnRemove()
    if (self.Effect ~= nil) then
        DestroyEffect(self.Effect)
    end
    local unit = self.Owner
    unit.Attribute:add("物理攻击加成", -self.LastValue)
end
