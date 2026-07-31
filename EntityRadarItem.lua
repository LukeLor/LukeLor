local itemModel = game:GetObjects("rbxassetid://REAL_ID_AFTER_I_MAKE_MODEL")[1]
local MaxDur = 100
itemModel:SetAttribute("Durability", math.random(75,MaxDur))
itemModel:SetAttribute("DurabilityMax", MaxDur)
itemModel:SetAttribute("RechargeProp", "Battery")
itemModel:SetAttribute("DurabilitySlots", 5)
itemModel:SetAttribute("NamePlural","Entity Radars")
itemModel:SetAttribute("NameSingular","Entity Radar")
itemModel:SetAttribute("CanOwnMultiple",false)
itemModel:SetAttribute("CanBeZero",true)

local cRoomVal = game.ReplicatedStorage.GameData.LatestRoom.Value 
local cRoomsFold = workspace.CurrentRooms
local lastestRoom = cRoomsFold[cRoomVal]
local cRoom = workspace:WaitForChild(game.Players.LocalPlayer.Name):GetAttribute("CurrentRoom")

cRoomsFold.DescendantAdded:Connect(function(child)
if child == "Battery" then
    child.ModulePrompt.Triggered:Connect(function()
if itemModel.Parent == workspace:WaitForChild(game.Players.LocalPlayer.Name) then
itemModel:SetAttribute("Durability", itemModel:GetAttribute("Durability")+math.random(8,25))
                     if child then
child:Destroy()
                        end
 end
        end)
  end
