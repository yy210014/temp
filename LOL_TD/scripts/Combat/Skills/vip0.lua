local skill = Skills["VIP"]
skill.IntervalDt = 1
function skill:OnLearned()
    local spellUnit = self.Owner
    local player = spellUnit.Player
    SetPlayerName(player, "[尊贵VIP]" .. GetPlayerName(player))
    AddPlayerTechResearched(player, GetId("R011"), 1)
    UnitAddItem(spellUnit.Entity, CreateItem(GetId("IB03"), spellUnit:X(), spellUnit:Y()))
    self.IsSpell = true
    self.CurAction = self.Action
end

skill.Action = function(self, dt)
    self.TimeDt = self.TimeDt + dt
    if (self.TimeDt >= self.IntervalDt) then
        self.TimeDt = 0
        local spellUnit = self.Owner
        AssetsManager.OverlapCircle(
        spellUnit:X(),
        spellUnit:Y(),
        1000,
        function(unit)
            EXUnitDamageTarget(spellUnit, unit, 20, EXAbilityType.Magic)
        end
        )
    end
end