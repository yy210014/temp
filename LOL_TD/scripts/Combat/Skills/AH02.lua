local skill = Skills["回旋之刃"]
skill.SkillType = 2
skill.dummy = nil
skill.DamageList = nil
skill.angle = 0
skill.count = 0

local mSpeed = 15
local mDistance = 1000
local mDamages = {100, 200, 300, 500, 800, 1000}
local mDamageRange = 110

local function Action(self)
    local offX = mSpeed * math.cos(math.rad(self.angle))
    local offY = mSpeed * math.sin(math.rad(self.angle))
    SetUnitX(self.dummy, GetUnitX(self.dummy) + offX)
    SetUnitY(self.dummy, GetUnitY(self.dummy) + offY)
    AssetsManager.IterateEnemyUnits(
        function(unit)
            local dist2 = DistanceBetweenUnits(self.dummy, unit.Entity)
            if (dist2 < mDamageRange and IsInTable(unit, self.DamageList) == -1) then
                local ad = self.Owner.Attribute:get("物理攻击") + self.Owner.Attribute:get("物理攻击加成")
                local ap = self.Owner.Attribute:get("法术攻击")
                local damage = mDamages[self:GetCurLevel()] + (ad * 0.3) + (ap * 0.2)
                local rate = 1 - Misc.Clamp(self.count * 0.15, 0, 0.6)
                damage = damage * rate
                DestroyEffect(
                    AddSpecialEffectTarget(
                        "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",
                        unit.Entity,
                        "chest"
                    )
                )
                EXUnitDamageTarget(self.Owner, unit, damage, EXDamageType.Physics)
                self.DamageList[#self.DamageList + 1] = unit
                self.count = self.count + 1
            end
        end
    )
end

skill.Back = function(self, dt)
    local dist = DistanceBetweenUnits(self.Owner.Entity, self.dummy)
    self.angle = AngleBetweenUnits(self.dummy, self.Owner.Entity)
    if (dist < 10) then
        self:OnFinish()
        return
    end
    Action(self)
end

skill.Out = function(self, dt)
    local dist = DistanceBetweenUnits(self.Owner.Entity, self.dummy)
    if (dist > mDistance) then
        self.DamageList = {}
        self.CurAction = self.Back
    end
    Action(self)
end

function skill:OnCast()
    --local dummy = self.Owner.CreateDummy(GetSpellTargetX(),GetSpellTargetY())
    local spellUnit = self.Owner
    self.DamageList = {}
    self.count = 0
    self.dummy =
        spellUnit:CreateDummy(
        "Abilities\\Weapons\\BloodElfSpellThiefMISSILE\\BloodElfSpellThiefMISSILE.mdl",
        spellUnit:X(),
        spellUnit:Y()
    )
    SetUnitFlyHeight(self.dummy, 80, 99999)
    self.angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    self.CurAction = self.Out
end

function skill:OnRemove()
    RemoveUnit(self.dummy)
    self.dummy = nil
    self.DamageList = nil
end
