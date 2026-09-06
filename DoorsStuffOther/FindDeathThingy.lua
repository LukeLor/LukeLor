while task.wait() do
local registered = {}
  for _, text in game.Players.LocalPlayer.PlayerGui.MainUI:GetDescendants() do
if text:IsA("TextLabel") and table.find(registered, text.Name) then
local s = text.Text
local pattern = "Blitz"
local start_index, end_index = string.find(s, pattern)
      if start_index and end_index then
       table.insert(registered, #registered+1, text.Name)
print(text.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Name..">"..text.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Name..">"..text.Parent.Parent.Parent.Parent.Paren.Parent.Parent.Parent.Name..">"..text.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Name..">"..text.Parent.Parent.Parent.Parent.Parent.Parent.Name..">"..text.Parent.Parent.Parent.Parent.Parent.Name..">"..text.Parent.Parent.Parent.Parent.Name..">"..text.Parent.Parent.Parent.Name..">"..text.Parent.Parent.Name..">"..text.Parent.Name..">"..text.Name)
      end
    end
  end
  
end
