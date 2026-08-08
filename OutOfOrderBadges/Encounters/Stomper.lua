local CustomAchievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau"))()
 CustomAchievements:Grant({
    Identifier = "OutOfOrderSurvive_Stomper",
    Title = "Flattered",
    Desc = "…that you can't crush me? Let's keep it that way.",
    Reason = "Survive Stomper.",
    Image = "rbxassetid://113000083613394"
}, {
    CheckOwned = false,
    Remember = false
})
