--[[Directory:
--MINUS 50 ON RIFT COLOR

                                      Rift]
                                  Rift
                                  Center]
                            Music
                            MusicClose
                            Attachment]
                      PointLight
                            ItemHolder] 
                      PointLight
                      Item 
                            ParticlesIn] 
                      Core
                      RainbowShards
                      Triangles
                      ZoomParticle
                           ParticlesOut] 
                      Core
                      RainbowShards
                      Explosion
                      Traingles
                      RiftLines
                      RiftLines2  
                      ZoomParticle
                                            RiftPrompt
]]


--Logic: Store item, SAVE MECHANICS - POSSIBLY BY LINK.


--REUSING CURRENCY SCRIPT TO GET A FOUNDATION OF THIS, STILL EDITING.
-- \\ Services // --

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- \\ Variables // --

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local DefaultRift = {
    Identifier = "CustomRift",
  ItemName = "Gumdrop",
    ItemLink = "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/GumdropItem.lua",
  ItemIcon = "rbxassetid://112795458705129",
  ColorRed = 120,
  ColorGreen = 217,
  ColorBlue = 255,
MusicId = "rbxassetid://11869807210"
}

local Module = {}

type RiftConfig = {
    Identifier: string?,
  ItemLink: string?,
  ItemName: string?,
  ItemIcon: string?,
  ColorRed: number?,
  ColorGreen: number?,
  ColorBlue: number?,
MusicId: string?
}

type RiftLog = {
    [string]: {
        ItemLink: string,
        ItemName: string,
    ItemIcon: string,
    ColorRed: number,
  ColorGreen: number,
  ColorBlue: number,
MusicId: string
    }
}

-- \\ Functions // --

local function WriteConfig(data: RiftLog): (boolean, string?)
    return pcall(function()
        writefile("DOORS_Custom_Rift.json", HttpService:JSONEncode(data))
    end)
end

local function DecodeConfig(): RiftLog
    local success, result = pcall(function()
        return HttpService:JSONDecode(readfile("DOORS_Custom_Rift.json"))
    end)
    return success and typeof(result) == "table" and result or {}
end

-- \\ Main // --

Module.CheckItemInRift = function(self, identifier: string): string
    local config = DecodeConfig()
  
    if config[identifier] ~= nil then
        local foundItem = config[identifier]["ItemName"]
        return foundItem
    else
        return "Unknown"
    end
end

Module.SpawnRift = function(self, identifier: string, position)
local config = DecodeConfig()
if not config[identifier] then warn("Cant spawn rift because config for the given identifier doesnt exist.")return end
  loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/refs/heads/main/Functions.lua"))()
local rift = LoadCustomInstance("https://github.com/LukeLor/LukeLor/blob/main/DoorsScripts/Custom-Rift/CustomRift.rbxm?=raw=true")
rift.Parent = workspace
rift.Name = "Rift_"..identifier.."_Live"
 local pivotPart = Instance.new("Part")
if typeof(position) == "Vector3" then
  pivotPart.Position = position
  elseif typeof(position) == "CFrame" then
    pivotPart.CFrame = position 
  else
    pivotPart.Position = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position
  end
  pivotPart.Anchored = true
  pivotPart.CanCollide = false
  pivotPart.Transparency = 1
  pivotPart.Parent = workspace
 
  rift:PivotTo(pivotPart.CFrame)
  

  local assembledColorVal = Color3.fromRGB(config[identifier]["ColorRed"],config[identifier]["ColorGreen"],config[identifier]["ColorBlue"])
local riftColorVal = Color3.fromRGB(math.clamp(config[identifier]["ColorRed"]-50,0,255),math.clamp(config[identifier]["ColorGreen"]-50,0,255),math.clamp(config[identifier]["ColorBlue"]-50, 0, 255))
rift.Rift.Color = assembledColorVal

rift.Center.Attachment.PointLight.Color = assembledColorVal
rift.Center.ItemHolder.PointLight.Color = assembledColorVal
rift.Center.ParticlesIn.Core.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, assembledColorVal),ColorSequenceKeypoint.new(1, assembledColorVal)}
rift.Center.Music.SoundId =  config[identifier]["MusicId"]
rift.Center.MusicClose.SoundId =  config[identifier]["MusicId"]
  

for _, pE in rift.Center.ParticlesOut:GetChildren() do
if pE:IsA("ParticleEmitter") then
          pE.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, assembledColorVal),ColorSequenceKeypoint.new(1, assembledColorVal)}
end
  end
rift.Center.RiftPrompt.Triggered:Connect(function()
     --  loadstring(game:HttpGet(config[identifier]["ItemLink"]))()
for _, pE in rift.Center.ParticlesOut:GetChildren() do
if pE:IsA("ParticleEmitter") then
          pE.Enabled = true
      task.wait(0.3)
     pE.Enabled = false
      end
      end
    end)
local itemDisplay = coroutine.create(function()
while task.wait(1) do 
rift.Center.ItemHolder.Item.TextureId = config[identifier]["ItemIcon"]
    end
  end)
coroutine.resume(itemDisplay)
return rift
end


  



Module.EraseRift = function(self, identifier: string)
    local config = DecodeConfig()

    if config[identifier] ~= nil then
        config[identifier] = nil
    end

    WriteConfig(config)
end

Module.SetupRift = function(self, riftConfig: RiftConfig)
    local config = DecodeConfig()
    
    local identifier = riftConfig.Identifier or DefaultRift.Identifier
    local itemName = riftConfig.ItemName or DefaultRift.ItemName
  local itemLink = riftConfig.ItemLink or DefaultRift.ItemLink
    local itemIcon = riftConfig.ItemIcon or DefaultRift.ItemIcon
    local colorRed = riftConfig.ColorRed or DefaultRift.ColorRed
    local colorGreen = riftConfig.ColorGreen or DefaultRift.ColorGreen
    local colorBlue = riftConfig.ColorBlue or DefaultRift.ColorBlue
      local musicId = riftConfig.MusicId or DefaultRift.MusicId
  if config[identifier] ~= nil then
        warn("Player already set up rift.")
        return
    end

    config[identifier] = {
        ["ItemLink"] = itemLink,
    ["ItemName"] = itemName,
    ["ItemIcon"] = itemIcon,
  ["ColorRed"] = colorRed,
  ["ColorGreen"] = colorGreen,
  ["ColorBlue"] = colorBlue,
  ["MusicId"] = musicId
    }
  
    WriteConfig(config)
end

Module.UpdateRift = function(self, riftConfig: RiftConfig, newConfig)
    local config = DecodeConfig()
    local identifier = riftConfig.Identifier or DefaultRift.Identifier
    
    if config[identifier] == nil then
        warn("Can't update. No rift has an identifier of: '"..tostring(identifier).."' so try using SetupRift() instead.")  
        return
    end


  
config[identifier]["ItemLink"] = newConfig["ItemLink"]
config[identifier]["ItemName"] = newConfig["ItemName"]
config[identifier]["ItemIcon"] = newConfig["ItemIcon"]

if newConfig["ColorRed"] then
  config[identifier]["ColorRed"] = newConfig["ColorRed"]
end
    if newConfig["ColorGreen"] then
  config[identifier]["ColorGreen"] = newConfig["ColorGreen"]
end
if newConfig["ColorBlue"] then
  config[identifier]["ColorBlue"] = newConfig["ColorBlue"]
end
if newConfig["MusicId"] then
  config[identifier]["MusicId"] = newConfig["MusicId"]
end


    WriteConfig(config)
end

return Module
