PermissionHelper = {}

local var_0_0 = PermissionHelper

function var_0_0.IsAndroid()
	return PLATFORM == PLATFORM_ANDROID and not IsUnityEditor
end

function var_0_0.IsIOS()
	return PLATFORM == PLATFORM_IPHONEPLAYER and not IsUnityEditor
end

var_0_0.Android10SDKLevel = 29
var_0_0.StateGranted = 0

function var_0_0.RequestCamera(arg_3_0, arg_3_1)
	if var_0_0.IsAndroid() or var_0_0.IsIOS() then
		local var_3_0 = {
			YSNormalTool.PermissionTool.Camera,
			YSNormalTool.PermissionTool.MIC
		}

		if var_0_0.IsAndroid() and YSNormalTool.OtherTool.GetAndroidBuildVersion() < var_0_0.Android10SDKLevel then
			table.insert(var_3_0, YSNormalTool.PermissionTool.Photo)
		end

		local function var_3_1(arg_4_0, arg_4_1)
			local var_4_0 = true
			local var_4_1 = arg_4_1.Length

			for iter_4_0 = 0, var_4_1 - 1 do
				if arg_4_1[iter_4_0] ~= var_0_0.StateGranted then
					var_4_0 = false

					break
				end
			end

			if var_4_0 then
				if arg_3_0 then
					arg_3_0()
				end
			elseif arg_3_1 then
				arg_3_1()
			end
		end

		YSNormalTool.PermissionTool.RequestMultiPermission(var_3_0, var_3_1)
	elseif arg_3_0 then
		arg_3_0()
	end
end

function var_0_0.Request3DDorm(arg_5_0, arg_5_1)
	if var_0_0.IsAndroid() or var_0_0.IsIOS() then
		local var_5_0 = {
			YSNormalTool.PermissionTool.MIC
		}

		if var_0_0.IsAndroid() and YSNormalTool.OtherTool.GetAndroidBuildVersion() < var_0_0.Android10SDKLevel then
			table.insert(var_5_0, YSNormalTool.PermissionTool.Photo)
		end

		local function var_5_1(arg_6_0, arg_6_1)
			local var_6_0 = true
			local var_6_1 = arg_6_1.Length

			for iter_6_0 = 0, var_6_1 - 1 do
				if arg_6_1[iter_6_0] ~= var_0_0.StateGranted then
					var_6_0 = false

					break
				end
			end

			if var_6_0 then
				if arg_5_0 then
					arg_5_0()
				end
			elseif arg_5_1 then
				arg_5_1()
			end
		end

		YSNormalTool.PermissionTool.RequestMultiPermission(var_5_0, var_5_1)
	elseif arg_5_0 then
		arg_5_0()
	end
end
