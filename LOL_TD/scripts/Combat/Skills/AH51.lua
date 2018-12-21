local skill = Skills["战斗狂怒"]
skill.Crits = {0.005, 0.01, 0.015, 0.02, 0.025, 0.03}
skill.Attacks = {2, 4, 6, 8, 10, 12}
skill.CurCrit = 0
function skill:OnCast()
end

skill.OnCrit = function(attactUnit, defUnit)
    attactUnit.Attribute:add("怒气值", 5)
end

skill.OnManaChange = function(owner, value)
    local self = owner:GetSkill(GetId("AH51"))
    if (self == nil) then
        return
    end
    local crit = Lerp(0, 0.1 * self.Crits[self:GetCurLevel()], value)
    local attack = Lerp(0, 0.1 * self.Attacks[self:GetCurLevel()], value)
    self.CurCrit = Clamp(self.CurCrit + crit, 0, self.Crits[self:GetCurLevel()] * 100)
    --Game.Log("value: " .. value .. " , crit: " .. crit .. ", attack: " .. attack)
    ------------------value: 5.0 , crit: 0.0025, attack: 1.0---------------------
    ------------------value: -0.16 , crit: -8, attack: -0.032---------------------
    owner.Attribute:add("暴击", crit)
    owner.Attribute:add("物理攻击加成", attack)
end

function skill:OnLearned()
    local owner = self.Owner
    local crit = owner.Attribute:get("怒气值") * 0.1 * self.Crits[self:GetCurLevel()]
    local attack = owner.Attribute:get("怒气值") * 0.1 * self.Attacks[self:GetCurLevel()]
    owner.Attribute:add("暴击", crit)
    owner.Attribute:add("物理攻击加成", attack)
end

function skill:OnKill(dieUnit)
    self.Owner.Attribute:add("怒气值", 5)
end

--GameEventProc.RegisterEventHandler("任意单位暴击", skill.OnCrit)
--GameEventProc.RegisterEventHandler("任意单位怒气值改变", skill.OnManaChange)

local a =
    [["泰达米尔每次攻击、暴击或击杀都能获得5点怒气。怒气每秒损失1点。
|n每10点怒气增加他的暴击几率. 每10点怒气额外增加攻击力|n1级：每10点怒气增加0.5%暴击率。增加2点攻击
|n2级：每10点怒气增加1.0%暴击率。增加3点攻击
|n3级：每10点怒气增加1.5%暴击率。增加4点攻击
|n4级：每10点怒气增加2.0%暴击率。增加5点攻击
|n5级：每10点怒气增加2.5%暴击率。增加6点攻击
|n6级：每10点怒气增加3.0%暴击率。增加8点攻击"]]
