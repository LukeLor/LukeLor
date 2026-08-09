--Rewriting
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
  ItemName = "Random"
    ItemLink = ""
}

local Module = {}

type RiftConfig = {
    Identifier: string?
}

type RiftLog = {
    [string]: {
        ItemLink: string,
        ItemName: string
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
    local itemName = riftConfig.
    if config[identifier] ~= nil then
        warn("Player already set up rift.")
        return
    end

    config[identifier] = {
        ["ItemLink"] = ,
    ["ItemName"] = 
    }
  
    WriteConfig(config)
end

Module.UpdateCurrency = function(self, currencyConfig: CurrencyConfig, addedAmt: number)
    local config = DecodeConfig()
    local identifier = currencyConfig.Identifier or DefaultCurrency.Identifier
    
    if config[identifier] == nil then
        warn("Can't update. No currency has an identifier of: '"..tostring(identifier).."' so try using SetupCurrency() instead.")  
        return
    end

local toAdd = addedAmt ~= nil and addedAmt or 1
    config[identifier]["Amount"] = config[identifier]["Amount"] + toAdd 
    
    WriteConfig(config)
end

return Module
