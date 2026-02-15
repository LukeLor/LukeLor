local id = 1156217066
local desc = game.Players:GetHumanoidDescriptionFromUserId(id)
local emotes = desc:GetEmotes()
local char = workspace.X_masLucas7
local num = 0

for i, v in pairs(emotes) do
local emote = game.ReplicatedStorage.Events.LoadAsset:FireServer(v[1])
local temp = char.Animate.walk:Clone()
temp.Name = string.lower(i)
  temp:FindFirstChildOfClass("Animation").AnimationId
num = num+1
  image = "rbxthumb://0"
game.Players[char.Name].PlayerGui.MainUi.EmoteWheel.Main.EmoteWheels.Front:FindFirstChildOfClass("TextButton")[tostring(num)].Image = image
  
end
