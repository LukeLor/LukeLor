local doorModelName = "FakeDoor_Hotel" --Post Hotel+ BlockedDoorModel

local met = false --CHANGE THIS TO CHECK FOR ANY SIDE ROOMS AVAILABLE
local door = nil
for _, model in workspace.CurrentRooms:GetDescendants() do
if model.Name == "FakeDoor_Hotel" or model.Name == "BlockedDoorModel" then
		if model:IsA("Model") then
door = model
		met = true
		break
	end
end
	end

for _, parts in workspace.CurrentRooms:GetDescendants() do
if parts.Name == "BlockedDoor" then
parts:Destroy()
	end
end
	
if met then 
	if door.PrimaryPart == nil then
	door.PrimaryPart = door:FindFirstChildOfClass("BasePart")
	
	end
  local roomCFrame = door.PrimaryPart.CFrame      --CFrame.new(0,0,0) --REPLACE FOR REAL ENTRY CFRAME!
  loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

  --Animation Handler, mayhaps for Caiso?
 --[[ local AnimatorStore = game:GetObjects("rbxassetid://104077319394815")[1] --Thanks, Proxiom!!! (Again.)
local RepAnimator = AnimatorStore.ReplicatedStorage
RepAnimator.Parent = game.ReplicatedStorage
local AnimatorModule = require(RepAnimator.Animator)]]


  --Anim functions
 --[[ local LoadAnim = function(Rig, Animation)
	local Hum = Rig:FindFirstChildOfClass("Humanoid") 
	if Hum == nil then
Hum = Instance.new("Humanoid")
		if Rig:FindFirstChildOfClass("AnimationController") then
			local aC_Name = Rig:FindFirstChildOfClass("AnimationController").Name
Rig:FindFirstChildOfClass("AnimationController"):Destroy()
			Hum.Parent = Rig 
			Hum.Name = aC_Name
    end
		Hum.Parent = Rig 
end
		local Animator = AnimatorModule.new(Hum)
local AnimationTrack = Animator:LoadAnimation(Animation) 
	return AnimationTrack
end

local PlayAnim = function(AnimationTrack)
AnimationTrack:Play()
end
local StopAnim = function(AnimationTrack)
AnimationTrack:Stop()
  end]]

--Shop model
local Shop = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CaisoShop.rbxm")

if not Shop then 
--RBXASSETID ALTERNATIVE
		Shop = game:GetObjects("rbxassetid://131315785960673")[1]
	end
  
  Shop.Parent = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
Shop:PivotTo(roomCFrame)
Shop.PrimaryPart.Transparency = 1 
Shop.PrimaryPart.CanCollide = false
	door:Destroy()
	require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Spawned Shop.",true)
--Yay, Caiso content!
  --  local idleK = Shop.Caiso.RawAnimations.Idle
   -- local idlePlay = LoadAnim(Shop.Caiso, idleK)
 --  PlayAnim(idlePlay)
  --Test Item Purchase
  local chainPrompt = Shop.Shop.IsolatedChainPurchase.Body.PurchasePrompt
 chainPrompt.Triggered:Connect(function()
--Haha, just caption that you cant pick up. (For now.)
			require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("I can't purchase this item, due to the fact I don't even have the correct currency...",true)--thought
    end)
	local gumdropPrompt = Shop.Shop.Gumdrop.Root.Outer.PurchasePrompt
	gumdropPrompt.Parent.Parent.Anchored = true
 gumdropPrompt.Triggered:Connect(function()
--Haha, just caption that you cant pick up. (For now.)
			require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("I can't purchase this food, supported by the fact I don't even have the correct currency...",true)--thought		
		end)
	game.Players.LocalPlayer.Character:PivotTo(Shop.PrimaryPart.CFrame)
	
	require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Player Teleported.",true)



game:GetService("TextChatService").MessageReceived:Connect(function(msg)
if msg.Text == "/close" then
Shop:Destroy()
				require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Shop removed.",true)
		end	
	end)
end
