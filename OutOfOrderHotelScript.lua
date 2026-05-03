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
	[1] = "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Stomper.lua",
	[2] = "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Dasher.lua"
}

local TypeCaption = function(text, typewait) 
	for i = 1, #text, 1 do
		require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(string.sub(text,1,i), true)
		if typewait ~= nil then
			task.wait(typewait)
		else
			task.wait(0.2)
		end
	end
end


local CamLock = function(lock_unlock:boolean)
	local maingame = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
	if maingame then
		maingame.stopcam = lock_unlock
	end
end

local HideShow = function(char, show_hide)
	if string.lower(show_hide) == "hide" then
		for _, parts in char:GetDescendants() do
			if parts:IsA("BasePart") then

				parts:SetAttribute("OgTransparency", parts.LocalTransparencyModifier)
				parts.LocalTransparencyModifier = 1
			end
		end
	else
		for _, parts in char:GetDescendants() do
			if parts:IsA("BasePart") then

				local ogtrans= parts:GetAttribute("OgTransparency") or 0
				parts.LocalTransparencyModifier = ogtrans
			end
		end
	end
end


local isAlive = function(char)
	if (char == nil and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0) or (char:WaitForChild("Humanoid").Health > 0  and char) then

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
		if host ~= Host and isAlive(host.Character) then
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
		TypeCaption("Entity Spawned.")
	loadstring(game:HttpGet(listOfEntities[id]))()
end)

Communicator:Listen("Cutscene", function(sender:Player, cutsceneName:string)
	if sender ~= Host then
		return
	end		
	local scenedur=0
	if cutsceneName == "Scene49" then
			local IL = game:GetObjects("rbxassetid://105185680624158")[1]
			IL.Parent = workspace
		scenedur = 530/60
		if isAlive() then
			for _, plrs in game.Players:GetPlayers() do 
				HideShow(plrs.Character, "hide")
			end
			game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Anchored = true
				game.Players.LocalPlayer.Character:PivotTo(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].RoomEntrance.CFrame - Vector3.new(0,4,0))
			HideShow(game.Players.LocalPlayer.Character, "show")
			CutsceneMaker.PlayAnimation(game.Players.LocalPlayer.Character, "87169059953452")
			CamLock(true)
					IL:PivotTo(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame)
			CutsceneMaker.PlayAnimation(game.Players.LocalPlayer.Character, "124745906464200")	
			CutsceneMaker.LockOn(game.Players.LocalPlayer.Character:WaitForChild("Head"))
			
		else
			for _, plrs in game.Players:GetPlayers() do 
				HideShow(plrs.Character, "hide")
			end
			HideShow(Host.Character, "show")
			Host.Character:WaitForChild("HumanoidRootPart").Anchored = true
	Host.Character:PivotTo(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].RoomEntrance.CFrame)
			CutsceneMaker.PlayAnimation(Host.Character, "87169059953452")
				CutsceneMaker.PlayAnimation(IL, "124745906464200")	
		    CamLock(true)
					IL:PivotTo(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame)
			CutsceneMaker.LockOn(Host.Character:WaitForChild("Head"))
				

		end
		task.wait(scenedur)
		for _, plrs in game.Players:GetPlayers() do 
			HideShow(plrs.Character, "show")
		end
		if LocalPlayer == Host then
			Host.Character:WaitForChild("HumanoidRootPart").Anchored = false
				Host.Character:PivotTo(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].RoomEntrance.CFrame)
		else
			if isAlive() then 
				game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Anchored = false
						game.Players.LocalPlayer.Character:PivotTo(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].RoomEntrance.CFrame)
			end
		end
				
			CamLock(false)
			IL:Destroy()
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
	local seekNew = game:GetObjects("rbxassetid://124308549143932")[1] 
	seekNew.Name = "seek2"



	seekNew.Parent = workspace
	local SeekRig = seekNew
	SeekRig.PrimaryPart.Anchored = true
		if RealSeekRig:FindFirstChild("Root") then
				SeekRig:PivotTo(RealSeekRig:FindFirstChild("Root").CFrame)
			end

	
		
			for i,v in pairs(RealSeekRig:GetChildren()) do
				if v:IsA("BasePart") then
					local w = Instance.new("WeldConstraint")
				w.Parent = RealSeekRig
				w.Part0 = v
					if SeekRig:FindFirstChild(v.Name) then
						w.Part1 = SeekRig[v.Name]
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

					v.Name = "Eye"

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
	
