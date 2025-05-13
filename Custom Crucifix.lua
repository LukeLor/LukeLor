--Currently getting info rn. HEAVILY BASED ON REGULAR VYNIXU'S SCRIPT
--[[function PlayerInLineOfSight(model, config)
	local origin = model:GetPivot().Position
	local charOrigin = localCollision.Position

	if (charOrigin - origin).Magnitude <= config.Damage.Range then
		local params = RaycastParams.new()
		params.FilterType = Enum.RaycastFilterType.Exclude
		params.FilterDescendantsInstances = {localChar, model}

		local result = workspace:Raycast(origin, charOrigin - origin, params)
		return (result == nil), result
	end
	return false
end]]
local config = {Resist = false, IgnoreEntities = {}, Uses = -1, ResistEntities = {}} -- -1 for infinite
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
-- Variables
local localPlayer = Players.LocalPlayer
local localCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local localRoot = localCharacter:WaitForChild("HumanoidRootPart")
local localPlayerGui = localPlayer:WaitForChild("PlayerGui")
local localMouse = localPlayer:GetMouse()
local moduleScripts = {
	Main_Game = require(localPlayerGui.MainUI.Initiator.Main_Game),
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local crucifix = LoadCustomInstance("https://github.com/RegularVynixu/Utilities/raw/refs/heads/main/Doors/Item%20Spawner/Assets/Crucifix.rbxm")
local seal = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/SealWithGuardNew.rbxm")


local SealIcon = "rbxassetid://123535107502536" --Custom
local usesv = Instance.new("NumberValue")
usesv.Value = config.Uses
local sealcolor = Color3.fromRGB(89, 255, 114)
local failcolor = Color3.fromRGB(255, 116, 130)
seal.CrucSeal.Sigil.SigilReal.Texture = SealIcon
seal.CrucSeal.Sigil.SigilBG.Texture = SealIcon
seal.CrucSeal.Position = seal.Root.Position + Vector3.new(0, 0.125, 0)

function WaitUntil(sound, t)
    repeat RunService.RenderStepped:Wait() until sound.TimePosition >= t
end
	seal.CrucSeal.Pulse.Ring.Rate = 0.5
for _, effects in pairs(seal:GetDescendants()) do
	if effects:IsA("ParticleEmitter") then
		effects.Color = ColorSequence.new(sealcolor)
	end
	if effects:IsA("PointLight")  then
		effects.Color = sealcolor
	end
end
crucifix.Parent = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
function CrucifixActivation(model, config, plrtool)
	usesv.Value -= 1
	task.wait(0.1)
	if usesv.Value == 0 then
		plrtool:Destroy()
	end
	local localchar = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
	local localroot = localchar:WaitForChild("HumanoidRootPart")
local tool = crucifix:Clone()
    tool:PivotTo(localroot.CFrame)
    tool.Parent = workspace

	local toolPivot = tool:GetPivot()
	local entityPivot = model:GetPivot()

	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = {localchar, model}
	local result = workspace:Raycast(entityPivot.Position, Vector3.new(0, -1000, 0), params)
	
    if not result then
        return
    end

    model:SetAttribute("BeingBanished", true)

    -- Variables
	local repentance = seal:Clone()
	local crucifixr = repentance.CrucSeal.Crucifix
local pentagram = repentance.CrucSeal
	local entityPart = repentance.CrucSeal.Entity
	local sound = (config.Resist and crucifixr.SoundFail or crucifixr.Sound)
	local animtoplay = (config.Resist and repentance.Sealer.Animation.Fail or repentance.Sealer.Animation.Success)
	local anim = repentance.Sealer.AnimationController:LoadAnimation(animtoplay)
	local shaker = moduleScripts.Main_Game.camShaker:StartShake(5, 20, 2, Vector3.new())

    -- Repentance setup
	repentance:PivotTo(CFrame.new(result.Position))
	crucifixr.CFrame = toolPivot
	repentance.CrucSeal.Entity.CFrame = entityPivot
    --crucifixr.BodyPosition.Position = (localCharacter:GetPivot() * CFrame.new(0.5, 3, -6)).Position
	repentance.Parent = workspace
	sound:Play()
	anim:Play()
	
	

    -- Teleport model to repentance entity part
	task.spawn(function()
        if not config.Resist or not table.find(config.ResistEntities, model)then
            while model.Parent and repentance.Parent do
                model:PivotTo(entityPart.CFrame)
                task.wait()
            end

            model:Destroy()
        end
	end)
	wait(0.3)
-- Pentagram animation
--	TweenService:Create(pentagram.Circle, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), { CFrame = pentagram.Circle.CFrame - Vector3.new(0, 25, 0) }):Play()
	TweenService:Create(crucifixr.BodyAngularVelocity, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.In), { AngularVelocity = Vector3.new(0, 40, 0) }):Play()
	--task.delay(2, pentagram.Circle.Destroy, pentagram.Circle)

	task.spawn(function()
        WaitUntil(sound, 2.625)
		
		

        TweenService:Create(pentagram.LightAttach.LightBright, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
			Brightness = 5,
			Range = 40
		}):Play()
		
        TweenService:Create(crucifixr.Light, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
			Brightness = 11.25,
			Range = 30
		}):Play()
		
        task.wait(1.5)
		
        TweenService:Create(pentagram.LightAttach.LightBright, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
			Brightness = 0,
			Range = 0
		}):Play()
		
        TweenService:Create(crucifixr.Light, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
			Brightness = 0,
			Range = 0
		}):Play()

		if config.Resist == false or not table.find(config.ResistEntities, model) then
            TweenService:Create(crucifixr.Light, TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), { Brightness = 15, Range = 40 }):Play()
            shaker:StartFadeOut(3)

            TweenService:Create(crucifixr.BodyAngularVelocity, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { AngularVelocity = Vector3.new() }):Play()
        end
	end)

	-- Actions
	if config.Resist == false or not table.find(config.ResistEntities, model) then
		WaitUntil(sound, 2)
		TweenService:Create(crucifixr, TweenInfo.new(.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
	Material =  288,
	Color = sealcolor
}):Play()
        TweenService:Create(entityPart, TweenInfo.new(3, Enum.EasingStyle.Back, Enum.EasingDirection.In), { CFrame = pentagram.Entity.CFrame - Vector3.new(0, 25, 0) }):Play()
		WaitUntil(sound, 6.75)
		
	else
		WaitUntil(sound, 4)

		TweenService:Create(crucifixr.BodyAngularVelocity, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { AngularVelocity = Vector3.new() }):Play()
		TweenService:Create(pentagram.LightAttach.LightBright, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), { Brightness = 0, Range = 0, Color = Color3.fromRGB(255, 116, 130) }):Play()
		TweenService:Create(crucifixr.Light, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), { Brightness = 0, Range = 0, Color = Color3.fromRGB(255, 116, 130) }):Play()
		shaker:StartFadeOut(3)
		task.spawn(function()
			local color = Instance.new("Color3Value")
			color.Value = sealcolor

			local tween = TweenService:Create(color, TweenInfo.new(0.5, Enum.EasingStyle.Sine), { Value = failcolor })
			tween:Play()

			while tween.PlaybackState == Enum.PlaybackState.Playing do
				for _, d in repentance:GetDescendants() do
					if d.ClassName == "Beam" then
						d.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, color.Value), ColorSequenceKeypoint.new(1, color.Value)}

					elseif d.Name == "Crucifix" then
						d.Color = color.Value
					end
				end
				task.wait()
			end
		end)

		WaitUntil(sound, 9.625)
			 TweenService:Create(repentance.CrucSeal.Bottom, TweenInfo.new(4, Enum.EasingStyle.Back, Enum.EasingDirection.In), { WorldCFrame = repentance.CrucSeal.Bottom.WorldCFrame - Vector3.new(0, 10, 0) }):Play()
         TweenService:Create(repentance.CrucSeal.Top, TweenInfo.new(4, Enum.EasingStyle.Back, Enum.EasingDirection.In), { WorldCFrame = repentance.CrucSeal.Top.WorldCFrame - Vector3.new(0, 10, 0) }):Play()
	
	end

	-- Crucifix explode
	
	TweenService:Create(pentagram.Crucifix, TweenInfo.new(1), { Size = pentagram.Crucifix.Size * 3, Transparency = 1 }):Play()
	TweenService:Create(repentance.CrucSeal.LightAttach.LightBright, TweenInfo.new(1), { Brightness = 0, Range = 0 }):Play()
	TweenService:Create(pentagram.Crucifix.Light, TweenInfo.new(1), { Brightness = 0, Range = 0 }):Play()
	TweenService:Create(repentance.CrucSeal.Sigil.SigilReal, TweenInfo.new(2), {Rate = 0 }):Play()
	TweenService:Create(repentance.CrucSeal.Sigil.SigilBG, TweenInfo.new(2), {Rate = 0 }):Play()
	TweenService:Create(repentance.CrucSeal.Mark.Assist, TweenInfo.new(2), {Rate = 0 }):Play()
TweenService:Create(repentance.CrucSeal.Mark.Inner, TweenInfo.new(2), {Rate = 0 }):Play()
	TweenService:Create(repentance.CrucSeal.Spark, TweenInfo.new(2), {Rate = 0 }):Play()
		TweenService:Create(repentance.CrucSeal.Lines, TweenInfo.new(2), {Rate = 0 }):Play()
	if not config.Resist or not table.find(config.ResistEntities, model) then
		repentance.Crucifix.ExplodeParticle:Emit(math.random(20, 30))
		moduleScripts.Main_Game.camShaker:ShakeOnce(7.5, 7.5, 0.25, 1.5)
		for _, sound in pairs(model:GetDescendants()) do
	if sound:IsA("Sound") then
		TweenService:Create(sound, TweenInfo.new(2), {Volume = 0}):Play()
	end
end
	else
		model:SetAttribute("BeingBanished", false)
		model:SetAttribute("Paused", false)
		
	end

	task.delay(5, repentance.Destroy, repentance)
end
local UserInputService = game:GetService("UserInputService")


local localPlayer = game.Players.LocalPlayer
local localMouse = localPlayer:GetMouse()
crucifix.Activated:Connect(function()
    if localCharacter:FindFirstChild("Crucifix") then
			 local playerTool = localCharacter.Crucifix
   local target = localMouse.Target
        if target then
            local model = target.Parent
            
            -- Validate target
           if model:IsA("Model") and not model:GetAttribute("BeingBanished") and not table.find(config.IgnoreEntities, model)  then
					
--  local isCustomEntity = model:GetAttribute("CustomEntity")

               
                -- Banish whatever
                CrucifixActivation(model, playerTool, config)
          end
        end
		end
	end)
