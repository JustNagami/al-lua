pg = pg or {}

local var_0_0 = pg
local var_0_1 = class("AssetBundle", var_0_0.AssetBundle)

var_0_0.AssetBundleEditor = var_0_1

function var_0_1.Load(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	assert(not arg_1_0.ab)

	arg_1_0.abs = {}

	if arg_1_1 then
		onNextTick(function()
			existCall(arg_1_3, arg_1_0)
		end)
	else
		existCall(arg_1_3, arg_1_0)

		return arg_1_0
	end
end

function var_0_1.LoadAssetSync(arg_3_0, arg_3_1, ...)
	arg_3_1 = arg_3_0:ChangeAssetName(arg_3_1)

	return ResourceMgr.Inst:getAssetSync(arg_3_0.path, arg_3_1, ...)
end

function var_0_1.LoadAssetAsync(arg_4_0, arg_4_1, arg_4_2, arg_4_3, ...)
	arg_4_1 = arg_4_0:ChangeAssetName(arg_4_1)

	return ResourceMgr.Inst:getAssetAsync(arg_4_0.path, arg_4_1, arg_4_2, UnityEngine.Events.UnityAction_UnityEngine_Object(arg_4_3), ...)
end

function var_0_1.GetAllAssetNames(arg_5_0)
	return table.CArrayToArray(ReflectionHelp.RefCallMethod(typeof(ResourceMgr), "GetAssetBundleAllAssetNames", ResourceMgr.Inst, {
		typeof("System.String")
	}, {
		arg_5_0.path
	}))
end
