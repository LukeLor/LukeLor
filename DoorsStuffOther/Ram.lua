---====== Load spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Entity-Spawner-V2/main/init.luau"))()

---====== Create entity ======---

local entity = Spawner:Create({
	Entity = {
		Name = "Ram",
		Asset = "https://github.com/LukeLor/LukeLor/blob/main/DoorsStuffOther/Ram.rbxm?raw=true",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 2
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 30, 0.1, 3} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 500,
		Delay = 4,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 3,
		Max = 10,
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
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Ram.", "It causes an earthquake, and flickers the lights.", "As you probably could have seen,", "it's extremely fast..","So whenever Ram comes by, you need to act fast!"},
		Cause = "Ram"
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
		--[[local att = nil
	for _, validAtt in entity.Model.RushNew:GetChildren() do
if validAtt:FindFirstChildOfClass("ParticleEmitter") then
att = ValidAtt 
				break
			end
			end	
		
		att.ParticleEmitter.TextureId = "rbxassetid://116573775116536"
		entity.Model.RushNew.PlaySound.SoundId = "rbxassetid://87112595752706"
    entity.Model.RushNew.PlaySound.PlaybackSpeed = 0.2
		entity.Model.RushNew.PlaySound.Volume = 1
		local close = entity.Model.RushNew.PlaySound:Clone()
close.Parent = entity.Model.RushNew
		
		close.MaxDistance = 80
close:Play() 
		close.PlaybackSpeed = 0.4
		]]
		print("Entity has spawned")
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
		print("Entity has killed the player")
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
