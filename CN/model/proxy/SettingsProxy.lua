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

function var_0_0.getSkinPosSetting(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1:GetRecordPosKey()

	if PlayerPrefs.HasKey(tostring(var_14_0) .. "_scale") then
		local var_14_1 = PlayerPrefs.GetFloat(tostring(var_14_0) .. "_x", 0)
		local var_14_2 = PlayerPrefs.GetFloat(tostring(var_14_0) .. "_y", 0)
		local var_14_3 = PlayerPrefs.GetFloat(tostring(var_14_0) .. "_scale", 1)

		return var_14_1, var_14_2, var_14_3
	else
		return nil
	end
end

function var_0_0.setSkinPosSetting(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
	local var_15_0 = arg_15_1:GetRecordPosKey()

	PlayerPrefs.SetFloat(tostring(var_15_0) .. "_x", arg_15_2)
	PlayerPrefs.SetFloat(tostring(var_15_0) .. "_y", arg_15_3)
	PlayerPrefs.SetFloat(tostring(var_15_0) .. "_scale", arg_15_4)
	PlayerPrefs.Save()
end

function var_0_0.resetSkinPosSetting(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1:GetRecordPosKey()

	PlayerPrefs.DeleteKey(tostring(var_16_0) .. "_x")
	PlayerPrefs.DeleteKey(tostring(var_16_0) .. "_y")
	PlayerPrefs.DeleteKey(tostring(var_16_0) .. "_scale")
	PlayerPrefs.Save()
end

function var_0_0.getCharacterSetting(arg_17_0, arg_17_1, arg_17_2)
	return PlayerPrefs.GetInt(tostring(arg_17_1) .. "_" .. arg_17_2, 1) > 0
end

function var_0_0.setCharacterSetting(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	PlayerPrefs.SetInt(tostring(arg_18_1) .. "_" .. arg_18_2, arg_18_3 and 1 or 0)
	PlayerPrefs.Save()
end

function var_0_0.getCurrentSecretaryIndex(arg_19_0)
	local var_19_0 = PlayerPrefs.GetInt("currentSecretaryIndex", 1)

	if var_19_0 > PlayerVitaeShipsPage.GetAllUnlockSlotCnt() then
		arg_19_0:setCurrentSecretaryIndex(1)

		return 1
	else
		return PlayerVitaeShipsPage.GetSlotIndexList()[var_19_0]
	end
end

function var_0_0.rotateCurrentSecretaryIndex(arg_20_0)
	local function var_20_0()
		return getProxy(PlayerProxy):getRawData():ExistEducateChar() and getProxy(SettingsProxy):GetFlagShipDisplayMode() ~= FlAG_SHIP_DISPLAY_ONLY_SHIP
	end

	local var_20_1 = PlayerPrefs.GetInt("currentSecretaryIndex", 1)
	local var_20_2 = PlayerVitaeShipsPage.GetAllUnlockSlotCnt()
	local var_20_3 = var_20_1 + 1

	if var_20_2 < var_20_3 or var_20_3 == PlayerVitaeShipsPage.EDUCATE_CHAR_SLOT_ID and not var_20_0() then
		var_20_3 = 1
	end

	arg_20_0:setCurrentSecretaryIndex(var_20_3)
end

function var_0_0.setCurrentSecretaryIndex(arg_22_0, arg_22_1)
	PlayerPrefs.SetInt("currentSecretaryIndex", arg_22_1)
	PlayerPrefs.Save()
end

function var_0_0.SetFlagShip(arg_23_0, arg_23_1)
	if arg_23_0._setFlagShip ~= arg_23_1 then
		arg_23_0._setFlagShip = arg_23_1

		PlayerPrefs.SetInt("setFlagShip", arg_23_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetSetFlagShip(arg_24_0)
	return arg_24_0._setFlagShip
end

function var_0_0.SetFlagShipForSkinAtlas(arg_25_0, arg_25_1)
	if arg_25_0._setFlagShipForSkinAtlas ~= arg_25_1 then
		arg_25_0._setFlagShipForSkinAtlas = arg_25_1

		PlayerPrefs.SetInt("setFlagShipforskinatlas", arg_25_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetSetFlagShipForSkinAtlas(arg_26_0)
	return arg_26_0._setFlagShipForSkinAtlas
end

function var_0_0.CheckNeedUserAgreement(arg_27_0)
	if PLATFORM_CODE == PLATFORM_KR then
		return false
	elseif PLATFORM_CODE == PLATFORM_CH then
		return false
	else
		return arg_27_0:GetUserAgreementFlag() > arg_27_0._userAgreement
	end
end

function var_0_0.GetUserAgreementFlag(arg_28_0)
	local var_28_0 = USER_AGREEMENT_FLAG_DEFAULT

	if PLATFORM_CODE == PLATFORM_CHT then
		var_28_0 = USER_AGREEMENT_FLAG_TW
	end

	return var_28_0
end

function var_0_0.SetUserAgreement(arg_29_0)
	if arg_29_0:CheckNeedUserAgreement() then
		local var_29_0 = arg_29_0:GetUserAgreementFlag()

		PlayerPrefs.SetInt("userAgreement", var_29_0)
		PlayerPrefs.Save()

		arg_29_0._userAgreement = var_29_0
	end
end

function var_0_0.IsLive2dEnable(arg_30_0)
	return arg_30_0._ShowLive2d
end

function var_0_0.IsBGEnable(arg_31_0)
	return arg_31_0._ShowBg
end

function var_0_0.SetSelectedShipId(arg_32_0, arg_32_1)
	if arg_32_0._selectedShipId ~= arg_32_1 then
		arg_32_0._selectedShipId = arg_32_1

		PlayerPrefs.SetInt("playerShipId", arg_32_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetSelectedShipId(arg_33_0)
	return arg_33_0._selectedShipId
end

function var_0_0.setEquipSceneIndex(arg_34_0, arg_34_1)
	arg_34_0._equipSceneIndex = arg_34_1
end

function var_0_0.getEquipSceneIndex(arg_35_0)
	return arg_35_0._equipSceneIndex
end

function var_0_0.resetEquipSceneIndex(arg_36_0)
	arg_36_0._equipSceneIndex = StoreHouseConst.WARP_TO_MATERIAL
end

function var_0_0.setActivityLayerIndex(arg_37_0, arg_37_1)
	arg_37_0._activityLayerIndex = arg_37_1
end

function var_0_0.getActivityLayerIndex(arg_38_0)
	return arg_38_0._activityLayerIndex
end

function var_0_0.resetActivityLayerIndex(arg_39_0)
	arg_39_0._activityLayerIndex = 1
end

function var_0_0.setBackyardRemind(arg_40_0)
	local var_40_0 = GetZeroTime()

	if arg_40_0._backyardFoodRemind ~= tostring(var_40_0) then
		PlayerPrefs.SetString("backyardRemind", var_40_0)
		PlayerPrefs.Save()

		arg_40_0._backyardFoodRemind = var_40_0
	end
end

function var_0_0.getBackyardRemind(arg_41_0)
	if not arg_41_0._backyardFoodRemind or arg_41_0._backyardFoodRemind == "" then
		return 0
	else
		return tonumber(arg_41_0._backyardFoodRemind)
	end
end

function var_0_0.getMaxLevelHelp(arg_42_0)
	return arg_42_0._showMaxLevelHelp
end

function var_0_0.setMaxLevelHelp(arg_43_0, arg_43_1)
	if arg_43_0._showMaxLevelHelp ~= arg_43_1 then
		arg_43_0._showMaxLevelHelp = arg_43_1

		PlayerPrefs.SetInt("maxLevelHelp", arg_43_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.setStopBuildSpeedupRemind(arg_44_0)
	arg_44_0.isStopBuildSpeedupReamind = true
end

function var_0_0.getStopBuildSpeedupRemind(arg_45_0)
	return arg_45_0.isStopBuildSpeedupReamind
end

function var_0_0.checkReadHelp(arg_46_0, arg_46_1)
	if not getProxy(PlayerProxy):getData() then
		return true
	end

	if arg_46_1 == "help_backyard" then
		return true
	elseif pg.SeriesGuideMgr.GetInstance():isEnd() then
		local var_46_0 = PlayerPrefs.GetInt(arg_46_1, 0)

		return PlayerPrefs.GetInt(arg_46_1, 0) > 0
	end

	return true
end

function var_0_0.recordReadHelp(arg_47_0, arg_47_1)
	PlayerPrefs.SetInt(arg_47_1, 1)
	PlayerPrefs.Save()
end

function var_0_0.clearAllReadHelp(arg_48_0)
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

function var_0_0.setAutoBattleTip(arg_49_0)
	local var_49_0 = GetZeroTime()

	arg_49_0._nextTipAutoBattleTime = var_49_0

	PlayerPrefs.SetInt("AutoBattleTip", var_49_0)
	PlayerPrefs.Save()
end

function var_0_0.isTipAutoBattle(arg_50_0)
	return pg.TimeMgr.GetInstance():GetServerTime() > arg_50_0._nextTipAutoBattleTime
end

function var_0_0.setActBossExchangeTicketTip(arg_51_0, arg_51_1)
	if arg_51_0.nextTipActBossExchangeTicket == arg_51_1 then
		return
	end

	arg_51_0.nextTipActBossExchangeTicket = arg_51_1

	local var_51_0 = GetZeroTime()

	if var_51_0 > arg_51_0._nextTipActBossTime then
		arg_51_0._nextTipActBossTime = var_51_0

		PlayerPrefs.SetInt("ActBossTipLastTime", var_51_0)
	end

	PlayerPrefs.SetInt("ActBossTip", arg_51_1)
	PlayerPrefs.Save()
end

function var_0_0.isTipActBossExchangeTicket(arg_52_0)
	if pg.TimeMgr.GetInstance():GetServerTime() > arg_52_0._nextTipActBossTime then
		return nil
	end

	return arg_52_0.nextTipActBossExchangeTicket
end

function var_0_0.SetScreenRatio(arg_53_0, arg_53_1)
	if arg_53_0._screenRatio ~= arg_53_1 then
		arg_53_0._screenRatio = arg_53_1

		PlayerPrefs.SetFloat("SetScreenRatio", arg_53_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetScreenRatio(arg_54_0)
	return arg_54_0._screenRatio
end

function var_0_0.CheckLargeScreen(arg_55_0)
	return Screen.width / Screen.height > 2
end

function var_0_0.IsShowBeatMonseterNianCurtain(arg_56_0)
	local var_56_0 = getProxy(PlayerProxy):getRawData()

	return pg.TimeMgr.GetInstance():GetServerTime() > tonumber(PlayerPrefs.GetString("HitMonsterNianLayer2020" .. var_56_0.id, "0"))
end

function var_0_0.SetBeatMonseterNianFlag(arg_57_0)
	local var_57_0 = getProxy(PlayerProxy):getRawData()

	PlayerPrefs.SetString("HitMonsterNianLayer2020" .. var_57_0.id, GetZeroTime())
	PlayerPrefs.Save()
end

function var_0_0.ShouldShowEventActHelp(arg_58_0)
	if not arg_58_0.actEventFlag then
		local var_58_0 = getProxy(PlayerProxy):getRawData().id

		arg_58_0.actEventFlag = PlayerPrefs.GetInt("event_act_help1" .. var_58_0, 0) > 0
	end

	return not arg_58_0.actEventFlag
end

function var_0_0.MarkEventActHelpFlag(arg_59_0)
	if not arg_59_0.actEventFlag then
		arg_59_0.actEventFlag = true

		local var_59_0 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt("event_act_help1" .. var_59_0, 1)
		PlayerPrefs.Save()
	end
end

function var_0_0.SetStorySpeed(arg_60_0, arg_60_1)
	arg_60_0.storySpeed = arg_60_1

	local var_60_0

	if getProxy(PlayerProxy) then
		var_60_0 = getProxy(PlayerProxy):getRawData().id
	else
		var_60_0 = 1
	end

	PlayerPrefs.SetInt("story_speed_flag" .. var_60_0, arg_60_1)
	PlayerPrefs.Save()
end

function var_0_0.GetStorySpeed(arg_61_0)
	if not arg_61_0.storySpeed then
		local var_61_0

		if getProxy(PlayerProxy) then
			var_61_0 = getProxy(PlayerProxy):getRawData().id
		else
			var_61_0 = 1
		end

		arg_61_0.storySpeed = PlayerPrefs.GetInt("story_speed_flag" .. var_61_0, 0)
	end

	return arg_61_0.storySpeed
end

function var_0_0.GetStoryAutoPlayFlag(arg_62_0)
	return arg_62_0.storyAutoPlayCode > 0
end

function var_0_0.SetStoryAutoPlayFlag(arg_63_0, arg_63_1)
	if arg_63_0.storyAutoPlayCode ~= arg_63_1 then
		PlayerPrefs.SetInt("story_autoplay_flag", arg_63_1)
		PlayerPrefs.Save()

		arg_63_0.storyAutoPlayCode = arg_63_1
	end
end

function var_0_0.GetPaintingDownloadPrefs(arg_64_0)
	return PlayerPrefs.GetInt("Painting_Download_Prefs", 0)
end

function var_0_0.SetPaintingDownloadPrefs(arg_65_0, arg_65_1)
	PlayerPrefs.SetInt("Painting_Download_Prefs", arg_65_1)
end

function var_0_0.ShouldShipMainSceneWord(arg_66_0)
	return arg_66_0.showMainSceneWordTip
end

function var_0_0.SaveMainSceneWordFlag(arg_67_0, arg_67_1)
	if arg_67_0.showMainSceneWordTip ~= arg_67_1 then
		arg_67_0.showMainSceneWordTip = arg_67_1

		PlayerPrefs.SetInt("main_scene_word_toggle", arg_67_1 and 1 or 0)
		PlayerPrefs.Save()
	end
end

function var_0_0.RecordFrameRate(arg_68_0)
	if not arg_68_0.originalFrameRate then
		arg_68_0.originalFrameRate = Application.targetFrameRate
	end
end

function var_0_0.RestoreFrameRate(arg_69_0)
	if arg_69_0.originalFrameRate then
		Application.targetFrameRate = arg_69_0.originalFrameRate
		arg_69_0.originalFrameRate = nil
	end
end

function var_0_0.ResetTimeLimitSkinShopTip(arg_70_0)
	arg_70_0.isTipLimitSkinShop = PlayerPrefs.GetInt("tipLimitSkinShopTime_", 0) <= pg.TimeMgr.GetInstance():GetServerTime()

	if arg_70_0.isTipLimitSkinShop then
		arg_70_0.nextTipLimitSkinShopTime = GetZeroTime()
	end
end

function var_0_0.ShouldTipTimeLimitSkinShop(arg_71_0)
	return arg_71_0.isTipLimitSkinShop
end

function var_0_0.SetNextTipTimeLimitSkinShop(arg_72_0)
	if arg_72_0.isTipLimitSkinShop and arg_72_0.nextTipLimitSkinShopTime then
		PlayerPrefs.SetInt("tipLimitSkinShopTime_", arg_72_0.nextTipLimitSkinShopTime)
		PlayerPrefs.Save()

		arg_72_0.nextTipLimitSkinShopTime = nil
		arg_72_0.isTipLimitSkinShop = false
	end
end

function var_0_0.WorldBossProgressTipFlag(arg_73_0, arg_73_1)
	if arg_73_0.WorldBossProgressTipValue ~= arg_73_1 then
		arg_73_0.WorldBossProgressTipValue = arg_73_1

		PlayerPrefs.SetString("_WorldBossProgressTipFlag_", arg_73_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetWorldBossProgressTipFlag(arg_74_0)
	if not arg_74_0.WorldBossProgressTipValue then
		local var_74_0 = pg.gameset.joint_boss_ticket.description
		local var_74_1 = var_74_0[1] + var_74_0[2]
		local var_74_2 = var_74_0[1] .. "&" .. var_74_1
		local var_74_3 = PlayerPrefs.GetString("_WorldBossProgressTipFlag_", var_74_2)

		arg_74_0.WorldBossProgressTipValue = var_74_3

		return var_74_3
	else
		return arg_74_0.WorldBossProgressTipValue
	end
end

function var_0_0.GetWorldBossProgressTipTable(arg_75_0)
	local var_75_0 = arg_75_0:GetWorldBossProgressTipFlag()

	if not var_75_0 or var_75_0 == "" then
		return {}
	end

	return string.split(var_75_0, "&")
end

function var_0_0.GetChatFlag(arg_76_0)
	if not arg_76_0.chatFlag then
		local var_76_0 = {
			ChatConst.ChannelWorld,
			ChatConst.ChannelPublic,
			ChatConst.ChannelFriend
		}

		if getProxy(GuildProxy):getRawData() then
			table.insert(var_76_0, ChatConst.ChannelGuild)
		end

		arg_76_0.chatFlag = PlayerPrefs.GetInt("chat__setting", IndexConst.Flags2Bits(var_76_0))
	end

	return arg_76_0.chatFlag
end

function var_0_0.SetChatFlag(arg_77_0, arg_77_1)
	if arg_77_0.chatFlag ~= arg_77_1 then
		arg_77_0.chatFlag = arg_77_1

		PlayerPrefs.SetInt("chat__setting", arg_77_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.IsShowActivityMapSPTip()
	local var_78_0 = getProxy(PlayerProxy):getRawData()

	return pg.TimeMgr.GetInstance():GetServerTime() > PlayerPrefs.GetInt("ActivityMapSPTip" .. var_78_0.id, 0)
end

function var_0_0.SetActivityMapSPTip()
	local var_79_0 = getProxy(PlayerProxy):getRawData()

	PlayerPrefs.SetInt("ActivityMapSPTip" .. var_79_0.id, GetZeroTime())
	PlayerPrefs.Save()
end

function var_0_0.IsTipNewTheme(arg_80_0)
	local var_80_0 = pg.backyard_theme_template
	local var_80_1 = var_80_0.all[#var_80_0.all]
	local var_80_2 = var_80_0[var_80_1].ids[1]
	local var_80_3 = pg.furniture_shop_template[var_80_2]
	local var_80_4 = getProxy(PlayerProxy):getRawData().id
	local var_80_5 = PlayerPrefs.GetInt(var_80_4 .. "IsTipNewTheme" .. var_80_1, 0) == 0

	if var_80_3 and var_80_3.new == 1 and pg.TimeMgr.GetInstance():inTime(var_80_3.time) and var_80_5 then
		arg_80_0.lastThemeId = var_80_1
	else
		arg_80_0.lastThemeId = nil
	end

	return arg_80_0.lastThemeId ~= nil
end

function var_0_0.UpdateNewThemeValue(arg_81_0)
	if arg_81_0.lastThemeId then
		local var_81_0 = arg_81_0.lastThemeId
		local var_81_1 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt(var_81_1 .. "IsTipNewTheme" .. var_81_0, 1)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetNewGemFurnitureLocalCache(arg_82_0)
	if not arg_82_0.cacheGemFuruitures then
		arg_82_0.cacheGemFuruitures = {}

		local var_82_0 = getProxy(PlayerProxy):getRawData().id
		local var_82_1 = PlayerPrefs.GetString(var_82_0 .. "IsTipNewGenFurniture")

		if var_82_1 ~= "" then
			local var_82_2 = string.split(var_82_1, "#")

			for iter_82_0, iter_82_1 in ipairs(var_82_2) do
				arg_82_0.cacheGemFuruitures[tonumber(iter_82_1)] = true
			end
		end
	end

	return arg_82_0.cacheGemFuruitures
end

function var_0_0.IsTipNewGemFurniture(arg_83_0)
	local var_83_0 = arg_83_0:GetNewGemFurnitureLocalCache()
	local var_83_1 = getProxy(DormProxy):GetTag7Furnitures()

	if _.any(var_83_1, function(arg_84_0)
		return pg.furniture_shop_template[arg_84_0].new == 1 and not var_83_0[arg_84_0]
	end) then
		arg_83_0.newGemFurniture = var_83_1
	else
		arg_83_0.newGemFurniture = nil
	end

	return arg_83_0.newGemFurniture ~= nil
end

function var_0_0.UpdateNewGemFurnitureValue(arg_85_0)
	if arg_85_0.newGemFurniture then
		for iter_85_0, iter_85_1 in pairs(arg_85_0.newGemFurniture) do
			arg_85_0.cacheGemFuruitures[iter_85_1] = true
		end

		local var_85_0 = table.concat(arg_85_0.newGemFurniture, "#")
		local var_85_1 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetString(var_85_1 .. "IsTipNewGenFurniture", var_85_0)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetRandomFlagShipList(arg_86_0)
	if arg_86_0.randomFlagShipList then
		return arg_86_0.randomFlagShipList
	end

	local var_86_0 = getProxy(PlayerProxy):getRawData().id
	local var_86_1 = PlayerPrefs.GetString("RandomFlagShipList" .. var_86_0, "")
	local var_86_2 = string.split(var_86_1, "#")

	arg_86_0.randomFlagShipList = _.map(var_86_2, function(arg_87_0)
		return tonumber(arg_87_0)
	end)

	return arg_86_0.randomFlagShipList
end

function var_0_0.IsRandomFlagShip(arg_88_0, arg_88_1)
	if not arg_88_0.randomFlagShipMap then
		arg_88_0.randomFlagShipMap = {}

		for iter_88_0, iter_88_1 in ipairs(arg_88_0:GetRandomFlagShipList()) do
			arg_88_0.randomFlagShipMap[iter_88_1] = true
		end
	end

	return arg_88_0.randomFlagShipMap[arg_88_1] == true
end

function var_0_0.IsOpenRandomFlagShip(arg_89_0)
	local var_89_0 = arg_89_0:GetRandomFlagShipList()
	local var_89_1 = getProxy(BayProxy)

	return #var_89_0 > 0 and _.any(var_89_0, function(arg_90_0)
		return var_89_1:RawGetShipById(arg_90_0) ~= nil
	end)
end

function var_0_0.UpdateRandomFlagShipList(arg_91_0, arg_91_1)
	arg_91_0.randomFlagShipMap = nil
	arg_91_0.randomFlagShipList = arg_91_1

	local var_91_0 = table.concat(arg_91_1, "#")
	local var_91_1 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetString("RandomFlagShipList" .. var_91_1, var_91_0)
	PlayerPrefs.Save()
end

function var_0_0.GetPrevRandomFlagShipTime(arg_92_0)
	if arg_92_0.prevRandomFlagShipTime then
		return arg_92_0.prevRandomFlagShipTime
	end

	local var_92_0 = getProxy(PlayerProxy):getRawData().id

	arg_92_0.prevRandomFlagShipTime = PlayerPrefs.GetInt("RandomFlagShipTime" .. var_92_0, 0)

	return arg_92_0.prevRandomFlagShipTime
end

function var_0_0.SetPrevRandomFlagShipTime(arg_93_0, arg_93_1)
	if arg_93_0.prevRandomFlagShipTime == arg_93_1 then
		return
	end

	arg_93_0.prevRandomFlagShipTime = arg_93_1

	local var_93_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("RandomFlagShipTime" .. var_93_0, arg_93_1)
	PlayerPrefs.Save()
end

function var_0_0.GetFlagShipDisplayMode(arg_94_0)
	if not arg_94_0.flagShipDisplayMode then
		local var_94_0 = getProxy(PlayerProxy):getRawData().id

		arg_94_0.flagShipDisplayMode = PlayerPrefs.GetInt("flag-ship-display-mode" .. var_94_0, FlAG_SHIP_DISPLAY_ALL)
	end

	return arg_94_0.flagShipDisplayMode
end

function var_0_0.SetFlagShipDisplayMode(arg_95_0, arg_95_1)
	if arg_95_0.flagShipDisplayMode ~= arg_95_1 then
		arg_95_0.flagShipDisplayMode = arg_95_1

		local var_95_0 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt("flag-ship-display-mode" .. var_95_0, arg_95_1)
		PlayerPrefs.Save()
	end
end

function var_0_0.RecordContinuousOperationAutoSubStatus(arg_96_0, arg_96_1)
	if arg_96_1 then
		return
	end

	local var_96_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("AutoBotCOFlag" .. var_96_0, 1)
	PlayerPrefs.Save()
end

function var_0_0.ResetContinuousOperationAutoSub(arg_97_0)
	local var_97_0 = getProxy(PlayerProxy):getRawData().id

	if PlayerPrefs.GetInt("AutoBotCOFlag" .. var_97_0, 0) == 0 then
		return
	end

	pg.m02:sendNotification(GAME.AUTO_SUB, {
		isActiveSub = true,
		system = SYSTEM_ACT_BOSS
	})
	PlayerPrefs.SetInt("AutoBotCOFlag" .. var_97_0, 0)
	PlayerPrefs.Save()
end

function var_0_0.SetWorkbenchDailyTip(arg_98_0)
	local var_98_0 = getProxy(PlayerProxy):getRawData().id
	local var_98_1 = GetZeroTime()

	PlayerPrefs.SetInt("WorkbenchDailyTip" .. var_98_0, var_98_1)
	PlayerPrefs.Save()
end

function var_0_0.IsTipWorkbenchDaily(arg_99_0)
	local var_99_0 = getProxy(PlayerProxy):getRawData().id

	return pg.TimeMgr.GetInstance():GetServerTime() > PlayerPrefs.GetInt("WorkbenchDailyTip" .. var_99_0, 0)
end

function var_0_0.IsDisplayResultPainting(arg_100_0)
	local var_100_0 = PlayerPrefs.HasKey(BATTLERESULT_SKIP_DISPAY_PAINTING)
	local var_100_1 = false

	if var_100_0 then
		var_100_1 = PlayerPrefs.GetInt(BATTLERESULT_SKIP_DISPAY_PAINTING) <= 0

		PlayerPrefs.DeleteKey(BATTLERESULT_SKIP_DISPAY_PAINTING)
		PlayerPrefs.SetInt(BATTLERESULT_DISPAY_PAINTING, var_100_1 and 1 or 0)
		PlayerPrefs.Save()
	else
		var_100_1 = PlayerPrefs.GetInt(BATTLERESULT_DISPAY_PAINTING, 0) >= 1
	end

	return var_100_1
end

function var_0_0.IsDisplayCommanderCatCustomName(arg_101_0)
	if not arg_101_0.customFlag then
		local var_101_0 = getProxy(PlayerProxy):getRawData().id

		arg_101_0.customFlag = PlayerPrefs.GetInt("DisplayCommanderCatCustomName" .. var_101_0, 0) == 0
	end

	return arg_101_0.customFlag
end

function var_0_0.SetDisplayCommanderCatCustomName(arg_102_0, arg_102_1)
	if arg_102_1 == arg_102_0.customFlag then
		return
	end

	arg_102_0.customFlag = arg_102_1

	local var_102_0 = arg_102_0.customFlag and 0 or 1
	local var_102_1 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("DisplayCommanderCatCustomName" .. var_102_1, var_102_0)
	PlayerPrefs.Save()
end

function var_0_0.GetCommanderQuicklyToolRarityConfig(arg_103_0)
	if not arg_103_0.quicklyToolRarityConfig then
		local var_103_0 = getProxy(PlayerProxy):getRawData().id
		local var_103_1 = PlayerPrefs.GetString("CommanderQuicklyToolRarityConfig" .. var_103_0, "1#1#1")
		local var_103_2 = string.split(var_103_1, "#")

		arg_103_0.quicklyToolRarityConfig = _.map(var_103_2, function(arg_104_0)
			return tonumber(arg_104_0) == 1
		end)
	end

	return arg_103_0.quicklyToolRarityConfig
end

function var_0_0.SaveCommanderQuicklyToolRarityConfig(arg_105_0, arg_105_1)
	local var_105_0 = false

	for iter_105_0, iter_105_1 in ipairs(arg_105_0.quicklyToolRarityConfig) do
		if arg_105_1[iter_105_0] ~= iter_105_1 then
			var_105_0 = true

			break
		end
	end

	if var_105_0 then
		arg_105_0.quicklyToolRarityConfig = arg_105_1

		local var_105_1 = _.map(arg_105_0.quicklyToolRarityConfig, function(arg_106_0)
			return arg_106_0 and "1" or "0"
		end)
		local var_105_2 = table.concat(var_105_1, "#")
		local var_105_3 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetString("CommanderQuicklyToolRarityConfig" .. var_105_3, var_105_2)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetCommanderLockFlagRarityConfig(arg_107_0)
	if not arg_107_0.lockFlagRarityConfig then
		local var_107_0 = getProxy(PlayerProxy):getRawData().id
		local var_107_1 = PlayerPrefs.GetString("CommanderLockFlagRarityConfig_" .. var_107_0, "1#0#0")
		local var_107_2 = string.split(var_107_1, "#")

		arg_107_0.lockFlagRarityConfig = _.map(var_107_2, function(arg_108_0)
			return tonumber(arg_108_0) == 1
		end)
	end

	return arg_107_0.lockFlagRarityConfig
end

function var_0_0.SaveCommanderLockFlagRarityConfig(arg_109_0, arg_109_1)
	local var_109_0 = false

	for iter_109_0, iter_109_1 in ipairs(arg_109_0.lockFlagRarityConfig) do
		if arg_109_1[iter_109_0] ~= iter_109_1 then
			var_109_0 = true

			break
		end
	end

	if var_109_0 then
		arg_109_0.lockFlagRarityConfig = arg_109_1

		local var_109_1 = _.map(arg_109_0.lockFlagRarityConfig, function(arg_110_0)
			return arg_110_0 and "1" or "0"
		end)
		local var_109_2 = table.concat(var_109_1, "#")
		local var_109_3 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetString("CommanderLockFlagRarityConfig_" .. var_109_3, var_109_2)
		PlayerPrefs.Save()
	end
end

function var_0_0.GetCommanderLockFlagTalentConfig(arg_111_0)
	if not arg_111_0.lockFlagTalentConfig then
		local var_111_0 = getProxy(PlayerProxy):getRawData().id
		local var_111_1 = PlayerPrefs.GetString("CommanderLockFlagTalentConfig" .. var_111_0, "")
		local var_111_2 = {}

		if var_111_1 == "" then
			for iter_111_0, iter_111_1 in ipairs(CommanderCatUtil.GetAllTalentNames()) do
				var_111_2[iter_111_1.id] = true
			end
		else
			for iter_111_2, iter_111_3 in ipairs(string.split(var_111_1, "#")) do
				local var_111_3 = string.split(iter_111_3, "*")

				if #var_111_3 == 2 then
					var_111_2[tonumber(var_111_3[1])] = tonumber(var_111_3[2]) == 1
				end
			end
		end

		arg_111_0.lockFlagTalentConfig = var_111_2
	end

	return arg_111_0.lockFlagTalentConfig
end

function var_0_0.SaveCommanderLockFlagTalentConfig(arg_112_0, arg_112_1)
	arg_112_0.lockFlagTalentConfig = arg_112_1

	local var_112_0 = {}

	for iter_112_0, iter_112_1 in pairs(arg_112_1) do
		table.insert(var_112_0, iter_112_0 .. "*" .. (iter_112_1 and "1" or "0"))
	end

	local var_112_1 = table.concat(var_112_0, "#")
	local var_112_2 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetString("CommanderLockFlagTalentConfig" .. var_112_2, var_112_1)
	PlayerPrefs.Save()
end

function var_0_0.GetMainPaintingVariantFlag(arg_113_0, arg_113_1)
	if not arg_113_0.mainPaintingVariantFlag then
		arg_113_0.mainPaintingVariantFlag = {}
	end

	if not arg_113_0.mainPaintingVariantFlag[arg_113_1] then
		local var_113_0 = getProxy(PlayerProxy):getRawData().id
		local var_113_1 = PlayerPrefs.GetInt(arg_113_1 .. "_mainMeshImagePainting_ex_" .. var_113_0, 0)

		arg_113_0.mainPaintingVariantFlag[arg_113_1] = var_113_1
	end

	return arg_113_0.mainPaintingVariantFlag[arg_113_1]
end

function var_0_0.SwitchMainPaintingVariantFlag(arg_114_0, arg_114_1)
	local var_114_0 = 1 - arg_114_0:GetMainPaintingVariantFlag(arg_114_1)

	arg_114_0.mainPaintingVariantFlag[arg_114_1] = var_114_0

	local var_114_1 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(arg_114_1 .. "_mainMeshImagePainting_ex_" .. var_114_1, var_114_0)
	PlayerPrefs.Save()
end

function var_0_0.IsTipDay(arg_115_0, arg_115_1, arg_115_2, arg_115_3)
	local var_115_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt(var_115_0 .. "educate_char_" .. arg_115_1 .. arg_115_2 .. arg_115_3, 0) == 1
end

function var_0_0.RecordTipDay(arg_116_0, arg_116_1, arg_116_2, arg_116_3)
	local var_116_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_116_0 .. "educate_char_" .. arg_116_1 .. arg_116_2 .. arg_116_3, 1)
	PlayerPrefs.Save()
end

function var_0_0.UpdateEducateCharTip(arg_117_0, arg_117_1)
	local var_117_0 = getProxy(PlayerProxy):getRawData().id
	local var_117_1 = getProxy(EducateProxy):GetSecretaryIDs()
	local var_117_2 = {}

	for iter_117_0, iter_117_1 in ipairs(arg_117_1) do
		var_117_2[iter_117_1] = true
	end

	for iter_117_2, iter_117_3 in ipairs(var_117_1) do
		if var_117_2[iter_117_3] ~= true then
			PlayerPrefs.SetInt(var_117_0 .. "educate_char_tip" .. iter_117_3, 1)
			PlayerPrefs.Save()
		end
	end

	arg_117_0:RefillEducateCharTipList()
end

function var_0_0.RefillEducateCharTipList(arg_118_0)
	local var_118_0 = getProxy(PlayerProxy):getRawData().id

	arg_118_0.educateCharTipList = {}

	if LOCK_EDUCATE_SYSTEM then
		return
	end

	local var_118_1 = getProxy(EducateProxy):GetSecretaryIDs()

	for iter_118_0, iter_118_1 in ipairs(var_118_1 or {}) do
		if PlayerPrefs.GetInt(var_118_0 .. "educate_char_tip" .. iter_118_1, 0) == 1 then
			table.insert(arg_118_0.educateCharTipList, iter_118_1)
		end
	end
end

function var_0_0.ShouldEducateCharTip(arg_119_0)
	if not arg_119_0.educateCharTipList or #arg_119_0.educateCharTipList == 0 then
		arg_119_0:RefillEducateCharTipList()
	end

	return #arg_119_0.educateCharTipList > 0
end

function var_0_0._ShouldEducateCharTip(arg_120_0, arg_120_1)
	if not arg_120_0.educateCharTipList or #arg_120_0.educateCharTipList == 0 then
		arg_120_0:RefillEducateCharTipList()
	end

	if table.contains(arg_120_0.educateCharTipList, arg_120_1) then
		return true
	end

	return false
end

function var_0_0.ClearEducateCharTip(arg_121_0, arg_121_1)
	if not arg_121_0:_ShouldEducateCharTip(arg_121_1) then
		return false
	end

	table.removebyvalue(arg_121_0.educateCharTipList, arg_121_1)

	local var_121_0 = getProxy(PlayerProxy):getRawData().id .. "educate_char_tip" .. arg_121_1

	if PlayerPrefs.HasKey(var_121_0) then
		PlayerPrefs.DeleteKey(var_121_0)
		PlayerPrefs.Save()
	end

	pg.m02:sendNotification(GAME.CLEAR_EDUCATE_TIP, {
		id = arg_121_1
	})

	return true
end

function var_0_0.Reset(arg_122_0)
	arg_122_0:resetEquipSceneIndex()
	arg_122_0:resetActivityLayerIndex()

	arg_122_0.isStopBuildSpeedupReamind = false

	arg_122_0:RestoreFrameRate()

	arg_122_0.randomFlagShipList = nil
	arg_122_0.prevRandomFlagShipTime = nil
	arg_122_0.randomFlagShipMap = nil
	arg_122_0.educateCharTipList = {}
end

return var_0_0
