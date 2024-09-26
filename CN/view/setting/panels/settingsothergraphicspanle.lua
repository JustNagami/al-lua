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

function var_0_0.JumpToCustomSetting(arg_6_0, arg_6_1)
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGraphics(4))
	PlayerPrefs.SetInt("dorm3d_graphics_settings", 4)

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.playerSettingPlaySet) do
		local var_6_0

		if iter_6_1.type == var_0_1.toggle then
			var_6_0 = iter_6_1.value and 2 or 1
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

function var_0_0.UpdateItem(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.list[arg_7_1]
	local var_7_1 = pg.dorm3d_graphic_setting[var_7_0.cfgId]
	local var_7_2 = arg_7_2:Find("mask/Text")

	setText(var_7_2, var_7_1.settingName)

	local var_7_3 = var_7_1.displayType == var_0_1.toggle
	local var_7_4 = arg_7_2:Find("toggle")
	local var_7_5 = arg_7_2:Find("select")

	setActive(var_7_4, var_7_3)
	setActive(var_7_5, not var_7_3)

	if var_7_3 then
		local function var_7_6(arg_8_0)
			local var_8_0 = arg_8_0 and 2 or 1

			return {
				name = var_7_0.playerPrefsname,
				value = var_8_0
			}
		end

		local var_7_7 = arg_7_2:Find("toggle/off")
		local var_7_8 = arg_7_2:Find("toggle/on")
		local var_7_9

		local function var_7_10(arg_9_0)
			var_7_9 = arg_9_0

			SetActive(var_7_7:Find("show"), not arg_9_0)
			SetActive(var_7_8:Find("show"), arg_9_0)
		end

		onButton(arg_7_0, var_7_8, function()
			if var_7_9 == true then
				return
			end

			if var_7_0.tips then
				local var_10_0 = {}

				table.insert(var_10_0, function(arg_11_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						type = MSGBOX_TYPE_NORMAL,
						content = var_7_0.tips,
						onYes = function()
							arg_11_0()
						end,
						onNo = function()
							return
						end
					})
				end)
				seriesAsync(var_10_0, function()
					var_7_10(true)

					local var_14_0 = var_7_6(true)

					arg_7_0:JumpToCustomSetting(var_14_0)
				end)
			else
				var_7_10(true)

				local var_10_1 = var_7_6(true)

				arg_7_0:JumpToCustomSetting(var_10_1)
			end
		end, SFX_CANCEL)
		onButton(arg_7_0, var_7_7, function()
			if var_7_9 == false then
				return
			end

			var_7_10(false)

			local var_15_0 = var_7_6(false)

			arg_7_0:JumpToCustomSetting(var_15_0)
		end, SFX_CANCEL)

		local var_7_11
		local var_7_12 = PlayerPrefs.GetInt(var_7_0.playerPrefsname, 0)

		if arg_7_0.customSetting and var_7_12 ~= 0 then
			var_7_11 = var_7_12 == 2 and true or false
		else
			var_7_11 = ReflectionHelp.RefGetField(arg_7_0.qualitySettingAssetType, var_7_0.CsharpValue, arg_7_0.qualitySettingAsset)
		end

		var_7_10(var_7_11)
		table.insert(arg_7_0.playerSettingPlaySet, {
			name = var_7_0.playerPrefsname,
			value = var_7_11,
			type = var_7_1.displayType
		})
	else
		local var_7_13 = ReflectionHelp.RefGetField(arg_7_0.qualitySettingAssetType, var_7_0.CsharpValue, arg_7_0.qualitySettingAsset)
		local var_7_14
		local var_7_15 = PlayerPrefs.GetInt(var_7_0.playerPrefsname, 0)

		if arg_7_0.customSetting and var_7_15 ~= 0 then
			var_7_14 = var_7_15
		else
			local var_7_16 = ReflectionHelp.RefGetField(arg_7_0.qualitySettingAssetType, var_7_0.CsharpValue, arg_7_0.qualitySettingAsset)

			var_7_14 = var_7_0.Enum[tostring(var_7_16)]
		end

		local function var_7_17()
			local var_16_0 = var_7_14 == 1
			local var_16_1 = var_7_14 == #var_7_1.dispaySelectName

			setActive(var_7_5:Find("leftbu"), not var_16_0)
			setActive(var_7_5:Find("rightbu"), not var_16_1)
			setText(var_7_5:Find("Text"), var_7_1.dispaySelectName[var_7_14])
		end

		var_7_17()
		onButton(arg_7_0, var_7_5:Find("leftbu"), function()
			var_7_14 = var_7_14 - 1

			var_7_17()
			arg_7_0:JumpToCustomSetting({
				name = var_7_0.playerPrefsname,
				value = var_7_14
			})
		end)
		onButton(arg_7_0, var_7_5:Find("rightbu"), function()
			var_7_14 = var_7_14 + 1

			var_7_17()
			arg_7_0:JumpToCustomSetting({
				name = var_7_0.playerPrefsname,
				value = var_7_14
			})
		end)
		table.insert(arg_7_0.playerSettingPlaySet, {
			name = var_7_0.playerPrefsname,
			value = var_7_14,
			type = var_7_1.displayType
		})
	end
end

function var_0_0.OnUpdate(arg_19_0)
	if not arg_19_0.init then
		return
	end

	arg_19_0.playerSettingPlaySet = {}
	arg_19_0.customSetting = PlayerPrefs.GetInt("dorm3d_graphics_settings", 1) == 4

	local var_19_0 = var_0_2[PlayerPrefs.GetInt("dorm3d_graphics_settings", 2)]

	arg_19_0.qualitySettingAsset = ResourceMgr.Inst:getAssetSync("three3dquaitysettings/defaultsettings", var_19_0, nil, true, true)
	arg_19_0.qualitySettingAssetType = arg_19_0.qualitySettingAsset:GetType()
	arg_19_0.list = arg_19_0:GetList()

	arg_19_0.uilist:align(#arg_19_0.list)
end

function var_0_0.RefreshPanelByGraphcLevel(arg_20_0)
	arg_20_0:OnUpdate()
end

function var_0_0.GetList(arg_21_0)
	local var_21_0 = {}

	for iter_21_0, iter_21_1 in ipairs(var_0_3) do
		local var_21_1 = pg.dorm3d_graphic_setting[iter_21_1.cfgId]
		local var_21_2 = arg_21_0:GetParentSetting(var_21_1.parentSetting)
		local var_21_3 = false

		if var_21_2 then
			local var_21_4 = PlayerPrefs.GetInt(var_21_2.playerPrefsname, 0)
			local var_21_5

			if arg_21_0.customSetting and var_21_4 ~= 0 then
				var_21_5 = var_21_4
			else
				local var_21_6 = ReflectionHelp.RefGetField(arg_21_0.qualitySettingAssetType, var_21_2.CsharpValue, arg_21_0.qualitySettingAsset)

				var_21_5 = var_21_2.Enum[tostring(var_21_6)]
			end

			var_21_3 = var_21_5 == 1
		end

		if not (var_21_1.isShow == 0 or var_21_3) then
			table.insert(var_21_0, iter_21_1)
		end
	end

	return var_21_0
end

function var_0_0.GetParentSetting(arg_22_0, arg_22_1)
	for iter_22_0, iter_22_1 in ipairs(var_0_3) do
		if iter_22_1.cfgId == arg_22_1 then
			return iter_22_1
		end
	end

	return nil
end

return var_0_0
