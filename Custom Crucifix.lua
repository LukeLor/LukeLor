--Currently getting info rn. HEAVILY BASED ON REGULAR VYNIXU'S SCRIPT
loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local crucifix = LoadCustomInstance("https://github.com/RegularVynixu/Utilities/raw/refs/heads/main/Doors/Item%20Spawner/Assets/Crucifix.rbxm")
local seal = LoadCustomInstance("")-- Seal link
local config = {Resist = false, IgnoreEntities = {}, Uses = 1}
local SealIcon = "rbxassetid://123535107502536" --Custom

function CrucifixActivation()
	local localchar = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
	local localroot = localchar.HumanoidRootPart
local tool = crucifix:Clone()
    tool:PivotTo(CFrame)
    tool.Parent = workspace

	local toolPivot = tool:GetPivot()
	local entityPivot = model:GetPivot()

	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = {localCharacter, model}
	local result = workspace:Raycast(entityPivot.Position, Vector3.new(0, -1000, 0), params)
	
    if not result then
        return
    end

    model:SetAttribute("BeingBanished", true)

    -- Variables
	local repentance = assets.Repentance:Clone()
	local crucifixr = repentance.Crucifix
	local pentagram = repentance.Pentagram
	local entityPart = repentance.Entity
	local sound = (config.Resist and crucifix.SoundFail or crucifix.Sound)
	local shaker = moduleScripts.Main_Game.camShaker:StartShake(5, 20, 2, Vector3.new())

    -- Repentance setup
	repentance:PivotTo(CFrame.new(result.Position))
	crucifixr.CFrame = toolPivot
	repentance.Entity.CFrame = entityPivot
    crucifixr.BodyPosition.Position = (localCharacter:GetPivot() * CFrame.new(0.5, 3, -6)).Position
	repentance.Parent = workspace
	sound:Play()

    -- Teleport model to repentance entity part
	task.spawn(function()
        if not config.Resist then
            while model.Parent and repentance.Parent do
                model:PivotTo(entityPart.CFrame)
                task.wait()
            end

            model:Destroy()
        end
	end)
end
