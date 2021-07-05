ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('chatMessage', function(playerId, playerName, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		playerName = GetRealPlayerName(playerId)
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(64, 64, 64, 0.8); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
			args = {_U('ooc_prefix', playerName), message}, color = {255, 255, 255}
		})
	end
end)

-- TWT Command
RegisterCommand('twt', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')

		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 153, 204, 0.8); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
			args = {_U('twt_prefix', playerName), args}, color = {255, 255, 255}
		})
	end
end, false)

-- ANONTWT Command
RegisterCommand('anontwt', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')

		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 153, 204, 0.8); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
			args = {_U('twt_prefix', "Anonymous"), args}, color = {255, 255, 255}
		})
	end
end, false)

-- ME Command
--[[RegisterCommand('me', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('me_prefix', playerName), args, {255, 0, 0})
	end
end, false)]]

-- DO Command
--[[RegisterCommand('do', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('do_prefix', playerName), args, {0, 0, 255})
	end
end, false)]]

-- MSG Command
RegisterCommand('msg', function(source, args, user)

	if GetPlayerName(tonumber(args[1])) then
		local player = tonumber(args[1])
		table.remove(args, 1)

		TriggerClientEvent('chat:addMessage', player, {args = {"^1PM from "..GetPlayerName(source).. "[" .. source .. "]: ^7" ..table.concat(args, " ")}, color = {255, 153, 0}, template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(64, 64, 64, 0.8); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br></div>'})
		TriggerClientEvent('chat:addMessage', source, {args = {"^1PM SEND TO "..GetPlayerName(player).. "[" .. player .. "]: ^7" ..table.concat(args, " ")}, color = {255, 153, 0}, template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(64, 64, 64, 0.8); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br></div>'})
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "ID incorrect!")
	end

end,false)

-- OOC Command
RegisterCommand('ooc', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')

		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(64, 64, 64, 0.8); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
			args = {_U('ooc_prefix', playerName), args}, color = {255, 255, 255}
		})
	end
end, false)

-- Ad Command
RegisterCommand('ad', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')

		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(214, 168, 0, 0.8); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
			args = {_U('ad_prefix', playerName), args}, color = {255, 255, 255}
		})
	end
end, false)

function GetRealPlayerName(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		if Config.EnableESXIdentity then
			if Config.OnlyFirstname then
				return xPlayer.get('firstName')
			else
				return xPlayer.getName()
			end
		else
			return xPlayer.getName()
		end
	else
		return GetPlayerName(playerId)
	end
end
