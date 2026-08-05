  loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

local UI = LoadCustomInstance("https://github.com/LukeLor/LukeLor/blob/main/DoorsStuffOther/SpawnerUI.rbxm?raw=true")


UI.Parent = game.Players.LocalPlayer.PlayerGui

local SetupButton = function(Text, link, menu) -- Spawn, Timed

local templateButton = UI.MainFrame.SpawnMenu.Template:Clone()

templateButton.Parent = UI.MainFrame[tostring(menu).."Menu"]
templateButton.Text = tostring(Text)
templateButton.Name = tostring(Text)
templateButton.MouseButton1Click:Connect(function()
templateButton.Visible = true
loadstring(game:HttpGet(link))()      
end)

  
end

UI.MainFrame.SpawnMenu.Visible = false
UI.MainFrame.TimedMenu.Visible = false

UI.MainFrame.ButtonArea.IconHitArea.MouseButton1Click:Connect(function()
    if UI.MainFrame.TimedMenu.Visible == true then
UI.MainFrame.TimedMenu.Visible = false
    end
if UI.MainFrame.SpawnMenu.Visible == false then
UI.MainFrame.SpawnMenu.Visible = true
    else
UI.MainFrame.SpawnMenu.Visible = false  
    end
  end)

UI.MainFrame.ButtonAreaTime.IconHitArea.MouseButton1Click:Connect(function()
     if UI.MainFrame.SpawnMenu.Visible == true then
UI.MainFrame.SpawnMenu.Visible = false
    end
if UI.MainFrame.TimedMenu.Visible == false then
UI.MainFrame.TimedMenu.Visible = true
    else
UI.MainFrame.TimedMenu.Visible = false  
    end
  end)



SetupButton("A-100", "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsStuffOther/A100.lua", "Spawn") -- Menus: Spawn, Timed
SetupButton("A-15", "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsStuffOther/A15.lua", "Spawn") -- Menus: Spawn, Timed
SetupButton("A-35", "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsStuffOther/A35.lua", "Spawn") -- Menus: Spawn, Timed
SetupButton("A-60", "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsStuffOther/A60.lua", "Spawn") -- Menus: Spawn, Timed
SetupButton("Ambush Every 30 Seconds", "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsStuffOther/AmbushEvery30Main.lua", "Timed") -- Menus: Spawn, Timed
SetupButton("Rush Every 30 Seconds", "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsStuffOther/RushEvery30Main.lua", "Timed") -- Menus: Spawn, Timed
SetupButton("Ripper Every 30 Seconds", "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsStuffOther/RipperEvery30Main.lua", "Timed") -- Menus: Spawn, Timed
SetupButton("Silence Every 30 Seconds", "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsStuffOther/SilenceEvery30Main.lua", "Timed") -- Menus: Spawn, Timed
SetupButton("A-100 Every 30 Seconds", "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsStuffOther/A100Every30.lua", "Timed") -- Menus: Spawn, Timed

