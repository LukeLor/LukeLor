-- CREDITS TO REGULARVYNIXU FOR CUSTOM ACHIEVEMENTS! 
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

type Track = {
    Deaths: number,
    [number]: any
}



type DeathLog = { string }

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
    return success and result or {}
end

-- \\ Main // --

Module.CheckDeaths = function(self, identifier: string): boolean
  
    if table.find(DecodeConfig(), identifier) ~= nil then
local kills = table.find(DecodeConfig(), identifier)["Deaths"]
    return kills
  else
    return 0
  end
end

Module.ResetDeaths = function(self, identifier: string)
    local config = DecodeConfig()

    for i, v in next, config do
        if v == identifier then
            table.remove(config, i)
        end
    end

    WriteConfig(config)
end

Module.SetupDeaths = function(self, deathConfig: DeathConfig)
    
    local config = DecodeConfig()

    -- Fetch death config properties
    local newTrack = {}
    if typeof(deathConfig) == "table" then
        for i, v in next, deathConfig do
            newTrack[i] = v
        end
    end
    for i, v in next, DefaultTrack do
        if newTrack[i] == nil then
            newTrack[i] = v
        end
    end
    
    -- Check if player already set up
  if
         table.find(config, deathConfig.Identifier)
    then
    warn("Player already set up kill count.")
        return
    end


  config[#config + 1] = deathConfig.Identifier
  config[#config + 1]["Deaths"] = 0
  
  WriteConfig(config)
    
end

Module.UpdateDeaths(self, deathConfig: DeathConfig)
    
    local config = DecodeConfig()

  
    
    if
         table.find(config, deathConfig.Identifier)
    then
else
  warn("Can't update. No death counter has an identifier of: '"..tostring(deathConfig.Identifier).."' so try using SetupDeaths() instead.")  
    return
    end


  local kills = table.find(DecodeConfig(), deathConfig.Identifier)["Deaths"]
kills = kills + 1

    
  WriteConfig(config)
    
end

return Module
