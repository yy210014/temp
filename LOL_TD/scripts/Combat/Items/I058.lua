local item = Items["飓风"]

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", 0.35)
    unit.Attribute:add("暴击", 0.25)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("攻击速度", -0.35)
    unit.Attribute:add("暴击", -0.25)
end

function item:OnAttack(attactUnit,defUnit)
    --普通攻击会对周围6个单位造成当前攻击70%的伤害
end