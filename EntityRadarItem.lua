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
            local ToolHasNeedsBattery

            for _, Tool in LocalPlayer.Backpack:GetChildren() do
                if Tool:GetAttribute("RechargeProp") == "Battery" and Tool:GetAttribute("Durability") < Tool:GetAttribute("DurabilityMax") then
                    ToolHasNeedsBattery = Tool

                    break
                end
    end
  end
