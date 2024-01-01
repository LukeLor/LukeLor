-- Achievement
local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

-- Creates and displays your custom achievement
Achievements.Get({
    Title = "Rushing Glitch",
    Desc = "What happened to Rush..?",
    Reason = 'Encounter Rush but glitched out',
    Image = "Your Image Link With Https://",
})
