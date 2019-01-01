local item = Items["日炎斗篷"]
item.Timer = nil

function item:OnAdd()
    local owner = self.Owner

    self.Timer = CreateTimer()
    TimerStart(
        self.Timer,
        0.5,
        true,
        function()
            local comb = owner:GetComb("盖伦-日炎")
            AssetsManager.OverlapCircle(
                owner:X(),
                owner:Y(),
                900,
                function(unit)
                    local damage = 100 + 20* GetUnitLevel(owner.Entity)
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
    DestroyTimer(self.Timer)
end
