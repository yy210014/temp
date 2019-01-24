--通用buff，不叠加，相同buff会覆盖,需要先继承在用则可以叠加
local buff = Buffs["物理攻击"]
buff.Durs = { 2, 2, 2, 2, 2, 2 }
buff.values = { 0, 0, 0, 0, 0, 0 }
buff.LastValue = 0
buff.MaxStack = 5
buff.Art1 = "Abilities\\Spells\\NightElf\\BattleRoar\\RoarTarget.mdl"
buff.Art2 = "Abilities\\Spells\\Other\\HowlOfTerror\\HowlTarget.mdl"

function buff:OnAdd()
    local unit = self.Owner
    self.LastValue = self.values[self.Level] * self.Stack
    if (self.LastValue > 0 and self.Art1 ~= "") then
        self.Effect = AddSpecialEffectTarget(self.Art1, unit.Entity, "overhead")
    elseif (self.LastValue < 0 and self.Art2 ~= "") then
        self.Effect = AddSpecialEffectTarget(self.Art2, unit.Entity, "overhead")
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