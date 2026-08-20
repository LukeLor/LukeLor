--Will add model later, just doing this on logic!!!
loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))();

local ROOT = "https://github.com/RegularVynixu/DOORS-Entity-Spawner-V2/raw/main"

local Modules = {
	Module_Events = require(game.ReplicatedStorage.ModulesClient.Module_Events :: ModuleScript),
	Main_Game = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game :: ModuleScript)
}

local Assets = {
	Repentance = LoadCustomInstance(ROOT.."/Assets/Repentance.rbxm")

}

local function CrucifixEntity(entity: any, tool: Tool)
	local model = entity
	
	local resist = true

	local toolPivot = tool:GetPivot()
	local entityPivot = model:GetPivot()

	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = {game.Players.LocalPlayer.Character, model}
	local result = workspace:Raycast(entityPivot.Position, Vector3.new(0, -1000, 0), params)
	if not result then return end

	-- Setup
	model:SetAttribute("BeingBanished", true)

	local repentance = Assets.Repentance:Clone()
	local crucifix = repentance.Crucifix
	local pentagram = repentance.Pentagram
	local entityPart = repentance.Entity
	local sound = (resist and crucifix.SoundFail or crucifix.Sound)
	local shaker = Modules.Main_Game.camShaker:StartShake(5, 20, 2, Vector3.new())

	local function waitUntil(t: number)
		repeat RunService.RenderStepped:Wait() until sound.TimePosition >= t
	end
	local function fadeOut()
		for _, c in next, pentagram:GetChildren() do
			if c.Name == "BeamFlat" then
				task.delay(c:GetAttribute("Delay"), function()
					TweenService:Create(c, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
						Brightness = 0
					}):Play()
				end)
			end
		end
	end

	repentance:PivotTo(CFrame.new(result.Position))
	crucifix.CFrame = toolPivot
	repentance.Entity.CFrame = entityPivot
    crucifix.BodyPosition.Position = (RootPart.CFrame * CFrame.new(0.5, 3, -6)).Position
	repentance.Parent = workspace
	sound:Play()

	task.spawn(function()
		while model.Parent and repentance.Parent do
			model:PivotTo(entityPart.CFrame)
			task.wait()
		end
		model:Destroy()
	end)

	-- Animation
	TweenService:Create(pentagram.Circle, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), { CFrame = pentagram.Circle.CFrame - Vector3.new(0, 25, 0) }):Play()
	TweenService:Create(crucifix.BodyAngularVelocity, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.In), { AngularVelocity = Vector3.new(0, 40, 0) }):Play()
	task.delay(2, pentagram.Circle.Destroy, pentagram.Circle)

	task.spawn(function()
		waitUntil(2.625)
		TweenService:Create(pentagram.Base.LightAttach.LightBright, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
			Brightness = 5,
			Range = 40
		}):Play()
		TweenService:Create(crucifix.Light, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
			Brightness = 11.25,
			Range = 30
		}):Play()
		task.wait(1.5)
		TweenService:Create(pentagram.Base.LightAttach.LightBright, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
			Brightness = 0,
			Range = 0
		}):Play()
		TweenService:Create(crucifix.Light, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
			Brightness = 0,
			Range = 0
		}):Play()

		if resist == false then
			TweenService:Create(crucifix.Light, TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), { Brightness = 15, Range = 40 }):Play()
			shaker:StartFadeOut(3)
			fadeOut()
			TweenService:Create(crucifix.BodyAngularVelocity, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { AngularVelocity = Vector3.new() }):Play()
		end
	end)

	-- Actions
	if resist == false then
		waitUntil(2)
		TweenService:Create(entityPart, TweenInfo.new(3, Enum.EasingStyle.Back, Enum.EasingDirection.In), { CFrame = repentance.Entity.CFrame - Vector3.new(0, 25, 0) }):Play()
		
        for _, v in next, model:GetDescendants() do
			if
				v:IsA("Sound")
				and not v:GetAttribute("VolumeIgnore")
			then
                TweenService:Create(v, TweenInfo.new(3, Enum.EasingStyle.Back, Enum.EasingDirection.In), { Volume = 0 }):Play()
            end
        end
        
        waitUntil(6.75)
	else
		waitUntil(4)
		TweenService:Create(crucifix.BodyAngularVelocity, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { AngularVelocity = Vector3.new() }):Play()
		TweenService:Create(pentagram.Base.LightAttach.LightBright, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), { Brightness = 0, Range = 0, Color = Color3.fromRGB(255, 116, 130) }):Play()
		TweenService:Create(crucifix.Light, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), { Brightness = 0, Range = 0, Color = Color3.fromRGB(255, 116, 130) }):Play()
		shaker:StartFadeOut(3)
		task.spawn(function()
			local color = Instance.new("Color3Value")
			color.Value = Color3.fromRGB(137, 207, 255)

			local tween = TweenService:Create(color, TweenInfo.new(0.5, Enum.EasingStyle.Sine), { Value = Color3.fromRGB(255, 116, 130) })
			tween:Play()

			while tween.PlaybackState == Enum.PlaybackState.Playing do
				for _, d in next, repentance:GetDescendants() do
					if d.ClassName == "Beam" then
						d.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, color.Value), ColorSequenceKeypoint.new(1, color.Value)}

					elseif d.Name == "Crucifix" then
						d.Color = color.Value
					end
				end
				task.wait()
			end
		end)
		waitUntil(9.625)
	end

	-- Crucifix explode
	TweenService:Create(repentance.Crucifix, TweenInfo.new(1), { Size = repentance.Crucifix.Size * 3, Transparency = 1 }):Play()
	TweenService:Create(repentance.Pentagram.Base.LightAttach.LightBright, TweenInfo.new(1), { Brightness = 0, Range = 0 }):Play()
	TweenService:Create(repentance.Crucifix.Light, TweenInfo.new(1), { Brightness = 0, Range = 0 }):Play()

	if not resist then
		repentance.Crucifix.ExplodeParticle:Emit(math.random(20, 30))
		Modules.Main_Game.camShaker:ShakeOnce(7.5, 7.5, 0.25, 1.5)
	else
		model:SetAttribute("BeingBanished", false)
		model:SetAttribute("Paused", false)
		fadeOut()
	end
	task.delay(5, repentance.Destroy, repentance)
end

function VisualizeNodes(room)
  local pfs = game:GetService("PathfindingService")
local startPosition = room:WaitForChild("RoomEntrance").Position
local goalPosition = room:WaitForChild("RoomExit").Position
  local path = pfs:CreatePath()
path:ComputeAsync(startPosition, goalPosition)
  local generatednodes= {}
  local spart = Instance.new("Part")
  spart.Position = startPosition
  spart.Size= Vector3.new(1,1,1)
  spart.Parent = room
  spart.Anchored = true
  spart.CanCollide = false
spart.Transparency = 1
	generatednodes[1] = spart
  local epart = Instance.new("Part")
  epart.Position = goalPosition
  epart.Size= Vector3.new(1,1,1)
  epart.Parent = room
  epart.Anchored = true
  epart.CanCollide = false
	epart.Transparency = 1
  generatednodes[2] = epart
  if #path:GetWaypoints() > 0 then
    for _, wpt in path:GetWaypoints() do
  local part = Instance.new("Part")
  part.Position = wpt.Position + Vector3.new(0,6,0)
  part.Size= Vector3.new(1,1,1)
  part.Parent = room
  part.Anchored = true
  part.CanCollide = false
part.Transparency = 1
  generatednodes[#generatednodes +1] = part
  end
  else
    warn("Couldn't find any nodes. Start -- End is too obstructed making pathfind not work.")
  end
  if #generatednodes == 2 then
warn("2 nodes have been found, most likely the Start and End of room.")
  else
    print("Found 2+ nodes!")
  end
    return generatednodes
end

local nodes = VisualizeNodes(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value])
local cnode = nodes[math.random(1,#nodes)]

local model = LoadCustomInstance("https://github.com/LukeLor/LukeLor/blob/main/DoorsStuffOther/Chemeleon.rbxm?raw=true")

if not model then return end
print("Model has loaded!")

model.PrimaryPart = model:FindFirstChildWhichIsA("BasePart")
if not model.PrimaryPart then return end
print("PrimaryPart found.")
model.Parent = game.ReplicatedStorage
model:PivotTo(cnode.CFrame)
require(game.ReplicatedStorage.ModulesClient.Module_Events).flicker(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value], 5)
task.wait(7)
 nodes = VisualizeNodes(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value])
cnode = nodes[math.random(1,#nodes)]
local InitRoomNum = game.ReplicatedStorage.GameData.LatestRoom.Value 
model.Parent = workspace 
local canDespawn = false
local main = coroutine.create(function() 
		while task.wait() do 
if game.ReplicatedStorage.GameData.LatestRoom.Value ~= InitRoomNum then
canDespawn = true
			end
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - model.PrimaryPart.Position).Magnitude < 15 then
if game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") then
CrucifixEntity(model, game.Players.LocalPlayer.Character.Crucifix)
				end
			end
				if game.Players.LocalPlayer.Character:GetAttribute("Hiding") and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Crucifix") then
CrucifixEntity(model, game.Players.LocalPlayer.Backpack.Crucifix)
				else
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
				firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"You died to a chemeleon","It hides in the corner of the room and flickers the lights","It hates hiding spots","Dont hide!"}, "Blue")

				end
			end			
			
		end
	end)



	while task.wait() do
	cnode = nodes[math.random(1,#nodes)]

game:GetService("TweenService"):Create(model.RushNew, TweenInfo.new(4), {Position = cnode.Position +  Vector3.new(0,math.random(-6,6),0)}):Play()
task.wait(3.5) if canDespawn then break end
end
model:Destroy()
