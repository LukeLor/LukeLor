loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
print("start")
local Assets = {
	Repentance = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/OutOfOrderRepentance.rbxm"),
}
local function Badge()
local CustomAchievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau"))()

CustomAchievements:Grant({
    Identifier = "OutOfOrderCruc_Stomper",
    Title = "Stupid Foot",
    Desc = "Get stomped oooonnnn!",
    Reason = "Banish Stomper.",
    Image = "rbxassetid://117242422256656"
}, {
    CheckOwned = false,
    Remember = false
})
end

local function CrucifixEntity(entity: model, tool: Tool)
	local model = entity
local RootPart = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
	local resist = false

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
	local sound =  crucifix.Sound
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
Badge()
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

				local function PlayerHasOut(itemTable: table, checkBackpack:boolean ): boolean
	for indNum, item in itemTable do 
	local tool = Character:FindFirstChild(item)
	
	if tool and tool.Name == name then
		return true, tool
	end
	if checkBackpack then
		local tool = LocalPlayer.Backpack:FindFirstChild(item)
	       if tool and tool.Name == name then
		     return true, tool
	       end
	end
	if indNum == #itemTable then return false end
  end
end
local moduleScripts = {
	Module_Events = require(game.ReplicatedStorage.ModulesClient.Module_Events),
	Main_Game = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
	Earthquake = require(game.ReplicatedStorage:WaitForChild("RemotesFolder").RequestAsset:InvokeServer("Earthquake"))
}
print("defined modules")
local gameStats = game.ReplicatedStorage:WaitForChild("GameStats")
local plr = game.Players.LocalPlayer
local char = workspace:FindFirstChild(plr.Name)
local roof_finder = Instance.new("Part")
roof_finder.Anchored = true
roof_finder.CFrame = char.HumanoidRootPart.CFrame
roof_finder.Size = Vector3.new(1,1,1)
roof_finder.CanCollide = false
roof_finder.CanTouch = true
roof_finder.Parent = workspace
roof_finder.Name = "Roof_Finder"
roof_finder.Transparency = 1
print("setup finished.")

function GetCurrentRoom(latest)
    if latest then
        return workspace.CurrentRooms:GetChildren()[#workspace.CurrentRooms:GetChildren()]
    end
    return workspace.CurrentRooms:FindFirstChild(game.Players.LocalPlayer:GetAttribute("CurrentRoom"))
end

function EQ(currentRoom)
task.spawn(function()
task.defer(moduleScripts.Earthquake, moduleScripts.Main_Game, currentRoom)
end)
end
function Stomper(pos:CFrame)
print("Initiate")
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
	print("Spawning complete")
	while task.wait() do
		if stompermodel.Leg.Teeth.Position.Y > char.HumanoidRootPart.Position.Y - 3 then
	stompermodel:PivotTo(stompermodel.Root.CFrame - Vector3.new(0,2,0))
			print("down")
		end
		if stompermodel.Leg.Teeth.Position.Y <= char.HumanoidRootPart.Position.Y -3 then
		break
			--adnd move on
		end
	wait()
		stompermodel.CamDeath.Touched:Connect(function(TouchedParts)
			if TouchedParts.Parent:FindFirstChild("Humanoid") then





				if char.Humanoid.Health <= 25 and takedmg then
						local hasTool, tool = PlayerHasOut({"Crucifix","Isolated Chain"}, false)
                    if hasTool and tool and not stompermodel:GetAttribute("BeingBanished") then
CrucifixEntity(stompermodel, tool)
							takedmg = false
							print("Its actually not..."
								return
						end
						print("ggs")
					local cc = workspace.CurrentCamera
					TouchedParts.Parent.Humanoid.WalkSpeed = 0
					TouchedParts.Parent.HumanoidRootPart.Anchored = true
					cc.CameraType = Enum.CameraType.Scriptable
					game:GetService("TweenService"):Create(cc, TweenInfo.new(1), {CFrame = CFrame.new(cc.CFrame.Position, stompermodel.Leg.MouthBlack.Position)}):Play()
					wait(1)
					TouchedParts.Parent:FindFirstChild("Humanoid"):TakeDamage(25)
						if firesignal then
					firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"You died to Stomper...", "It'll make banging noises and an earthquake to indicate it's there.", "Make sure to move out of its way when it tries crushing you!"}, "Blue")
						
		
				else
					warn("firesignal not supported, ignore death hints.")
				end
						gameStats["Player_".. plr.Name].Total.DeathCause.Value = "Stomper"
				end
			end
		end)
		stompermodel.Hitbox.Touched:Connect(function(TouchedParts)
			if TouchedParts.Parent:FindFirstChild("Humanoid") and takedmg then
					local hasTool, tool = PlayerHasOut({"Crucifix","Isolated Chain"}, false)
                    if hasTool and tool and not stompermodel:GetAttribute("BeingBanished") then
						takedmg = false
CrucifixEntity(stompermodel, tool)
						stompermodel.Hitbox.CanTouch = false
						return
					end
				TouchedParts.Parent:FindFirstChild("Humanoid"):TakeDamage(25)
				newvel.Parent = TouchedParts.Parent.HumanoidRootPart
				TouchedParts.Parent.Humanoid.Sit = true
				newvel.Attachment0 = TouchedParts.Parent.HumanoidRootPart.RootAttachment
				takedmg = false
				newvel.Enabled = true
					
				wait(0.5)
			newvel:Destroy()
				TouchedParts.Parent.Humanoid.Sit = false
					print("ow")
			end				
		end)
	end
	stompermodel.Leg.Teeth.Slam:Play()
	for i = 0, 15, 1 do
		if stompermodel:GetAttribute("BeingBanished") then return end
		stompermodel:PivotTo(stompermodel.Root.CFrame - Vector3.new(0,0.1,0))
		wait()
		print("up")
	end
	char.HumanoidRootPart.Anchored = false
takedmg = false
	wait(2.5)
	
	for i = 0, 5, 1 do
		stompermodel:PivotTo(stompermodel.Root.CFrame + Vector3.new(0,1,0))
		wait()
		if stompermodel:GetAttribute("BeingBanished") then return end
		
	end
	for i = 0, 25, 1 do
		stompermodel:PivotTo(stompermodel.Root.CFrame + Vector3.new(0,4,0))
		wait()
		if stompermodel:GetAttribute("BeingBanished") then return end
		
	end
	print("up done")
	char.HumanoidRootPart.Anchored = false
	wait(1)
	stompermodel:Destroy()
	print("\"all clean!\"")
end
--[[while true do
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
end]]
print("loop has been skipped, automatically placed part")
roof_finder.Position = roof_finder.Position+Vector3.new(0,50,0)
Stomper(roof_finder.CFrame)
