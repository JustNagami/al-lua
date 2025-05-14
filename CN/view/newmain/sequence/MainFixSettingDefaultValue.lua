local var_0_0 = class("MainFixSettingDefaultValue")

function var_0_0.Execute(arg_1_0, arg_1_1)
	local var_1_0 = pg.settings_other_template

	for iter_1_0, iter_1_1 in ipairs(var_1_0.all) do
		local var_1_1 = _G[var_1_0[iter_1_1].name]
		local var_1_2 = var_1_0[iter_1_1].default

		if var_1_1 ~= "" and not PlayerPrefs.HasKey(var_1_1) then
			PlayerPrefs.SetInt(var_1_1, var_1_2)
		end
	end

	arg_1_0:FixMainSceneSettings()
	PlayerPrefs.Save()
	arg_1_0:FixPlayerPrefsKey()
	arg_1_1()
end

function var_0_0.FixMainSceneSettings(arg_2_0)
	local var_2_0 = {
		SettingsMainScenePanel.STANDBY_MODE_KEY,
		SettingsMainScenePanel.FLAGSHIP_INTERACTION_KEY
	}

	for iter_2_0, iter_2_1 in ipairs(var_2_0) do
		local var_2_1 = iter_2_1 .. "_" .. getProxy(PlayerProxy):getRawData().id

		if not PlayerPrefs.HasKey(var_2_1) then
			PlayerPrefs.SetInt(var_2_1, 1)
		end
	end
end

function var_0_0.FixPlayerPrefsKey(arg_3_0)
	local var_3_0 = getProxy(PlayerProxy):getRawData()

	USAGE_NEW_MAINUI = "USAGE_NEW_MAINUI" .. var_3_0.id

	local var_3_1 = PlayerPrefs.GetInt(USAGE_NEW_MAINUI, 1)

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildNewMainUI({
		isLogin = 1,
		isNewMainUI = var_3_1
	}))
end

return var_0_0
