local item = Items["痛苦面具"]

setmetatable(Buffs["痛苦面具"], { __index = Buffs["灼烧"] })
local buff = Buffs["痛苦面具"]
buff.Interval = 1
buff.Art = "Abilities\\Spells\\Other\\BreathOfFire\\BreathOfFireDamage.mdl"
buff.values = { 0 }
buff.Durs = { 3 }
buff.MaxStack = 1

function buff.Action(self, dt)
    self.IntervalDt = self.IntervalDt - dt
    if (self.IntervalDt <= 0) then
        self.IntervalDt = self.Interval

        local owner = self.Owner
        local attactUnit = self.AttactUnit
        local damage = 0
        if (IsUnitPaused(owner.Entity) or owner.Attribute:get("移动速度加成") < 0) then
            damage = owner.Attribute:get("生命上限") * 0.08
        else
            damage = owner.Attribute:get("生命上限") * 0.05
        end
        if (owner.Id == GetId("End0") or owner.Id == GetId("UM56")) then
            damage = 1000
        end
        EXUnitDamageTarget(attactUnit, self.Owner, damage, EXAbilityType.Magic)
    end
end

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", 120)
    unit.Attribute:add("法术穿透", 0.15)
    unit.Attribute:add("魔法上限", 400)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("法术攻击", -120)
    unit.Attribute:add("法术穿透", -0.15)
    unit.Attribute:add("魔法上限", -400)
end

function item:OnSkillDamage(defUnit)
    local buff2 = defUnit:AddBuff("痛苦面具")
    if (buff2 ~= nil) then
        buff2.AttactUnit = self.Owner
    end
end

Ubertip = "伤害型技能会灼烧目标3秒，每秒造成相当于目标1.5%当前生命值的法术伤害。这个额外伤害会在对抗移动受损的单位时提升至2.5%。|r"