local skill = Skills["选择物理系天赋"]

function skill:OnCast()
    local owner = self.Owner
    local SelectUnit = owner.SelectUnit

    owner:RemoveSkill(GetId("AT01"))
    owner:RemoveSkill(GetId("AT02"))
    owner:RemoveSkill(GetId("AT03"))
    owner:AddSkill("AT04")
    if (GetUnitLevel(SelectUnit.Entity) >= 11) then
        owner:AddSkill("AT05")
    else
        owner:AddSkill("AX05")
    end
    if (SelectUnit.CombEnableCount >= 2) then
        owner:AddSkill("AT06")
    else
        owner:AddSkill("AX06")
    end
    SelectUnit.TianFuType = 1
end

function skill:OnLearned()
    local owner = self.Owner
    local SelectUnit = owner.SelectUnit
    SelectUnit.onLevelUp = self.OnLevelUp
    if (self.onLevelUp ~= nil) then
        self.onLevelUp(self)
    end
end

skill.OnLevelUp = function(SelectUnit)
    local unitLevel = GetUnitLevel(SelectUnit.Entity)
    if (unitLevel == 6) then
        if (SelectUnit.tianfu:GetSkill(GetId("AX04")) ~= nil) then
            SelectUnit.tianfu:RemoveSkill(GetId("AX04"))
            local a1 = SelectUnit.tianfu:AddSkill("AT04")
            a1.Count = 1
        end
    elseif (unitLevel == 11) then
        if (SelectUnit.tianfu:GetSkill(GetId("AX05")) ~= nil) then
            SelectUnit.tianfu:RemoveSkill(GetId("AX05"))
            SelectUnit.tianfu:AddSkill("AT05")
        end
    elseif (unitLevel == 16) then
        if (SelectUnit.tianfu:GetSkill(GetId("AZ05")) ~= nil) then
            SelectUnit.tianfu:RemoveSkill(GetId("AZ05"))
            local a3 = SelectUnit.tianfu:AddSkill("AT05")
            a3.Count = 1
        end
    end
end