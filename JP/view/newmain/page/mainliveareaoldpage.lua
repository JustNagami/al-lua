local var_0_0 = class("MainLiveAreaOldPage", import("...base.BaseSubView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0:bind(NewMainScene.OPEN_LIVEAREA, function(arg_2_0)
		arg_1_0:ExecuteAction("Show")
	end)
end

function var_0_0.getUIName(arg_3_0)
	return "MainLiveAreaOldUI"
end

function var_0_0.OnLoaded(arg_4_0)
	arg_4_0._academyBtn = arg_4_0:findTF("school_btn")
	arg_4_0._haremBtn = arg_4_0:findTF("backyard_btn")
	arg_4_0._commanderBtn = arg_4_0:findTF("commander_btn")

	pg.redDotHelper:AddNode(RedDotNode.New(arg_4_0._haremBtn:Find("tip"), {
		pg.RedDotMgr.TYPES.COURTYARD
	}))
	pg.redDotHelper:AddNode(SelfRefreshRedDotNode.New(arg_4_0._academyBtn:Find("tip"), {
		pg.RedDotMgr.TYPES.SCHOOL
	}))
	pg.redDotHelper:AddNode(SelfRefreshRedDotNode.New(arg_4_0._commanderBtn:Find("tip"), {
		pg.RedDotMgr.TYPES.COMMANDER
	}))
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0._commanderBtn, function()
		arg_5_0:emit(NewMainMediator.GO_SCENE, SCENE.COMMANDERCAT, {
			fromMain = true,
			fleetType = CommanderCatScene.FLEET_TYPE_COMMON
		})
		arg_5_0:Hide()
	end, SFX_MAIN)
	onButton(arg_5_0, arg_5_0._haremBtn, function()
		arg_5_0:emit(NewMainMediator.GO_SCENE, SCENE.COURTYARD)
		arg_5_0:Hide()
	end, SFX_MAIN)
	onButton(arg_5_0, arg_5_0._academyBtn, function()
		arg_5_0:emit(NewMainMediator.GO_SCENE, SCENE.NAVALACADEMYSCENE)
		arg_5_0:Hide()
	end, SFX_MAIN)
	onButton(arg_5_0, arg_5_0._tf, function()
		arg_5_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_10_0)
	var_0_0.super.Show(arg_10_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_10_0._tf, true, {
		weight = LayerWeightConst.SECOND_LAYER
	})

	local var_10_0 = getProxy(PlayerProxy):getRawData()

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_10_0.level, "CommanderCatMediator") then
		arg_10_0._commanderBtn:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
	else
		arg_10_0._commanderBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_10_0.level, "CourtYardMediator") then
		arg_10_0._haremBtn:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
	else
		arg_10_0._haremBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end
end

function var_0_0.Hide(arg_11_0)
	if arg_11_0:isShowing() then
		var_0_0.super.Hide(arg_11_0)
		pg.UIMgr.GetInstance():UnblurPanel(arg_11_0._tf, arg_11_0._parentTf)
	end
end

function var_0_0.OnDestroy(arg_12_0)
	arg_12_0:Hide()
end

return var_0_0
