--参数
local mSpeed = 15
local mDistance = 1000
local mMaxDistance = 1000
local mRange = 300
local mDamages = { 100, 200, 300, 500, 800, 1000 }
local mDamages1 = { 50, 100, 200, 400, 600, 800 }
local mDamages2 = { 0.6, 0.6, 0.6, 0.6, 0.6, 0.6 }
local mDummyArt = "Abilities\\Spells\\NightElf\\Immolation\\ImmolationTarget.mdl"
local mTargetArt = "Abilities\\Spells\\NightElf\\Immolation\\ImmolationTarget.mdl"
local mSpecialArt = "Abilities\\Spells\\NightElf\\Immolation\\ImmolationDamage.mdl"
skill.Interval = 0.1
skill.IntervalDt = 0
skill.DamageList = nil

--创建万能马甲
self.dummy = spellUnit:CreateDummy("", spellUnit:X(), spellUnit:Y())

--创建马甲
self.dummy = spellUnit:CreateDummy(
"Abilities\\Weapons\\BloodElfSpellThiefMISSILE\\BloodElfSpellThiefMISSILE.mdl",
spellUnit:X(),
spellUnit:Y()
)
--创建运动马甲
local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
dummy.Effect = AddSpecialEffectTarget(mDummyArt, dummy.Entity, "origin")
local angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
dummy:SetUnitFacing(angle)
dummy.Owner = spellUnit
dummy.Skill = self

--创建运动
local loc = dummy:AddLocomotion("冲锋")
if (loc ~= nil) then
    loc:Start2(angle, mSpeed, mMaxDistance, self.OnPathEnd, self.OnPathUpdate)
end

--buff
local buff = Buffs["耀光"]
buff.values = { 2, 2, 2, 2, 2, 2 }
buff.Durs = { 2, 2, 2, 2, 2, 2 }
unit:AddBuff("耀光")
unit:RemoveBuff("耀光")

--特效
DestroyEffect(
AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", unit.Entity, "chest")
)

DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", dummy:X(), dummy:Y()))

AssetsManager.OverlapCircle(
u:X(),
u:Y(),
mRange,
function(unit)
end
)

--属性
unit.Attribute:add("物理攻击加成", 15)
local ad = spellUnit.Attribute:get("物理攻击") + spellUnit.Attribute:get("物理攻击加成")
local ap = spellUnit.Attribute:get("法术攻击")
local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
--伤害
EXUnitDamageTarget(self.Owner, unit, damage, EXDamageType.Physics)



local SR1 = [[
造成120+0.5*法术攻击的法术伤害。消耗20点蓝量，CD8s|r",
造成240+0.6*法术攻击的法术伤害。消耗30点蓝量，CD8s|r",
造成360+0.7*法术攻击的法术伤害。消耗40点蓝量，CD8s|r",
造成480+0.8*法术攻击的法术伤害。消耗50点蓝量，CD8s|r",
造成600+0.9*法术攻击的法术伤害。消耗60点蓝量，CD8s|r",
造成720+1.0*法术攻击的法术伤害。消耗70点蓝量，CD8s|r",
]]
local SSR1 = [[
造成150+0.5*法术攻击的法术伤害。消耗20点蓝量，CD8s|r",
造成300+0.7*法术攻击的法术伤害。消耗30点蓝量，CD8s|r",
造成450+0.9*法术攻击的法术伤害。消耗40点蓝量，CD8s|r",
造成600+1.1*法术攻击的法术伤害。消耗50点蓝量，CD8s|r",
造成750+1.3*法术攻击的法术伤害。消耗60点蓝量，CD8s|r",
造成900+1.5*法术攻击的法术伤害。消耗70点蓝量，CD8s|r",
]]

local SR2 = [[
"造成150+1.0*物理攻击的物理伤害。消耗20点蓝量，CD5s|r",
"造成300+1.3*物理攻击的物理伤害。消耗30点蓝量，CD5s|r",
"造成450+1.6*物理攻击的物理伤害。消耗40点蓝量，CD5s|r",
"造成600+1.9*物理攻击的物理伤害。消耗50点蓝量，CD5s|r",
"造成750+2.2*物理攻击的物理伤害。消耗60点蓝量，CD5s|r",
"造成900+2.5*物理攻击的物理伤害。消耗70点蓝量，CD5s|r",
]]

local SSR2 = [[
200+1.0*法术攻击的法术伤害。耗蓝20点。CD5s。|r",
400+1.4*法术攻击的法术伤害。耗蓝30点。CD5s。|r",
600+1.8*法术攻击的法术伤害。耗蓝40点。CD5s。|r",
800+2.2*法术攻击的法术伤害。耗蓝50点。CD5s。|r",
1000+2.6*法术攻击的法术伤害。耗蓝60点。CD5s。|r",
1200+3.0*法术攻击的法术伤害。耗蓝70点。CD5s。|r",
]]

local SR3 = [[
造成200+2.0*法术攻击的法术伤害。耗蓝50点。CD10s。|r",
造成400+2.5*法术攻击的法术伤害。耗蓝60点。CD10s。。|r",
造成600+3.0*法术攻击的法术伤害。耗蓝70点。CD10s。|r",
造成800+3.5*法术攻击的法术伤害。耗蓝80点。CD10s。|r",
造成1000+4.0*法术攻击的法术伤害。耗蓝100点。CD10s。|r",
造成1200+4.5*法术攻击的法术伤害。耗蓝120点。CD10s。|r",
]]

local SSR3 = [[
造成300+2.0*法术攻击的法术伤害。消耗80点蓝量。|r",
造成600+2.6*法术攻击的法术伤害。消耗90点蓝量。|r",
造成900+3.2*法术攻击的法术伤害。消耗100点蓝量。|r",
造成1200+3.8*法术攻击的法术伤害。消耗110点蓝量。|r",
造成1500+4.4*法术攻击的法术伤害。消耗120点蓝量。|r",
造成1800+5.0*法术攻击的法术伤害。消耗130点蓝量。|r",
]]