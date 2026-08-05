  loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

local UI = LoadCustomInstance("https://github.com/LukeLor/LukeLor/blob/main/DoorsStuffOther/SpawnerUI.rbxm?raw=true")


UI.Parent = game.Players.LocalPlayer.PlayerGui

local SetupButton = function(Text, link)

local templateButton = UI.MainFrame.SpawnMenu.Template:Clone()

templateButton.Parent = UI.MainFrame.SpawnMenu
templateButton.Text = tostring(Text)
templateButton.Name = tostring(Text)
templateButton.MouseButton1Click:Connect(function()

loadstring(game:HttpGet(link))()      
end)

  
end
