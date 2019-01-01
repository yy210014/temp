local item = Items["巨人熔渣"]
item.Timer = nil

function item:OnAdd()
    local owner = self.Owner

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
                    EXUnitDamageTarget(owner, unit, 50 + 20 * GetUnitLevel(owner.Entity), EXDamageType.Magic)
                end
            )
        end
    )
end

function item:OnRemove()
    local unit = self.Owner
    DestroyTimer(self.Timer)
end
