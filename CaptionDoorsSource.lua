module.Caption = function(text)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(text,true)
end


module.TypeCaption = function(text, typewait) 
for i = 1, #text do
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(string.sub(text,1,i) ,true)
task.wait(typewait)
end
end
