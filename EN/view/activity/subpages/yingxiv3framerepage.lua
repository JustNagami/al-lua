local var_0_0 = class("YingxiV3FrameRePage", import(".TemplatePage.NewFrameTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0:findTF("AD")
	arg_1_0.battleBtn = arg_1_0:findTF("btn/battle_btn", arg_1_0.bg)
	arg_1_0.getBtn = arg_1_0:findTF("btn/get_btn", arg_1_0.bg)
	arg_1_0.gotBtn = arg_1_0:findTF("btn/got_btn", arg_1_0.bg)
	arg_1_0.bar = arg_1_0:findTF("barContent/bar", arg_1_0.bg)
	arg_1_0.cur = arg_1_0:findTF("progress/cur", arg_1_0.bg)
	arg_1_0.target = arg_1_0:findTF("progress/target", arg_1_0.bg)
	arg_1_0.gotTag = arg_1_0:findTF("tag/got", arg_1_0.bg)
	arg_1_0.getTag = arg_1_0:findTF("tag/get", arg_1_0.bg)
end

function var_0_0.OnFirstFlush(arg_2_0)
	onButton(arg_2_0, arg_2_0.battleBtn, function()
		arg_2_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.getBtn, function()
		arg_2_0:emit(ActivityMediator.EVENT_OPERATION, {
			cmd = 1,
			activity_id = arg_2_0.activity.id
		})
	end, SFX_PANEL)

	arg_2_0.inPhase2 = arg_2_0.timeStamp and pg.TimeMgr.GetInstance():GetServerTime() - arg_2_0.timeStamp > 0
end

function var_0_0.OnUpdateFlush(arg_5_0)
	var_0_0.super.OnUpdateFlush(arg_5_0)

	local var_5_0 = arg_5_0.activity.data1
	local var_5_1 = arg_5_0.avatarConfig.target
	local var_5_2 = arg_5_0.activity.data2 >= 1
	local var_5_3 = var_5_1 <= var_5_0

	setActive(arg_5_0.getTag, arg_5_0.inPhase2 and not var_5_2 and var_5_3)
end

return var_0_0
