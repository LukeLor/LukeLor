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
    local icon = "rbxassetid://"..IconId
    local captiontext = nil --Will find where later
local iconholder = Instance.new("ImageLabel")
    iconholder.Image = icon
  local pos =  caption

end
return module

