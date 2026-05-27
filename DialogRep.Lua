local plr = game.Players.X_masLucas7

	
	local main = require(game.ServerScriptService.Modules.Dialogue).Speak({"Hey, my name's Jimmy, how you doin'?"}, workspace.Jimmy, plr, "91136591981788", true, {"Pretty good, you doing well?", "You suck.", "Hi..?", "..."})
	
	if main == "Pretty good, you doing well?" then
		require(game.ServerScriptService.Modules.Dialogue).Speak({"Yeah, for sure."}, workspace.Jimmy, plr, "110687448538083", true, nil)
	end
	if main == "You suck." then
		require(game.ServerScriptService.Modules.Dialogue).Speak({"Hell nah, bro."}, workspace.Jimmy, plr, "119761057188447", true, nil)
	end
	if main == "Hi..?" then
		require(game.ServerScriptService.Modules.Dialogue).Speak({"Hello."}, workspace.Jimmy, plr, "114320014019845", true, nil)
	end
	if main == "..." then
		require(game.ServerScriptService.Modules.Dialogue).Speak({"Ok."}, workspace.Jimmy, plr, "85092222952794", true, nil)
	end
--	require(game.ServerScriptService.Modules.Dialogue).Speak({"Thanks!"}, workspace:WaitForChild(plr.Name), plr, nil, nil, nil) 
	
	local close = require(game.ServerScriptService.Modules.Dialogue)
	close.Close(plr)
