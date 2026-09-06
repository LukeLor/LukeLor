if getgenv().Vynixu_Crucifix_Everything then
    return getgenv().Vynixu_Crucifix_Everything
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local protectTest= coroutine.create(function()
while task.wait(0.1) do
if game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") then
game.Players.LocalPlayer.Character:SetAttribute("Hiding",true)
      end
    end
  end)

coroutine.resume(protectTest)
-- \\ Services // --

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

-- \\ Variables // --

local ROOT = "https://github.com/RegularVynixu/DOORS-Crucifix-Everything/raw/main"

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Mouse = LocalPlayer:GetMouse()

local Assets = {
    Repentance = LoadCustomInstance(ROOT.."/Assets/Repentance.rbxm"),
    Crucifix = LoadCustomInstance(ROOT.."/Assets/Crucifix.rbxm")
}
local Module = {
    Connections = {},
    ActiveTools = {}
}
local DefaultConfig = {
    Type = 1,
    Uses = 1,
    Resist = false,
    EntitiesOnly = false,
    CustomColor = nil,
    IgnoreList = {}
}
local CrucifixTypes = {
    [1] = {
        Name = "Guiding",
        Color = Color3.fromRGB(137, 207, 255)
    },
    [2] = {
        Name = "Curious",
        Color = Color3.fromRGB(255, 227, 137)
    }
}

-- \\ Functions // --

local function WaitUntil(sound: Sound, t: number)
    repeat RunService.RenderStepped:Wait() until sound.TimePosition >= t
end

local function FadeOut(pentagram: Model)
    for _, v in pentagram:GetChildren() do
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

local function Crucifix(model: Model, playerTool: Tool, config: any)
    config = config or table.clone(DefaultConfig)

    -- \\ Handle crucifix uses
    if typeof(config.Uses) == "number" then
        config.Uses -= 1
        if config.Uses <= 0 and playerTool then
            if Module.ActiveTools[playerTool] then
                Module.ActiveTools[playerTool] = nil
            end
            playerTool:Destroy()
        end
    end

    -- \\ Setup
	local entityPivot = model:GetPivot()

	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = {Character, model}
	
    local result = workspace:Raycast(entityPivot.Position, Vector3.new(0, -1000, 0), params)
    if not result then return end

    model:SetAttribute("BeingBanished", true)

    -- \\ Variables
    local MainGame = require(PlayerGui.MainUI.Initiator.Main_Game :: ModuleScript)
    local CamShaker = MainGame.camShaker
	local TheShake = CamShaker:StartShake(5, 20, 2, Vector3.zero)

	local Repentance = Assets.Repentance:Clone()
	local Crucifix = Repentance.Crucifix
    local Handle = Crucifix.Handle
	local Pentagram = Repentance.Pentagram
	local EntityPart = Repentance.Entity
	local Sound = Handle[config.Resist and "SoundFail" or "Sound"]

    -- \\ Repentance setup
	Repentance:PivotTo(CFrame.new(result.Position))
	Crucifix:PivotTo(Character:GetPivot())
	EntityPart.CFrame = entityPivot
	Repentance.Parent = workspace
	Sound:Play()

    -- \\ Set pentagram color
    local CrucifixType = CrucifixTypes[config.Type or 1]
    local Color = CrucifixType.Color

    if typeof(config.CustomColor) == "Color3" then
        Color = config.CustomColor
    end

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
        if not config.Resist then
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

    if not config.Resist then
        -- \\ Start raising entity
        TweenService:Create(
            EntityPart,
            TweenInfo.new(3, Enum.EasingStyle.Elastic, Enum.EasingDirection.In),
            { CFrame = EntityPart.CFrame + Vector3.new(0, 2, 0) }
        ):Play()
    end

    -- \\ Ritual animation
	task.spawn(function()
        WaitUntil(Sound, 2.625)
		
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

		if not config.Resist then
            -- \\ Big light things
            TweenService:Create(
                Handle.Light,
                TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut),
                { Brightness = 15, Range = 40 }
            ):Play()

            TheShake:StartFadeOut(3)
            FadeOut(Pentagram)

            TweenService:Create(
                Handle.BodyAngularVelocity,
                TweenInfo.new(3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
                { AngularVelocity = Vector3.zero }
            ):Play()
        end
	end)

	-- \\ Crucifix actions
	if not config.Resist then
		WaitUntil(Sound, 2.5)
		
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

        WaitUntil(Sound, 6.75)
	else
		WaitUntil(Sound, 4)

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

		WaitUntil(Sound, 9.625)
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

	if not config.Resist then
		Handle.ExplodeParticle:Emit(math.random(20, 30))
		CamShaker:ShakeOnce(7.5, 7.5, 0.25, 1.5)
	else
		model:SetAttribute("BeingBanished", false)
		model:SetAttribute("Paused", false)
		FadeOut(Pentagram)
	end

	task.delay(5, Repentance.Destroy, Repentance)
end

-- \\ Setup // --

Module.Connections.InputBegan = UserInputService.InputBegan:Connect(function(input: InputObject, gameProcessed: boolean)
    if gameProcessed then return end
    
    local playerTool = Character:FindFirstChild("Crucifix")
    if 
        (
            input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch
        )
        and playerTool
    then
        local config = Module.ActiveTools[playerTool]
        if not config then return end

        local target = Mouse.Target
        if target then
            local model = target:FindFirstAncestorWhichIsA("Model")
            
            -- \\ Validate target
            if
                model
                and not model:GetAttribute("BeingBanished")
                and not table.find(config.IgnoreList, model)
            then
                if
                    config.EntitiesOnly
                    and not model:GetAttribute("CustomEntity")
                then
                    return
                end
                Crucifix(model, playerTool, config)
            end
        end
    end
end)

-- \\ Main // --

Module.GiveCrucifix = function(self, config: any)
    config = config or table.clone(DefaultConfig)

    local crucifix = Assets.Crucifix:Clone()
    crucifix.Parent = LocalPlayer.Backpack

    self.ActiveTools[crucifix] = config
end

Module.Unload = function(self)
    for i, v in next, self.Connections do
        v:Disconnect()
        self.Connections[i] = nil
    end
    for i in next, self do
        self[i] = nil
    end
    getgenv().Vynixu_Crucifix_Everything = nil
end

print("Crucifix Everything script by .vynixu")

getgenv().Vynixu_Crucifix_Everything = Module
return Module
