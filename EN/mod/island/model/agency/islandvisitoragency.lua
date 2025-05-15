local var_0_0 = class("IslandVisitorAgency", import(".IslandBaseAgency"))

var_0_0.PLAYER_ADD = "IslandVisitorAgency:PLAYER_ADD"
var_0_0.PLAYER_EXIT = "IslandVisitorAgency:PLAYER_EXIT"
var_0_0.CHANGE_PLAYER_DRESS = "IslandVisitorAgency:CHANGE_DRESS"

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0.playerList = {}
end

function var_0_0.SetPlayerList(arg_2_0, arg_2_1)
	arg_2_0.playerList = arg_2_1
end

function var_0_0.GetPlayerList(arg_3_0)
	return arg_3_0.playerList
end

function var_0_0.DeletePlayer(arg_4_0, arg_4_1)
	arg_4_0.playerList[arg_4_1] = nil

	arg_4_0:DispatchEvent(var_0_0.PLAYER_EXIT, {
		id = arg_4_1
	})
end

function var_0_0.AddPlayer(arg_5_0, arg_5_1)
	arg_5_0.playerList[arg_5_1.id] = arg_5_1

	arg_5_0:DispatchEvent(var_0_0.PLAYER_ADD, {
		player = arg_5_1
	})
end

function var_0_0.ChangeDress(arg_6_0, arg_6_1)
	arg_6_0:ChangePlayerDressData(arg_6_1)
	arg_6_0:DispatchEvent(var_0_0.CHANGE_PLAYER_DRESS, arg_6_1)
end

function var_0_0.ChangePlayerDressData(arg_7_0, arg_7_1)
	for iter_7_0, iter_7_1 in pairs(arg_7_0.playerList) do
		if iter_7_1:IsSelf() then
			for iter_7_2, iter_7_3 in pairs(arg_7_1) do
				iter_7_1:ChangeDressUpByType(iter_7_2, iter_7_3.currentItemId)
			end
		end
	end
end

function var_0_0.GetPlayerDressData(arg_8_0)
	for iter_8_0, iter_8_1 in pairs(arg_8_0.playerList) do
		if iter_8_1:IsSelf() then
			return iter_8_1:GetDressupData()
		end
	end

	return {}
end

return var_0_0
