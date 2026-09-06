while task.wait() do

  for _, text in game.Players.LocalPlayer.PlayerGui.MainUI:GetDescendants() do
if text:IsA("TextLabel") then
local s = text.Text
local pattern = "Blitz"
local start_index, end_index = string.find(s, pattern)
      if start_index and end_index then
print(text.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Name..">"..text.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Name..">"..text.Parent.Parent.Parent.Parent.Paren.Parent.Parent.Parent.Name..">"..text.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Name..">"..text.Parent.Parent.Parent.Parent.Parent.Parent.Name..">"..text.Parent.Parent.Parent.Parent.Parent.Name..">"..text.Parent.Parent.Parent.Parent.Name..">"..text.Parent.Parent.Parent.Name..">"..text.Parent.Parent.Name..">"..text.Parent.Name..">"..text.Name)
      end
    end
  end
  
end
