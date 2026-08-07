loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))();

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
				char.Humanoid.Health -= 0.4
					if char.Humanoid.Health <= 0 then
						if firesignal then
								firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"It seems you died to the Universal Eye..", "It's quite a simple game!", "I'm sure you're familiar with it,", "Red Light, Green Light."}, "Blue")
						--[[ Second Death!
								firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"You've died to the Universal Eye, yet again.", "I thought you would've had it!", "Remember, Red Light, Green Light!"}, "Blue")
						--Third

							firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"Third times a charm, huh?", "Look at it's eye, that'll help you.", "It's not like the \"Eyes\" you're familiar with."}, "Blue")
						--Fourth
								firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"Okay, dead to the Universal Eye, again.", "When it's eye is opened, don't move, how about that?", "Once the eye is closed, there's your chance to proceed.", "Go back, try again. Don't think it'd hurt."}, "Blue")
						-- Onward
								firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"Still struggling, I see?","Open is red, Closed is green."}, "Blue")
						
								]]
							end 
							game.ReplicatedStorage:WaitForChild("GameStats")["Player_"..game.Players.LocalPlayer.Name].Total.DeathCause.Value = "The Universal Eye"
				
					end

							
					model.Root.Attachment.Attack.Enabled = true
					
					if model.Root.Attack.Playing then
						--Nothing
					else
						model.Root.Attack:Play()
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
game:GetService("TweenService"):Create(light, TweenInfo.new(math.random(5,12)/10), {Brightness = open and light:GetAttribute("Brightness") or 0.5}):Play()
				end
			end
	end
end)
task.wait(math.random(1,2))
coroutine.resume(cToggle)


