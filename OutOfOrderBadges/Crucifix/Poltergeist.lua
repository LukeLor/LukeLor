local CustomAchievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau"))()
 CustomAchievements:Grant({
    Identifier = "OutOfOrderCrucifix_Poltergeist",
    Title = "Busted",
    Desc = "Seems like you got caught in the act, strange ghost!",
    Reason = "Banish Poltergeist.",
    Image = "rbxassetid://108478012147289"
}, {
    CheckOwned = false,
    Remember = false
})
