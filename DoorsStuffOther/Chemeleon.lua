loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))();

local ROOT = "https://github.com/RegularVynixu/DOORS-Entity-Spawner-V2/raw/main"
local pause = false
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local Modules = {
	Module_Events = require(game.ReplicatedStorage.ModulesClient.Module_Events :: ModuleScript),
	Main_Game = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game :: ModuleScript)
}
local Storage = {
    Ambient = {},
	DeathTypes = {
		["Yellow"] = {"yellow", "curious"},
		["Blue"] = {"blue", "guiding"}
	},
    CrucifixTypes = {
        ["guiding"] = { Color = Color3.fromRGB(137, 207, 255) },
        ["curious"] = { Color = Color3.fromRGB(255, 227, 137) }
    }
}
local RootPart = game.Players.LocalPlayer.Character.PrimaryPart

local Assets = {
	Repentance = LoadCustomInstance(ROOT.."/Assets/Repentance.rbxm")

}

local function CrucifixEntity(entity, tool)
	local model = entity

	local resist = true

    -- \\ Setup
	local entityPivot = model:GetPivot()

	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = {game.Players.LocalPlayer.Character, model}
	
    local result = workspace:Raycast(entityPivot.Position, Vector3.new(0, -1000, 0), params)
    if not result then return end

    model:SetAttribute("BeingBanished", true)

    -- \\ Variables
    local MainGame = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game :: ModuleScript)
    local CamShaker = MainGame.camShaker
	local TheShake = CamShaker:StartShake(5, 20, 2, Vector3.zero)

	local Repentance = Assets.Repentance:Clone()
	local Crucifix = Repentance.Crucifix
    local Handle = Crucifix.Handle
	local Pentagram = Repentance.Pentagram
	local EntityPart = Repentance.Entity
	local Sound = Handle[resist and "SoundFail" or "Sound"]

    -- \\ Repentance setup
	Repentance:PivotTo(CFrame.new(result.Position))
	Crucifix:PivotTo(Character:GetPivot())
	EntityPart.CFrame = entityPivot
	Repentance.Parent = workspace
	Sound:Play()

    local function waitUntil(t: number)
		repeat RunService.RenderStepped:Wait() until Sound.TimePosition >= t
	end

	local function fadeOut()
		for _, v in Pentagram:GetChildren() do
            if v.Name == "BeamFlat" then
                task.delay(v:GetAttribute("Delay") or 0, function()
                    TweenService:Create(
                        v,
                        TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Brightness = 0 }
                    ):Play()
                end)
            elseif v.Name == "BeamChain" then
                TweenService:Create(
                    v,
                    TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                    { Brightness = 0 }
                ):Play()
            end
        end
	end

    -- \\ Set pentagram color
    local Color = Storage.CrucifixTypes["guiding"].Color

    for _, v in next, Repentance:QueryDescendants(".GiveMeColor") do
        if v:IsA("Light") or v:IsA("BasePart") then
            v.Color = Color	
        elseif v:IsA("ParticleEmitter") or v:IsA("Beam") then
            v.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color),
                ColorSequenceKeypoint.new(1, Color)
            })
        end
    end

    -- \\ Lock entity model to EntityPart
	task.spawn(function()
        if not resist then
            while EntityPart.Parent do
                model:PivotTo(EntityPart.CFrame)
                RunService.RenderStepped:Wait()
            end
            model:Destroy()
        end
	end)

	-- \\ Pentagram animation
	TweenService:Create(
        Pentagram.Circle,
        TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        { CFrame = Pentagram.Circle.CFrame - Vector3.new(0, 25, 0) }
    ):Play()

	task.delay(2, Pentagram.Circle.Destroy, Pentagram.Circle)

    -- \\ Crucifix hover
    Handle.BodyPosition.Position = (Character:GetPivot() * CFrame.new(1, 4, -6)).Position

	TweenService:Create(
        Handle.BodyAngularVelocity,
        TweenInfo.new(4, Enum.EasingStyle.Cubic, Enum.EasingDirection.In),
        { AngularVelocity = Vector3.new(0, 40, 0) }
    ):Play()

    task.delay(3, function()
        -- \\ Break off shards
        for _, shard in next, Handle.Shards:GetChildren() do
            shard.CollisionGroup = "NoPlayer"
            shard.CanCollide = true
            shard.Weld:Destroy()
            shard.AssemblyAngularVelocity = Vector3.zero
        end
    end)

    if not resist then
        -- \\ Start raising entity
        TweenService:Create(
            EntityPart,
            TweenInfo.new(3, Enum.EasingStyle.Elastic, Enum.EasingDirection.In),
            { CFrame = EntityPart.CFrame + Vector3.new(0, 2, 0) }
        ):Play()
    end

    -- \\ Ritual animation
	task.spawn(function()
        waitUntil(2.625)
		
        TweenService:Create(
            Pentagram.Base.LightAttach.LightBright,
            TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut),
            { Brightness = 5, Range = 40 }
        ):Play()
        TweenService:Create(
            Handle.Light,
            TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut),
            { Brightness = 11.25, Range = 30 }
        ):Play()
		
        task.wait(1.5)
		
        TweenService:Create(Pentagram.Base.LightAttach.LightBright, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
			Brightness = 0,
			Range = 0
		}):Play()
        TweenService:Create(Handle.Light, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
			Brightness = 0,
			Range = 0
		}):Play()

		if not resist then
            -- \\ Big light things
            TweenService:Create(
                Handle.Light,
                TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut),
                { Brightness = 15, Range = 40 }
            ):Play()

            TheShake:StartFadeOut(3)
            fadeOut()

            TweenService:Create(
                Handle.BodyAngularVelocity,
                TweenInfo.new(3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
                { AngularVelocity = Vector3.zero }
            ):Play()
        end
	end)

	-- \\ Crucifix actions
	if not resist then
		waitUntil(2.5)
		
        -- \\ Lower entity
        TweenService:Create(
            EntityPart,
            TweenInfo.new(3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
            { CFrame = EntityPart.CFrame - Vector3.new(0, 50, 0) }
        ):Play()
		
        -- \\ Mute entity sounds
        for _, s in next, model:QueryDescendants("Sound") do
            if s:GetAttribute("VolumeIgnore") then continue end

            TweenService:Create(
                s,
                TweenInfo.new(3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
                { Volume = 0 }
            ):Play()
        end

        waitUntil(6.75)
	else
		waitUntil(4)

		TweenService:Create(
            Handle.BodyAngularVelocity,
            TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
            { AngularVelocity = Vector3.zero }
        ):Play()
		TweenService:Create(
            Pentagram.Base.LightAttach.LightBright,
            TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut),
            { Brightness = 0, Range = 0, Color = Color3.fromRGB(255, 116, 130) }
        ):Play()
		TweenService:Create(
            Handle.Light,
            TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut),
            { Brightness = 0, Range = 0, Color = Color3.fromRGB(255, 116, 130) }
        ):Play()
		
        TheShake:StartFadeOut(3)

        -- \\ Fade pentagram to red
		task.spawn(function()
			local color = Instance.new("Color3Value")
			color.Value = Color3.fromRGB(137, 207, 255)

			local tween = TweenService:Create(
                color,
                TweenInfo.new(0.5, Enum.EasingStyle.Sine),
                { Value = Color3.fromRGB(255, 116, 130) }
            )
			tween:Play()

			while tween.PlaybackState == Enum.PlaybackState.Playing do
				for _, d in next, Repentance:GetDescendants() do
					if d.ClassName == "Beam" then
						d.Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, color.Value),
                            ColorSequenceKeypoint.new(1, color.Value)
                        })
					elseif d.Name == "Glow" then
						d.Color = color.Value
					end
				end
				task.wait()
			end
		end)

		waitUntil(9.625)
	end

	-- \\ Crucifix glow explode
	TweenService:Create(
        Handle.Glow,
        TweenInfo.new(1),
        { Size = Handle.Glow.Size * 3, Transparency = 1 }
    ):Play()
	TweenService:Create(
        Pentagram.Base.LightAttach.LightBright,
        TweenInfo.new(1),
        { Brightness = 0, Range = 0 }
    ):Play()
	TweenService:Create(
        Handle.Light,
        TweenInfo.new(1),
        { Brightness = 0, Range = 0 }
    ):Play()

	if not resist then
		Handle.ExplodeParticle:Emit(math.random(20, 30))
		CamShaker:ShakeOnce(7.5, 7.5, 0.25, 1.5)
	else
		model:SetAttribute("BeingBanished", false)
		model:SetAttribute("Paused", false)
		pause = false
		fadeOut()
		
	end

	task.delay(5, Repentance.Destroy, Repentance)
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
				break
			end
		--[[	if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - model.PrimaryPart.Position).Magnitude < 15 then
if game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") then
CrucifixEntity(model, game.Players.LocalPlayer.Character.Crucifix)
				end
			end]]
			
				if game.Players.LocalPlayer.Character:GetAttribute("Hiding") and game.Players.LocalPlayer.Character.Humanoid.Health > 0 and (model.PrimaryPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 40 then
				game:GetService("TweenService"):Create(model.RushNew, TweenInfo.new(2), {Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position}):Play()
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Player located.")
pause = true
	task.wait(1.9) 
				if not game.Players.LocalPlayer.Character:GetAttribute("Hiding") and game.Players.LocalPlayer.Character.Humanoid.Health > 0 and (model.PrimaryPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 40 then
				pause = false
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Crucifix") then
					if game.Players.LocalPlayer.Character:GetAttribute("Hiding") and game.Players.LocalPlayer.Character.Humanoid.Health > 0 and (model.PrimaryPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 40 then
			
					--require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Crucifix!!")
local crucifix = game.Players.LocalPlayer.Backpack.Crucifix
						pause = true
	crucifix.Parent = game.Players.LocalPlayer.Character
CrucifixEntity(model, crucifix)
					end
					else
					if game.Players.LocalPlayer.Character:GetAttribute("Hiding") and game.Players.LocalPlayer.Character.Humanoid.Health > 0 and (model.PrimaryPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 40 then
			
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
					--require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Alright, you should be dead.")

				firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"You died to a chemeleon","It hides in the corner of the room and flickers the lights","It hates hiding spots","Dont hide!"}, "Blue")
canDespawn = true
						break
					end
				end
			end				
	end
end)

coroutine.resume(main)
--require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Main Running")

	while task.wait() do
	if pause == false then
	cnode = nodes[math.random(1,#nodes)]

game:GetService("TweenService"):Create(model.RushNew, TweenInfo.new(4), {Position = cnode.Position +  Vector3.new(math.random(-15,15)/10,math.random(-6,6), math.random(-20,20)/10)}):Play()
--require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Moving")

	task.wait(3.5) end
	if canDespawn then break end
end
model.RushNew.Anchored = false
model.RushNew.CanCollide = false
game.Debris:AddItem(model, 6)

--require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Despawn")

