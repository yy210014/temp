local skill = Skills["日耀"]
skill.SkillType = 3
local mArt1 = "FireNova_Area.mdl"
local mArt2 = "[Sepll]LinaSun _T2_Blast.mdl"

local mDamages1 = 300
local mDelayTime = 0
local mDamageRange = 600

setmetatable(Buffs["日耀减速"], { __index = Buffs["移速"] })
Buffs["日耀减速"].values = {-0.5 }
Buffs["日耀减速"].Durs = { 3 }

setmetatable(Buffs["日耀眩晕"], { __index = Buffs["眩晕"] })
Buffs["日耀眩晕"].Durs = { 1.5 }

function skill:OnCast()
    local spellUnit = self.Owner

    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", GetSpellTargetX(), GetSpellTargetY())
    dummy.Effect = AddSpecialEffectTarget(mArt1, dummy.Entity, "origin")
    SetUnitFlyHeight(dummy.Entity, 80, 0)
    AssetsManager.RemoveObject(dummy)
    DestroyEffect(AddSpecialEffect(mArt2, GetSpellTargetX(), GetSpellTargetY()))
    self.SpellTargetX = GetSpellTargetX()
    self.SpellTargetY = GetSpellTargetY()
    self.CurAction = self.DelayDamage
    self.LastCastTime = GameScene.Elapsed
end

skill.DelayDamage = function(self, dt)
    if (GameScene.Elapsed - self.LastCastTime > mDelayTime) then
        local spellUnit = self.Owner
        AssetsManager.OverlapCircle(
        self.SpellTargetX,
        self.SpellTargetY,
        mDamageRange,
        function(unit)
            unit:AddBuff("日耀减速")
            if (DistanceBetweenPoint(self.SpellTargetX, unit:X(), self.SpellTargetY, unit:Y()) <= 200) then
                unit:AddBuff("日耀眩晕")
            end
            --伤害
            local ap = spellUnit.Attribute:get("法术攻击")
            local damage = mDamages1 + ap
            EXUnitDamageTarget(spellUnit, unit, damage, EXDamageType.Magic)
        end
        )
        self:OnFinish()
    end
end


Ubertip = "召唤一道太阳光束，对600范围内目标造成200+0.3*法术攻击的法术伤害，同时对范围内目标造成50%减速持续3s，并对最中心200范围的目标造成1.5s眩晕。|nCD10s。消耗50点蓝量"