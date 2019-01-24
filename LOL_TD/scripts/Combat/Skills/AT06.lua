local skill = Skills["超能天赋随机"]
skill.AdList = {
    "AT1Z", --战斗狂人
    "AT3Z", --血虐狂暴
    "AT2Z" --雷霆万钧
}
skill.ApList = {
    "AT2Z", --雷霆万钧
    "AT4Z", --符文法剑
    "AT5Z" --幽冥冷火
}
skill.AdNApList = {
    "AT1Z", --战斗狂人
    "AT2Z", --雷霆万钧
    "AT4Z", --符文法剑
    "AT5Z" --幽冥冷火
}

function skill:OnCast()
    local owner = self.Owner
    local SelectUnit = owner.SelectUnit
    local id, tempId = -1
    if (SelectUnit.TianFuType == 1) then
        while id == -1 do
            tempId = self.AdList[math.random(1, #self.AdList)]
            if (owner:ContainSkill(tempId) == false) then
                id = tempId
            end
        end
    elseif (SelectUnit.TianFuType == 2) then
        while id == -1 do
            tempId = self.ApList[math.random(1, #self.ApList)]
            if (owner:ContainSkill(tempId) == false) then
                id = tempId
            end
        end
    else
        while id == -1 do
            tempId = self.AdNApList[math.random(1, #self.AdNApList)]
            if (owner:ContainSkill(tempId) == false) then
                id = tempId
            end
        end
    end
    owner:AddSkill(id)
    owner:RemoveSkill(self.Id)
end
