--Base Script by RegularVynixu 
local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Entity-Spawner-V2/main/init.luau"))()
local Communicator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Communicator/main/init.luau"))()
local CutsceneMaker = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CutsceneMaker.lua"))()

-- \\ Services // --

local Players = game:GetService("Players")

-- \\ Variables // --

local LocalPlayer = Players.LocalPlayer
local Host: Player? = nil

local CutsceneActive = false
local activeClients = {} :: {Player}
local listOfEntities = {
    [1] = "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Stomper.lua"
	[2] = "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Dasher.lua"
}


local CamLock = function(lock_unlock:boolean)
local maingame = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
if maingame then
		maingame.stopcam = lock_unlock
	end
end

local HideShowChar = function(char, show_hide)
	if string.lower(show_hide) == "hide" then
		for _, parts in char:GetDescendants() do
if parts:IsA("BasePart") then

			parts:SetAttribute("OgTransparency", parts.LocalTransparencyModifier)
part.LocalTransparencyModifier = 1
		end
		end
	end

else
	for _, parts in char:GetDescendants() do
if parts:IsA("BasePart") then

			local ogtrans= parts:GetAttribute("OgTransparency")
part.LocalTransparencyModifier = ogtrans
		end
	end
end


local isAlive = function()
if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then

		return true
		
	else

		return false
	
	end
	end
	-- \\ Setup // --

Communicator.Config.ExcludeSelf = false

task.spawn(function()
    while true do
        activeClients = Communicator:Ping(1, true)
        
        -- Elect player as Host by UserId
        table.sort(activeClients, function(a: Player, b: Player)
            return a.UserId < b.UserId
        end)

        local host = activeClients[1]
        if host ~= Host then
            print("New Host elected:", host)
        end

        Host = host

        task.wait(1)
    end
end)

Communicator:Listen("SpawnEntity", function(sender: Player, id: number)
    if sender ~= Host then
        -- Ignore commands not sent by Host
        return
    end

    -- Spawn entity with id
  loadstring(game:HttpGet(listOfEntities[id]))()
end)

Communicator:Listen("Cutscene", function(sender:Player, cutsceneName:string)
if sender ~= Host then
return
		end		

		if cutsceneName == "Scene49" then
			if isAlive() then
				for _, plrs in game.Players:GetPlayers() do 
				HideShow(plrs.Character, "hide")
				end
				HideShow(game.Players.LocalPlayer.Character, "show")
CutsceneMaker.PlayAnimation(game.Players.LocalPlayer.Character, "ANIMATION-ID")
				CutsceneMaker.CamLock(true)
CutsceneMaker.LockOn(game.Players.LocalPlayer.Character:WaitForChild("Head"))
			else
for _, plrs in game.Players:GetPlayers() do 
				HideShow(plrs.Character, "hide")
				end
					HideShow(Host.Character, "show")

CutsceneMaker.PlayAnimation(Host.Character, "ANIMATION-ID")
				CutsceneMaker.CamLock(true)
				CutsceneMaker.LockOn(Host.Character:WaitForChild("Head"))
				
			end
		end
		
	end)

		
--\\ Main //--

--==Crossover Seek==--

game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
	wait(3.5)
	if not workspace:FindFirstChild("SeekMoving") then
		return 
	end
	local RealSeek = workspace:FindFirstChild("SeekMoving")
	local RealSeekRig = RealSeek:FindFirstChild("SeekRig")
	local seekNew = game:GetObjects("rbxassetid://11664451634")[1] 
	seekNew.Name = "seek2"

	

	seekNew.Parent = workspace
	local SeekRig = seekNew
	SeekRig.PrimaryPart.Anchored = true
	spawn(function()
		while game["Run Service"].Heartbeat:Wait() and RealSeek do
			if RealSeekRig:FindFirstChild("Root") then
				SeekRig:PivotTo(RealSeekRig:FindFirstChild("Root").CFrame)
			end
			
			for i,v in pairs(RealSeekRig:GetChildren()) do
				if v:IsA("BasePart") then
					v.Transparency = 1
							if SeekRig:FindFirstChild(v.Name) then
SeekRig[v.Name].CFrame = v.CFrame
							end	
						end
			end
		end
	end)

		--==Crossover Seek Eye==--
		
task.spawn(function()

		while task.wait() do 
for i,v in pairs(game.ReplicatedStorage.Misc.Eyes:GetDescendants()) do
	if v.Name == "Eye" then
		local newEye= game:GetObjects("rbxassetid://101739887940358")[1]
					newEye.Parent = v.Parent
					newEye.Name = v.Name.."New"
					v:Destroy()
				end
			end
			for i,v in pairs(game.ReplicatedStorage.Misc.Eyes:GetDescendants()) do
	if v.Name == "EyeNew" then
		
					newEye.Name = "Eye"
					
				end
			end
					break
		end		
	end)
		
--==Door 49 Scene==--
		
		game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
if game.ReplicatedStorage.GameData.LatestRoom.Value == 49 then
if LocalPlayer == Host then
        -- Initiate Cutscene for all clients.
        Communicator:Send("Cutscene", "Scene49")
					end
				end
				end)	

		--==Spawner==--
while task.wait( math.random(10, 30) ) do
    if LocalPlayer == Host then
        -- Request to summon random entity as Host
        local randomId = math.random(1, #listOfEntities)
        Communicator:Send("SpawnEntity", randomId)
    end
end
