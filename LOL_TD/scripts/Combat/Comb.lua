Comb = {}
Comb.__index = Comb

function Comb:HerosId()
    return nil
end

function Comb:Conditions()
    return false
end

function Comb:OnEnable()
end

function Comb:OnDisable()
end

Combs =
    setmetatable(
    {},
    {
        __index = function(self, name)
            self[name] = {}
            setmetatable(self[name], {__index = Comb})
            self[name].Name = name
            self[name].Heros = {}
            self[name].Enable = false
            self[name].Ubertip = ""
            return self[name]
        end
    }
)

function testA(self, needHeroIds)
    local AllHeros = GetPlayerTeamUnits(GetPlayerId(self.Owner.Player))
    local needHeroIds = self:HerosId()
    local flag = false
    local tempHeros = {}
    for i = 1, #needHeroIds do
        flag = false
        for j = 1, #AllHeros do
            if (needHeroIds[i] == AllHeros[j].Id) then
                flag = true
                tempHeros[#tempHeros + 1] = AllHeros[j]
            end
        end
        if (flag == false) then
            return false
        end
    end
    return true
end
local comb = Combs["草丛三剑客"]
comb.Ubertip = [[
-草丛三剑客
 羁绊需求：盖伦+皇子+赵信
 羁绊效果：盖伦/皇子/赵信获得15%的物理伤害加成|n
]]

function comb:HerosId()
    return {GetId("UH15"), GetId("UH11"), GetId("UH12")}
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理伤害加成", 0.15)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理伤害加成", -0.15)
end

comb = Combs["正义兄妹-盖伦"]
comb.Ubertip = [[
-正义兄妹
 羁绊需求：盖伦+拉克丝
 羁绊效果：盖伦增加10%的额外技能冷却缩减.
          拉克丝获得额外技能,光芒四射.|n
]]

function comb:HerosId()
    return {GetId("UH15"), GetId("UH01")}
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("冷却缩减", 0.1)
end

function comb:OnDisable()
    self.Owner.Attribute:add("冷却缩减", -0.1)
end

comb = Combs["正义兄妹-拉克丝"]
comb.Ubertip = [[
-正义兄妹
 羁绊需求：盖伦+拉克丝
 羁绊效果：盖伦增加10%的额外技能冷却缩减.
          拉克丝获得额外技能,光芒四射.|n
]]

function comb:HerosId()
    return {GetId("UH15"), GetId("UH01")}
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner:AddSkill("AH74")
end

function comb:OnDisable()
    self.Owner:RemoveSkill("AH74")
end

comb = Combs["蛮易信"]
comb.Ubertip = [[
-蛮易信
 羁绊需求：蛮王+赵信+剑圣
 羁绊效果：蛮王/赵信/剑圣获得20%的额外攻击速度和20%的物理伤害加成.|n
]]

function comb:HerosId()
    return {GetId("UH16"), GetId("UH12"), GetId("UH19")}
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("攻击速度", 0.2)
    self.Owner.Attribute:add("物理伤害加成", 0.2)
end

function comb:OnDisable()
    self.Owner.Attribute:add("攻击速度", -0.2)
    self.Owner.Attribute:add("物理伤害加成", -0.2)
end

comb = Combs["美女与野兽"]
comb.Ubertip = [[
-美女与野兽
 羁绊需求：蛮王+艾希
 羁绊效果：蛮王/艾希获得额外50%的暴击伤害.|n
]]

function comb:HerosId()
    return {GetId("UH16"), GetId("UH25")}
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("暴击伤害", 0.5)
end

function comb:OnDisable()
    self.Owner.Attribute:add("暴击伤害", -0.5)
end

comb = Combs["冰雪之冠-艾希"]
comb.Ubertip = [[
-冰雪之冠
 羁绊需求：艾希+丽桑卓
 羁绊效果：艾希获得额外技能,专注射击.
          丽桑卓得额外技能，寒冰血脉。|n
]]

function comb:HerosId()
    return {GetId("UH25"), GetId("UH06")}
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner:AddSkill("AH76")
end

function comb:OnDisable()
    self.Owner:RemoveSkill("AH76")
end

comb = Combs["冰雪之冠-丽桑卓"]
comb.Ubertip = [[
-冰雪之冠
 羁绊需求：艾希+丽桑卓
 羁绊效果：艾希获得额外技能,专注射击.
          丽桑卓得额外技能，寒冰血脉。|n
]]

function comb:HerosId()
    return {GetId("UH25"), GetId("UH06")}
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner:AddSkill("AH75")
end

function comb:OnDisable()
    self.Owner:RemoveSkill("AH75")
end

comb = Combs["炮火联盟-小炮"]
comb.Ubertip = [[
-炮火联盟
 羁绊需求：小炮+炸弹人
 羁绊效果：增加小炮15%额外物理攻击穿透
          增加炸弹人15%额外法术穿透|n
]]

function comb:HerosId()
    return {GetId("UH23"), GetId("UH03")}
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理穿透", 0.15)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理穿透", -0.15)
end

comb = Combs["炮火联盟-炸弹人"]
comb.Ubertip = [[
-炮火联盟
 羁绊需求：小炮+炸弹人
 羁绊效果：增加小炮15%额外物理攻击穿透
          增加炸弹人15%额外法术穿透|n
]]

function comb:HerosId()
    return {GetId("UH23"), GetId("UH03")}
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术穿透", 0.15)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术穿透", -0.15)
end

comb = Combs["神圣与堕落-天使"]
comb.Ubertip = [[
-神圣与堕落
 羁绊需求：天使+莫甘娜
 羁绊效果：增加天使10%的额外攻速
          增加莫甘娜10%的额外技能冷却缩减|n
]]

function comb:HerosId()
    return {GetId("UH13"), GetId("UH02")}
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("攻击速度", 0.1)
end

function comb:OnDisable()
    self.Owner.Attribute:add("攻击速度", -0.1)
end

comb = Combs["神圣与堕落-莫甘娜"]
comb.Ubertip = [[
-神圣与堕落
 羁绊需求：天使+莫甘娜
 羁绊效果：增加天使10%的额外攻速
          增加莫甘娜10%的额外技能冷却缩减|n
]]

function comb:HerosId()
    return {GetId("UH13"), GetId("UH02")}
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("冷却缩减", 0.1)
end

function comb:OnDisable()
    self.Owner.Attribute:add("冷却缩减", -0.1)
end

comb = Combs["黑暗魔法"]
comb.Ubertip = [[
-黑暗魔法
 羁绊需求：莫甘娜+小法
 羁绊效果：增加莫甘娜/小法10%的额外法术穿透|n
]]

function comb:HerosId()
    return {GetId("UH02"), GetId("UH08")}
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术穿透", 0.1)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术穿透", -0.1)
end

comb = Combs["皇子-九头蛇"]
comb.Ubertip = [[
-九头蛇
 羁绊需求：皇子+九头蛇
 羁绊效果：增加皇子15%额外物理穿透|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I052")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理穿透", 0.15)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理穿透", -0.15)
end

comb = Combs["皇子-黑切"]
comb.Ubertip = [[
-黑切
 羁绊需求：皇子+黑切
 羁绊效果：额外增加皇子“巨龙撞击”10点减甲效果|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I050")) == true)
end

function comb:OnEnable()
end

function comb:OnDisable()
end

comb = Combs["赵信-电刀"]
comb.Ubertip = [[
-电刀
 羁绊需求：赵信+电刀
 羁绊效果：增加赵信30%的攻速|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I027")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("攻击速度", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("攻击速度", -0.3)
end

comb = Combs["赵信-九头蛇"]
comb.Ubertip = [[
-九头蛇
 羁绊需求：赵信+九头蛇
 羁绊效果：增加赵信15%额外物理穿透|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I052")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理穿透", 0.15)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理穿透", -0.15)
end

comb = Combs["拉克丝-大圣杯"]
comb.Ubertip = [[
-大圣杯
 羁绊需求：拉克丝+大圣杯
 羁绊效果：增加拉克丝10%的冷却缩减|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I071")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("冷却缩减", 0.1)
end

function comb:OnDisable()
    self.Owner.Attribute:add("冷却缩减", -0.1)
end

comb = Combs["拉克丝-鬼书"]
comb.Ubertip = [[
-鬼书
 羁绊需求：拉克丝+鬼书
 羁绊效果：增加拉克丝“终极闪光”技能伤害30%|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I075")) == true)
end

function comb:OnEnable()
end

function comb:OnDisable()
end

comb = Combs["莫甘娜-帽子"]
comb.Ubertip = [[
-帽子
 羁绊需求：莫甘娜+帽子
 羁绊效果：增加莫甘娜15%的额外法术穿透|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I073")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术穿透", 0.15)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术穿透", -0.15)
end

comb = Combs["莫甘娜-法穿棒"]
comb.Ubertip = [[
-法穿棒
 羁绊需求：莫甘娜+法穿棒
 羁绊效果：增加莫甘娜120法术攻击|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I069")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术攻击", 120)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术攻击", -120)
end

comb = Combs["小炮-电刀"]
comb.Ubertip = [[
-电刀
 羁绊需求：小炮+电刀
 羁绊效果：增加小炮15%的物理穿透|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I027")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理穿透", 0.15)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理穿透", -0.15)
end

comb = Combs["小炮-无尽"]
comb.Ubertip = [[
-无尽
 羁绊需求：小炮+无尽
 羁绊效果：增加小炮20%的额外暴击伤害|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I043")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("暴击伤害", 0.2)
end

function comb:OnDisable()
    self.Owner.Attribute:add("暴击伤害", -0.2)
end

comb = Combs["天使-羊刀"]
comb.Ubertip = [[
-羊刀
 羁绊需求：天使+羊刀
 羁绊效果：增加天使15%的物理穿透|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I090")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理穿透", 0.15)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理穿透", -0.15)
end

comb = Combs["天使-纳什之牙"]
comb.Ubertip = [[
-纳什之牙
 羁绊需求：天使+纳什之牙
 羁绊效果：增加天使15%的法术穿透|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I083")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术穿透", 0.15)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术穿透", -0.15)
end

comb = Combs["炸弹人-鬼书"]
comb.Ubertip = [[
-鬼书
 羁绊需求：炸弹人+鬼书
 羁绊效果：增加炸弹人15%的法术穿透|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I075")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术穿透", 0.15)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术穿透", -0.15)
end

comb = Combs["炸弹人-大圣杯"]
comb.Ubertip = [[
-大圣杯
 羁绊需求：炸弹人+大圣杯
 羁绊效果：增加炸弹人10%的冷却缩减|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I071")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("冷却缩减", 0.1)
end

function comb:OnDisable()
    self.Owner.Attribute:add("冷却缩减", -0.1)
end

comb = Combs["艾希-飓风"]
comb.Ubertip = [[
-飓风
 羁绊需求：艾希+飓风
 羁绊效果：增加艾希携带飓风时的攻击目标至8个|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I058")) == true)
end

function comb:OnEnable()
end

function comb:OnDisable()
end

comb = Combs["艾希-无尽"]
comb.Ubertip = [[
-无尽
 羁绊需求：艾希+无尽
 羁绊效果：增加艾希20%的额外暴击伤害|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I043")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("暴击伤害", 0.2)
end

function comb:OnDisable()
    self.Owner.Attribute:add("暴击伤害", -0.2)
end

comb = Combs["盖伦-黑切"]
comb.Ubertip = [[
-黑切
 羁绊需求：盖伦+黑切
 羁绊效果：增加盖伦15%的物理穿透|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I050")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理穿透", 0.15)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理穿透", -0.15)
end

comb = Combs["盖伦-日炎"]
comb.Ubertip = [[
-日炎
 羁绊需求：盖伦+日炎
 羁绊效果：增加日炎造成50%的伤害|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I087")) == true)
end

function comb:OnEnable()
end

function comb:OnDisable()
end

comb = Combs["蛮王-无尽"]
comb.Ubertip = [[
-无尽
 羁绊需求：蛮王+无尽
 羁绊效果：增加蛮王20%的额外暴击伤害|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I043")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("暴击伤害", 0.2)
end

function comb:OnDisable()
    self.Owner.Attribute:add("暴击伤害", -0.2)
end

comb = Combs["蛮王-红叉"]
comb.Ubertip = [[
-红叉
 羁绊需求：蛮王+红叉
 羁绊效果：增加蛮王15%的物理穿透|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I056")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理穿透", 0.15)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理穿透", -0.15)
end

comb = Combs["丽桑卓-鬼书"]
comb.Ubertip = [[
-鬼书
 羁绊需求：丽桑卓+鬼书
 羁绊效果：增加丽桑卓15%的法术穿透|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I075")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术穿透", 0.15)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术穿透", -0.15)
end

comb = Combs["丽桑卓-帽子"]
comb.Ubertip = [[
-帽子
 羁绊需求：丽桑卓+帽子
 羁绊效果：增加丽桑卓“寒冰碎片”技能伤害30%|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I073")) == true)
end

function comb:OnEnable()
end

function comb:OnDisable()
end

comb = Combs["易大师-无尽"]
comb.Ubertip = [[
-无尽
 羁绊需求：易大师+无尽
 羁绊效果：增加易20%额外暴击伤害|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I043")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("暴击伤害", 0.2)
end

function comb:OnDisable()
    self.Owner.Attribute:add("暴击伤害", -0.2)
end

comb = Combs["易大师-电刀"]
comb.Ubertip = [[
-电刀
 羁绊需求：易大师+电刀
 羁绊效果：增加易15%物理穿透|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I027")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理穿透", 0.15)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理穿透", -0.15)
end

comb = Combs["小法师-鬼书"]
comb.Ubertip = [[
-鬼书
 羁绊需求：小法师+鬼书
 羁绊效果：增加小法师15%的法术穿透|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I075")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术穿透", 0.15)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术穿透", -0.15)
end

comb = Combs["小法师-大圣杯"]
comb.Ubertip = [[
-大圣杯
 羁绊需求：小法师+大圣杯
 羁绊效果：增加小法师“黑暗物质”技能伤害30%|n
]]

function comb:HerosId()
    return {self.Owner.Id}
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I071")) == true)
end

function comb:OnEnable()
end

function comb:OnDisable()
end

function AddComb(unit)
    local id = unit.Id
    local newComb = {}
    if (id == GetId("UH01")) then --拉克丝
        unit:AddComb(setmetatable({}, {__index = Combs["正义兄妹-拉克丝"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["拉克丝-大圣杯"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["拉克丝-鬼书"]}))
    elseif (id == GetId("UH02")) then --莫甘娜
        unit:AddComb(setmetatable({}, {__index = Combs["神圣与堕落-莫甘娜"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["黑暗魔法"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["莫甘娜-帽子"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["莫甘娜-法穿棒"]}))
    elseif (id == GetId("UH03")) then --炸弹人
        unit:AddComb(setmetatable({}, {__index = Combs["炮火联盟-炸弹人"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["炸弹人-鬼书"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["炸弹人-大圣杯"]}))
    elseif (id == GetId("UH06")) then --丽桑卓
        unit:AddComb(setmetatable({}, {__index = Combs["冰雪之冠-丽桑卓"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["丽桑卓-鬼书"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["丽桑卓-帽子"]}))
    elseif (id == GetId("UH08")) then --小法
        unit:AddComb(setmetatable({}, {__index = Combs["黑暗魔法"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["小法师-鬼书"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["小法师-大圣杯"]}))
    elseif (id == GetId("UH11")) then --皇子
        unit:AddComb(setmetatable({}, {__index = Combs["草丛三剑客"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["皇子-九头蛇"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["皇子-黑切"]}))
    elseif (id == GetId("UH12")) then --赵信
        unit:AddComb(setmetatable({}, {__index = Combs["草丛三剑客"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["蛮易信"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["赵信-电刀"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["赵信-九头蛇"]}))
    elseif (id == GetId("UH13")) then --天使
        unit:AddComb(setmetatable({}, {__index = Combs["神圣与堕落-天使"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["天使-羊刀"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["天使-纳什之牙"]}))
    elseif (id == GetId("UH15")) then --盖伦
        unit:AddComb(setmetatable({}, {__index = Combs["草丛三剑客"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["正义兄妹-盖伦"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["盖伦-黑切"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["盖伦-日炎"]}))
    elseif (id == GetId("UH16")) then --蛮王
        unit:AddComb(setmetatable({}, {__index = Combs["蛮易信"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["美女与野兽"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["蛮王-无尽"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["蛮王-红叉"]}))
    elseif (id == GetId("UH19")) then --易大师
        unit:AddComb(setmetatable({}, {__index = Combs["蛮易信"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["易大师-无尽"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["易大师-电刀"]}))
    elseif (id == GetId("UH23")) then --小炮
        unit:AddComb(setmetatable({}, {__index = Combs["炮火联盟-小炮"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["小炮-电刀"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["小炮-无尽"]}))
    elseif (id == GetId("UH25")) then --艾希
        unit:AddComb(setmetatable({}, {__index = Combs["冰雪之冠-艾希"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["美女与野兽"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["艾希-飓风"]}))
        unit:AddComb(setmetatable({}, {__index = Combs["艾希-无尽"]}))
    end
end