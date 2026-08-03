loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
---====== Load spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Entity-Spawner-V2/main/init.luau"))()

---====== Create entity ======---

local entity = Spawner:Create({
	Entity = {
		Name = "A-15",
		Asset = "https://github.com/LukeLor/LukeLor/blob/main/DoorsStuffOther/A-15.rbxm?raw=true",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = false,
			Duration = 1
		},
		Shatter = false,
		Repair = false
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 100,
		Delay = 2,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 1,
		Max = 1,
		Delay = 2
	},
	Damage = {
		Enabled = true,
		IgnoreHiding = false,
		Range = 40,
		Amount = 125
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Curious", -- "Curious"
		Hints = {"You died to A-15...", "I'm sure you're familiar with many other entities that function the same way.", "Go back and try again, I'll be waiting.", "Will you come back?", "Haha, I know you will."},
		Cause = "A-15"
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
	local entityModel =	entity.Model
		local RushNew= entityModel:WaitForChild("RushNew")
		local spawn= RushNew.Spawn

		spawn.Parent = workspace
		spawn:Play()
		game:GetService("Debris"):AddItem(spawn, 6)
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room: Model, firstTime: boolean)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight: boolean)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound: boolean)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth: number)
	if newHealth <= 0 then
				local ui = LoadCustomInstance("https://github.com/LukeLor/LukeLor/blob/main/DoorsStuffOther/A15Jumpscare.rbxm?raw=true")
		
			ui.Parent = game.Players.LocalPlayer.PlayerGui
		
			game:GetService("TweenService"):Create(ui.Bg.A15, TweenInfo.new(0.75), {Size = ui.Bg.A15Dest.Size, Position = ui.Bg.A15Dest.Position}):Play()
			game:GetService("TweenService"):Create(ui.Bg, TweenInfo.new(1), {BackgroundColor3 = Color3.fromRGB(0, 0,0)}):Play()
			game:GetService("TweenService"):Create(ui.Bg.A15, TweenInfo.new(1.3), {ImageTransparency = 1}):Play()
			game:GetService("TweenService"):Create(ui.Bg, TweenInfo.new(3), {BackgroundTransparency = 1}):Play()
					game:GetService("Debris"):AddItem(ui, 6)
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run(true)
