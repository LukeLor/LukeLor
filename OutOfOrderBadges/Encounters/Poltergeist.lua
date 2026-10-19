local CustomAchievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau"))()
 CustomAchievements:Grant({
    Identifier = "OutOfOrderSurvive_Poltergeist",
    Title = "Spooky Scary",
    Desc = "...ghosts. Not skeletons.",
    Reason = "Survive Poltergeist.",
    Image = "rbxassetid://108478012147289"
}, {
    CheckOwned = false,
    Remember = false
})
