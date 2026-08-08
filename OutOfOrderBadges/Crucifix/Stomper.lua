local CustomAchievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau"))()

CustomAchievements:Grant({
    Identifier = "OutOfOrderCruc_Stomper",
    Title = "Stupid Foot",
    Desc = "Get stomped oooonnnn!",
    Reason = "Banish Stomper.",
    Image = "rbxassetid://117242422256656"
}, {
    CheckOwned = false,
    Remember = false
})
