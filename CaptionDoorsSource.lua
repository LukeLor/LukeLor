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

return module
