loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CaptionDoorsSource.lua"))()

local char = game.Players.LocalPlayer.CharacterAdded:Wait()

SolveAnchor = function(item, fully)

if item:IsA("Model") then
if item.Name == "_NestHandler" then
local AnchorIdentify = {
    ["A"] = 1,
    ["B"] = 2,
    ["C"] = 3,
    ["D"] = 4,
    ["E"] = 5,
    ["F"] = 6
			}
local Anchors = {}

                while not next(Anchors) and task.wait() do
                    for _, Anchor in item:GetChildren() do
                        if Anchor.Name == "MinesAnchor" and not Anchor:GetAttribute("Activated") then
                            table.insert(Anchors, AnchorIdentify[Anchor.Sign.TextLabel.Text], Anchor)
                        end
                    end

                    local AnchorsIndex = {}
                    for Index in Anchors do
                        table.insert(AnchorsIndex, Index)
                    end

                    local NumberIndex = math.min( unpack(AnchorsIndex) )
                    local NextAnchor = Anchors[NumberIndex]

                    if NumberIndex > 1 then
                        local Code = LocalPlayer.PlayerGui.MainUI.MainFrame.AnchorHintFrame.Code.Text
                        

--                        local Solved = SolveAnchor(Code, Offset)

                        
                            if  not NextAnchor:GetAttribute("Activated") and fully then
                          
                                    NextAnchor.AnchorRemote:InvokeServer( tostring(Code) )
				else
return NextAnchor
                               
                            end
                        
					end
	end


			end
	end
end


FireProxy = function(proxy)
local holdtime = proxy.HoldDuration
local timeheld = 0
proxy:InputHoldBegin()
holdtime = 0.1 --Testing + I know what im doing.
	wait(0.05)
if holdtime == 0 then
wait(0.05)
proxy:InputHoldEnd()
print("PromptInitiated")
else
repeat wait(0.1) timeheld = timeheld+0.1 until timeheld == holdtime
wait(0.1)
proxy:InputHoldEnd()
print("PromptFinished")
end
end

CheckIf = function(what, where)
if where:IsAncestorOf(what) then
return true
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



--ProxyDoor : CurrentDoor.Lock.UnlockPrompt
--Event : CurrentDoor.ClientOpen:FireServer()
--KeyPrompt : HasKey.ModulePrompt
--ValvePrompt : ValvePrompt


local rushhelper = game:GetObjects("rbxassetid://94481096227907)[1]
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
local entitytablelines = {{ "Something is here...","It seems like I'm... aproaching.?","Hide!", "Something's on its way!"-- Rush
	},{"Something is here... be ready.","Seems like an annoying entity is coming.","Hide!", "It will come back."-- Ambush
	},{"GO GO GO!","RUN FOR YOUR LIFE!","Run." -- Seek
	},{"Follow its rules. Turn around when it tells you.", "Halt is up ahead." -- Halt
	},{"Stay quiet.", "Crouch!", "Don't be loud."--Figure
	},{"Psst.", "Around you!"--Screech
	},{"Don't look!", "Avoid eye contact."}--Eyes
,{"Uhm... the door?","Look at the door! Something may be lurking...","Look I'll hand it to you. The room number is "..game.ReplicatedStorage.GameData.LatestRoom.Value.."."}--Dupe
,{"A-120."}, {"A-60."},{"It- Blitz..."},
{"It isn't funny!","Stop laughing.","Giggle up ahead.", "Watch above you."}--Giggle

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
UserInputService.InputBegan:Connect(function(i,proc)
	if proc then return end

if Ended == false then

	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.Gamepad1 then
		Skipped = true
	end
end
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CaptionDoorsSource.lua"))()
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
SpeakerIconShow("rbxassetid://99087926706059")
Caption(deathmsgs[math.random(1,6)][1])
wait(5)
SpeakerIconHide()
end)


game.Workspace.ChildAdded:Connect(child)
if child.Name == "AmbushMoving" then
local text = entitytablelines[2][math.random(1,4)]
		print(text)
		for i = 1, #text do


			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))

Caption(string.sub(text, 1, i))
				wait(0.002)
		end
elseif child.Name == "RushMoving" then
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
elseif child.Name == "A60" then
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
elseif child.Name == "A120" then
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
elseif child.Name == "BackdoorRush" then
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
		elseif child.Name == "Eyes" or child.Name == "BackdoorLookman" then
local text = entitytablelines[7][math.random(1,4)]
		print(text)
		for i = 1, #text do
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
Caption(string.sub(text, 1, i))
			wait(0.002)
		end
end
end)


workspace.CurrentCamera.ChildAdded:Connect(function(child)
	for _, guidance in pairs(workspace.CurrentCamera:GetChildren()) do
            if guidance:IsA("BasePart") and guidance.Name == "Guidance" then
                local weld = Instance.new("WeldConstraint")
			rushhelper:Pivot(guidance.CFrame)
			weld.Parent = guidance
			weld.Part0 = guidance
			weld.Part1 = rushhelper.Root
			rushhelper.Root.AlignPosition.Enabled = false
	rushhelper.Root.Anchored = false
            end
        end
    if child.Name == "Screech" then
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
    end
end)


workspace.CurrentCamera.ChildRemoved:Connect(function() 
		for _, guidance in pairs(workspace.CurrentCamera:GetChildren()) do
            if guidance:IsA("BasePart") and guidance.Name == "Guidance" then
			rushhelper.Root.AlignPosition.Enabled = true
	rushhelper.Root.Anchored = false
            end
        end
		end)

Rooms.DescendantAdded:Connect(function(v)
			if v:IsA("Model") then
if v.Name == "_NestHandler" then
local anchor = SolveAnchor(v, false)
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
	LerpTo(rushhelper, char.Head)
else
break
end
end
			rushhelper:PivotTo(newatt.WorldCFrame)
rushhelper.Root.Anchored = false
rushhelper.Root.AlignPosition.Enabled = true
				end
			end
		end)


game.ReplicatedStorage.GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()

	
local croom = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
			local foundfuses = CheckIf("FuseHolder",croom)
			if foundfuses then
for _, fuses in croom do
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
for _, models in croom do
if models:IsA("Model") and models.Name = "MinesGenerator" then
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
				wait(0.01
			FireProxy(fuses.FuseObtain.ModulePrompt)
			wait(0.01)
			if hasgen then
for _, FuseInput in Root.Fuses:GetChildren() do
                            if FuseInput:FindFirstChild("FusesPrompt") then
								FuseInput.FusePrompt.MaxActivationDistance = 100000
			FuseInput.FusesPrompt.RequiresLineOfSight = false
								wait(0.01)
                                FireProxy(FuseInput.FusesPrompt)
						end
					end
			end


			end
for _, models in croom do
if models:IsA("Model") and models.Name = "MinesGenerator" then
				FireProxy(models.Lever.LeverPrompt)
					end
				end


						while true do 
wait()

if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
	LerpTo(rushhelper, char.Head)
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
	LerpTo(rushhelper, char.Head)
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
	end
coroutine.resume(cod)		

if croom:FindFirstChild("LiveBreakerPolePickup") then
local cobp = coroutine.create(function()
while wait(math.random(15,30)) do
                for _, bpzlp in croom:GetChildren() do
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
                        for _, ActivateEventPrompt in v:GetChildren() do

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
	LerpTo(rushhelper, char.Head)
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
	end
coroutine.resume(cobp)


if croom:FindFirstChild("Modular_Bookshelf") then
local cob = coroutine.create(function()
while wait(math.random(30,45)) do
                    if croom.Modular_Bookshelf and croom.Modular_Bookshelf:FindFirstChild("LiveHintBook") then
                     
                            
						local pfs = game:GetService("PathfindingService")
local path = pfs:CreatePath()

path:ComputeAsync(rushhelper.Root.Position, croom.Modular_Bookshelf.LiveHintBook.PrimaryPart.Position)
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
						
					
										croom.Modular_Bookshelf.LiveHintBook.ActivateEventPrompt.MaxActivationDistance = 100000
									croom.Modular_Bookshelf.LiveHintBook.ActivateEventPrompt.RequiresLineOfSight = false
										wait(0.01)
						FireProxy(croom.Modular_Bookshelf.LiveHintBook.ActivateEventPrompt)
						


						while true do 
wait()

if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
	LerpTo(rushhelper, char.Head)
else
break
end
end
			rushhelper:PivotTo(newatt.WorldCFrame)
rushhelper.Root.Anchored = false
rushhelper.Root.AlignPosition.Enabled = true

                        end

                    end
		

		
end)
	end
coroutine.resume(cob)		



	
if game.ReplicatedStorage.GameData.ChaseInSession.Value == true then
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
end
if game.ReplicatedStorage.GameData.LatestRoom.Value  == 50 then
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
end
        for _, dupeRoom in pairs(croom:GetChildren()) do
            if dupeRoom.Name == "DoorFake"   then
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
break

end
        end
if croom:GetAttribute("RawName") == "HaltHallway" then
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
	end
	if workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value + 1]:GetAttribute("RawName") == "HaltHallway" then
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
	end
			local cokg = coroutine.create(function()
					while true do
						wait()
	local HasKey = false
local CurrentDoor = croom:WaitForChild("Door")
            for i,v in ipairs(CurrentDoor.Parent:GetDescendants()) do
                if v.Name == "KeyObtain" then
                    HasKey = v
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
LerpTo(rushhelper, HasKey.PrimaryPart)
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
LerpTo(rushhelper, CurrentDoor.PrimaryPart)
			
HasKey.ModulePrompt.MaxActivationDistance = 100000
HasKey.ModulePrompt.RequiresLineOfSight = false
			wait(0.03)
	
FireProxy(HasKey.ModulePrompt)
			local Anims = Humanoid.Animator:GetPlayingAnimationTracks()
			for _,animation in Anims do 
    animation:Stop() -- stops pickup
end
			CurrentDoor.Lock.MaxActivationDistance = 100000
CurrentDoor.Lock.RequiresLineOfSight = false


			wait(0.03)
FireProxy(CurrentDoor.Lock.UnlockPrompt)
			local Anims = Humanoid.Animator:GetPlayingAnimationTracks()
			for _,animation in Anims do 
    animation:Stop() -- stops unlock
end
			wait(0.03)
			CurrentDoor.ClientOpen:FireServer()
			local Anims = Humanoid.Animator:GetPlayingAnimationTracks()
			for _,animation in Anims do 
    animation:Stop() -- extra safe
end
			
			wait(0.1)
			
while true do 
wait()

if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
	LerpTo(rushhelper, char.Head)
else
break
end
end
			rushhelper:PivotTo(newatt.WorldCFrame)
rushhelper.Root.Anchored = false
rushhelper.Root.AlignPosition.Enabled = true



for i,v in ipairs(CurrentDoor.Parent:GetDescendants()) do
                if v.Name == "LeverForGate" then
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
                        
                                FireProxy(v.ActivateEventPrompt)
                        
                        end
				end
			end
							end
						end)

					coroutine.resume(cokg)	
end)
				
			


local newatt = Instance.new("Attachment")
newatt.Parent = char.UpperTorso
newatt.WorldCFrame = char.Head.CFrame
newatt.WorldPosition = char.Head.Position + Vector3.new(1.705, -0.5, -0.558)
newatt.Name = "RushAtt"
rushhelper.Parent = workspace
rushhelper.Root.AlignPosition.Attachment1 = newatt

local text = "Hi."
		print(text)
		for i = 1, #text do


			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))

Caption(string.sub(text, 1, i))
				wait(0.002)
		end
