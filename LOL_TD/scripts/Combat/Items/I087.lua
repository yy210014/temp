local item = Items["烈焰斗篷"]
item.Timer = nil
local mArt1 = "Abilities\\Spells\\Other\\ImmolationRed\\ImmolationRedTarget.mdl"
function item:OnAdd()
    local owner = self.Owner
    owner.Attribute:add("冷却缩减", 0.1)
    self.Effect = AddSpecialEffectTarget(mArt1, owner.Entity, "chest")

    self.Timer = CreateTimer()
    TimerStart(
    self.Timer,
    1,
    true,
    function()
        local comb = owner:GetComb("草丛伦-日炎")
        AssetsManager.OverlapCircle(
        owner:X(),
        owner:Y(),
        900,
        function(unit)
            local damage = 30 * GetUnitLevel(owner.Entity)
            if (comb ~= nil and comb.Enable) then
                damage = damage + damage * 0.5
            end
            EXUnitDamageTarget(owner, unit, damage, EXDamageType.Magic)
        end
        )
    end
    )
end

function item:OnRemove()
    self.Owner.Attribute:add("冷却缩减", -0.1)
    DestroyTimer(self.Timer)
    DestroyEffect(self.Effect)
end