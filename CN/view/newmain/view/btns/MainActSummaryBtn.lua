local var_0_0 = class("MainActSummaryBtn", import(".MainBaseActivityBtn"))

function var_0_0.GetEventName(arg_1_0)
	return "event_all"
end

function var_0_0.GetTipImage(arg_2_0)
	return "tip_1920"
end

function var_0_0.NewGameObject(arg_3_0)
	return arg_3_0.tpl
end

function var_0_0.GetActivityID(arg_4_0)
	return nil
end

function var_0_0.OnInit(arg_5_0)
	arg_5_0:PickPriortyActAsyn(function(arg_6_0, arg_6_1)
		arg_5_0.priority = arg_6_0

		if arg_6_1 > 0 then
			arg_5_0.tipTxt.text = arg_6_1
		end

		setActive(arg_5_0.tipTr.gameObject, arg_6_1 > 0)
	end)
end

function var_0_0.PickPriortyActAsyn(arg_7_0, arg_7_1)
	local var_7_0 = {}
	local var_7_1 = 0
	local var_7_2

	table.insert(var_7_0, function(arg_8_0)
		local var_8_0, var_8_1 = arg_7_0:CollectActivity()

		var_7_2 = var_8_1
		var_7_1 = var_7_1 + var_8_0

		onNextTick(arg_8_0)
	end)
	table.insert(var_7_0, function(arg_9_0)
		local var_9_0 = arg_7_0:CollectActEntrance()

		var_7_1 = var_7_1 + var_9_0

		onNextTick(arg_9_0)
	end)
	seriesAsync(var_7_0, function()
		arg_7_1(var_7_2, var_7_1)
	end)
end

function var_0_0.CollectActivity(arg_11_0)
	local var_11_0 = 0
	local var_11_1
	local var_11_2 = getProxy(ActivityProxy):getRawData()

	for iter_11_0, iter_11_1 in pairs(var_11_2) do
		if not iter_11_1:isEnd() and iter_11_1:isShow() and iter_11_1:readyToAchieve() then
			var_11_0 = var_11_0 + 1

			if not var_11_1 or var_11_1 and var_11_1.id > iter_11_1.id then
				var_11_1 = iter_11_1
			end
		end
	end

	return var_11_0, var_11_1
end

function var_0_0.CollectActEntrance(arg_12_0)
	local var_12_0 = 0
	local var_12_1 = ActivityMainScene.GetOnShowEntranceData()

	return #_.filter(var_12_1, function(arg_13_0)
		return arg_13_0.isTip and arg_13_0.isTip()
	end)
end

function var_0_0.CustomOnClick(arg_14_0)
	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CARD_TOWER_MODE_SELECT)
end

return var_0_0
