local var_0_0 = class("SettingsOtherGraphicsPanle", import(".SettingsBasePanel"))

var_0_0.EVT_UPDTAE = "SettingsOtherGraphicsPanle:EVT_UPDTAE"

local var_0_1 = {
	toggle = 1,
	select = 2
}
local var_0_2 = GraphicSettingConst.assetPath
local var_0_3 = GraphicSettingConst.settings

function var_0_0.GetUIName(arg_1_0)
	return "GraphicSettingsOther"
end

function var_0_0.GetTitle(arg_2_0)
	return i18n("grapihcs3d_setting_universal")
end

function var_0_0.GetTitleEn(arg_3_0)
	return "  / STANDBY MODE SETTINGS"
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.init = true
	arg_4_0.uilist = UIItemList.New(arg_4_0._tf:Find("options"), arg_4_0._tf:Find("options/notify_tpl"))

	arg_4_0.uilist:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			arg_4_0:UpdateItem(arg_5_1 + 1, arg_5_2)
		end
	end)
end

function var_0_0.JumpToCustomSettingSetChild(arg_6_0, arg_6_1)
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGraphics(4))
	PlayerPrefs.SetInt("dorm3d_graphics_settings", 4)

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.playerSettingPlaySet) do
		local var_6_0

		if iter_6_1.type == var_0_1.toggle then
			var_6_0 = iter_6_1.value and 2 or 1

			if iter_6_1.hasParent then
				var_6_0 = 1
			end
		else
			var_6_0 = iter_6_1.value
		end

		if arg_6_1 ~= nil and iter_6_1.name == arg_6_1.name then
			PlayerPrefs.SetInt(arg_6_1.name, arg_6_1.value)
		else
			PlayerPrefs.SetInt(iter_6_1.name, var_6_0)
		end
	end

	pg.m02:sendNotification(NewSettingsMediator.SelectCustomGraphicSetting)
end

function var_0_0.JumpToCustomSetting(arg_7_0, arg_7_1)
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGraphics(4))
	PlayerPrefs.SetInt("dorm3d_graphics_settings", 4)

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.playerSettingPlaySet) do
		local var_7_0

		if iter_7_1.type == var_0_1.toggle then
			var_7_0 = iter_7_1.value and 2 or 1
		else
			var_7_0 = iter_7_1.value
		end

		if arg_7_1 ~= nil and iter_7_1.name == arg_7_1.name then
			PlayerPrefs.SetInt(arg_7_1.name, arg_7_1.value)
		else
			PlayerPrefs.SetInt(iter_7_1.name, var_7_0)
		end
	end

	pg.m02:sendNotification(NewSettingsMediator.SelectCustomGraphicSetting)
end

function var_0_0.UpdateItem(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.list[arg_8_1]
	local var_8_1 = pg.dorm3d_graphic_setting[var_8_0.cfgId]
	local var_8_2 = arg_8_2:Find("mask/Text")

	setText(var_8_2, var_8_1.settingName)

	local var_8_3 = var_8_1.displayType == var_0_1.toggle
	local var_8_4 = arg_8_2:Find("toggle")
	local var_8_5 = arg_8_2:Find("select")

	setActive(var_8_4, var_8_3)
	setActive(var_8_5, not var_8_3)

	if var_8_3 then
		local function var_8_6(arg_9_0)
			local var_9_0 = arg_9_0 and 2 or 1

			return {
				name = var_8_0.playerPrefsname,
				value = var_9_0
			}
		end

		local var_8_7 = arg_8_2:Find("toggle/off")
		local var_8_8 = arg_8_2:Find("toggle/on")
		local var_8_9

		local function var_8_10(arg_10_0)
			var_8_9 = arg_10_0

			SetActive(var_8_7:Find("show"), not arg_10_0)
			SetActive(var_8_8:Find("show"), arg_10_0)
		end

		onButton(arg_8_0, var_8_8, function()
			if var_8_9 == true then
				return
			end

			if var_8_0.tips then
				local var_11_0 = {}

				table.insert(var_11_0, function(arg_12_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						type = MSGBOX_TYPE_NORMAL,
						content = var_8_0.tips,
						onYes = function()
							arg_12_0()
						end,
						onNo = function()
							return
						end
					})
				end)
				seriesAsync(var_11_0, function()
					var_8_10(true)

					local var_15_0 = var_8_6(true)

					arg_8_0:JumpToCustomSetting(var_15_0)
				end)
			else
				var_8_10(true)

				local var_11_1 = var_8_6(true)

				arg_8_0:JumpToCustomSetting(var_11_1)
			end
		end, SFX_CANCEL)
		onButton(arg_8_0, var_8_7, function()
			if var_8_9 == false then
				return
			end

			var_8_10(false)

			local var_16_0 = var_8_6(false)

			arg_8_0:JumpToCustomSetting(var_16_0)
		end, SFX_CANCEL)

		local var_8_11
		local var_8_12 = PlayerPrefs.GetInt(var_8_0.playerPrefsname, 0)

		if arg_8_0.customSetting and var_8_12 ~= 0 then
			var_8_11 = var_8_12 == 2 and true or false
		else
			var_8_11 = ReflectionHelp.RefGetField(arg_8_0.qualitySettingAssetType, var_8_0.CsharpValue, arg_8_0.qualitySettingAsset)
		end

		var_8_10(var_8_11)
		table.insert(arg_8_0.playerSettingPlaySet, {
			name = var_8_0.playerPrefsname,
			value = var_8_11,
			type = var_8_1.displayType,
			hasParent = var_8_0.parentSetting ~= nil
		})
	else
		local var_8_13 = ReflectionHelp.RefGetField(arg_8_0.qualitySettingAssetType, var_8_0.CsharpValue, arg_8_0.qualitySettingAsset)
		local var_8_14
		local var_8_15 = PlayerPrefs.GetInt(var_8_0.playerPrefsname, 0)

		if arg_8_0.customSetting and var_8_15 ~= 0 then
			var_8_14 = var_8_15
		else
			local var_8_16 = ReflectionHelp.RefGetField(arg_8_0.qualitySettingAssetType, var_8_0.CsharpValue, arg_8_0.qualitySettingAsset)

			var_8_14 = var_8_0.Enum[tostring(var_8_16)]
		end

		local function var_8_17()
			local var_17_0 = var_8_14 == 1
			local var_17_1 = var_8_14 == #var_8_1.dispaySelectName

			setActive(var_8_5:Find("leftbu"), not var_17_0)
			setActive(var_8_5:Find("rightbu"), not var_17_1)
			setText(var_8_5:Find("Text"), var_8_1.dispaySelectName[var_8_14])
		end

		var_8_17()
		onButton(arg_8_0, var_8_5:Find("leftbu"), function()
			var_8_14 = var_8_14 - 1

			var_8_17()

			if var_8_0.childList and var_8_14 == 1 then
				arg_8_0:JumpToCustomSettingSetChild({
					name = var_8_0.playerPrefsname,
					value = var_8_14
				})
			else
				arg_8_0:JumpToCustomSetting({
					name = var_8_0.playerPrefsname,
					value = var_8_14
				})
			end
		end)
		onButton(arg_8_0, var_8_5:Find("rightbu"), function()
			var_8_14 = var_8_14 + 1

			var_8_17()
			arg_8_0:JumpToCustomSetting({
				name = var_8_0.playerPrefsname,
				value = var_8_14
			})
		end)
		table.insert(arg_8_0.playerSettingPlaySet, {
			name = var_8_0.playerPrefsname,
			value = var_8_14,
			type = var_8_1.displayType
		})
	end
end

function var_0_0.OnUpdate(arg_20_0)
	if not arg_20_0.init then
		return
	end

	arg_20_0.playerSettingPlaySet = {}
	arg_20_0.customSetting = PlayerPrefs.GetInt("dorm3d_graphics_settings", 1) == 4

	local var_20_0 = var_0_2[PlayerPrefs.GetInt("dorm3d_graphics_settings", 2)]

	arg_20_0.qualitySettingAsset = ResourceMgr.Inst:getAssetSync("three3dquaitysettings/defaultsettings", var_20_0, nil, true, true)
	arg_20_0.qualitySettingAssetType = arg_20_0.qualitySettingAsset:GetType()
	arg_20_0.list = arg_20_0:GetList()

	arg_20_0.uilist:align(#arg_20_0.list)
end

function var_0_0.RefreshPanelByGraphcLevel(arg_21_0)
	arg_21_0:OnUpdate()
end

function var_0_0.GetList(arg_22_0)
	local var_22_0 = {}

	for iter_22_0, iter_22_1 in ipairs(var_0_3) do
		local var_22_1 = pg.dorm3d_graphic_setting[iter_22_1.cfgId]
		local var_22_2 = arg_22_0:GetParentSetting(var_22_1.parentSetting)
		local var_22_3 = false

		if var_22_2 then
			local var_22_4 = PlayerPrefs.GetInt(var_22_2.playerPrefsname, 0)
			local var_22_5

			if arg_22_0.customSetting and var_22_4 ~= 0 then
				var_22_5 = var_22_4
			else
				local var_22_6 = ReflectionHelp.RefGetField(arg_22_0.qualitySettingAssetType, var_22_2.CsharpValue, arg_22_0.qualitySettingAsset)

				var_22_5 = var_22_2.Enum[tostring(var_22_6)]
			end

			var_22_3 = var_22_5 == 1
		end

		if not (var_22_1.isShow == 0 or var_22_3) then
			table.insert(var_22_0, iter_22_1)
		end
	end

	return var_22_0
end

function var_0_0.GetParentSetting(arg_23_0, arg_23_1)
	for iter_23_0, iter_23_1 in ipairs(var_0_3) do
		if iter_23_1.cfgId == arg_23_1 then
			return iter_23_1
		end
	end

	return nil
end

return var_0_0
