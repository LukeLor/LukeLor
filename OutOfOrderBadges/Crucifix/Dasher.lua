local CustomAchievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau"))()
 CustomAchievements:Grant({
    Identifier = "OutOfOrderCruc_Dasher",
    Title = "Undash",
    Desc = "Seems like someone's got some issues dashing around!",
    Reason = "Banish Dasher.",
    Image = "rbxassetid://118705619437445"
}, {
    CheckOwned = false,
    Remember = false
})
