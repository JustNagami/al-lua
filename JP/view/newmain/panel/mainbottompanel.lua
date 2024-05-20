local var_0_0 = class("MainBottomPanel", import(".MainBasePanel"))

function var_0_0.OnSetUp(arg_1_0)
	arg_1_0.mallBtn = findTF(arg_1_0._tf, "mallBtn")
	arg_1_0.dockBtn = findTF(arg_1_0._tf, "dockBtn")
	arg_1_0.warehouse = findTF(arg_1_0._tf, "equipButton")
	arg_1_0.liveAreaBtn = findTF(arg_1_0._tf, "liveButton")
	arg_1_0.technologyBtn = findTF(arg_1_0._tf, "technologyButton")
	arg_1_0.taskBtn = findTF(arg_1_0._tf, "taskButton")
	arg_1_0.buildBtn = findTF(arg_1_0._tf, "buildButton")
	arg_1_0.guildBtn = findTF(arg_1_0._tf, "guildButton")
	arg_1_0.guildLock = findTF(arg_1_0._tf, "guildButton/lock")
	arg_1_0.guildImage = arg_1_0.guildBtn:GetComponent(typeof(Image))
	arg_1_0.monthCardTag = findTF(arg_1_0._tf, "tags/monthcard")
	arg_1_0.sellTag = findTF(arg_1_0._tf, "tags/sell")
	arg_1_0.skinTag = findTF(arg_1_0._tf, "tags/skin")
	arg_1_0.mallTip = arg_1_0.mallBtn:Find("tip")
	arg_1_0.buildTag = findTF(arg_1_0._tf, "tags/build")
	arg_1_0.tecShipGiftTag = findTF(arg_1_0._tf, "tags/tecshipgift")
end

function var_0_0.OnRegist(arg_2_0)
	onButton(arg_2_0, arg_2_0.mallBtn, function()
		arg_2_0:emit(NewMainMediator.GO_SCENE, SCENE.CHARGE_MENU)

		local var_3_0 = isActive(arg_2_0.sellTag) or isActive(arg_2_0.skinTag) or isActive(arg_2_0.mallTip)

		pg.m02:sendNotification(GAME.TRACK, TrackConst.GetTrackData(TrackConst.SYSTEM_SHOP, TrackConst.ACTION_ENTER_MAIN, var_3_0))
		PlayerPrefs.SetInt("Tec_Ship_Gift_Enter_Tag", 1)
		PlayerPrefs.Save()
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.dockBtn, function()
		arg_2_0:emit(NewMainMediator.GO_SCENE, SCENE.DOCKYARD, {
			mode = DockyardScene.MODE_OVERVIEW
		})
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.warehouse, function()
		arg_2_0:emit(NewMainMediator.GO_SCENE, SCENE.EQUIPSCENE)
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.liveAreaBtn, function()
		arg_2_0:emit(NewMainScene.OPEN_LIVEAREA)
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.technologyBtn, function()
		arg_2_0:emit(NewMainMediator.GO_SCENE, SCENE.SELTECHNOLOGY)
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.taskBtn, function()
		arg_2_0:emit(NewMainMediator.GO_SCENE, SCENE.TASK)
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.buildBtn, function()
		arg_2_0:emit(NewMainMediator.GO_SCENE, SCENE.GETBOAT)
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.guildBtn, function()
		if getProxy(GuildProxy):getRawData() then
			arg_2_0:emit(NewMainMediator.GO_SCENE, SCENE.GUILD)
		else
			arg_2_0:emit(NewMainMediator.GO_SCENE, SCENE.NEWGUILD)
		end
	end, SFX_MAIN)
end

function var_0_0.GetDirection(arg_11_0)
	return Vector2(0, -1)
end

function var_0_0.OnFresh(arg_12_0)
	local var_12_0 = {}

	table.insert(var_12_0, function(arg_13_0)
		arg_12_0:RefreshGuildBtn()
		onNextTick(arg_13_0)
	end)
	table.insert(var_12_0, function(arg_14_0)
		TagTipHelper.TecShipGiftTip(arg_12_0.tecShipGiftTag)
		onNextTick(arg_14_0)
	end)
	table.insert(var_12_0, function(arg_15_0)
		TagTipHelper.MonthCardTagTip(arg_12_0.monthCardTag)
		onNextTick(arg_15_0)
	end)
	table.insert(var_12_0, function(arg_16_0)
		TagTipHelper.SkinTagTip(arg_12_0.skinTag)
		onNextTick(arg_16_0)
	end)
	table.insert(var_12_0, function(arg_17_0)
		TagTipHelper.FuDaiTagTip(arg_12_0.sellTag)
		onNextTick(arg_17_0)
	end)
	table.insert(var_12_0, function(arg_18_0)
		TagTipHelper.FreeGiftTag({
			arg_12_0.mallTip
		})
		onNextTick(arg_18_0)
	end)
	table.insert(var_12_0, function(arg_19_0)
		TagTipHelper.FreeBuildTicketTip(arg_12_0.buildTag)
		onNextTick(arg_19_0)
	end)
	seriesAsync(var_12_0)
end

function var_0_0.RefreshGuildBtn(arg_20_0)
	local var_20_0 = getProxy(PlayerProxy):getRawData()
	local var_20_1 = pg.SystemOpenMgr.GetInstance():isOpenSystem(var_20_0.level, "NewGuildMediator")

	if not arg_20_0.isOpenGuild or arg_20_0.isOpenGuild ~= var_20_1 then
		setActive(arg_20_0.guildLock, not var_20_1)

		local var_20_2 = var_20_1 and Color(1, 1, 1, 1) or Color(0.3, 0.3, 0.3, 1)

		arg_20_0.guildImage.color = var_20_2
		arg_20_0.isOpenGuild = var_20_1
	end
end

function var_0_0.OnUpdatePlayer(arg_21_0)
	arg_21_0:RefreshGuildBtn()
end

return var_0_0
