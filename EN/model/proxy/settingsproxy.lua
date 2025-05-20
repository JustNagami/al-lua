local var_0_0 = class("SettingsProxy", pm.Proxy)

function var_0_0.onRegister(arg_1_0)
	arg_1_0._isBgmEnble = PlayerPrefs.GetInt("ShipSkinBGM", 1) > 0
	arg_1_0._ShowBg = PlayerPrefs.GetInt("disableBG", 1) > 0
	arg_1_0._ShowLive2d = PlayerPrefs.GetInt("disableLive2d", 1) > 0
	arg_1_0._selectedShipId = PlayerPrefs.GetInt("playerShipId")
	arg_1_0._backyardFoodRemind = PlayerPrefs.GetString("backyardRemind")
	arg_1_0._userAgreement = PlayerPrefs.GetInt("userAgreement", 0)
	arg_1_0._showMaxLevelHelp = PlayerPrefs.GetInt("maxLevelHelp", 0) > 0
	arg_1_0._nextTipAutoBattleTime = PlayerPrefs.GetInt("AutoBattleTip", 0)
	arg_1_0._setFlagShip = PlayerPrefs.GetInt("setFlagShip", 0) > 0
	arg_1_0._setFlagShipForSkinAtlas = PlayerPrefs.GetInt("setFlagShipforskinatlas", 0) > 0
	arg_1_0._screenRatio = PlayerPrefs.GetFloat("SetScreenRatio", ADAPT_TARGET)
	arg_1_0.storyAutoPlayCode = PlayerPrefs.GetInt("story_autoplay_flag", 0)
	NotchAdapt.CheckNotchRatio = arg_1_0._screenRatio
	arg_1_0._nextTipActBossTime = PlayerPrefs.GetInt("ActBossTipLastTime", 0)

	if GetZeroTime() <= arg_1_0._nextTipActBossTime then
		arg_1_0.nextTipActBossExchangeTicket = PlayerPrefs.GetInt("ActBossTip", 0)
	end

	arg_1_0:resetEquipSceneIndex()

	arg_1_0._isShowCollectionHelp = PlayerPrefs.GetInt("collection_Help", 0) > 0
	arg_1_0.showMainSceneWordTip = PlayerPrefs.GetInt("main_scene_word_toggle", 1) > 0
	arg_1_0.lastRequestVersionTime = nil
	arg_1_0.worldBossFlag = {}
	arg_1_0.worldFlag = {}
end

function var_0_0.SetWorldBossFlag(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0.worldBossFlag[arg_2_1] ~= arg_2_2 then
		arg_2_0.worldBossFlag[arg_2_1] = arg_2_2

		PlayerPrefs.SetInt("worldBossFlag" .. arg_2_1, arg_2_2 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetWorldBossFlag(arg_3_0, arg_3_1)
	if not arg_3_0.worldBossFlag[arg_3_1] then
		arg_3_0.worldBossFlag[arg_3_1] = PlayerPrefs.GetInt("worldBossFlag" .. arg_3_1, 1) > 0
	end

	return arg_3_0.worldBossFlag[arg_3_1]
end

function var_0_0.SetWorldFlag(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_0.worldFlag[arg_4_1] ~= arg_4_2 then
		arg_4_0.worldFlag[arg_4_1] = arg_4_2

		PlayerPrefs.SetInt("world_flag_" .. arg_4_1, arg_4_2 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetWorldFlag(arg_5_0, arg_5_1)
	if not arg_5_0.worldFlag[arg_5_1] then
		arg_5_0.worldFlag[arg_5_1] = PlayerPrefs.GetInt("world_flag_" .. arg_5_1, 0) > 0
	end

	return arg_5_0.worldFlag[arg_5_1]
end

function var_0_0.GetDockYardLockBtnFlag(arg_6_0)
	if not arg_6_0.dockYardLockFlag then
		local var_6_0 = getProxy(PlayerProxy):getRawData().id

		arg_6_0.dockYardLockFlag = PlayerPrefs.GetInt("DockYardLockFlag" .. var_6_0, 0) > 0
	end

	return arg_6_0.dockYardLockFlag
end

function var_0_0.SetDockYardLockBtnFlag(arg_7_0, arg_7_1)
	if arg_7_0.dockYardLockFlag ~= arg_7_1 then
		local var_7_0 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt("DockYardLockFlag" .. var_7_0, arg_7_1 and 1 or 0)
		PlayerPrefs.Save()

		arg_7_0.dockYardLockFlag = arg_7_1
	end
end

function var_0_0.GetDockYardLevelBtnFlag(arg_8_0)
	if not arg_8_0.dockYardLevelFlag then
		local var_8_0 = getProxy(PlayerProxy):getRawData().id

		arg_8_0.dockYardLevelFlag = PlayerPrefs.GetInt("DockYardLevelFlag" .. var_8_0, 0) > 0
	end

	return arg_8_0.dockYardLevelFlag
end

function var_0_0.SetDockYardLevelBtnFlag(arg_9_0, arg_9_1)
	if arg_9_0.dockYardLevelFlag ~= arg_9_1 then
		local var_9_0 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt("DockYardLevelFlag" .. var_9_0, arg_9_1 and 1 or 0)
		PlayerPrefs.Save()

		arg_9_0.dockYardLevelFlag = arg_9_1
	end
end

function var_0_0.IsShowCollectionHelp(arg_10_0)
	return arg_10_0._isShowCollectionHelp
end

function var_0_0.SetCollectionHelpFlag(arg_11_0, arg_11_1)
	if arg_11_0._isShowCollectionHelp ~= arg_11_1 then
		arg_11_0._isShowCollectionHelp = arg_11_1

		PlayerPrefs.SetInt("collection_Help", arg_11_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.IsBGMEnable(arg_12_0)
	return arg_12_0._isBgmEnble
end

function var_0_0.SetBgmFlag(arg_13_0, arg_13_1)
	if arg_13_0._isBgmEnble ~= arg_13_1 then
		arg_13_0._isBgmEnble = arg_13_1

		PlayerPrefs.SetInt("ShipSkinBGM", arg_13_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.IsEnableMainMusicPlayer(arg_14_0)
	return true
end

function var_0_0.getSkinPosSetting(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1:GetRecordPosKey()
	local var_15_1 = arg_15_0:GetCurrMainUIStyleKeyForSkinShop()

	if PlayerPrefs.HasKey(var_15_1 .. tostring(var_15_0) .. "_scale") then
		local var_15_2 = PlayerPrefs.GetFloat(var_15_1 .. tostring(var_15_0) .. "_x", 0)
		local var_15_3 = PlayerPrefs.GetFloat(var_15_1 .. tostring(var_15_0) .. "_y", 0)
		local var_15_4 = PlayerPrefs.GetFloat(var_15_1 .. tostring(var_15_0) .. "_scale", 1)

		return var_15_2, var_15_3, var_15_4
	else
		return nil
	end
end

function var_0_0.setSkinPosSetting(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4)
	local var_16_0 = arg_16_1:GetRecordPosKey()
	local var_16_1 = arg_16_0:GetCurrMainUIStyleKeyForSkinShop()

	PlayerPrefs.SetFloat(var_16_1 .. tostring(var_16_0) .. "_x", arg_16_2)
	PlayerPrefs.SetFloat(var_16_1 .. tostring(var_16_0) .. "_y", arg_16_3)
	PlayerPrefs.SetFloat(var_16_1 .. tostring(var_16_0) .. "_scale", arg_16_4)
	PlayerPrefs.Save()
end

function var_0_0.setSkinScaleSetting(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	local var_17_0 = arg_17_1:GetRecordPosKey()
	local var_17_1 = tostring(var_17_0) .. arg_17_2 .. "_" .. arg_17_3 .. "_part_scale"

	PlayerPrefs.SetFloat(tostring(var_17_0) .. arg_17_2 .. "_" .. arg_17_3 .. "_part_scale", arg_17_4)
end

function var_0_0.getSkinScaleSetting(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0
	local var_18_1 = arg_18_1:GetRecordPosKey()
	local var_18_2 = tostring(var_18_1) .. arg_18_2 .. "_" .. arg_18_3 .. "_part_scale"

	if PlayerPrefs.HasKey(var_18_2) then
		var_18_0 = PlayerPrefs.GetFloat(var_18_2, 1)
	else
		return 1
	end

	return var_18_0
end

function var_0_0.GetCurrMainUIStyleKeyForSkinShop(arg_19_0)
	local var_19_0 = arg_19_0:GetMainSceneThemeStyle()

	if var_19_0 == NewMainScene.THEME_CLASSIC then
		return ""
	else
		return var_19_0
	end
end

function var_0_0.resetSkinPosSetting(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1:GetRecordPosKey()

	PlayerPrefs.DeleteKey(tostring(var_20_0) .. "_x")
	PlayerPrefs.DeleteKey(tostring(var_20_0) .. "_y")
	PlayerPrefs.DeleteKey(tostring(var_20_0) .. "_scale")
	PlayerPrefs.Save()
end

function var_0_0.getCharacterSetting(arg_21_0, arg_21_1, arg_21_2)
	return PlayerPrefs.GetInt(tostring(arg_21_1) .. "_" .. arg_21_2, 1) > 0
end

function var_0_0.setCharacterSetting(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	PlayerPrefs.SetInt(tostring(arg_22_1) .. "_" .. arg_22_2, arg_22_3 and 1 or 0)
	PlayerPrefs.Save()
end

function var_0_0.getCurrentSecretaryIndex(arg_23_0)
	local var_23_0 = PlayerPrefs.GetInt("currentSecretaryIndex", 1)

	if var_23_0 > PlayerVitaeShipsPage.GetAllUnlockSlotCnt() then
		arg_23_0:setCurrentSecretaryIndex(1)

		return 1
	else
		return PlayerVitaeShipsPage.GetSlotIndexList()[var_23_0]
	end
end

function var_0_0.rotateCurrentSecretaryIndex(arg_24_0)
	local function var_24_0()
		return getProxy(PlayerProxy):getRawData():ExistEducateChar() and getProxy(SettingsProxy):GetFlagShipDisplayMode() ~= FlAG_SHIP_DISPLAY_ONLY_SHIP
	end

	local var_24_1 = PlayerPrefs.GetInt("currentSecretaryIndex", 1)
	local var_24_2 = PlayerVitaeShipsPage.GetAllUnlockSlotCnt()
	local var_24_3 = var_24_1 + 1

	if var_24_2 < var_24_3 or var_24_3 == PlayerVitaeShipsPage.EDUCATE_CHAR_SLOT_ID and not var_24_0() then
		var_24_3 = 1
	end

	arg_24_0:setCurrentSecretaryIndex(var_24_3)
	pg.m02:sendNotification(GAME.ROTATE_PAINTING_INDEX)
end

function var_0_0.setCurrentSecretaryIndex(arg_26_0, arg_26_1)
	PlayerPrefs.SetInt("currentSecretaryIndex", arg_26_1)
	PlayerPrefs.Save()
end

function var_0_0.SetFlagShip(arg_27_0, arg_27_1)
	if arg_27_0._setFlagShip ~= arg_27_1 then
		arg_27_0._setFlagShip = arg_27_1

		PlayerPrefs.SetInt("setFlagShip", arg_27_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetSetFlagShip(arg_28_0)
	return arg_28_0._setFlagShip
end

function var_0_0.SetFlagShipForSkinAtlas(arg_29_0, arg_29_1)
	if arg_29_0._setFlagShipForSkinAtlas ~= arg_29_1 then
		arg_29_0._setFlagShipForSkinAtlas = arg_29_1

		PlayerPrefs.SetInt("setFlagShipforskinatlas", arg_29_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetSetFlagShipForSkinAtlas(arg_30_0)
	return arg_30_0._setFlagShipForSkinAtlas
end

function var_0_0.CheckNeedUserAgreement(arg_31_0)
	if PLATFORM_CODE == PLATFORM_KR then
		return false
	elseif PLATFORM_CODE == PLATFORM_CH then
		return false
	elseif PLATFORM_CODE == PLATFORM_JP then
		return false
	else
		return arg_31_0:GetUserAgreementFlag() > arg_31_0._userAgreement
	end
end

function var_0_0.GetUserAgreementFlag(arg_32_0)
	local var_32_0 = USER_AGREEMENT_FLAG_DEFAULT

	if PLATFORM_CODE == PLATFORM_CHT then
		var_32_0 = USER_AGREEMENT_FLAG_TW
	end

	return var_32_0
end

function var_0_0.SetUserAgreement(arg_33_0)
	if arg_33_0:CheckNeedUserAgreement() then
		local var_33_0 = arg_33_0:GetUserAgreementFlag()

		PlayerPrefs.SetInt("userAgreement", var_33_0)
		PlayerPrefs.Save()

		arg_33_0._userAgreement = var_33_0
	end
end

function var_0_0.IsLive2dEnable(arg_34_0)
	return arg_34_0._ShowLive2d
end

function var_0_0.IsBGEnable(arg_35_0)
	return arg_35_0._ShowBg
end

function var_0_0.SetSelectedShipId(arg_36_0, arg_36_1)
	if arg_36_0._selectedShipId ~= arg_36_1 then
		arg_36_0._selectedShipId = arg_36_1

		PlayerPrefs.SetInt("playerShipId", arg_36_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetSelectedShipId(arg_37_0)
	return arg_37_0._selectedShipId
end

function var_0_0.setEquipSceneIndex(arg_38_0, arg_38_1)
	arg_38_0._equipSceneIndex = arg_38_1
end

function var_0_0.getEquipSceneIndex(arg_39_0)
	return arg_39_0._equipSceneIndex
end

function var_0_0.resetEquipSceneIndex(arg_40_0)
	arg_40_0._equipSceneIndex = StoreHouseConst.WARP_TO_MATERIAL
end

function var_0_0.setActivityLayerIndex(arg_41_0, arg_41_1)
	arg_41_0._activityLayerIndex = arg_41_1
end

function var_0_0.getActivityLayerIndex(arg_42_0)
	return arg_42_0._activityLayerIndex
end

function var_0_0.resetActivityLayerIndex(arg_43_0)
	arg_43_0._activityLayerIndex = 1
end

function var_0_0.setBackyardRemind(arg_44_0)
	local var_44_0 = GetZeroTime()

	if arg_44_0._backyardFoodRemind ~= tostring(var_44_0) then
		PlayerPrefs.SetString("backyardRemind", var_44_0)
		PlayerPrefs.Save()

		arg_44_0._backyardFoodRemind = var_44_0
	end
end

function var_0_0.getBackyardRemind(arg_45_0)
	if not arg_45_0._backyardFoodRemind or arg_45_0._backyardFoodRemind == "" then
		return 0
	else
		return tonumber(arg_45_0._backyardFoodRemind)
	end
end

function var_0_0.getMaxLevelHelp(arg_46_0)
	return arg_46_0._showMaxLevelHelp
end

function var_0_0.setMaxLevelHelp(arg_47_0, arg_47_1)
	if arg_47_0._showMaxLevelHelp ~= arg_47_1 then
		arg_47_0._showMaxLevelHelp = arg_47_1

		PlayerPrefs.SetInt("maxLevelHelp", arg_47_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.setStopBuildSpeedupRemind(arg_48_0)
	arg_48_0.isStopBuildSpeedupReamind = true
end

function var_0_0.getStopBuildSpeedupRemind(arg_49_0)
	return arg_49_0.isStopBuildSpeedupReamind
end

function var_0_0.checkReadHelp(arg_50_0, arg_50_1)
	if not getProxy(PlayerProxy):getData() then
		return true
	end

	if arg_50_1 == "help_backyard" then
		return true
	elseif pg.SeriesGuideMgr.GetInstance():isEnd() then
		local var_50_0 = PlayerPrefs.GetInt(arg_50_1, 0)

		return PlayerPrefs.GetInt(arg_50_1, 0) > 0
	end

	return true
end

function var_0_0.recordReadHelp(arg_51_0, arg_51_1)
	PlayerPrefs.SetInt(arg_51_1, 1)
	PlayerPrefs.Save()
end

function var_0_0.clearAllReadHelp(arg_52_0)
	PlayerPrefs.DeleteKey("tactics_lesson_system_introduce")
	PlayerPrefs.DeleteKey("help_shipinfo_equip")
	PlayerPrefs.DeleteKey("help_shipinfo_detail")
	PlayerPrefs.DeleteKey("help_shipinfo_intensify")
	PlayerPrefs.DeleteKey("help_shipinfo_upgrate")
	PlayerPrefs.DeleteKey("help_backyard")
	PlayerPrefs.DeleteKey("has_entered_class")
	PlayerPrefs.DeleteKey("help_commander_info")
	PlayerPrefs.DeleteKey("help_commander_play")
	PlayerPrefs.DeleteKey("help_commander_ability")
end

function var_0_0.setAutoBattleTip(arg_53_0)
	local var_53_0 = GetZeroTime()

	arg_53_0._nextTipAutoBattleTime = var_53_0

	PlayerPrefs.SetInt("AutoBattleTip", var_53_0)
	PlayerPrefs.Save()
end

function var_0_0.isTipAutoBattle(arg_54_0)
	return pg.TimeMgr.GetInstance():GetServerTime() > arg_54_0._nextTipAutoBattleTime
end

function var_0_0.setActBossExchangeTicketTip(arg_55_0, arg_55_1)
	if arg_55_0.nextTipActBossExchangeTicket == arg_55_1 then
		return
	end

	arg_55_0.nextTipActBossExchangeTicket = arg_55_1

	local var_55_0 = GetZeroTime()

	if var_55_0 > arg_55_0._nextTipActBossTime then
		arg_55_0._nextTipActBossTime = var_55_0

		PlayerPrefs.SetInt("ActBossTipLastTime", var_55_0)
	end

	PlayerPrefs.SetInt("ActBossTip", arg_55_1)
	PlayerPrefs.Save()
end

function var_0_0.isTipActBossExchangeTicket(arg_56_0)
	if pg.TimeMgr.GetInstance():GetServerTime() > arg_56_0._nextTipActBossTime then
		return nil
	end

	return arg_56_0.nextTipActBossExchangeTicket
end

function var_0_0.SetScreenRatio(arg_57_0, arg_57_1)
	if arg_57_0._screenRatio ~= arg_57_1 then
		arg_57_0._screenRatio = arg_57_1

		PlayerPrefs.SetFloat("SetScreenRatio", arg_57_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetScreenRatio(arg_58_0)
	return arg_58_0._screenRatio
end

function var_0_0.CheckLargeScreen(arg_59_0)
	return Screen.width / Screen.height > 2
end

function var_0_0.IsShowBeatMonseterNianCurtain(arg_60_0)
	local var_60_0 = getProxy(PlayerProxy):getRawData()

	return pg.TimeMgr.GetInstance():GetServerTime() > tonumber(PlayerPrefs.GetString("HitMonsterNianLayer2020" .. var_60_0.id, "0"))
end

function var_0_0.SetBeatMonseterNianFlag(arg_61_0)
	local var_61_0 = getProxy(PlayerProxy):getRawData()

	PlayerPrefs.SetString("HitMonsterNianLayer2020" .. var_61_0.id, GetZeroTime())
	PlayerPrefs.Save()
end

function var_0_0.ShouldShowEventActHelp(arg_62_0)
	if not arg_62_0.actEventFlag then
		local var_62_0 = getProxy(PlayerProxy):getRawData().id

		arg_62_0.actEventFlag = PlayerPrefs.GetInt("event_act_help1" .. var_62_0, 0) > 0
	end

	return not arg_62_0.actEventFlag
end

function var_0_0.MarkEventActHelpFlag(arg_63_0)
	if not arg_63_0.actEventFlag then
		arg_63_0.actEventFlag = true

		local var_63_0 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt("event_act_help1" .. var_63_0, 1)
		PlayerPrefs.Save()
	end
end

function var_0_0.SetStorySpeed(arg_64_0, arg_64_1)
	arg_64_0.storySpeed = arg_64_1

	local var_64_0

	if getProxy(PlayerProxy) then
		var_64_0 = getProxy(PlayerProxy):getRawData().id
	else
		var_64_0 = 1
	end

	PlayerPrefs.SetInt("story_speed_flag" .. var_64_0, arg_64_1)
	PlayerPrefs.Save()
end

function var_0_0.GetStorySpeed(arg_65_0)
	if not arg_65_0.storySpeed then
		local var_65_0

		if getProxy(PlayerProxy) then
			var_65_0 = getProxy(PlayerProxy):getRawData().id
		else
			var_65_0 = 1
		end

		arg_65_0.storySpeed = PlayerPrefs.GetInt("story_speed_flag" .. var_65_0, 0)
	end

	return arg_65_0.storySpeed
end

function var_0_0.GetStoryAutoPlayFlag(arg_66_0)
	return arg_66_0.storyAutoPlayCode > 0
end

function var_0_0.SetStoryAutoPlayFlag(arg_67_0, arg_67_1)
	if arg_67_0.storyAutoPlayCode ~= arg_67_1 then
		PlayerPrefs.SetInt("story_autoplay_flag", arg_67_1)
		PlayerPrefs.Save()

		arg_67_0.storyAutoPlayCode = arg_67_1
	end
end

function var_0_0.GetPaintingDownloadPrefs(arg_68_0)
	return PlayerPrefs.GetInt("Painting_Download_Prefs", 0)
end

function var_0_0.SetPaintingDownloadPrefs(arg_69_0, arg_69_1)
	PlayerPrefs.SetInt("Painting_Download_Prefs", arg_69_1)
end

function var_0_0.ShouldShipMainSceneWord(arg_70_0)
	return arg_70_0.showMainSceneWordTip
end

function var_0_0.SaveMainSceneWordFlag(arg_71_0, arg_71_1)
	if arg_71_0.showMainSceneWordTip ~= arg_71_1 then
		arg_71_0.showMainSceneWordTip = arg_71_1

		PlayerPrefs.SetInt("main_scene_word_toggle", arg_71_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.RecordFrameRate(arg_72_0)
	if not arg_72_0.originalFrameRate then
		arg_72_0.originalFrameRate = Application.targetFrameRate
	end
end

function var_0_0.RestoreFrameRate(arg_73_0)
	if arg_73_0.originalFrameRate then
		Application.targetFrameRate = arg_73_0.originalFrameRate
		arg_73_0.originalFrameRate = nil
	end
end

function var_0_0.ResetTimeLimitSkinShopTip(arg_74_0)
	arg_74_0.isTipLimitSkinShop = PlayerPrefs.GetInt("tipLimitSkinShopTime_", 0) <= pg.TimeMgr.GetInstance():GetServerTime()

	if arg_74_0.isTipLimitSkinShop then
		arg_74_0.nextTipLimitSkinShopTime = GetZeroTime()
	end
end

function var_0_0.ShouldTipTimeLimitSkinShop(arg_75_0)
	return arg_75_0.isTipLimitSkinShop
end

function var_0_0.SetNextTipTimeLimitSkinShop(arg_76_0)
	if arg_76_0.isTipLimitSkinShop and arg_76_0.nextTipLimitSkinShopTime then
		PlayerPrefs.SetInt("tipLimitSkinShopTime_", arg_76_0.nextTipLimitSkinShopTime)
		PlayerPrefs.Save()

		arg_76_0.nextTipLimitSkinShopTime = nil
		arg_76_0.isTipLimitSkinShop = false
	end
end

function var_0_0.WorldBossProgressTipFlag(arg_77_0, arg_77_1)
	if arg_77_0.WorldBossProgressTipValue ~= arg_77_1 then
		arg_77_0.WorldBossProgressTipValue = arg_77_1

		PlayerPrefs.SetString("_WorldBossProgressTipFlag_", arg_77_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetWorldBossProgressTipFlag(arg_78_0)
	if not arg_78_0.WorldBossProgressTipValue then
		local var_78_0 = pg.gameset.joint_boss_ticket.description
		local var_78_1 = var_78_0[1] + var_78_0[2]
		local var_78_2 = var_78_0[1] .. "&" .. var_78_1
		local var_78_3 = PlayerPrefs.GetString("_WorldBossProgressTipFlag_", var_78_2)

		arg_78_0.WorldBossProgressTipValue = var_78_3

		return var_78_3
	else
		return arg_78_0.WorldBossProgressTipValue
	end
end

function var_0_0.GetWorldBossProgressTipTable(arg_79_0)
	local var_79_0 = arg_79_0:GetWorldBossProgressTipFlag()

	if not var_79_0 or var_79_0 == "" then
		return {}
	end

	return string.split(var_79_0, "&")
end

function var_0_0.GetChatFlag(arg_80_0)
	if not arg_80_0.chatFlag then
		local var_80_0 = {
			ChatConst.ChannelWorld,
			ChatConst.ChannelPublic,
			ChatConst.ChannelFriend
		}

		if getProxy(GuildProxy):getRawData() then
			table.insert(var_80_0, ChatConst.ChannelGuild)
		end

		arg_80_0.chatFlag = PlayerPrefs.GetInt("chat__setting", IndexConst.Flags2Bits(var_80_0))
	end

	return arg_80_0.chatFlag
end

function var_0_0.SetChatFlag(arg_81_0, arg_81_1)
	if arg_81_0.chatFlag ~= arg_81_1 then
		arg_81_0.chatFlag = arg_81_1

		PlayerPrefs.SetInt("chat__setting", arg_81_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.IsShowActivityMapSPTip()
	local var_82_0 = getProxy(PlayerProxy):getRawData()

	return pg.TimeMgr.GetInstance():GetServerTime() > PlayerPrefs.GetInt("ActivityMapSPTip" .. var_82_0.id, 0)
end

function var_0_0.SetActivityMapSPTip()
	local var_83_0 = getProxy(PlayerProxy):getRawData()

	PlayerPrefs.SetInt("ActivityMapSPTip" .. var_83_0.id, GetZeroTime())
	PlayerPrefs.Save()
end

function var_0_0.IsTipNewTheme(arg_84_0)
	local var_84_0 = pg.backyard_theme_template
	local var_84_1 = var_84_0.all[#var_84_0.all]
	local var_84_2 = var_84_0[var_84_1].ids[1]
	local var_84_3 = pg.furniture_shop_template[var_84_2]
	local var_84_4 = getProxy(PlayerProxy):getRawData().id
	local var_84_5 = PlayerPrefs.GetInt(var_84_4 .. "IsTipNewTheme" .. var_84_1, 0) == 0

	if var_84_3 and var_84_3.new == 1 and pg.TimeMgr.GetInstance():inTime(var_84_3.time) and var_84_5 then
		arg_84_0.lastThemeId = var_84_1
	else
		arg_84_0.lastThemeId = nil
	end

	return arg_84_0.lastThemeId ~= nil
end

function var_0_0.UpdateNewThemeValue(arg_85_0)
	if arg_85_0.lastThemeId then
		local var_85_0 = arg_85_0.lastThemeId
		local var_85_1 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt(var_85_1 .. "IsTipNewTheme" .. var_85_0, 1)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetNewGemFurnitureLocalCache(arg_86_0)
	if not arg_86_0.cacheGemFuruitures then
		arg_86_0.cacheGemFuruitures = {}

		local var_86_0 = getProxy(PlayerProxy):getRawData().id
		local var_86_1 = PlayerPrefs.GetString(var_86_0 .. "IsTipNewGenFurniture")

		if var_86_1 ~= "" then
			local var_86_2 = string.split(var_86_1, "#")

			for iter_86_0, iter_86_1 in ipairs(var_86_2) do
				arg_86_0.cacheGemFuruitures[tonumber(iter_86_1)] = true
			end
		end
	end

	return arg_86_0.cacheGemFuruitures
end

function var_0_0.IsTipNewGemFurniture(arg_87_0)
	local var_87_0 = arg_87_0:GetNewGemFurnitureLocalCache()
	local var_87_1 = getProxy(DormProxy):GetTag7Furnitures()

	if _.any(var_87_1, function(arg_88_0)
		return pg.furniture_shop_template[arg_88_0].new == 1 and not var_87_0[arg_88_0]
	end) then
		arg_87_0.newGemFurniture = var_87_1
	else
		arg_87_0.newGemFurniture = nil
	end

	return arg_87_0.newGemFurniture ~= nil
end

function var_0_0.UpdateNewGemFurnitureValue(arg_89_0)
	if arg_89_0.newGemFurniture then
		for iter_89_0, iter_89_1 in pairs(arg_89_0.newGemFurniture) do
			arg_89_0.cacheGemFuruitures[iter_89_1] = true
		end

		local var_89_0 = table.concat(arg_89_0.newGemFurniture, "#")
		local var_89_1 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetString(var_89_1 .. "IsTipNewGenFurniture", var_89_0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetRandomFlagShipList(arg_90_0)
	if arg_90_0.randomFlagShipList then
		return arg_90_0.randomFlagShipList
	end

	local var_90_0 = getProxy(PlayerProxy):getRawData().id
	local var_90_1 = PlayerPrefs.GetString("RandomFlagShipList" .. var_90_0, "")
	local var_90_2 = string.split(var_90_1, "#")

	arg_90_0.randomFlagShipList = _.map(var_90_2, function(arg_91_0)
		return tonumber(arg_91_0)
	end)

	return arg_90_0.randomFlagShipList
end

function var_0_0.IsRandomFlagShip(arg_92_0, arg_92_1)
	if not arg_92_0.randomFlagShipMap then
		arg_92_0.randomFlagShipMap = {}

		for iter_92_0, iter_92_1 in ipairs(arg_92_0:GetRandomFlagShipList()) do
			arg_92_0.randomFlagShipMap[iter_92_1] = true
		end
	end

	return arg_92_0.randomFlagShipMap[arg_92_1] == true
end

function var_0_0.IsOpenRandomFlagShip(arg_93_0)
	local var_93_0 = arg_93_0:GetRandomFlagShipList()
	local var_93_1 = getProxy(BayProxy)

	return #var_93_0 > 0 and _.any(var_93_0, function(arg_94_0)
		return var_93_1:RawGetShipById(arg_94_0) ~= nil
	end)
end

function var_0_0.UpdateRandomFlagShipList(arg_95_0, arg_95_1)
	arg_95_0.randomFlagShipMap = nil
	arg_95_0.randomFlagShipList = arg_95_1

	local var_95_0 = table.concat(arg_95_1, "#")
	local var_95_1 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetString("RandomFlagShipList" .. var_95_1, var_95_0)
	PlayerPrefs.Save()
end

function var_0_0.GetPrevRandomFlagShipTime(arg_96_0)
	if arg_96_0.prevRandomFlagShipTime then
		return arg_96_0.prevRandomFlagShipTime
	end

	local var_96_0 = getProxy(PlayerProxy):getRawData().id

	arg_96_0.prevRandomFlagShipTime = PlayerPrefs.GetInt("RandomFlagShipTime" .. var_96_0, 0)

	return arg_96_0.prevRandomFlagShipTime
end

function var_0_0.SetPrevRandomFlagShipTime(arg_97_0, arg_97_1)
	if arg_97_0.prevRandomFlagShipTime == arg_97_1 then
		return
	end

	arg_97_0.prevRandomFlagShipTime = arg_97_1

	local var_97_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("RandomFlagShipTime" .. var_97_0, arg_97_1)
	PlayerPrefs.Save()
end

function var_0_0.GetFlagShipDisplayMode(arg_98_0)
	if not arg_98_0.flagShipDisplayMode then
		local var_98_0 = getProxy(PlayerProxy):getRawData().id

		arg_98_0.flagShipDisplayMode = PlayerPrefs.GetInt("flag-ship-display-mode" .. var_98_0, FlAG_SHIP_DISPLAY_ALL)
	end

	return arg_98_0.flagShipDisplayMode
end

function var_0_0.SetFlagShipDisplayMode(arg_99_0, arg_99_1)
	if arg_99_0.flagShipDisplayMode ~= arg_99_1 then
		arg_99_0.flagShipDisplayMode = arg_99_1

		local var_99_0 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt("flag-ship-display-mode" .. var_99_0, arg_99_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.RecordContinuousOperationAutoSubStatus(arg_100_0, arg_100_1)
	if arg_100_1 then
		return
	end

	local var_100_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("AutoBotCOFlag" .. var_100_0, 1)
	PlayerPrefs.Save()
end

function var_0_0.ResetContinuousOperationAutoSub(arg_101_0)
	local var_101_0 = getProxy(PlayerProxy):getRawData().id

	if PlayerPrefs.GetInt("AutoBotCOFlag" .. var_101_0, 0) == 0 then
		return
	end

	pg.m02:sendNotification(GAME.AUTO_SUB, {
		isActiveSub = true,
		system = SYSTEM_ACT_BOSS
	})
	PlayerPrefs.SetInt("AutoBotCOFlag" .. var_101_0, 0)
	PlayerPrefs.Save()
end

function var_0_0.SetWorkbenchDailyTip(arg_102_0)
	local var_102_0 = getProxy(PlayerProxy):getRawData().id
	local var_102_1 = GetZeroTime()

	PlayerPrefs.SetInt("WorkbenchDailyTip" .. var_102_0, var_102_1)
	PlayerPrefs.Save()
end

function var_0_0.IsTipWorkbenchDaily(arg_103_0)
	local var_103_0 = getProxy(PlayerProxy):getRawData().id

	return pg.TimeMgr.GetInstance():GetServerTime() > PlayerPrefs.GetInt("WorkbenchDailyTip" .. var_103_0, 0)
end

function var_0_0.IsDisplayResultPainting(arg_104_0)
	local var_104_0 = PlayerPrefs.HasKey(BATTLERESULT_SKIP_DISPAY_PAINTING)
	local var_104_1 = false

	if var_104_0 then
		var_104_1 = PlayerPrefs.GetInt(BATTLERESULT_SKIP_DISPAY_PAINTING) <= 0

		PlayerPrefs.DeleteKey(BATTLERESULT_SKIP_DISPAY_PAINTING)
		PlayerPrefs.SetInt(BATTLERESULT_DISPAY_PAINTING, var_104_1 and 1 or 0)
		PlayerPrefs.Save()
	else
		var_104_1 = PlayerPrefs.GetInt(BATTLERESULT_DISPAY_PAINTING, 0) >= 1
	end

	return var_104_1
end

function var_0_0.IsDisplayCommanderCatCustomName(arg_105_0)
	if not arg_105_0.customFlag then
		local var_105_0 = getProxy(PlayerProxy):getRawData().id

		arg_105_0.customFlag = PlayerPrefs.GetInt("DisplayCommanderCatCustomName" .. var_105_0, 0) == 0
	end

	return arg_105_0.customFlag
end

function var_0_0.SetDisplayCommanderCatCustomName(arg_106_0, arg_106_1)
	if arg_106_1 == arg_106_0.customFlag then
		return
	end

	arg_106_0.customFlag = arg_106_1

	local var_106_0 = arg_106_0.customFlag and 0 or 1
	local var_106_1 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("DisplayCommanderCatCustomName" .. var_106_1, var_106_0)
	PlayerPrefs.Save()
end

function var_0_0.GetCommanderQuicklyToolRarityConfig(arg_107_0)
	if not arg_107_0.quicklyToolRarityConfig then
		local var_107_0 = getProxy(PlayerProxy):getRawData().id
		local var_107_1 = PlayerPrefs.GetString("CommanderQuicklyToolRarityConfig" .. var_107_0, "1#1#1")
		local var_107_2 = string.split(var_107_1, "#")

		arg_107_0.quicklyToolRarityConfig = _.map(var_107_2, function(arg_108_0)
			return tonumber(arg_108_0) == 1
		end)
	end

	return arg_107_0.quicklyToolRarityConfig
end

function var_0_0.SaveCommanderQuicklyToolRarityConfig(arg_109_0, arg_109_1)
	local var_109_0 = false

	for iter_109_0, iter_109_1 in ipairs(arg_109_0.quicklyToolRarityConfig) do
		if arg_109_1[iter_109_0] ~= iter_109_1 then
			var_109_0 = true

			break
		end
	end

	if var_109_0 then
		arg_109_0.quicklyToolRarityConfig = arg_109_1

		local var_109_1 = _.map(arg_109_0.quicklyToolRarityConfig, function(arg_110_0)
			return arg_110_0 and "1" or "0"
		end)
		local var_109_2 = table.concat(var_109_1, "#")
		local var_109_3 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetString("CommanderQuicklyToolRarityConfig" .. var_109_3, var_109_2)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetCommanderLockFlagRarityConfig(arg_111_0)
	if not arg_111_0.lockFlagRarityConfig then
		local var_111_0 = getProxy(PlayerProxy):getRawData().id
		local var_111_1 = PlayerPrefs.GetString("CommanderLockFlagRarityConfig_" .. var_111_0, "1#0#0")
		local var_111_2 = string.split(var_111_1, "#")

		arg_111_0.lockFlagRarityConfig = _.map(var_111_2, function(arg_112_0)
			return tonumber(arg_112_0) == 1
		end)
	end

	return arg_111_0.lockFlagRarityConfig
end

function var_0_0.SaveCommanderLockFlagRarityConfig(arg_113_0, arg_113_1)
	local var_113_0 = false

	for iter_113_0, iter_113_1 in ipairs(arg_113_0.lockFlagRarityConfig) do
		if arg_113_1[iter_113_0] ~= iter_113_1 then
			var_113_0 = true

			break
		end
	end

	if var_113_0 then
		arg_113_0.lockFlagRarityConfig = arg_113_1

		local var_113_1 = _.map(arg_113_0.lockFlagRarityConfig, function(arg_114_0)
			return arg_114_0 and "1" or "0"
		end)
		local var_113_2 = table.concat(var_113_1, "#")
		local var_113_3 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetString("CommanderLockFlagRarityConfig_" .. var_113_3, var_113_2)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetCommanderLockFlagTalentConfig(arg_115_0)
	if not arg_115_0.lockFlagTalentConfig then
		local var_115_0 = getProxy(PlayerProxy):getRawData().id
		local var_115_1 = PlayerPrefs.GetString("CommanderLockFlagTalentConfig" .. var_115_0, "")
		local var_115_2 = {}

		if var_115_1 == "" then
			for iter_115_0, iter_115_1 in ipairs(CommanderCatUtil.GetAllTalentNames()) do
				var_115_2[iter_115_1.id] = true
			end
		else
			for iter_115_2, iter_115_3 in ipairs(string.split(var_115_1, "#")) do
				local var_115_3 = string.split(iter_115_3, "*")

				if #var_115_3 == 2 then
					var_115_2[tonumber(var_115_3[1])] = tonumber(var_115_3[2]) == 1
				end
			end
		end

		arg_115_0.lockFlagTalentConfig = var_115_2
	end

	return arg_115_0.lockFlagTalentConfig
end

function var_0_0.SaveCommanderLockFlagTalentConfig(arg_116_0, arg_116_1)
	arg_116_0.lockFlagTalentConfig = arg_116_1

	local var_116_0 = {}

	for iter_116_0, iter_116_1 in pairs(arg_116_1) do
		table.insert(var_116_0, iter_116_0 .. "*" .. (iter_116_1 and "1" or "0"))
	end

	local var_116_1 = table.concat(var_116_0, "#")
	local var_116_2 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetString("CommanderLockFlagTalentConfig" .. var_116_2, var_116_1)
	PlayerPrefs.Save()
end

function var_0_0.GetMainPaintingVariantFlag(arg_117_0, arg_117_1)
	if not arg_117_0.mainPaintingVariantFlag then
		arg_117_0.mainPaintingVariantFlag = {}
	end

	if not arg_117_0.mainPaintingVariantFlag[arg_117_1] then
		local var_117_0 = getProxy(PlayerProxy):getRawData().id
		local var_117_1 = PlayerPrefs.GetInt(arg_117_1 .. "_mainMeshImagePainting_ex_" .. var_117_0, 0)

		arg_117_0.mainPaintingVariantFlag[arg_117_1] = var_117_1
	end

	return arg_117_0.mainPaintingVariantFlag[arg_117_1]
end

function var_0_0.SwitchMainPaintingVariantFlag(arg_118_0, arg_118_1)
	local var_118_0 = 1 - arg_118_0:GetMainPaintingVariantFlag(arg_118_1)

	arg_118_0.mainPaintingVariantFlag[arg_118_1] = var_118_0

	local var_118_1 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(arg_118_1 .. "_mainMeshImagePainting_ex_" .. var_118_1, var_118_0)
	PlayerPrefs.Save()
end

function var_0_0.IsTipDay(arg_119_0, arg_119_1, arg_119_2, arg_119_3)
	local var_119_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt(var_119_0 .. "educate_char_" .. arg_119_1 .. arg_119_2 .. arg_119_3, 0) == 1
end

function var_0_0.RecordTipDay(arg_120_0, arg_120_1, arg_120_2, arg_120_3)
	local var_120_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_120_0 .. "educate_char_" .. arg_120_1 .. arg_120_2 .. arg_120_3, 1)
	PlayerPrefs.Save()
end

function var_0_0.UpdateEducateCharTip(arg_121_0, arg_121_1)
	local var_121_0 = getProxy(PlayerProxy):getRawData().id
	local var_121_1 = NewEducateHelper.GetAllUnlockSecretaryIds()
	local var_121_2 = {}

	for iter_121_0, iter_121_1 in ipairs(arg_121_1 or {}) do
		var_121_2[iter_121_1] = true
	end

	for iter_121_2, iter_121_3 in ipairs(var_121_1 or {}) do
		local var_121_3 = var_121_0 .. "educate_char_tip" .. iter_121_3

		if var_121_2[iter_121_3] ~= true then
			PlayerPrefs.SetInt(var_121_3, 1)
			PlayerPrefs.Save()
		end
	end

	arg_121_0:RefillEducateCharTipList()
end

function var_0_0.RefillEducateCharTipList(arg_122_0)
	local var_122_0 = getProxy(PlayerProxy):getRawData().id

	arg_122_0.educateCharTipList = {}

	if LOCK_EDUCATE_SYSTEM then
		return
	end

	local var_122_1 = NewEducateHelper.GetAllUnlockSecretaryIds()

	for iter_122_0, iter_122_1 in ipairs(var_122_1 or {}) do
		if PlayerPrefs.GetInt(var_122_0 .. "educate_char_tip" .. iter_122_1, 0) == 1 then
			table.insert(arg_122_0.educateCharTipList, iter_122_1)
		end
	end
end

function var_0_0.ShouldEducateCharTip(arg_123_0)
	if NewEducateHelper.GetEducateCharSlotMaxCnt() == 0 then
		return false
	end

	if not arg_123_0.educateCharTipList or #arg_123_0.educateCharTipList == 0 then
		arg_123_0:RefillEducateCharTipList()
	end

	return _.any(arg_123_0.educateCharTipList, function(arg_124_0)
		return NewEducateHelper.IsUnlockDefaultShip(arg_124_0)
	end)
end

function var_0_0._ShouldEducateCharTip(arg_125_0, arg_125_1)
	if not arg_125_0.educateCharTipList or #arg_125_0.educateCharTipList == 0 then
		arg_125_0:RefillEducateCharTipList()
	end

	if table.contains(arg_125_0.educateCharTipList, arg_125_1) and NewEducateHelper.IsUnlockDefaultShip(arg_125_1) then
		return true
	end

	return false
end

function var_0_0.ClearEducateCharTip(arg_126_0, arg_126_1)
	if not arg_126_0:_ShouldEducateCharTip(arg_126_1) then
		return false
	end

	table.removebyvalue(arg_126_0.educateCharTipList, arg_126_1)

	local var_126_0 = getProxy(PlayerProxy):getRawData().id .. "educate_char_tip" .. arg_126_1

	if PlayerPrefs.HasKey(var_126_0) then
		PlayerPrefs.DeleteKey(var_126_0)
		PlayerPrefs.Save()
	end

	pg.m02:sendNotification(GAME.CLEAR_EDUCATE_TIP, {
		id = arg_126_1
	})

	return true
end

function var_0_0.GetMainSceneThemeStyle(arg_127_0)
	if PlayerPrefs.GetInt(USAGE_NEW_MAINUI, 1) == 1 then
		return NewMainScene.THEME_MELLOW
	else
		return NewMainScene.THEME_CLASSIC
	end
end

function var_0_0.IsMellowStyle(arg_128_0)
	local var_128_0 = arg_128_0:GetMainSceneThemeStyle()

	return NewMainScene.THEME_MELLOW == var_128_0
end

function var_0_0.GetMainSceneScreenSleepTime(arg_129_0)
	if pg.NewGuideMgr.GetInstance():IsBusy() then
		return SleepTimeout.SystemSetting
	end

	local var_129_0 = pg.settings_other_template[20].name

	if PlayerPrefs.GetInt(var_129_0, 1) == 1 then
		return SleepTimeout.NeverSleep
	else
		return SleepTimeout.SystemSetting
	end
end

function var_0_0.ShowL2dResetInMainScene(arg_130_0)
	local var_130_0 = pg.settings_other_template[21].name

	return PlayerPrefs.GetInt(var_130_0, 0) == 1
end

function var_0_0.Reset(arg_131_0)
	arg_131_0:resetEquipSceneIndex()
	arg_131_0:resetActivityLayerIndex()

	arg_131_0.isStopBuildSpeedupReamind = false

	arg_131_0:RestoreFrameRate()

	arg_131_0.randomFlagShipList = nil
	arg_131_0.prevRandomFlagShipTime = nil
	arg_131_0.randomFlagShipMap = nil
	arg_131_0.educateCharTipList = {}
end

return var_0_0
