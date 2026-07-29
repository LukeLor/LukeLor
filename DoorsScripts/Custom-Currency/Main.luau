-- \\ Services // --

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- \\ Variables // --

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local DefaultCurrency = {
    Identifier = "CustomCoins",
    Amount = 0
}

local Module = {}

type CurrencyConfig = {
    Identifier: string?
}

type CurrencyLog = {
    [string]: {
        Amount: number
    }
}

-- \\ Functions // --

local function WriteConfig(data: CurrencyLog): (boolean, string?)
    return pcall(function()
        writefile("DOORS_Custom_Currency.json", HttpService:JSONEncode(data))
    end)
end

local function DecodeConfig(): CurrencyLog
    local success, result = pcall(function()
        return HttpService:JSONDecode(readfile("DOORS_Custom_Currency.json"))
    end)
    return success and typeof(result) == "table" and result or {}
end

-- \\ Main // --

Module.CheckBalance = function(self, identifier: string): number
    local config = DecodeConfig()
  
    if config[identifier] ~= nil then
        local balance = config[identifier]["Amount"]
        return balance
    else
        return 0
    end
end

Module.ResetCurrency = function(self, identifier: string)
    local config = DecodeConfig()

    if config[identifier] ~= nil then
        config[identifier] = nil
    end

    WriteConfig(config)
end

Module.SetupCurrency = function(self, currencyConfig: CurrencyConfig)
    local config = DecodeConfig()
    
    local identifier = currencyConfig.Identifier or DefaultCurrency.Identifier
    
    if config[identifier] ~= nil then
        warn("Player already set up currency.")
        return
    end

    config[identifier] = {
        ["Amount"] = 0
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
