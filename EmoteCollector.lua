
local friends = game.Players:GetFriendsAsync(game.Players.X_masLucas7.UserId):GetCurrentPage()
local id = 0
for i, friend in pairs(friends) do
 print(i, friend)
 id = friend.Id
 break
end

local desc = game.Players:GetHumanoidDescriptionFromUserId(id)
local emotes = desc:GetEmotes()
local char = workspace.X_masLucas7
local num = 0

for i, v in pairs(emotes) do
local emote = game.InsertService:LoadAsset(v[1])
local temp = char.Animate.walk:Clone()
temp.Parent = char.Animate
temp.Name = string.lower(i)
temp:FindFirstChildOfClass("Animation").AnimationId = emote:FindFirstChildOfClass("Animation").AnimationId
num = num+1
local image = "rbxthumb://type=Asset&id=" ..v[1].. "&w=150&h=150"
game.Players[char.Name].PlayerGui.MainUi.EmoteWheel.Main:FindFirstChildOfClass("Frame").Front:FindFirstChildOfClass("TextButton")[tostring(num)].Image = image
game.Players[char.Name].PlayerGui.MainUi.EmoteWheel.Main:FindFirstChildOfClass("Frame").Front:FindFirstChildOfClass("TextButton")[tostring(num)]:SetAttribute("Name", i)
  
end
