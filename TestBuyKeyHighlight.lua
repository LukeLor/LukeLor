local CurrencyManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Custom-Currency/Main.luau"))()
local balance = CurrencyManager:CheckBalance("Shinies")
if balance >= 60 then

for _, obj in workspace:GetDescendants() do
if obj.Name == "KeyObtain" then
local highlight = Instance.new("Highlight")
highlight.Parent = obj
local doorPart = Instance.new("Part")
doorPart.Parent = workspace
doorPart.CanCollide = false
doorPart.Anchored = true
doorPart.Size = Vector3.new(1,1,1)
doorPart.CFrame = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:WaitForChild("RoomExit").CFrame
CurrencyManager:UpdateCurrency({Identifier = "Shinies"}, -60)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(tostring(CurrencyManager:CheckBalance("Shinies")).." is your new balance, highlighted room key")
return
end
end
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Couldn't find key... no Shinies used.")
--[[if game.Players.LocalPlayer.Character then
        game.Players.LocalPlayer.Character:SetAttribute("CanJump", true)
                CurrencyManager:UpdateCurrency({Identifier = "Shinies"}, -30)
                require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(tostring(CurrencyManager:CheckBalance("Shinies")).." is your new 'Shinies' balance.", true)
    end]]
end
