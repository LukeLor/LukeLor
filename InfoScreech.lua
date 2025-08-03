local sc = game.ReplicatedStorage.Entities.Screech
local notwanted = {"Part", "BasePart", "MeshPart", "UnionOperation", "Model"}

for _, insts in sc:GetDescendants() do
if insts.Parent ~= nil and not table.find(notwanted, insts.ClassName) then
print(insts.Name.." is a(n): "..insts.ClassName..", and a child of: "..insts.Parent.Name..".")
end
end
