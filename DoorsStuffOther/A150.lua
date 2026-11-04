wait(2)
loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

print("go entity")

function VisualizeNodes(room)
	local pfs = game:GetService("PathfindingService")
	local startPosition = room:WaitForChild("RoomEntrance").Position
	local goalPosition = room:WaitForChild("RoomExit").Position
	local path = pfs:CreatePath()
	path:ComputeAsync(startPosition, goalPosition)
	local generatednodes= {}
	local spart = Instance.new("Part")
	spart.Position = startPosition - Vector3.new(0,3,0)
	spart.Size= Vector3.new(1,1,1)
	spart.Parent = room
	spart.Anchored = true
	spart.CanCollide = false
	spart.Transparency = 1
	generatednodes[1] = spart
	local epart = Instance.new("Part")
	epart.Position = goalPosition- Vector3.new(0,3,0)
	epart.Size= Vector3.new(1,1,1)
	epart.Parent = room
	epart.Anchored = true
	epart.CanCollide = false
	epart.Transparency = 1
	generatednodes[2] = epart
	--epart.Position = startPosition - Vector3.new(0,6,0)
	if #path:GetWaypoints() > 0 then
		for _, wpt in path:GetWaypoints() do
			local part = Instance.new("Part")
			part.Position = wpt.Position -- Vector3.new(0,15.5,0)
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
local room = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
local nodes = VisualizeNodes(room)
local cnode = nodes[math.random(1,#nodes)]

local model = LoadCustomInstance("https://github.com/LukeLor/LukeLor/blob/main/DoorsStuffOther/A-150.rbxm?raw=true")
-- game.ReplicatedStorage["A-150"]:Clone()
local function CanSeeTarget(target)
	local origin = model.Entity.Position
	local direction = (target.HumanoidRootPart.Position - origin).Unit * 30
	local ray = Ray.new(origin, direction)

	local hit, pos = workspace:FindPartOnRay(ray, model)


	if hit then
		if hit:IsDescendantOf(target) then
			return true
		end
	else
		return false
	end
end
local canSeeC = coroutine.create(function()
		while task.wait() do
			local canSee = CanSeeTarget(game.Players.LocalPlayer.Character)
			if canSee == true then
				game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health = 0
				firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"You died to who you call A-150","It usually checks lockers, but the Hotel doesent have lockers so it checks closets instead...","Maybe... stay a room or 2 behind next time.","Go give surviving it another shot.","See you once you come back, alright?"}, "Yellow")
break
			end
			end
		end)
function GetGitSound(GithubSnd, SoundName)
    local url = GithubSnd
    if not isfile(SoundName..".mp3") then
	    writefile(SoundName..".mp3", game:HttpGet(url))
	end
	return (getcustomasset or getsynasset)(SoundName..".mp3")
end

function CustomSound(soundLink, vol, sndName)
    local sound = Instance.new("Sound")
    sound.SoundId = GetGitSound(soundLink, sndName)
    sound.Parent = model:WaitForChild("Entity")
    sound.Name = "EntityNoise"
    sound.Volume = vol or 0.5
    sound:Play()
	sound.Looped = true
	return sound
end
local Audio = CustomSound("https://github.com/LukeLor/LukeLor/blob/main/DoorsStuffOther/A-150Loop.mp3.mpeg.mp3?raw=true", 1, "EntitySound")--NewIsolatedLightDeath
--https://github.com/LukeLor/LukeLor/blob/main/DoorsStuffOther/A-150_Spawn.mp3.mpeg.mp3
local SpawnA = CustomSound("https://github.com/LukeLor/LukeLor/blob/main/DoorsStuffOther/A-150_Spawn.mp3.mpeg.mp3?raw=true", 1, "EntitySound")--NewIsolatedLightDeath
SpawnA:Stop()
	if not model then return end
print("Model has loaded!")
model.Entity.CanCollide = false
--model.PrimaryPart = model:FindFirstChildWhichIsA("BasePart")
if not model.PrimaryPart then return end
print("PrimaryPart found.")
model.Parent = workspace
model:PivotTo(cnode.CFrame)
--local sound = model.Entity:WaitForChild("PlaySound")
--sound.Looped = true
--sound.SoundId = Audio.SoundId
--sound:Play()
task.wait(2)
game:GetService("TweenService"):Create(model.Entity, TweenInfo.new(2), {Position = model.Entity.Position + Vector3.new(0,15,0)}):Play()
game:GetService("TweenService"):Create(model.Root["a-150 =]"], TweenInfo.new(2), {Transparency = 1, Color3 = Color3.new(0.592157, 0.964706, 1)}):Play()
SpawnA.Looped = false
SpawnA:Play()
task.wait(2.3)
local startPos = model.Entity.Position
local hidingSpotsCheck = {"Wardrobe", "Locker_Large","Toolshed","Rooms_Locker","Rooms_LockerKitchen","Backdoor_Wardrobe","ArchivesLocker"}
local existingHidingSpots ={}
for _, inst in room:GetDescendants() do
	if table.find(hidingSpotsCheck, inst.Name) then
		table.insert(existingHidingSpots, inst)
	end

end
local closetNodes = Instance.new("Folder")
closetNodes.Parent = room
closetNodes.Name = "EntityCloseNodes"
coroutine.resume(canSeeC)
for i = 1, #existingHidingSpots do
	local hidingSpot = existingHidingSpots[i]
	--game:GetService("TweenService"):Create(model.Entity, TweenInfo.new(2), {Position = hidingSpot.PrimaryPart.Position}):Play()
	local openAnim = hidingSpot:FindFirstChild("Anim_EnterModel")
	if openAnim then
		--openAnim.AnimationId = "rbxassetid://76173236442856"
	end
	local mainPart = hidingSpot:FindFirstChild("Main")
	local sound = nil
	if mainPart then
		sound = hidingSpot:FindFirstChild("Main").SoundEnter
	end
	local startPosition = model.Entity.Position
	local goalPosition = hidingSpot.PrimaryPart.Position
	local path = game:GetService("PathfindingService"):CreatePath()
	path:ComputeAsync(startPosition, goalPosition)

	if #path:GetWaypoints() > 0 then
		print("more than 0 wpts")
		for _, wpt in path:GetWaypoints() do
			local part = Instance.new("Part")
			part.Position = wpt.Position+ Vector3.new(0,6,0)
			part.Size= Vector3.new(1,1,1)
			part.Parent = closetNodes
			part.Anchored = true
			part.CanCollide = false
			part.Transparency = 1
			game:GetService("TweenService"):Create(model.Entity, TweenInfo.new(2/#path:GetWaypoints()), {Position = part.Position-Vector3.new(0,3.5,0)}):Play()
			task.wait(2/#path:GetWaypoints()-(2/#path:GetWaypoints())/5)
		end
	else
		warn("no wpts")
	end
	if  (model.Entity.Position - goalPosition).Magnitude > 6 then
	game:GetService("TweenService"):Create(model.Entity, TweenInfo.new(2), {Position = hidingSpot.PrimaryPart.Position}):Play()
		task.wait(2)		
	end
	
	if sound ~= nil then
		sound:Play()
	end
	if openAnim then
		hidingSpot:FindFirstChildOfClass("AnimationController"):LoadAnimation(openAnim):Play()
	end
	if hidingSpot:FindFirstChild("HiddenPlayer") then
		local char = hidingSpot:FindFirstChild("HiddenPlayer").Value
		if char ~= nil then
			char:WaitForChild("Humanoid").Health = 0
			firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"You died to who you call A-150","It usually checks lockers, but the Hotel doesent have lockers so it checks closets instead...","Maybe... stay a room or 2 behind next time.","Go give surviving it another shot.","See you once you come back, alright?"}, "Yellow")

		end

	end
end

closetNodes:Destroy()
local path = game:GetService("PathfindingService"):CreatePath()
path:ComputeAsync(model.Entity.Position, startPos)

if #path:GetWaypoints() > 0 then
	print("more than 0 wpts")
	for _, wpt in path:GetWaypoints() do
		local part = Instance.new("Part")
		part.Position = wpt.Position + Vector3.new(0,6,0)
		part.Size= Vector3.new(1,1,1)
		part.Parent = closetNodes
		part.Anchored = true
		part.CanCollide = false
		part.Transparency = 1
		game:GetService("TweenService"):Create(model.Entity, TweenInfo.new(2/#path:GetWaypoints()), {Position = part.Position-Vector3.new(0,3.5,0)}):Play()
		task.wait(2/#path:GetWaypoints()-(2/#path:GetWaypoints())/5)
	end
else
	warn("no wpts")
end
game:GetService("TweenService"):Create(model.Entity, TweenInfo.new(2), {Position =startPos}):Play()
task.wait(2)
game:GetService("TweenService"):Create(model.Root["a-150 =]"], TweenInfo.new(2), {Transparency = 0, Color3 = Color3.new(0, 0, 0)}):Play()

game:GetService("TweenService"):Create(model.Entity, TweenInfo.new(2), {Position = startPos-Vector3.new(0,15,0)}):Play()
task.wait(2)
SpawnA:Play()
game:GetService("TweenService"):Create(model.Root, TweenInfo.new(1), {Size = Vector3.new(0,0,0)}):Play()
task.wait(3)
model:Destroy()
coroutine.close(canSeeC)
