local skill = Skills["种蘑菇"]
skill.SkillType = 3

setmetatable(Buffs["蘑菇减少移速"], { __index = Buffs["移速"] })
Buffs["蘑菇减少移速"].values = {-0.3, -0.3, -0.3, -0.3, -0.3, -0.3 }
Buffs["蘑菇减少移速"].Durs = { 4, 4, 4, 4, 4, 4 }

setmetatable(Buffs["蘑菇毒"], { __index = Buffs["灼烧"] })
local buff = Buffs["蘑菇毒"]
buff.Interval = 1
buff.Art = "Abilities\\Weapons\\PoisonSting\\PoisonStingTarget.mdl"
buff.values = { 0, 0, 0, 0, 0, 0 }
buff.Durs = { 4, 4, 4, 4, 4, 4 }
buff.MaxStack = 1
buff.Damages1 = { 75, 100, 125, 150, 175, 200 }
buff.Damages2 = { 0.5, 0.7, 0.9, 1.1, 1.3, 1.5 }

function buff.Action(self, dt)
    self.IntervalDt = self.IntervalDt - dt
    if (self.IntervalDt <= 0) then
        self.IntervalDt = self.Interval

        local owner = self.Owner
        local attactUnit = self.AttactUnit
        local ap = attactUnit.Attribute:get("法术攻击")
        local damage = self.Damages1[self.Level] + ap * self.Damages2[self.Level]
        local comb1 = attactUnit:GetComb("提百万-纳什之牙")
        local comb2 = attactUnit:GetComb("提百万+冰杖")
        if ((comb1 ~= nil and comb1.Enable) or (comb2 ~= nil and comb2.Enable)) then
            damage = damage * 2
        end
        EXUnitDamageTarget(attactUnit, owner, damage, EXAbilityType.Magic_Ability)
    end
end

function skill:OnCast()
    local spellUnit = self.Owner
    local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq13", GetSpellTargetX(), GetSpellTargetY())
    dummy.Owner = self.Owner
    dummy.Skill = self
    UnitApplyTimedLife(dummy.Entity, 'BHwe', 60)
end

function skill:OnRemove()

end
--[[Researchubertip = "使用一个储存的蘑菇来投掷一个陷阱，如果被敌人踩到，陷阱会爆炸，
将毒散发到附近的敌人身上，减缓他们的移动速度，并在4秒里持续造成法术伤害。每个蘑菇最多持续60s。
每10s。回复一个蘑菇。最多可储存5个蘑菇。消耗60点蓝量。
|n1级：减缓10%移速。造成70+0.5*法术攻击的法术伤害.
|n2级：减缓10%移速。造成90+0.5*法术攻击的法术伤害.
|n3级：减缓10%移速。造成120+0.5*法术攻击的法术伤害.
|n4级：减缓10%移速。造成140+0.5*法术攻击的法术伤害.
|n5级：减缓10%移速。造成180+0.5*法术攻击的法术伤害.
|n6级：减缓10%移速。造成220+0.5*法术攻击的法术伤害."
]]