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

Combs = setmetatable(
{},
{
    __index = function(self, name)
        self[name] = {}
        setmetatable(self[name], { __index = Comb })
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
            if (needHeroIds[i] == AllHeros[j].ProperName) then
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
 羁绊需求：草丛伦(SSR)+皇子(SR)+菊花信(SR)
 羁绊效果：草丛伦/皇子/菊花信获得60%的物理伤害加成|n
]]

function comb:HerosId()
    return { "草丛伦", "皇子", "菊花信" }
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理伤害加成", 0.6)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理伤害加成", -0.6)
end

comb = Combs["正义兄妹-草丛伦"]
comb.Ubertip = [[
-正义兄妹
 羁绊需求：草丛伦(SSR)+光辉(SR)
 羁绊效果：草丛伦增加审判伤害100%.
          光辉增加终极闪光技能伤害100%.|n
]]

function comb:HerosId()
    return { "草丛伦", "光辉" }
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
end

function comb:OnDisable()
end

comb = Combs["正义兄妹-光辉"]
comb.Ubertip = [[
-正义兄妹
 羁绊需求：草丛伦(SSR)+光辉(SR)
 羁绊效果：草丛伦增加审判伤害100%.
          光辉增加终极闪光技能伤害100%.|n
]]

function comb:HerosId()
    return { "草丛伦", "光辉" }
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
end

function comb:OnDisable()
end

comb = Combs["蛮易信"]
comb.Ubertip = [[
-蛮易信
 羁绊需求：蛮子(SR)+菊花信(SR)+剑圣(SR)
 羁绊效果：蛮子/菊花信/剑圣获得100%的暴击伤害和30%的物理伤害加成.|n
]]

function comb:HerosId()
    return { "蛮子", "菊花信", "剑圣" }
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("暴击伤害", 1)
    self.Owner.Attribute:add("物理伤害加成", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("暴击伤害", -1)
    self.Owner.Attribute:add("物理伤害加成", -0.3)
end

comb = Combs["美女与野兽"]
comb.Ubertip = [[
-美女与野兽
 羁绊需求：蛮子(SR)+寒冰(SR)
 羁绊效果：蛮子/寒冰获得额外100%的暴击伤害.|n
]]

function comb:HerosId()
    return { "蛮子", "寒冰" }
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("暴击伤害", 1)
end

function comb:OnDisable()
    self.Owner.Attribute:add("暴击伤害", -1)
end

comb = Combs["冰雪之冠-寒冰"]
comb.Ubertip = [[
-冰雪之冠
 羁绊需求：寒冰(SR)+冰女(SSR)
 羁绊效果：寒冰获得额外技能,专注射击.
          冰女得额外技能，寒冰血脉。|n
]]

function comb:HerosId()
    return { "寒冰", "冰女" }
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner:AddSkill("AH76")
end

function comb:OnDisable()
    self.Owner:RemoveSkill(GetId("AH76"))
end

comb = Combs["冰雪之冠-冰女"]
comb.Ubertip = [[
-冰雪之冠
 羁绊需求：寒冰(SR)+冰女(SSR)
 羁绊效果：寒冰获得额外技能,专注射击.
          冰女得额外技能，寒冰血脉。|n
]]

function comb:HerosId()
    return { "寒冰", "冰女" }
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner:AddSkill("AH75")
end

function comb:OnDisable()
    self.Owner:RemoveSkill(GetId("AH75"))
end

comb = Combs["炮火联盟-小炮"]
comb.Ubertip = [[
-炮火联盟
 羁绊需求：小炮(SR)+炸弹人(SSR)
 羁绊效果：增加小炮50%物理伤害加成
          增加炸弹人50%法术伤害加成|n
]]

function comb:HerosId()
    return { "小炮", "炸弹人" }
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理伤害加成", 0.5)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理伤害加成", -0.5)
end

comb = Combs["炮火联盟-炸弹人"]
comb.Ubertip = [[
-炮火联盟
 羁绊需求：小炮(SR)+炸弹人(SSR)
 羁绊效果：增加小炮50%物理伤害加成
          增加炸弹人50%法术伤害加成|n
]]

function comb:HerosId()
    return { "小炮", "炸弹人" }
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术伤害加成", 0.5)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术伤害加成", -0.5)
end

comb = Combs["神圣与堕落-大天使"]
comb.Ubertip = [[
-神圣与堕落
 羁绊需求：大天使(SR)+堕天使(SSR)
 羁绊效果：增加大天使80%攻速
          增加堕天使50%法术伤害加成|n
]]

function comb:HerosId()
    return { "大天使", "堕天使" }
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("攻击速度", 0.8)
end

function comb:OnDisable()
    self.Owner.Attribute:add("攻击速度", -0.8)
end

comb = Combs["神圣与堕落-堕天使"]
comb.Ubertip = [[
-神圣与堕落
 羁绊需求：大天使(SR)+堕天使(SSR)
 羁绊效果：增加大天使80%攻速
          增加堕天使50%法术伤害加成|n
]]

function comb:HerosId()
    return { "大天使", "堕天使" }
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术伤害加成", 0.5)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术伤害加成", -0.5)
end

comb = Combs["黑暗魔法"]
comb.Ubertip = [[
-黑暗魔法
 羁绊需求：小法师(SR)+堕天使(SSR)
 羁绊效果：增加小法师/堕天使50%法术伤害加成|n
]]

function comb:HerosId()
    return { "小法师", "堕天使" }
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术伤害加成", 0.5)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术伤害加成", -0.5)
end

comb = Combs["师徒二人"]
comb.Ubertip = [[
-师徒二人
 羁绊需求：剑圣(SR)+齐天大圣(SSR)
 羁绊效果：增加剑圣/齐天大圣50%物理伤害加成|n
]]

function comb:HerosId()
    return { "剑圣", "孙悟空" }
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理伤害加成", 0.5)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理伤害加成", -0.5)
end


comb = Combs["皇子-大九头蛇"]
comb.Ubertip = [[
-大九头蛇
 羁绊需求：皇子+大九头蛇
 羁绊效果：增加皇子30%物理穿透|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I052")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理穿透", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理穿透", -0.3)
end

comb = Combs["皇子-切割者"]
comb.Ubertip = [[
-切割者
 羁绊需求：皇子+切割者
 羁绊效果：额外增加皇子“巨龙撞击”10点减甲效果|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I050")) == true)
end

function comb:OnEnable()
end

function comb:OnDisable()
end

comb = Combs["菊花信-电刀"]
comb.Ubertip = [[
-电刀
 羁绊需求：菊花信+电刀
 羁绊效果：增加菊花信30%的暴击率|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I027")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("暴击", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("暴击", -0.3)
end

comb = Combs["菊花信-大九头蛇"]
comb.Ubertip = [[
-大九头蛇
 羁绊需求：菊花信+大九头蛇
 羁绊效果：增加菊花信30%攻击速度|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I052")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("攻击速度", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("攻击速度", -0.3)
end

comb = Combs["光辉-大圣杯"]
comb.Ubertip = [[
-大圣杯
 羁绊需求：光辉+大圣杯
 羁绊效果：增加光辉30%法术穿透|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I071")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术穿透", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术穿透", -0.3)
end

comb = Combs["光辉-鬼书"]
comb.Ubertip = [[
-鬼书
 羁绊需求：光辉+鬼书
 羁绊效果：增加光辉“终极闪光”技能伤害50%|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I075")) == true)
end

function comb:OnEnable()
end

function comb:OnDisable()
end

comb = Combs["堕天使-冰杖"]
comb.Ubertip = [[
-冰杖
 羁绊需求：堕天使+冰杖
 羁绊效果：增加堕天使“痛苦腐蚀”技能伤害50%|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I096")) == true)
end

function comb:OnEnable()
end

function comb:OnDisable()
end

comb = Combs["堕天使-痛苦面具"]
comb.Ubertip = [[
-痛苦面具
 羁绊需求：堕天使+痛苦面具
 羁绊效果：增加堕天使30%法术穿透|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I100")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术穿透", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术穿透", -0.3)
end

comb = Combs["小炮-电刀"]
comb.Ubertip = [[
-电刀
 羁绊需求：小炮+电刀
 羁绊效果：增加小炮30%的物理穿透|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I027")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理穿透", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理穿透", -0.3)
end

comb = Combs["小炮-无尽"]
comb.Ubertip = [[
-无尽
 羁绊需求：小炮+无尽
 羁绊效果：增加小炮50%的额外暴击伤害|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I043")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("暴击伤害", 0.5)
end

function comb:OnDisable()
    self.Owner.Attribute:add("暴击伤害", -0.5)
end

comb = Combs["大天使-羊刀"]
comb.Ubertip = [[
-羊刀
 羁绊需求：大天使+羊刀
 羁绊效果：增加大天使30%的物理穿透|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I090")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理穿透", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理穿透", -0.3)
end

comb = Combs["大天使-纳什之牙"]
comb.Ubertip = [[
-纳什之牙
 羁绊需求：大天使+纳什之牙
 羁绊效果：增加大天使30%的法术穿透|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I083")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术穿透", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术穿透", -0.3)
end

comb = Combs["炸弹人-帽子"]
comb.Ubertip = [[
-帽子
 羁绊需求：炸弹人+帽子
 羁绊效果：增加炸弹人“地狱火炮”技能伤害50%|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I073")) == true)
end

function comb:OnEnable()
end

function comb:OnDisable()
end

comb = Combs["炸弹人-法穿棒"]
comb.Ubertip = [[
-法穿棒
 羁绊需求：炸弹人+法穿棒
 羁绊效果：增加炸弹人30%的法术穿透|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I069")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术穿透", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术穿透", -0.3)
end

comb = Combs["寒冰-飓风"]
comb.Ubertip = [[
-飓风
 羁绊需求：寒冰+飓风
 羁绊效果：增加飓风额外箭矢50%的伤害|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I058")) == true)
end

function comb:OnEnable()
end

function comb:OnDisable()
end

comb = Combs["寒冰-无尽"]
comb.Ubertip = [[
-无尽
 羁绊需求：寒冰+无尽
 羁绊效果：增加寒冰50%的额外暴击伤害|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I043")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("暴击伤害", 0.5)
end

function comb:OnDisable()
    self.Owner.Attribute:add("暴击伤害", -0.5)
end

comb = Combs["草丛伦-切割者"]
comb.Ubertip = [[
-切割者
 羁绊需求：草丛伦+切割者
 羁绊效果：增加草丛伦30%的物理穿透|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I050")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理穿透", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理穿透", -0.3)
end

comb = Combs["草丛伦-烈焰斗篷"]
comb.Ubertip = [[
-烈焰斗篷
 羁绊需求：草丛伦+烈焰斗篷
 羁绊效果：增加烈焰斗篷50%伤害|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I087")) == true)
end

function comb:OnEnable()
end

function comb:OnDisable()
end

comb = Combs["蛮子-无尽"]
comb.Ubertip = [[
-无尽
 羁绊需求：蛮子+无尽
 羁绊效果：增加蛮子50%的额外暴击伤害|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I043")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("暴击伤害", 0.5)
end

function comb:OnDisable()
    self.Owner.Attribute:add("暴击伤害", -0.5)
end

comb = Combs["蛮子-红叉"]
comb.Ubertip = [[
-红叉
 羁绊需求：蛮子+红叉
 羁绊效果：增加蛮子30%的攻击速度|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I056")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("攻击速度", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("攻击速度", -0.3)
end

comb = Combs["冰女-鬼书"]
comb.Ubertip = [[
-鬼书
 羁绊需求：冰女+鬼书
 羁绊效果：增加冰女“寒冰碎片”技能伤害50%|n
 ]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I075")) == true)
end

function comb:OnEnable()
end

function comb:OnDisable()
end

comb = Combs["冰女-痛苦面具"]
comb.Ubertip = [[
-痛苦面具
 羁绊需求：冰女+痛苦面具
 羁绊效果：增加冰女30%的法术穿透|n
 ]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I100")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术穿透", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术穿透", -0.3)
end

comb = Combs["剑圣-无尽"]
comb.Ubertip = [[
-无尽
 羁绊需求：剑圣+无尽
 羁绊效果：增加易50%额外暴击伤害|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I043")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("暴击伤害", 0.5)
end

function comb:OnDisable()
    self.Owner.Attribute:add("暴击伤害", -0.5)
end

comb = Combs["剑圣-电刀"]
comb.Ubertip = [[
-电刀
 羁绊需求：剑圣+电刀
 羁绊效果：增加剑圣30%的暴击率|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I027")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("暴击", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("暴击", -0.3)
end

comb = Combs["小法师-鬼书"]
comb.Ubertip = [[
-鬼书
 羁绊需求：小法师+鬼书
 羁绊效果：增加小法师30%的法术穿透|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I075")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("法术穿透", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("法术穿透", -0.3)
end

comb = Combs["小法师-大圣杯"]
comb.Ubertip = [[
-大圣杯
 羁绊需求：小法师+大圣杯
 羁绊效果：增加小法师“能量爆裂”技能伤害50%|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I071")) == true)
end

function comb:OnEnable()
end

function comb:OnDisable()
end

comb = Combs["齐天大圣-三相"]
comb.Ubertip = [[
-三相
 羁绊需求：齐天大圣+三相
 羁绊效果：增加齐天大圣30%的物理穿透|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I045")) == true)
end

function comb:OnEnable()
    self.Owner.Attribute:add("物理穿透", 0.3)
end

function comb:OnDisable()
    self.Owner.Attribute:add("物理穿透", 0.3)
end

comb = Combs["齐天大圣-吸蓝刀"]
comb.Ubertip = [[
-吸蓝刀
 羁绊需求：齐天大圣+吸蓝刀
 羁绊效果：增加齐天大圣“如意打击”技能伤害50%|n
]]

function comb:HerosId()
    return { self.Owner.Id }
end

function comb:Conditions()
    return (UnitHasItemOfTypeBJ(self.Owner.Entity, GetId("I085")) == true)
end

function comb:OnEnable()
end

function comb:OnDisable()
end

comb = Combs["5个辅助"]
comb.Ubertip = [[
-5个辅助
]]

function comb:HerosId()
    return { "风女", "琴女", "日女", "时光老头", "牛头" }
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    SetPlayerState(self.Owner.Player, PLAYER_STATE_FOOD_CAP_CEILING, 110)
    SetPlayerState(self.Owner.Player, PLAYER_STATE_RESOURCE_FOOD_CAP, 110)
end

function comb:OnDisable()
    SetPlayerState(self.Owner.Player, PLAYER_STATE_FOOD_CAP_CEILING, 100)
    SetPlayerState(self.Owner.Player, PLAYER_STATE_RESOURCE_FOOD_CAP, 100)
end


comb = Combs["4条龙"]
comb.Ubertip = [[
-4条龙
]]

function comb:HerosId()
    return { "水蜉蝣龙", "土蜉蝣龙", "火蜉蝣龙", "风蜉蝣龙" }
end

function comb:Conditions()
    return testA(self, self:HerosId())
end

function comb:OnEnable()
    SetPlayerState(self.Owner.Player, PLAYER_STATE_FOOD_CAP_CEILING, 110)
    SetPlayerState(self.Owner.Player, PLAYER_STATE_RESOURCE_FOOD_CAP, 110)
end

function comb:OnDisable()
    SetPlayerState(self.Owner.Player, PLAYER_STATE_FOOD_CAP_CEILING, 100)
    SetPlayerState(self.Owner.Player, PLAYER_STATE_RESOURCE_FOOD_CAP, 100)
end

function AddComb(unit)
    local id = unit.ProperName
    local newComb = {}
    if (id == "光辉") then --光辉
        unit:AddComb(setmetatable({}, { __index = Combs["正义兄妹-光辉"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["光辉-鬼书"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["光辉-大圣杯"] }))
    elseif (id == "堕天使") then --堕天使
        unit:AddComb(setmetatable({}, { __index = Combs["神圣与堕落-堕天使"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["黑暗魔法"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["堕天使-冰杖"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["堕天使-痛苦面具"] }))
    elseif (id == "炸弹人") then --炸弹人
        unit:AddComb(setmetatable({}, { __index = Combs["炮火联盟-炸弹人"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["炸弹人-帽子"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["炸弹人-法穿棒"] }))
    elseif (id == "冰女") then --冰女
        unit:AddComb(setmetatable({}, { __index = Combs["冰雪之冠-冰女"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["冰女-鬼书"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["冰女-痛苦面具"] }))
    elseif (id == "小法师") then --小法师
        unit:AddComb(setmetatable({}, { __index = Combs["黑暗魔法"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["小法师-大圣杯"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["小法师-鬼书"] }))
    elseif (id == "皇子") then --皇子
        unit:AddComb(setmetatable({}, { __index = Combs["草丛三剑客"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["皇子-大九头蛇"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["皇子-切割者"] }))
    elseif (id == "菊花信") then --菊花信
        unit:AddComb(setmetatable({}, { __index = Combs["草丛三剑客"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["蛮易信"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["菊花信-大九头蛇"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["菊花信-电刀"] }))
    elseif (id == "大天使") then --大天使
        unit:AddComb(setmetatable({}, { __index = Combs["神圣与堕落-大天使"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["大天使-纳什之牙"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["大天使-羊刀"] }))
    elseif (id == "草丛伦") then --草丛伦
        unit:AddComb(setmetatable({}, { __index = Combs["草丛三剑客"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["正义兄妹-草丛伦"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["草丛伦-烈焰斗篷"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["草丛伦-切割者"] }))
    elseif (id == "蛮子") then --蛮子
        unit:AddComb(setmetatable({}, { __index = Combs["蛮易信"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["美女与野兽"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["蛮子-无尽"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["蛮子-红叉"] }))
    elseif (id == "剑圣") then --剑圣
        unit:AddComb(setmetatable({}, { __index = Combs["蛮易信"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["师徒二人"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["剑圣-电刀"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["剑圣-无尽"] }))
    elseif (id == "小炮") then --小炮
        unit:AddComb(setmetatable({}, { __index = Combs["炮火联盟-小炮"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["小炮-电刀"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["小炮-无尽"] }))
    elseif (id == "寒冰") then --寒冰
        unit:AddComb(setmetatable({}, { __index = Combs["冰雪之冠-寒冰"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["美女与野兽"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["寒冰-飓风"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["寒冰-无尽"] }))
    elseif (id == "孙悟空") then --齐天大圣
        unit:AddComb(setmetatable({}, { __index = Combs["师徒二人"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["齐天大圣-三相"] }))
        unit:AddComb(setmetatable({}, { __index = Combs["齐天大圣-吸蓝刀"] }))
    elseif (id == "风女" or id == "琴女" or id == "日女" or id == "时光老头" or id == "牛头") then
        unit:AddComb(setmetatable({}, { __index = Combs["5个辅助"] }))
        --  elseif (id == "水蜉蝣龙" or id == "土蜉蝣龙" or id == "火蜉蝣龙" or id == "风蜉蝣龙") then 
        --     unit:AddComb(setmetatable({}, { __index = Combs["4条龙"] }))
    end
end