local skill = Skills["圣焰"]
skill.Art = "ReplaceableTextures\\PassiveButtons\\PASBTNHumanArtilleryUpOne.blp"

setmetatable(Buffs["圣焰"], {__index = Buffs["护甲"]})
Buffs["圣焰"].values = {-3, -5, -8, -10, -12, -15}
Buffs["圣焰"].Durs = {3, 3, 3, 3, 3, 3}
Buffs["圣焰"].MaxStack = 5

function skill:OnCast()
end

function skill:OnAttack(attactUnit, defUnit)
    --buff
    defUnit:AddBuff("圣焰", self:GetCurLevel())
end
