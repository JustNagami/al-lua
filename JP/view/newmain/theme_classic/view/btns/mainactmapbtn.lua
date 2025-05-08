local var_0_0 = class("MainActMapBtn", import(".MainBaseActivityBtn"))

function var_0_0.GetEventName(arg_1_0)
	return "event_map"
end

function var_0_0.GetActivity(arg_2_0)
	if arg_2_0.config.time and arg_2_0.config.time[1] == "default" then
		local var_2_0 = arg_2_0.config.time[2]
		local var_2_1 = pg.activity_template[var_2_0].type
		local var_2_2 = getProxy(ActivityProxy):getActivitiesByType(var_2_1)

		return (_.detect(var_2_2, function(arg_3_0)
			return not arg_3_0:isEnd()
		end))
	end

	return nil
end

function var_0_0.GetActivityID(arg_4_0)
	local var_4_0 = arg_4_0:GetActivity()

	return var_4_0 and var_4_0.id
end

function var_0_0.OnInit(arg_5_0)
	setActive(arg_5_0.tipTr.gameObject, arg_5_0:IsShowTip())
end

function var_0_0.IsShowTip(arg_6_0)
	if arg_6_0:GetActivityID() == ActivityConst.OTHER_WORLD_TERMINAL_BATTLE_ID then
		return OtherworldMapScene.IsShowTip()
	end

	return getProxy(ChapterProxy):IsActivitySPChapterActive() and SettingsProxy.IsShowActivityMapSPTip()
end

function var_0_0.CustomOnClick(arg_7_0)
	local var_7_0 = arg_7_0:GetActivity()

	if var_7_0 then
		local var_7_1 = var_7_0:getConfig("type")

		if var_7_1 == ActivityConst.ACTIVITY_TYPE_BOSSRUSH then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_MAIN)
		elseif var_7_1 == ActivityConst.ACTIVITY_TYPE_ZPROJECT then
			arg_7_0:emit(NewMainMediator.SKIP_ACTIVITY_MAP, var_7_0.id)
		end
	end
end

return var_0_0
