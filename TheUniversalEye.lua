loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))();

local Assets = {
	Repentance = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/OutOfOrderRepentance.rbxm"),
}

local function CrucifixEntity(entity: model, tool: Tool)
	local model = entity

	local resist = false

	local toolPivot = tool:GetPivot()
	local entityPivot = model:GetPivot()

	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = {game.Players.LocalPlayer, model}
	local result = workspace:Raycast(entityPivot.Position, Vector3.new(0, -1000, 0), params)
	if not result then return end

	-- Setup
	model:SetAttribute("BeingBanished", true)

	local repentance = Assets.Repentance:Clone()
	local crucifix = repentance.Crucifix
	local pentagram = repentance.Pentagram
	local entityPart = repentance.Entity
	local sound = (config.Crucifixion.Resist and crucifix.SoundFail or crucifix.Sound)
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

local model = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/TUE.rbxm")

if not model then return end
print("Model has loaded!")

model.PrimaryPart = model:FindFirstChildWhichIsA("BasePart")
if not model.PrimaryPart then return end
print("PrimaryPart found.")
model.Parent = workspace
model:PivotTo(cnode.CFrame)

--MAIN MECHANIC.
local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local open = false
local maxDist = 60
local cDist = 0

for _, light in model:GetDescendants() do
if light:IsA("PointLight") then
light:SetAttribute("Brightness", light.Brightness)
	end
end
	
local functionC = coroutine.create(function()
	while task.wait() do
		--print(cDist)
		cDist = (model.PrimaryPart.Position - char:WaitForChild("HumanoidRootPart").Position).Magnitude
		if open == true then
			model.Root.Attachment.Close.Enabled = false
			model.Root.Attachment.Open.Enabled = true
			model.Root.Attachment.SparkOpen.Enabled = true
			model.Root.Attachment.SparkClosed.Enabled = false
		else
			model.Root.Attachment.Close.Enabled = true
			model.Root.Attachment.Open.Enabled = false
			model.Root.Attachment.SparkOpen.Enabled = false
			model.Root.Attachment.SparkClosed.Enabled = true
			model.Root.Attachment.Attack.Enabled = false
		end
		if open == true and cDist <= maxDist then
			local origin = model:GetPivot().Position
			local charOrigin = char:WaitForChild("HumanoidRootPart").Position

			-- In Sight detection
			local inSight = false
			local CollectionService = game:GetService("CollectionService")
				local params = RaycastParams.new()
				params.FilterType = Enum.RaycastFilterType.Exclude
				params.FilterDescendantsInstances = {char, model, CollectionService:GetTagged("HidingSpot")}

				inSight = workspace:Raycast(origin, charOrigin - origin, params) == nil
			--print(inSight)
			if inSight then
				--if char:WaitForChild("Humanoid")
				if char.Humanoid.MoveDirection.Magnitude > 0 then
				char.Humanoid.Health -= 0.6122412
					if char.Humanoid.Health <= 0 then
						if firesignal then
								firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"It seems you died to the Universal Eye..", "It's quite a simple game!", "I'm sure you're familiar with it,", "Red Light, Green Light."}, "Yellow")
						--[[ Second Death
								firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"You've died to the Universal Eye, yet again.", "I thought you would've had it!", "Remember, Red Light, Green Light!"}, "Yellow")
						--Third

							firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"Third times a charm, huh?", "Look at it's eye, that'll help you.", "It's not like the \"Eyes\" you're familiar with."}, "Yellow")
						--Fourth
								firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"Okay, dead to the Universal Eye, again.", "When it's eye is opened, don't move, how about that?", "Once the eye is closed, there's your chance to proceed.", "Go back, try again. I, personally don't think it'd hurt."}, "Yellow")
						-- Onward
								firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"Still struggling, I see?","Open is red, Closed is green."}, "Yellow")
						
								]]
							end 
							game.ReplicatedStorage:WaitForChild("GameStats")["Player_"..game.Players.LocalPlayer.Name].Total.DeathCause.Value = "The Universal Eye"
				
					end

							
					model.Root.Attachment.Attack.Enabled = true
					
					if model.Root.Attack.Playing then
						--Nothing
					else
						model.Root.Attack:Play()
						model.Root.Attack.PlaybackSpeed = math.random(50,300)/100
					end				
			else
				model.Root.Attachment.Attack.Enabled = false
				end
				end
		end
	end
end)
coroutine.resume(functionC)



local cToggle = coroutine.create(function()
	while task.wait(math.random(3,7)) do
		open = not open
		for _, light in model:GetDescendants() do
if light:IsA("PointLight") then
game:GetService("TweenService"):Create(light, TweenInfo.new(math.random(5,12)/10), {Brightness = open and light:GetAttribute("Brightness") or 0.1}):Play()
				end
			end
	end
end)
--task.wait(math.random(1,2))
coroutine.resume(cToggle)


