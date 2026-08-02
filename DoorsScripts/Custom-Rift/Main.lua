-- \\ Services // --

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- \\ Variables // --

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local DefaultRift = {
    Identifier = "CustomRift",
    ItemName = "Unknown",
    ItemLink = "",
    ItemIcon = "rbxassetid://0"
}

local Module = {}

type RiftConfig = {
    Identifier: string?,
    ItemName: string?,
    ItemLink: string?,
    ItemIcon: string?
}

type RiftLog = {
    [string]: {
        ItemName: string,
        ItemLink: string,
        ItemIcon: string
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

Module.SpawnRift = function(self, identifier:string, color:Color3, offset:Vector3)
local riftModel = game:GetObjects("rbxassetid://RIFTLINK")[1]
 riftModel.Parent = workspace 
    local spot = CFrame.new(0,0,0)
    riftModel:PivotTo(spot+offset)
    if color then
--Color the Rift
    end
end

Module.CheckRiftedItem = function(self, identifier: string): string
    local config = DecodeConfig()
  
    if config[identifier] ~= nil then
        local itemName = config[identifier]["ItemName"]
  
        return itemName
    else
        return "Unknown"
    end
end

Module.RemoveRift = function(self, identifier: string)
    local config = DecodeConfig()

    if config[identifier] ~= nil then
        config[identifier] = nil
    end

    WriteConfig(config)
end

Module.SetupRift = function(self, riftConfig: RiftConfig)
    local config = DecodeConfig()
    
    local identifier = riftConfig.Identifier or DefaultRift.Identifier
  local name = riftConfig.ItemName or DefaultRift.ItemName 
  local link = riftConfig.ItemLink or DefaultRift.ItemLink
  
    
    if config[identifier] ~= nil then
        warn("Player already set up rift.")
        return
    end

    config[identifier] = {
        ["ItemName"] = "",
    ["ItemLink"] = ""
    }
  
    WriteConfig(config)
end

Module.UpdateRift = function(self, riftConfig: RiftConfig)
    local config = DecodeConfig()
    local identifier = riftConfig.Identifier or DefaultRift.Identifier
    local name = riftConfig.ItemName or DefaultRift.ItemName 
  local link = riftConfig.ItemLink or DefaultRift.ItemLink
  
    if config[identifier] == nil then
        warn("Can't update. No rift has an identifier of: '"..tostring(identifier).."' so try using SetupRift() instead.")  
        return
    end

config[identifier] = {
        ["ItemName"] = name,
    ["ItemLink"] = link
  }
  
    WriteConfig(config)
end

return Module
