local var_0_0 = class("IslandStaticUnit", import(".IslandSceneUnit"))

function var_0_0.OnInit(arg_1_0)
	return
end

function var_0_0.OnUpdate(arg_2_0)
	return
end

function var_0_0.OnDispose(arg_3_0)
	return
end

function var_0_0.DoPlant(arg_4_0)
	if arg_4_0.otherGo then
		return
	end

	local var_4_0 = "island/unit_item/infrastructure/farm/pre_art_farm_potato01_grow"

	ResourceMgr.Inst:getAssetAsync(var_4_0, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_5_0)
		arg_4_0.otherGo = Object.Instantiate(arg_5_0)
		arg_4_0.otherGo.name = arg_4_0.name
		arg_4_0.otherGo.transform.position = arg_4_0.position
		arg_4_0.otherGo.transform.eulerAngles = arg_4_0.rotation

		setActive(arg_4_0.otherGo, true)
	end), true, true)
end

return var_0_0
