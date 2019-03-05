local skill = Skills["轻盈之花"]
skill.Art = "XD_GH01.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.ghEffect ~= nil) then
        DestroyEffect(spellUnit.ghEffect)
    end
    spellUnit.ghEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "origin")
end
function skill:OnLearned()
    local spellUnit = self.Owner
    if (GetPlayerTechResearched(spellUnit.Player, GetId("R006"), true)) then
        spellUnit:AddSkill("sp01")
    end
end

skill = Skills["五行之轮"]
skill.Effect = nil
skill.Art = "[AKE]war3AKE.com - 2742654800546824576218397.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.ghEffect ~= nil) then
        DestroyEffect(spellUnit.ghEffect)
    end
    spellUnit.ghEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "origin")
end
function skill:OnLearned()
    local spellUnit = self.Owner
    if (GetPlayerTechResearched(spellUnit.Player, GetId("R007"), true)) then
        spellUnit:AddSkill("sp02")
    end
end

skill = Skills["绿意怏然"]
skill.Effect = nil
skill.Art = "MadicalAura.mdl"
--skill.Art = "midchildernanohaaura.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.ghEffect ~= nil) then
        DestroyEffect(spellUnit.ghEffect)
    end
    spellUnit.ghEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "origin")
end
function skill:OnLearned()
    local spellUnit = self.Owner
    if (GetPlayerTechResearched(spellUnit.Player, GetId("R013"), true)) then
        spellUnit:AddSkill("sp04")
    end
end

skill = Skills["幻天旋地"]
skill.Effect = nil
skill.Art = "fuwen01a.mdl"
function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.ghEffect ~= nil) then
        DestroyEffect(spellUnit.ghEffect)
    end
    spellUnit.ghEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "origin")
end
function skill:OnLearned()
    local spellUnit = self.Owner
    if (GetPlayerTechResearched(spellUnit.Player, GetId("R014"), true)) then
        spellUnit:AddSkill("sp05")
    end
end

skill = Skills["凤求凰"]
skill.Effect = nil
skill.Art = "war3mapImported\\RedBird.mdl"
function Skill:OnSpell()
    self.TimeDt = 0
    self.IsSpell = true
    self.SpellTime = GameScene.Elapsed
    self:OnCast()
end

function skill:OnCast()
    local spellUnit = self.Owner
    if (spellUnit.ghEffect ~= nil) then
        DestroyEffect(spellUnit.ghEffect)
    end
    spellUnit.ghEffect = AddSpecialEffectTarget(self.Art, spellUnit.Entity, "origin")
end
function skill:OnLearned()
    local spellUnit = self.Owner
    if (GetPlayerTechResearched(spellUnit.Player, GetId("R019"), true)) then
        spellUnit:AddSkill("sp03")
        spellUnit:AddSkill("sp06")
        self.IsSpell = true
        self.CurAction = self.Action
    end
end
skill.Action = function(self, dt)
    self.TimeDt = self.TimeDt + dt
    if (self.TimeDt >= 5) then
        self.TimeDt = 0
        local unit = self.Owner
        SetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(unit.Player, PLAYER_STATE_RESOURCE_GOLD) + 3)
        CreateGoldText(3, unit.Entity)
    end
end