local var_0_0 = class("IslandScene", import(".base.IslandBaseScene"))

var_0_0.ON_INVENTORY_FILTER = "IslandScene:ON_INVENTORY_FILTER"
var_0_0.ON_CHECK_ORDER_EXP_AWARD = "IslandScene:ON_CHECK_ORDER_EXP_AWARD"

function var_0_0.getUIName(arg_1_0)
	return "IslandUI"
end

function var_0_0.GetIsland(arg_2_0)
	return getProxy(IslandProxy):GetIsland()
end

function var_0_0.init(arg_3_0)
	arg_3_0.technologyBtn = arg_3_0:findTF("bottom/list/technology")
	arg_3_0.friendBtn = arg_3_0:findTF("bottom/list/friend")
	arg_3_0.visitorBtn = arg_3_0:findTF("bottom/list/visitor")
	arg_3_0.dressBtn = arg_3_0:findTF("bottom/list/skin")
	arg_3_0.delegationBtn = arg_3_0:findTF("bottom/list/delegation")
	arg_3_0.btnContainer = arg_3_0:findTF("top/list")
	arg_3_0.btnUIList = UIItemList.New(arg_3_0.btnContainer, arg_3_0.btnContainer:Find("tpl"))
	arg_3_0.levelPanel = arg_3_0:findTF("top/level_panel")
	arg_3_0.levelTxt = arg_3_0:findTF("top/level_panel/level"):GetComponent(typeof(Text))
	arg_3_0.expTr = arg_3_0:findTF("top/level_panel/exp")
	arg_3_0.nameTxt = arg_3_0:findTF("top/level_panel/name"):GetComponent(typeof(Text))
	arg_3_0.prosperityTxt = arg_3_0:findTF("top/level_panel/prosperity/Text"):GetComponent(typeof(Text))
	arg_3_0.prosperityLabel = arg_3_0:findTF("top/level_panel/prosperity"):GetComponent(typeof(Text))
	arg_3_0.levelTip = arg_3_0.levelPanel:Find("red_dot")
	arg_3_0.taskTrackPanel = Island3dTaskTrackPanel.New(arg_3_0._tf, arg_3_0.event, setmetatable({
		onClick = function()
			arg_3_0:OpenPage(Island3dTaskPage, arg_3_0:GetIsland():GetTaskAgency():GetTraceId())
		end
	}, {
		__index = arg_3_0.contextData
	}))
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0.levelPanel, function()
		arg_5_0:OpenPage(IslandInfoPage)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.technologyBtn, function()
		arg_5_0:OpenPage(IslandTechnologyPage)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.friendBtn, function()
		arg_5_0:emit(IslandMediator.OPEN_FRIEND)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.visitorBtn, function()
		arg_5_0:OpenPage(IslandVisitorPage)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.dressBtn, function()
		arg_5_0:OpenPage(IslandShipIslandCommanderMainPage)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.delegationBtn, function()
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.ROLEDELEGATION_CAMERA_NAME)
		_IslandCore:GetController():NotifiyCore(ISLAND_EVT.INTERACTION_UNIT_BEGIN)
		arg_5_0:OpenPage(IslandRoleDelegationPage)
	end, SFX_PANEL)
	arg_5_0.btnUIList:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventUpdate then
			local var_12_0 = arg_5_0.btnList[arg_12_1 + 1]
			local var_12_1 = pg.island_main_btns[var_12_0]

			arg_12_2.name = var_12_1.btn_name

			LoadImageSpriteAsync("islandbtnicon/" .. var_12_1.icon, arg_12_2, true)

			if var_12_1.open_page ~= "" then
				onButton(arg_5_0, arg_12_2, function()
					arg_5_0:OpenPage(_G[var_12_1.open_page], unpack(var_12_1.page_param))
				end, SFX_PANEL)
			end
		end
	end)
	arg_5_0:SetUp()
end

function var_0_0.SetUp(arg_14_0)
	seriesAsync({
		function(arg_15_0)
			arg_14_0:SetNameIfIsEmpty(arg_15_0)
		end
	}, function()
		arg_14_0:StartCore()
	end)
end

function var_0_0.SetNameIfIsEmpty(arg_17_0, arg_17_1)
	if not arg_17_0:GetIsland():IsNew() then
		arg_17_1()

		return
	end

	local var_17_0 = IslandSetNamePage.New(arg_17_0)

	var_17_0:ExecuteAction("Show", function()
		var_17_0:Destroy()
		arg_17_1()
	end)
end

function var_0_0.UpdateTip(arg_19_0)
	setActive(arg_19_0.levelTip, getProxy(IslandProxy):ShouldTip())
end

function var_0_0.UpdateIslandInfo(arg_20_0)
	local var_20_0 = arg_20_0:GetIsland()

	arg_20_0.levelTxt.text = var_20_0:GetLevel()
	arg_20_0.nameTxt.text = var_20_0:GetName()

	if var_20_0:IsMaxLevel() then
		setFillAmount(arg_20_0.expTr, 1)
	else
		setFillAmount(arg_20_0.expTr, var_20_0:GetExp() / var_20_0:GetTargeExp())
	end

	if var_20_0:CanAddProsperity() then
		arg_20_0.prosperityTxt.text = var_20_0:GetProsperity() .. "/" .. var_20_0:GetTargetProsperity()
	else
		arg_20_0.prosperityTxt.text = "MAX"
	end

	arg_20_0.prosperityLabel.text = i18n1("繁荣度")
end

function var_0_0.AddListeners(arg_21_0)
	arg_21_0:AddListener(GAME.ISLAND_UPGRADE_DONE, arg_21_0.OnUpgrade)
	arg_21_0:AddListener(GAME.ISLAND_SET_NAME_DONE, arg_21_0.OnModifyName)
	arg_21_0:AddListener(GAME.ISLAND_PROSPERITY_AWARD_DONE, arg_21_0.OnGetProsperityAward)
	arg_21_0:AddListener(IslandTaskAgency.TASK_ADDED, arg_21_0.OnUpdateTask)
	arg_21_0:AddListener(IslandTaskAgency.TASK_UPDATED, arg_21_0.OnUpdateTask)
	arg_21_0:AddListener(IslandTaskAgency.TASK_REMOVED, arg_21_0.OnUpdateTask)
	arg_21_0:AddListener(IslandCharacterAgency.ADD_SHIP, arg_21_0.OnAddShip)
	arg_21_0:AddListener(IslandCharacterAgency.SHIP_LEVEL_UP, arg_21_0.OnShipLevelUp)
	arg_21_0:AddListener(IslandCharacterAgency.SHIP_GET_STATE, arg_21_0.OnShipGetState)
	arg_21_0:AddListener(IslandAblityAgency.UNLCOK_SYSTEM, arg_21_0.OnUnlockSystem)
	arg_21_0:AddListener(ISLAND_EX_EVT.INIT_FINISH, arg_21_0.OnSceneLoaded)
	arg_21_0:AddListener(ISLAND_EX_EVT.SAVE_AGORA, arg_21_0.OnAgoraSave)
	arg_21_0:AddListener(ISLAND_EX_EVT.UPGRADE_AGORA, arg_21_0.OnAgoraUpgrade)
	arg_21_0:AddListener(ISLAND_EX_EVT.ENTER_EDIT_AGORA, arg_21_0.OnAgoraEnterEditMode)
	arg_21_0:AddListener(ISLAND_EX_EVT.EXIT_EDIT_AGORA, arg_21_0.OnAgoraExitEditMode)
	arg_21_0:AddListener(ISLAND_EX_EVT.OPEN_PAGE, arg_21_0.OnOpenPage)
	arg_21_0:AddListener(ISLAND_EX_EVT.TRIGGER_TASK, arg_21_0.OnTriggerTask)
	arg_21_0:AddListener(ISLAND_EX_EVT.SUBMIT_TASK, arg_21_0.OnSubmitTask)
	arg_21_0:AddListener(ISLAND_EX_EVT.ADD_TASK_PROGRESS, arg_21_0.OnAddTaskProgress)
	arg_21_0:AddListener(ISLAND_EX_EVT.PLAY_STORY, arg_21_0.OnPlayStory)
	arg_21_0:AddListener(ISLAND_EX_EVT.SWITCH_MAP, arg_21_0.OnSwitchMap)
	arg_21_0:AddListener(ISLAND_EX_EVT.SEEK_GAME_START, arg_21_0.OnSeekGameStart)
	arg_21_0:AddListener(ISLAND_EX_EVT.SEEK_GAME_END, arg_21_0.OnSeekGameEnd)
end

function var_0_0.RemoveListeners(arg_22_0)
	arg_22_0:RemoveListener(GAME.ISLAND_UPGRADE_DONE, arg_22_0.OnUpgrade)
	arg_22_0:RemoveListener(GAME.ISLAND_SET_NAME_DONE, arg_22_0.OnModifyName)
	arg_22_0:RemoveListener(GAME.ISLAND_PROSPERITY_AWARD_DONE, arg_22_0.OnGetProsperityAward)
	arg_22_0:RemoveListener(IslandTaskAgency.TASK_ADDED, arg_22_0.OnUpdateTask)
	arg_22_0:RemoveListener(IslandTaskAgency.TASK_UPDATED, arg_22_0.OnUpdateTask)
	arg_22_0:RemoveListener(IslandTaskAgency.TASK_REMOVED, arg_22_0.OnUpdateTask)
	arg_22_0:RemoveListener(IslandCharacterAgency.ADD_SHIP, arg_22_0.OnAddShip)
	arg_22_0:RemoveListener(IslandCharacterAgency.SHIP_LEVEL_UP, arg_22_0.OnShipLevelUp)
	arg_22_0:RemoveListener(IslandCharacterAgency.SHIP_GET_STATE, arg_22_0.OnShipGetState)
	arg_22_0:RemoveListener(IslandAblityAgency.UNLCOK_SYSTEM, arg_22_0.OnUnlockSystem)
	arg_22_0:RemoveListener(ISLAND_EX_EVT.INIT_FINISH, arg_22_0.OnSceneLoaded)
	arg_22_0:RemoveListener(ISLAND_EX_EVT.SAVE_AGORA, arg_22_0.OnAgoraSave)
	arg_22_0:RemoveListener(ISLAND_EX_EVT.UPGRADE_AGORA, arg_22_0.OnAgoraUpgrade)
	arg_22_0:RemoveListener(ISLAND_EX_EVT.ENTER_EDIT_AGORA, arg_22_0.OnAgoraEnterEditMode)
	arg_22_0:RemoveListener(ISLAND_EX_EVT.EXIT_EDIT_AGORA, arg_22_0.OnAgoraExitEditMode)
	arg_22_0:RemoveListener(ISLAND_EX_EVT.OPEN_PAGE, arg_22_0.OnOpenPage)
	arg_22_0:RemoveListener(ISLAND_EX_EVT.TRIGGER_TASK, arg_22_0.OnTriggerTask)
	arg_22_0:RemoveListener(ISLAND_EX_EVT.SUBMIT_TASK, arg_22_0.OnSubmitTask)
	arg_22_0:RemoveListener(ISLAND_EX_EVT.ADD_TASK_PROGRESS, arg_22_0.OnAddTaskProgress)
	arg_22_0:RemoveListener(ISLAND_EX_EVT.PLAY_STORY, arg_22_0.OnPlayStory)
	arg_22_0:RemoveListener(ISLAND_EX_EVT.SWITCH_MAP, arg_22_0.OnSwitchMap)
	arg_22_0:RemoveListener(ISLAND_EX_EVT.SEEK_GAME_START, arg_22_0.OnSeekGameStart)
	arg_22_0:RemoveListener(ISLAND_EX_EVT.SEEK_GAME_END, arg_22_0.OnSeekGameEnd)
end

function var_0_0.OnSeekGameStart(arg_23_0)
	setActive(arg_23_0._tf, false)
end

function var_0_0.OnSeekGameEnd(arg_24_0)
	setActive(arg_24_0._tf, true)
end

function var_0_0.OnSwitchMap(arg_25_0, arg_25_1)
	local var_25_0 = pg.island_world_objects[arg_25_1].mapId

	arg_25_0:emit(IslandMediator.SWITCH_MAP, var_25_0, arg_25_1)
end

function var_0_0.OnPlayStory(arg_26_0, arg_26_1)
	arg_26_0:PlayStory(arg_26_1)
end

function var_0_0.OnTriggerTask(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0:GetIsland():GetTaskAgency():GetFutureTask(arg_27_1)

	if var_27_0 and var_27_0:IsUnlock() then
		arg_27_0:emit(IslandMediator.ON_ACCEPT_TASK, {
			taskIds = {
				arg_27_1
			}
		})
	end
end

function var_0_0.OnSubmitTask(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0:GetIsland():GetTaskAgency():GetTask(arg_28_1)

	if var_28_0 and var_28_0:IsFinish() then
		arg_28_0:emit(IslandMediator.ON_SUBMIT_TASK, arg_28_1)
	end
end

function var_0_0.OnAddTaskProgress(arg_29_0, arg_29_1, arg_29_2)
	for iter_29_0, iter_29_1 in pairs(arg_29_0:GetIsland():GetTaskAgency():GetTasks()) do
		local var_29_0 = false
		local var_29_1

		if arg_29_1 == 1 then
			var_29_0, var_29_1 = iter_29_1:ExistApproachTarget(arg_29_2)
		elseif arg_29_1 == 2 then
			var_29_0, var_29_1 = iter_29_1:ExistInteractionTarget(arg_29_2)
		end

		if var_29_0 then
			arg_29_0:emit(IslandMediator.ON_CLIENT_UPDATE_TASK, {
				taskId = 0,
				progress = 1,
				targetId = var_29_1.id
			})

			return
		end
	end
end

function var_0_0.OnOpenPage(arg_30_0, arg_30_1, ...)
	arg_30_0:OpenPage(arg_30_1, ...)
end

function var_0_0.OnAgoraEnterEditMode(arg_31_0)
	setActive(arg_31_0._tf, false)
end

function var_0_0.OnAgoraExitEditMode(arg_32_0)
	setActive(arg_32_0._tf, true)
end

function var_0_0.OnAgoraSave(arg_33_0, arg_33_1)
	arg_33_0:emit(IslandMediator.SAVE_AGORA, arg_33_1)
end

function var_0_0.OnAgoraUpgrade(arg_34_0)
	arg_34_0:emit(IslandMediator.UPGRADE_AGORA)
end

function var_0_0.OnShipGetState(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_1.ship
	local var_35_1 = arg_35_1.status
	local var_35_2 = var_35_0:GetName()

	arg_35_0:ShowToast({
		type = IslandToast.TYPE_STATE,
		content = var_35_2 .. i18n1("获得状态\n[") .. var_35_1:GetName() .. "]"
	})
end

function var_0_0.OnShipLevelUp(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_1:GetName()
	local var_36_1 = arg_36_1:GetLevel()

	arg_36_0:ShowToast({
		content = var_36_0 .. i18n1("提升至等级") .. var_36_1
	})
end

function var_0_0.OnAddShip(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_1:GetName()
	local var_37_1 = arg_37_0:GetIsland():GetName()

	arg_37_0:ShowToast({
		content = var_37_0 .. i18n1("正式加入") .. var_37_1
	})
end

function var_0_0.OnUpgrade(arg_38_0, arg_38_1)
	arg_38_0:UpdateTip()
	arg_38_0:UpdateIslandInfo()
	arg_38_0:OpenPage(IslandUpgradeDisplayPage, arg_38_1.awards)
end

function var_0_0.OnModifyName(arg_39_0)
	arg_39_0:UpdateIslandInfo()
end

function var_0_0.OnGetProsperityAward(arg_40_0)
	arg_40_0:UpdateTip()
end

function var_0_0.OnUnlockSystem(arg_41_0, arg_41_1)
	if underscore.any(pg.island_main_btns.get_id_list_by_main_type[1], function(arg_42_0)
		return pg.island_main_btns[arg_42_0].ability_id == arg_42_0
	end) then
		arg_41_0:UpdateBtnList()
	end
end

function var_0_0.OnSceneLoaded(arg_43_0)
	arg_43_0:UpdateTip()
	arg_43_0:UpdateIslandInfo()
	arg_43_0:UpdateTaskInfo()
	arg_43_0:UpdateBtnList()
end

function var_0_0.UpdateBtnList(arg_44_0)
	local var_44_0 = arg_44_0:GetIsland():GetAblityAgency()

	arg_44_0.btnList = underscore.select(pg.island_main_btns.get_id_list_by_main_type[1], function(arg_45_0)
		local var_45_0 = pg.island_main_btns[arg_45_0].ability_id

		return var_45_0 == 0 or var_44_0:HasAbility(var_45_0)
	end)

	arg_44_0.btnUIList:align(#arg_44_0.btnList)
end

function var_0_0.UpdateTaskInfo(arg_46_0)
	arg_46_0.taskTrackPanel:ExecuteAction("Show")
	arg_46_0:UpdateTrackBtnUI()
end

function var_0_0.OnUpdateTrackTask(arg_47_0, arg_47_1)
	arg_47_0.taskTrackPanel:ExecuteAction("UpdateTrackTask", arg_47_1)
	arg_47_0:UpdateTrackBtnUI()
end

function var_0_0.OnUpdateTask(arg_48_0, arg_48_1)
	arg_48_0.taskTrackPanel:ExecuteAction("UpdateTask", arg_48_1)
	arg_48_0:UpdateTrackBtnUI()
end

function var_0_0.UpdateTrackBtnUI(arg_49_0)
	local var_49_0 = arg_49_0:GetIsland():GetTaskAgency():GetTraceTask()

	eachChild(arg_49_0.btnContainer, function(arg_50_0)
		local var_50_0 = arg_50_0:Find("track")

		if var_50_0 then
			if var_49_0 then
				local var_50_1 = var_49_0:GetTraceParam()

				setActive(var_50_0, arg_50_0.name == var_50_1)

				if arg_50_0.name == "map" then
					local var_50_2 = tonumber(var_50_1)

					if var_50_2 and arg_49_0:GetIsland():GetMapId() ~= pg.island_world_objects[var_50_2].mapId then
						setActive(var_50_0, true)
					end
				end
			else
				setActive(var_50_0, false)
			end
		end
	end)
end

function var_0_0.OnUnloadScene(arg_51_0)
	return
end

function var_0_0.willExit(arg_52_0)
	if arg_52_0.taskTrackPanel then
		arg_52_0.taskTrackPanel:Destroy()

		arg_52_0.taskTrackPanel = nil
	end
end

return var_0_0
