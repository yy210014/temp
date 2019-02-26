local item = Items["回声法杖"]
item.LastAttackTime = 0
local mMaxNum = 5
local mRange = 900
--local mArt = "AZ_LOL_LDDHS.mdl"
local mArt = "BombMissile.mdl"
Ubertip = "伤害型技能会触发范围爆炸对最多5个单位造成（100+0.5*法术攻击）点法术伤害，冷却时间：5秒|r|n|Cffff0000合成公式：遗失的篇章+大魔杖+回声法杖（卷轴）=回声法杖|r|n"

function item:OnAdd()
    local unit = self.Owner
    unit.Attribute:add("冷却缩减", 0.1)
end

function item:OnRemove()
    local unit = self.Owner
    unit.Attribute:add("冷却缩减", -0.1)
end

function item:OnSkillDamage(defUnit)
    if (GameScene.Elapsed - self.LastAttackTime > 5) then
        self.LastAttackTime = GameScene.Elapsed
        local spellUnit = self.Owner
        local count = 0
        AssetsManager.OverlapCircle(
        defUnit:X(),
        defUnit:Y(),
        mRange,
        function(unit)
            if (count <= mMaxNum) then
                count = count + 1
                local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
                dummy.Name = "回声法杖马甲"
                dummy.Effect = AddSpecialEffectTarget(mArt, dummy.Entity, "origin")
                dummy.Owner = self.Owner
                dummy.Target = unit
                local locom = dummy:AddLocomotion("跳跃")
                locom:Start(unit, 1.5, 350, self.OnPathEnd)
            end
        end
        )
    end
end

item.OnPathEnd = function(dummy)
    AssetsManager.RemoveObject(dummy)
    local owner = dummy.Owner
    local ap = owner.Attribute:get("法术攻击")
    local damage = 500 + ap * 0.5
    EXUnitDamageTarget(owner, dummy.Target, damage, EXAbilityType.Magic)
end