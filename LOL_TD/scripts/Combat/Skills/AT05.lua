local skill = Skills["进阶天赋随机"]
skill.Count = 0
skill.Init = false
function skill:Initialize()
    self.AdList = {
        { "AT8A", "AT8B", "AT8C", "AT8S" }, --物理穿透
        { "ATAA", "ATAB", "ATAC", "ATAS" }, --暴击伤害
        { "ATBA", "ATBB", "ATBC", "ATBS" }, --技能冷却缩减
        --    {"ATCA", "ATCB", "ATCC", "ATCS"}, --杀怪加钱点
        { "ATDA", "ATDB", "ATDC", "ATDS" }, --每杀1个怪加1点物理攻击（最高100点）
        { "ATFA", "ATFB", "ATFC", "ATFS" } --物理穿透和法术穿透
    }
    self.ApList = {
        { "AT9A", "AT9B", "AT9C", "AT9S" }, --法术穿透
        { "ATBA", "ATBB", "ATBC", "ATBS" }, --技能冷却缩减
        --    {"ATCA", "ATCB", "ATCC", "ATCS"}, --杀怪加钱点
        { "ATEA", "ATEB", "ATEC", "ATES" }, --每杀1个怪加1点法术攻击（最高100点）
        { "ATFA", "ATFB", "ATFC", "ATFS" } --物理穿透和法术穿透
    }
    self.AdNApList = {
        { "AT8A", "AT8B", "AT8C", "AT8S" }, --物理穿透
        { "AT9A", "AT9B", "AT9C", "AT9S" }, --法术穿透
        { "ATAA", "ATAB", "ATAC", "ATAS" }, --暴击伤害
        { "ATBA", "ATBB", "ATBC", "ATBS" }, --技能冷却缩减
        --   {"ATCA", "ATCB", "ATCC", "ATCS"}, --杀怪加钱点
        { "ATDA", "ATDB", "ATDC", "ATDS" }, --每杀1个怪加1点物理攻击（最高100点）
        { "ATEA", "ATEB", "ATEC", "ATES" }, --每杀1个怪加1点法术攻击（最高100点）
        { "ATFA", "ATFB", "ATFC", "ATFS" } --物理穿透和法术穿透
    }
    self.Init = true
end

function skill:OnCast()
    if (self.Init == false) then
        self:Initialize()
    end
    local owner = self.Owner
    local SelectUnit = owner.SelectUnit
    local id, index
    if (SelectUnit.TianFuType == 1) then
        index = math.random(1, #self.AdList)
        id = self.AdList[index][math.random(1, 4)]
    elseif (SelectUnit.TianFuType == 2) then
        index = math.random(1, #self.ApList)
        id = self.ApList[index][math.random(1, 4)]
    else
        index = math.random(1, #self.AdNApList)
        id = self.AdNApList[index][math.random(1, 4)]
    end
    owner:AddSkill(id)
    self.Count = self.Count + 1
    if (self.Count >= 2) then
        owner:RemoveSkill("AT05")
    else
        if (GetUnitLevel(SelectUnit.Entity) < 16) then
            owner:RemoveSkill("AT05")
            owner:AddSkill("AZ05")
        end
    end
end