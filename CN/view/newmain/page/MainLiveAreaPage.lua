local var_0_0 = class("MainLiveAreaPage", import("view.base.BaseSubView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0:bind(NewMainScene.UPDATE_COVER, function(arg_2_0)
		arg_1_0:ExecuteAction("UpdateCover")
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
	arg_4_0._coverBtn = arg_4_0:findTF("cover_btn")

	setActive(arg_4_0._coverBtn, not LOCK_DORM3D_SYSTEM)

	arg_4_0._academyBtn = arg_4_0:findTF("school_btn")
	arg_4_0._haremBtn = arg_4_0:findTF("backyard_btn")
	arg_4_0._commanderBtn = arg_4_0:findTF("commander_btn")
	arg_4_0._educateBtn = arg_4_0:findTF("educate_btn")
	arg_4_0._islandBtn = arg_4_0:findTF("island_btn")
	arg_4_0._dormBtn = arg_4_0:findTF("dorm_btn")
	arg_4_0.coverPage = LivingAreaCoverPage.New(arg_4_0._tf, arg_4_0.event, {
		onHide = function()
			arg_4_0:UpdateCoverTip()
		end,
		onSelected = function(arg_6_0)
			arg_4_0:UpdateCoverTemp(arg_6_0)
		end
	})

	pg.redDotHelper:AddNode(RedDotNode.New(arg_4_0._haremBtn:Find("tip"), {
		pg.RedDotMgr.TYPES.COURTYARD
	}))
	pg.redDotHelper:AddNode(SelfRefreshRedDotNode.New(arg_4_0._academyBtn:Find("tip"), {
		pg.RedDotMgr.TYPES.SCHOOL
	}))
	pg.redDotHelper:AddNode(SelfRefreshRedDotNode.New(arg_4_0._commanderBtn:Find("tip"), {
		pg.RedDotMgr.TYPES.COMMANDER
	}))
	pg.redDotHelper:AddNode(RedDotNode.New(arg_4_0._dormBtn:Find("tip"), {
		pg.RedDotMgr.TYPES.DORM3D_GIFT,
		pg.RedDotMgr.TYPES.DORM3D_FURNITURE
	}))
end

function var_0_0.OnInit(arg_7_0)
	onButton(arg_7_0, arg_7_0._coverBtn, function()
		arg_7_0.coverPage:ExecuteAction("Show")
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._commanderBtn, function()
		arg_7_0:emit(NewMainMediator.GO_SCENE, SCENE.COMMANDERCAT, {
			fromMain = true,
			fleetType = CommanderCatScene.FLEET_TYPE_COMMON
		})
		arg_7_0:Hide()
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._haremBtn, function()
		arg_7_0:emit(NewMainMediator.GO_SCENE, SCENE.COURTYARD)
		arg_7_0:Hide()
	end, SFX_MAIN)
	onButton(arg_7_0, arg_7_0._academyBtn, function()
		arg_7_0:emit(NewMainMediator.GO_SCENE, SCENE.NAVALACADEMYSCENE)
		arg_7_0:Hide()
	end, SFX_MAIN)

	if LOCK_DORM3D_SYSTEM then
		SetCompomentEnabled(arg_7_0._educateBtn, typeof(Image), false)
		setActive(arg_7_0._educateBtn:Find("lock"), true)
		SetCompomentEnabled(arg_7_0._dormBtn, typeof(Image), false)
		setActive(arg_7_0._dormBtn:Find("lock"), true)
		onButton(arg_7_0, arg_7_0._dormBtn:Find("lock"), function()
			if LOCK_EDUCATE_SYSTEM then
				return
			end

			arg_7_0:emit(NewMainMediator.GO_SCENE, SCENE.EDUCATE, {
				isMainEnter = true
			})
			arg_7_0:Hide()
		end, SFX_MAIN)
	else
		onButton(arg_7_0, arg_7_0._educateBtn, function()
			if LOCK_EDUCATE_SYSTEM then
				return
			end

			arg_7_0:emit(NewMainMediator.GO_SCENE, SCENE.EDUCATE, {
				isMainEnter = true
			})
			arg_7_0:Hide()
		end, SFX_MAIN)
		onButton(arg_7_0, arg_7_0._dormBtn, function()
			arg_7_0:emit(NewMainMediator.OPEN_DORM_SELECT_LAYER)
			arg_7_0:Hide()
		end, SFX_MAIN)
	end

	onButton(arg_7_0, arg_7_0._tf:Find("_bg"), function()
		arg_7_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_16_0)
	var_0_0.super.Show(arg_16_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_16_0._tf, true, {
		weight = LayerWeightConst.SECOND_LAYER
	})

	local var_16_0 = getProxy(PlayerProxy):getRawData()

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_16_0.level, "CommanderCatMediator") then
		arg_16_0._commanderBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_16_0._commanderBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_16_0.level, "CourtYardMediator") then
		arg_16_0._haremBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_16_0._haremBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_16_0.level, "EducateMediator") then
		arg_16_0._educateBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_16_0._educateBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_16_0.level, "SelectDorm3DMediator") then
		arg_16_0._dormBtn:GetComponent(typeof(Image)).color = Color(0.5, 0.5, 0.5, 1)
	else
		arg_16_0._dormBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	arg_16_0:UpdateCover()
	arg_16_0:UpdateCoverTip()
	arg_16_0:UpdateTime()

	arg_16_0.timer = Timer.New(function()
		arg_16_0:UpdateTime()
	end, 60, -1)

	arg_16_0.timer:Start()
end

function var_0_0.UpdateTime(arg_18_0)
	local var_18_0 = pg.TimeMgr.GetInstance()
	local var_18_1 = var_18_0:GetServerHour()
	local var_18_2 = var_18_1 < 12

	setActive(arg_18_0:findTF("AM", arg_18_0._bg), var_18_2)
	setActive(arg_18_0:findTF("PM", arg_18_0._bg), not var_18_2)

	local var_18_3 = arg_18_0:getCoverType(var_18_1)

	setActive(arg_18_0:findTF("day", arg_18_0._bg), var_18_3 == LivingAreaCover.TYPE_DAY)
	setActive(arg_18_0:findTF("night", arg_18_0._bg), var_18_3 == LivingAreaCover.TYPE_NIGHT)
	setActive(arg_18_0:findTF("day", arg_18_0._islandBtn), var_18_3 == LivingAreaCover.TYPE_DAY)
	setActive(arg_18_0:findTF("night", arg_18_0._islandBtn), var_18_3 ~= LivingAreaCover.TYPE_DAY)

	local var_18_4 = var_18_0:CurrentSTimeDesc("%Y/%m/%d", true)

	setText(arg_18_0:findTF("date", arg_18_0._bg), var_18_4)

	local var_18_5 = var_18_0:CurrentSTimeDesc(":%M", true)

	if var_18_1 > 12 then
		var_18_1 = var_18_1 - 12
	end

	setText(arg_18_0:findTF("time", arg_18_0._bg), var_18_1 .. var_18_5)

	local var_18_6 = EducateHelper.GetWeekStrByNumber(var_18_0:GetServerWeek())

	setText(arg_18_0:findTF("date/week", arg_18_0._bg), var_18_6)
end

function var_0_0.getCoverType(arg_19_0, arg_19_1)
	for iter_19_0, iter_19_1 in ipairs(arg_19_0.timeCfg) do
		local var_19_0 = iter_19_1[1]

		if arg_19_1 >= var_19_0[1] and arg_19_1 < var_19_0[2] then
			return iter_19_1[2]
		end
	end

	return LivingAreaCover.TYPE_DAY
end

function var_0_0.UpdateCover(arg_20_0)
	local var_20_0 = getProxy(LivingAreaCoverProxy):GetCurCover()

	if arg_20_0.cover and arg_20_0.cover.id == var_20_0.id then
		return
	end

	arg_20_0.cover = var_20_0

	arg_20_0:_loadBg()
end

function var_0_0.UpdateCoverTemp(arg_21_0, arg_21_1)
	if arg_21_0.cover and arg_21_0.cover.id == arg_21_1.id then
		return
	end

	arg_21_0.cover = arg_21_1

	arg_21_0:_loadBg()
end

function var_0_0._loadBg(arg_22_0)
	setImageSprite(arg_22_0:findTF("day", arg_22_0._bg), GetSpriteFromAtlas(arg_22_0.cover:GetBg(LivingAreaCover.TYPE_DAY), ""), true)
	setImageSprite(arg_22_0:findTF("night", arg_22_0._bg), GetSpriteFromAtlas(arg_22_0.cover:GetBg(LivingAreaCover.TYPE_NIGHT), ""), true)
end

function var_0_0.UpdateCoverTip(arg_23_0)
	setActive(arg_23_0:findTF("tip", arg_23_0._coverBtn), getProxy(LivingAreaCoverProxy):IsTip())
end

function var_0_0.Hide(arg_24_0)
	if arg_24_0.coverPage and arg_24_0.coverPage:GetLoaded() and arg_24_0.coverPage:isShowing() then
		arg_24_0.coverPage:Hide()

		return
	end

	if arg_24_0:isShowing() then
		var_0_0.super.Hide(arg_24_0)
		pg.UIMgr.GetInstance():UnblurPanel(arg_24_0._tf, arg_24_0._parentTf)
	end

	if arg_24_0.timer ~= nil then
		arg_24_0.timer:Stop()

		arg_24_0.timer = nil
	end
end

function var_0_0.OnDestroy(arg_25_0)
	arg_25_0.coverPage:Destroy()

	arg_25_0.coverPage = nil
	arg_25_0.cover = nil

	arg_25_0:Hide()
end

return var_0_0
