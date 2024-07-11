local var_0_0 = class("EventProxy", import(".NetProxy"))

function var_0_0.register(arg_1_0)
	arg_1_0.eventList = {}

	arg_1_0:on(13002, function(arg_2_0)
		arg_1_0.maxFleetNums = arg_2_0.max_team

		arg_1_0:updateInfo(arg_2_0.collection_list)
	end)
	arg_1_0:on(13011, function(arg_3_0)
		for iter_3_0, iter_3_1 in ipairs(arg_3_0.collection) do
			local var_3_0 = EventInfo.New(iter_3_1)
			local var_3_1, var_3_2 = arg_1_0:findInfoById(iter_3_1.id)

			if var_3_2 == -1 then
				table.insert(arg_1_0.eventList, var_3_0)

				arg_1_0.eventForMsg = var_3_0
			else
				arg_1_0.eventList[var_3_2] = var_3_0
			end
		end

		arg_1_0.virgin = true

		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inEvent")
		arg_1_0.facade:sendNotification(GAME.EVENT_LIST_UPDATE)
	end)
end

function var_0_0.timeCall(arg_4_0)
	return {
		[ProxyRegister.DayCall] = function(arg_5_0)
			local var_5_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_COLLECTION_EVENT)

			if not var_5_0 or var_5_0:isEnd() then
				return
			end

			local var_5_1, var_5_2 = arg_4_0:GetEventByActivityId(var_5_0.id)

			if not var_5_1 or var_5_1 and not var_5_1:IsStarting() then
				if var_5_1 and var_5_2 then
					table.remove(arg_4_0.eventList, var_5_2)
				end

				local var_5_3 = var_5_0:getConfig("config_data")
				local var_5_4 = var_5_0:getDayIndex()

				if var_5_4 > 0 and var_5_4 <= #var_5_3 then
					arg_4_0:AddActivityEvent(EventInfo.New({
						finish_time = 0,
						over_time = 0,
						id = var_5_3[var_5_4],
						ship_id_list = {},
						activity_id = var_5_0.id
					}))
				end

				pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inEvent")
				arg_4_0:sendNotification(GAME.EVENT_LIST_UPDATE)
			end
		end,
		[ProxyRegister.SecondCall] = function(arg_6_0)
			arg_4_0:updateTime()
		end
	}
end

function var_0_0.remove(arg_7_0)
	return
end

function var_0_0.updateInfo(arg_8_0, arg_8_1)
	arg_8_0.eventList = {}

	for iter_8_0, iter_8_1 in ipairs(arg_8_1) do
		table.insert(arg_8_0.eventList, EventInfo.New(iter_8_1))
	end

	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inEvent")
	arg_8_0.facade:sendNotification(GAME.EVENT_LIST_UPDATE)
end

function var_0_0.updateNightInfo(arg_9_0, arg_9_1)
	for iter_9_0, iter_9_1 in ipairs(arg_9_1) do
		table.insert(arg_9_0.eventList, EventInfo.New(iter_9_1))
	end

	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inEvent")
	arg_9_0.facade:sendNotification(GAME.EVENT_LIST_UPDATE)
end

function var_0_0.getActiveShipIds(arg_10_0)
	local var_10_0 = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.eventList) do
		if iter_10_1.state ~= EventInfo.StateNone then
			for iter_10_2, iter_10_3 in ipairs(iter_10_1.shipIds) do
				table.insert(var_10_0, iter_10_3)
			end
		end
	end

	return var_10_0
end

function var_0_0.findInfoById(arg_11_0, arg_11_1)
	for iter_11_0, iter_11_1 in ipairs(arg_11_0.eventList) do
		if iter_11_1.id == arg_11_1 then
			return iter_11_1, iter_11_0
		end
	end

	return nil, -1
end

function var_0_0.countByState(arg_12_0, arg_12_1)
	local var_12_0 = 0

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.eventList) do
		if iter_12_1.state == arg_12_1 then
			var_12_0 = var_12_0 + 1
		end
	end

	return var_12_0
end

function var_0_0.hasFinishState(arg_13_0)
	if arg_13_0:countByState(EventInfo.StateFinish) > 0 then
		return true
	end
end

function var_0_0.countBusyFleetNums(arg_14_0)
	local var_14_0 = 0

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.eventList) do
		if not iter_14_1:IsActivityType() and iter_14_1.state ~= EventInfo.StateNone then
			var_14_0 = var_14_0 + 1
		end
	end

	return var_14_0
end

function var_0_0.updateTime(arg_15_0)
	local var_15_0 = false

	for iter_15_0, iter_15_1 in pairs(arg_15_0.eventList) do
		if iter_15_1:updateTime() then
			var_15_0 = true
		end
	end

	if var_15_0 then
		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inEvent")
		arg_15_0:sendNotification(GAME.EVENT_LIST_UPDATE)
	end
end

function var_0_0.getEventList(arg_16_0)
	return Clone(arg_16_0.eventList)
end

function var_0_0.getActiveEvents(arg_17_0)
	local var_17_0 = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.eventList) do
		if iter_17_1.finishTime >= pg.TimeMgr.GetInstance():GetServerTime() then
			table.insert(var_17_0, iter_17_1)
		end
	end

	return var_17_0
end

function var_0_0.fillRecommendShip(arg_18_0, arg_18_1)
	local var_18_0 = getProxy(BayProxy):getDelegationRecommendShips(arg_18_1)

	for iter_18_0, iter_18_1 in ipairs(var_18_0) do
		table.insert(arg_18_1.shipIds, iter_18_1)
	end
end

function var_0_0.fillRecommendShipLV1(arg_19_0, arg_19_1)
	local var_19_0 = getProxy(BayProxy):getDelegationRecommendShipsLV1(arg_19_1)

	for iter_19_0, iter_19_1 in ipairs(var_19_0) do
		table.insert(arg_19_1.shipIds, iter_19_1)
	end
end

function var_0_0.checkNightEvent(arg_20_0)
	local var_20_0 = pg.TimeMgr.GetInstance():GetServerHour()

	return (var_20_0 >= pg.gameset.night_collection_begin.key_value and var_20_0 < 24 or var_20_0 >= 0 and var_20_0 < pg.gameset.night_collection_end.key_value) and not _.any(arg_20_0.eventList, function(arg_21_0)
		local var_21_0 = arg_21_0:GetCountDownTime()

		return arg_21_0.template.type == EventConst.EVENT_TYPE_NIGHT and (not var_21_0 or var_21_0 > 0)
	end)
end

function var_0_0.AddActivityEvents(arg_22_0, arg_22_1, arg_22_2)
	for iter_22_0 = #arg_22_0.eventList, 1, -1 do
		local var_22_0 = arg_22_0.eventList[iter_22_0]

		if var_22_0:IsActivityType() and var_22_0:BelongActivity(arg_22_2) then
			table.remove(arg_22_0.eventList, iter_22_0)
		end
	end

	for iter_22_1, iter_22_2 in ipairs(arg_22_1) do
		print("add collection-----------", iter_22_2.id)
		table.insert(arg_22_0.eventList, iter_22_2)
	end

	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inEvent")
end

function var_0_0.AddActivityEvent(arg_23_0, arg_23_1)
	print("zero add collection-----------", arg_23_1.id)
	table.insert(arg_23_0.eventList, arg_23_1)
end

function var_0_0.CanJoinEvent(arg_24_0, arg_24_1)
	if not arg_24_1:reachNum() then
		return false, i18n("event_minimus_ship_numbers", arg_24_1.template.ship_num)
	end

	if not arg_24_1:reachLevel() then
		return false, i18n("event_level_unreached")
	end

	if not arg_24_1:reachTypes() then
		return false, i18n("event_type_unreached")
	end

	if not arg_24_1:IsActivityType() and arg_24_0.busyFleetNums >= arg_24_0.maxFleetNums then
		pg.TipsMgr.GetInstance():ShowTips(i18n("event_fleet_busy"))

		return
	end

	local var_24_0 = arg_24_1:GetCountDownTime()

	if var_24_0 and var_24_0 < 0 then
		return false, i18n("event_over_time_expired")
	end

	local var_24_1 = getProxy(PlayerProxy):getData()

	if arg_24_1:getOilConsume() > var_24_1.oil then
		local var_24_2

		if not ItemTipPanel.ShowOilBuyTip(arg_24_1:getOilConsume()) then
			var_24_2 = i18n("common_no_oil")
		end

		return false, var_24_2
	end

	local var_24_3 = pg.collection_template[arg_24_1.id]

	if var_24_3 then
		local var_24_4 = var_24_3.drop_oil_max or 0

		if var_24_1:OilMax(var_24_4) then
			return false, i18n("oil_max_tip_title") .. i18n("resource_max_tip_eventstart")
		end

		local var_24_5 = var_24_3.drop_gold_max or 0

		if var_24_1:GoldMax(var_24_5) then
			return false, i18n("gold_max_tip_title") .. i18n("resource_max_tip_eventstart")
		end
	end

	return true
end

function var_0_0.CanFinishEvent(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1.template

	if not var_25_0 then
		return false
	end

	local var_25_1 = getProxy(PlayerProxy):getData()
	local var_25_2 = var_25_0.drop_oil_max or 0

	if var_25_1:OilMax(var_25_2) then
		return false, i18n("oil_max_tip_title") .. i18n("resource_max_tip_event")
	end

	local var_25_3 = var_25_0.drop_gold_max or 0

	if var_25_1:GoldMax(var_25_3) then
		return false, i18n("gold_max_tip_title") .. i18n("resource_max_tip_event")
	end

	return true
end

function var_0_0.GetEventByActivityId(arg_26_0, arg_26_1)
	for iter_26_0, iter_26_1 in ipairs(arg_26_0.eventList) do
		if iter_26_1:BelongActivity(arg_26_1) then
			return iter_26_1, iter_26_0
		end
	end
end

function var_0_0.GetEventListForCommossionInfo(arg_27_0)
	local var_27_0 = arg_27_0:getEventList()
	local var_27_1 = 0
	local var_27_2 = 0
	local var_27_3 = 0
	local var_27_4 = 0
	local var_27_5 = 0
	local var_27_6 = 0
	local var_27_7 = {}

	_.each(var_27_0, function(arg_28_0)
		if arg_28_0:IsActivityType() then
			if arg_28_0.state == EventInfo.StateNone then
				var_27_6 = var_27_6 + 1
			elseif arg_28_0.state == EventInfo.StateActive then
				var_27_5 = var_27_5 + 1
			elseif arg_28_0.state == EventInfo.StateFinish then
				var_27_4 = var_27_4 + 1
			end
		elseif arg_28_0.state == EventInfo.StateNone then
			-- block empty
		elseif arg_28_0.state == EventInfo.StateActive then
			var_27_2 = var_27_2 + 1

			table.insert(var_27_7, arg_28_0)
		elseif arg_28_0.state == EventInfo.StateFinish then
			var_27_1 = var_27_1 + 1

			table.insert(var_27_7, arg_28_0)
		end
	end)

	local var_27_8 = var_27_1 + var_27_4
	local var_27_9 = var_27_2 + var_27_5
	local var_27_10 = arg_27_0.maxFleetNums - (var_27_1 + var_27_2) + var_27_6

	return var_27_7, var_27_8, var_27_9, var_27_10
end

return var_0_0
