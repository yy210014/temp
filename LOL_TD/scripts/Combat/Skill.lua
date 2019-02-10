Skill = {}
Skill.__index = Skill
function Skill:New(owner, id)
    local newSkill = {}
    local name = FilterStringColor(GetObjectName(id))
    setmetatable(newSkill, { __index = Skills[name] })

    newSkill.Owner = owner
    newSkill.Id = id
    newSkill.Order = Slk.ability[id]["Order"]
    newSkill.MaxLevel = tonumber(Slk.ability[id]["levels"])
    local index = 0
    --self.Cools slk优化后只获取到了4级数据
    for i = 1, newSkill.MaxLevel do
        index = i > 4 and 4 or i
        table.insert(newSkill.Cools, tonumber(Slk.ability[id]["Cool" .. index]))
        table.insert(newSkill.Rngs, tonumber(Slk.ability[id]["Rng" .. index]))
        table.insert(newSkill.Areas, tonumber(Slk.ability[id]["Area" .. index]))
        table.insert(newSkill.Durs, tonumber(Slk.ability[id]["Dur" .. index]))
        table.insert(newSkill.HeroDurs, tonumber(Slk.ability[id]["HeroDur" .. index]))
    end
    newSkill:UpdateCD()
    return newSkill
end

function Skill:OnSpell()
    if (self.IsSpell) then
        self:OnFinish()
    end
    self.TimeDt = 0
    self.IsSpell = true
    self.SpellTime = GameScene.Elapsed
    self:OnCast()
end

function Skill:OnFinish()
    self.TimeDt = 0
    self.IsSpell = false
    self.CurAction = nil
    self:OnRemove()
end

function Skill:OnGameUpdate(dt)
    if (self.IsSpell == false) then
        return
    end

    if (self.CurAction ~= nil) then
        self.CurAction(self, dt)
    else
        local dur = self.Durs[self:GetCurLevel()]
        if (dur ~= nil and dur > 0) then
            self.TimeDt = self.TimeDt + dt
            if (self.TimeDt > dur) then
                self:OnFinish()
            end
        else
            self:OnFinish()
        end
    end
end

function Skill:OnSpellChannel()
end

function Skill:OnCast()
end

function Skill:OnLearned()
end

function Skill:OnBeginAttack(attactUnit, defUnit)
end

function Skill:OnAttack(attactUnit, defUnit, isCrit)
end

function Skill:OnKill(dieUnit)
end

function Skill:OnRemove()
end

function Skill:UpdateCD()
    for i = 1, self.MaxLevel do
        if (self.Cools[i] ~= nil and self.Cools[i] > 0) then
            EXSetAbilityDataReal(
            EXGetUnitAbility(self.Owner.Entity, self.Id),
            i,
            ABILITY_DATA_COOL,
            self.Cools[i] - self.Cools[i] * self.Owner.Attribute:get("冷却缩减")
            )
        end
    end
end

function Skill:IsCD()
    return self:GetCurCd() > 0
end

function Skill:GetBeginCD()
    local cool = self.Cools[self:GetCurLevel()]
    local cooldown = self.Owner.Attribute:get("冷却缩减")
    return cool - cool * cooldown
end

function Skill:GetCurCd()
    return EXGetAbilityState(EXGetUnitAbility(self.Owner.Entity, self.Id), ABILITY_STATE_COOLDOWN)
end

function Skill:SubCD(value)
    if (self:IsCD()) then
        local abilityCode = EXGetUnitAbility(self.Owner.Entity, self.Id)
        EXSetAbilityState(abilityCode, ABILITY_STATE_COOLDOWN, self:GetCurCd() - value)
    end
end

function Skill:GetStack()
    return self.Stack
end

function Skill:SetStack(value)
    if (value < 0) then
        return
    end
    self.Stack = value
    local newArt = self.Id .. value .. ".blp"
    EXBlendButtonIcon("blend\\stack_" .. self.Stack .. ".blp", self.StackArt, newArt)
    EXSetAbilityDataString(EXGetUnitAbility(self.Owner.Entity, self.Id), 1, ABILITY_DATA_ART, newArt)
end

function Skill:GetCurLevel()
    return Misc.Clamp(GetUnitAbilityLevel(self.Owner.Entity, self.Id), 1, 100)
end

function Skill:GetCurRange()
    if (self.Rngs ~= nil) then
        return self.Rngs[self:GetCurLevel()] or self.Rngs[1]
    end
    return 500
end

Skills = setmetatable(
{},
{
    __index = function(self, name)
        self[name] = {}
        setmetatable(self[name], { __index = Skill })
        self[name].Name = name
        self[name].SkillType = -1 -- -1被动 0无目标 1单位目标(远) 2点目标 3点范围 4单位目标(近)
        self[name].Stack = -1 --库存
        self[name].Cools = {} --冷却时间
        self[name].Rngs = {} --施法距离
        self[name].Areas = {} --影响区域
        self[name].Durs = {} --持续时间
        self[name].HeroDurs = {} --持续时间
        self[name].IsSpell = false
        self[name].TimeDt = 0
        self[name].SpellTime = 0
        return self[name]
    end
}
)