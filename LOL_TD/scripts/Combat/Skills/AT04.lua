local skill = Skills["基础天赋随机"]
skill.Count = 0
skill.Init = false
function skill:Initialize()
    self.AdList = {
        {"AT0A", "AT0B", "AT0C", "AT0S"}, --物理攻击
        {"AT2A", "AT2B", "AT2C", "AT2S"}, --攻速
        {"AT4A", "AT4B", "AT4C", "AT4S"}, --蓝量回复
        {"AT5A", "AT5B", "AT5C", "AT5S"}, --攻击距离
        --  {"AT6A", "AT6B", "AT6C", "AT6S"}, --经验获取
        {"AT7A", "AT7B", "AT7C", "AT7S"} --物理攻击和法术攻击
    }
    self.ApList = {
        {"AT1A", "AT1B", "AT1C", "AT1S"}, --法术攻击
        {"AT3A", "AT3B", "AT3C", "AT3S"}, --蓝量
        {"AT4A", "AT4B", "AT4C", "AT4S"}, --蓝量回复
        {"AT5A", "AT5B", "AT5C", "AT5S"}, --攻击距离
        --  {"AT6A", "AT6B", "AT6C", "AT6S"}, --经验获取
        {"AT7A", "AT7B", "AT7C", "AT7S"} --物理攻击和法术攻击
    }
    self.AdNApList = {
        {"AT1A", "AT1B", "AT1C", "AT1S"}, --法术攻击
        {"AT2A", "AT2B", "AT2C", "AT2S"}, --攻速
        {"AT3A", "AT3B", "AT3C", "AT3S"}, --蓝量
        {"AT4A", "AT4B", "AT4C", "AT4S"}, --蓝量回复
        {"AT5A", "AT5B", "AT5C", "AT5S"}, --攻击距离
        --   {"AT6A", "AT6B", "AT6C", "AT6S"}, --经验获取
        {"AT7A", "AT7B", "AT7C", "AT7S"} --物理攻击和法术攻击
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
        owner:RemoveSkill("AT04")
    else
        if (GetUnitLevel(SelectUnit.Entity) < 6) then
            owner:RemoveSkill("AT04")
            owner:AddSkill("AX04")
        end
    end
end

function skill:OnLearned()
    local owner = self.Owner
    local SelectUnit = owner.SelectUnit
end

