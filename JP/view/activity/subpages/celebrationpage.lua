local var_0_0 = class("CelebrationPage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.rtMarks = arg_1_0._tf:Find("AD/progress")
	arg_1_0.rtFinish = arg_1_0._tf:Find("AD/award")
	arg_1_0.rtBtns = arg_1_0._tf:Find("AD/btn_list")
end

function var_0_0.OnDataSetting(arg_2_0)
	if arg_2_0.ptData then
		arg_2_0.ptData:Update(arg_2_0.activity)
	else
		arg_2_0.ptData = ActivityPtData.New(arg_2_0.activity)
	end
end

function var_0_0.OnFirstFlush(arg_3_0)
	onButton(arg_3_0, arg_3_0.rtBtns:Find("go"), function()
		local var_4_0 = Context.New({
			mediator = HolidayVillaShopMediator,
			viewComponent = HolidayVillaShopLayer
		})

		arg_3_0:emit(ActivityMediator.OPEN_LAYER, var_4_0)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.rtBtns:Find("get"), function()
		local var_5_0 = arg_3_0.ptData:GetCurrTarget()

		arg_3_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 4,
			activity_id = arg_3_0.ptData:GetId(),
			arg1 = var_5_0
		})
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_6_0)
	local var_6_0 = arg_6_0.ptData:GetCurrTarget()
	local var_6_1 = arg_6_0.ptData:GetLevel()
	local var_6_2 = arg_6_0.rtMarks.childCount

	for iter_6_0 = 1, var_6_2 do
		local var_6_3 = arg_6_0.rtMarks:GetChild(iter_6_0 - 1)

		setActive(var_6_3:Find("icon"), iter_6_0 <= var_6_0)
		setActive(var_6_3:Find("mark"), var_6_0 < iter_6_0)
	end

	setActive(arg_6_0.rtBtns:Find("get"), var_6_1 == 0 and var_6_0 >= 7)
	setActive(arg_6_0.rtBtns:Find("got"), var_6_1 > 0)
	setActive(arg_6_0.rtBtns:Find("go"), var_6_0 < 7)
	setActive(arg_6_0.rtBtns:Find("red"), var_6_1 == 0 and var_6_0 >= 7 and var_6_1 ~= 1)
end

return var_0_0
