local skill = Skills["变强"]
function skill:OnLearned()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", 0.25)
    unit.Attribute:add("物理穿透", 0.1)
    unit.Attribute:add("法术穿透", 0.1)
    unit.Attribute:add("物理伤害加成", 0.5)
    unit.Attribute:add("法术伤害加成", 0.5)
end