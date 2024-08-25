--Setup?
local RoomHolder = workspace.Rooms:GetDecendants()--DONT TOUCH LINE

for _, Rooms in pairs(RoomHolder) do
if Rooms:IsA("Model") then
print("Well Here Is A Room."..Rooms.Name)
end
--Variables
--local IsPandemonium = false --(WORK IN PROGRESS)
local math = Instance.new("NumberValue")
math.Value = 1
local LastRoom = workspace.Rooms[Game.ReplicatedStorage.]--DONT TOUCH
local Entity = game:GetObjects("rbxassetid://")[1] -- Asset ID goes after "rbxassetid://"
local CurrentRoom = workspace.Rooms[Game.ReplicatedStorage.]--DONT TOUCH LINE
local Nodes = Rooms.EntityNodes
local currentnode = Node[math.Value]
local Tween = game:GetService("TweenService")--DONT TOUCH
local slow = false --Speed
local fast = false --Speed
local normal = true --Speed
local KillRange = 50 --I cant raycast so it is a sphere :(
local sphere = Instance.New("Part")
sphere = Enum.PartType.Ball
sphere.Size = KillRange,KillRange,KillRange

-- Slow, Fast, Normal is the speed of the entity.
local fasttween = TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out) --DONT TOUCH THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING
local slowtween = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out) --DONT TOUCH THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING
local normaltween = TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)--DONT TOUCH THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING

-- Real code (DONT TOUCH)
Entity.Parent = workspace
        sphere.Parent = Entity
while true do
sphere.Position = Entity.PrimaryPart.Position
sphere.Touched:Connect(function(hit)
        if hit.Parent:FindFirstChild("Humanoid") then
          hit.Parent.Humanoid.Health = 0
        end
      end)
end
Entity.PrimaryPart.Position = LastRoom.Entrances
if normal == true then
while true do
Tween:Create(Entity.PrimaryPart, normaltween,{Position = [currentnode].Position}):Play()
wait(0.7)
math.Value += 1
if not CurrentRoom:FindFirstChild(nextnode) then
Tween:Create(Entity.PrimaryPart, normaltween,{Position = CurrentRoom.Exits..Position}):Play()
end
end
end
if fast == true then
while true do
Tween:Create(Entity.PrimaryPart, fasttween,{Position = nextnode.Position}):Play()
end
end
if slow == true then
while true do
Tween:Create(Entity.PrimaryPart, slowtween,{Position = nextnode.Position}):Play()
end
end
