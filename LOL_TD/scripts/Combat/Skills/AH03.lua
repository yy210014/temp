local skill = Skills["猎狩"]
skill.SkillType = 0
skill.Durs = {8, 8, 8, 8, 8, 8} --持续时间

function skill:OnCast()
    --添加一个光环马甲加攻速
    self.dummy = self.Owner:CreateDummy("", self.Owner:X(), self.Owner:Y())
    UnitAddAbility(self.dummy, GetId("AQ00"))
    SetUnitAbilityLevel(self.dummy, GetId("AQ00"), self:GetCurLevel())
end

function skill:OnRemove()
    RemoveUnit(self.dummy)
end
