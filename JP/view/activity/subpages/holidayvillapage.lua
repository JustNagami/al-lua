local var_0_0 = class("HolidayVillaPage", import("view.base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0:findTF("AD")
	arg_1_0.signTF = arg_1_0:findTF("sign", arg_1_0.bg)
	arg_1_0.getBtn = arg_1_0:findTF("get", arg_1_0.signTF)
	arg_1_0.got = arg_1_0:findTF("got", arg_1_0.signTF)
	arg_1_0.getBtn_tip = arg_1_0:findTF("get/tip", arg_1_0.signTF)
	arg_1_0.countbg = arg_1_0:findTF("count_bg", arg_1_0.signTF)
	arg_1_0.countText = arg_1_0:findTF("count_bg/count", arg_1_0.signTF)
	arg_1_0.go = arg_1_0:findTF("go_btn", arg_1_0.signTF)
	arg_1_0.Notbtn = arg_1_0:findTF("Not_unlocked", arg_1_0.signTF)
	arg_1_0.list = {
		arg_1_0:findTF("list/unfinished_1", arg_1_0.signTF),
		arg_1_0:findTF("list/unfinished_2", arg_1_0.signTF),
		arg_1_0:findTF("list/unfinished_3", arg_1_0.signTF),
		arg_1_0:findTF("list/unfinished_4", arg_1_0.signTF),
		arg_1_0:findTF("list/unfinished_5", arg_1_0.signTF)
	}

	setActive(arg_1_0.go, false)
	setActive(arg_1_0.Notbtn, false)
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.nday = 0
	arg_2_0.taskProxy = getProxy(TaskProxy)
	arg_2_0.taskGroup = underscore.flatten(arg_2_0.activity:getConfig("config_data"))
	arg_2_0.preStory = arg_2_0.activity:getConfig("config_client").preStory

	return updateActivityTaskStatus(arg_2_0.activity)
end

function var_0_0.OnFirstFlush(arg_3_0)
	for iter_3_0 = 1, #arg_3_0.list do
		setActive(arg_3_0:findTF("accomplish", arg_3_0.list[iter_3_0]), false)
		setActive(arg_3_0:findTF("Check_point", arg_3_0.list[iter_3_0]), false)
	end

	onButton(arg_3_0, arg_3_0.getBtn, function()
		if not arg_3_0.remainCnt or arg_3_0.remainCnt <= 0 then
			return
		end

		seriesAsync({
			function(arg_5_0)
				local var_5_0 = arg_3_0.activity:getConfig("config_client").story

				if checkExist(var_5_0, {
					arg_3_0.nday
				}, {
					1
				}) then
					pg.NewStoryMgr.GetInstance():Play(var_5_0[arg_3_0.nday][1], arg_5_0)
				else
					arg_5_0()
				end
			end,
			function(arg_6_0)
				if arg_3_0.curTaskVO:getTaskStatus() == 1 then
					arg_3_0:emit(ActivityMediator.ON_TASK_SUBMIT, arg_3_0.curTaskVO, arg_6_0)
				else
					arg_6_0()
				end
			end
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.go, function()
		if arg_3_0:IsLockLiner() then
			return
		end

		seriesAsync({
			function(arg_8_0)
				if not pg.NewStoryMgr.GetInstance():IsPlayed(arg_3_0.preStory) then
					pg.NewStoryMgr.GetInstance():Play(arg_3_0.preStory, arg_8_0)
				else
					arg_8_0()
				end
			end
		}, function()
			local var_9_0 = Context.New({
				mediator = HolidayVillaMapScene,
				viewComponent = HolidayVillaMapMediator
			})

			arg_3_0:emit(ActivityMediator.ON_ADD_SUBLAYER, var_9_0)
		end)
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_10_0)
	arg_10_0.nday = arg_10_0.activity.data3

	local var_10_0 = arg_10_0:IsFinishSign()

	arg_10_0.count = 0

	for iter_10_0 = 1, #arg_10_0.taskGroup do
		arg_10_0.curTaskVO = arg_10_0.taskProxy:getTaskVO(arg_10_0.taskGroup[iter_10_0])

		if arg_10_0.curTaskVO ~= nil and arg_10_0.curTaskVO:getTaskStatus() == 2 then
			arg_10_0.count = iter_10_0
		end
	end

	setActive(arg_10_0.got, false)
	setActive(arg_10_0.go, not arg_10_0:IsLockLiner() and arg_10_0.count >= 5)
	setActive(arg_10_0.Notbtn, arg_10_0:IsLockLiner())

	if not var_10_0 then
		setActive(arg_10_0.Notbtn, false)

		local var_10_1 = arg_10_0.taskGroup[arg_10_0.nday]

		arg_10_0.curTaskVO = arg_10_0.taskProxy:getTaskById(var_10_1) or arg_10_0.taskProxy:getFinishTaskById(var_10_1)
		arg_10_0.remainCnt = math.min(arg_10_0.activity:getDayIndex(), #arg_10_0.taskGroup) - arg_10_0.nday

		if arg_10_0.curTaskVO:getTaskStatus() == 1 then
			arg_10_0.remainCnt = arg_10_0.remainCnt + 1
		end

		warning("self.remainCnt   :", arg_10_0.remainCnt)
		setActive(arg_10_0.getBtn_tip, arg_10_0.remainCnt > 0)
		setActive(arg_10_0.getBtn, arg_10_0.remainCnt > 0)
		setActive(arg_10_0.got, arg_10_0.remainCnt == 0)
		setActive(arg_10_0.countbg, true)
		setText(arg_10_0.countText, i18n("liner_sign_cnt_tip") .. arg_10_0.remainCnt)
	else
		setActive(arg_10_0.countbg, false)
		setActive(arg_10_0.getBtn, false)
	end

	for iter_10_1 = 1, #arg_10_0.list do
		setActive(arg_10_0:findTF("accomplish", arg_10_0.list[iter_10_1]), false)
		setActive(arg_10_0:findTF("Check_point", arg_10_0.list[iter_10_1]), false)

		if arg_10_0.count > 0 and iter_10_1 <= arg_10_0.count then
			setActive(arg_10_0:findTF("accomplish", arg_10_0.list[iter_10_1]), true)

			arg_10_0.list[iter_10_1]:GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 0)
		end
	end

	if arg_10_0.count + 1 <= 5 then
		setActive(arg_10_0:findTF("Check_point", arg_10_0.list[arg_10_0.count + 1]), true)
	end
end

function var_0_0.IsFinishSign(arg_11_0)
	local var_11_0 = arg_11_0.taskGroup[#arg_11_0.taskGroup]
	local var_11_1 = arg_11_0.taskProxy:getTaskById(var_11_0) or arg_11_0.taskProxy:getFinishTaskById(var_11_0)

	return var_11_1 and var_11_1:getTaskStatus() == 2
end

function var_0_0.IsLockLiner(arg_12_0)
	local var_12_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.HOLIDAY_ACT_ID)

	return not var_12_0 or var_12_0:isEnd()
end

return var_0_0
