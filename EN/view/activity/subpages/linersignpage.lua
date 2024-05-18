local var_0_0 = class("LinerSignPage", import("view.base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0:findTF("AD")
	arg_1_0.signTF = arg_1_0:findTF("sign", arg_1_0.bg)
	arg_1_0.items = arg_1_0:findTF("items", arg_1_0.signTF)
	arg_1_0.uilist = UIItemList.New(arg_1_0.items, arg_1_0:findTF("tpl", arg_1_0.items))
	arg_1_0.signBtn = arg_1_0:findTF("get", arg_1_0.signTF)
	arg_1_0.signGreyBtn = arg_1_0:findTF("get_grey", arg_1_0.signTF)
	arg_1_0.countText = arg_1_0:findTF("count_bg/count", arg_1_0.signTF)
	arg_1_0.namedTF = arg_1_0:findTF("named", arg_1_0.bg)
	arg_1_0.nameInput = arg_1_0:findTF("input/nickname", arg_1_0.namedTF)
	arg_1_0.sureBtn = arg_1_0:findTF("sure", arg_1_0.namedTF)
	arg_1_0.linerTF = arg_1_0:findTF("liner", arg_1_0.bg)
	arg_1_0.linerInput = arg_1_0:findTF("name/input", arg_1_0.linerTF)
	arg_1_0.linerBtn = arg_1_0:findTF("go", arg_1_0.linerTF)

	setText(arg_1_0:findTF("lock/Text", arg_1_0.linerBtn), i18n("liner_sign_unlock_tip"))
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.nday = 0
	arg_2_0.taskProxy = getProxy(TaskProxy)
	arg_2_0.taskGroup = underscore.flatten(arg_2_0.activity:getConfig("config_data"))
	arg_2_0.taskConfig = pg.task_data_template

	return updateActivityTaskStatus(arg_2_0.activity)
end

function var_0_0.OnFirstFlush(arg_3_0)
	arg_3_0.uilist:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventInit then
			local var_4_0 = arg_4_1 + 1
			local var_4_1 = arg_3_0.taskGroup[var_4_0]
			local var_4_2 = arg_3_0:findTF("item_mask/item", arg_4_2)
			local var_4_3 = Drop.Create(arg_3_0.taskConfig[var_4_1].award_display[1])

			updateDrop(var_4_2, var_4_3)
			onButton(arg_3_0, arg_4_2, function()
				arg_3_0:emit(BaseUI.ON_DROP, var_4_3)
			end, SFX_PANEL)
			GetImageSpriteFromAtlasAsync("ui/activityuipage/linersignpage_atlas", "D" .. var_4_0, arg_3_0:findTF("day", arg_4_2), true)
		elseif arg_4_0 == UIItemList.EventUpdate then
			local var_4_4 = arg_4_1 + 1
			local var_4_5 = arg_3_0.taskGroup[var_4_4]
			local var_4_6 = arg_3_0.taskProxy:getTaskById(var_4_5) or arg_3_0.taskProxy:getFinishTaskById(var_4_5)

			setActive(arg_3_0:findTF("cur", arg_4_2), var_4_4 == arg_3_0.nday)
			setActive(arg_3_0:findTF("got", arg_4_2), var_4_4 < arg_3_0.nday or var_4_6 and var_4_6:getTaskStatus() == 2)
		end
	end)
	onButton(arg_3_0, arg_3_0.signBtn, function()
		if not arg_3_0.remainCnt or arg_3_0.remainCnt <= 0 then
			return
		end

		seriesAsync({
			function(arg_7_0)
				local var_7_0 = arg_3_0.activity:getConfig("config_client").story

				if checkExist(var_7_0, {
					arg_3_0.nday
				}, {
					1
				}) then
					pg.NewStoryMgr.GetInstance():Play(var_7_0[arg_3_0.nday][1], arg_7_0)
				else
					arg_7_0()
				end
			end,
			function(arg_8_0)
				if arg_3_0.curTaskVO:getTaskStatus() == 1 then
					arg_3_0:emit(ActivityMediator.ON_TASK_SUBMIT, arg_3_0.curTaskVO, arg_8_0)
				else
					arg_8_0()
				end
			end
		})
	end, SFX_PANEL)
	setInputText(arg_3_0.nameInput, getProxy(PlayerProxy):getRawData():GetName())
	onButton(arg_3_0, arg_3_0.sureBtn, function()
		local var_9_0 = getInputText(arg_3_0.nameInput)

		if var_9_0 == "" then
			return
		end

		if not nameValidityCheck(var_9_0, 4, 14, {
			"spece_illegal_tip",
			"login_newPlayerScene_name_tooShort",
			"login_newPlayerScene_name_tooLong",
			"login_newPlayerScene_invalideName"
		}) then
			return
		end

		arg_3_0:emit(ActivityMediator.STORE_DATE, {
			actId = ActivityConst.LINER_NAMED_ID,
			strValue = var_9_0,
			callback = function()
				arg_3_0:OnUpdateFlush()
			end
		})
	end, SFX_PANEL)
	onInputEndEdit(arg_3_0, arg_3_0.linerInput, function(arg_11_0)
		if not arg_3_0:IsNamed() then
			return
		end

		if not nameValidityCheck(arg_11_0, 4, 14, {
			"spece_illegal_tip",
			"login_newPlayerScene_name_tooShort",
			"login_newPlayerScene_name_tooLong",
			"login_newPlayerScene_invalideName"
		}) then
			setInputText(arg_3_0.linerInput, arg_3_0.lastName)

			return
		else
			arg_3_0:emit(ActivityMediator.STORE_DATE, {
				actId = ActivityConst.LINER_NAMED_ID,
				strValue = arg_11_0,
				callback = function()
					arg_3_0:OnUpdateFlush()
				end
			})
		end
	end)
	onButton(arg_3_0, arg_3_0.linerBtn, function()
		if arg_3_0:IsLockLiner() then
			return
		end

		arg_3_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.LINER)
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_14_0)
	arg_14_0.nday = arg_14_0.activity.data3

	local var_14_0 = arg_14_0:IsFinishSign()

	setActive(arg_14_0.signTF, not var_14_0)
	setActive(arg_14_0.namedTF, var_14_0 and not arg_14_0:IsNamed())
	setActive(arg_14_0.linerTF, var_14_0 and arg_14_0:IsNamed())
	setActive(arg_14_0:findTF("lock", arg_14_0.linerBtn), arg_14_0:IsLockLiner())

	if not var_14_0 then
		local var_14_1 = arg_14_0.taskGroup[arg_14_0.nday]

		arg_14_0.curTaskVO = arg_14_0.taskProxy:getTaskById(var_14_1) or arg_14_0.taskProxy:getFinishTaskById(var_14_1)
		arg_14_0.remainCnt = math.min(arg_14_0.activity:getDayIndex(), #arg_14_0.taskGroup) - arg_14_0.nday

		if arg_14_0.curTaskVO:getTaskStatus() == 1 then
			arg_14_0.remainCnt = arg_14_0.remainCnt + 1
		end

		setActive(arg_14_0.signBtn, arg_14_0.remainCnt > 0)
		setActive(arg_14_0.signGreyBtn, arg_14_0.remainCnt <= 0)
		setText(arg_14_0.countText, i18n("liner_sign_cnt_tip") .. arg_14_0.remainCnt)
		arg_14_0.uilist:align(#arg_14_0.taskGroup)
	else
		arg_14_0.lastName = getProxy(ActivityProxy):getActivityById(ActivityConst.LINER_NAMED_ID):getStrData1()

		setInputText(arg_14_0.linerInput, arg_14_0.lastName)
	end
end

function var_0_0.IsFinishSign(arg_15_0)
	local var_15_0 = arg_15_0.taskGroup[#arg_15_0.taskGroup]
	local var_15_1 = arg_15_0.taskProxy:getTaskById(var_15_0) or arg_15_0.taskProxy:getFinishTaskById(var_15_0)

	return var_15_1 and var_15_1:getTaskStatus() == 2
end

function var_0_0.IsNamed(arg_16_0)
	local var_16_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.LINER_NAMED_ID)

	return var_16_0 and not var_16_0:isEnd() and var_16_0:getStrData1() ~= ""
end

function var_0_0.IsLockLiner(arg_17_0)
	local var_17_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.LINER_ID)

	return not var_17_0 or var_17_0:isEnd()
end

return var_0_0
