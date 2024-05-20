local var_0_0 = class("NavalAcademyScene", import("..base.BaseUI"))

var_0_0.WARP_TO_TACTIC = "WARP_TO_TACTIC"

function var_0_0.getUIName(arg_1_0)
	local var_1_0 = pg.activity_banner.get_id_list_by_type[GAMEUI_BANNER_13]
	local var_1_1 = _.filter(var_1_0, function(arg_2_0)
		local var_2_0 = pg.activity_banner[arg_2_0].time

		return pg.TimeMgr.GetInstance():inTime(var_2_0)
	end)
	local var_1_2 = pg.activity_banner[var_1_1[1]]
	local var_1_3 = var_1_2 and var_1_2.pic
	local var_1_4 = pg.naval_academy_theme[var_1_3]

	return var_1_4 and var_1_4.resource_path or "NavalAcademyUI"
end

function var_0_0.ResUISettings(arg_3_0)
	return true
end

function var_0_0.SetOilResField(arg_4_0, arg_4_1)
	arg_4_0.oilResField = arg_4_1
end

function var_0_0.SetGoldResField(arg_5_0, arg_5_1)
	arg_5_0.goldResField = arg_5_1
end

function var_0_0.SetClassResField(arg_6_0, arg_6_1)
	arg_6_0.classResField = arg_6_1
end

function var_0_0.SetPlayer(arg_7_0, arg_7_1)
	arg_7_0.player = arg_7_1
end

function var_0_0.UpdatePlayer(arg_8_0, arg_8_1)
	arg_8_0.player = arg_8_1
end

function var_0_0.init(arg_9_0)
	arg_9_0.backBtn = arg_9_0:findTF("blur_container/adapt/top/title/back")
	arg_9_0._blurLayer = arg_9_0:findTF("blur_container")
	arg_9_0._topPanel = arg_9_0._blurLayer:Find("adapt/top")
	arg_9_0.bg = arg_9_0:findTF("academyMap/map")
	arg_9_0.buildings = {
		ShopBuiding.New(arg_9_0),
		CanteenBuiding.New(arg_9_0),
		ClassRoomBuilding.New(arg_9_0),
		FountainBuiding.New(arg_9_0),
		TacticRoomBuilding.New(arg_9_0),
		CommanderBuilding.New(arg_9_0),
		SupplyShopBuilding.New(arg_9_0),
		MinigameHallBuilding.New(arg_9_0)
	}
	arg_9_0.shipsView = NavalAcademyShipsView.New(arg_9_0)
	arg_9_0.resPage = ResourcePage.New(arg_9_0._tf, arg_9_0.event)
end

function var_0_0.didEnter(arg_10_0)
	onButton(arg_10_0, arg_10_0.backBtn, function()
		arg_10_0:ExitAnim()
		arg_10_0:emit(var_0_0.ON_BACK, nil, 0.3)
	end, SFX_CANCEL)
	arg_10_0:InitBuildings()
	arg_10_0.shipsView:BindBuildings(arg_10_0.buildings)
	arg_10_0:UpdatePlayer(arg_10_0.player)
	arg_10_0:LoadEffects()
	arg_10_0:OpenDefaultLayer()
	arg_10_0:EnterAnim()
	arg_10_0:InitChars()

	arg_10_0.bulinTip = AprilFoolBulinSubView.ShowAprilFoolBulin(arg_10_0)
end

function var_0_0.InitBuildings(arg_12_0)
	for iter_12_0, iter_12_1 in ipairs(arg_12_0.buildings) do
		iter_12_1:Init()
	end
end

function var_0_0.EnterAnim(arg_13_0)
	setAnchoredPosition(arg_13_0._topPanel, {
		y = 84
	})
	shiftPanel(arg_13_0._topPanel, nil, 0, 0.3, 0, true, true)
end

function var_0_0.ExitAnim(arg_14_0)
	shiftPanel(arg_14_0._topPanel, nil, arg_14_0._topPanel.rect.height, 0.3, 0, true, true)
end

function var_0_0.OpenDefaultLayer(arg_15_0)
	arg_15_0.warp = arg_15_0.contextData.warp
	arg_15_0.contextData.warp = nil

	if arg_15_0.warp == var_0_0.WARP_TO_TACTIC then
		arg_15_0:emit(NavalAcademyMediator.ON_OPEN_TACTICROOM)
	end
end

function var_0_0.LoadEffects(arg_16_0)
	arg_16_0:LoadWaveEffect()
	arg_16_0:LoadMainEffect()
end

function var_0_0.LoadWaveEffect(arg_17_0)
	arg_17_0:GetEffect("xueyuan02", function(arg_18_0)
		setParent(arg_18_0, arg_17_0.bg)

		arg_17_0.waveEffect = arg_18_0
	end)
end

function var_0_0.LoadMainEffect(arg_19_0)
	return
end

function var_0_0.InitChars(arg_20_0)
	arg_20_0.shipsView:Init()
end

function var_0_0.OpenGoldResField(arg_21_0)
	arg_21_0.resPage:ExecuteAction("Flush", arg_21_0.goldResField)
end

function var_0_0.OpenOilResField(arg_22_0)
	arg_22_0.resPage:ExecuteAction("Flush", arg_22_0.oilResField)
end

function var_0_0.OnAddLayer(arg_23_0)
	arg_23_0.layerCnt = (arg_23_0.layerCnt or 0) + 1

	if arg_23_0.layerCnt == 1 then
		arg_23_0:EnableEffects(false)
	end
end

function var_0_0.OnRemoveLayer(arg_24_0, arg_24_1)
	arg_24_0.layerCnt = (arg_24_0.layerCnt or 0) - 1

	if arg_24_0.layerCnt <= 0 then
		arg_24_0.layerCnt = 0

		arg_24_0:EnableEffects(true)
	end

	if arg_24_1.context.mediator == NewNavalTacticsMediator then
		arg_24_0.buildings[5]:RefreshTip()
	end
end

function var_0_0.EnableEffects(arg_25_0, arg_25_1)
	if arg_25_0.waveEffect then
		setActive(arg_25_0.waveEffect, arg_25_1)
	end

	if arg_25_0.mainEffect then
		setActive(arg_25_0.mainEffect, arg_25_1)
	end
end

function var_0_0.OnGetRes(arg_26_0, arg_26_1, arg_26_2)
	if arg_26_0.buildings[arg_26_1] then
		arg_26_0.buildings[arg_26_1]:PlayGetResAnim(arg_26_2)
	end
end

function var_0_0.OnStartUpgradeResField(arg_27_0, arg_27_1)
	local var_27_0

	if isa(arg_27_1, OilResourceField) then
		var_27_0 = arg_27_0.buildings[2]
		page = arg_27_0.resPage
	elseif isa(arg_27_1, GoldResourceField) then
		var_27_0 = arg_27_0.buildings[1]
		page = arg_27_0.resPage
	elseif isa(arg_27_1, ClassResourceField) then
		var_27_0 = arg_27_0.buildings[3]
	end

	if var_27_0 then
		var_27_0:UpdateResField()
	end

	if page and page:GetLoaded() and page:isShowing() and page.resourceField and page.resourceField:GetKeyWord() == arg_27_1:GetKeyWord() then
		page:Update(arg_27_1)
	end
end

function var_0_0.OnResFieldLevelUp(arg_28_0, arg_28_1)
	arg_28_0:OnStartUpgradeResField(arg_28_1)
end

function var_0_0.OnCollectionUpdate(arg_29_0)
	arg_29_0.buildings[4]:RefreshTip()
end

function var_0_0.RefreshChars(arg_30_0)
	arg_30_0.shipsView:Refresh()
end

function var_0_0.willExit(arg_31_0)
	for iter_31_0, iter_31_1 in ipairs(arg_31_0.buildings) do
		iter_31_1:Dispose()
	end

	arg_31_0.buildings = nil

	if arg_31_0.resPage then
		arg_31_0.resPage:Destroy()

		arg_31_0.resPage = nil
	end

	if arg_31_0.mainEffect then
		Destroy(arg_31_0.mainEffect)

		arg_31_0.mainEffect = nil
	end

	if arg_31_0.waveEffect then
		Destroy(arg_31_0.waveEffect)

		arg_31_0.waveEffect = nil
	end

	if arg_31_0.bulinTip then
		arg_31_0.bulinTip:Destroy()

		arg_31_0.bulinTip = nil
	end

	if arg_31_0.shipsView then
		arg_31_0.shipsView:Dispose()

		arg_31_0.shipsView = nil
	end
end

function var_0_0.GetEffect(arg_32_0, arg_32_1, arg_32_2)
	ResourceMgr.Inst:getAssetAsync("ui/" .. arg_32_1, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_33_0)
		if arg_32_0.exited then
			return
		end

		arg_32_2(Instantiate(arg_33_0))
	end), true, true)
end

return var_0_0
