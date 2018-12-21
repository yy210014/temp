local buff = Buffs["撕裂"]
buff.Art = "Abilities\\Weapons\\flamingArrow\\flamingArrowMissile.mdl"
buff.Stack = 1
buff.MaxStack = 11
buff.Durs = {4, 4, 4, 4, 4, 4}

function buff:OnAdd()
    local unit = self.Owner
    self.Effects = {}
    self.AttachPoints = {
        [1] = "overhead",
        [2] = "head",
        [3] = "chest",
        [4] = "hand",
        [5] = "hand,left",
        [6] = "hand,right",
        [7] = "weapon",
        [8] = "foot",
        [9] = "foot,left",
        [10] = "foot,right",
        [11] = "origin"
    }
    local random = math.random(1, #self.AttachPoints)
    self.Effects[#self.Effects + 1] = AddSpecialEffectTarget(self.Art, unit.Entity, self.AttachPoints[random])
    table.remove(self.AttachPoints, random)
end

function buff:AddStack()
    if (#self.AttachPoints == 0) then
        self.TimeDt = 0
        return
    end
    local unit = self.Owner
    local random = math.random (1, #self.AttachPoints)
    if (self.Stack < self.MaxStack) then
        self.Stack = self.Stack + 1
        self.Effects[#self.Effects + 1] = AddSpecialEffectTarget(self.Art, unit.Entity, self.AttachPoints[random])
        table.remove(self.AttachPoints, random)
    end
    self.TimeDt = 0
end

function buff:OnRemove()
    for i = #self.Effects, 1, -1 do
        DestroyEffect(self.Effects[i])
        table.remove(self.Effects, i)
    end
    self.Effects = nil
end
