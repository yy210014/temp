local skill = Skills["终极闪光"]
skill.SkillType = 2
skill.KillCount = 0
local mDamages1 = {300, 550, 800, 1000, 1250, 1500}
local mDamages2 = {0.5, 1, 1.5, 2, 2.5, 3}
local mDistance = 2100
local mDamageRange = 250
local EmitterDis = 100

function skill:OnSpellChannel()
    local spellUnit = self.Owner
    local angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    local offX = 50 * math.cos(angle)
    local offY = 50 * math.sin(angle)
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq11", spellUnit:X() + offX, spellUnit:Y() + offY)
    dummy:SetUnitFacing(angle)
    AssetsManager.RemoveObject(dummy)
end

function skill:OnCast()
    local spellUnit = self.Owner
    local angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
    local offX = 50 * math.cos(angle)
    local offY = 50 * math.sin(angle)
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq09", spellUnit:X(), spellUnit:Y())
    dummy:SetUnitFacing(angle)
    dummy.Owner = spellUnit
    AssetsManager.RemoveObject(dummy)
    local dummy2 = AssetsManager.LoadUnit(spellUnit.Player, "uq10", spellUnit:X() + offX, spellUnit:Y() + offY)
    dummy2:SetUnitFacing(angle)
    dummy2.Owner = spellUnit
    AssetsManager.RemoveObject(dummy2)

    self.KillCount = 0
    local comb = spellUnit:GetComb("拉克丝-鬼书")
    AssetsManager.OverlapLine(
        spellUnit:X(),
        spellUnit:Y(),
        mDistance,
        mDamageRange,
        angle,
        function(unit)
            --特效
            DestroyEffect(
                AddSpecialEffectTarget(
                    "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",
                    unit.Entity,
                    "chest"
                )
            )
            --伤害
            local ap = spellUnit.Attribute:get("法术攻击")
            local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
            if (comb ~= nil and comb.Enable) then
                damage = damage + damage * 0.3
            end
            EXUnitDamageTarget(spellUnit, unit, damage, EXDamageType.Magic)
        end
    )
end

function skill:OnKill(dieUnit)
    if (self.KillCount < 8) then
        self.KillCount = self.KillCount + 1
    end
end

function skill:OnRemove()
    if (self.KillCount >= 8) then
        self:SubCD(self:GetBeginCD() * 0.5)
    end
    self.KillCount = 0
end
