local var_0_0 = class("Task", import("..BaseVO"))

var_0_0.TYPE_SCENARIO = 1
var_0_0.TYPE_BRANCH = 2
var_0_0.TYPE_ROUTINE = 3
var_0_0.TYPE_WEEKLY = 4
var_0_0.TYPE_HIDDEN = 5
var_0_0.TYPE_ACTIVITY = 6
var_0_0.TYPE_ACTIVITY_ROUTINE = 36
var_0_0.TYPE_ACTIVITY_BRANCH = 26
var_0_0.TYPE_GUILD_WEEKLY = 12
var_0_0.TYPE_NEW_WEEKLY = 13
var_0_0.TYPE_REFLUX = 15
var_0_0.TYPE_ACTIVITY_REPEAT = 16
var_0_0.TYPE_ACTIVITY_WEEKLY = 46
var_0_0.TYPE_COMMANDER_MANUAL = 17

local var_0_1 = {
	"scenario",
	"branch",
	"routine",
	"weekly"
}

var_0_0.TASK_PROGRESS_UPDATE = 0
var_0_0.TASK_PROGRESS_APPEND = 1

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_1.id
	arg_1_0.progress = arg_1_1.progress or 0
	arg_1_0.acceptTime = arg_1_1.accept_time
	arg_1_0.submitTime = arg_1_1.submit_time or 0
	arg_1_0._actId = nil
	arg_1_0._autoSubmit = false
end

function var_0_0.isClientTrigger(arg_2_0)
	return arg_2_0:getConfig("sub_type") > 2000 and arg_2_0:getConfig("sub_type") < 3000
end

function var_0_0.bindConfigTable(arg_3_0)
	return pg.task_data_template
end

function var_0_0.isGuildTask(arg_4_0)
	return arg_4_0:getConfig("type") == var_0_0.TYPE_GUILD_WEEKLY
end

function var_0_0.IsRoutineType(arg_5_0)
	return arg_5_0:getConfig("type") == var_0_0.TYPE_ROUTINE
end

function var_0_0.IsActRoutineType(arg_6_0)
	return arg_6_0:getConfig("type") == var_0_0.TYPE_ACTIVITY_ROUTINE
end

function var_0_0.IsActType(arg_7_0)
	return arg_7_0:getConfig("type") == var_0_0.TYPE_ACTIVITY
end

function var_0_0.IsWeeklyType(arg_8_0)
	return arg_8_0:getConfig("type") == var_0_0.TYPE_WEEKLY or arg_8_0:getConfig("type") == var_0_0.TYPE_NEW_WEEKLY
end

function var_0_0.IsBackYardInterActionType(arg_9_0)
	return arg_9_0:getConfig("sub_type") == 2010
end

function var_0_0.IsFlagShipInterActionType(arg_10_0)
	return arg_10_0:getConfig("sub_type") == 2011
end

function var_0_0.IsGuildAddLivnessType(arg_11_0)
	local var_11_0 = arg_11_0:getConfig("type")

	return var_11_0 == var_0_0.TYPE_ROUTINE or var_11_0 == var_0_0.TYPE_WEEKLY or var_11_0 == var_0_0.TYPE_GUILD_WEEKLY or var_11_0 == var_0_0.TYPE_NEW_WEEKLY
end

function var_0_0.IsCommanderManualType(arg_12_0)
	return arg_12_0:getConfig("type") == var_0_0.TYPE_COMMANDER_MANUAL
end

function var_0_0.isLock(arg_13_0)
	return getProxy(PlayerProxy):getRawData().level < arg_13_0:getConfig("level")
end

function var_0_0.isFinish(arg_14_0)
	return arg_14_0:getProgress() >= arg_14_0:getConfig("target_num")
end

function var_0_0.getProgress(arg_15_0)
	local var_15_0 = arg_15_0.progress

	if arg_15_0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
		local var_15_1 = tonumber(arg_15_0:getConfig("target_id"))

		var_15_0 = getProxy(BagProxy):getItemCountById(tonumber(var_15_1))
	elseif arg_15_0:getConfig("sub_type") == TASK_SUB_TYPE_PT then
		local var_15_2 = getProxy(ActivityProxy):getActivityById(tonumber(arg_15_0:getConfig("target_id_2")))

		var_15_0 = var_15_2 and var_15_2.data1 or 0
	elseif arg_15_0:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
		local var_15_3 = tonumber(arg_15_0:getConfig("target_id"))

		var_15_0 = getProxy(PlayerProxy):getData():getResById(var_15_3)
	elseif arg_15_0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
		local var_15_4 = tonumber(arg_15_0:getConfig("target_id"))

		var_15_0 = getProxy(ActivityProxy):getVirtualItemNumber(var_15_4)
	elseif arg_15_0:getConfig("sub_type") == TASK_SUB_TYPE_BOSS_PT then
		local var_15_5 = tonumber(arg_15_0:getConfig("target_id"))

		var_15_0 = getProxy(PlayerProxy):getData():getResById(var_15_5)
	elseif arg_15_0:getConfig("sub_type") == TASK_SUB_STROY then
		local var_15_6 = arg_15_0:getConfig("target_id")
		local var_15_7 = 0

		_.each(var_15_6, function(arg_16_0)
			if pg.NewStoryMgr.GetInstance():GetPlayedFlag(arg_16_0) then
				var_15_7 = var_15_7 + 1
			end
		end)

		var_15_0 = var_15_7
	elseif arg_15_0:getConfig("sub_type") == TASK_SUB_TYPE_TECHNOLOGY_POINT then
		var_15_0 = getProxy(TechnologyNationProxy):getNationPoint(tonumber(arg_15_0:getConfig("target_id")))
		var_15_0 = math.min(var_15_0, arg_15_0:getConfig("target_num"))
	elseif arg_15_0:getConfig("sub_type") == TASK_SUB_TYPE_VITEM then
		local var_15_8 = tonumber(arg_15_0:getConfig("target_id"))
		local var_15_9 = tonumber(arg_15_0:getConfig("target_id_2"))
		local var_15_10 = pg.activity_drop_type[var_15_8].activity_id
		local var_15_11 = getProxy(ActivityProxy):getActivityById(var_15_10)

		if var_15_11 then
			var_15_0 = var_15_11:getVitemNumber(var_15_9)
		end
	end

	return var_15_0 or 0
end

function var_0_0.getTargetNumber(arg_17_0)
	return arg_17_0:getConfig("target_num")
end

function var_0_0.isReceive(arg_18_0)
	return arg_18_0.submitTime > 0
end

function var_0_0.isCircle(arg_19_0)
	if arg_19_0:isActivityTask() then
		if arg_19_0:getConfig("type") == 16 and arg_19_0:getConfig("sub_type") == 1006 then
			return true
		elseif arg_19_0:getConfig("type") == 16 and arg_19_0:getConfig("sub_type") == 20 then
			return true
		elseif arg_19_0:getConfig("type") == 16 and arg_19_0:getConfig("sub_type") == 1007 then
			return true
		elseif arg_19_0:getConfig("type") == 16 and arg_19_0:getConfig("sub_type") == 122 then
			return true
		end
	end

	return false
end

function var_0_0.isDaily(arg_20_0)
	return arg_20_0:getConfig("sub_type") == 415 or arg_20_0:getConfig("sub_type") == 412
end

function var_0_0.getTaskStatus(arg_21_0)
	if arg_21_0:isLock() then
		return -1
	end

	if arg_21_0:isReceive() then
		return 2
	end

	if arg_21_0:isFinish() then
		return 1
	end

	return 0
end

function var_0_0.onAdded(arg_22_0)
	local function var_22_0()
		if arg_22_0:getConfig("sub_type") == 29 then
			local var_23_0 = getProxy(SkirmishProxy):getRawData()

			if _.any(var_23_0, function(arg_24_0)
				return arg_24_0:getConfig("task_id") == arg_22_0.id
			end) then
				return
			end

			pg.m02:sendNotification(GAME.TASK_GO, {
				taskVO = arg_22_0
			})
		elseif arg_22_0:getConfig("added_tip") > 0 then
			local var_23_1

			if getProxy(ContextProxy):getCurrentContext().mediator.__cname ~= TaskMediator.__cname then
				function var_23_1()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.TASK, {
						page = var_0_1[arg_22_0:GetRealType()]
					})
				end
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				noText = "text_iknow",
				yesText = "text_forward",
				content = i18n("tip_add_task", arg_22_0:getConfig("name")),
				onYes = var_23_1,
				weight = LayerWeightConst.TOP_LAYER
			})
		end

		if arg_22_0:IsCommanderManualType() then
			getProxy(CommanderManualProxy):AddPageTaskDone(arg_22_0)
		end
	end

	local function var_22_1()
		local var_26_0 = getProxy(ContextProxy):getCurrentContext()

		if not table.contains({
			"LevelScene",
			"BattleScene",
			"EventListScene",
			"MilitaryExerciseScene",
			"DailyLevelScene"
		}, var_26_0.viewComponent.__cname) then
			return true
		end

		return false
	end

	local var_22_2 = arg_22_0:getConfig("story_id")

	if var_22_2 and var_22_2 ~= "" and var_22_1() then
		pg.NewStoryMgr.GetInstance():Play(var_22_2, var_22_0, true, true)
	else
		var_22_0()
	end
end

function var_0_0.updateProgress(arg_27_0, arg_27_1)
	arg_27_0.progress = arg_27_1
end

function var_0_0.isSelectable(arg_28_0)
	local var_28_0 = arg_28_0:getConfig("award_choice")

	return var_28_0 ~= nil and type(var_28_0) == "table" and #var_28_0 > 0
end

function var_0_0.judgeOverflow(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	local var_29_0 = arg_29_0:getTaskStatus() == 1
	local var_29_1 = arg_29_0:ShowOnTaskScene()

	return var_0_0.StaticJudgeOverflow(arg_29_1, arg_29_2, arg_29_3, var_29_0, var_29_1, arg_29_0:getConfig("award_display"))
end

function var_0_0.StaticJudgeOverflow(arg_30_0, arg_30_1, arg_30_2, arg_30_3, arg_30_4, arg_30_5)
	if arg_30_3 and arg_30_4 then
		local var_30_0 = getProxy(PlayerProxy):getData()
		local var_30_1 = pg.gameset.urpt_chapter_max.description[1]
		local var_30_2 = arg_30_0 or var_30_0.gold
		local var_30_3 = arg_30_1 or var_30_0.oil
		local var_30_4 = arg_30_2 or not LOCK_UR_SHIP and getProxy(BagProxy):GetLimitCntById(var_30_1) or 0
		local var_30_5 = pg.gameset.max_gold.key_value
		local var_30_6 = pg.gameset.max_oil.key_value
		local var_30_7 = not LOCK_UR_SHIP and pg.gameset.urpt_chapter_max.description[2] or 0
		local var_30_8 = false
		local var_30_9 = false
		local var_30_10 = false
		local var_30_11 = false
		local var_30_12 = false
		local var_30_13 = {}
		local var_30_14 = arg_30_5

		for iter_30_0, iter_30_1 in ipairs(var_30_14) do
			local var_30_15, var_30_16, var_30_17 = unpack(iter_30_1)

			if var_30_15 == DROP_TYPE_RESOURCE then
				if var_30_16 == PlayerConst.ResGold then
					local var_30_18 = var_30_2 + var_30_17 - var_30_5

					if var_30_18 > 0 then
						var_30_8 = true

						local var_30_19 = {
							type = DROP_TYPE_RESOURCE,
							id = PlayerConst.ResGold,
							count = setColorStr(var_30_18, COLOR_RED)
						}

						table.insert(var_30_13, var_30_19)
					end
				elseif var_30_16 == PlayerConst.ResOil then
					local var_30_20 = var_30_3 + var_30_17 - var_30_6

					if var_30_20 > 0 then
						var_30_9 = true

						local var_30_21 = {
							type = DROP_TYPE_RESOURCE,
							id = PlayerConst.ResOil,
							count = setColorStr(var_30_20, COLOR_RED)
						}

						table.insert(var_30_13, var_30_21)
					end
				end
			elseif not LOCK_UR_SHIP and var_30_15 == DROP_TYPE_VITEM then
				if Item.getConfigData(var_30_16).virtual_type == 20 then
					local var_30_22 = var_30_4 + var_30_17 - var_30_7

					if var_30_22 > 0 then
						var_30_10 = true

						local var_30_23 = {
							type = DROP_TYPE_VITEM,
							id = var_30_1,
							count = setColorStr(var_30_22, COLOR_RED)
						}

						table.insert(var_30_13, var_30_23)
					end
				end
			elseif var_30_15 == DROP_TYPE_ITEM and Item.getConfigData(var_30_16).type == Item.EXP_BOOK_TYPE then
				local var_30_24 = getProxy(BagProxy):getItemCountById(var_30_16) + var_30_17
				local var_30_25 = Item.getConfigData(var_30_16).max_num

				if var_30_25 < var_30_24 then
					var_30_11 = true

					local var_30_26 = {
						type = DROP_TYPE_ITEM,
						id = var_30_16,
						count = setColorStr(math.min(var_30_17, var_30_24 - var_30_25), COLOR_RED)
					}

					table.insert(var_30_13, var_30_26)
				end
			end
		end

		return var_30_8 or var_30_9 or var_30_10 or var_30_11, var_30_13
	end
end

function var_0_0.IsUrTask(arg_31_0)
	if not LOCK_UR_SHIP then
		local var_31_0 = pg.gameset.urpt_chapter_max.description[1]

		do return _.any(arg_31_0:getConfig("award_display"), function(arg_32_0)
			return arg_32_0[1] == DROP_TYPE_ITEM and arg_32_0[2] == var_31_0
		end) end
		return
	end

	return false
end

function var_0_0.GetRealType(arg_33_0)
	local var_33_0 = arg_33_0:getConfig("priority_type")

	if var_33_0 == 0 then
		var_33_0 = arg_33_0:getConfig("type")
	end

	return var_33_0
end

function var_0_0.IsOverflowShipExpItem(arg_34_0)
	local function var_34_0(arg_35_0, arg_35_1)
		return getProxy(BagProxy):getItemCountById(arg_35_0) + arg_35_1 > Item.getConfigData(arg_35_0).max_num
	end

	local var_34_1 = arg_34_0:getConfig("award_display")

	for iter_34_0, iter_34_1 in ipairs(var_34_1) do
		local var_34_2 = iter_34_1[1]
		local var_34_3 = iter_34_1[2]
		local var_34_4 = iter_34_1[3]

		if var_34_2 == DROP_TYPE_ITEM and Item.getConfigData(var_34_3).type == Item.EXP_BOOK_TYPE and var_34_0(var_34_3, var_34_4) then
			return true
		end
	end

	return false
end

function var_0_0.ShowOnTaskScene(arg_36_0)
	local var_36_0 = arg_36_0:getConfig("visibility") == 1

	if arg_36_0.id == 17268 then
		var_36_0 = false

		local var_36_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.BUILDING_NEWYEAR_2022)

		if var_36_1 and not var_36_1:isEnd() then
			local var_36_2 = var_36_1.data1KeyValueList[2][17] or 1
			local var_36_3 = var_36_1.data1KeyValueList[2][18] or 1

			var_36_0 = var_36_2 >= 4 and var_36_3 >= 4
		end
	end

	return var_36_0
end

function var_0_0.setTaskFinish(arg_37_0)
	arg_37_0.submitTime = 1

	arg_37_0:updateProgress(arg_37_0:getConfig("target_num"))
end

function var_0_0.isAvatarTask(arg_38_0)
	return false
end

function var_0_0.getActId(arg_39_0)
	return arg_39_0._actId
end

function var_0_0.setActId(arg_40_0, arg_40_1)
	arg_40_0._actId = arg_40_1
end

function var_0_0.isActivityTask(arg_41_0)
	return arg_41_0._actId and arg_41_0._actId > 0
end

function var_0_0.setAutoSubmit(arg_42_0, arg_42_1)
	arg_42_0._autoSubmit = arg_42_1
end

function var_0_0.getAutoSubmit(arg_43_0)
	return arg_43_0._autoSubmit
end

return var_0_0
