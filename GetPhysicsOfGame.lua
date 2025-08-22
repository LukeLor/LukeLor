local PhysicsService = game:GetService("PhysicsService")


-- Get all the registered collision groups
local allCollisionGroups = PhysicsService:GetCollisionGroups()

-- Print the names of all the collision groups

for _, groupData in ipairs(allCollisionGroups) do
    print(groupData.Name)
end
