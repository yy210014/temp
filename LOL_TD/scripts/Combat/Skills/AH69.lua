local skill = Skills["影奥义！分身"]
skill.SkillType = 2
skill.Durs = { 15, 15, 15, 15, 15, 15 }
local mRegenMana = { 25, 30, 35, 40, 15, 50 }
function skill:OnCast()
    local spellUnit = self.Owner
    --创建运动马甲
    self.dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq06", GetSpellTargetX(), GetSpellTargetY())
    self.dummy:AddSkill("AH68")
    self.dummy:AddSkill("AH70")
    self.dummy.Owner = spellUnit
    self.dummy.Skill = self
end

function skill:OnRemove()
    AssetsManager.DestroyObject(self.dummy)
    self.dummy = nil
end

--[[Researchubertip = "被动：当劫和他的影分身用相同技能击中一名敌方时，劫会回复能量。每次施放技能只会回复一次能量。
|n主动：劫的影分身向前突进，并在一个地方维持5秒。
|n1级：回复25点能量，消耗100点能量，CD15s
|n2级：回复30点能量，消耗90点能量，CD14s
|n3级：回复35点能量，消耗80点能量，CD13s
|n4级：回复40点能量，消耗70点能量，CD12s
|n5级：回复45点能量，消耗60点能量，CD11s
|n6级：回复50点能量，消耗50点能量，CD10s"]]