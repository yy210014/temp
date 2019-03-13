local item = Items["残破的火焰之心"]
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
            EXUnitDamageTarget(owner, unit, 10 * Game.GetLevel(), EXAbilityType.Magic)
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


function item:OnKill(dieUnit)
    local count = self:GetCharges() + 1
    self:SetCharges(count)
    if (count >= 200) then
        RemoveItem(self.Entity)
        SetPlayerState(
        self.Owner.Player,
        PLAYER_STATE_RESOURCE_LUMBER,
        GetPlayerState(self.Owner.Player, PLAYER_STATE_RESOURCE_LUMBER) + 1
        )
        DisplayTextToPlayer(self.Owner.Player, 0, 0, "残破的火焰之心已经破碎，你获得1点天赋点!")
    end
end