local var_0_0 = class("EducateProxy", import(".NetProxy"))

var_0_0.RESOURCE_UPDATED = "EducateProxy.RESOURCE_UPDATED"
var_0_0.ATTR_UPDATED = "EducateProxy.ATTR_UPDATED"
var_0_0.TIME_UPDATED = "EducateProxy.TIME_UPDATED"
var_0_0.TIME_WEEKDAY_UPDATED = "EducateProxy.TIME_WEEKDAY_UPDATED"
var_0_0.BUFF_ADDED = "EducateProxy.BUFF_ADDED"
var_0_0.OPTION_UPDATED = "EducateProxy.OPTION_UPDATED"
var_0_0.ENDING_ADDED = "EducateProxy.ENDING_ADDED"
var_0_0.ITEM_ADDED = "EducateProxy.ITEM_ADDED"
var_0_0.POLAROID_ADDED = "EducateProxy.POLAROID_ADDED"
var_0_0.MEMORY_ADDED = "EducateProxy.MEMORY_ADDED"
var_0_0.UNLCOK_NEW_SECRETARY_BY_CNT = "EducateProxy.UNLCOK_NEW_SECRETARY_BY_CNT"
var_0_0.GUIDE_CHECK = "EducateProxy.GUIDE_CHECK"
var_0_0.MAIN_SCENE_ADD_LAYER = "EducateProxy.MAIN_SCENE_ADD_LAYER"
var_0_0.CLEAR_NEW_TIP = "EducateProxy.CLEAR_NEW_TIP"

function var_0_0.register(arg_1_0)
	arg_1_0.planProxy = EducatePlanProxy.New(arg_1_0)
	arg_1_0.eventProxy = EducateEventProxy.New(arg_1_0)
	arg_1_0.shopProxy = EducateShopProxy.New(arg_1_0)
	arg_1_0.taskProxy = EducateTaskProxy.New(arg_1_0)
	arg_1_0.endTime = pg.gameset.child_end_data.description

	arg_1_0:on(27021, function(arg_2_0)
		for iter_2_0, iter_2_1 in ipairs(arg_2_0.tasks) do
			arg_1_0.taskProxy:AddTask(iter_2_1)
		end
	end)
	arg_1_0:on(27022, function(arg_3_0)
		for iter_3_0, iter_3_1 in ipairs(arg_3_0.ids) do
			arg_1_0.taskProxy:RemoveTaskById(iter_3_1)
		end
	end)
	arg_1_0:on(27025, function(arg_4_0)
		for iter_4_0, iter_4_1 in ipairs(arg_4_0.tasks) do
			arg_1_0.taskProxy:UpdateTask(iter_4_1)
		end
	end)
end

function var_0_0.initData(arg_5_0, arg_5_1)
	arg_5_0:sendNotification(GAME.EDUCATE_GET_ENDINGS)

	local var_5_0 = arg_5_1.child

	arg_5_0.exsitEnding = var_5_0.is_ending == 1 or false
	arg_5_0.gameCount = var_5_0.new_game_plus_count
	arg_5_0.curTime = var_5_0.cur_time or {
		week = 1,
		month = 3,
		day = 7
	}
	arg_5_0.char = EducateChar.New(var_5_0)

	arg_5_0.eventProxy:SetUp({
		waitTriggerEventIds = var_5_0.home_events,
		needRequestHomeEvents = var_5_0.can_trigger_home_event == 1 or false,
		finishSpecEventIds = var_5_0.spec_events
	})
	arg_5_0.planProxy:SetUp({
		history = var_5_0.plan_history,
		selectedPlans = var_5_0.plans
	})
	arg_5_0.shopProxy:SetUp({
		shops = var_5_0.shop,
		discountEventIds = var_5_0.discount_event_id
	})
	arg_5_0.taskProxy:SetUp({
		targetId = var_5_0.target,
		tasks = var_5_0.tasks,
		finishMindTaskIds = var_5_0.realized_wish,
		isGotTargetAward = var_5_0.had_target_stage_award == 1 or false
	})
	arg_5_0:initItems(var_5_0.items)
	arg_5_0:initPolaroids(var_5_0.polaroids)

	arg_5_0.memories = var_5_0.memorys

	arg_5_0:initBuffs(var_5_0.buffs)
	arg_5_0:initOptions(var_5_0.option_records)

	arg_5_0.siteRandomOpts = nil

	arg_5_0:UpdateGameStatus()
	arg_5_0:initVirtualStage()
	arg_5_0:initUnlockSecretary(var_5_0.is_special_secretary_valid == 1)

	arg_5_0.requestDataEnd = true
end

function var_0_0.CheckDataRequestEnd(arg_6_0)
	return arg_6_0.requestDataEnd
end

function var_0_0.initItems(arg_7_0, arg_7_1)
	arg_7_0.itemData = {}

	for iter_7_0, iter_7_1 in ipairs(arg_7_1) do
		arg_7_0.itemData[iter_7_1.id] = EducateItem.New(iter_7_1)
	end
end

function var_0_0.initOptions(arg_8_0, arg_8_1)
	local var_8_0 = {}

	for iter_8_0, iter_8_1 in ipairs(arg_8_1) do
		var_8_0[iter_8_1.id] = iter_8_1.count
	end

	arg_8_0.siteOptionData = {}

	for iter_8_2, iter_8_3 in ipairs(pg.child_site_option.all) do
		local var_8_1 = EducateSiteOption.New(iter_8_3, var_8_0[iter_8_3])

		arg_8_0.siteOptionData[iter_8_3] = var_8_1
	end
end

function var_0_0.initRandomOpts(arg_9_0, arg_9_1)
	arg_9_0.siteRandomOpts = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_1) do
		arg_9_0.siteRandomOpts[iter_9_1.site_id] = iter_9_1.option_ids
	end
end

function var_0_0.NeedRequestOptsData(arg_10_0)
	return not arg_10_0.siteRandomOpts
end

function var_0_0.initBuffs(arg_11_0, arg_11_1)
	arg_11_0.buffData = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_1) do
		arg_11_0.buffData[iter_11_1.id] = EducateBuff.New(iter_11_1)
	end
end

function var_0_0.initPolaroids(arg_12_0, arg_12_1)
	arg_12_0.polaroidData = {}

	for iter_12_0, iter_12_1 in ipairs(arg_12_1) do
		arg_12_0.polaroidData[iter_12_1.id] = EducatePolaroid.New(iter_12_1)
	end
end

function var_0_0.SetEndings(arg_13_0, arg_13_1)
	arg_13_0.endings = arg_13_1

	arg_13_0:updateSecretaryIDs(false)
end

function var_0_0.GetSelectInfo(arg_14_0)
	local var_14_0 = EducateHelper.GetShowMonthNumber(arg_14_0.curTime.month) .. i18n("word_month") .. i18n("word_which_week", arg_14_0.curTime.week)

	return {
		bg = arg_14_0.char:GetBGName(),
		name = arg_14_0.char:GetName(),
		gameCnt = arg_14_0.gameCount,
		progressStr = arg_14_0.isUnlockSecretary and var_14_0 or i18n("child2_not_start")
	}
end

function var_0_0.IsFirstGame(arg_15_0)
	return arg_15_0.gameCount == 1
end

function var_0_0.UpdateGameStatus(arg_16_0)
	arg_16_0.gameStatus = EducateConst.STATUES_NORMAL

	if arg_16_0.exsitEnding then
		arg_16_0.gameStatus = EducateConst.STATUES_RESET
	elseif arg_16_0:IsEndingTime() then
		arg_16_0.gameStatus = EducateConst.STATUES_ENDING
	elseif arg_16_0.taskProxy:CheckTargetSet() then
		arg_16_0.gameStatus = EducateConst.STATUES_PREPARE
	end
end

function var_0_0.GetGameStatus(arg_17_0)
	return arg_17_0.gameStatus
end

function var_0_0.initVirtualStage(arg_18_0)
	local var_18_0 = getProxy(EducateProxy):GetTaskProxy():GetTargetId()
	local var_18_1 = arg_18_0.char:GetStage()

	if var_18_0 ~= 0 and pg.child_target_set[var_18_0].stage == var_18_1 + 1 then
		arg_18_0.isVirtualStage = true
	else
		arg_18_0.isVirtualStage = false
	end
end

function var_0_0.SetVirtualStage(arg_19_0, arg_19_1)
	arg_19_0.isVirtualStage = arg_19_1
end

function var_0_0.InVirtualStage(arg_20_0)
	return arg_20_0.isVirtualStage
end

function var_0_0.Reset(arg_21_0, arg_21_1)
	EducateTipHelper.ClearAllRecord()
	arg_21_0:GetPlanProxy():ClearLocalPlansData()
	arg_21_0:sendNotification(GAME.EDUCATE_REQUEST, {
		callback = arg_21_1
	})
end

function var_0_0.Refresh(arg_22_0, arg_22_1)
	EducateTipHelper.ClearAllRecord()
	arg_22_0:GetPlanProxy():ClearLocalPlansData()
	arg_22_0:sendNotification(GAME.EDUCATE_REQUEST, {
		callback = arg_22_1
	})
end

function var_0_0.GetCurTime(arg_23_0)
	return arg_23_0.curTime
end

function var_0_0.UpdateTime(arg_24_0)
	arg_24_0.curTime.week = arg_24_0.curTime.week + 1

	if arg_24_0.curTime.week > 4 then
		arg_24_0.curTime.week = 1
		arg_24_0.curTime.month = arg_24_0.curTime.month + 1
	end
end

function var_0_0.OnNextWeek(arg_25_0)
	arg_25_0:SetVirtualStage(false)
	arg_25_0:UpdateTime()
	arg_25_0.char:OnNewWeek(arg_25_0.curTime)
	arg_25_0.planProxy:OnNewWeek(arg_25_0.curTime)
	arg_25_0.eventProxy:OnNewWeek(arg_25_0.curTime)
	arg_25_0.shopProxy:OnNewWeek(arg_25_0.curTime)
	arg_25_0.taskProxy:OnNewWeek(arg_25_0.curTime)
	arg_25_0:RefreshBuffs()
	arg_25_0:RefreshOptions()

	arg_25_0.siteRandomOpts = nil

	arg_25_0:UpdateGameStatus()
	arg_25_0:sendNotification(var_0_0.TIME_UPDATED)
end

function var_0_0.GetCharData(arg_26_0)
	return arg_26_0.char
end

function var_0_0.GetPersonalityId(arg_27_0)
	return arg_27_0.char:GetPersonalityId()
end

function var_0_0.UpdateRes(arg_28_0, arg_28_1, arg_28_2)
	arg_28_0.char:UpdateRes(arg_28_1, arg_28_2)
	arg_28_0:sendNotification(var_0_0.RESOURCE_UPDATED)
end

function var_0_0.ReduceResForPlans(arg_29_0)
	local var_29_0, var_29_1 = arg_29_0.planProxy:GetCost()

	arg_29_0:UpdateRes(EducateChar.RES_MONEY_ID, -var_29_0)
	arg_29_0:UpdateRes(EducateChar.RES_MOOD_ID, -var_29_1)
end

function var_0_0.ReduceResForCosts(arg_30_0, arg_30_1)
	for iter_30_0, iter_30_1 in ipairs(arg_30_1) do
		arg_30_0:UpdateRes(iter_30_1.id, -iter_30_1.num)
	end
end

function var_0_0.UpdateAttr(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0.char:UpdateAttr(arg_31_1, arg_31_2)
	arg_31_0:sendNotification(var_0_0.ATTR_UPDATED)
end

function var_0_0.CheckExtraAttr(arg_32_0)
	return arg_32_0.char:CheckExtraAttrAdd()
end

function var_0_0.AddExtraAttr(arg_33_0, arg_33_1)
	arg_33_0:UpdateAttr(arg_33_1, arg_33_0.char:getConfig("attr_2_add"))
	arg_33_0.char:SetIsAddedExtraAttr(true)
end

function var_0_0.GetPlanProxy(arg_34_0)
	return arg_34_0.planProxy
end

function var_0_0.GetEventProxy(arg_35_0)
	return arg_35_0.eventProxy
end

function var_0_0.GetShopProxy(arg_36_0)
	return arg_36_0.shopProxy
end

function var_0_0.GetTaskProxy(arg_37_0)
	return arg_37_0.taskProxy
end

function var_0_0.GetFinishEndings(arg_38_0)
	return arg_38_0.endings
end

function var_0_0.AddEnding(arg_39_0, arg_39_1)
	arg_39_0.exsitEnding = true

	arg_39_0:UpdateGameStatus()

	if table.contains(arg_39_0.endings, arg_39_1) then
		return
	end

	table.insert(arg_39_0.endings, arg_39_1)
	arg_39_0:updateSecretaryIDs(true)
	arg_39_0:sendNotification(var_0_0.ENDING_ADDED)
end

function var_0_0.IsEndingTime(arg_40_0)
	local var_40_0 = arg_40_0:GetCurTime()

	if var_40_0.month >= arg_40_0.endTime[1] and var_40_0.week >= arg_40_0.endTime[2] and var_40_0.day >= arg_40_0.endTime[3] then
		return true
	end

	return false
end

function var_0_0.GetEndingResult(arg_41_0)
	local var_41_0 = underscore.detect(pg.child_ending.all, function(arg_42_0)
		local var_42_0 = pg.child_ending[arg_42_0].condition

		return arg_41_0.char:CheckEndCondition(var_42_0)
	end)

	assert(var_41_0, "not matching ending")

	return var_41_0
end

function var_0_0.GetBuffData(arg_43_0)
	return arg_43_0.buffData
end

function var_0_0.GetBuffList(arg_44_0)
	local var_44_0 = {}

	for iter_44_0, iter_44_1 in pairs(arg_44_0.buffData) do
		table.insert(var_44_0, iter_44_1)
	end

	return var_44_0
end

function var_0_0.AddBuff(arg_45_0, arg_45_1)
	if arg_45_0.buffData[arg_45_1] then
		arg_45_0.buffData[arg_45_1]:ResetEndTime()
	else
		arg_45_0.buffData[arg_45_1] = EducateBuff.New({
			id = arg_45_1
		})
	end

	arg_45_0:sendNotification(var_0_0.BUFF_ADDED)
end

function var_0_0.RefreshBuffs(arg_46_0)
	for iter_46_0, iter_46_1 in pairs(arg_46_0.buffData) do
		if iter_46_1:IsEnd() then
			arg_46_0.buffData[iter_46_1.id] = nil
		end
	end
end

function var_0_0.GetAttrBuffEffects(arg_47_0, arg_47_1)
	local var_47_0 = {}

	for iter_47_0, iter_47_1 in pairs(arg_47_0.buffData) do
		if iter_47_1:IsAttrType() and iter_47_1:IsId(arg_47_1) then
			table.insert(var_47_0, iter_47_1)
		end
	end

	return EducateBuff.GetBuffEffects(var_47_0)
end

function var_0_0.GetResBuffEffects(arg_48_0, arg_48_1)
	local var_48_0 = {}

	for iter_48_0, iter_48_1 in pairs(arg_48_0.buffData) do
		if iter_48_1:IsResType() and iter_48_1:IsId(arg_48_1) then
			table.insert(var_48_0, iter_48_1)
		end
	end

	return EducateBuff.GetBuffEffects(var_48_0)
end

function var_0_0.GetOptionById(arg_49_0, arg_49_1)
	return arg_49_0.siteOptionData[arg_49_1]
end

function var_0_0.UpdateOptionData(arg_50_0, arg_50_1)
	arg_50_0.siteOptionData[arg_50_1.id] = arg_50_1

	arg_50_0:sendNotification(var_0_0.OPTION_UPDATED)
end

function var_0_0.RefreshOptions(arg_51_0)
	local var_51_0 = arg_51_0:GetCurTime()

	for iter_51_0, iter_51_1 in pairs(arg_51_0.siteOptionData) do
		iter_51_1:OnWeekUpdate(var_51_0)
	end
end

function var_0_0.GetShowSiteIds(arg_52_0)
	return underscore.select(pg.child_site.all, function(arg_53_0)
		return pg.child_site[arg_53_0].type == 1 and EducateHelper.IsSiteUnlock(arg_53_0, arg_52_0:IsFirstGame())
	end)
end

function var_0_0.GetOptionsBySiteId(arg_54_0, arg_54_1)
	local var_54_0 = pg.child_site[arg_54_1].option
	local var_54_1 = arg_54_0:GetCurTime()
	local var_54_2 = {}
	local var_54_3 = {}

	underscore.each(var_54_0, function(arg_55_0)
		local var_55_0 = arg_54_0.siteOptionData[arg_55_0]

		if var_55_0 and var_55_0:IsShow(var_54_1) then
			if var_55_0:IsReplace() then
				var_54_3[var_55_0:getConfig("replace")] = var_55_0
			else
				table.insert(var_54_2, var_55_0)
			end
		end
	end)
	underscore.each(var_54_2, function(arg_56_0)
		if var_54_3[arg_56_0.id] then
			table.removebyvalue(var_54_2, arg_56_0)
			table.insert(var_54_2, var_54_3[arg_56_0.id])
		end
	end)

	local var_54_4 = arg_54_0.siteRandomOpts and arg_54_0.siteRandomOpts[arg_54_1] or {}

	underscore.each(var_54_4, function(arg_57_0)
		local var_57_0 = arg_54_0.siteOptionData[arg_57_0]

		if var_57_0:IsShow(var_54_1) then
			table.insert(var_54_2, var_57_0)
		end
	end)
	table.sort(var_54_2, CompareFuncs({
		function(arg_58_0)
			return arg_58_0:getConfig("order")
		end,
		function(arg_59_0)
			return arg_59_0.id
		end
	}))

	return var_54_2
end

function var_0_0.GetItemData(arg_60_0)
	return arg_60_0.itemData
end

function var_0_0.GetItemList(arg_61_0)
	local var_61_0 = {}

	for iter_61_0, iter_61_1 in pairs(arg_61_0.itemData) do
		table.insert(var_61_0, iter_61_1)
	end

	return var_61_0
end

function var_0_0.AddItem(arg_62_0, arg_62_1, arg_62_2)
	if arg_62_0.itemData[arg_62_1] then
		arg_62_0.itemData[arg_62_1]:AddCount(arg_62_2)
	else
		arg_62_0.itemData[arg_62_1] = EducateItem.New({
			id = arg_62_1,
			num = arg_62_2
		})
	end

	arg_62_0:sendNotification(var_0_0.ITEM_ADDED)
end

function var_0_0.GetItemCntById(arg_63_0, arg_63_1)
	return arg_63_0.itemData[arg_63_1] and arg_63_0.itemData[arg_63_1].count or 0
end

function var_0_0.GetPolaroidData(arg_64_0)
	return arg_64_0.polaroidData
end

function var_0_0.GetPolaroidList(arg_65_0)
	local var_65_0 = {}

	for iter_65_0, iter_65_1 in pairs(arg_65_0.polaroidData) do
		table.insert(var_65_0, iter_65_1)
	end

	return var_65_0
end

function var_0_0.GetPolaroidIdList(arg_66_0)
	local var_66_0 = {}

	for iter_66_0, iter_66_1 in pairs(arg_66_0.polaroidData) do
		table.insert(var_66_0, iter_66_0)
	end

	return var_66_0
end

function var_0_0.AddPolaroid(arg_67_0, arg_67_1)
	if arg_67_0.polaroidData[arg_67_1] then
		return
	end

	arg_67_0.polaroidData[arg_67_1] = EducatePolaroid.New({
		id = arg_67_1,
		time = arg_67_0:GetCurTime()
	})

	EducateTipHelper.SetNewTip(EducateTipHelper.NEW_POLAROID)
	arg_67_0:updateSecretaryIDs(true)
	arg_67_0:sendNotification(var_0_0.POLAROID_ADDED)
end

function var_0_0.IsExistPolaroidByGroup(arg_68_0, arg_68_1)
	local var_68_0 = pg.child_polaroid.get_id_list_by_group[arg_68_1]

	return underscore.any(var_68_0, function(arg_69_0)
		return arg_68_0.polaroidData[arg_69_0]
	end)
end

function var_0_0.CanGetPolaroidByGroup(arg_70_0, arg_70_1)
	local var_70_0 = pg.child_polaroid.get_id_list_by_group[arg_70_1]

	return underscore.any(var_70_0, function(arg_71_0)
		return arg_70_0:CanGetPolaroidById(arg_71_0)
	end)
end

function var_0_0.CanGetPolaroidById(arg_72_0, arg_72_1)
	local var_72_0 = arg_72_0.char:GetStage()
	local var_72_1 = arg_72_0:GetPersonalityId()
	local var_72_2 = pg.child_polaroid[arg_72_1]

	if table.contains(var_72_2.stage, var_72_0) then
		if var_72_2.xingge == "" then
			return true
		end

		return table.contains(var_72_2.xingge, var_72_1)
	end

	return false
end

function var_0_0.GetPolaroidGroupCnt(arg_73_0)
	local var_73_0 = 0
	local var_73_1 = 0

	for iter_73_0, iter_73_1 in pairs(pg.child_polaroid.get_id_list_by_group) do
		if arg_73_0:IsExistPolaroidByGroup(iter_73_0) then
			var_73_0 = var_73_0 + 1
		end

		var_73_1 = var_73_1 + 1
	end

	return var_73_0, var_73_1
end

function var_0_0.GetMemories(arg_74_0)
	return arg_74_0.memories
end

function var_0_0.AddMemory(arg_75_0, arg_75_1)
	if table.contains(arg_75_0.memories, arg_75_1) then
		return
	end

	table.insert(arg_75_0.memories, arg_75_1)
	EducateTipHelper.SetNewTip(EducateTipHelper.NEW_MEMORY, arg_75_1)
	arg_75_0:sendNotification(var_0_0.MEMORY_ADDED)
end

function var_0_0.CheckGuide(arg_76_0, arg_76_1)
	arg_76_0:sendNotification(var_0_0.GUIDE_CHECK, {
		view = arg_76_1
	})
end

function var_0_0.MainAddLayer(arg_77_0, arg_77_1)
	arg_77_0:sendNotification(var_0_0.MAIN_SCENE_ADD_LAYER, arg_77_1)
end

function var_0_0.initUnlockSecretary(arg_78_0, arg_78_1)
	arg_78_0.isUnlockSecretary = arg_78_1
	arg_78_0.unlockSecretaryTaskId = (function()
		for iter_79_0, iter_79_1 in ipairs(pg.secretary_special_ship.all) do
			if pg.secretary_special_ship[iter_79_1].unlock_type == EducateConst.SECRETARY_UNLCOK_TYPE_DEFAULT then
				return pg.secretary_special_ship[iter_79_1].unlock[1]
			end
		end
	end)()
	arg_78_0.unlcokTipByPolaroidCnt = {}

	for iter_78_0, iter_78_1 in ipairs(pg.secretary_special_ship.all) do
		local var_78_0 = pg.secretary_special_ship[iter_78_1]

		if var_78_0.unlock_type == EducateConst.SECRETARY_UNLCOK_TYPE_POLAROID then
			local var_78_1 = var_78_0.unlock[1]

			if not table.contains(arg_78_0.unlcokTipByPolaroidCnt, var_78_1) then
				table.insert(arg_78_0.unlcokTipByPolaroidCnt, var_78_1)
			end
		end
	end
end

function var_0_0.GetUnlockSecretaryTaskId(arg_80_0)
	return arg_80_0.unlockSecretaryTaskId
end

function var_0_0.SetSecretaryUnlock(arg_81_0)
	arg_81_0.isUnlockSecretary = true

	arg_81_0:updateSecretaryIDs(false)
end

function var_0_0.CheckNewSecretaryTip(arg_82_0)
	local var_82_0 = arg_82_0:GetPolaroidGroupCnt()

	if table.contains(arg_82_0.unlcokTipByPolaroidCnt, var_82_0) then
		arg_82_0:updateSecretaryIDs(false)
		arg_82_0:sendNotification(var_0_0.UNLCOK_NEW_SECRETARY_BY_CNT)

		return true
	end

	return false
end

function var_0_0.checkSecretaryID(arg_83_0, arg_83_1, arg_83_2)
	if arg_83_2 == "or" then
		for iter_83_0, iter_83_1 in ipairs(arg_83_1) do
			if table.contains(arg_83_0.endings, iter_83_1[1]) then
				return true
			end
		end

		return false
	elseif arg_83_2 == "and" then
		for iter_83_2, iter_83_3 in ipairs(arg_83_1) do
			if not table.contains(arg_83_0.endings, iter_83_3) then
				return false
			end

			return true
		end
	end

	return false
end

function var_0_0.updateSecretaryIDs(arg_84_0, arg_84_1)
	if not arg_84_0:IsUnlockSecretary() then
		arg_84_0.unlockSecretaryIds = {}

		return
	end

	local var_84_0

	if arg_84_1 then
		var_84_0 = Clone(NewEducateHelper.GetAllUnlockSecretaryIds())
	end

	arg_84_0.unlockSecretaryIds = {}

	local var_84_1 = #arg_84_0:GetPolaroidIdList()

	for iter_84_0, iter_84_1 in ipairs(pg.secretary_special_ship.get_id_list_by_tb_id[0]) do
		local var_84_2 = pg.secretary_special_ship[iter_84_1].unlock_type
		local var_84_3 = pg.secretary_special_ship[iter_84_1].unlock

		switch(var_84_2, {
			[EducateConst.SECRETARY_UNLCOK_TYPE_DEFAULT] = function()
				if arg_84_0:IsUnlockSecretary() then
					table.insert(arg_84_0.unlockSecretaryIds, iter_84_1)
				end
			end,
			[EducateConst.SECRETARY_UNLCOK_TYPE_POLAROID] = function()
				if var_84_3[1] and var_84_1 >= var_84_3[1] then
					table.insert(arg_84_0.unlockSecretaryIds, iter_84_1)
				end
			end,
			[EducateConst.SECRETARY_UNLCOK_TYPE_ENDING] = function()
				if var_84_3[1] then
					if type(var_84_3[1]) == "table" then
						if arg_84_0:checkSecretaryID(var_84_3, "or") then
							table.insert(arg_84_0.unlockSecretaryIds, iter_84_1)
						end
					elseif type(var_84_3[1]) == "number" and arg_84_0:checkSecretaryID(var_84_3, "and") then
						table.insert(arg_84_0.unlockSecretaryIds, iter_84_1)
					end
				end
			end,
			[EducateConst.SECRETARY_UNLCOK_TYPE_SHOP] = function()
				if var_84_3[1] and getProxy(ShipSkinProxy):hasSkin(var_84_3[1]) then
					table.insert(arg_84_0.unlockSecretaryIds, iter_84_1)
				end
			end,
			[EducateConst.SECRETARY_UNLCOK_TYPE_STORY] = function()
				return
			end
		})
	end

	if arg_84_1 then
		getProxy(SettingsProxy):UpdateEducateCharTip(var_84_0)
	end
end

function var_0_0.GetEducateGroupList(arg_90_0)
	local var_90_0 = {}

	for iter_90_0, iter_90_1 in pairs(pg.secretary_special_ship.get_id_list_by_group) do
		table.insert(var_90_0, EducateCharGroup.New(iter_90_0))
	end

	return var_90_0
end

function var_0_0.GetStoryInfo(arg_91_0)
	return arg_91_0.char:GetPaintingName(), arg_91_0.char:GetCallName(), arg_91_0.char:GetBGName()
end

function var_0_0.GetSecretaryIDs(arg_92_0)
	return arg_92_0.unlockSecretaryIds
end

function var_0_0.GetPolaroidCnt(arg_93_0)
	return #arg_93_0:GetPolaroidIdList()
end

function var_0_0.IsUnlockSecretary(arg_94_0)
	return arg_94_0.isUnlockSecretary
end

function var_0_0.remove(arg_95_0)
	return
end

return var_0_0
