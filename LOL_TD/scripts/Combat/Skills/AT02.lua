local skill = Skills["选择法术系天赋"]

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
    owner:AddSkill("AX06")
    SelectUnit.TianFuType = 2
end

function skill:OnLearned()
    local owner = self.Owner
    local SelectUnit = owner.SelectUnit
end

--[[
    物理型	物理攻击	物理穿透	战斗狂人（每次攻击叠加攻击力）
    攻速	暴击伤害	血虐狂暴（暴击之后会获得额外的攻速）
    蓝量回复	技能冷却缩减	雷霆万钧（三次攻击或法术击中目标造成额外伤害）
    攻击距离	杀怪加钱	
    经验获取	每杀1个怪加1点物理攻击	
    物理攻击和法术攻击	物理穿透和法术穿透	
    
    
法术型	法术攻击	法术穿透	雷霆万钧（三次攻击或法术击中目标造成额外伤害）
	蓝量	技能冷却缩减	符文法剑（每次攻击附带法术攻击百分比的额外魔法伤害）
	蓝量回复	杀怪加钱	幽冥冷火（每次技能命中目标会点燃目标给目标造成持续伤害）
	攻击距离	每杀1个怪加1点法术攻击	
	经验获取	物理穿透和法术穿透	
	物理攻击和法术攻击		
]]
