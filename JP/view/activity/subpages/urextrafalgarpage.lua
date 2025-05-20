local var_0_0 = class("UrExTrafalgarPage", import(".TemplatePage.UrExchangeTemplatePage"))
local var_0_1 = pg.activity_holiday_site

function var_0_0.UpdateTask(arg_1_0, arg_1_1, arg_1_2)
	if not arg_1_0.isLinkActOpen then
		return
	end

	local var_1_0 = arg_1_1 + 1
	local var_1_1, var_1_2, var_1_3 = unpack(arg_1_0.taskConfig[var_1_0])
	local var_1_4, var_1_5 = var_0_0.taskTypeDic[var_1_1](arg_1_0, var_1_3)

	setText(arg_1_0:findTF("name", arg_1_2), var_1_2)
	setText(arg_1_0:findTF("count", arg_1_2), var_1_4)
	setActive(arg_1_0:findTF("complete", arg_1_2), var_1_5 == nil)
	setActive(arg_1_0:findTF("btn_go", arg_1_2), var_1_5 ~= nil)

	if arg_1_1 == 4 then
		onButton(arg_1_0, arg_1_0:findTF("btn_go", arg_1_2), function()
			local var_2_0 = getProxy(TaskProxy)
			local var_2_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.HOLIDAY_ACT_ID):getConfig("config_client").function_id
			local var_2_2 = var_0_1[var_2_1[3]].task_id

			if var_2_0:getFinishTaskById(var_2_2) then
				onButton(arg_1_0, arg_1_0:findTF("btn_go", arg_1_2), function()
					var_1_5()
					pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildUrJump(var_1_1))
				end)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("challenge_minigame_unlock"))
			end
		end, SFX_PANEL)
	elseif arg_1_1 ~= 4 and var_1_5 then
		onButton(arg_1_0, arg_1_0:findTF("btn_go", arg_1_2), function()
			var_1_5()
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildUrJump(var_1_1))
		end)
	end
end

return var_0_0
