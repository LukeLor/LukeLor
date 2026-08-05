  loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

local UI = LoadCustomInstance("https://github.com/LukeLor/LukeLor/blob/main/DoorsStuffOther/SpawnerUI.rbxm?raw=true")


UI.Parent = game.Players.LocalPlayer.PlayerGui

local SetupButton = function(Text, link, menu) -- Spawn, Timed

local templateButton = UI.MainFrame.SpawnMenu.Template:Clone()

templateButton.Parent = UI.MainFrame[tostring(menu).."Menu"]
templateButton.Text = tostring(Text)
templateButton.Name = tostring(Text)
templateButton.MouseButton1Click:Connect(function()

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







