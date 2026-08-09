local RiftHandler = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Custom-Rift/Main.luau"))()


RiftHandler:SetupRift({
Identifier = "TestingRift"
})


local Rift = RiftHandler:SpawnRift("TestingRift")
