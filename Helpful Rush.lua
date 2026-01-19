--[[Entity Names
	["FigureRig"] = "Figure",
	["SallyMoving"] = "Window",
	["RushMoving"] = "Rush",
	["Eyes"] = "Eyes",
	["Groundskeeper"] = "Skeeper",
	["BackdoorLookman"] = "Lookman",
	["BackdoorRush"] = "Blitz",
	["MandrakeLive"] = "Mandrake",
	["GloomPile"] = "Egg",
	["Snare"] = "Snare",
	["GrumbleRig"] = "Grumble",
	["GiggleCeiling"] = "Giggle",
	["AmbushMoving"] = "Ambush"
]] 

	
	local char = workspace:WaitForChild(game.Players.LocalPlayer.Name)
local oxygen = char:GetAttribute("Oxygen")


Caption = function(text)
	require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(text, true)
end


TypeCaption = function(text, typewait) 
	if not captionholder then return end
	for i = 1, #text, 1 do
		require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(string.sub(text,1,i), true)
		if typewait ~= nil then
			task.wait(typewait)
		else
			task.wait(0.2)
		end
	end
end

SpeakerIconShow = function(IconId)
	local newui = Instance.new("ScreenGui")
	newui.Parent = game.Players.LocalPlayer.PlayerGui
	newui.Name = "SpeakerIcon"


	local icon = "rbxassetid://"..IconId
	local captiontext = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Caption
	local iconholder = Instance.new("ImageLabel")
	iconholder.Name = "Icon"
	iconholder.Image = icon
	iconholder.Parent = newui
	local aspect = Instance.new("UIAspectRatioConstraint")
	aspect.Parent = iconholder
	local pos =  captiontext.Position + UDim2.new(-.05,-0.031,0,-118)
	iconholder.Size = UDim2.new(0.1, 0,0.18, 0)
	iconholder.BackgroundTransparency = 1

	iconholder.Position = pos




end
SpeakerIconHide = function()
	local newui = game.Players.LocalPlayer.PlayerGui.SpeakerIcon
	newui.Name = "BeingRemoved"

	local iconholder = newui.Icon

	local ts = game:GetService("TweenService")
	
	
					--coroutine.resume(coci)
	ts:Create(iconholder, TweenInfo.new(7), {ImageTransparency = 1}):Play()

	game.Debris:AddItem(newui, 8)
end


SolveAnchor = function(item, fully)

            if mainUi.MainFrame:FindFirstChild("AnchorHintFrame") then
                local prompts = {}
		for _, prompt in game.Workspace:GetDescendants() do

		
			if prompt.Name == "ActivateEventPrompt" and prompt.Parent:IsA("Model") and prompt.Parent.Name == "MinesAnchor" and not prompt.Parent:GetAttribute("Activated") then
               
		table.insert(prompts, prompt)
end

                local CurrentGameState = {
                    DesignatedAnchor = mainUi.MainFrame.AnchorHintFrame.AnchorCode.Text,
                    AnchorCode = mainUi.MainFrame.AnchorHintFrame.Code.Text
                }

                for _, prompt in pairs(prompts) do
                    task.spawn(function()
                        local Anchor = prompt.Parent
                        local CurrentAnchor = Anchor.Sign.TextLabel.Text
  if CurrentAnchor ~= CurrentGameState.DesignatedAnchor then return end

                        local result = Anchor:FindFirstChildOfClass("RemoteFunction"):InvokeServer(CurrentGameState.AnchorCode)
                        if result then
							SpeakerIconShow("99087926706059")
                              TypeCaption("Alright! An anchor down.")
                        SpeakerIconHide()
						end
                    end)
                end
	end
end


FireProxy = function(proxy)
	local holdtime = proxy.HoldDuration
	local timeheld = 0
	if fireproximityprompt then
		fireproximityprompt(proxy)
		return
	end

	proxy:InputHoldBegin()
	holdtime = 0.1 --Testing + I know what im doing.
	wait(0.05)
	if timeheld == 0 then
		wait(0.05)
		proxy:InputHoldEnd()
		print("PromptInitiated")
	else
		repeat wait(0.1) timeheld = timeheld+0.1 until timeheld >= holdtime
		wait(0.1)
		proxy:InputHoldEnd()
		print("PromptFinished")
	end
end

CheckIf = function(what, where)
    if not where or not where:IsA then return false end
    if typeof(what) == "Instance" then
        return where:IsAncestorOf(what)
    elseif typeof(what) == "string" then
        return where:FindFirstChild(what, true) ~= nil
    else
        return false
    end
	end

LerpTo = function(model, target, path)
	local alpha = 0
	local speed = 45
	local dist = (model.PrimaryPart.Position - target.Position).Magnitude
	local relativeSpeed = dist / speed
	local startCFrame = model.PrimaryPart.CFrame
	local loop = nil
	local reachedTarget = Instance.new("BindableEvent")

	loop = game:GetService("RunService").Heartbeat:Connect(function(delta)


		local goalCFrame = startCFrame:Lerp(target.CFrame, alpha)
		model:PivotTo(goalCFrame)
		alpha += delta / relativeSpeed
		if alpha >= 1 then
			loop:Disconnect()
			reachedTarget:Fire()
		end
	end)

	reachedTarget.Event:Wait()

end

print("got past func")

local coci = coroutine.create(function()
				while wait() do
						
					while task.wait() do
							wait()
							
								char = workspace:WaitForChild(game.Players.LocalPlayer.Name)
oxygen = char:GetAttribute("Oxygen")
				end
		end

			end)
	
					coroutine.resume(coci)
print("running ci")
--ProxyDoor : CurrentDoor.Lock.UnlockPrompt
--Event : CurrentDoor.ClientOpen:FireServer()
--KeyPrompt : HasKey.ModulePrompt
--ValvePrompt : ValvePrompt

local roomnumdupe = 0
local rushhelper = game:GetObjects("rbxassetid://94481096227907")[1]
	rushhelper.Parent = workspace
	local pitch = Instance.new("PitchShiftSoundEffect")
	pitch.Octave = 0.5
	local talk = Instance.new("Sound")
	talk.SoundId = "rbxassetid://18637567424"
	talk.RollOffMaxDistance = 100
	talk.Parent = rushhelper.Main
	talk.Name = "Talk"
	pitch.Parent = talk
	talk.PlaybackSpeed = 0.75
	talk.Volume = 0.2
local parttofix = Instance.new("Part")
parttofix.Anchored = true
parttofix.Parent = workspace
parttofix.Name = "RotPart"
parttofix.Position = char:WaitForChild("HumanoidRootPart").Position
local ogar = char:WaitForChild("Humanoid").AutoRotate
char:WaitForChild("Humanoid").AutoRotate = false
parttofix.Rotation = Vector3.new(0, 0, -0)
parttofix.CanCollide = false
parttofix.Transparency = 1
wait()
char:PivotTo(parttofix.CFrame)
wait()
if ogar ~= nil then
char:WaitForChild("Humanoid").AutoRotate = ogar
else
	char:WaitForChild("Humanoid").AutoRotate = true
end
parttofix:Destroy()
	local newatt = Instance.new("Attachment")
	newatt.Parent = char:WaitForChild("UpperTorso")
	newatt.WorldCFrame = char:WaitForChild("Head").CFrame
	newatt.WorldPosition = char:WaitForChild("Head").Position + Vector3.new(1.705, -0.5, -0.558)
	newatt.Name = "RushAtt"
	rushhelper.Root.AlignPosition.Attachment1 = newatt
	print("loaded rush and positioned it")

	local entitytablelines = {{ "Something is here...","It seems like I'm... aproaching.?","Hide!", "Something's on its way!"-- Rush
	},{"Something is here... be ready.","Seems like an annoying entity is coming.","Hide!", "It will come back."-- Ambush
		},{"GO GO GO!","RUN FOR YOUR LIFE!","Run." -- Seek
		},{"Follow its rules. Turn around when it tells you.", "Halt is up ahead." -- Halt
		},{"Stay quiet.", "Crouch!", "Don't be loud."--Figure
		},{"Psst.", "Around you!"--Screech
		},{"Don't look!", "Avoid eye contact."}--Eyes
		,{"Uhm... the door?","Look at the door! Something may be lurking...","Look I'll hand it to you. The number for this room is "..roomnumdupe.."."}--Dupe
		,{"A-120."}, {"A-60."},{"It- Blitz..."},
		{"It isn't funny!","Stop laughing.","Giggle up ahead.", "Watch above you."}--Giggle
, {"That girl's out to play.", "Quick, drop an item!", "Watch it! Sally's here."},
	{"Mandrake soon?","Mandrake expected.","Don't let your guard down, there's a Mandrake lurking..."}

	}

	local deathmsgs = {{"Sorry I failed you..."},{"..."},{"Are you there!?"}, {"Please, respond!"}, {"What... happened?"},{"I'll do better, I promise..."}}

	local Players = game:GetService("Players")
	local SoundService = game:GetService("SoundService")
	local Camera = workspace.CurrentCamera
	local DeathName = "DeathBackgroundBlue"
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local TweenService = game:GetService("TweenService")
	local remotesfolder = ReplicatedStorage:WaitForChild("RemotesFolder")
	local Player = Players.LocalPlayer
	local PlayerGui = Player:WaitForChild("PlayerGui")
	local MainUI = PlayerGui:WaitForChild("MainUI")
	local Death = MainUI:WaitForChild("Death")
	local HelpfulDialogue = Death:WaitForChild("HelpfulDialogue")
	local MainGame = MainUI:WaitForChild("Initiator"):WaitForChild("Main_Game")
	local Health = MainGame:WaitForChild("Health")
	local Music = Health:WaitForChild("Music")
	local UserInputService = game:GetService("UserInputService")



	--Death Handler

	local Skipped = false
	local Ended = false
	remotesfolder.DeathHint.OnClientEvent:Connect(function(DeathHints)
		PlayerGui = Player:WaitForChild("PlayerGui")
		 MainUI = PlayerGui:WaitForChild("MainUI")
		 Death = MainUI:WaitForChild("Death")
	HelpfulDialogue = Death:WaitForChild("HelpfulDialogue")
		Ended = false
	
	--HelpfulDialogue.Visible = false
		--MainGame.fovtarget = 70
	wait(4)
		
		UserInputService.InputBegan:Connect(function(i,proc)
			if proc then return end

			if Ended == false then

				if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.Gamepad1 then
					Skipped = true
				end
			end
		end)
	--	loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CaptionDoorsSource.lua"))()
		--SpeakerIconShow("rbxassetid://83305678419163")
		for i, Hint in ipairs(DeathHints) do
			--	HelpfulDialogue.TextTransparency = 1

			--Caption(Hint)
			if Skipped then
				--Caption("")	
			else
				--Caption("")	
			end
			local Tick = tick() + 5 + utf8.len(HelpfulDialogue.ContentText) / 30
			if i == 1 or not Skipped then
				task.wait(0.5)
			else
				task.wait(0.1)
			end
			Skipped = false
			for i2 = 1, 10000000000000 do
				task.wait()
				if Tick <= tick() then
					break
				end
				if Skipped then
					break
				end
			end
			local Time = 0.4
			if Skipped then
				Time = 0.25
			end
			--	TweenService:Create(HelpfulDialogue, TweenInfo.new(Time, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
			task.wait(Time + 0.01)
		end
		Ended = true
		--SpeakerIconHide()
		--Caption("")
		wait(0.5)
		SpeakerIconShow("82511368550076")
			local text = deathmsgs[math.random(1,6)][1]
	for i = 1, #text do


		wait(0.002)
		rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
		rushhelper.Main.Talk:Play()
		print(string.sub(text, 1, i))

		Caption(string.sub(text, 1, i))
		wait(0.002)
	end
	
		SpeakerIconHide()
	end)
	print("Initiate mechanic")

workspaceDescendantAdded:Connect(function(inst)
if inst.Name == "SallyMoving" then
local text = entitytablelines[13][math.random(1,3)]
		print(text)
		SpeakerIconShow("99087926706059")
		for i = 1, #text do


			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))

			Caption(string.sub(text, 1, i))
			wait(0.002)
		end
		SpeakerIconHide()
		end
			if inst.Name == "MandrakeLive" then
local text = entitytablelines[14][math.random(1,3)]
		print(text)
		SpeakerIconShow("99087926706059")
		for i = 1, #text do


			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))

			Caption(string.sub(text, 1, i))
			wait(0.002)
		end
		SpeakerIconHide()
		end
	end)
game.Workspace.ChildAdded:Connect(function(child)
	if child.Name == "AmbushMoving" then
		local text = entitytablelines[2][math.random(1,4)]
		print(text)
		SpeakerIconShow("99087926706059")
		for i = 1, #text do


			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))

			Caption(string.sub(text, 1, i))
			wait(0.002)
		end
		SpeakerIconHide()
	elseif child.Name == "RushMoving" then
		SpeakerIconShow("99087926706059")
		local text = entitytablelines[1][math.random(1,4)]
		print(text)
		for i = 1, #text do
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
			Caption(string.sub(text, 1, i))
			wait(0.002)
		end 
			SpeakerIconHide()


	elseif child.Name == "A60" then
		SpeakerIconShow("99087926706059")
		local text = entitytablelines[10][1]
		print(text)
		for i = 1, #text do
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
			Caption(string.sub(text, 1, i))
			wait(0.002)
		end
			SpeakerIconHide()
	elseif child.Name == "A120" then
		SpeakerIconShow("99087926706059")
		local text = entitytablelines[9][1]
		print(text)
		for i = 1, #text do
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
			Caption(string.sub(text, 1, i))
			wait(0.002)
		end 
			SpeakerIconHide()
	elseif child.Name == "BackdoorRush" then
		SpeakerIconShow("99087926706059")
		local text = entitytablelines[11][1]
		print(text)
		for i = 1, #text do
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
			Caption(string.sub(text, 1, i))
			wait(0.002)
		end
		SpeakerIconHide()
	elseif child.Name == "Eyes" or child.Name == "BackdoorLookman" then
		SpeakerIconShow("99087926706059")
		local text = entitytablelines[7][math.random(1,2)]
		print(text)
		for i = 1, #text do
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
			Caption(string.sub(text, 1, i))
			wait(0.002)
		end 
			SpeakerIconHide()
	end
	end)


	workspace.CurrentCamera.ChildAdded:Connect(function(child)
		
	for _, guidance in pairs(workspace.CurrentCamera:GetChildren()) do
		if guidance:IsA("BasePart") and guidance.Name == "Guidance" then
			local weld = Instance.new("WeldConstraint")
			rushhelper:PivotTo(guidance.CFrame)
			weld.Parent = guidance
			weld.Part0 = guidance
			weld.Part1 = rushhelper.Root
			rushhelper.Root.AlignPosition.Enabled = false
			rushhelper.Root.Anchored = false
		end
	end
	if child.Name == "Screech" then
				rushhelper.Top.Attachment.RushNormal.Transparency =  NumberSequence.new( 0.99, 1)
		rushhelper.Bottom.Attachment.RushNormal.Transparency =  NumberSequence.new( 0.99, 1)
		rushhelper.Main.BlackTrail.Transparency = NumberSequence.new( 0.99, 1)
	
		SpeakerIconShow("99087926706059")
		local text = entitytablelines[6][math.random(1,2)]
		print(text)
		for i = 1, #text do
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
			Caption(string.sub(text, 1, i))
			wait(0.002)
		end
			SpeakerIconHide()
	end
end)
local cool = coroutine.create(function()
		local oc = false
				while wait() do
						
					while task.wait() do
							wait()
							
								if oxygen < 25 and oc == false then
SpeakerIconShow("99087926706059")
			local text = "Hey, your oxygen levels are getting low! Hang in there!" 
	for i = 1, #text do


		wait(0.002)
		rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
		rushhelper.Main.Talk:Play()
		print(string.sub(text, 1, i))

		Caption(string.sub(text, 1, i))
		wait(0.002)
	end
		SpeakerIconHide()
					oc = true
wait(10)
					oc = false
					
	
end
				end
		end

			end)
	
					coroutine.resume(cool)




workspace.CurrentCamera.ChildRemoved:Connect(function(inst) 
		if inst.Name == "Screech" then
		rushhelper.Top.Attachment.RushNormal.Transparency =  NumberSequence.new( 0)
		rushhelper.Bottom.Attachment.RushNormal.Transparency =  NumberSequence.new( 0)
		rushhelper.Main.BlackTrail.Transparency = NumberSequence.new( 0)
		
	end

		if inst:IsA("BasePart") and inst.Name == "Guidance" then
						inst.WeldConstraint:Destroy()
			rushhelper.Root.AlignPosition.Enabled = true
			rushhelper.Root.Anchored = false
			
		
	end

			
	
end)

game.Workspace.CurrentRooms.DescendantAdded:Connect(function(v)
		wait(0.01)
	if v:IsA("Model") then
		if v.Name == "_NestHandler" then
			
		
			v:WaitForChild("Console", 9e9):WaitForChild("Button", 9e9):WaitForChild("ActivateEventPrompt", 9e9)
			repeat task.wait() until v.Console.Button.ActivateEventPrompt:GetAttribute("Interactions")

				
				
		 
		
		
		
			local cona = coroutine.create(function()
				while wait(math.random(15,30)) do
						
					while task.wait(math.random(15,30)) do
							wait()
							local anchor = SolveAnchor(v, false)
							if anchor ~= nil then


								local pfs = game:GetService("PathfindingService")
								local path = pfs:CreatePath()

								path:ComputeAsync(rushhelper.Root.Position, anchor.PrimaryPart.Position)
								for _, wpts in pairs(path:GetWaypoints()) do
									local part = Instance.new("Part")
									part.Anchored = true
									part.Size = Vector3.new(1,1,1)
									part.Position = wpts.Position + Vector3.new(0,4.456,0)
									part.Parent = workspace
									--part.Shape = Enum.PartType.Ball
									part.Name = "Node"
									part.Transparency = 1
									rushhelper.Root.AlignPosition.Enabled = false
									rushhelper.Root.Anchored = true
									part.Massless = true
									part.CanCollide = false
									part.CanTouch = false
									part.CanQuery = false
									LerpTo(rushhelper, part)
								end
								SolveAnchor(v, true)
								while true do 
									wait()
									if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
										LerpTo(rushhelper, char:WaitForChild("Head"))
									else
										break
									end
								end
								rushhelper:PivotTo(newatt.WorldCFrame)
								rushhelper.Root.Anchored = false
								rushhelper.Root.AlignPosition.Enabled = true
							end
						end			

				end


			end)
	
					coroutine.resume(cona)
	

		end 
		end
end)


game.ReplicatedStorage.GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
		wait(0.01)
roomnumdupe = game.ReplicatedStorage.GameData.LatestRoom.Value
		
	local croom = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
	local foundfuses = CheckIf("FuseHolder",croom)
	if foundfuses then
		for _, fuses in croom:GetDescendants() do
			if fuses:IsA("Model") and fuses.Name =="FuseHolder" then
				local pfs = game:GetService("PathfindingService")
				local path = pfs:CreatePath()

				path:ComputeAsync(rushhelper.Root.Position, fuses.PrimaryPart.Position)
				for _, wpts in pairs(path:GetWaypoints()) do
					local part = Instance.new("Part")
					part.Anchored = true
					part.Size = Vector3.new(1,1,1)
					part.Position = wpts.Position + Vector3.new(0,4.456,0)
					part.Parent = workspace
					--part.Shape = Enum.PartType.Ball
					part.Name = "Node"
					part.Transparency = 1
					rushhelper.Root.AlignPosition.Enabled = false
					rushhelper.Root.Anchored = true
					part.Massless = true
					part.CanCollide = false
					part.CanTouch = false
					part.CanQuery = false
					LerpTo(rushhelper, part)

					part:Destroy()


				end
				--LerpTo(rushhelper, WaterPump.PrimaryPart)

				local pathgen = pfs:CreatePath()
				local gen

				local hasgen = CheckIf("MinesGenerator", croom)	
				if hasgen then
					for _, models in croom:GetDescendants() do
						if models:IsA("Model") and models.Name == "MinesGenerator" then
							gen = models
						end
					end
				end
				pathgen:ComputeAsync(rushhelper.Root.Position, gen.PrimaryPart.Position)
				for _, wpts in pairs(pathgen:GetWaypoints()) do
					local part = Instance.new("Part")
					part.Anchored = true
					part.Size = Vector3.new(1,1,1)
					part.Position = wpts.Position + Vector3.new(0,4.456,0)
					part.Parent = workspace
					--part.Shape = Enum.PartType.Ball
					part.Name = "Node"
					part.Transparency = 1
					rushhelper.Root.AlignPosition.Enabled = false
					rushhelper.Root.Anchored = true
					part.Massless = true
					part.CanCollide = false
					part.CanTouch = false
					part.CanQuery = false
					LerpTo(rushhelper, part)

					part:Destroy()
				end
				fuses.FuseObtain.ModulePrompt.MaxActivationDistance = 100000
				fuses.FuseObtain.ModulePrompt.RequiresLineOfSight = false
				wait(0.01)
					FireProxy(fuses.FuseObtain.ModulePrompt)
					wait(0.01)
					if hasgen then
						for _, FuseInput in gen.Fuses:GetChildren() do
							if FuseInput:FindFirstChild("FusesPrompt") then
								FuseInput.FusePrompt.MaxActivationDistance = 100000
								FuseInput.FusesPrompt.RequiresLineOfSight = false
								wait(0.01)
								FireProxy(FuseInput.FusesPrompt)
							end
						end
					end


			end
			for _, models in croom:GetDescendants() do
				if models:IsA("Model") and models.Name == "MinesGenerator" and models.Lever.LeverPrompt.Enabled == true then
					FireProxy(models.Lever.LeverPrompt)
				end
			end


			while true do 
				wait()

				if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
					LerpTo(rushhelper, char:WaitForChild("Head"))
				else
					break
				end
			end
			rushhelper:PivotTo(newatt.WorldCFrame)
			rushhelper.Root.Anchored = false
			rushhelper.Root.AlignPosition.Enabled = true
		end end			




	if croom:FindFirstChild("_DamHandler") then
		local cod = coroutine.create(function()
			while wait(math.random(15,30)) do
				for _, Flood in croom._DamHandler:GetChildren() do
					if Flood.Name:sub(1, 5) == "Flood" then
						for _, WaterPump in Flood.Pumps:GetChildren() do
							if WaterPump.Wheel.ValvePrompt.Enabled then
								local pfs = game:GetService("PathfindingService")
								local path = pfs:CreatePath()

								path:ComputeAsync(rushhelper.Root.Position, WaterPump.PrimaryPart.Position)
								for _, wpts in pairs(path:GetWaypoints()) do
									local part = Instance.new("Part")
									part.Anchored = true
									part.Size = Vector3.new(1,1,1)
									part.Position = wpts.Position + Vector3.new(0,4.456,0)
									part.Parent = workspace
									--part.Shape = Enum.PartType.Ball
									part.Name = "Node"
									part.Transparency = 1
									rushhelper.Root.AlignPosition.Enabled = false
									rushhelper.Root.Anchored = true
									part.Massless = true
									part.CanCollide = false
									part.CanTouch = false
									part.CanQuery = false
									LerpTo(rushhelper, part)
									if WaterPump.Wheel.ValvePrompt.Enabled == false or not WaterPump.Wheel.ValvePrompt then
										break
									end
									part:Destroy()


								end
								--LerpTo(rushhelper, WaterPump.PrimaryPart)

								if WaterPump.Wheel.ValvePrompt.Enabled and WaterPump.Wheel.ValvePrompt then
									WaterPump.Wheel.ValvePrompt.MaxActivationDistance = 100000
									WaterPump.Wheel.ValvePrompt.RequiresLineOfSight = false
									wait(0.01)
									FireProxy(WaterPump.Wheel.ValvePrompt)
								end


								while true do 
									wait()

									if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
										LerpTo(rushhelper, char:WaitForChild("Head"))
									else
										break
									end
								end
								rushhelper:PivotTo(newatt.WorldCFrame)
								rushhelper.Root.Anchored = false
								rushhelper.Root.AlignPosition.Enabled = true
							end
						end

					end
				end

			end


		end)
		coroutine.resume(cod)	
	end
		

	if croom:FindFirstChild("LiveBreakerPolePickup") then
		local cobp = coroutine.create(function()
			while wait(math.random(15,30)) do
				for _, bpzlp in croom:GetDescendants() do
					if bpzlp.Name == "LiveBreakerPolePickup" then


						local pfs = game:GetService("PathfindingService")
						local path = pfs:CreatePath()

						path:ComputeAsync(rushhelper.Root.Position, bpzlp.PrimaryPart.Position)
						for _, wpts in pairs(path:GetWaypoints()) do
							local part = Instance.new("Part")
							part.Anchored = true
							part.Size = Vector3.new(1,1,1)
							part.Position = wpts.Position + Vector3.new(0,4.456,0)
							part.Parent = workspace
							--part.Shape = Enum.PartType.Ball
							part.Name = "Node"
							part.Transparency = 1
							rushhelper.Root.AlignPosition.Enabled = false
							rushhelper.Root.Anchored = true
							part.Massless = true
							part.CanCollide = false
							part.CanTouch = false
							part.CanQuery = false
							LerpTo(rushhelper, part)
							part:Destroy()


						end
						--	LerpTo(rushhelper, WaterPump.PrimaryPart)
						local Prompt
						for _, ActivateEventPrompt in bpzlp:GetChildren() do

							if ActivateEventPrompt:IsA("ProximityPrompt") and ActivateEventPrompt.RequiresLineOfSight then
								Prompt = ActivateEventPrompt
							end

						end

						if Prompt  then
							Prompt.MaxActivationDistance = 100000
							Prompt.RequiresLineOfSight = false		
							wait(0.01)
							FireProxy(Prompt)
						end


						while true do 
							wait()

							if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
								LerpTo(rushhelper, char:WaitForChild("Head"))
							else
								break
							end
						end
						rushhelper:PivotTo(newatt.WorldCFrame)
						rushhelper.Root.Anchored = false
						rushhelper.Root.AlignPosition.Enabled = true


					end

				end

			end
		end)
		coroutine.resume(cobp)
	end
	


	if croom:FindFirstChild("Modular_Bookshelf") then
		local cob = coroutine.create(function()
			while wait(math.random(30,45)) do
						for _, shelfs in croom:GetDescendants() do
				if shelfs.Name == "Modular_Bookshelf" and shelfs:FindFirstChild("LiveHintBook") then


					local pfs = game:GetService("PathfindingService")
					local path = pfs:CreatePath()

					path:ComputeAsync(rushhelper.Root.Position, shelfs.LiveHintBook.PrimaryPart.Position)
					for _, wpts in pairs(path:GetWaypoints()) do
						local part = Instance.new("Part")
						part.Anchored = true
						part.Size = Vector3.new(1,1,1)
						part.Position = wpts.Position + Vector3.new(0,4.456,0)
						part.Parent = workspace
						--part.Shape = Enum.PartType.Ball
						part.Name = "Node"
						part.Transparency = 1
						rushhelper.Root.AlignPosition.Enabled = false
						rushhelper.Root.Anchored = true
						part.Massless = true
						part.CanCollide = false
						part.CanTouch = false
						part.CanQuery = false
						LerpTo(rushhelper, part)

						part:Destroy()


					end
					--LerpTo(rushhelper, WaterPump.PrimaryPart)


					shelfs.LiveHintBook.ActivateEventPrompt.MaxActivationDistance = 100000
					shelfs.LiveHintBook.ActivateEventPrompt.RequiresLineOfSight = false
					wait(0.01)
					FireProxy(shelfs.LiveHintBook.ActivateEventPrompt)



					while true do 
						wait()

						if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
							LerpTo(rushhelper, char:WaitForChild("Head"))
						else
							break
						end
					end
					rushhelper:PivotTo(newatt.WorldCFrame)
					rushhelper.Root.Anchored = false
					rushhelper.Root.AlignPosition.Enabled = true

				end

			end
					end 


		end)
		coroutine.resume(cob)	
	end
	




	if game.ReplicatedStorage.GameData.ChaseInSession.Value == true then
		SpeakerIconShow("99087926706059")
		local text = entitytablelines[3][math.random(1,3)]
		print(text)
		for i = 1, #text do 
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
			Caption(string.sub(text, 1, i))
			wait(0.002)
		end 
			SpeakerIconHide()
	end
	if game.ReplicatedStorage.GameData.LatestRoom.Value  == 50 then
		SpeakerIconShow("99087926706059")
		local text = entitytablelines[5][math.random(1,3)]
		print(text)
		for i = 1, #text do 
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
			Caption(string.sub(text, 1, i))
			wait(0.002)
		end 
			SpeakerIconHide()
	end
	for _, dupeRoom in pairs(croom:GetChildren()) do
		if dupeRoom.Name == "DoorFake"   then
			SpeakerIconShow("99087926706059")
			local text = entitytablelines[8][math.random(1,3)]
			print(text)
			for i = 1, #text do
				wait(0.002)
				rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
				rushhelper.Main.Talk:Play()
				print(string.sub(text, 1, i))
				Caption(string.sub(text, 1, i))
				wait(0.002)
			end
				SpeakerIconHide()
			break

		end
	end
	if croom:GetAttribute("RawName") == "HaltHallway" or croom:GetAttribute("RawName") == "JKKKKKKKKSWU" then --
		SpeakerIconShow("99087926706059")
		local text = entitytablelines[4][1]
		print(text)
		for i = 1, #text do


			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))

			Caption(string.sub(text, 1, i))
			wait(0.002)
		end 
			SpeakerIconHide()
	end
	if workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value + 1]:GetAttribute("RawName") == "HaltHallway" or workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value + 1]:GetAttribute("RawName") == "JKKKKKKKKSWU" then
		SpeakerIconShow("99087926706059")
		local text = entitytablelines[4][2]
		print(text)
		for i = 1, #text do


			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))

			Caption(string.sub(text, 1, i))
			wait(0.002)
		end 
			SpeakerIconHide()
	end
	local cokg = coroutine.create(function()
		while true do
			wait()
			local HasKey = false
			local CurrentDoor = croom:WaitForChild("Door")
			for _,v in pairs(croom:GetDescendants()) do
				if v.Name == "KeyObtain" then
					HasKey = v
							print("I've got a key to fetch!")
					wait(0.1)

					--Get key;
					local KeyClone = HasKey:Clone()
					KeyClone.Parent = rushhelper
					local pfs = game:GetService("PathfindingService")
					local path = pfs:CreatePath()

					path:ComputeAsync(rushhelper.Root.Position, HasKey.PrimaryPart.Position)
					local clone = HasKey:Clone()
					for _, wpts in pairs(path:GetWaypoints()) do
						local part = Instance.new("Part")
						part.Anchored = true
						part.Size = Vector3.new(1,1,1)
						part.Position = wpts.Position + Vector3.new(0,4.456,0)
						part.Parent = workspace
						--part.Shape = Enum.PartType.Ball
						part.Name = "Node"
						rushhelper.Root.AlignPosition.Enabled = false
						rushhelper.Root.Anchored = true
						part.Massless = true
						part.CanCollide = false
						part.CanTouch = false
						part.CanQuery = false
						LerpTo(rushhelper, part)
						part:Destroy()


					end
					--LerpTo(rushhelper, HasKey.PrimaryPart)
					clone.Parent = rushhelper
					clone:PivotTo(rushhelper.Root.CFrame)
					for _, parts in pairs(clone:GetDescendants()) do
						if parts:IsA("Part") or parts:IsA("MeshPart") or parts:IsA("BasePart") then
							parts.Anchored = false
							local weld = Instance.new("WeldConstraint")
							weld.Parent = rushhelper
							weld.Part0 = rushhelper.Root
							weld.Part1 = parts
							parts.Massless = true
							parts.CanCollide = false
							parts.CanTouch = false
							parts.CanQuery = false
							for _, proxiesfound in pairs(parts:GetDescendants()) do
								if proxiesfound:IsA("ProximityPrompt") then
									proxiesfound:Destroy()
								end
							end
						end

					end


					local ogmad = HasKey.ModulePrompt.MaxActivationDistance
					local ogrlos = HasKey.ModulePrompt.RequiresLineOfSight
					local ogmad2 = CurrentDoor.Lock.MaxActivationDistance
					local ogrlos2 = CurrentDoor.Lock.RequiresLineOfSight
					--Go to door
					local path2 = pfs:CreatePath()

					path2:ComputeAsync(rushhelper.Root.Position, CurrentDoor.PrimaryPart.Position)

					for _, wpts in pairs(path2:GetWaypoints()) do
						local part = Instance.new("Part")
						part.Anchored = true
						part.Size = Vector3.new(1,1,1)
						part.Position = wpts.Position + Vector3.new(0,4.456,0)
						part.Parent = workspace
						part.Massless = true
						part.CanCollide = false
						part.CanTouch = false
						part.CanQuery = false
						--part.Shape = Enum.PartType.Ball
						part.Name = "Node"
						rushhelper.Root.AlignPosition.Enabled = false
						rushhelper.Root.Anchored = true
						LerpTo(rushhelper, part)
						part:Destroy()


					end
					clone:Destroy()
					--LerpTo(rushhelper, CurrentDoor.PrimaryPart)

					HasKey.ModulePrompt.MaxActivationDistance = 100000
					HasKey.ModulePrompt.RequiresLineOfSight = false
					wait(0.03)

					FireProxy(HasKey.ModulePrompt)
							HasKey.ModulePrompt.MaxActivationDistance = ogmad
			  HasKey.ModulePrompt.RequiresLineOfSight = ogrlos
							
					local Anims = char:WaitForChild("Humanoid").Animator:GetPlayingAnimationTracks()
					for _,animation in Anims do 
						animation:Stop() -- stops pickup
					end
					CurrentDoor.Lock.UnlockPrompt.MaxActivationDistance = 100000
					CurrentDoor.Lock.UnlockPrompt.RequiresLineOfSight = false


					wait(0.03)
					FireProxy(CurrentDoor.Lock.UnlockPrompt)
					local Anims = char:WaitForChild("Humanoid").Animator:GetPlayingAnimationTracks()
					for _,animation in Anims do 
						animation:Stop() -- stops unlock
					end
					wait(0.03)
					CurrentDoor.ClientOpen:FireServer()
					local Anims = char:WaitForChild("Humanoid").Animator:GetPlayingAnimationTracks()
					for _,animation in Anims do 
						animation:Stop() -- extra safe
					end

					wait(0.1)

					while true do 
						wait()

						if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
							LerpTo(rushhelper, char:WaitForChild("Head"))
						else
							break
						end
					end
					rushhelper:PivotTo(newatt.WorldCFrame)
					rushhelper.Root.Anchored = false
					rushhelper.Root.AlignPosition.Enabled = true



					for _,v in pairs(croom:GetDescendants()) do
						if v.Name == "LeverForGate" then
									print("I've got a lever to activate!") 
							local pfs = game:GetService("PathfindingService")
							local path = pfs:CreatePath()

							path:ComputeAsync(rushhelper.Root.Position, v.PrimaryPart.Position)
							local clone = HasKey:Clone()
							for _, wpts in pairs(path:GetWaypoints()) do
								local part = Instance.new("Part")
								part.Anchored = true
								part.Size = Vector3.new(1,1,1)
								part.Position = wpts.Position + Vector3.new(0,4.456,0)
								part.Parent = workspace
								--part.Shape = Enum.PartType.Ball
								part.Name = "Node"
								rushhelper.Root.AlignPosition.Enabled = false
								rushhelper.Root.Anchored = true
								part.Massless = true
								part.CanCollide = false
								part.CanTouch = false
								part.CanQuery = false
								LerpTo(rushhelper, part)
								part:Destroy()


							end
							if not v.ActivateEventPrompt:GetAttribute("Interactions") then
local ogmadg = v.ActivateEventPrompt.MaxActivationDistance
					local ogrlosg = v.ActivateEventPrompt.RequiresLineOfSight
									v.ActivateEventPrompt.MaxActivationDistance = 100000
					v.ActivateEventPrompt.RequiresLineOfSight = false
								FireProxy(v.ActivateEventPrompt)
										wait(0.1)
										v.ActivateEventPrompt.MaxActivationDistance = ogmadg
					v.ActivateEventPrompt.RequiresLineOfSight = ogrlosg

							end
										while true do 
						wait()

						if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
							LerpTo(rushhelper, char:WaitForChild("Head"))
						else
							break
						end
					end
					rushhelper:PivotTo(newatt.WorldCFrame)
					rushhelper.Root.Anchored = false
					rushhelper.Root.AlignPosition.Enabled = true

						end
					end
				end
				end
		end
		end)

		
end)

print("s_msg")
local text = "Hi."
SpeakerIconShow("99087926706059")
print(text)
for i = 1, #text do


	wait(0.002)
	rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
	rushhelper.Main.Talk:Play()
	print(string.sub(text, 1, i))

	Caption(string.sub(text, 1, i))
	wait(0.002)
end
SpeakerIconHide()
print("Up and at it.")
char = workspace:FindFirstChild(game.Players.LocalPlayer.Name)
