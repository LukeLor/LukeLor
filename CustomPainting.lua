--NOT MINE
local captions = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CaptionDoorsSource.lua"))()


local Converter = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/BinaryToTextModule.lua"))()

local SyncHelper = loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAcceleration/Comet-Development/refs/heads/main/Doors/Utility/SyncHelper.lua"))()
local SyncSeed = SyncHelper:returnSeed()
local SyncRandom = Random.new(SyncSeed)

local Player = game:GetService("Players").LocalPlayer
local MainUI = Player.PlayerGui.MainUI.MainFrame
local Player = game.Players.LocalPlayer

local ImageSize = Enum.ThumbnailSize.Size420x420 -- Thumbnail Size
local ImageType = Enum.ThumbnailType.HeadShot -- Thumbnail Type

local content = game.Players:GetUserThumbnailAsync(Player.UserId, ImageType, ImageSize) -- Gets Image from UserId



local PaintingNames = {"Painting_Small", "Painting_Big", "Painting_VeryBig", "Painting_Tall"}
local Paintings = {
    {
        ID = "Yourself",
        CanBeOn = {"Painting_Small","Painting_Big"},
        PaintingMessage = 'It is you!',
        PaintingMessageDuration = 5,
        PaintingImage = content,
        Weight = 0.00000235
    },
    {
        ID = "Surge",
        CanBeOn = {"Painting_Small"},
        PaintingMessage = 'A small shock goes through your body...',
        PaintingMessageDuration = 5,
        PaintingImage = "rbxassetid://121949728359085",
        Weight = 0.00000235
    },
    {
        ID = "Rush",
        CanBeOn = {"Painting_Small"},
        PaintingMessage = 'This seems to be something you remember.',
        PaintingMessageDuration = 5,
        PaintingImage = "rbxassetid://131912907317839",
        Weight = 0.000235
    }
}

function GetPaintingByWeight()
    local totalWeight = 0
    for _, Painting in pairs(Paintings) do
        totalWeight = totalWeight + Painting.Weight
    end
    local randomWeight = SyncRandom:NextNumber() * totalWeight
    local cumulativeWeight = 0
    for _, Painting in pairs(Paintings) do
        cumulativeWeight = cumulativeWeight + Painting.Weight
        if randomWeight <= cumulativeWeight then
            return Painting
        end
    end
    return nil
end

function LoadPaintingTableOnPainting(PaintingModel, PaintingTable)
    if PaintingModel:GetAttribute("IsCustom") then return end
    PaintingModel:SetAttribute("IsCustom", true)
    local ImageLabel = PaintingModel.Canvas.SurfaceGui.ImageLabel
    ImageLabel.Image = PaintingTable.PaintingImage
    local Prompt = PaintingModel:FindFirstChildOfClass("ProximityPrompt")
    local NewPrompt = Prompt:Clone()
    NewPrompt.Parent = PaintingModel
    NewPrompt.Triggered:Connect(function()
        MainUI:FindFirstChild("LiveCaption"):Destroy()
            captions.TypeCaption(PaintingTable.PaintingMessage)
            end)
    Prompt:Destroy()
end

function CanLoadPaintingTableOnPaintingModel(t, m)
    if table.find(t.CanBeOn, m.Name) then return true end
    return false
end

function IsPaintingTable(t)
    if t.ID and t.PaintingImage and t.PaintingMessage then return true end
    return false
end

game:GetService("Players").ServerRoomChanged:Connect(function(Room)
    task.wait()
    for _, v in Room:FindFirstChild("Assets"):GetChildren() do
        if table.find(PaintingNames, v.Name) then
            local Painting = GetPaintingByWeight()
            if Painting and IsPaintingTable(Painting) and CanLoadPaintingTableOnPaintingModel(Painting, v) then
                LoadPaintingTableOnPainting(v, Painting)
            end
        end
    end
end)
