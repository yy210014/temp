
local skill = Skills["红炎翅膀"]
skill.Art= "zscb.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.cbEffect ~= nil) then
        DestroyEffect(spellUnit.cbEffect)
    end
    spellUnit.cbEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest")
end
function skill:OnLearned()
    local spellUnit =self.Owner
    if(GetPlayerTechResearched(spellUnit.Player,GetId("R008") ,true ))then
        spellUnit:AddSkill("sp07")
    end
end

skill = Skills["暗紫翅膀"]
skill.Art = "cb.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.cbEffect ~= nil) then
        DestroyEffect(spellUnit.cbEffect)
    end
    spellUnit.cbEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest")
end

skill = Skills["炫紫羽翼"]
skill.Art = "a.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.cbEffect ~= nil) then
        DestroyEffect(spellUnit.cbEffect)
    end
    spellUnit.cbEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest")
end
function skill:OnLearned()
    local spellUnit =self.Owner
    if(GetPlayerTechResearched(spellUnit.Player,GetId("R015") ,true ))then
        spellUnit:AddSkill("sp08")
    end
end

skill = Skills["灵光蝶羽"]
skill.Art = "cb (3).mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.cbEffect ~= nil) then
        DestroyEffect(spellUnit.cbEffect)
    end
    spellUnit.cbEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest")
end

skill = Skills["蔚蓝蝶羽"]
skill.Art = "cb (2).mdl"
function Skill:OnSpell()
    self.TimeDt = 0
    self.IsSpell = true
    self.SpellTime = GameScene.Elapsed
    self:OnCast()
end
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.cbEffect ~= nil) then
        DestroyEffect(spellUnit.cbEffect)
    end
    spellUnit.cbEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "chest")
end
function skill:OnLearned()
    local spellUnit =self.Owner
    if(GetPlayerTechResearched(spellUnit.Player,GetId("R018") ,true ))then
        spellUnit:AddSkill("sp09")
        self.IsSpell = true
        self.CurAction = self.Action
    end
end

skill.Action = function(self, dt)
    self.TimeDt = self.TimeDt + dt
    if (self.TimeDt >= 5) then
        self.TimeDt = 0
        local unit = self.Owner
        --模拟经验
        local units = GetPlayerTeamUnits(GetPlayerId(unit.Player))
        for i = 1, #units do
            if IsUnitType(units[i].Entity, UNIT_TYPE_HERO) then
                if (GetUnitLevel(units[i].Entity) < 18 or units[i].CombEnableCount >= 3) then
                    if (Game.GetMode() ~= GameMode.ENDLESS) then
                        AddHeroXP(units[i].Entity, 2, false)
                    end
                end
            end
        end
    end
end