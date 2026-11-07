loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/refs/heads/main/Functions.lua"))()
wait(1)
local Rift =LoadCustomInstance("https://github.com/LukeLor/LukeLor/blob/main/TPOT-Rift.rbxm?raw=true")

Rift.Parent = workspace
Rift:PivotTo(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame + Vector3.new(0,13,0))

local entity = LoadCustomInstance("https://github.com/LukeLor/LukeLor/blob/main/NewEntity.rbxm?raw=true")

entity.Parent = workspace
entity:PivotTo(Rift.PrimaryPart.CFrame)
local folder = Instance.new("Folder")
folder.Parent = workspace

local ControllerManager = entity.ControllerManager
local function Move(node:Part)
	local path = game:GetService("PathfindingService"):FindPathAsync(entity.HumanoidRootPart.Position,node.Position)
	local oldnodepos = node.Position
	repeat task.wait()

		for _, waypoint in path:GetWaypoints() do
			ControllerManager.MovingDirection = (waypoint.Position-entity.HumanoidRootPart.Position).Unit
	ControllerManager.FacingDirection = (waypoint.Position-entity.HumanoidRootPart.Position).Unit

		end
		if node.Position ~= oldnodepos  then
			--print("changed pos to: "..tostring(node.Position))
			path = game:GetService("PathfindingService"):FindPathAsync(entity.HumanoidRootPart.Position,node.Position)

			oldnodepos = node.Position
			for _, waypoint in path:GetWaypoints() do
				ControllerManager.MovingDirection = (waypoint.Position-entity.HumanoidRootPart.Position).Unit
				ControllerManager.FacingDirection = (waypoint.Position-entity.HumanoidRootPart.Position).Unit
				for _, waypoint in path:GetWaypoints() do
					local rp = Instance.new("Part")
					rp.Parent = folder
					rp.Anchored = true
					rp.Position = waypoint.Position
					rp.Size = Vector3.new(1,1,1)
					--print("Made")
					rp.CanCollide = false

					rp.Color = Color3.new(1, 0, 0)
rp.Transparency = 1
				end
				repeat task.wait()
					if node.Position ~= oldnodepos  then
						break
					end


				until(entity.HumanoidRootPart.Position - waypoint.Position).Magnitude <= 7   

			end
			--	break
		end

	until (entity.HumanoidRootPart.Position - node.Position).Magnitude <= 7 
end
local Despawn = false
local funMech = coroutine.create(function()
	while task.wait() do
		if Despawn == false then
			
		
	if (entity.HumanoidRootPart.Position - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude <= 4 then
				game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health = 0
					firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"You died to...","I... don't know...","The- I don't think she'd make it, right?","It looks like it came out of some sort of rift, I believe?","She'd usually talk to me when introducing another one, so I could try referring to it if you were to die to something similar...", "I'll... go figure this out.","Please do come back if the entity appears again.","I'll see you next time, right?","Haha, of course I will."}, "Yellow")

				print("YAY, Game!!! — when done...")
				break
		end
		end
end
end)
local timer = coroutine.create(function()
	task.wait(math.random(10,15))
	Despawn = true
	coroutine.close(funMech)
	
end)
coroutine.resume(funMech)
coroutine.resume(timer)
while task.wait() do
	if despawn == false then
	Move(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"))
end
end
