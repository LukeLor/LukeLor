loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local itemModel = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/EntityRadar.rbxm")
if not itemModel then return end
local MaxDur = 200
local DurSlots = 4
local slotDur = MaxDur/DurSlots
itemModel:SetAttribute("Durability", math.random((MaxDur/4)*3,MaxDur))
itemModel:SetAttribute("DurabilityMax", MaxDur)
itemModel:SetAttribute("RechargeProp", "Battery")
itemModel:SetAttribute("DurabilitySlots", DurSlots)
itemModel:SetAttribute("NamePlural","Entity Radars")
itemModel:SetAttribute("NameSingular","Entity Radar")
itemModel:SetAttribute("CanOwnMultiple",false)
itemModel:SetAttribute("CanBeZero",true)
itemModel:SetAttribute("Pickup","EntityRadar")
itemModel:SetAttribute("Single",true)
itemModel:SetAttribute("Interactable",true)

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
  end)

local drainBattery = false
itemModel.Equipped:Connect(function()
drainBattery = true
    end)

itemModel.Unequipped:Connect(function()
drainBattery = false
    end)


while task.wait(0.5) do 
if drainBattery then

itemModel:SetAttribute("Durability", itemModel:GetAttribute() - 1.5)
        if itemModel:GetAttribute() < slotDur*3 then
itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery.Visible = false
itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery1.Visible = true
itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery2.Visible = true
            itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery3.Visible = true
        elseif itemModel:GetAttribute() < slotDur*2 then
itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery1.Visible = false
itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery.Visible = false
itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery2.Visible = true
            itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery3.Visible = true
        elseif itemModel:GetAttribute() < slotDur*1 then
            itemModel.Screen.ScreenUI.Frame.Frame.Battery2.Battery.Visible = false
itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery3.Visible = false
itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery1.Visible = false
            itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery.Visible = true
        elseif itemModel:GetAttribute() <= slotDur*0 then
itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery.Visible = false
itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery1.Visible = false
            itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery2.Visible = false
            itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery3.Visible = false
        elseif itemModel:GetAttribute() <= slotDur*4 then
            itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery.Visible = true
            itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery1.Visible = true
            itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery2.Visible = true
            itemModel.Screen.ScreenUI.Frame.Frame.Battery.Battery3.Visible = true
            
        end
    end
    
end
