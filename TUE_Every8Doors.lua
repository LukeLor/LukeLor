local every8 = {}

for i = 0, 100, 8 do
if i <= 100 then
every8[i] = "Valid"
  end
    
end

game.ReplicatedStorage.GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function(newVal)

if every8[newValue] == "Valid" then
loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/TheUniversalEye.lua"))()
    end

end)
