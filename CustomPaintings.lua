local MainUI = Player.PlayerGui.MainUI.MainFrame

local PaintingNames = {"Painting_Small", "Painting_Big", "Painting_VeryBig", "Painting_Tall"}

local Possible_Paintings = {
  Descending = {
      ImageId = "rbxassetid://135131256657473"
      Name = "Descending",
     PaintingType = "Painting_Big",
    CustomMessage = nil
},
  StormySky = {
      ImageId = "rbxassetid://119903654385404"
      Name = "Stormy Sky",
      PaintingType = "Painting_Tall",
      CustomMessage = nil
},
  TheFourOfUs = {
      ImageId = "rbxassetid://128088934961210"
      Name = "The Four of Us",
      PaintingType = "Painting_VeryBig",
      CustomMessage = nil
},
  Moonlight = {
    ImageId = "rbxassetid://100337614205400",
    Name = "Moonlight",
    PaintingType = "Painting_Small",
    CustomMessage = nil
},
  Starlight = {
    ImageId = "rbxassetid://120325627880675", 
    Name = "Starlight",
    PaintingType = "Painting_Small",
    CustomMessage = nil
},
  Asterlight = {
    ImageId = "rbxassetid://76169242475770",
    Name = "Asterlight",
    PaintingType = "Painting_Small",
    CustomMessage = nil
},
   RedLight = { 
    ImageId = "rbxassetid://76231278059847",
    Name = "Red Light",
    PaintingType = "Painting_Small",
    CustomMessage = "This painting doesn't have a title, yet it looks familiar..."
  }
}


function LoadPainting(PaintingTable, PaintingModel)
  if PaintingModel.Name ~= PaintingTable.PaintingType then return end
    if PaintingModel:GetAttribute("IsCustom") then return end
    PaintingModel:SetAttribute("IsCustom", true)
    local ImageLabel = PaintingModel.Canvas.SurfaceGui.ImageLabel
    ImageLabel.Image = PaintingTable.ImageId
    local Prompt = PaintingModel:FindFirstChildOfClass("ProximityPrompt")
    local NewPrompt = Prompt:Clone()
    NewPrompt.Parent = PaintingModel
  local captionText = PaintingTable.CustomMessage ~= nil and PaintingTable.CustomMessage or "This painting is titled \""..PaintingTable.Name..".\""
    NewPrompt.Triggered:Connect(function()
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(captionText, true)
    end)
    Prompt:Destroy()
end

function roomHasPaintings(room)
for _, inst in room:GetDescendants() do
if inst:IsA("Model") and table.find(PaintingNames, inst.Name) then
return true
    end
  end
  return false
end

function roomHasPaintingType(room, type)
for _, inst in room:GetDescendants() do
if inst:IsA("Model") and inst.Name == type then
return inst
    end
  end
  return nil
end

game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
local cRoom = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
local hasPaintings = roomHasPaintings(cRoom)
    if hasPaintings then
local randomPainting = Possible_Paintings[math.random(1,#Possible_Paintings)]
      if roomHasPaintingType(cRoom, randomPainting.PaintingType) ~= nil then
local paintingModel = roomHasPaintingType(cRoom, randomPainting.PaintingType)
        LoadPainting(randomPainting, paintingModel)

      end
    end

    
    end)


