AssetBundleHelper = {}

local var_0_0 = AssetBundleHelper

var_0_0.abMetatable = {
	__index = {
		LoadAssetSync = function(arg_1_0, ...)
			if EDITOR_TOOL then
				return ResourceMgr.Inst:getAssetSync(arg_1_0.path, ...)
			else
				return ResourceMgr.Inst:LoadAssetSync(arg_1_0.ab, ...)
			end
		end,
		GetAllAssetNames = function(arg_2_0, ...)
			if EDITOR_TOOL then
				return ReflectionHelp.RefCallMethod(typeof(ResourceMgr), "GetAssetBundleAllAssetNames", ResourceMgr.Inst, {
					typeof("System.String")
				}, {
					arg_2_0.path
				})
			else
				return arg_2_0.ab:GetAllAssetNames(...)
			end
		end
	}
}

function var_0_0.loadAssetBundleSync(arg_3_0)
	local var_3_0 = setmetatable({
		path = arg_3_0
	}, var_0_0.abMetatable)

	if EDITOR_TOOL then
		return var_3_0
	else
		var_3_0.ab = ResourceMgr.Inst:loadAssetBundleSync(arg_3_0)

		return var_3_0
	end
end

function var_0_0.loadAssetBundleAsync(arg_4_0, arg_4_1)
	local var_4_0 = setmetatable({
		path = arg_4_0
	}, var_0_0.abMetatable)

	if EDITOR_TOOL then
		onNextTick(function()
			arg_4_1(var_4_0)
		end)
	else
		ResourceMgr.Inst:loadAssetBundleAsync(arg_4_0, function(arg_6_0)
			var_4_0.ab = arg_6_0

			arg_4_1(var_4_0)
		end)
	end
end

function var_0_0.loadAssetBundleTotallyAsync(arg_7_0, arg_7_1)
	local var_7_0 = setmetatable({
		path = arg_7_0
	}, var_0_0.abMetatable)

	if EDITOR_TOOL then
		onNextTick(function()
			arg_7_1(var_7_0)
		end)
	else
		ResourceMgr.Inst:loadAssetBundleTotallyAsync(arg_7_0, function(arg_9_0)
			var_7_0.ab = arg_9_0

			arg_7_1(var_7_0)
		end)
	end
end

return var_0_0
