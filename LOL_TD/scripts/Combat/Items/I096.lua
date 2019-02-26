local item = Items["冰杖"]
setmetatable(Buffs["冰杖"], { __index = Buffs["移速"] })
--Buffs["冰杖"].Art2 = "bilities\\Spells\\Other\\FrostDamage\\FrostDamage.mdl"
--Buffs["冰杖"].AttachPoint = "chest"
Buffs["冰杖"].values = {-0.3 }
Buffs["冰杖"].Durs = { 2 }

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", 150)
    unit.Attribute:add("魔法上限", 400)
    unit.Attribute:add("冷却缩减", 0.1)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -150)
    unit.Attribute:add("魔法上限", -400)
    unit.Attribute:add("冷却缩减", -0.1)
end

function item:OnSkillDamage(defUnit)
    defUnit:AddBuff("冰杖")
end