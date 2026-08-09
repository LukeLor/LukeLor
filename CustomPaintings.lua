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
  }
}


function LoadPainting(PaintingTable, PaintingModel)
  if PaintingModel.Name ~= PaintingTable.PaintingType then return end
    if PaintingModel:GetAttribute("IsCustom") then return end
    PaintingModel:SetAttribute("IsCustom", true)
    local ImageLabel = PaintingModel.Canvas.SurfaceGui.ImageLabel
    ImageLabel.Image = PaintingTable.Image
    local Prompt = PaintingModel:FindFirstChildOfClass("ProximityPrompt")
    local NewPrompt = Prompt:Clone()
    NewPrompt.Parent = PaintingModel
  local captionText = PaintingTable.CustomMessage ~= nil and PaintingTable.CustomMessage or "This painting is titled \""..PaintingTable.Name..".\""
    NewPrompt.Triggered:Connect(function()
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(captionText, true)
    end)
    Prompt:Destroy()
end




