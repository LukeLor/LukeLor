-- \\ Services // --

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- \\ Variables // --

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local DefaultTrack = {
    Identifier = "DeathRush",
    Deaths = 0
}

local Module = {}

type DeathConfig = {
    Identifier: string?,
    Deaths: number?
}

type DeathLog = {
    [string]: {
        Deaths: number
    }
}

-- \\ Functions // --

local function WriteConfig(data: DeathLog): (boolean, string?)
    return pcall(function()
        writefile("DOORS_Custom_Deaths.json", HttpService:JSONEncode(data))
    end)
end

local function DecodeConfig(): DeathLog
    local success, result = pcall(function()
        return HttpService:JSONDecode(readfile("DOORS_Custom_Deaths.json"))
    end)
    return success and typeof(result) == "table" and result or {}
end

-- \\ Main // --

Module.CheckDeaths = function(self, identifier: string): number
    local config = DecodeConfig()
  
    if config[identifier] ~= nil then
        local kills = config[identifier]["Deaths"]
        return kills
    else
        return 0
    end
end

Module.ResetDeaths = function(self, identifier: string)
    local config = DecodeConfig()

    if config[identifier] ~= nil then
        config[identifier] = nil
    end

    WriteConfig(config)
end

Module.SetupDeaths = function(self, deathConfig: DeathConfig)
    local config = DecodeConfig()
    
    local identifier = deathConfig.Identifier or DefaultTrack.Identifier
    
    if config[identifier] ~= nil then
        warn("Player already set up kill count.")
        return
    end

    config[identifier] = {
        ["Deaths"] = 0
    }
  
    WriteConfig(config)
end

Module.UpdateDeaths = function(self, deathConfig: DeathConfig)
    local config = DecodeConfig()
    local identifier = deathConfig.Identifier or DefaultTrack.Identifier
    
    if config[identifier] == nil then
        warn("Can't update. No death counter has an identifier of: '"..tostring(identifier).."' so try using SetupDeaths() instead.")  
        return
    end

    config[identifier]["Deaths"] = config[identifier]["Deaths"] + 1
    
    WriteConfig(config)
end

return Module
