local var_0_0 = class("MainCompatibleDataSequence")

function var_0_0.Execute(arg_1_0, arg_1_1)
	seriesAsync({
		function(arg_2_0)
			getProxy(IslandProxy):CheckAndRequest(arg_2_0)
		end,
		function(arg_3_0)
			arg_1_0:CheckSpecialDayForEducateChar(arg_3_0)
		end,
		function(arg_4_0)
			arg_1_0:FetchGameTrackingCache(arg_4_0)
		end
	}, arg_1_1)
end

function var_0_0.CheckSpecialDayForEducateChar(arg_5_0, arg_5_1)
	if LOCK_EDUCATE_SYSTEM then
		arg_5_1()

		return
	end

	local var_5_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_5_1, var_5_2, var_5_3 = ChineseCalendar.GetCurrYearMonthDay(var_5_0)
	local var_5_4 = getProxy(PlayerProxy):getRawData():ExistEducateChar()
	local var_5_5 = getProxy(SettingsProxy)

	if var_5_4 and var_5_5:GetFlagShipDisplayMode() ~= FlAG_SHIP_DISPLAY_ONLY_SHIP and not var_5_5:IsTipDay(var_5_1, var_5_2, var_5_3) and ChineseCalendar.AnySpecialDay(var_5_1, var_5_2, var_5_3) then
		local var_5_6, var_5_7 = PlayerVitaeShipsPage.GetSlotMaxCnt()
		local var_5_8 = var_5_7 + 1

		if var_5_8 and var_5_8 > 0 then
			var_5_5:setCurrentSecretaryIndex(var_5_8)
		end
	end

	arg_5_1()
end

function var_0_0.FetchGameTrackingCache(arg_6_0, arg_6_1)
	pg.GameTrackerMgr.GetInstance():FetchCache()
	arg_6_1()
end

return var_0_0
