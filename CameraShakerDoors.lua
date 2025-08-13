local moduleScripts = {
	Module_Events = require(ReplicatedStorage.ClientModules.Module_Events),
	Main_Game = require(playerGui.MainUI.Initiator.Main_Game),
	Earthquake = require(remotesFolder.RequestAsset:InvokeServer("Earthquake"))
}
local shaker = moduleScripts.Main_Game.camShaker:StartShake(1, 1, 0, 5)
wait(5) 
shaker:StartFadeOut(5)
