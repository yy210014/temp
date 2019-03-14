local skill = Skills["挑战蓝爸爸"]
local function Spawn(self, monsterId, spawnPoint, index)
    local unit = AssetsManager.LoadUnitAtLoc(Player(index + 7), monsterId, spawnPoint)
    unit.PrePoint = spawnPoint
    EXSetUnitCollisionType(true, unit.Entity, 1)
    RemoveGuardPosition(unit.Entity)
    IssuePointOrderLoc(unit.Entity, "move", MonsterRefresh.RectPoints[index])
    unit.Attribute:add("生命上限", self.Owner.TZCount * unit.Attribute:get("生命上限") * (0.2 * Game.GetLevel()))
    unit.Attribute:add("护甲", self.Owner.TZCount * 2.5)
    unit.Attribute:add("生命", unit.Attribute:get("生命上限"))
    unit.Attribute:add("魔法值", unit.Attribute:get("魔法上限"))
    Multiboard.ShowMonsterCount(1, index)
    return unit
end

function skill:OnCast()
    local spellUnit = self.Owner
    local playerId = GetPlayerId(spellUnit.Player)
    local unit = Spawn(self, "Ye01", MonsterRefresh.ChuGuaiKous[playerId + 1], playerId + 1)

    local timer = CreateTimer()
    TimerStart(timer, 40, false, function()
        if (unit.IsDying == false) then
            AssetsManager.DestroyObject(unit)
            Multiboard.ShowMonsterCount(-1)
        end
        DestroyTimer(timer)
    end
    )
    spellUnit:RemoveSkill(self.Id)
    spellUnit.CurSkill = nil
    spellUnit.TZCount = spellUnit.TZCount + 2
end

skill = Skills["挑战红爸爸"]
function skill:OnCast()
    local spellUnit = self.Owner
    local playerId = GetPlayerId(spellUnit.Player)
    local unit = Spawn(self, "Ye02", MonsterRefresh.ChuGuaiKous[playerId + 1], playerId + 1)

    local timer = CreateTimer()
    TimerStart(timer, 40, false, function()
        if (unit.IsDying == false) then
            AssetsManager.DestroyObject(unit)
            Multiboard.ShowMonsterCount(-1)
        end
        DestroyTimer(timer)
    end
    )
    spellUnit:RemoveSkill(self.Id)
    spellUnit.CurSkill = nil
    spellUnit.TZCount = spellUnit.TZCount + 2
end

skill = Skills["挑战河蟹"]
function skill:OnCast()
    local spellUnit = self.Owner
    local playerId = GetPlayerId(spellUnit.Player)
    local unit = Spawn(self, "ye03", MonsterRefresh.ChuGuaiKous[playerId + 1], playerId + 1)

    local timer = CreateTimer()
    TimerStart(timer, 40, false, function()
        if (unit.IsDying == false) then
            AssetsManager.DestroyObject(unit)
            Multiboard.ShowMonsterCount(-1)
        end
        DestroyTimer(timer)
    end
    )
    spellUnit:RemoveSkill(self.Id)
    spellUnit.CurSkill = nil
    spellUnit.TZCount = spellUnit.TZCount + 2
end