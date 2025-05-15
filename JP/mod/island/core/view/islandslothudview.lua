local var_0_0 = class("IslandSlotHudView", import(".IslandBaseSubView"))

function var_0_0.GetUIName(arg_1_0)
	return "IslandSlotHudUI"
end

function var_0_0.OnInit(arg_2_0, arg_2_1)
	arg_2_0._go = arg_2_1
	arg_2_0._tf = arg_2_1.transform
	arg_2_0.parent = arg_2_0._tf:Find("look")
	arg_2_0.hudDic = {}
	arg_2_0.isShow = {}
end

function var_0_0.Update(arg_3_0)
	arg_3_0:UpdatePosition()
end

function var_0_0.UpdatePosition(arg_4_0)
	for iter_4_0, iter_4_1 in pairs(arg_4_0.hudDic) do
		if not arg_4_0.isShow[iter_4_0] then
			setActive(iter_4_1.transform, false)
		else
			local var_4_0 = pg.island_world_objects[iter_4_0].param.position
			local var_4_1 = Vector3(var_4_0[1], var_4_0[2], var_4_0[3]) + Vector3(0, 2.3, 0)

			if not IslandCalcUtil.IsInViewport(var_4_1) then
				setActive(iter_4_1.transform, false)
			else
				setActive(iter_4_1.transform, true)

				local var_4_2 = IslandCalcUtil.WorldPosition2LocalPosition(arg_4_0.parent, var_4_1)

				iter_4_1.transform.localPosition = var_4_2
			end
		end
	end
end

function var_0_0.HandleHud(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1.displayTpye
	local var_5_1 = false

	if var_5_0 and var_5_0 == "collect" then
		var_5_1 = true
	end

	if var_5_1 then
		arg_5_0:ShowHud(arg_5_1.nearItem.pos)
	else
		arg_5_0:HideHud()
	end
end

function var_0_0.ShowHud(arg_6_0, arg_6_1)
	if arg_6_1 == nil then
		return
	end

	arg_6_0.isShow[arg_6_1] = true
	arg_6_0.lastNearId = arg_6_1

	if arg_6_0.hudDic[arg_6_1] then
		setActive(arg_6_0.hudDic[arg_6_1].transform, true)

		return
	end

	ResourceMgr.Inst:getAssetAsync("ui/IslandCollectHud", "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_7_0)
		if arg_6_0.hudDic[arg_6_1] then
			return
		end

		local var_7_0 = Object.Instantiate(arg_7_0)

		setParent(var_7_0, arg_6_0.parent)

		arg_6_0.hudDic[arg_6_1] = var_7_0
		var_7_0.name = arg_6_1

		arg_6_0:UpdatePosition()
	end), true, true)
end

function var_0_0.HideHud(arg_8_0)
	if arg_8_0.lastNearId then
		arg_8_0.isShow[arg_8_0.lastNearId] = false

		setActive(arg_8_0.hudDic[arg_8_0.lastNearId].transform, false)
	end
end

function var_0_0.OnDestroy(arg_9_0)
	return
end

return var_0_0
