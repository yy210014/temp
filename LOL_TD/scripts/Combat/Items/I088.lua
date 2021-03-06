local item = Items["火焰之心"]
item.Timer = nil
local mArt1 = "Abilities\\Spells\\Other\\ImmolationRed\\ImmolationRedTarget.mdl"

function item:OnAdd()
    local owner = self.Owner
    self.Effect = AddSpecialEffectTarget(mArt1, owner.Entity, "chest")

    self.Timer = CreateTimer()
    TimerStart(
    self.Timer,
    1,
    true,
    function()
        AssetsManager.OverlapCircle(
        owner:X(),
        owner:Y(),
        900,
        function(unit)
            EXUnitDamageTarget(owner, unit,  18 * GetUnitLevel(owner.Entity), EXAbilityType.Magic)
        end
        )
    end
    )
end

function item:OnRemove()
    local unit = self.Owner
    DestroyTimer(self.Timer)
    DestroyEffect(self.Effect)
end