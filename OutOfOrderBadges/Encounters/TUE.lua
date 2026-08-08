local CustomAchievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau"))()
 CustomAchievements:Grant({
    Identifier = "OutOfOrderSurvive_TUE",
    Title = "I'm Watching",
    Desc = "Always watching...",
    Reason = "Survive the Universal Eye.",
    Image = "rbxassetid://113000083613394"
}, {
    CheckOwned = false,
    Remember = false
})
