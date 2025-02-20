local var_0_0 = class("NewEducateHelper")

function var_0_0.Config2Drop(arg_1_0)
	return {
		type = arg_1_0[1],
		id = arg_1_0[2],
		number = arg_1_0[3]
	}
end

function var_0_0.Config2Drops(arg_2_0)
	local var_2_0 = {}

	underscore.each(arg_2_0, function(arg_3_0)
		table.insert(var_2_0, var_0_0.Config2Drop(arg_3_0))
	end)

	return var_2_0
end

function var_0_0.Config2Condition(arg_4_0)
	return {
		type = arg_4_0[1],
		id = arg_4_0[2],
		operator = arg_4_0[3],
		number = arg_4_0[4]
	}
end

function var_0_0.Config2Conditions(arg_5_0)
	local var_5_0 = {}

	underscore.each(arg_5_0, function(arg_6_0)
		table.insert(var_5_0, var_0_0.Config2Condition(arg_6_0))
	end)

	return var_5_0
end

function var_0_0.GetDropConfig(arg_7_0)
	return switch(arg_7_0.type, {
		[NewEducateConst.DROP_TYPE.ATTR] = function()
			local var_8_0 = pg.child2_attr[arg_7_0.id]

			assert(var_8_0, "找不到child2_attr配置, id: " .. arg_7_0.id)

			return var_8_0
		end,
		[NewEducateConst.DROP_TYPE.RES] = function()
			local var_9_0 = pg.child2_resource[arg_7_0.id]

			assert(var_9_0, "找不到child2_resource配置, id: " .. arg_7_0.id)

			return var_9_0
		end,
		[NewEducateConst.DROP_TYPE.POLAROID] = function()
			local var_10_0 = pg.child2_polaroid[arg_7_0.id]

			assert(var_10_0, "child2_polaroid, id: " .. arg_7_0.id)

			return var_10_0
		end,
		[NewEducateConst.DROP_TYPE.BUFF] = function()
			local var_11_0 = pg.child2_benefit_list[arg_7_0.id]

			assert(var_11_0, "找不到child2_benefit_list配置, id: " .. arg_7_0.id)

			return var_11_0
		end
	}, function()
		assert(false, "养成二期非法掉落类型:" .. arg_7_0.type)
	end)
end

function var_0_0.UpdateVectorItem(arg_13_0, arg_13_1, arg_13_2)
	if arg_13_1.type ~= NewEducateConst.DROP_TYPE.ATTR and arg_13_1.type ~= NewEducateConst.DROP_TYPE.RES then
		pg.TipsMgr.GetInstance():ShowTips("不支持的掉落展示for Vector,请检查配置！" .. arg_13_1.type)

		return
	end

	local var_13_0 = arg_13_2 or ""
	local var_13_1 = var_0_0.GetDropConfig(arg_13_1)

	LoadImageSpriteAsync("neweducateicon/" .. var_13_1.icon, arg_13_0:Find("icon"))
	setText(arg_13_0:Find("name"), var_13_1.name)
	setText(arg_13_0:Find("value"), var_13_0 .. arg_13_1.number)

	if arg_13_0:Find("benefit") then
		setActive(arg_13_0:Find("benefit"), arg_13_1.isBenefit)
		setActive(arg_13_0:Find("benefit/add"), arg_13_1.number > 0)
		setActive(arg_13_0:Find("benefit/reduce"), arg_13_1.number < 0)
	end
end

function var_0_0.UpdateItem(arg_14_0, arg_14_1)
	local var_14_0 = var_0_0.GetDropConfig(arg_14_1)

	LoadImageSpriteAsync("neweducateicon/" .. var_14_0.item_icon, arg_14_0:Find("frame/icon"))
	setText(arg_14_0:Find("frame/count_bg/count"), "x" .. arg_14_1.number)
	setText(arg_14_0:Find("name_bg/name"), shortenString(var_14_0.name, 5))

	if arg_14_0:Find("frame/benefit") then
		setActive(arg_14_0:Find("frame/benefit"), arg_14_1.isBenefit)
	end
end

function var_0_0.NormalType2SiteType(arg_15_0)
	return switch(arg_15_0, {
		[NewEducateConst.SITE_NORMAL_TYPE.WORK] = function()
			return NewEducateConst.SITE_TYPE.WORK
		end,
		[NewEducateConst.SITE_NORMAL_TYPE.TRAVEL] = function()
			return NewEducateConst.SITE_TYPE.TRAVEL
		end
	})
end

function var_0_0.UpdateDropsData(arg_18_0)
	local var_18_0 = {}
	local var_18_1 = getProxy(NewEducateProxy)

	for iter_18_0, iter_18_1 in ipairs(arg_18_0) do
		switch(iter_18_1.type, {
			[NewEducateConst.DROP_TYPE.ATTR] = function()
				var_18_1:UpdateAttr(iter_18_1.id, iter_18_1.number)
				table.insert(var_18_0, iter_18_1)
			end,
			[NewEducateConst.DROP_TYPE.RES] = function()
				local var_20_0 = var_18_1:GetCurChar():GetRes(iter_18_1.id) + iter_18_1.number - pg.child2_resource[iter_18_1.id].max_value

				if var_20_0 > 0 then
					table.insert(var_18_0, setmetatable({
						overflow = var_20_0
					}, {
						__index = iter_18_1
					}))
				else
					table.insert(var_18_0, iter_18_1)
				end

				var_18_1:UpdateRes(iter_18_1.id, iter_18_1.number)
			end,
			[NewEducateConst.DROP_TYPE.POLAROID] = function()
				var_18_1:AddPolaroid(iter_18_1.id, iter_18_1.number)
				table.insert(var_18_0, iter_18_1)
			end,
			[NewEducateConst.DROP_TYPE.BUFF] = function()
				var_18_1:AddBuff(iter_18_1.id, iter_18_1.number)
				table.insert(var_18_0, iter_18_1)
			end
		})
	end

	return var_18_0
end

function var_0_0.MergeDrops(arg_23_0)
	local var_23_0 = {}

	underscore.each(arg_23_0.base_drop, function(arg_24_0)
		table.insert(var_23_0, arg_24_0)
	end)
	underscore.each(arg_23_0.benefit_drop, function(arg_25_0)
		table.insert(var_23_0, setmetatable({
			isBenefit = true
		}, {
			__index = arg_25_0
		}))
	end)

	return var_23_0
end

function var_0_0.FilterBenefit(arg_26_0)
	return underscore.select(arg_26_0, function(arg_27_0)
		return arg_27_0.type ~= NewEducateConst.DROP_TYPE.BUFF or arg_27_0.type == NewEducateConst.DROP_TYPE.BUFF and pg.child2_benefit_list[arg_27_0.id].is_show == 1 and arg_27_0.number > 0
	end)
end

function var_0_0.GetSiteColors(arg_28_0)
	local var_28_0 = pg.child2_site_display[arg_28_0]

	return switch(var_28_0.type, {
		[NewEducateConst.SITE_TYPE.WORK] = function()
			return Color.NewHex("f6bb56"), Color.NewHex("eea221")
		end,
		[NewEducateConst.SITE_TYPE.TRAVEL] = function()
			return Color.NewHex("f6bb56"), Color.NewHex("eea221")
		end,
		[NewEducateConst.SITE_TYPE.EVENT] = function()
			return Color.NewHex("887af2"), Color.NewHex("7668e2")
		end,
		[NewEducateConst.SITE_TYPE.SHIP] = function()
			if var_28_0.bg == "red" then
				return Color.NewHex("d96964"), Color.NewHex("d96964")
			elseif var_28_0.bg == "blue" then
				return Color.NewHex("39bfff"), Color.NewHex("26b1f3")
			end
		end
	})
end

function var_0_0.PlaySpecialStory(arg_33_0, arg_33_1)
	local var_33_0 = getProxy(NewEducateProxy):GetCurChar()
	local var_33_1 = var_33_0.id .. "_" .. var_33_0:GetPersonalityTag()
	local var_33_2 = not pg.NewStoryMgr.GetInstance():IsPlayed(arg_33_0)

	pg.NewStoryMgr.GetInstance():PlayForTb(arg_33_0, var_33_1, function(arg_34_0, arg_34_1)
		existCall(arg_33_1(arg_34_0, arg_34_1))
	end, true)

	if var_33_2 then
		getProxy(NewEducateProxy):UpdateUnlock()

		local var_33_3 = var_33_0:GetPermanentData():GetMemoryIdByName(arg_33_0)

		if var_33_3 then
			pg.m02:sendNotification(GAME.NEW_EDUCATE_TRACK, NewEducateTrackCommand.BuildDataMemory(var_33_0:GetGameCnt(), var_33_0:GetRoundData().round, var_33_3))
		end
	end
end

function var_0_0.PlaySpecialStoryList(arg_35_0, arg_35_1)
	local var_35_0 = {}

	for iter_35_0, iter_35_1 in ipairs(arg_35_0) do
		table.insert(var_35_0, function(arg_36_0)
			var_0_0.PlaySpecialStory(iter_35_1, arg_36_0)
		end)
	end

	seriesAsync(var_35_0, function()
		existCall(arg_35_1)
	end)
end

function var_0_0.IsPersonalDrop(arg_38_0)
	return arg_38_0.type == NewEducateConst.DROP_TYPE.ATTR and pg.child2_attr[arg_38_0.id].type == NewEducateChar.ATTR_TYPE.PERSONALITY
end

function var_0_0.GetBenefitValue(arg_39_0, arg_39_1)
	return math.max(0, math.floor(arg_39_0 * (1 + arg_39_1.ratio / 10000) + arg_39_1.value))
end

function var_0_0.GetNewTipKey()
	local var_40_0 = getProxy(PlayerProxy):getRawData().id
	local var_40_1 = pg.child2_data.all[#pg.child2_data.all]

	return NewEducateConst.NEW_EDUCATE_NEW_CHILD_TIP .. "_" .. var_40_0 .. "_" .. var_40_1
end

function var_0_0.IsShowNewChildTip()
	if LOCK_EDUCATE_SYSTEM or LOCK_NEW_EDUCATE_SYSTEM then
		return false
	end

	local var_41_0 = getProxy(PlayerProxy):getRawData()
	local var_41_1 = LOCK_NEW_EDUCATE_SYSTEM and "EducateMediator" or "NewEducateSelectMediator"

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_41_0.level, var_41_1) then
		return false
	end

	return PlayerPrefs.GetInt(var_0_0.GetNewTipKey()) ~= 1
end

function var_0_0.ClearShowNewChildTip()
	PlayerPrefs.SetInt(var_0_0.GetNewTipKey(), 1)
end

function var_0_0.ClearEventPerformance()
	local var_43_0 = getProxy(PlayerProxy):getRawData().id
	local var_43_1 = getProxy(NewEducateProxy):GetCurChar()
	local var_43_2 = NewEducateConst.NEW_EDUCATE_EVENT_TIP .. "_" .. var_43_0 .. "_" .. var_43_1.id .. "_" .. var_43_1:GetGameCnt() .. "_"
	local var_43_3 = underscore.select(pg.child2_site_event_group.all, function(arg_44_0)
		return #pg.child2_site_event_group[arg_44_0].performance > 0
	end)

	underscore.each(var_43_3, function(arg_45_0)
		PlayerPrefs.SetInt(var_43_2 .. arg_45_0, 0)
	end)
end

function var_0_0.TrackRoundEnd()
	local var_46_0 = getProxy(NewEducateProxy):GetCurChar()
	local var_46_1 = underscore.map(var_46_0:GetAttrIds(), function(arg_47_0)
		return var_46_0:GetAttr(arg_47_0)
	end) or {}
	local var_46_2, var_46_3 = var_46_0:GetBenefitData():GetAllIds()

	pg.m02:sendNotification(GAME.NEW_EDUCATE_TRACK, NewEducateTrackCommand.BuildDataRoundEnd(var_46_0.id, var_46_0:GetGameCnt(), var_46_0:GetRoundData().round, var_46_0:GetResByType(NewEducateChar.RES_TYPE.MOOD), var_46_0:GetResByType(NewEducateChar.RES_TYPE.MONEY), var_46_0:GetResByType(NewEducateChar.RES_TYPE.FAVOR), var_46_0:GetPersonality(), table.concat(var_46_1, ","), table.concat(var_46_2, ",") .. ";" .. table.concat(var_46_3, ",")))
end

function var_0_0.TrackEnterTime()
	if getProxy(NewEducateProxy):GetEnterTime() == 0 then
		getProxy(NewEducateProxy):RecordEnterTime()

		local var_48_0 = getProxy(NewEducateProxy):GetCurChar().id

		pg.m02:sendNotification(GAME.NEW_EDUCATE_TRACK, NewEducateTrackCommand.BuildDataEnter(var_48_0, 0))
	end
end

function var_0_0.TrackExitTime()
	local var_49_0 = getProxy(NewEducateProxy):GetEnterTime()

	if var_49_0 ~= 0 then
		local var_49_1 = pg.TimeMgr.GetInstance():GetServerTime() - var_49_0
		local var_49_2 = getProxy(NewEducateProxy):GetCurChar().id

		pg.m02:sendNotification(GAME.NEW_EDUCATE_TRACK, NewEducateTrackCommand.BuildDataEnter(var_49_2, 1, var_49_1))
		getProxy(NewEducateProxy):RecordEnterTime(0)
	end
end

function var_0_0.GetAllUnlockSecretaryIds()
	local var_50_0 = getProxy(EducateProxy):GetSecretaryIDs() or {}

	if not LOCK_NEW_EDUCATE_SYSTEM then
		local var_50_1 = getProxy(NewEducateProxy)

		for iter_50_0, iter_50_1 in ipairs(pg.child2_data.all) do
			if var_50_1:GetChar(iter_50_1) and var_50_1:GetChar(iter_50_1):GetPermanentData() then
				local var_50_2 = var_50_1:GetChar(iter_50_1):GetPermanentData():GetUnlockSecretaryIds()

				var_50_0 = table.mergeArray(var_50_0, var_50_2)
			end
		end
	end

	return var_50_0
end

function var_0_0.GetEducateCharacterList()
	local var_51_0 = {}

	for iter_51_0, iter_51_1 in pairs(pg.secretary_special_ship.get_id_list_by_character_id) do
		if not LOCK_NEW_EDUCATE_SYSTEM or iter_51_0 == 1000 then
			table.insert(var_51_0, EducateCharCharacter.New(iter_51_0))
		end
	end

	return var_51_0
end

function var_0_0.GetSecIdBySkinId(arg_52_0)
	for iter_52_0, iter_52_1 in ipairs(pg.secretary_special_ship.all) do
		if pg.secretary_special_ship[iter_52_1].unlock_type == EducateConst.SECRETARY_UNLCOK_TYPE_SHOP and pg.secretary_special_ship[iter_52_1].unlock[1] == arg_52_0 then
			return iter_52_1
		end
	end
end

function var_0_0.GetShipNameBySecId(arg_53_0)
	return pg.secretary_special_ship[arg_53_0].name
end

function var_0_0.IsUnlockDefaultShip(arg_54_0)
	local var_54_0 = pg.secretary_special_ship[arg_54_0].character_id
	local var_54_1 = var_0_0.GetAllUnlockSecretaryIds()

	return table.contains(var_54_1, var_54_0)
end

function var_0_0.HasAnyUnlockShip()
	local var_55_0 = var_0_0.GetAllUnlockSecretaryIds()

	if not var_55_0 then
		return false
	end

	return _.any(var_55_0, function(arg_56_0)
		return pg.secretary_special_ship[arg_56_0].character_id == arg_56_0
	end)
end

function var_0_0.UpdateUnlockBySkinId(arg_57_0)
	local var_57_0 = var_0_0.GetSecIdBySkinId(arg_57_0)
	local var_57_1 = pg.secretary_special_ship[var_57_0].tb_id

	if var_57_1 == 0 then
		getProxy(EducateProxy):updateSecretaryIDs(true)
	else
		getProxy(NewEducateProxy):UpdateUnlock(var_57_1)
	end
end

function var_0_0.GetEducateCharSlotMaxCnt()
	if LOCK_EDUCATE_SYSTEM then
		return 0
	end

	if getProxy(PlayerProxy):getRawData():ExistEducateChar() or var_0_0.HasAnyUnlockShip() then
		return 1
	else
		return 0
	end
end

return var_0_0
