local skill = Skills["弹射"]

function skill:OnLearned()
    --AddPlayerTechResearched(self.Owner.Player, "R001", GetPlayerTechCount(self.Owner.Player, "R001", true) + 1)
    SetPlayerTechResearched(
        self.Owner.Player,
        GetId("R001"),
        GetPlayerTechCount(self.Owner.Player, GetId("R001"), true) + 1
    )
end
