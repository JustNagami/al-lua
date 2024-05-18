local var_0_0 = class("MainRightPanel", import(".MainBasePanel"))

function var_0_0.OnSetUp(arg_1_0)
	arg_1_0.memoryBtn = findTF(arg_1_0._tf, "memoryButton")
	arg_1_0.collectionBtn = findTF(arg_1_0._tf, "collectionButton")
	arg_1_0.rankBtn = findTF(arg_1_0._tf, "rankButton")
	arg_1_0.friendBtn = findTF(arg_1_0._tf, "friendButton")
	arg_1_0.mailBtn = findTF(arg_1_0._tf, "mailButton")
	arg_1_0.noticeBtn = findTF(arg_1_0._tf, "noticeButton")
	arg_1_0.settingBtn = findTF(arg_1_0._tf, "settingButton")
	arg_1_0.formationBtn = findTF(arg_1_0._tf, "formationButton")
	arg_1_0.combatBtn = findTF(arg_1_0._tf, "combatBtn")
	arg_1_0.startPos = arg_1_0.memoryBtn.anchoredPosition
end

function var_0_0.OnRegist(arg_2_0)
	onButton(arg_2_0, arg_2_0.memoryBtn, function()
		arg_2_0:emit(NewMainMediator.GO_SCENE, SCENE.MEDIA_COLLECTION_ENTRANCE)
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.collectionBtn, function()
		arg_2_0:emit(NewMainMediator.GO_SCENE, SCENE.COLLECTSHIP)
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.rankBtn, function()
		arg_2_0:emit(NewMainMediator.GO_SCENE, SCENE.BILLBOARD, {
			index = PowerRank.TYPE_POWER
		})
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.friendBtn, function()
		arg_2_0:emit(NewMainMediator.GO_SCENE, SCENE.FRIEND)
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.mailBtn, function()
		arg_2_0:emit(NewMainMediator.OPEN_MAIL)
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.noticeBtn, function()
		if #getProxy(ServerNoticeProxy):getServerNotices(false) > 0 then
			arg_2_0:emit(NewMainMediator.OPEN_NOTICE)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("no_notice_tip"))
		end
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.settingBtn, function()
		SettingsRedDotNode.CanUpdateCV = false

		arg_2_0:emit(NewMainMediator.GO_SCENE, SCENE.SETTINGS)
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.formationBtn, function()
		local var_10_0 = {
			fleetId = 1
		}

		arg_2_0:emit(NewMainMediator.GO_SCENE, SCENE.BIANDUI, var_10_0)
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.combatBtn, function()
		local var_11_0 = getProxy(ChapterProxy):getActiveChapter()

		arg_2_0:emit(NewMainMediator.GO_SCENE, SCENE.LEVEL, {
			chapterId = var_11_0 and var_11_0.id,
			mapIdx = var_11_0 and var_11_0:getConfig("map")
		})
	end, SFX_MAIN)
end

function var_0_0.GetDirection(arg_12_0)
	return Vector2(1, 0)
end

function var_0_0.OnFresh(arg_13_0)
	arg_13_0:RefreshRankBtn()
end

function var_0_0.RefreshRankBtn(arg_14_0)
	local var_14_0 = getProxy(PlayerProxy):getRawData().level >= pg.open_systems_limited[6].level

	if not arg_14_0.isOpenRank or arg_14_0.isOpenRank ~= var_14_0 then
		local var_14_1 = 123

		setActive(arg_14_0.rankBtn, var_14_0)

		arg_14_0.memoryBtn.anchoredPosition = var_14_0 and arg_14_0.startPos or Vector3(arg_14_0.startPos.x, arg_14_0.startPos.y - var_14_1, 0)
		arg_14_0.collectionBtn.anchoredPosition = var_14_0 and Vector3(arg_14_0.startPos.x, arg_14_0.startPos.y - var_14_1, 0) or Vector3(arg_14_0.startPos.x, arg_14_0.startPos.y - 2 * var_14_1, 0)
		arg_14_0.isOpenRank = var_14_0
	end
end

function var_0_0.OnUpdatePlayer(arg_15_0)
	arg_15_0:RefreshRankBtn()
end

return var_0_0
