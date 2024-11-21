local var_0_0 = class("PuzzleConnectLayer", import("..base.BaseUI"))

var_0_0.OPEN_DETAIL = "open detail panel"
var_0_0.OPEN_MENU = "open menu panel"
var_0_0.OPEN_GAME = "open game panel"

function var_0_0.getUIName(arg_1_0)
	return "PuzzleConnectUI"
end

function var_0_0.didEnter(arg_2_0)
	arg_2_0.menuPanel = PuzzleConnectMenu.New(findTF(arg_2_0._tf, "ad/menu"), arg_2_0)
	arg_2_0.detailPanel = PuzzleConnectDetail.New(findTF(arg_2_0._tf, "ad/detail"), arg_2_0)
	arg_2_0.gamePanel = PuzzleConnectGame.New(findTF(arg_2_0._tf, "ad/game"), arg_2_0)
	arg_2_0.panelDic = {
		arg_2_0.menuPanel,
		arg_2_0.detailPanel,
		arg_2_0.gamePanel
	}

	arg_2_0:bind(PuzzleConnectLayer.OPEN_DETAIL, function(arg_3_0, arg_3_1)
		arg_2_0:show(arg_2_0.menuPanel)
		arg_2_0:show(arg_2_0.detailPanel, true)

		if arg_3_1 then
			arg_2_0.detailPanel:setData(arg_3_1)

			arg_2_0._activity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLE_CONNECT)

			arg_2_0.detailPanel:setActivity(arg_2_0._activity)
		end
	end)
	arg_2_0:bind(PuzzleConnectLayer.OPEN_MENU, function(arg_4_0, arg_4_1)
		arg_2_0:show(arg_2_0.menuPanel)
	end)
	arg_2_0:bind(PuzzleConnectLayer.OPEN_GAME, function(arg_5_0, arg_5_1)
		arg_2_0:show(arg_2_0.gamePanel)

		if arg_5_1 then
			arg_2_0.gamePanel:setData(arg_5_1)
		end
	end)
	arg_2_0:show(arg_2_0.menuPanel)

	arg_2_0._activity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLE_CONNECT)

	if arg_2_0._activity then
		local var_2_0 = arg_2_0._activity:getConfig("config_data")

		arg_2_0.menuPanel:setData(var_2_0)
	else
		arg_2_0.menuPanel:setData({
			1,
			2,
			3,
			4,
			5,
			6,
			7
		})
	end

	if PlayerPrefs.GetInt("puzzle_connect_first_" .. tostring(getProxy(PlayerProxy):getPlayerId())) ~= 1 then
		pg.NewStoryMgr.GetInstance():Play("WEIXIANFAMINGPOJINZHONGWEITUO1", function()
			PlayerPrefs.SetInt("puzzle_connect_first_" .. tostring(getProxy(PlayerProxy):getPlayerId()), 1)
		end)
	end

	arg_2_0:updateActivity()
end

function var_0_0.show(arg_7_0, arg_7_1, arg_7_2)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.panelDic) do
		if iter_7_1 == arg_7_1 then
			iter_7_1:show()
		elseif not arg_7_2 then
			iter_7_1:hide()
		end
	end
end

function var_0_0.updateActivity(arg_8_0)
	arg_8_0._activity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLE_CONNECT)

	if arg_8_0._activity then
		local var_8_0 = arg_8_0._activity:getConfig("config_data")

		arg_8_0.menuPanel:setActivity(arg_8_0._activity)
		arg_8_0.detailPanel:setActivity(arg_8_0._activity)
		arg_8_0.gamePanel:setActivity(arg_8_0._activity)

		local var_8_1 = getProxy(PlayerProxy)
		local var_8_2 = arg_8_0._activity.data1_list
		local var_8_3 = arg_8_0._activity.data2_list
		local var_8_4 = arg_8_0._activity.data3_list
		local var_8_5 = arg_8_0._activity:getDayIndex()
		local var_8_6 = 0

		for iter_8_0 = 1, #var_8_0 do
			local var_8_7 = var_8_0[iter_8_0]

			if iter_8_0 <= var_8_5 then
				if not table.contains(var_8_4, var_8_7) then
					if not table.contains(var_8_2, var_8_7) and iter_8_0 == var_8_6 + 1 then
						local var_8_8 = pg.activity_tolove_jigsaw[var_8_7].need[3]
						local var_8_9 = pg.activity_tolove_jigsaw[var_8_7].need[2]

						if var_8_8 <= var_8_1:getData():getResource(var_8_9) then
							arg_8_0:emit(PuzzleConnectMediator.CMD_ACTIVITY, {
								index = 1,
								config_id = var_8_7
							})
						end
					end
				else
					var_8_6 = var_8_6 < iter_8_0 and iter_8_0 or var_8_6
				end
			end
		end
	end
end

function var_0_0.initEvent(arg_9_0)
	return
end

function var_0_0.willExit(arg_10_0)
	arg_10_0.detailPanel:dispose()
	arg_10_0.menuPanel:dispose()
	arg_10_0.gamePanel:dispose()
end

return var_0_0
