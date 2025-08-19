loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local SurgeFaces = {LoadCustomAsset("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Surge_F1.png"), LoadCustomAsset("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Surge_F2.png"), LoadCustomAsset("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Surge_F3.png") }
local SurgeEffect = LoadCustomAsset("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Surge_Effect%20(1).png")
local FaceColors = {
	ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), 
	ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255,255 , 224)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 150, 225)), 
      ColorSequenceKeypoint.new(0.8, Color3.new(1, 1, 1)), 
}
local datastoreservice = game:GetService("DataStoreService")
local mystore = datastoreservice:GetDataStore("DeathCountCustom")

local player = game.Players.LocalPlayer
	local leaderstats = Instance.new("Folder",player)
	leaderstats.Name = "DeathCounts"
	
	local sd = Instance.new("IntValue",leaderstats)
	sd.Name = "SurgeDeaths"
	sd.Value = 0

	


	local playerid = "Player_" .. player.UserId
	local data = mystore:GetAsync(playerid)

	if data then
		sd.Value = data['SurgeDeaths']
		
	else
		sd.Value = 0
		
	end


game.Players.PlayerRemoving:Connect(function(playerr)
	local datatobesaved = {
		sd = player.DeathCounts.SurgeDeaths.Value;

	}
	local playerid = "Player_" .. player.UserId
	local success, err = pcall(function()
		mystore:SetAsync(playerid,datatobesaved)
	end)
	if success then
		print("msg data saved!")
	else
		print("msg data failed to save!")
	end
end)
	
local PointA = workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position + Vector3.new(0,130,0)
local PointB = workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position

local Model = nil --Own model with primarypart
local Part = nil
local remotesFolder = game.ReplicatedStorage:WaitForChild("RemotesFolder")

if Model == nil then
local Surge = Instance.new("Model")
      Surge.Name = "Surge" 
      local main = Instance.new("Part") 
      main.Parent = Surge
      main.Anchored = true
      main.Shape = Enum.PartType.Ball
      main.Size = Vector3.new(3,3,3)
      main.Transparency = 1
      main.Name = "SurgeMain"
      local FaceAtt = Instance.new("Attachment")
      FaceAtt.Parent = main
      FaceAtt.Name = "FaceAt"
      FaceAtt.Position = Vector3.new(0,0,0)
      FaceAtt.WorldPosition = main.Position
      local Face = Instance.new("ParticleEmitter") 
      Face.Parent = FaceAtt
      Face.Texture = SurgeFaces[1]
      Face.Speed = 0
      Face.Lifetime = 0.1
      Face.Rate = 50
      Face.Rotation = NumberRange.new(-15, 15) 
      Face.RotSpeed = 0 
      Face.Name = "Face" 
      Face.Size = 2.56
      Face.Color = ColorSequence.new(FaceColors) 
      local light = Instance.new("PointLight")
      light.Parent = FaceAtt
      light.Color = Color3.fromRGB(255,255,224)
	light.Shadows = true
	Surge.PrimaryPart = main
	light.Range = 25
	Part = main
	Model = Surge
	Model.Parent = workspace
else
	Model.Parent = workspace
	Part = Model.PrimaryPart
end
local effectui=Instance.new("ScreenGui")
local effectil = Instance.new("ImageLabel")
effectil.Image = SurgeEffect 
effectui.Name = "SurgeEffectUi" 
effectil.Parent = effectui
effectil.Size = UDim2.new(1, 0,1, 0) 
effectil.Transparency = 1
effectui.Parent = game.Players.LocalPlayer.PlayerGui
effectil.AnchorPoint = Vector2.new(0,0)
local cosf = coroutine.create(function()
				while wait(0.1) do
						
					for i=1,3 do
if Model.Name == "Surge" then
Model.SurgeMain.FaceAtt.Face.Texture = SurgeFaces[i] 
					wait(0.1)
				end
			end
		end

			end)
	
					coroutine.resume(cosf)
local cosd = coroutine.create(function()
				while wait(0.1) do
						
					local MagnitudeS = (workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position - Part.Position).Magnitude
 local cd = false
			if MagnitudeS < 10 and cd == false and workspace:FindFirstChild(game.Players.LocalPlayer.Name):GetAttribute("Hiding") == false then 
cd = true
				workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid").Health -= 40
				wait(0.4)
				cd = false
				wait(0.1)
				if workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid").Health <= 0 then
--Death msg
					if firesignal then
					firesignal(remotesFolder.DeathHint.OnClientEvent, {"Hmm. What was it this time?", "You've died to what I call Surge.","What did it feel like? All the electricity in your body?","...Probably not great.", "You can do this. I believe in you.", "I'll see you next time. Right?" } , "Yellow")
				else
					warn("firesignal not supported, ignore death hints.")
					end
					cd=true
				end
			end
		end

			end)
	
					coroutine.resume(cosd)

local cose = coroutine.create(function()
			
						
					while task.wait() do
							
						local MagnitudeS = (workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart") - Part.Position).Magnitude
if MagnitudeS < 101 then 
effectil.Transparency = MagnitudeS/10
			end
		end

			end)
	
					coroutine.resume(cose)

local Magnitude = (PointA - PointB).Magnitude

local MidPosition = CFrame.new(PointA, PointB) * CFrame.new(0, 0, -Magnitude) * CFrame.new(-math.random(Magnitude / 2), math.random(Magnitude / 2)).Position

LerpTo = function(model, target)
	local alpha = 0
	local speed = 70
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

local function Lerp(a, b, c)
      return a + (b - a) * c
end

local function QuadBezier (StartPosition, MidPosition, EndPosition, Offset)
       local L1 = Lerp(StartPosition, MidPosition, Offset)
       local L2 = Lerp(MidPosition, EndPosition, Offset)
       local QuadBezier = Lerp(L1, L2, Offset)

       return QuadBezier
end
for Index = 1, math.random(3,7) do
for Index = 1, 10 do
     local CurrentPosition = QuadBezier(PointA, MidPosition, PointB, Index / 10)

     local partforlerp = Instance.new("Part")
		partforlerp.Size=Vector3.new(1,1,1)
		partforlerp.Position = CurrentPosition
		partforlerp.Transparency = 1
		LerpTo(Model, partforlerp) 
     
		PointA = workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position
partforlerp:Destroy() 
		PointB = workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position + Vector3.new(math.random(5,20),math.random(5,20), math.random(5,20)) 

end
end
local partforlerp = Instance.new("Part")
		partforlerp.Size=Vector3.new(1,1,1)
partforlerp.Transparency =1
		partforlerp.Position = workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position + Vector3.new(0,130)
LerpTo(Model, partforlerp)
Model:Destroy()
effectui:Destroy()
