local module = {}

module.Caption = function(text)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(text,true)
end


module.TypeCaption = function(text, typewait) 
for i = 1, #text do
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(string.sub(text,1,i) ,true)
    if typewait ~= nil then
task.wait(typewait)
    else
      task.wait(0.2)
    end
end
end

module.SpeakerIconShow = function(IconId)
    local newui = Instance.new("ScreenGui")
    newui.Parent = game.Players.LocalPlayer.PlayerGui
    newui.Name = "SpeakerIcon"


    local icon = "rbxassetid://"..IconId
    local captiontext = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Caption
local iconholder = Instance.new("ImageLabel")
iconholder.Name = "Icon"
    iconholder.Image = icon
    iconholder.Parent = newui

  local pos =  captiontext.Position + Vector2.new(0,15)
iconholder.Size = UDim.new(7,7)


end
module.SpeakerIconHide = function()
    local newui = game.LocalPlayer.PlayerGui.SpeakerIcon
    
local iconholder = newui.Icon

local ts = game:GetService("TweenService")
    ts:Create(iconholder, TweenInfo.new(1.5), {ImageTransparency = 1}):Play()

    wait(2)
    newui:Destroy()
end

for name, func in module do
    if typeof(func) == "function" then
        getgenv()[name] = func
    end
end

return module

