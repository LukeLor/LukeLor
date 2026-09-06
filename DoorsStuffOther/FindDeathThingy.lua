while task.wait() do
local registered = {}
  for _, text in game.Players.LocalPlayer.PlayerGui.MainUI:GetDescendants() do
if text:IsA("TextLabel") then
local s = text.Text
local pattern = "Blitz"
local start_index, end_index = string.find(s, pattern)
      if start_index and end_index then
        print("Text Found!!")
print(text:GetFullName())
      end
  end
  
end
end
