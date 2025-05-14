local var_0_0 = class("IslandTechQuickPanel", import("view.base.BaseSubView"))

var_0_0.TOGGLE_STATUS = {
	FINISHED = "finished",
	STUDYING = "studying",
	NORMAL = "normal"
}

function var_0_0.getUIName(arg_1_0)
	return "IslandTechQuickPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.toggle = arg_2_0._tf:Find("toggle")
	arg_2_0.panel = arg_2_0._tf:Find("panel")

	local var_2_0 = arg_2_0.panel:Find("content")

	arg_2_0.uiList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.slotIds = IslandTechnologyAgency.GetSlotIds()

	arg_3_0.uiList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateItem(arg_4_1, arg_4_2)
		end
	end)

	arg_3_0.timeMgr = pg.TimeMgr.GetInstance()
end

function var_0_0.UpdateItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.slotIds[arg_5_1 + 1]
	local var_5_1 = arg_5_0.buildingData:GetDelegationSlotData(var_5_0)
	local var_5_2 = var_5_1 and var_5_1:GetFormulaId()

	setActive(arg_5_2:Find("lock"), not var_5_1)
	setActive(arg_5_2:Find("empty"), var_5_1 and not var_5_2)
	setActive(arg_5_2:Find("content"), var_5_2)

	if var_5_2 then
		local var_5_3 = arg_5_2:Find("content")
		local var_5_4 = arg_5_0.technologyAgency:GetTechnologyByFormulaId(var_5_2)

		setText(var_5_3:Find("title"), var_5_4:getConfig("tech_name"))

		local var_5_5 = var_5_1:GetSlotRoleData()

		setActive(var_5_3:Find("icon"), var_5_5)

		if var_5_5 then
			local var_5_6 = IslandShip.StaticGetPrefab(var_5_5.ship_id)

			GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_5_6, "", var_5_3:Find("icon"))

			local var_5_7 = var_5_5:GetFinishTime() - arg_5_0.timeMgr:GetServerTime()

			setSlider(var_5_3:Find("silder"), 0, 1, 1 - var_5_7 / var_5_5:GetAllTime())
			setText(var_5_3:Find("silder/Text"), arg_5_0.timeMgr:DescCDTime(var_5_7))
		end

		local var_5_8 = var_5_1:GetSlotRewardData()

		setActive(var_5_3:Find("finished"), var_5_8)

		if var_5_8 then
			setSlider(var_5_3:Find("silder"), 0, 1, 1)
			setText(var_5_3:Find("silder/Text"), "00:00:00")
		end
	end
end

function var_0_0.Flush(arg_6_0)
	arg_6_0:StopTimer()

	local var_6_0 = getProxy(IslandProxy):GetIsland()

	arg_6_0.technologyAgency = var_6_0:GetTechnologyAgency()
	arg_6_0.buildingData = var_6_0:GetBuildingAgency():GetBuilding(IslandTechnologyAgency.PLACE_ID)

	arg_6_0.uiList:align(#arg_6_0.slotIds)
	arg_6_0:StartTimer()
	arg_6_0:UpdateTime()
end

function var_0_0.GetToggleStatus(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.slotIds) do
		local var_7_0 = arg_7_0.buildingData:GetDelegationSlotData(iter_7_1)

		if var_7_0 and var_7_0:GetSlotRewardData() then
			return var_0_0.TOGGLE_STATUS.FINISHED
		end

		if var_7_0 and var_7_0:GetSlotRoleData() then
			return var_0_0.TOGGLE_STATUS.STUDYING
		end
	end

	return var_0_0.TOGGLE_STATUS.NORMAL
end

function var_0_0.UpdateToggleStatus(arg_8_0)
	local var_8_0 = arg_8_0:GetToggleStatus()

	onToggle(arg_8_0, arg_8_0.toggle, function(arg_9_0)
		if arg_9_0 then
			pg.UIMgr.GetInstance():OverlayPanelPB(arg_8_0._tf, {
				pbList = {
					arg_8_0.panel
				},
				groupName = LayerWeightConst.GROUP_DORM3D
			})
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_8_0._tf, arg_8_0._parentTf)
		end

		if var_8_0 ~= var_0_0.TOGGLE_STATUS.FINISHED then
			return
		end

		arg_8_0:QuickGetAward()
	end, SFX_PANEL)
	eachChild(arg_8_0.toggle, function(arg_10_0)
		setActive(arg_10_0, arg_10_0.name == var_8_0)
	end)
end

function var_0_0.QuickGetAward(arg_11_0)
	local var_11_0 = underscore.detect(arg_11_0.slotIds, function(arg_12_0)
		local var_12_0 = arg_11_0.buildingData:GetDelegationSlotData(arg_12_0)

		return var_12_0 and var_12_0:GetSlotRewardData()
	end)

	arg_11_0:emit(IslandMediator.GET_DELEGATION_AWARD, IslandTechnologyAgency.PLACE_ID, var_11_0, 2)
end

function var_0_0.UpdateTime(arg_13_0)
	arg_13_0.uiList:eachActive(function(arg_14_0, arg_14_1)
		local var_14_0 = arg_13_0.slotIds[arg_14_0 + 1]
		local var_14_1 = arg_13_0.buildingData:GetDelegationSlotData(var_14_0)

		if var_14_1 and var_14_1:GetFormulaId() then
			local var_14_2 = arg_14_1:Find("content")
			local var_14_3 = var_14_1:GetSlotRoleData()

			setActive(var_14_2:Find("icon"), var_14_3)

			if var_14_3 then
				local var_14_4 = var_14_3:GetFinishTime() - arg_13_0.timeMgr:GetServerTime()

				setSlider(var_14_2:Find("silder"), 0, 1, 1 - var_14_4 / var_14_3:GetAllTime())
				setText(var_14_2:Find("silder/Text"), arg_13_0.timeMgr:DescCDTime(var_14_4))
			end

			local var_14_5 = var_14_1:GetSlotRewardData()

			setActive(var_14_2:Find("finished"), var_14_5)
			onButton(arg_13_0, arg_14_1, function()
				if not var_14_5 then
					return
				end

				arg_13_0:QuickGetAward()
			end, SFX_PANEL)

			if var_14_5 then
				setSlider(var_14_2:Find("silder"), 0, 1, 1)
				setText(var_14_2:Find("silder/Text"), "00:00:00")
			end
		end
	end)
	arg_13_0:UpdateToggleStatus()
end

function var_0_0.StartTimer(arg_16_0)
	arg_16_0.timer = Timer.New(function()
		arg_16_0:UpdateTime()
	end, 1, -1)

	arg_16_0.timer:Start()
end

function var_0_0.StopTimer(arg_18_0)
	if arg_18_0.timer ~= nil then
		arg_18_0.timer:Stop()

		arg_18_0.timer = nil
	end
end

function var_0_0.OffToggle(arg_19_0)
	triggerToggle(arg_19_0.toggle, false)
end

function var_0_0.Hide(arg_20_0)
	arg_20_0:OffToggle()
	var_0_0.super.Hide(arg_20_0)
end

function var_0_0.OnDestroy(arg_21_0)
	arg_21_0:StopTimer()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_21_0._tf, arg_21_0._parentTf)
end

return var_0_0
