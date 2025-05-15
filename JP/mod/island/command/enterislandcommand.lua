local var_0_0 = class("EnterIslandCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id

	pg.ConnectionMgr.GetInstance():Send(21202, {
		island_id = var_1_0
	}, 21203, function(arg_2_0)
		if arg_2_0.result == 0 then
			arg_1_0:GetIslandData(var_1_0, arg_2_0.player_list)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

function var_0_0.GetIslandData(arg_3_0, arg_3_1, arg_3_2)
	pg.ConnectionMgr.GetInstance():Send(21200, {
		island_id = arg_3_1
	}, 21201, function(arg_4_0)
		local var_4_0 = arg_3_0:IsSelf(arg_3_1)
		local var_4_1 = (var_4_0 and Island or SharedIsland).New(arg_4_0.island)
		local var_4_2 = {}

		for iter_4_0, iter_4_1 in ipairs(arg_3_2) do
			var_4_2[iter_4_1.id] = IslandPlayer.New(iter_4_1)
		end

		var_4_1:GetVisitorAgency():SetPlayerList(var_4_2)

		if var_4_0 then
			getProxy(IslandProxy):SetIsland(var_4_1)
		else
			getProxy(IslandProxy):SetSharedIsland(var_4_1)
		end

		arg_3_0:sendNotification(GAME.ISLAND_ENTER_MAP, {
			islandId = arg_3_1,
			mapId = var_4_1:GetMapId(),
			callback = function()
				arg_3_0:GoScene(arg_3_1)
			end
		})
	end)
end

function var_0_0.IsSelf(arg_6_0, arg_6_1)
	return getProxy(PlayerProxy):getRawData().id == arg_6_1
end

function var_0_0.GoScene(arg_7_0, arg_7_1)
	if arg_7_0:IsSelf(arg_7_1) then
		arg_7_0:sendNotification(GAME.GO_SCENE, SCENE.ISLAND, {
			id = arg_7_1
		})
	else
		arg_7_0:sendNotification(GAME.GO_SCENE, SCENE.SHARED_ISLAND, {
			id = arg_7_1
		})
	end
end

return var_0_0
