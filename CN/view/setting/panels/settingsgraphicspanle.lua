local var_0_0 = class("SettingsGraphicsPanle", import(".SettingsBasePanel"))

function var_0_0.GetUIName(arg_1_0)
	return "SettingsStorySpeed"
end

function var_0_0.GetTitle(arg_2_0)
	return "3d宿舍画质设置"
end

function var_0_0.GetTitleEn(arg_3_0)
	return "  / GRAPHICS SETTING"
end

function var_0_0.OnInit(arg_4_0)
	local var_4_0 = CustomIndexLayer.Clone2Full(arg_4_0._tf:Find("speeds"), 3)

	arg_4_0.lowToggle = var_4_0[1]
	arg_4_0.mediumToggle = var_4_0[2]
	arg_4_0.highToggle = var_4_0[3]

	onToggle(arg_4_0, arg_4_0.lowToggle, function(arg_5_0)
		if arg_5_0 then
			PlayerPrefs.SetInt("dorm3d_graphics_settings", 1)
			Dorm3dScene.SettingQuality()
		end
	end, SFX_UI_TAG, SFX_UI_TAG)
	onToggle(arg_4_0, arg_4_0.mediumToggle, function(arg_6_0)
		if arg_6_0 then
			PlayerPrefs.SetInt("dorm3d_graphics_settings", 2)
			Dorm3dScene.SettingQuality()
		end
	end, SFX_UI_TAG, SFX_UI_TAG)
	onToggle(arg_4_0, arg_4_0.highToggle, function(arg_7_0)
		if arg_7_0 then
			PlayerPrefs.SetInt("dorm3d_graphics_settings", 3)
			Dorm3dScene.SettingQuality()
		end
	end, SFX_UI_TAG, SFX_UI_TAG)
	setText(arg_4_0.lowToggle:Find("Text"), "低画质720p")
	setText(arg_4_0.mediumToggle:Find("Text"), "中画质1080p")
	setText(arg_4_0.highToggle:Find("Text"), "高画质2k")
end

function var_0_0.OnUpdate(arg_8_0)
	local var_8_0 = PlayerPrefs.GetInt("dorm3d_graphics_settings", 2)

	if var_8_0 == 1 then
		triggerToggle(arg_8_0.lowToggle, true)
	elseif var_8_0 == 2 then
		triggerToggle(arg_8_0.mediumToggle, true)
	elseif var_8_0 == 3 then
		triggerToggle(arg_8_0.highToggle, true)
	end
end

return var_0_0
