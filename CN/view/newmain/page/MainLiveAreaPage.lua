local var_0_0 = class("MainLiveAreaPage", import("...base.BaseSubView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0:bind(NewMainScene.OPEN_LIVEAREA, function(arg_2_0)
		arg_1_0:ExecuteAction("Show")
	end)
end

function var_0_0.getUIName(arg_3_0)
	return "MainLiveAreaUI"
end

function var_0_0.OnLoaded(arg_4_0)
	arg_4_0._bg = arg_4_0:findTF("bg")

	setText(arg_4_0:findTF("day/Text", arg_4_0._bg), i18n("word_harbour"))
	setText(arg_4_0:findTF("night/Text", arg_4_0._bg), i18n("word_harbour"))

	arg_4_0.timeCfg = pg.gameset.main_live_area_time.description
	arg_4_0._academyBtn = arg_4_0:findTF("school_btn")
	arg_4_0._haremBtn = arg_4_0:findTF("backyard_btn")
	arg_4_0._commanderBtn = arg_4_0:findTF("commander_btn")
	arg_4_0._educateBtn = arg_4_0:findTF("educate_btn")
	arg_4_0._islandBtn = arg_4_0:findTF("island_btn")
	arg_4_0._dormBtn = arg_4_0:findTF("dorm_btn")

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
	onButton(arg_5_0, arg_5_0._educateBtn, function()
		if LOCK_EDUCATE_SYSTEM then
			return
		end

		arg_5_0:emit(NewMainMediator.GO_SCENE, SCENE.EDUCATE, {
			isMainEnter = true
		})
		arg_5_0:Hide()
	end, SFX_MAIN)
	onButton(arg_5_0, arg_5_0._islandBtn, function()
		return
	end, SFX_MAIN)
	onButton(arg_5_0, arg_5_0._dormBtn, function()
		return
	end, SFX_MAIN)
	onButton(arg_5_0, arg_5_0._tf, function()
		arg_5_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_13_0)
	var_0_0.super.Show(arg_13_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_13_0._tf, true, {
		weight = LayerWeightConst.SECOND_LAYER
	})

	local var_13_0 = getProxy(PlayerProxy):getRawData()

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_13_0.level, "CommanderCatMediator") then
		arg_13_0._commanderBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_13_0._commanderBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_13_0.level, "CourtYardMediator") then
		arg_13_0._haremBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_13_0._haremBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_13_0.level, "EducateMediator") then
		arg_13_0._educateBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_13_0._educateBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	arg_13_0:UpdateTime()

	arg_13_0.timer = Timer.New(function()
		arg_13_0:UpdateTime()
	end, 60, -1)

	arg_13_0.timer:Start()
end

function var_0_0.UpdateTime(arg_15_0)
	local var_15_0 = pg.TimeMgr.GetInstance()
	local var_15_1 = var_15_0:GetServerHour()
	local var_15_2 = var_15_1 < 12

	setActive(arg_15_0:findTF("AM", arg_15_0._bg), var_15_2)
	setActive(arg_15_0:findTF("PM", arg_15_0._bg), not var_15_2)

	local var_15_3 = arg_15_0:getDayOrNight(var_15_1) == "day"

	setActive(arg_15_0:findTF("day", arg_15_0._bg), var_15_3)
	setActive(arg_15_0:findTF("night", arg_15_0._bg), not var_15_3)
	setActive(arg_15_0:findTF("day", arg_15_0._islandBtn), var_15_3)
	setActive(arg_15_0:findTF("night", arg_15_0._islandBtn), not var_15_3)

	local var_15_4 = var_15_0:CurrentSTimeDesc("%Y/%m/%d", true)

	setText(arg_15_0:findTF("date", arg_15_0._bg), var_15_4)

	local var_15_5 = var_15_0:CurrentSTimeDesc(":%M", true)

	if var_15_1 > 12 then
		var_15_1 = var_15_1 - 12
	end

	setText(arg_15_0:findTF("time", arg_15_0._bg), var_15_1 .. var_15_5)

	local var_15_6 = EducateHelper.GetWeekStrByNumber(var_15_0:GetServerWeek())

	setText(arg_15_0:findTF("date/week", arg_15_0._bg), var_15_6)
end

function var_0_0.getDayOrNight(arg_16_0, arg_16_1)
	for iter_16_0, iter_16_1 in ipairs(arg_16_0.timeCfg) do
		local var_16_0 = iter_16_1[1]

		if arg_16_1 >= var_16_0[1] and arg_16_1 < var_16_0[2] then
			return iter_16_1[2]
		end
	end

	return "day"
end

function var_0_0.Hide(arg_17_0)
	if arg_17_0:isShowing() then
		var_0_0.super.Hide(arg_17_0)
		pg.UIMgr.GetInstance():UnblurPanel(arg_17_0._tf, arg_17_0._parentTf)
	end

	if arg_17_0.timer ~= nil then
		arg_17_0.timer:Stop()

		arg_17_0.timer = nil
	end
end

function var_0_0.OnDestroy(arg_18_0)
	arg_18_0:Hide()
end

return var_0_0
