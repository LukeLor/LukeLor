local itemModel = game:GetObjects("rbxassetid://REAL_ID_AFTER_I_MAKE_MODEL")[1]
local MaxDur = 100
itemModel:SetAttribute("Durability", math.random(75,MaxDur))
itemModel:SetAttribute("DurabilityMax", MaxDur)
itemModel:SetAttribute("RechargeProp", "Battery")

local cRoomVal = game.ReplicatedStorage.GameData.LatestRoom.Value 
local cRoomsFold = workspace.CurrentRooms
local lastestRoom = cRoomsFold[cRoomVal]
local cRoom = workspace:WaitForChild(game.Players.LocalPlayer.Name):GetAttribute("CurrentRoom")

cRoomsFold.DescendantAdded:Connect(function(child)
if child == "Battery" then
if itemModel.Parent == workspace:WaitForChild(game.Players.LocalPlayer.Name) then
if fireproximityprompt then
                                                
     end
 end
  end
