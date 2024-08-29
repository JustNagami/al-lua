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

function var_0_0.isLock(arg_12_0)
	return getProxy(PlayerProxy):getRawData().level < arg_12_0:getConfig("level")
end

function var_0_0.isFinish(arg_13_0)
	return arg_13_0:getProgress() >= arg_13_0:getConfig("target_num")
end

function var_0_0.getProgress(arg_14_0)
	local var_14_0 = arg_14_0.progress

	if arg_14_0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
		local var_14_1 = tonumber(arg_14_0:getConfig("target_id"))

		var_14_0 = getProxy(BagProxy):getItemCountById(tonumber(var_14_1))
	elseif arg_14_0:getConfig("sub_type") == TASK_SUB_TYPE_PT then
		local var_14_2 = getProxy(ActivityProxy):getActivityById(tonumber(arg_14_0:getConfig("target_id_2")))

		var_14_0 = var_14_2 and var_14_2.data1 or 0
	elseif arg_14_0:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
		local var_14_3 = tonumber(arg_14_0:getConfig("target_id"))

		var_14_0 = getProxy(PlayerProxy):getData():getResById(var_14_3)
	elseif arg_14_0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
		local var_14_4 = tonumber(arg_14_0:getConfig("target_id"))

		var_14_0 = getProxy(ActivityProxy):getVirtualItemNumber(var_14_4)
	elseif arg_14_0:getConfig("sub_type") == TASK_SUB_TYPE_BOSS_PT then
		local var_14_5 = tonumber(arg_14_0:getConfig("target_id"))

		var_14_0 = getProxy(PlayerProxy):getData():getResById(var_14_5)
	elseif arg_14_0:getConfig("sub_type") == TASK_SUB_STROY then
		local var_14_6 = arg_14_0:getConfig("target_id")
		local var_14_7 = 0

		_.each(var_14_6, function(arg_15_0)
			if pg.NewStoryMgr.GetInstance():GetPlayedFlag(arg_15_0) then
				var_14_7 = var_14_7 + 1
			end
		end)

		var_14_0 = var_14_7
	elseif arg_14_0:getConfig("sub_type") == TASK_SUB_TYPE_TECHNOLOGY_POINT then
		var_14_0 = getProxy(TechnologyNationProxy):getNationPoint(tonumber(arg_14_0:getConfig("target_id")))
		var_14_0 = math.min(var_14_0, arg_14_0:getConfig("target_num"))
	elseif arg_14_0:getConfig("sub_type") == TASK_SUB_TYPE_VITEM then
		local var_14_8 = tonumber(arg_14_0:getConfig("target_id"))
		local var_14_9 = tonumber(arg_14_0:getConfig("target_id_2"))
		local var_14_10 = pg.activity_drop_type[var_14_8].activity_id
		local var_14_11 = getProxy(ActivityProxy):getActivityById(var_14_10)

		if var_14_11 then
			var_14_0 = var_14_11:getVitemNumber(var_14_9)
		end
	end

	return var_14_0 or 0
end

function var_0_0.getTargetNumber(arg_16_0)
	return arg_16_0:getConfig("target_num")
end

function var_0_0.isReceive(arg_17_0)
	return arg_17_0.submitTime > 0
end

function var_0_0.isCircle(arg_18_0)
	if arg_18_0:isActivityTask() then
		if arg_18_0:getConfig("type") == 16 and arg_18_0:getConfig("sub_type") == 1006 then
			return true
		elseif arg_18_0:getConfig("type") == 16 and arg_18_0:getConfig("sub_type") == 20 then
			return true
		end
	end

	return false
end

function var_0_0.isDaily(arg_19_0)
	return arg_19_0:getConfig("sub_type") == 415 or arg_19_0:getConfig("sub_type") == 412
end

function var_0_0.getTaskStatus(arg_20_0)
	if arg_20_0:isLock() then
		return -1
	end

	if arg_20_0:isReceive() then
		return 2
	end

	if arg_20_0:isFinish() then
		return 1
	end

	return 0
end

function var_0_0.onAdded(arg_21_0)
	local function var_21_0()
		if arg_21_0:getConfig("sub_type") == 29 then
			local var_22_0 = getProxy(SkirmishProxy):getRawData()

			if _.any(var_22_0, function(arg_23_0)
				return arg_23_0:getConfig("task_id") == arg_21_0.id
			end) then
				return
			end

			pg.m02:sendNotification(GAME.TASK_GO, {
				taskVO = arg_21_0
			})
		elseif arg_21_0:getConfig("added_tip") > 0 then
			local var_22_1

			if getProxy(ContextProxy):getCurrentContext().mediator.__cname ~= TaskMediator.__cname then
				function var_22_1()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.TASK, {
						page = var_0_1[arg_21_0:GetRealType()]
					})
				end
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				noText = "text_iknow",
				yesText = "text_forward",
				content = i18n("tip_add_task", arg_21_0:getConfig("name")),
				onYes = var_22_1,
				weight = LayerWeightConst.TOP_LAYER
			})
		end
	end

	local function var_21_1()
		local var_25_0 = getProxy(ContextProxy):getCurrentContext()

		if not table.contains({
			"LevelScene",
			"BattleScene",
			"EventListScene",
			"MilitaryExerciseScene",
			"DailyLevelScene"
		}, var_25_0.viewComponent.__cname) then
			return true
		end

		return false
	end

	local var_21_2 = arg_21_0:getConfig("story_id")

	if var_21_2 and var_21_2 ~= "" and var_21_1() then
		pg.NewStoryMgr.GetInstance():Play(var_21_2, var_21_0, true, true)
	else
		var_21_0()
	end
end

function var_0_0.updateProgress(arg_26_0, arg_26_1)
	arg_26_0.progress = arg_26_1
end

function var_0_0.isSelectable(arg_27_0)
	local var_27_0 = arg_27_0:getConfig("award_choice")

	return var_27_0 ~= nil and type(var_27_0) == "table" and #var_27_0 > 0
end

function var_0_0.judgeOverflow(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	local var_28_0 = arg_28_0:getTaskStatus() == 1
	local var_28_1 = arg_28_0:ShowOnTaskScene()

	return var_0_0.StaticJudgeOverflow(arg_28_1, arg_28_2, arg_28_3, var_28_0, var_28_1, arg_28_0:getConfig("award_display"))
end

function var_0_0.StaticJudgeOverflow(arg_29_0, arg_29_1, arg_29_2, arg_29_3, arg_29_4, arg_29_5)
	if arg_29_3 and arg_29_4 then
		local var_29_0 = getProxy(PlayerProxy):getData()
		local var_29_1 = pg.gameset.urpt_chapter_max.description[1]
		local var_29_2 = arg_29_0 or var_29_0.gold
		local var_29_3 = arg_29_1 or var_29_0.oil
		local var_29_4 = arg_29_2 or not LOCK_UR_SHIP and getProxy(BagProxy):GetLimitCntById(var_29_1) or 0
		local var_29_5 = pg.gameset.max_gold.key_value
		local var_29_6 = pg.gameset.max_oil.key_value
		local var_29_7 = not LOCK_UR_SHIP and pg.gameset.urpt_chapter_max.description[2] or 0
		local var_29_8 = false
		local var_29_9 = false
		local var_29_10 = false
		local var_29_11 = false
		local var_29_12 = false
		local var_29_13 = {}
		local var_29_14 = arg_29_5

		for iter_29_0, iter_29_1 in ipairs(var_29_14) do
			local var_29_15, var_29_16, var_29_17 = unpack(iter_29_1)

			if var_29_15 == DROP_TYPE_RESOURCE then
				if var_29_16 == PlayerConst.ResGold then
					local var_29_18 = var_29_2 + var_29_17 - var_29_5

					if var_29_18 > 0 then
						var_29_8 = true

						local var_29_19 = {
							type = DROP_TYPE_RESOURCE,
							id = PlayerConst.ResGold,
							count = setColorStr(var_29_18, COLOR_RED)
						}

						table.insert(var_29_13, var_29_19)
					end
				elseif var_29_16 == PlayerConst.ResOil then
					local var_29_20 = var_29_3 + var_29_17 - var_29_6

					if var_29_20 > 0 then
						var_29_9 = true

						local var_29_21 = {
							type = DROP_TYPE_RESOURCE,
							id = PlayerConst.ResOil,
							count = setColorStr(var_29_20, COLOR_RED)
						}

						table.insert(var_29_13, var_29_21)
					end
				end
			elseif not LOCK_UR_SHIP and var_29_15 == DROP_TYPE_VITEM then
				if Item.getConfigData(var_29_16).virtual_type == 20 then
					local var_29_22 = var_29_4 + var_29_17 - var_29_7

					if var_29_22 > 0 then
						var_29_10 = true

						local var_29_23 = {
							type = DROP_TYPE_VITEM,
							id = var_29_1,
							count = setColorStr(var_29_22, COLOR_RED)
						}

						table.insert(var_29_13, var_29_23)
					end
				end
			elseif var_29_15 == DROP_TYPE_ITEM and Item.getConfigData(var_29_16).type == Item.EXP_BOOK_TYPE then
				local var_29_24 = getProxy(BagProxy):getItemCountById(var_29_16) + var_29_17
				local var_29_25 = Item.getConfigData(var_29_16).max_num

				if var_29_25 < var_29_24 then
					var_29_11 = true

					local var_29_26 = {
						type = DROP_TYPE_ITEM,
						id = var_29_16,
						count = setColorStr(math.min(var_29_17, var_29_24 - var_29_25), COLOR_RED)
					}

					table.insert(var_29_13, var_29_26)
				end
			end
		end

		return var_29_8 or var_29_9 or var_29_10 or var_29_11, var_29_13
	end
end

function var_0_0.IsUrTask(arg_30_0)
	if not LOCK_UR_SHIP then
		local var_30_0 = pg.gameset.urpt_chapter_max.description[1]

		do return _.any(arg_30_0:getConfig("award_display"), function(arg_31_0)
			return arg_31_0[1] == DROP_TYPE_ITEM and arg_31_0[2] == var_30_0
		end) end
		return
	end

	return false
end

function var_0_0.GetRealType(arg_32_0)
	local var_32_0 = arg_32_0:getConfig("priority_type")

	if var_32_0 == 0 then
		var_32_0 = arg_32_0:getConfig("type")
	end

	return var_32_0
end

function var_0_0.IsOverflowShipExpItem(arg_33_0)
	local function var_33_0(arg_34_0, arg_34_1)
		return getProxy(BagProxy):getItemCountById(arg_34_0) + arg_34_1 > Item.getConfigData(arg_34_0).max_num
	end

	local var_33_1 = arg_33_0:getConfig("award_display")

	for iter_33_0, iter_33_1 in ipairs(var_33_1) do
		local var_33_2 = iter_33_1[1]
		local var_33_3 = iter_33_1[2]
		local var_33_4 = iter_33_1[3]

		if var_33_2 == DROP_TYPE_ITEM and Item.getConfigData(var_33_3).type == Item.EXP_BOOK_TYPE and var_33_0(var_33_3, var_33_4) then
			return true
		end
	end

	return false
end

function var_0_0.ShowOnTaskScene(arg_35_0)
	local var_35_0 = arg_35_0:getConfig("visibility") == 1

	if arg_35_0.id == 17268 then
		var_35_0 = false

		local var_35_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.BUILDING_NEWYEAR_2022)

		if var_35_1 and not var_35_1:isEnd() then
			local var_35_2 = var_35_1.data1KeyValueList[2][17] or 1
			local var_35_3 = var_35_1.data1KeyValueList[2][18] or 1

			var_35_0 = var_35_2 >= 4 and var_35_3 >= 4
		end
	end

	return var_35_0
end

function var_0_0.setTaskFinish(arg_36_0)
	arg_36_0.submitTime = 1

	arg_36_0:updateProgress(arg_36_0:getConfig("target_num"))
end

function var_0_0.isAvatarTask(arg_37_0)
	return false
end

function var_0_0.getActId(arg_38_0)
	return arg_38_0._actId
end

function var_0_0.setActId(arg_39_0, arg_39_1)
	arg_39_0._actId = arg_39_1
end

function var_0_0.isActivityTask(arg_40_0)
	return arg_40_0._actId and arg_40_0._actId > 0
end

function var_0_0.setAutoSubmit(arg_41_0, arg_41_1)
	arg_41_0._autoSubmit = arg_41_1
end

function var_0_0.getAutoSubmit(arg_42_0)
	return arg_42_0._autoSubmit
end

return var_0_0
