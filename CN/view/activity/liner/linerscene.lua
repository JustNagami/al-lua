local var_0_0 = class("LinerScene", import("view.base.BaseUI"))

var_0_0.AUTO_DELAY_TIME = 0.5
var_0_0.SCALE_ANIM_TIME = 0.5
var_0_0.FINISH_TARGET_ROOM_ID = 4
var_0_0.FINISH_CHAR_CNT = 10
var_0_0.GUIDE_ROOM_ID = 22
var_0_0.MODE_NORMAL = 1
var_0_0.MODE_FULLVIEW = 2

function var_0_0.getUIName(arg_1_0)
	return "LinerMainUI"
end

function var_0_0.PlayBGM(arg_2_0)
	local var_2_0 = arg_2_0.activity

	if not var_2_0 then
		var_2_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LINER)

		assert(var_2_0 and not var_2_0:isEnd(), "not exist liner act, type: " .. ActivityConst.ACTIVITY_TYPE_LINER)
	end

	local var_2_1 = var_2_0:GetBgmName()

	pg.BgmMgr.GetInstance():Push(arg_2_0.__cname, var_2_1)
end

function var_0_0.init(arg_3_0)
	arg_3_0.mapTF = arg_3_0:findTF("map")
	arg_3_0.bgTF = arg_3_0:findTF("bg", arg_3_0.mapTF)
	arg_3_0.roomsTF = arg_3_0:findTF("content", arg_3_0.mapTF)
	arg_3_0.topUI = arg_3_0:findTF("top")
	arg_3_0.nameBgTF = arg_3_0:findTF("name_bg", arg_3_0.topUI)
	arg_3_0.nameInput = arg_3_0:findTF("name/input", arg_3_0.topUI)
	arg_3_0.logBtn = arg_3_0:findTF("logbook", arg_3_0.topUI)
	arg_3_0.timeBgTF = arg_3_0:findTF("time/bg", arg_3_0.topUI)
	arg_3_0.timeTF = arg_3_0:findTF("time/Text", arg_3_0.topUI)
	arg_3_0.targetTagTF = arg_3_0:findTF("time/target/tag", arg_3_0.topUI)
	arg_3_0.targetLayoutCom = arg_3_0:findTF("time/target", arg_3_0.topUI):GetComponent(typeof(HorizontalLayoutGroup))
	arg_3_0.targetTF = arg_3_0:findTF("time/target/Text", arg_3_0.topUI)
	arg_3_0.focusTF = arg_3_0:findTF("focus", arg_3_0.topUI)

	setActive(arg_3_0:findTF("tpl", arg_3_0.focusTF), false)

	arg_3_0.bgDiffList = {
		arg_3_0.bgTF,
		arg_3_0.nameBgTF,
		arg_3_0.timeBgTF,
		arg_3_0:findTF("1/icon", arg_3_0.roomsTF),
		arg_3_0:findTF("3/icon", arg_3_0.roomsTF),
		arg_3_0:findTF("4/icon", arg_3_0.roomsTF)
	}

	local var_3_0 = arg_3_0:findTF("pages")

	arg_3_0.timePage = LinerPassTimePage.New(var_3_0, arg_3_0)
	arg_3_0.roomPage = LinerRoomInfoPage.New(var_3_0, arg_3_0)

	local var_3_1, var_3_2, var_3_3 = getSizeRate()

	arg_3_0.delta = Vector2(var_3_2 - 100, var_3_3 - 100) / 2
	arg_3_0.extendLimit = Vector2(arg_3_0.mapTF.rect.width - arg_3_0._tf.rect.width, arg_3_0.mapTF.rect.height - arg_3_0._tf.rect.height) / 2
	arg_3_0.fullFactor = math.max(arg_3_0._tf.rect.width / arg_3_0.mapTF.rect.width, arg_3_0._tf.rect.height / arg_3_0.mapTF.rect.height)
end

function var_0_0.addListeners(arg_4_0)
	local var_4_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.LINER_NAMED_ID)

	assert(var_4_0 and not var_4_0:isEnd(), "not exist named act, id: " .. ActivityConst.LINER_NAMED_ID)

	arg_4_0.linerName = var_4_0:getStrData1()

	setInputText(arg_4_0.nameInput, arg_4_0.linerName)
	onInputEndEdit(arg_4_0, arg_4_0.nameInput, function(arg_5_0)
		if not nameValidityCheck(arg_5_0, 4, 14, {
			"spece_illegal_tip",
			"login_newPlayerScene_name_tooShort",
			"login_newPlayerScene_name_tooLong",
			"login_newPlayerScene_invalideName"
		}) then
			setInputText(arg_4_0.nameInput, arg_4_0.linerName)

			return
		else
			local var_5_0 = getInputText(arg_4_0.nameInput)

			arg_4_0:emit(LinerMediator.SET_NAME, {
				actId = var_4_0.id,
				strValue = var_5_0,
				callback = function()
					arg_4_0.linerName = var_5_0

					setInputText(arg_4_0.nameInput, arg_4_0.linerName)
					pg.TipsMgr.GetInstance():ShowTips(i18n("liner_name_modify"))
				end
			})
		end
	end)
	onButton(arg_4_0, arg_4_0:findTF("back", arg_4_0.topUI), function()
		arg_4_0:onBackPressed()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0:findTF("home", arg_4_0.topUI), function()
		arg_4_0:quickExitFunc()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0:findTF("help", arg_4_0.topUI), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.liner_help.tip
		})
	end, SFX_CANCEL)
	onButton(arg_4_0, arg_4_0.logBtn, function()
		arg_4_0:emit(LinerMediator.GO_SUBLAYER, Context.New({
			mediator = LinerLogBookMediator,
			viewComponent = LinerLogBookLayer
		}))
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0:findTF("fullview", arg_4_0.topUI), function()
		if arg_4_0.mode == var_0_0.MODE_NORMAL then
			arg_4_0:SwitchMode(var_0_0.MODE_FULLVIEW)
		else
			arg_4_0:SwitchMode(var_0_0.MODE_NORMAL)
		end
	end, SFX_PANEL)
	onScroll(arg_4_0, arg_4_0.mapTF, function(arg_12_0)
		arg_4_0:onDragFunction()
	end)
end

function var_0_0.didEnter(arg_13_0)
	arg_13_0:addListeners()

	arg_13_0.mode = var_0_0.MODE_NORMAL
	arg_13_0.isFirstUpdate = true

	arg_13_0:UpdateData()
	arg_13_0:InitRooms()

	local var_13_0 = {}

	table.insert(var_13_0, function(arg_14_0)
		if arg_13_0.activity:GetCurIdx() == 1 then
			arg_13_0:managedTween(LeanTween.delayedCall, function()
				local var_15_0 = arg_13_0.targetIds[1]

				triggerButton(arg_13_0:findTF(tostring(var_15_0), arg_13_0.roomsTF))
			end, var_0_0.AUTO_DELAY_TIME, nil)
		else
			arg_14_0()
		end
	end)
	arg_13_0:UpdateView(function()
		seriesAsync(var_13_0, function()
			return
		end)
	end)
end

function var_0_0.InitRooms(arg_18_0)
	arg_18_0.rooms = {}
	arg_18_0.roomChars = {}
	arg_18_0.roomIds = arg_18_0.activity:GetAllExploreRoomIds()

	eachChild(arg_18_0.roomsTF, function(arg_19_0)
		local var_19_0 = tonumber(arg_19_0.name)

		if not var_19_0 then
			return
		end

		if table.contains(arg_18_0.roomIds, var_19_0) then
			arg_18_0.rooms[var_19_0] = LinerRoom.New(var_19_0)
			arg_18_0.roomChars[var_19_0] = {}
		end
	end)

	arg_18_0.floatItemList = UIItemList.New(arg_18_0.focusTF, arg_18_0.focusTF:Find("tpl"))

	arg_18_0.floatItemList:make(function(arg_20_0, arg_20_1, arg_20_2)
		arg_20_1 = arg_20_1 + 1

		if arg_20_0 == UIItemList.EventUpdate then
			local var_20_0 = arg_18_0.targetIds[arg_20_1]

			arg_20_2.name = var_20_0

			local var_20_1 = arg_18_0.curTime:GetType()

			eachChild(arg_18_0:findTF("tag", arg_20_2), function(arg_21_0)
				setActive(arg_21_0, arg_21_0.name == "type" .. var_20_1)
			end)
			eachChild(arg_18_0:findTF("arrow", arg_20_2), function(arg_22_0)
				setActive(arg_22_0, arg_22_0.name == "type" .. var_20_1)
			end)
			onButton(arg_18_0, arg_20_2, function()
				arg_18_0:FocusNode(var_20_0)
			end, SFX_PANEL)
		end
	end)
end

function var_0_0.UpdateRooms(arg_24_0)
	eachChild(arg_24_0.roomsTF, function(arg_25_0)
		local var_25_0 = tonumber(arg_25_0.name)

		if not var_25_0 then
			return
		end

		arg_24_0:OnUpdateRoom(var_25_0, arg_25_0)
	end)

	if arg_24_0.isReallyTime then
		arg_24_0:InitRandomChars()
	else
		arg_24_0:FillRandomChars()
	end

	arg_24_0.isFirstUpdate = false
end

function var_0_0.OnUpdateRoom(arg_26_0, arg_26_1, arg_26_2)
	if not table.contains(arg_26_0.roomIds, arg_26_1) then
		setActive(arg_26_0:findTF("tag", arg_26_2), false)
		setActive(arg_26_0:findTF("mask", arg_26_2), false)
		setActive(arg_26_0:findTF("explore", arg_26_2), false)
		onButton(arg_26_0, arg_26_2, function()
			if arg_26_0.mode == var_0_0.MODE_FULLVIEW then
				arg_26_0:SwitchMode(var_0_0.MODE_NORMAL)
				arg_26_0:FocusNode(arg_26_1)
			end
		end, SFX_CONFIRM)

		return
	end

	local var_26_0 = arg_26_0.curTime:GetType()
	local var_26_1 = table.contains(arg_26_0.targetIds, arg_26_1) or var_26_0 == LinerTime.TYPE.EXPLORE
	local var_26_2 = arg_26_0:findTF("tag", arg_26_2)

	setActive(var_26_2, var_26_1)
	eachChild(var_26_2, function(arg_28_0)
		setActive(arg_28_0, arg_28_0.name == "type" .. var_26_0)
	end)

	local var_26_3 = var_26_0 == LinerTime.TYPE.EXPLORE and table.contains(arg_26_0.exploredRoomIds, arg_26_1)
	local var_26_4 = var_26_0 == LinerTime.TYPE.EXPLORE and not table.contains(arg_26_0.exploredRoomIds, arg_26_1)

	setActive(arg_26_0:findTF("mask", arg_26_2), var_26_3)
	setActive(arg_26_0:findTF("explore", arg_26_2), var_26_4)
	onButton(arg_26_0, arg_26_2, function()
		if arg_26_0.mode == var_0_0.MODE_FULLVIEW then
			arg_26_0:SwitchMode(var_0_0.MODE_NORMAL)
			arg_26_0:FocusNode(arg_26_1)

			return
		end

		if not var_26_1 or var_26_3 then
			return
		end

		if arg_26_0.isFinishAll and not arg_26_0.isReallyTime then
			pg.NewStoryMgr.GetInstance():Play(arg_26_0.endingStory, function()
				arg_26_0:PlayAnim(function()
					arg_26_0:UpdateData()
					arg_26_0:CheckTime()
				end)
			end)

			return
		end

		switch(var_26_0, {
			[LinerTime.TYPE.TARGET] = function()
				pg.NewStoryMgr.GetInstance():Play(arg_26_0.curTime:GetStory(), function()
					arg_26_0:emit(LinerMediator.CLICK_ROOM, arg_26_0.activity.id, arg_26_1)

					arg_26_0.needAutoCheck = true
				end, true)
			end,
			[LinerTime.TYPE.EXPLORE] = function()
				arg_26_0.roomPage:ExecuteAction("ShowInfo", arg_26_0.activity, arg_26_1, function()
					arg_26_0:CheckTime()
				end)
			end,
			[LinerTime.TYPE.EVENT] = function()
				local var_36_0 = arg_26_0.curTime:GetEventSubType(arg_26_1)

				if var_36_0 == LinerTime.EVENT_SUB_TYPE.CLUE then
					arg_26_0.roomPage:ExecuteAction("ShowInfo", arg_26_0.activity, arg_26_1, function()
						arg_26_0:CheckTime()
					end)
				elseif var_36_0 == LinerTime.EVENT_SUB_TYPE.STORY then
					pg.NewStoryMgr.GetInstance():Play(arg_26_0.curTime:GetStory(arg_26_1), function()
						arg_26_0:emit(LinerMediator.CLICK_ROOM, arg_26_0.activity.id, arg_26_1)

						arg_26_0.needAutoCheck = true
					end, true)
				end
			end,
			[LinerTime.TYPE.STORY] = function()
				seriesAsync({
					function(arg_40_0)
						if arg_26_0.activity:GetCurIdx() == 1 then
							arg_40_0()
						else
							arg_26_0:PlayAnim(function()
								arg_26_0:UpdateBg("day")
							end, arg_40_0)
						end
					end,
					function(arg_42_0)
						pg.NewStoryMgr.GetInstance():Play(arg_26_0.curTime:GetStory(), arg_42_0, true)
					end
				}, function()
					arg_26_0:emit(LinerMediator.CLICK_ROOM, arg_26_0.activity.id, arg_26_1)

					arg_26_0.needAutoCheck = true
				end)
			end
		})
	end, SFX_CONFIRM)

	if not arg_26_0.isFinishAll or arg_26_0.isFinishAll and not arg_26_0.isReallyTime then
		arg_26_0:UpdateRoomChar(arg_26_1, arg_26_2)
	end
end

function var_0_0.UpdateRoomChar(arg_44_0, arg_44_1, arg_44_2)
	if arg_44_0.oldTime.id == arg_44_0.curTime.id and not arg_44_0.isFirstUpdate then
		return
	end

	local var_44_0 = arg_44_0.rooms[arg_44_1]
	local var_44_1 = var_44_0:GetSpineCharInfo(arg_44_0.oldTime.id)
	local var_44_2 = var_44_0:GetSpineCharInfo(arg_44_0.curTime.id)
	local var_44_3 = var_44_1 and var_44_1[1] or ""
	local var_44_4 = var_44_2 and var_44_2[1] or ""

	if var_44_3 == var_44_4 and not arg_44_0.isFirstUpdate then
		return
	end

	local var_44_5 = arg_44_0:findTF("char", arg_44_2)

	if arg_44_0.roomChars[arg_44_1][1] and arg_44_0.roomChars[arg_44_1][2] then
		if LeanTween.isTweening(arg_44_0.roomChars[arg_44_1][2]) then
			LeanTween.cancel(arg_44_0.roomChars[arg_44_1][2])
		end

		PoolMgr.GetInstance():ReturnSpineChar(arg_44_0.roomChars[arg_44_1][1], arg_44_0.roomChars[arg_44_1][2])

		arg_44_0.roomChars[arg_44_1][1] = nil
		arg_44_0.roomChars[arg_44_1][2] = nil
	end

	if var_44_4 ~= "" then
		PoolMgr.GetInstance():GetSpineChar(var_44_4, true, function(arg_45_0)
			arg_44_0.roomChars[arg_44_1][1] = var_44_4
			arg_44_0.roomChars[arg_44_1][2] = arg_45_0

			setLocalScale(tf(arg_45_0), {
				x = LinerRoomCharPoint.SCALE,
				y = LinerRoomCharPoint.SCALE
			})
			setParent(arg_45_0, var_44_5)
			arg_44_0:InitCharBehavior(arg_44_1, tf(arg_45_0), var_44_2[2])
		end)
	end
end

function var_0_0.InitCharBehavior(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	local var_46_0 = LinerRoomCharPoint[arg_46_1]
	local var_46_1 = LinerRoomCharPoint.SCALE

	if var_46_0.type == 2 then
		setLocalPosition(arg_46_2, var_46_0.idlePoint)

		local var_46_2 = arg_46_3 or LinerRoomCharPoint.IDLE_ACTION

		arg_46_2:GetComponent("SpineAnimUI"):SetAction(var_46_2, 0)
	elseif var_46_0.type == 1 then
		local var_46_3 = var_46_0.startPoint.x
		local var_46_4 = var_46_0.endPoint.x
		local var_46_5 = (var_46_4 - var_46_3) / LinerRoomCharPoint.SPEED

		setLocalPosition(arg_46_2, var_46_0.startPoint)

		local var_46_6 = arg_46_3 or LinerRoomCharPoint.MOVE_ACTION

		arg_46_2:GetComponent("SpineAnimUI"):SetAction(var_46_6, 0)
		arg_46_0:managedTween(LeanTween.value, nil, go(arg_46_2), var_46_3, var_46_4, var_46_5):setOnUpdate(System.Action_float(function(arg_47_0)
			setLocalPosition(arg_46_2, {
				x = arg_47_0
			})

			if arg_47_0 == var_46_3 then
				setLocalScale(arg_46_2, {
					x = var_46_1,
					y = var_46_1
				})
			end

			if arg_47_0 == var_46_4 then
				setLocalScale(arg_46_2, {
					x = -var_46_1,
					y = var_46_1
				})
			end
		end)):setLoopPingPong()
	end
end

function var_0_0.GetRandomItems(arg_48_0, arg_48_1, arg_48_2)
	assert(arg_48_2 <= #arg_48_1, "不合法的随机数量")

	local var_48_0 = {}

	for iter_48_0 = 1, #arg_48_1 do
		table.insert(var_48_0, iter_48_0)
	end

	shuffle(var_48_0)

	local var_48_1 = {}

	for iter_48_1 = 1, arg_48_2 do
		table.insert(var_48_1, arg_48_1[var_48_0[iter_48_1]])
	end

	return var_48_1
end

function var_0_0.InitRandomChars(arg_49_0)
	for iter_49_0, iter_49_1 in pairs(arg_49_0.roomChars) do
		if iter_49_1[1] and iter_49_1[2] then
			if LeanTween.isTweening(iter_49_1[2]) then
				LeanTween.cancel(iter_49_1[2])
			end

			PoolMgr.GetInstance():ReturnSpineChar(iter_49_1[1], iter_49_1[2])

			arg_49_0.roomChars[iter_49_0][1] = nil
			arg_49_0.roomChars[iter_49_0][2] = nil
		end
	end

	local var_49_0 = underscore.filter(arg_49_0.roomIds, function(arg_50_0)
		return arg_50_0 ~= 4 or arg_50_0 ~= 31
	end)
	local var_49_1 = arg_49_0:GetRandomItems(var_49_0, var_0_0.FINISH_CHAR_CNT)
	local var_49_2 = arg_49_0:GetRandomItems(arg_49_0.sdConfig, var_0_0.FINISH_CHAR_CNT)

	for iter_49_2, iter_49_3 in ipairs(var_49_1) do
		local var_49_3 = var_49_2[iter_49_2]

		PoolMgr.GetInstance():GetSpineChar(var_49_3, true, function(arg_51_0)
			arg_49_0.roomChars[iter_49_3][1] = var_49_3
			arg_49_0.roomChars[iter_49_3][2] = arg_51_0

			local var_51_0 = arg_49_0:findTF(iter_49_3 .. "/char", arg_49_0.roomsTF)

			setLocalScale(tf(arg_51_0), {
				x = LinerRoomCharPoint.SCALE,
				y = LinerRoomCharPoint.SCALE
			})
			setParent(arg_51_0, var_51_0)
			arg_49_0:InitCharBehavior(iter_49_3, tf(arg_51_0))
		end)
	end
end

function var_0_0.FillRandomChars(arg_52_0)
	if arg_52_0.oldTime.id == arg_52_0.curTime.id and not arg_52_0.isFirstUpdate then
		return
	end

	local var_52_0 = Clone(arg_52_0.roomIds)
	local var_52_1 = Clone(arg_52_0.sdConfig)
	local var_52_2 = 0

	for iter_52_0, iter_52_1 in ipairs(arg_52_0.roomIds) do
		local var_52_3 = arg_52_0.rooms[iter_52_1]:GetSpineCharInfo(arg_52_0.curTime.id)

		if var_52_3 and var_52_3[1] and var_52_3[2] then
			table.removebyvalue(var_52_0, iter_52_1)

			if table.contains(var_52_1, var_52_3[1]) then
				table.removebyvalue(var_52_1, var_52_3[1])
			end

			var_52_2 = var_52_2 + 1
		end
	end

	if arg_52_0.randomIds and #arg_52_0.randomIds > 0 then
		for iter_52_2, iter_52_3 in pairs(arg_52_0.roomChars) do
			if iter_52_3[1] and iter_52_3[2] and table.contains(arg_52_0.randomIds, iter_52_2) then
				if LeanTween.isTweening(iter_52_3[2]) then
					LeanTween.cancel(iter_52_3[2])
				end

				PoolMgr.GetInstance():ReturnSpineChar(iter_52_3[1], iter_52_3[2])

				arg_52_0.roomChars[iter_52_2][1] = nil
				arg_52_0.roomChars[iter_52_2][2] = nil
			end
		end
	end

	arg_52_0.randomIds = {}

	local var_52_4 = var_0_0.FINISH_CHAR_CNT - var_52_2

	arg_52_0.randomIds = arg_52_0:GetRandomItems(var_52_0, var_52_4)

	local var_52_5 = arg_52_0:GetRandomItems(var_52_1, var_52_4)

	for iter_52_4, iter_52_5 in ipairs(arg_52_0.randomIds) do
		local var_52_6 = var_52_5[iter_52_4]

		PoolMgr.GetInstance():GetSpineChar(var_52_6, true, function(arg_53_0)
			arg_52_0.roomChars[iter_52_5][1] = var_52_6
			arg_52_0.roomChars[iter_52_5][2] = arg_53_0

			local var_53_0 = arg_52_0:findTF(iter_52_5 .. "/char", arg_52_0.roomsTF)

			setLocalScale(tf(arg_53_0), {
				x = LinerRoomCharPoint.SCALE,
				y = LinerRoomCharPoint.SCALE
			})
			setParent(arg_53_0, var_53_0)
			arg_52_0:InitCharBehavior(iter_52_5, tf(arg_53_0))
		end)
	end
end

function var_0_0.UpdateBg(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_1 or arg_54_0.curTime:GetBgType()

	for iter_54_0, iter_54_1 in ipairs(arg_54_0.bgDiffList) do
		eachChild(iter_54_1, function(arg_55_0)
			setActive(arg_55_0, arg_55_0.name == var_54_0)
		end)
	end
end

function var_0_0.UpdateFinishTime(arg_56_0)
	local var_56_0 = os.date("*t", os.time())
	local var_56_1 = var_56_0.hour
	local var_56_2 = var_56_0.min
	local var_56_3 = var_56_1 < 12 and " AM" or " PM"

	arg_56_0:UpdateBg(arg_56_0.activity:GetReallyTimeType(var_56_1))

	if var_56_1 > 12 then
		var_56_1 = var_56_1 - 12
	end

	setText(arg_56_0.timeTF, string.format("%d:%02d ", var_56_1, var_56_2) .. var_56_3)
end

function var_0_0.UpdateTimeUI(arg_57_0)
	if arg_57_0.isReallyTime then
		eachChild(arg_57_0.targetTagTF, function(arg_58_0)
			setActive(arg_58_0, false)
		end)

		arg_57_0.targetLayoutCom.spacing = -60

		setText(arg_57_0.targetTF, i18n("liner_target_type5"))

		arg_57_0.finishTimer = Timer.New(function()
			arg_57_0:UpdateFinishTime()
		end, 60, -1)

		arg_57_0.finishTimer:Start()
		arg_57_0:UpdateFinishTime()

		return
	end

	setText(arg_57_0.timeTF, arg_57_0.curTime:GetStartTimeDesc())

	local var_57_0 = arg_57_0.curTime:GetType()

	eachChild(arg_57_0.targetTagTF, function(arg_60_0)
		setActive(arg_60_0, not arg_57_0.isFinishAll and arg_60_0.name == "type" .. var_57_0)
	end)

	local var_57_1 = ""

	switch(var_57_0, {
		[LinerTime.TYPE.TARGET] = function()
			var_57_1 = i18n("liner_target_type1", arg_57_0.rooms[arg_57_0.targetIds[1]]:GetName())
		end,
		[LinerTime.TYPE.EXPLORE] = function()
			local var_62_0 = arg_57_0.curTime:GetExploreCnt()
			local var_62_1 = arg_57_0.activity:GetRemainExploreCnt()

			var_57_1 = i18n("liner_target_type2") .. string.format("(%d/%d)", var_62_0 - var_62_1, var_62_0)
		end,
		[LinerTime.TYPE.EVENT] = function()
			local var_63_0 = #arg_57_0.curTime:GetTargetRoomIds()
			local var_63_1 = arg_57_0.activity:GetRoomIdx() - 1

			if arg_57_0.isFinishAll then
				var_63_1 = var_63_0
			end

			var_57_1 = i18n("liner_target_type3") .. string.format("(%d/%d)", var_63_1, var_63_0)
		end,
		[LinerTime.TYPE.STORY] = function()
			var_57_1 = i18n("liner_target_type4", arg_57_0.rooms[arg_57_0.targetIds[1]]:GetName())
		end
	})

	arg_57_0.targetLayoutCom.spacing = (var_57_0 == LinerTime.TYPE.EXPLORE or arg_57_0.isFinishAll) and -60 or -10

	if arg_57_0.isFinishAll then
		var_57_1 = i18n("liner_target_type4")
	end

	setText(arg_57_0.targetTF, var_57_1)
end

function var_0_0.CheckTime(arg_65_0)
	local var_65_0 = arg_65_0.oldTime.id ~= arg_65_0.curTime.id
	local var_65_1 = arg_65_0.activity:GetCurIdx()
	local var_65_2 = math.max(var_65_1 - 1, 1)

	if var_65_0 then
		arg_65_0.timePage:ExecuteAction("ShowAnim", arg_65_0.activity, var_65_2, var_65_1, function()
			arg_65_0:UpdateView()
		end)
	else
		arg_65_0:UpdateView()
	end
end

function var_0_0.UpdateView(arg_67_0, arg_67_1)
	arg_67_0:UpdateBg()
	arg_67_0:UpdateTimeUI()
	arg_67_0:UpdateRooms()
	arg_67_0:UpdateTips()
	arg_67_0.floatItemList:align(#arg_67_0.targetIds)

	if arg_67_0.curTime:GetType() ~= LinerTime.TYPE.EXPLORE and arg_67_0.targetIds[1] then
		arg_67_0:FocusNode(arg_67_0.targetIds[1], arg_67_1)
	else
		arg_67_0:onDragFunction()
	end

	if arg_67_0.curTime:GetType() == LinerTime.TYPE.EXPLORE and not pg.NewStoryMgr.GetInstance():IsPlayed("Liner_1") then
		arg_67_0:FocusNode(var_0_0.GUIDE_ROOM_ID, function()
			pg.NewGuideMgr.GetInstance():Play("Liner_1")
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = "Liner_1"
			})
		end)
	end

	if arg_67_0.oldTime.id ~= arg_67_0.curTime.id then
		arg_67_0:PlayBGM()
	end
end

function var_0_0.UpdateData(arg_69_0)
	arg_69_0.activity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LINER)

	assert(arg_69_0.activity and not arg_69_0.activity:isEnd(), "not exist liner act, type: " .. ActivityConst.ACTIVITY_TYPE_LINER)

	arg_69_0.endingStory = arg_69_0.activity:getConfig("config_client").endingstory[1]
	arg_69_0.timeConfig = arg_69_0.activity:getConfig("config_client").endingtime
	arg_69_0.sdConfig = arg_69_0.activity:getConfig("config_client").sd
	arg_69_0.isFinishAll = arg_69_0.activity:IsFinishAllTime()
	arg_69_0.isReallyTime = arg_69_0.isFinishAll and pg.NewStoryMgr.GetInstance():IsPlayed(arg_69_0.endingStory)
	arg_69_0.exploredRoomIds = arg_69_0.activity:GetExploredRoomIds()
	arg_69_0.curEventInfos = arg_69_0.activity:GetCurEventInfo()
	arg_69_0.oldTime = arg_69_0.curTime and Clone(arg_69_0.curTime) or nil
	arg_69_0.curTime = arg_69_0.activity:GetCurTime()

	if not arg_69_0.oldTime then
		arg_69_0.oldTime = Clone(arg_69_0.curTime)
	end

	if arg_69_0.isFinishAll then
		if not arg_69_0.isReallyTime then
			arg_69_0.targetIds = {
				var_0_0.FINISH_TARGET_ROOM_ID
			}
		else
			arg_69_0.targetIds = {}
		end
	elseif arg_69_0.curTime:GetType() == LinerTime.TYPE.EVENT then
		arg_69_0.targetIds = {
			arg_69_0:_getCurEventRoomId()
		}
	else
		arg_69_0.targetIds = arg_69_0.curTime:GetTargetRoomIds()
	end

	if arg_69_0.needAutoCheck then
		arg_69_0.needAutoCheck = false

		arg_69_0:CheckTime()
	end
end

function var_0_0._getCurEventRoomId(arg_70_0)
	return arg_70_0.curTime:GetParamInfo()[arg_70_0.activity:GetRoomIdx()][1]
end

function var_0_0.UpdateTips(arg_71_0)
	setActive(arg_71_0:findTF("tip", arg_71_0.logBtn), LinerLogBookLayer.IsTip())
end

function var_0_0.onDragFunction(arg_72_0)
	if not var_0_0.screenPoints then
		var_0_0.screenPoints = {
			Vector2(-arg_72_0.delta.x, arg_72_0.delta.y),
			Vector2(arg_72_0.delta.x, arg_72_0.delta.y),
			Vector2(arg_72_0.delta.x, -arg_72_0.delta.y),
			Vector2(-arg_72_0.delta.x, -arg_72_0.delta.y)
		}
	end

	for iter_72_0, iter_72_1 in ipairs(arg_72_0.targetIds) do
		local var_72_0 = arg_72_0.roomsTF:Find(tostring(iter_72_1))

		if var_72_0 then
			local var_72_1 = arg_72_0._tf:InverseTransformPoint(var_72_0.position)
			local var_72_2

			for iter_72_2, iter_72_3 in ipairs(var_0_0.screenPoints) do
				local var_72_3 = var_0_0.screenPoints[iter_72_2 % 4 + 1]
				local var_72_4 = Vector2(var_72_1.x, var_72_1.y)
				local var_72_5, var_72_6, var_72_7 = LineLine(Vector2.zero, var_72_4, iter_72_3, var_72_3)

				if var_72_5 then
					var_72_2 = var_72_4 * var_72_6

					break
				end
			end

			local var_72_8 = arg_72_0.floatItemList.container:Find(tostring(iter_72_1))
			local var_72_9 = var_72_8:GetComponent(typeof(CanvasGroup))
			local var_72_10 = tobool(var_72_2)

			var_72_9.interactable = var_72_10
			var_72_9.blocksRaycasts = var_72_10
			var_72_9.alpha = var_72_10 and 1 or 0

			setActive(arg_72_0:findTF(iter_72_1 .. "/tag", arg_72_0.roomsTF), not var_72_10)

			if var_72_2 then
				local var_72_11 = var_72_2 * (1 - 50 / var_72_2:Magnitude())

				setAnchoredPosition(var_72_8, var_72_11)

				local var_72_12 = math.rad2Deg * math.atan2(var_72_2.y, var_72_2.x)

				setLocalEulerAngles(var_72_8:Find("arrow"), {
					z = var_72_12
				})
			end
		end
	end
end

function var_0_0.FocusNode(arg_73_0, arg_73_1, arg_73_2)
	local var_73_0 = arg_73_0.roomsTF:Find(tostring(arg_73_1)).anchoredPosition * -1

	var_73_0.x = math.clamp(var_73_0.x, -arg_73_0.extendLimit.x, arg_73_0.extendLimit.x)
	var_73_0.y = math.clamp(var_73_0.y, -arg_73_0.extendLimit.y, arg_73_0.extendLimit.y)

	if arg_73_0.twFocusId then
		LeanTween.cancel(arg_73_0.twFocusId)

		arg_73_0.twFocusId = nil
	end

	local var_73_1 = {}

	table.insert(var_73_1, function(arg_74_0)
		SetCompomentEnabled(arg_73_0.mapTF, typeof(ScrollRect), false)

		local var_74_0 = (arg_73_0.mapTF.anchoredPosition - var_73_0).magnitude
		local var_74_1 = var_74_0 > 0 and var_74_0 / (40 * math.sqrt(var_74_0)) or 0

		arg_73_0.twFocusId = LeanTween.move(arg_73_0.mapTF, Vector3(var_73_0.x, var_73_0.y, 0), var_74_1):setEase(LeanTweenType.easeInOutSine):setOnUpdate(System.Action_float(function(arg_75_0)
			arg_73_0:onDragFunction()
		end)):setOnComplete(System.Action(arg_74_0)).uniqueId
	end)
	seriesAsync(var_73_1, function()
		SetCompomentEnabled(arg_73_0.mapTF, typeof(ScrollRect), true)

		if arg_73_2 then
			arg_73_2()
		end
	end)
end

function var_0_0.SwitchMode(arg_77_0, arg_77_1, arg_77_2)
	arg_77_0.mode = arg_77_1

	local var_77_0 = arg_77_0.mode == var_0_0.MODE_NORMAL

	setActive(arg_77_0.focusTF, var_77_0)

	local var_77_1 = arg_77_0.mapTF.localScale.x
	local var_77_2 = var_77_0 and 1 or arg_77_0.fullFactor

	arg_77_0:managedTween(LeanTween.value, nil, go(arg_77_0.mapTF), var_77_1, var_77_2, var_0_0.SCALE_ANIM_TIME):setEase(LeanTweenType.easeInOutSine):setOnUpdate(System.Action_float(function(arg_78_0)
		setLocalScale(arg_77_0.mapTF, {
			x = arg_78_0,
			y = arg_78_0,
			z = arg_78_0
		})
	end))

	if not var_77_0 then
		arg_77_0:managedTween(LeanTween.move, nil, go(arg_77_0.mapTF), Vector3(0, 0, 0), var_0_0.SCALE_ANIM_TIME):setEase(LeanTweenType.easeInOutSine):setOnComplete(System.Action(function()
			if arg_77_2 then
				arg_77_2()
			end
		end))
	elseif arg_77_2 then
		arg_77_2()
	end
end

function var_0_0.PlayAnim(arg_80_0, arg_80_1, arg_80_2)
	seriesAsync({
		function(arg_81_0)
			if not arg_80_0.swithAnimTF then
				PoolMgr.GetInstance():GetUI("OtherworldCoverUI", true, function(arg_82_0)
					arg_80_0.swithAnimTF = arg_82_0.transform

					setParent(arg_80_0.swithAnimTF, arg_80_0._tf, false)
					setActive(arg_80_0.swithAnimTF, false)
					arg_81_0()
				end)
			else
				arg_81_0()
			end
		end,
		function(arg_83_0)
			setActive(arg_80_0.swithAnimTF, true)

			local var_83_0 = arg_80_0.swithAnimTF:Find("yuncaizhuanchang"):GetComponent(typeof(SpineAnimUI))

			var_83_0:SetActionCallBack(function(arg_84_0)
				if arg_84_0 == "finish" then
					if arg_80_2 then
						arg_80_2()
					end

					setActive(arg_80_0.swithAnimTF, false)
				elseif arg_84_0 == "action" and arg_80_1 then
					arg_80_1()
				end
			end)
			var_83_0:SetAction("action", 0)
		end
	}, function()
		return
	end)
end

function var_0_0.onBackPressed(arg_86_0)
	if arg_86_0.timePage and arg_86_0.timePage:GetLoaded() and arg_86_0.timePage:isShowing() then
		return
	end

	var_0_0.super.onBackPressed(arg_86_0)
end

function var_0_0.willExit(arg_87_0)
	arg_87_0.timePage:Destroy()

	arg_87_0.timePage = nil

	arg_87_0.roomPage:Destroy()

	arg_87_0.roomPage = nil

	for iter_87_0, iter_87_1 in pairs(arg_87_0.roomChars) do
		if iter_87_1[1] and iter_87_1[2] then
			PoolMgr.GetInstance():ReturnSpineChar(iter_87_1[1], iter_87_1[2])
		end
	end

	arg_87_0.roomChars = nil

	if arg_87_0.finishTimer ~= nil then
		arg_87_0.finishTimer:Stop()

		arg_87_0.finishTimer = nil
	end
end

return var_0_0
