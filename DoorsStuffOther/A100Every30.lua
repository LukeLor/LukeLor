local isMinus = game.ReplicatedStorage:FindFirstChild("Bricks") and true or false

loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsStuffOther/A100Every30Spawn.lua"))()


while task.wait(30) do

  if game.ReplicatedStorage.GameData.LatestRoom.Value ~= 100 and game.ReplicatedStorage.GameData.ChaseInSession.Value == false then
local cS = coroutine.create(function()
task.wait(30)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Next entity in 30 seconds..",true)



end)
    coroutine.resume(cS)
    if isMinus then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsStuffOther/A100Every30Minus.lua"))()
    else
      
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsStuffOther/A100Every30Spawn.lua"))()
  end

end
