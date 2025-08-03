local sc = game.ReplicatedStorage.Entities.Screech
for _, insts in sc:GetDescendants() do
if insts.Parent ~= nil then
print(insts.Name.." is a(n): "..insts.ClassName..", and a child of: "..insts.Parent.Name..".")
end
end
