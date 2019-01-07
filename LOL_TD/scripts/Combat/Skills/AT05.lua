local skill = Skills["进阶天赋随机"]
skill.Count = 0
skill.Init = false
function skill:Initialize()
    local owner = self.Owner
    owner.AdList2 = {
        { "AT8A", "AT8B", "AT8C", "AT8S" }, --物理穿透
        { "ATAA", "ATAB", "ATAC", "ATAS" }, --暴击伤害
        { "ATBA", "ATBB", "ATBC", "ATBS" }, --技能冷却缩减
        --    {"ATCA", "ATCB", "ATCC", "ATCS"}, --杀怪加钱点
        { "ATDA", "ATDB", "ATDC", "ATDS" }, --每杀1个怪加1点物理攻击（最高100点）
        { "ATFA", "ATFB", "ATFC", "ATFS" } --物理穿透和法术穿透
    }
    owner.ApList2 = {
        { "AT9A", "AT9B", "AT9C", "AT9S" }, --法术穿透
        { "ATBA", "ATBB", "ATBC", "ATBS" }, --技能冷却缩减
        --    {"ATCA", "ATCB", "ATCC", "ATCS"}, --杀怪加钱点
        { "ATEA", "ATEB", "ATEC", "ATES" }, --每杀1个怪加1点法术攻击（最高100点）
        { "ATFA", "ATFB", "ATFC", "ATFS" } --物理穿透和法术穿透
    }
    owner.AdNApList2 = {
        { "AT8A", "AT8B", "AT8C", "AT8S" }, --物理穿透
        { "AT9A", "AT9B", "AT9C", "AT9S" }, --法术穿透
        { "ATAA", "ATAB", "ATAC", "ATAS" }, --暴击伤害
        { "ATBA", "ATBB", "ATBC", "ATBS" }, --技能冷却缩减
        --   {"ATCA", "ATCB", "ATCC", "ATCS"}, --杀怪加钱点
        { "ATDA", "ATDB", "ATDC", "ATDS" }, --每杀1个怪加1点物理攻击（最高100点）
        { "ATEA", "ATEB", "ATEC", "ATES" }, --每杀1个怪加1点法术攻击（最高100点）
        { "ATFA", "ATFB", "ATFC", "ATFS" } --物理穿透和法术穿透
    }
    owner.Init2 = true
end

function skill:OnCast()
    local owner = self.Owner
    if (owner.Init2 == nil) then
        self:Initialize()
    end
    local SelectUnit = owner.SelectUnit
    local id, index
    if (SelectUnit.TianFuType == 1) then
        index = math.random(1, #owner.AdList2)
        id = owner.AdList2[index][math.random(1, 4)]
        table.remove(owner.AdList2, index)
    elseif (SelectUnit.TianFuType == 2) then
        index = math.random(1, #owner.ApList2)
        id = owner.ApList2[index][math.random(1, 4)]
        table.remove(owner.ApList2, index)
    else
        index = math.random(1, #owner.AdNApList2)
        id = owner.AdNApList2[index][math.random(1, 4)]
        table.remove(owner.AdNApList2, index)
    end
    owner:AddSkill(id)
    self.Count = self.Count + 1
    if (self.Count >= 2) then
        owner:RemoveSkill(GetId("AT05"))
    else
        if (GetUnitLevel(SelectUnit.Entity) < 16) then
            owner:RemoveSkill(GetId("AT05"))
            owner:AddSkill("AZ05")
        end
    end
end