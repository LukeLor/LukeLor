local CustomAchievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau"))()
 CustomAchievements:Grant({
    Identifier = "OutOfOrderCruc_Dasher",
    Title = "Dashing Through",
    Desc = "The Doors...",
    Reason = "Survive Dasher",
    Image = "rbxassetid://118705619437445"
}, {
    CheckOwned = false,
    Remember = false
})
