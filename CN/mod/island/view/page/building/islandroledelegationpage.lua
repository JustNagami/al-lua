local var_0_0 = class("IslandRoleDelegationPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandRoleDelegationUI"
end

local var_0_1 = 0.5

function var_0_0.AddListeners(arg_2_0)
	arg_2_0:AddListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_2_0.OnGetDelegationAwardDone)
	arg_2_0:AddListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_2_0.OnFinishDelegationDone)
	arg_2_0:AddListener(GAME.ISLAND_USESPEEDUPCARD_DONE, arg_2_0.OnUseSpeedupCardDone)
	arg_2_0:AddListener(GAME.ISLAND_START_DELEGATION_DONE, arg_2_0.OnDelegationStartDone)
end

function var_0_0.RemoveListeners(arg_3_0)
	arg_3_0:RemoveListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_3_0.OnGetDelegationAwardDone)
	arg_3_0:RemoveListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_3_0.OnFinishDelegationDone)
	arg_3_0:RemoveListener(GAME.ISLAND_USESPEEDUPCARD_DONE, arg_3_0.OnUseSpeedupCardDone)
	arg_3_0:RemoveListener(GAME.ISLAND_START_DELEGATION_DONE, arg_3_0.OnDelegationStartDone)
end

local var_0_2 = Vector3(0, 0, 0)

function var_0_0.OnLoaded(arg_4_0)
	arg_4_0.backBtn = arg_4_0:findTF("top/back")
	arg_4_0.title = arg_4_0:findTF("top/title")
	arg_4_0.content = arg_4_0._tf:Find("content")
	arg_4_0.selectInfo = arg_4_0._tf:Find("selectInfo")
	arg_4_0.slotName = arg_4_0.selectInfo:Find("slotName")
	arg_4_0.normalTitle = arg_4_0.selectInfo:Find("title")
	arg_4_0.finishTitle = arg_4_0.selectInfo:Find("finishTitle")
	arg_4_0.unlockSlot = arg_4_0.selectInfo:Find("unlock")
	arg_4_0.lockSlot = arg_4_0.selectInfo:Find("lock")
	arg_4_0.emptyShip = arg_4_0.unlockSlot:Find("unselctShip")
	arg_4_0.process = arg_4_0.unlockSlot:Find("process")
	arg_4_0.finish = arg_4_0.unlockSlot:Find("finish")
	arg_4_0.selectFormula = arg_4_0.process:Find("selectFormula")
	arg_4_0.inprocess = arg_4_0.process:Find("inprocess")
	arg_4_0.currentFormula = arg_4_0.inprocess:Find("formula")
	arg_4_0.formulaProcess = arg_4_0.currentFormula:Find("process"):GetComponent(typeof(Image))
	arg_4_0.inproduction = arg_4_0.inprocess:Find("inproduction")
	arg_4_0.stopBtn = arg_4_0.unlockSlot:Find("btns/stop")
	arg_4_0.getBtn = arg_4_0.unlockSlot:Find("btns/get")
	arg_4_0.emptyBtn = arg_4_0.unlockSlot:Find("btns/empty")
	arg_4_0.speedupBtn = arg_4_0.inproduction:Find("quick")
	arg_4_0.canRewardIcon = arg_4_0.getBtn:Find("hasicon")
	arg_4_0.canRewardNum = arg_4_0.getBtn:Find("hasicon/num")
	arg_4_0.timeTF = arg_4_0.inproduction:Find("time/Text")
	arg_4_0.roleDelegationSliderTF = arg_4_0.inproduction:Find("time/time_bar")
	arg_4_0.delegationList = UIItemList.New(arg_4_0.content, arg_4_0.content:Find("tpl"))

	arg_4_0.delegationList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventInit then
			arg_4_0:InitDelegationItem(arg_5_1, arg_5_2)
		elseif arg_5_0 == UIItemList.EventUpdate then
			arg_4_0:UpdateDelegationItem(arg_5_1, arg_5_2)
		end
	end)

	arg_4_0.leftcontent = arg_4_0._tf:Find("left/left_content")
	arg_4_0.delegationTabList = UIItemList.New(arg_4_0.leftcontent, arg_4_0.leftcontent:Find("tpl"))

	arg_4_0.delegationTabList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventInit then
			arg_4_0:InitDelegationTabItem(arg_6_1, arg_6_2)
		elseif arg_6_0 == UIItemList.EventUpdate then
			arg_4_0:UpdateDelegationTabItem(arg_6_1, arg_6_2)
		end
	end)
end

function var_0_0.OnInit(arg_7_0)
	arg_7_0:InitPlaceCfg()
	onButton(arg_7_0, arg_7_0.backBtn, function()
		arg_7_0:Hide()
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.emptyShip, function()
		local var_9_0 = arg_7_0.placeCommissionList[arg_7_0.selectedIdx]

		arg_7_0:Disable()
		arg_7_0:OpenPage(IslandShipSelectPage, var_9_0, function(arg_10_0)
			arg_7_0:AfterShipSelect(arg_10_0)
		end, function()
			arg_7_0:Enable()
		end)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.selectFormula, function()
		local var_12_0 = arg_7_0.placeCommissionList[arg_7_0.selectedIdx]

		arg_7_0:Disable()
		arg_7_0:OpenPage(IslandFormulaSelectPage, var_12_0, arg_7_0.place_Id, arg_7_0.selectedShip, function()
			arg_7_0:Enable()
		end)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.stopBtn, function()
		local var_14_0 = arg_7_0.placeCommissionList[arg_7_0.selectedIdx]
		local var_14_1 = pg.island_production_commission[var_14_0].slot

		arg_7_0:emit(IslandMediator.STOP_DELEGATION, arg_7_0.place_Id, var_14_1)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.getBtn, function()
		local var_15_0 = arg_7_0.placeCommissionList[arg_7_0.selectedIdx]
		local var_15_1 = pg.island_production_commission[var_15_0].slot
		local var_15_2 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_7_0.place_Id):GetDelegationSlotData(var_15_1)
		local var_15_3 = var_15_2:GetSlotRoleData()
		local var_15_4 = var_15_2:GetSlotRewardData()
		local var_15_5 = var_15_3 == nil and var_15_4 ~= nil and 2 or 1

		arg_7_0:emit(IslandMediator.GET_DELEGATION_AWARD, arg_7_0.place_Id, var_15_1, var_15_5)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.speedupBtn, function()
		local var_16_0 = arg_7_0.placeCommissionList[arg_7_0.selectedIdx]
		local var_16_1 = pg.island_production_commission[var_16_0].slot

		arg_7_0:emit(IslandMediator.USE_SPEEDUPCARD, arg_7_0.place_Id, var_16_1, 0, 1)
	end, SFX_PANEL)
end

function var_0_0.InitPlaceCfg(arg_17_0)
	arg_17_0.npcToPlaceCfg = {}

	for iter_17_0, iter_17_1 in ipairs(pg.island_production_place.all) do
		local var_17_0 = pg.island_production_place[iter_17_1]

		if not arg_17_0.npcToPlaceCfg[var_17_0.npc_birthplace] then
			arg_17_0.npcToPlaceCfg[var_17_0.npc_birthplace] = iter_17_1
		end
	end
end

function var_0_0.RefreshRightUI(arg_18_0, arg_18_1)
	arg_18_0:StopTimer()

	local var_18_0 = arg_18_0.placeCommissionList[arg_18_0.selectedIdx]
	local var_18_1 = pg.island_production_commission[var_18_0]

	setText(arg_18_0.slotName, arg_18_0.placeCfg.name .. "-" .. var_18_1.name)

	if not arg_18_1 then
		setActive(arg_18_0.lockSlot, true)
		setActive(arg_18_0.unlockSlot, false)

		return
	end

	setActive(arg_18_0.unlockSlot, true)
	setActive(arg_18_0.lockSlot, false)

	local var_18_2 = arg_18_1:CanStartDelegation()

	setActive(arg_18_0.normalTitle, true)
	setActive(arg_18_0.finishTitle, false)
	setActive(arg_18_0.emptyBtn, false)
	setActive(arg_18_0.getBtn, false)
	setActive(arg_18_0.stopBtn, false)

	if var_18_2 then
		setActive(arg_18_0.finish, false)

		local var_18_3 = arg_18_0.selectedShip ~= nil

		setActive(arg_18_0.emptyBtn, true)

		if not var_18_3 then
			setActive(arg_18_0.emptyShip, true)
			setActive(arg_18_0.process, false)

			return
		end

		setActive(arg_18_0.emptyShip, false)
		setActive(arg_18_0.process, true)
		setActive(arg_18_0.inprocess, false)
		setActive(arg_18_0.selectFormula, true)

		return
	end

	local var_18_4 = arg_18_1:GetSlotRoleData()
	local var_18_5 = arg_18_1:GetSlotRewardData()

	if var_18_4 == nil and var_18_5 ~= nil then
		setActive(arg_18_0.normalTitle, false)
		setActive(arg_18_0.finishTitle, true)
		setActive(arg_18_0.finish, true)
		setActive(arg_18_0.process, false)
		setActive(arg_18_0.emptyShip, false)
		setActive(arg_18_0.getBtn, true)

		local var_18_6 = var_18_5.formula_drop_list[1].id
		local var_18_7 = var_18_5.formula_drop_list[1].num
		local var_18_8 = 2001
		local var_18_9 = 1
		local var_18_10 = Drop.New({
			count = 0,
			type = DROP_TYPE_ISLAND_ITEM,
			id = var_18_8
		}):getConfigTable().icon

		GetImageSpriteFromAtlasAsync(var_18_10, "", arg_18_0.canRewardIcon)
		setText(arg_18_0.canRewardNum, "×" .. var_18_9)

		return
	end

	setActive(arg_18_0.getBtn, true)
	setActive(arg_18_0.stopBtn, true)
	setActive(arg_18_0.process, true)
	setActive(arg_18_0.inprocess, true)
	setActive(arg_18_0.emptyShip, false)
	setActive(arg_18_0.selectFormula, false)
	setActive(arg_18_0.finish, false)

	if var_18_4 ~= nil then
		arg_18_0:StopTimer()
		arg_18_0:StartRoleTimer(var_18_4)
	end
end

function var_0_0.StartRoleTimer(arg_19_0, arg_19_1)
	arg_19_0:UpdateTime(arg_19_1)

	arg_19_0.roleTimer = Timer.New(function()
		arg_19_0:UpdateTime(arg_19_1)
	end, 1, -1)

	arg_19_0.roleTimer:Start()
end

function var_0_0.StopTimer(arg_21_0)
	if arg_21_0.roleTimer ~= nil then
		arg_21_0.roleTimer:Stop()

		arg_21_0.roleTimer = nil
	end
end

function var_0_0.UpdateTime(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1:GetFinishTime() - arg_22_0.timeMgr:GetServerTime()

	setText(arg_22_0.timeTF, arg_22_0.timeMgr:DescCDTime(var_22_0))
	setSlider(arg_22_0.roleDelegationSliderTF, 0, 1, 1 - var_22_0 / arg_22_1:GetAllTime())

	local var_22_1 = arg_22_1:CanRewardTimes()
	local var_22_2 = arg_22_1.formula_id
	local var_22_3 = pg.island_formula[var_22_2]
	local var_22_4 = var_22_3.item_id
	local var_22_5 = Drop.New({
		count = 0,
		type = DROP_TYPE_ISLAND_ITEM,
		id = var_22_4
	}):getConfigTable().icon

	GetImageSpriteFromAtlasAsync(var_22_5, "", arg_22_0.canRewardIcon)
	setText(arg_22_0.canRewardNum, "×" .. tostring(var_22_3.commission_product[1][2] * var_22_1))

	local var_22_6 = arg_22_0.timeMgr:GetServerTime() - arg_22_1:InCurrentTimeStart()

	arg_22_0.formulaProcess.fillAmount = var_22_6 / arg_22_1.once_cost_time

	if var_22_0 <= 0 then
		arg_22_0:StopTimer()
	end
end

function var_0_0.InitDelegationTabItem(arg_23_0, arg_23_1, arg_23_2)
	onButton(arg_23_0, arg_23_2, function()
		arg_23_0:OnSelectTargetIndexCommission(arg_23_1)
	end, SFX_PANEL)
end

function var_0_0.InitDelegationItem(arg_25_0, arg_25_1, arg_25_2)
	onButton(arg_25_0, arg_25_2, function()
		arg_25_0:OnSelectTargetIndexCommission(arg_25_1)
	end, SFX_PANEL)
end

function var_0_0.OnSelectTargetIndexCommission(arg_27_0, arg_27_1)
	if arg_27_0.selectedIdx == arg_27_1 + 1 then
		return
	end

	arg_27_0.selectedShip = nil
	arg_27_0.selectedIdx = arg_27_1 + 1

	arg_27_0.delegationTabList:align(#arg_27_0.placeCommissionList)
	arg_27_0.delegationList:align(#arg_27_0.placeCommissionList)
end

function var_0_0.UpdateDelegationTabItem(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_1 + 1

	setActive(arg_28_0:findTF("select", arg_28_2), arg_28_0.selectedIdx == var_28_0)
	setActive(arg_28_0:findTF("unselect", arg_28_2), arg_28_0.selectedIdx ~= var_28_0)

	local var_28_1 = arg_28_0.placeCommissionList[var_28_0]
	local var_28_2 = pg.island_production_commission[var_28_1].slot
	local var_28_3 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_28_0.place_Id):GetDelegationSlotData(var_28_2)

	if arg_28_0.selectedIdx == var_28_0 then
		arg_28_0:RefreshRightUI(var_28_3)
	end

	if not var_28_3 then
		setActive(arg_28_0:findTF("complete ", arg_28_2), false)
		setActive(arg_28_0:findTF("product_icon", arg_28_2), false)

		return
	end

	local var_28_4 = var_28_3:GetSlotRoleData()
	local var_28_5 = var_28_3:GetSlotRewardData()
	local var_28_6 = var_28_4 == nil and var_28_5 ~= nil

	setActive(arg_28_0:findTF("complete ", arg_28_2), var_28_6)

	local var_28_7 = var_28_4 and var_28_4.formula_id or nil

	var_28_7 = var_28_7 or var_28_5 and var_28_5.formula_id or nil

	if var_28_7 then
		setActive(arg_28_0:findTF("product_icon", arg_28_2), true)

		local var_28_8 = pg.island_formula[var_28_7]
		local var_28_9 = pg.island_item_data_template[var_28_8.item_id]

		GetImageSpriteFromAtlasAsync(var_28_9.icon, "", arg_28_0:findTF("product_icon", arg_28_2))
	else
		setActive(arg_28_0:findTF("product_icon", arg_28_2), false)
	end
end

function var_0_0.UpdateDelegationItem(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_0.placeCommissionList[arg_29_1 + 1]
	local var_29_1 = pg.island_production_commission[var_29_0]
	local var_29_2 = pg.island_world_objects[var_29_1.birthplace].param.position
	local var_29_3 = Vector3(var_29_2[1], var_29_2[2], var_29_2[3])
	local var_29_4 = IslandCalcUtil.WorldPosition2LocalPosition(arg_29_0.content, var_29_3)

	arg_29_2.transform.localPosition = var_29_4 + var_0_2

	setActive(arg_29_0:findTF("select", arg_29_2), arg_29_0.selectedIdx == arg_29_1 + 1)
	setActive(arg_29_0:findTF("unselect", arg_29_2), arg_29_0.selectedIdx ~= arg_29_1 + 1)
end

function var_0_0.Flush(arg_30_0)
	arg_30_0.selectedIdx = 1

	arg_30_0.delegationList:align(#arg_30_0.placeCommissionList)
	arg_30_0.delegationTabList:align(#arg_30_0.placeCommissionList)
end

function var_0_0.OnShow(arg_31_0, arg_31_1)
	arg_31_0.place_Id = arg_31_0.npcToPlaceCfg[arg_31_1]
	arg_31_0.placeCfg = pg.island_production_place[arg_31_0.place_Id]
	arg_31_0.placeCommissionList = arg_31_0.placeCfg.commission_slot

	if arg_31_0.placeCfg.delegationCamera then
		IslandCameraMgr.instance:ActiveVirtualCamera(arg_31_0.placeCfg.delegationCamera)
	end

	arg_31_0.timeMgr = pg.TimeMgr.GetInstance()
	arg_31_0.selectedShip = nil

	arg_31_0:Flush()
	setActive(arg_31_0.content, false)

	arg_31_0.timer = Timer.New(function()
		setActive(arg_31_0.content, true)
		arg_31_0:Flush()
	end, var_0_1, 0)

	arg_31_0.timer:Start()
	setText(arg_31_0:findTF("top/title/Text"), arg_31_0.placeCfg.name)
end

function var_0_0.OnHide(arg_33_0)
	if arg_33_0.timer ~= nil then
		arg_33_0.timer:Stop()

		arg_33_0.timer = nil
	end

	arg_33_0:StopTimer()
end

function var_0_0.OnDestroy(arg_34_0)
	if arg_34_0.timer ~= nil then
		arg_34_0.timer:Stop()

		arg_34_0.timer = nil
	end

	arg_34_0:StopTimer()
end

function var_0_0.AfterShipSelect(arg_35_0, arg_35_1)
	arg_35_0.selectedShip = arg_35_1

	arg_35_0.delegationTabList:align(#arg_35_0.placeCommissionList)

	local var_35_0 = arg_35_0.placeCommissionList[arg_35_0.selectedIdx]

	arg_35_0:OpenPage(IslandFormulaSelectPage, var_35_0, arg_35_0.place_Id, arg_35_0.selectedShip, function()
		arg_35_0:Enable()
	end)
end

function var_0_0.OnGetDelegationAwardDone(arg_37_0)
	arg_37_0.delegationTabList:align(#arg_37_0.placeCommissionList)
end

function var_0_0.OnFinishDelegationDone(arg_38_0)
	arg_38_0.delegationTabList:align(#arg_38_0.placeCommissionList)
end

function var_0_0.OnUseSpeedupCardDone(arg_39_0)
	arg_39_0.delegationTabList:align(#arg_39_0.placeCommissionList)
end

function var_0_0.OnDelegationStartDone(arg_40_0)
	arg_40_0:Enable()
	arg_40_0.delegationTabList:align(#arg_40_0.placeCommissionList)
end

return var_0_0
