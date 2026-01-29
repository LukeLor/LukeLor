loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

local moduleScripts = {
	Module_Events = require(ReplicatedStorage.ModulesClient.Module_Events),
	Main_Game = require(playerGui.MainUI.Initiator.Main_Game),
	Earthquake = require(remotesFolder.RequestAsset:InvokeServer("Earthquake"))
}
local gameStats = game.ReplicatedStorage:WaitForChild("GameStats")
local plr = game.Players.LocalPlayer
local char = workspace:FindFirstChild(plr.Name)
local roof_finder = Instance.new("Part")
roof_finder.Anchored = true
roof_finder.Position = char.HumanoidRootPart.Position
roof_finder.Size = Vector3.new(1,1,1)
roof_finder.CanCollide = false
roof_finder.CanTouch = true
roof_finder.Parent = workspace
roof_finder.Name = "Roof_Finder"
roof_finder.Transparency = 1

function GetCurrentRoom(latest)
    if latest then
        return workspace.CurrentRooms:GetChildren()[#workspace.CurrentRooms:GetChildren()]
    end
    return workspace.CurrentRooms:FindFirstChild(localPlayer:GetAttribute("CurrentRoom"))
end

function EQ(currentRoom)
task.spawn(function()
task.defer(moduleScripts.Earthquake, moduleScripts.Main_Game, currentRoom)
end)
end
function Stomper(pos:CFrame)

	local newvel = Instance.new("VectorForce")
	newvel.Force =Vector3.new(0,10000,5000)
	local stompermodel = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Stomper.rbxm")
	stompermodel.Parent = workspace
	stompermodel.Root.Anchored = true
	local takedmg = true
	
	local soundpart = Instance.new("Part")
	stompermodel.Leg.Spawn.Parent = soundpart
	soundpart.Parent = workspace
	soundpart.CFrame = pos
	soundpart.Anchored = true
	soundpart.Transparency = 1
	soundpart.Size = Vector3.new(1,1,1)
	wait(0.1)
	stompermodel:PivotTo(stompermodel.Root.CFrame + Vector3.new(0,100,0))
	soundpart.Spawn:Play()
	task.wait(1.3)
EQ(GetCurrentRoom(false))
	soundpart.Spawn:Play()
	wait(1.5)
	stompermodel:PivotTo(pos)
	soundpart:Destroy()
	
	for i = 0, 12, 1 do
		if stompermodel.Leg.Teeth.Position.Y > char.HumanoidRootPart.Position.Y then
	stompermodel:PivotTo(stompermodel.Root.CFrame - Vector3.new(0,2,0))
		end
		if stompermodel.Leg.Teeth.Position.Y <= char.HumanoidRootPart.Position.Y then
		--Do nothing
		end
	wait()
		stompermodel.CamDeath.Touched:Connect(function(TouchedParts)
			if TouchedParts.Parent:FindFirstChild("Humanoid") then





				if char.Humanoid.Health <= 25 and takedmg then
					local cc = workspace.CurrentCamera
					TouchedParts.Parent.Humanoid.WalkSpeed = 0
					TouchedParts.Parent.HumanoidRootPart.Anchored = true
					cc.CameraType = Enum.CameraType.Scriptable
					game:GetService("TweenService"):Create(cc, TweenInfo.new(1), {CFrame = CFrame.new(cc.CFrame.Position, stompermodel.Leg.MouthBlack.Position)}):Play()
					wait(1)
					TouchedParts.Parent:FindFirstChild("Humanoid"):TakeDamage(25)
						if firesignal then
					firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"You died to The Stomper...", "It'll make banging noises to indicate its there.", "Make sure to move out of its way when it tries crushing you!"}, "Blue")
						gameStats["Player_".. localPlayer.Name].Total.DeathCause.Value = "Stomper"
		
				else
					warn("firesignal not supported, ignore death hints.")
				end
				end
			end
		end)
		stompermodel.Hitbox.Touched:Connect(function(TouchedParts)
			if TouchedParts.Parent:FindFirstChild("Humanoid") and takedmg then
				TouchedParts.Parent:FindFirstChild("Humanoid"):TakeDamage(25)
				newvel.Parent = TouchedParts.Parent.HumanoidRootPart
				TouchedParts.Parent.Humanoid.Sit = true
				newvel.Attachment0 = TouchedParts.Parent.HumanoidRootPart.RootAttachment
				takedmg = false
				newvel.Enabled = true
				wait(0.5)
			newvel:Destroy()
				TouchedParts.Parent.Humanoid.Sit = false
			end				
		end)
	end
	stompermodel.Leg.Teeth.Slam:Play()
	for i = 0, 15, 1 do
		stompermodel:PivotTo(stompermodel.Root.CFrame - Vector3.new(0,0.1,0))
		wait()
		
	end
	char.HumanoidRootPart.Anchored = false
takedmg = false
	wait(2.5)
	
	for i = 0, 5, 1 do
		stompermodel:PivotTo(stompermodel.Root.CFrame + Vector3.new(0,1,0))
		wait()
		
	end
	for i = 0, 25, 1 do
		stompermodel:PivotTo(stompermodel.Root.CFrame + Vector3.new(0,4,0))
		wait()
		
	end
	char.HumanoidRootPart.Anchored = false
	wait(1)
	stompermodel:Destroy()
end
while true do
	wait()
	print("Finding")
	roof_finder.Position += Vector3.new(0,2.5,0)
	roof_finder.CanCollide = true
	for _, TouchedParts in pairs(roof_finder:GetTouchingParts()) do
		for _, Parts in pairs(workspace.CurrentRooms:GetDescendants()) do
			if Parts:IsA("BasePart") or Parts:IsA("MeshPart") or Parts:IsA("Part") then
				if Parts.Name == TouchedParts.Name then
					roof_finder.Position -= Vector3.new(0,2.5,0)
					roof_finder.Position = Vector3.new(char.HumanoidRootPart.Position.X,roof_finder.Position.Y,char.HumanoidRootPart.Position.Z)
				print("Activate")
					Stomper(roof_finder.CFrame)
					return
					
				end
			end
		end
	end
end
