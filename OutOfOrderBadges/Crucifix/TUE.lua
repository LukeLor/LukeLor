local CustomAchievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau"))()

CustomAchievements:Grant({
    Identifier = "OutOfOrderCruc_TUE",
    Title = "No Longer Universal",
    Desc = "Eye had enough.",
    Reason = "Banish the Universal Eye",
    Image = "rbxassetid://140407725428176"
}, {
    CheckOwned = false,
    Remember = false
})
