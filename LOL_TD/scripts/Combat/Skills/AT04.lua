local skill = Skills["初级天赋随机"]
skill.Count = 0
skill.Init = false
function skill:Initialize()
    local owner = self.Owner
    owner.AdList1 = {
        { "AT0A", "AT0B", "AT0C", "AT0S" }, --物理攻击
        { "AT2A", "AT2B", "AT2C", "AT2S" }, --攻速
        { "AT5A", "AT5B", "AT5C", "AT5S" }, --攻击距离
        { "AT7A", "AT7B", "AT7C", "AT7S" }, --物理攻击和法术攻击
        --{ "ATHA", "ATHB", "ATHC", "ATHS" }, --屠龙
        { "AT4A", "AT4B", "AT4C", "AT4S" }, --蓝量回复
    --  {"AT6A", "AT6B", "AT6C", "AT6S"}, --经验获取
    }
    owner.ApList1 = {
        { "AT1A", "AT1B", "AT1C", "AT1S" }, --法术攻击
        { "AT3A", "AT3B", "AT3C", "AT3S" }, --蓝量
        { "AT7A", "AT7B", "AT7C", "AT7S" }, --物理攻击和法术攻击
        --{ "ATHA", "ATHB", "ATHC", "ATHS" }, --屠龙
        { "AT4A", "AT4B", "AT4C", "AT4S" }, --蓝量回复
    --{"AT5A", "AT5B", "AT5C", "AT5S"}, --攻击距离
    --  {"AT6A", "AT6B", "AT6C", "AT6S"}, --经验获取
    }

    owner.AdNApList1 = {
        { "AT2A", "AT2B", "AT2C", "AT2S" }, --攻速
        { "AT5A", "AT5B", "AT5C", "AT5S" }, --攻击距离
        { "AT7A", "AT7B", "AT7C", "AT7S" }, --物理攻击和法术攻击
        --{ "ATHA", "ATHB", "ATHC", "ATHS" }, --屠龙
        { "AT4A", "AT4B", "AT4C", "AT4S" }, --蓝量回复
    --{"AT1A", "AT1B", "AT1C", "AT1S"}, --法术攻击
    --{"AT3A", "AT3B", "AT3C", "AT3S"}, --蓝量
    --   {"AT6A", "AT6B", "AT6C", "AT6S"}, --经验获取
    }
    owner.Init1 = true
end


function skill:OnCast()
    local owner = self.Owner
    if (owner.Init1 == nil) then
        self:Initialize()
    end
    local SelectUnit = owner.SelectUnit
    local id, index
    if (SelectUnit.TianFuType == 1) then
        index = math.random(1, SelectUnit.ManaType == 0 and #owner.AdList1 or #owner.AdList1 - 1)
        id = owner.AdList1[index][math.random(1, 4)]
        table.remove(owner.AdList1, index)
    elseif (SelectUnit.TianFuType == 2) then
        index = math.random(1, SelectUnit.ManaType == 0 and #owner.ApList1 or #owner.ApList1 - 1)
        id = owner.ApList1[index][math.random(1, 4)]
        table.remove(owner.ApList1, index)
    else
        index = math.random(1, SelectUnit.ManaType == 0 and #owner.AdNApList1 or #owner.AdNApList1 - 1)
        id = owner.AdNApList1[index][math.random(1, 4)]
        table.remove(owner.AdNApList1, index)
    end
    owner:AddSkill(id)
    self.Count = self.Count + 1
    if (self.Count >= 2) then
        owner:RemoveSkill(GetId("AT04"))
    else
        if (GetUnitLevel(SelectUnit.Entity) < 6) then
            owner:RemoveSkill(GetId("AT04"))
            owner:AddSkill("AX04")
        end
    end
end

function skill:OnLearned()
    local owner = self.Owner
    local SelectUnit = owner.SelectUnit
end