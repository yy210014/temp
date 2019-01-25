local skill = Skills["天赋"]
local mEffectArt = "Abilities\\Spells\\Items\\AIim\\AIimTarget.mdl"
local mLastSelectUnit
function skill:OnCast()
    local unit = self.Owner
    --  unit.tianfu:SetActive(true)
    ShowUnit(unit.tianfu.Entity, true)
    if GetLocalPlayer() == unit.Player then
        ClearSelection()
        SelectUnit(unit.tianfu.Entity, true)
    end
    mLastSelectUnit = unit.tianfu
    --动态注册esc返回
    if (unit.tianfu.EscTrigger == nil) then
        unit.tianfu.EscTrigger = CreateTrigger()
        TriggerRegisterPlayerEventEndCinematic(unit.tianfu.EscTrigger, unit.Player)
        TriggerAddAction(unit.tianfu.EscTrigger, self.TrigAction1)
    else
        EnableTrigger(unit.tianfu.EscTrigger)
    end
    --动态注册选择单位事件
    if (unit.tianfu.SelectedTrigger == nil) then
        unit.tianfu.SelectedTrigger = CreateTrigger()
        TriggerRegisterPlayerUnitEvent(unit.tianfu.SelectedTrigger, unit.Player, EVENT_PLAYER_UNIT_DESELECTED, nil)
        TriggerAddAction(unit.tianfu.SelectedTrigger, self.TrigAction2)
    else
        EnableTrigger(unit.tianfu.SelectedTrigger)
    end
end

skill.TrigAction1 = function()
    if (IsUnitSelected(mLastSelectUnit.Entity, GetTriggerPlayer())) then
        if GetLocalPlayer() == mLastSelectUnit.Player then
            ClearSelection()
            SelectUnit(mLastSelectUnit.SelectUnit.Entity, true)
        end
    end
end

skill.TrigAction2 = function()
    if (GetTriggerUnit() == mLastSelectUnit.Entity) then
        ShowUnit(mLastSelectUnit.Entity, false)
        DisableTrigger(mLastSelectUnit.EscTrigger)
        DisableTrigger(mLastSelectUnit.SelectedTrigger)
    end
end

function Tianfu_Condition(self, num)
    local p = self.Owner.Player
    if GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER) >= num then
        if (self.Owner.SelectUnit.UseNum == nil) then
            self.Owner.SelectUnit.UseNum = 0
        end
        self.Owner.SelectUnit.UseNum = self.Owner.SelectUnit.UseNum + 1
        SetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER) - num)
        DestroyEffect(AddSpecialEffectTarget(mEffectArt, self.Owner.SelectUnit.Entity, "origin"))
        DisplayTextToPlayer(p, 0, 0, "|c" .. Color.yellow .. "升级天赋成功" .. "|r")
        return true
    else
        DisplayTextToPlayer(p, 0, 0, "|c" .. Color.red .. "天赋点数不足" .. "|r")
        return false
    end
end

function Tianfu_Action(self)
    local p = self.Owner.Player
    if (GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5) then
        local skillId = ID2Str(self.Id)
        self.Owner:RemoveSkill(self.Id)
        self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
    else
        SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
    end
    DestroyEffect(AddSpecialEffectTarget(mEffectArt, self.Owner.SelectUnit.Entity, "origin"))
end

function Tianfu_Action2(self, num)
    local p = self.Owner.Player
    if GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER) >= num then
        SetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER) - num)
        local skillId = ID2Str(self.Id)
        self.Owner:RemoveSkill(self.Id)
        self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        self.Owner.SelectUnit:AddSkill(string.gsub(skillId, "T", "X"))
        DestroyEffect(AddSpecialEffectTarget(mEffectArt, self.Owner.SelectUnit.Entity, "origin"))
        DisplayTextToPlayer(p, 0, 0, "|c" .. Color.yellow .. "升级天赋成功" .. "|r")
        return true
    else
        DisplayTextToPlayer(p, 0, 0, "|c" .. Color.red .. "天赋点数不足" .. "|r")
        return false
    end
end
skill = Skills["物理攻击C级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("物理攻击加成", -self.value)
        self.value = self:GetCurLevel() * 6 - (maxLevel and 0 or 6)
        selectUnit.Attribute:add("物理攻击加成", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["物理攻击B级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("物理攻击加成", -self.value)
        self.value = self:GetCurLevel() * 9 - (maxLevel and 0 or 9)
        selectUnit.Attribute:add("物理攻击加成", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end

skill = Skills["物理攻击A级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("物理攻击加成", -self.value)
        self.value = self:GetCurLevel() * 12 - (maxLevel and 0 or 12)
        selectUnit.Attribute:add("物理攻击加成", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["物理攻击S级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("物理攻击加成", -self.value)
        self.value = self:GetCurLevel() * 15 - (maxLevel and 0 or 15)
        selectUnit.Attribute:add("物理攻击加成", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["法术攻击C级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("法术攻击", -self.value)
        self.value = self:GetCurLevel() * 6 - (maxLevel and 0 or 6)
        selectUnit.Attribute:add("法术攻击", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["法术攻击B级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("法术攻击", -self.value)
        self.value = self:GetCurLevel() * 9 - (maxLevel and 0 or 9)
        selectUnit.Attribute:add("法术攻击", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["法术攻击A级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("法术攻击", -self.value)
        self.value = self:GetCurLevel() * 12 - (maxLevel and 0 or 12)
        selectUnit.Attribute:add("法术攻击", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["法术攻击S级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("法术攻击", -self.value)
        self.value = self:GetCurLevel() * 15 - (maxLevel and 0 or 15)
        selectUnit.Attribute:add("法术攻击", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["攻速C级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("攻击速度", -self.value)
        self.value = self:GetCurLevel() * 0.04 - (maxLevel and 0 or 0.04)
        selectUnit.Attribute:add("攻击速度", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["攻速B级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("攻击速度", -self.value)
        self.value = self:GetCurLevel() * 0.06 - (maxLevel and 0 or 0.06)
        selectUnit.Attribute:add("攻击速度", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["攻速A级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("攻击速度", -self.value)
        self.value = self:GetCurLevel() * 0.08 - (maxLevel and 0 or 0.08)
        selectUnit.Attribute:add("攻击速度", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["攻速S级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("攻击速度", -self.value)
        self.value = self:GetCurLevel() * 0.1 - (maxLevel and 0 or 0.1)
        selectUnit.Attribute:add("攻击速度", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["蓝量C级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("魔法上限", -self.value)
        self.value = self:GetCurLevel() * 80 - (maxLevel and 0 or 80)
        selectUnit.Attribute:add("魔法上限", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["蓝量B级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("魔法上限", -self.value)
        self.value = self:GetCurLevel() * 110 - (maxLevel and 0 or 110)
        selectUnit.Attribute:add("魔法上限", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["蓝量A级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("魔法上限", -self.value)
        self.value = self:GetCurLevel() * 150 - (maxLevel and 0 or 150)
        selectUnit.Attribute:add("魔法上限", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["蓝量S级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("魔法上限", -self.value)
        self.value = self:GetCurLevel() * 180 - (maxLevel and 0 or 180)
        selectUnit.Attribute:add("魔法上限", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["蓝量回复C级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("魔法恢复", -self.value)
        self.value = self:GetCurLevel() * 1.2 - (maxLevel and 0 or 1.2)
        selectUnit.Attribute:add("魔法恢复", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["蓝量回复B级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("魔法恢复", -self.value)
        self.value = self:GetCurLevel() * 1.8 - (maxLevel and 0 or 1.8)
        selectUnit.Attribute:add("魔法恢复", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["蓝量回复A级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("魔法恢复", -self.value)
        self.value = self:GetCurLevel() * 2.4 - (maxLevel and 0 or 2.4)
        selectUnit.Attribute:add("魔法恢复", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["蓝量回复S级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("魔法恢复", -self.value)
        self.value = self:GetCurLevel() * 3 - (maxLevel and 0 or 3)
        selectUnit.Attribute:add("魔法恢复", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["攻击距离C级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("攻击范围", -self.value)
        self.value = self:GetCurLevel() * 20 - (maxLevel and 0 or 20)
        selectUnit.Attribute:add("攻击范围", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["攻击距离B级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("攻击范围", -self.value)
        self.value = self:GetCurLevel() * 30 - (maxLevel and 0 or 30)
        selectUnit.Attribute:add("攻击范围", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["攻击距离A级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("攻击范围", -self.value)
        self.value = self:GetCurLevel() * 40 - (maxLevel and 0 or 40)
        selectUnit.Attribute:add("攻击范围", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["攻击距离S级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("攻击范围", -self.value)
        self.value = self:GetCurLevel() * 50 - (maxLevel and 0 or 50)
        selectUnit.Attribute:add("攻击范围", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["经验获取C级"]
skill.value = 0
function skill:OnCast()
    Tianfu_Action(self, 1)
end
skill = Skills["经验获取B级"]
skill.value = 0
function skill:OnCast()
    Tianfu_Action(self, 1)
end
skill = Skills["经验获取A级"]
skill.value = 0
function skill:OnCast()
    Tianfu_Action(self, 1)
end
skill = Skills["经验获取S级"]
skill.value = 0
function skill:OnCast()
    Tianfu_Action(self, 1)
end
skill = Skills["物理攻击和法术攻击C级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("物理攻击加成", -self.value)
        selectUnit.Attribute:add("法术攻击", -self.value)
        self.value = self:GetCurLevel() * 7 - (maxLevel and 0 or 7)
        selectUnit.Attribute:add("物理攻击加成", self.value)
        selectUnit.Attribute:add("法术攻击", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["物理攻击和法术攻击B级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("物理攻击加成", -self.value)
        selectUnit.Attribute:add("法术攻击", -self.value)
        self.value = self:GetCurLevel() * 8 - (maxLevel and 0 or 8)
        selectUnit.Attribute:add("物理攻击加成", self.value)
        selectUnit.Attribute:add("法术攻击", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["物理攻击和法术攻击A级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("物理攻击加成", -self.value)
        selectUnit.Attribute:add("法术攻击", -self.value)
        self.value = self:GetCurLevel() * 9 - (maxLevel and 0 or 9)
        selectUnit.Attribute:add("物理攻击加成", self.value)
        selectUnit.Attribute:add("法术攻击", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["物理攻击和法术攻击S级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 1)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("物理攻击加成", -self.value)
        selectUnit.Attribute:add("法术攻击", -self.value)
        self.value = self:GetCurLevel() * 10 - (maxLevel and 0 or 10)
        selectUnit.Attribute:add("物理攻击加成", self.value)
        selectUnit.Attribute:add("法术攻击", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["物理穿透C级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("物理穿透", -self.value)
        self.value = self:GetCurLevel() * 0.02 - (maxLevel and 0 or 0.02)
        selectUnit.Attribute:add("物理穿透", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["物理穿透B级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("物理穿透", -self.value)
        self.value = self:GetCurLevel() * 0.03 - (maxLevel and 0 or 0.03)
        selectUnit.Attribute:add("物理穿透", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["物理穿透A级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("物理穿透", -self.value)
        self.value = self:GetCurLevel() * 0.04 - (maxLevel and 0 or 0.04)
        selectUnit.Attribute:add("物理穿透", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["物理穿透S级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("物理穿透", -self.value)
        self.value = self:GetCurLevel() * 0.05 - (maxLevel and 0 or 0.05)
        selectUnit.Attribute:add("物理穿透", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["法术穿透C级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("法术穿透", -self.value)
        self.value = self:GetCurLevel() * 0.02 - (maxLevel and 0 or 0.02)
        selectUnit.Attribute:add("法术穿透", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["法术穿透B级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("法术穿透", -self.value)
        self.value = self:GetCurLevel() * 0.03 - (maxLevel and 0 or 0.03)
        selectUnit.Attribute:add("法术穿透", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["法术穿透A级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("法术穿透", -self.value)
        self.value = self:GetCurLevel() * 0.04 - (maxLevel and 0 or 0.04)
        selectUnit.Attribute:add("法术穿透", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["法术穿透S级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("法术穿透", -self.value)
        self.value = self:GetCurLevel() * 0.05 - (maxLevel and 0 or 0.05)
        selectUnit.Attribute:add("法术穿透", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["暴击伤害C级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("暴击伤害", -self.value)
        self.value = self:GetCurLevel() * 0.05 - (maxLevel and 0 or 0.05)
        selectUnit.Attribute:add("暴击伤害", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["暴击伤害B级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("暴击伤害", -self.value)
        self.value = self:GetCurLevel() * 0.06 - (maxLevel and 0 or 0.06)
        selectUnit.Attribute:add("暴击伤害", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["暴击伤害A级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("暴击伤害", -self.value)
        self.value = self:GetCurLevel() * 0.07 - (maxLevel and 0 or 0.07)
        selectUnit.Attribute:add("暴击伤害", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["暴击伤害S级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("暴击伤害", -self.value)
        self.value = self:GetCurLevel() * 0.08 - (maxLevel and 0 or 0.08)
        selectUnit.Attribute:add("暴击伤害", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["技能冷却缩减C级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("冷却缩减", -self.value)
        selectUnit.Attribute:add("冷却缩减上限", -self.value)
        self.value = self:GetCurLevel() * 0.005 - (maxLevel and 0 or 0.005)
        selectUnit.Attribute:add("冷却缩减上限", self.value)
        selectUnit.Attribute:add("冷却缩减", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["技能冷却缩减B级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("冷却缩减", -self.value)
        selectUnit.Attribute:add("冷却缩减上限", -self.value)
        self.value = self:GetCurLevel() * 0.01 - (maxLevel and 0 or 0.01)
        selectUnit.Attribute:add("冷却缩减上限", self.value)
        selectUnit.Attribute:add("冷却缩减", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["技能冷却缩减A级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("冷却缩减", -self.value)
        selectUnit.Attribute:add("冷却缩减上限", -self.value)
        self.value = self:GetCurLevel() * 0.015 - (maxLevel and 0 or 0.015)
        selectUnit.Attribute:add("冷却缩减上限", self.value)
        selectUnit.Attribute:add("冷却缩减", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["技能冷却缩减S级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("冷却缩减", -self.value)
        selectUnit.Attribute:add("冷却缩减上限", -self.value)
        self.value = self:GetCurLevel() * 0.02 - (maxLevel and 0 or 0.02)
        selectUnit.Attribute:add("冷却缩减上限", self.value)
        selectUnit.Attribute:add("冷却缩减", self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["杀怪加钱点C级"]
skill.value = 0
function skill:OnCast()
    Tianfu_Action(self, 1)
end
skill = Skills["杀怪加钱点B级"]
skill.value = 0
function skill:OnCast()
    Tianfu_Action(self, 1)
end
skill = Skills["杀怪加钱点A级"]
skill.value = 0
function skill:OnCast()
    Tianfu_Action(self, 1)
end
skill = Skills["杀怪加钱点S级"]
skill.value = 0
function skill:OnCast()
    Tianfu_Action(self, 1)
end
skill = Skills["成长物理攻击C级"]
skill.Value = 0
skill.MaxValue = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
function skill:OnKill(dieUnit)
    local selectUnit = self.Owner.SelectUnit
    local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
    self.MaxValue = self:GetCurLevel() * 40 - (maxLevel and 0 or 40)
    if (self.Id == GetId("AXDC")) then
        self.MaxValue = 5 * 40
    end
    if (self.Value < self.MaxValue) then
        self.Value = self.Value + 1
        selectUnit.Attribute:add("物理攻击加成", 1)
    end
end
skill = Skills["成长物理攻击B级"]
skill.Value = 0
skill.MaxValue = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
function skill:OnKill(dieUnit)
    local selectUnit = self.Owner.SelectUnit
    local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
    self.MaxValue = self:GetCurLevel() * 60 - (maxLevel and 0 or 60)
    if (self.Id == GetId("AXDB")) then
        self.MaxValue = 5 * 60
    end
    if (self.Value < self.MaxValue) then
        self.Value = self.Value + 1
        selectUnit.Attribute:add("物理攻击加成", 1)
    end
end
skill = Skills["成长物理攻击A级"]
skill.Value = 0
skill.MaxValue = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
function skill:OnKill(dieUnit)
    local selectUnit = self.Owner.SelectUnit
    local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
    self.MaxValue = self:GetCurLevel() * 80 - (maxLevel and 0 or 80)
    if (self.Id == GetId("AXDA")) then
        self.MaxValue = 5 * 80
    end
    if (self.Value < self.MaxValue) then
        self.Value = self.Value + 1
        selectUnit.Attribute:add("物理攻击加成", 1)
    end
end
skill = Skills["成长物理攻击S级"]
skill.Value = 0
skill.MaxValue = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
function skill:OnKill(dieUnit)
    local selectUnit = self.Owner.SelectUnit
    local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
    self.MaxValue = self:GetCurLevel() * 100 - (maxLevel and 0 or 100)
    if (self.Id == GetId("AXDS")) then
        self.MaxValue = 5 * 100
    end
    if (self.Value < self.MaxValue) then
        self.Value = self.Value + 1
        selectUnit.Attribute:add("物理攻击加成", 1)
    end
end
skill = Skills["成长法术攻击C级"]
skill.Value = 0
skill.MaxValue = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
function skill:OnKill(dieUnit)
    local selectUnit = self.Owner.SelectUnit
    local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
    self.MaxValue = self:GetCurLevel() * 40 - (maxLevel and 0 or 40)
    if (self.Id == GetId("AXEC")) then
        self.MaxValue = 5 * 40
    end
    if (self.Value < self.MaxValue) then
        self.Value = self.Value + 1
        selectUnit.Attribute:add("法术攻击", 1)
    end
end
skill = Skills["成长法术攻击B级"]
skill.Value = 0
skill.MaxValue = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
function skill:OnKill(dieUnit)
    local selectUnit = self.Owner.SelectUnit
    local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
    self.MaxValue = self:GetCurLevel() * 60 - (maxLevel and 0 or 60)
    if (self.Id == GetId("AXEB")) then
        self.MaxValue = 5 * 60
    end
    if (self.Value < self.MaxValue) then
        self.Value = self.Value + 1
        selectUnit.Attribute:add("法术攻击", 1)
    end
end
skill = Skills["成长法术攻击A级"]
skill.Value = 0
skill.MaxValue = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
function skill:OnKill(dieUnit)
    local selectUnit = self.Owner.SelectUnit
    local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
    self.MaxValue = self:GetCurLevel() * 80 - (maxLevel and 0 or 80)
    if (self.Id == GetId("AXEA")) then
        self.MaxValue = 5 * 80
    end
    if (self.Value < self.MaxValue) then
        self.Value = self.Value + 1
        selectUnit.Attribute:add("法术攻击", 1)
    end
end
skill = Skills["成长法术攻击S级"]
skill.Value = 0
skill.MaxValue = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
function skill:OnKill(dieUnit)
    local selectUnit = self.Owner.SelectUnit
    local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
    self.MaxValue = self:GetCurLevel() * 100 - (maxLevel and 0 or 100)
    if (self.Id == GetId("AXES")) then
        self.MaxValue = 5 * 100
    end
    if (self.Value < self.MaxValue) then
        self.Value = self.Value + 1
        selectUnit.Attribute:add("法术攻击", 1)
    end
end
skill = Skills["物理穿透和法术穿透C级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("物理穿透", -self.value)
        selectUnit.Attribute:add("法术穿透", -self.value)
        self.value = self:GetCurLevel() * 0.01 - (maxLevel and 0 or 0.01)
        selectUnit.Attribute:add("物理穿透", -self.value)
        selectUnit.Attribute:add("法术穿透", -self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["物理穿透和法术穿透B级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("物理穿透", -self.value)
        selectUnit.Attribute:add("法术穿透", -self.value)
        self.value = self:GetCurLevel() * 0.015 - (maxLevel and 0 or 0.015)
        selectUnit.Attribute:add("物理穿透", -self.value)
        selectUnit.Attribute:add("法术穿透", -self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["物理穿透和法术穿透A级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("物理穿透", -self.value)
        selectUnit.Attribute:add("法术穿透", -self.value)
        self.value = self:GetCurLevel() * 0.02 - (maxLevel and 0 or 0.02)
        selectUnit.Attribute:add("物理穿透", -self.value)
        selectUnit.Attribute:add("法术穿透", -self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["物理穿透和法术穿透S级"]
skill.value = 0
function skill:OnCast()
    if (Tianfu_Condition(self, 2)) then
        local maxLevel = GetUnitAbilityLevel(self.Owner.Entity, self.Id) == 5
        if (maxLevel == false) then
            SetUnitAbilityLevel(self.Owner.Entity, self.Id, GetUnitAbilityLevel(self.Owner.Entity, self.Id) + 1)
        end
        local selectUnit = self.Owner.SelectUnit
        selectUnit.Attribute:add("物理穿透", -self.value)
        selectUnit.Attribute:add("法术穿透", -self.value)
        self.value = self:GetCurLevel() * 0.025 - (maxLevel and 0 or 0.025)
        selectUnit.Attribute:add("物理穿透", -self.value)
        selectUnit.Attribute:add("法术穿透", -self.value)
        if (maxLevel == true) then
            local skillId = ID2Str(self.Id)
            self.Owner:RemoveSkill(self.Id)
            self.Owner:AddSkill(string.gsub(skillId, "T", "X"))
        end
    end
end
skill = Skills["战斗狂人"]
skill.value = 0
function skill:OnCast()
    Tianfu_Action2(self, 5)
end
skill = Skills["雷霆万钧"]
skill.value = 0
function skill:OnCast()
    Tianfu_Action2(self, 5)
end
skill = Skills["血虐狂暴"]
skill.value = 0
function skill:OnCast()
    Tianfu_Action2(self, 5)
end

skill = Skills["符文法剑"]
skill.value = 0
function skill:OnCast()
    Tianfu_Action2(self, 5)
end

skill = Skills["幽冥冷火"]
skill.value = 0
function skill:OnCast()
    Tianfu_Action2(self, 5)
end

skill = Skills["战斗狂人[被动]"]
local Ubertip = "|cffffff00效果：每次攻击会增加英雄（10+英雄等级*2）的攻击力，最多叠加5次。持续2s|r"
setmetatable(Buffs["战斗狂人"], { __index = Buffs["物理攻击"] })
Buffs["战斗狂人"].values = { 1 }
Buffs["战斗狂人"].Durs = { 2 }
Buffs["战斗狂人"].MaxStack = 5
function skill:OnAttack(attactUnit, defUnit)
    Buffs["战斗狂人"].values = { 10 + GetHeroLevel(attactUnit.Entity) * 2 }
    --Game.Log("战斗狂人[被动]: " .. Buffs["战斗狂人"].values[1])
    attactUnit:AddBuff("战斗狂人")
end

skill = Skills["雷霆万钧[被动]"]
skill.Count = 1
skill.mArt1 = "AZ_TS_G2.mdl"
skill.mArt2 = "Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl"
function skill:OnAttack(attactUnit, defUnit)
    --Game.Log("雷霆万钧[被动]")
    if (self.Count >= 3) then
        self.Count = 1
        local ad = attactUnit.Attribute:get("物理攻击") + attactUnit.Attribute:get("物理攻击加成")
        local ap = attactUnit.Attribute:get("法术攻击")
        local damage = 30 * GetHeroLevel(attactUnit.Entity) + 0.3 * ad + 0.3 * ap
        DestroyEffect(AddSpecialEffect(self.mArt1, defUnit:X(), defUnit:Y()))
        DestroyEffect(AddSpecialEffect(self.mArt2, defUnit:X(), defUnit:Y()))
        AssetsManager.OverlapCircle(
        defUnit:X(),
        defUnit:Y(),
        400,
        function(unit)
            EXUnitDamageTarget(attactUnit, unit, damage, EXDamageType.Magic)
        end
        )
    else
        self.Count = self.Count + 1
    end
end

skill = Skills["血虐狂暴[被动]"]
setmetatable(Buffs["血虐狂暴"], { __index = Buffs["攻速"] })
Buffs["血虐狂暴"].values = { 0.1 }
Buffs["血虐狂暴"].Durs = { 3 }
Buffs["血虐狂暴"].MaxStack = 5
function skill:OnAttack(attactUnit, defUnit, isCrit)
    if (isCrit) then
        --Game.Log("血虐狂暴[被动]")
        attactUnit:AddBuff("血虐狂暴")
    end
end

skill = Skills["符文法剑[被动]"]
skill.value = 0
function skill:OnAttack(attactUnit, defUnit)
    local ap = attactUnit.Attribute:get("法术攻击")
    local damage = ap * 3
    DestroyEffect(
    AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", defUnit.Entity, "chest")
    )
    EXUnitDamageTarget(attactUnit, defUnit, damage, EXDamageType.Magic)
end

skill = Skills["幽冥冷火[被动]"]
skill.LastTime = 0
setmetatable(Buffs["幽冥冷火"], { __index = Buffs["灼烧"] })
Buffs["幽冥冷火"].values = { 0 }
Buffs["幽冥冷火"].Durs = { 3 }
Buffs["幽冥冷火"].MaxStack = 1