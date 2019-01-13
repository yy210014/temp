local skill = Skills["返回"]
function skill:OnCast()
    if GetLocalPlayer() == self.Owner.Player then
        ClearSelection()
        SelectUnit(self.Owner.SelectUnit.Entity, true)
    end
end