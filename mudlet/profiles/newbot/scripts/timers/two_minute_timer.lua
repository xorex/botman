--[[
    Botman - A collection of scripts for managing 7 Days to Die servers
    Copyright (C) 2017  Matthew Dwyer
	           This copyright applies to the Lua source code in this Mudlet profile.
    Email     mdwyer@snap.net.nz
    URL       http://botman.nz
    Source    https://bitbucket.org/mhdwyer/botman
--]]

function twoMinuteTimer()
	-- to fix a weird bug where the bot would stop responding to chat but could be woken up by irc chatter we send the bot a wake up call
	irc_chat(server.ircBotName, "Wake up!")	
	
	removeBadPlayerRecords()	
	
	if server.scanErrors then
		for k,v in pairs(igplayers) do		
			send("rcd " .. math.floor(v.xPos) .. " " .. math.floor(v.zPos))	
		end	
	end
end
