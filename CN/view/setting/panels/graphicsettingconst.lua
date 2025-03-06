GraphicSettingConst = {}

local var_0_0 = GraphicSettingConst
local var_0_1 = {
	toggle = 1,
	select = 2
}

var_0_0.assetPath = {
	"Default_LowQualitySettings",
	"Default_MediumQualitySettings",
	"Default_HighQualitySettings",
	"Default_QualitySettings"
}
var_0_0.settings = {
	{
		CsharpValue = "enableGPUDriver",
		specialIos = true,
		cfgId = 1,
		playerPrefsname = "allowGpGpu",
		tips = i18n("grapihcs3d_setting_gpgpu_warning")
	},
	{
		CsharpValue = "enableHighRenderingQuality",
		playerPrefsname = "enableHighRenderingQuality",
		cfgId = 2
	},
	{
		CsharpValue = "depthRenderingMode",
		playerPrefsname = "depthRenderingMode",
		cfgId = 3,
		EnumType = "RenderingMode",
		Enum = {
			Auto = 1,
			Enabled = 2
		}
	},
	{
		CsharpValue = "shaderQuality",
		playerPrefsname = "shaderQuality",
		cfgId = 4,
		EnumType = "Quality",
		Enum = {
			High = 3,
			Medium = 2,
			Low = 1
		}
	},
	{
		CsharpValue = "msaaSamples",
		special = true,
		cfgId = 5,
		playerPrefsname = "msaaSamples",
		EnumType = "MSAASamples",
		Enum = {
			None = 1,
			MSAA2x = 2,
			MSAA8x = 4,
			MSAA4x = 3
		}
	},
	{
		CsharpValue = "resolution",
		playerPrefsname = "maximumResolution",
		cfgId = 6,
		EnumType = "Resolution",
		Enum = {
			_900P = 2,
			_720P = 1,
			_1080P = 3,
			_2k = 4
		}
	},
	{
		CsharpValue = "staticResolution",
		playerPrefsname = "staticResolution",
		cfgId = 7,
		EnumType = "ResolutionSize",
		Enum = {
			_10 = 1,
			_60 = 6,
			Full = 10,
			_30 = 3,
			Half = 5,
			_40 = 4,
			_70 = 7,
			_90 = 9,
			_80 = 8,
			_20 = 2
		}
	},
	{
		CsharpValue = "staticMinResolution",
		playerPrefsname = "staticMinResolution",
		cfgId = 8,
		EnumType = "MinResolution",
		Enum = {
			_540P = 2,
			_720P = 3,
			_360P = 1
		}
	},
	{
		CsharpValue = "textureSize",
		playerPrefsname = "textureSize",
		cfgId = 9,
		EnumType = "TextureSize",
		Enum = {
			Half = 2,
			Full = 1,
			Eighth = 4,
			Quarter = 3
		}
	},
	{
		CsharpValue = "bakedShadowMode",
		playerPrefsname = "bakedShadowMode",
		cfgId = 10,
		EnumType = "BakedShadowMode",
		Enum = {
			StaticShadowMapSoft = 2,
			Shadowmask = 4,
			StaticShadowMapHard = 3,
			Disabled = 1
		}
	},
	{
		CsharpValue = "enableShadow",
		playerPrefsname = "enableShadow",
		cfgId = 11
	},
	{
		CsharpValue = "enableReflection",
		playerPrefsname = "enableReflection",
		cfgId = 12
	},
	{
		CsharpValue = "enableAddLights",
		playerPrefsname = "enableAddLights",
		cfgId = 13
	},
	{
		CsharpValue = "enableOutline",
		playerPrefsname = "enableOutline",
		cfgId = 14
	},
	{
		CsharpValue = "postProcessQuality",
		playerPrefsname = "postProcessQuality",
		cfgId = 15,
		EnumType = "PostQuality",
		Enum = {
			Off = 1,
			On = 2,
			HighQuality = 3
		},
		childList = {
			16,
			17,
			18,
			19
		}
	},
	{
		CsharpValue = "enablePostAntialiasing",
		playerPrefsname = "enablePostAntialiasing",
		parentSetting = "postProcessQuality",
		cfgId = 16
	},
	{
		CsharpValue = "enableHDR",
		playerPrefsname = "enableHDR",
		parentSetting = "postProcessQuality",
		cfgId = 17
	},
	{
		CsharpValue = "enableDOF",
		playerPrefsname = "enableDOF",
		parentSetting = "postProcessQuality",
		cfgId = 18
	},
	{
		CsharpValue = "enableDistort",
		playerPrefsname = "enableDistort",
		parentSetting = "postProcessQuality",
		cfgId = 19
	}
}

function var_0_0.HandleCustomSetting()
	local var_1_0 = PlayerPrefs.GetInt("dorm3d_graphics_settings", 2)
	local var_1_1 = var_0_0.assetPath[var_1_0]
	local var_1_2 = LoadAny("three3dquaitysettings/defaultsettings", var_1_1)
	local var_1_3 = PLATFORM == PLATFORM_IPHONEPLAYER

	if var_1_3 and var_1_0 == 3 then
		return var_0_0.HandleIosSettings(var_1_2)
	end

	if var_1_0 ~= 4 then
		return var_1_2
	end

	for iter_1_0, iter_1_1 in ipairs(var_0_0.settings) do
		local var_1_4 = pg.dorm3d_graphic_setting[iter_1_1.cfgId]
		local var_1_5 = PlayerPrefs.GetInt(iter_1_1.playerPrefsname, 0)

		if var_1_5 ~= 0 then
			if var_1_4.displayType == var_0_1.toggle then
				var_1_5 = var_1_5 == 2 and true or false
			end
		else
			var_1_5 = ReflectionHelp.RefGetField(var_1_2:GetType(), iter_1_1.CsharpValue, var_1_2)
		end

		if var_1_4.displayType == var_0_1.select then
			if iter_1_1.childList ~= nil and var_1_5 == 1 then
				print(123)
			else
				if iter_1_1.special then
					var_1_5 = 1
				end

				for iter_1_2, iter_1_3 in pairs(iter_1_1.Enum) do
					if iter_1_3 == var_1_5 then
						var_1_5 = iter_1_2

						break
					end
				end

				local var_1_6 = ReflectionHelp.RefGetField(typeof("BLHX.Rendering." .. iter_1_1.EnumType), tostring(var_1_5), nil)

				ReflectionHelp.RefSetField(var_1_2:GetType(), iter_1_1.CsharpValue, var_1_2, var_1_6)
			end
		else
			if iter_1_1.specialIos and var_1_3 then
				var_1_5 = false
			end

			ReflectionHelp.RefSetField(var_1_2:GetType(), iter_1_1.CsharpValue, var_1_2, var_1_5)
		end
	end

	return var_1_2
end

function var_0_0.HandleIosSettings(arg_2_0)
	for iter_2_0, iter_2_1 in ipairs(var_0_0.settings) do
		local var_2_0 = ReflectionHelp.RefGetField(arg_2_0:GetType(), iter_2_1.CsharpValue, arg_2_0)

		if iter_2_1.specialIos then
			local var_2_1 = false

			ReflectionHelp.RefSetField(arg_2_0:GetType(), iter_2_1.CsharpValue, arg_2_0, var_2_1)
		end
	end

	return arg_2_0
end

return var_0_0
