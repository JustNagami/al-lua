local var_0_0 = class("MaoxiV4TaskPage", import(".TemplatePage.SkinTemplatePage"))

function var_0_0.OnUpdateFlush(arg_1_0)
	arg_1_0.nday = arg_1_0.activity.data3

	arg_1_0:PlayStory()

	if arg_1_0.dayTF then
		setText(arg_1_0.dayTF, tostring(arg_1_0.nday))
	end

	arg_1_0.uilist:align(#arg_1_0.taskGroup[arg_1_0.nday])
end

function var_0_0.PlayStory(arg_2_0)
	local var_2_0 = arg_2_0.activity:getConfig("config_client").story
	local var_2_1 = arg_2_0.activity:getConfig("config_client").specialstory
	local var_2_2

	if arg_2_0.nday == 1 then
		local var_2_3 = arg_2_0.taskGroup[arg_2_0.nday][1]
		local var_2_4 = arg_2_0.taskGroup[arg_2_0.nday][2]
		local var_2_5 = arg_2_0.taskProxy:getTaskVO(var_2_3)
		local var_2_6 = arg_2_0.taskProxy:getTaskVO(var_2_4)

		if var_2_5:isReceive() and var_2_6:isReceive() then
			var_2_2 = var_2_1[1]
		else
			var_2_2 = var_2_0[arg_2_0.nday]
		end
	elseif arg_2_0.nday == 2 then
		if not pg.NewStoryMgr.GetInstance():IsPlayed(var_2_1[1]) then
			var_2_2 = var_2_1[1]
		else
			var_2_2 = var_2_0[arg_2_0.nday]
		end
	elseif arg_2_0.nday == #var_2_0 then
		local var_2_7 = arg_2_0.taskGroup[arg_2_0.nday][1]
		local var_2_8 = arg_2_0.taskGroup[arg_2_0.nday][2]
		local var_2_9 = arg_2_0.taskProxy:getTaskVO(var_2_7)
		local var_2_10 = arg_2_0.taskProxy:getTaskVO(var_2_8)

		if var_2_9:isReceive() and var_2_10:isReceive() then
			var_2_2 = var_2_1[2]
		else
			var_2_2 = var_2_0[arg_2_0.nday]
		end
	else
		var_2_2 = var_2_0[arg_2_0.nday]
	end

	print("story name:" .. var_2_2)
	pg.NewStoryMgr.GetInstance():Play(var_2_2)
end

return var_0_0
