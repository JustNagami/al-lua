local var_0_0 = class("IslandTechDetailPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandTechDetailPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.selectedTF = arg_2_0._tf:Find("selected")
	arg_2_0.panel = arg_2_0._tf:Find("panel")
	arg_2_0.iconTF = arg_2_0.panel:Find("icon")
	arg_2_0.nameTF = arg_2_0.panel:Find("title/Text")
	arg_2_0.descTF = arg_2_0.panel:Find("desc")
	arg_2_0.unlockTF = arg_2_0.panel:Find("unlock")
	arg_2_0.unlockTextTF = arg_2_0.unlockTF:Find("title")
	arg_2_0.unlockUIList = UIItemList.New(arg_2_0.unlockTF:Find("cost"), arg_2_0.unlockTF:Find("cost/tpl"))
	arg_2_0.timeTF = arg_2_0.panel:Find("time")
	arg_2_0.timeTextTF = arg_2_0.timeTF:Find("content/Text")

	local var_2_0 = arg_2_0.panel:Find("status")

	arg_2_0.statusTFs = {
		[IslandTechnology.STATUS.LOCK] = var_2_0:Find("lock"),
		[IslandTechnology.STATUS.UNLOCK] = var_2_0:Find("unlock"),
		[IslandTechnology.STATUS.NORMAL] = var_2_0:Find("normal"),
		[IslandTechnology.STATUS.STUDYING] = var_2_0:Find("studying"),
		[IslandTechnology.STATUS.RECEIVE] = var_2_0:Find("receive"),
		[IslandTechnology.STATUS.FINISHED] = var_2_0:Find("finished")
	}
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("close"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	arg_3_0.unlockUIList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			local var_5_0 = arg_3_0.unlockItemList[arg_5_1 + 1]

			updateDrop(arg_5_2, var_5_0)
		end
	end)

	arg_3_0.placeId = IslandTechnologyAgency.PLACE_ID
end

function var_0_0.Flush(arg_6_0, arg_6_1)
	arg_6_0:StopTimer()

	local var_6_0 = getProxy(IslandProxy):GetIsland()

	arg_6_0.buildingAgency = var_6_0:GetBuildingAgency()
	arg_6_0.techAgency = var_6_0:GetTechnologyAgency()
	arg_6_0.showTechVO = arg_6_0.techAgency:GetTechnology(arg_6_0.configId)

	LoadImageSpriteAsync("IslandTechnology/" .. arg_6_0.showTechVO:getConfig("tech_icon"), arg_6_0.iconTF, true)
	setText(arg_6_0.nameTF, string.format("%s(%d)", arg_6_0.showTechVO:getConfig("tech_name"), arg_6_0.showTechVO:GetFinishedCnt()))
	setText(arg_6_0.descTF, arg_6_0.showTechVO:getConfig("tech_desc"))
	setText(arg_6_0.unlockTextTF, arg_6_0.showTechVO:getConfig("tech_unlock_desc"))

	arg_6_0.unlockItemList = arg_6_0.showTechVO:GetRecycleItemInfos()

	arg_6_0.unlockUIList:align(#arg_6_0.unlockItemList)

	local var_6_1 = arg_6_0.showTechVO:GetStatus()

	for iter_6_0, iter_6_1 in pairs(arg_6_0.statusTFs) do
		setActive(iter_6_1, iter_6_0 == var_6_1)
	end

	local var_6_2 = var_6_1 == IslandTechnology.STATUS.LOCK or var_6_1 == IslandTechnology.STATUS.UNLOCK

	setActive(arg_6_0.unlockTF, var_6_2)
	setActive(arg_6_0.timeTF, var_6_1 ~= IslandTechnology.STATUS.FINISHED)
	setLocalPosition(arg_6_0.timeTF, {
		x = 655,
		y = var_6_2 and -120 or -75
	})
	switch(var_6_1, {
		[IslandTechnology.STATUS.LOCK] = function()
			onButton(arg_6_0, arg_6_0.statusTFs[var_6_1], function()
				pg.TipsMgr.GetInstance():ShowTips("不满足解锁条件")
			end, SFX_PANEL)
		end,
		[IslandTechnology.STATUS.UNLOCK] = function()
			onButton(arg_6_0, arg_6_0.statusTFs[var_6_1], function()
				arg_6_0:emit(IslandMediator.ON_UNLOCK_TECH, arg_6_0.showTechVO.id)
			end, SFX_PANEL)
		end,
		[IslandTechnology.STATUS.NORMAL] = function()
			onButton(arg_6_0, arg_6_0.statusTFs[var_6_1], function()
				if not arg_6_0.techAgency:GetEmptySlotId() then
					pg.TipsMgr.GetInstance():ShowTips("没有空闲的岗位！")
				end

				existCall(arg_6_0.contextData.onSelecteShip)
			end, SFX_PANEL)
		end,
		[IslandTechnology.STATUS.RECEIVE] = function()
			onButton(arg_6_0, arg_6_0.statusTFs[var_6_1], function()
				arg_6_0:emit(IslandMediator.GET_DELEGATION_AWARD, arg_6_0.placeId, arg_6_0.showTechVO:GetSlotId(), 2)
			end, SFX_PANEL)
		end
	}, function()
		return
	end)
	arg_6_0:StartTimer()
	arg_6_0:UpdateTime()

	arg_6_0.selectedItemPos = arg_6_1 or arg_6_0.selectedItemPos

	setActive(arg_6_0.selectedTF, arg_6_0.selectedItemPos)

	if arg_6_0.selectedItemPos then
		arg_6_0:FlushSelectedItem(arg_6_0.selectedItemPos)
	end
end

function var_0_0.FlushSelectedItem(arg_16_0, arg_16_1)
	setAnchoredPosition(arg_16_0.selectedTF, arg_16_1)

	arg_16_0.selectedTF.name = arg_16_0.configId

	local var_16_0 = arg_16_0.techAgency:GetTechnology(arg_16_0.configId)

	setText(arg_16_0.selectedTF:Find("name"), var_16_0:getConfig("tech_name"))

	local var_16_1 = var_16_0:GetStatus()
	local var_16_2 = var_16_1 == IslandTechnology.STATUS.FINISHED

	setTextColor(arg_16_0.selectedTF:Find("name"), Color.NewHex(var_16_2 and "1b3650" or "ffffff"))
	LoadImageSpriteAsync("IslandTechnology/" .. var_16_0:getConfig("tech_icon"), arg_16_0.selectedTF:Find("icon"), true)
	setImageColor(arg_16_0.selectedTF:Find("icon"), Color.NewHex(var_16_2 and "455a81" or "ffffff"))
	eachChild(arg_16_0.selectedTF:Find("back"), function(arg_17_0)
		setActive(arg_17_0, arg_17_0.name == var_16_1)
	end)
	setActive(arg_16_0.selectedTF:Find("back/normal"), not var_16_2 and var_16_1 ~= IslandTechnology.STATUS.STUDYING)
	eachChild(arg_16_0.selectedTF:Find("front"), function(arg_18_0)
		setActive(arg_18_0, arg_18_0.name == var_16_1)
	end)
end

function var_0_0.Show(arg_19_0, arg_19_1, arg_19_2)
	var_0_0.super.Show(arg_19_0)

	arg_19_0.configId = arg_19_1
	arg_19_0.timeMgr = pg.TimeMgr.GetInstance()

	arg_19_0:Flush(arg_19_2)
end

function var_0_0.OnShipSelected(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0.techAgency:GetEmptySlotId()
	local var_20_1 = arg_20_0.showTechVO:GetFormulaId()

	arg_20_0:emit(IslandMediator.START_DELEGATION, arg_20_0.placeId, var_20_0, arg_20_1, var_20_1, 1)
end

function var_0_0.UpdateTime(arg_21_0)
	local var_21_0 = arg_21_0.showTechVO:GetStatus()
	local var_21_1 = arg_21_0.buildingAgency:GetDelegationSlotDataByTechId(arg_21_0.showTechVO.id)

	if var_21_1 then
		if var_21_1:GetSlotRewardData() then
			setText(arg_21_0.timeTextTF, "00:00:00")
		else
			local var_21_2 = var_21_1:GetSlotRoleData():GetFinishTime() - arg_21_0.timeMgr:GetServerTime()

			setText(arg_21_0.timeTextTF, arg_21_0.timeMgr:DescCDTime(var_21_2))
		end
	else
		setText(arg_21_0.timeTextTF, "??:??:??")
	end
end

function var_0_0.StartTimer(arg_22_0)
	arg_22_0.timer = Timer.New(function()
		arg_22_0:UpdateTime()
	end, 1, -1)

	arg_22_0.timer:Start()
end

function var_0_0.StopTimer(arg_24_0)
	if arg_24_0.timer ~= nil then
		arg_24_0.timer:Stop()

		arg_24_0.timer = nil
	end
end

function var_0_0.OnHide(arg_25_0)
	arg_25_0:StopTimer()
end

function var_0_0.OnDestroy(arg_26_0)
	arg_26_0:StopTimer()
end

return var_0_0
