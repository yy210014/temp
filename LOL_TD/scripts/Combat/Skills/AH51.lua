local skill = Skills["战斗狂怒"]
skill.Crits = { 0.005, 0.01, 0.015, 0.02, 0.025, 0.03 }
skill.Attacks = { 2, 4, 6, 8, 10, 12 }
skill.CurCrit = 0
skill.CurAttack = 0
function skill:OnCast()
end

skill.OnCrit = function(attactUnit, defUnit)
    attactUnit.Attribute:add("怒气值", 5)
end

skill.OnManaChange = function(owner, value)
    local self = owner:GetSkill(GetId("AH51"))
    if (self == nil) then
        return
    end
    local crit = 0.1 * self.Crits[self:GetCurLevel()] * value
    local attack = 0.1 * self.Attacks[self:GetCurLevel()] * value
    self.CurCrit = self.CurCrit + crit
    self.CurAttack = self.CurAttack + attack
    owner.Attribute:add("暴击", crit)
    owner.Attribute:add("物理攻击加成", attack)
end

function skill:OnLearned()
    local owner = self.Owner
    owner.Attribute:add("暴击", -self.CurCrit)
    owner.Attribute:add("物理攻击加成", -self.CurAttack)
    local crit = 0.1 * self.Crits[self:GetCurLevel()] * owner.Attribute:get("怒气值")
    local attack = 0.1 * self.Attacks[self:GetCurLevel()] * owner.Attribute:get("怒气值")
    self.CurCrit = crit
    self.CurAttack = attack
    owner.Attribute:add("暴击", crit)
    owner.Attribute:add("物理攻击加成", attack)
end

function skill:OnKill(dieUnit)
    self.Owner.Attribute:add("怒气值", 5)
end

GameEventProc.RegisterEventHandler("任意单位暴击", skill.OnCrit)
GameEventProc.RegisterEventHandler("任意单位怒气值改变", skill.OnManaChange)
