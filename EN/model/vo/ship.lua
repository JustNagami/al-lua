local var_0_0 = class("Ship", import(".BaseVO"))

var_0_0.ENERGY_MID = 40
var_0_0.ENERGY_LOW = 0
var_0_0.RECOVER_ENERGY_POINT = 2
var_0_0.INTIMACY_PROPOSE = 6
var_0_0.CONFIG_MAX_STAR = 6
var_0_0.BACKYARD_1F_ENERGY_ADDITION = 2
var_0_0.BACKYARD_2F_ENERGY_ADDITION = 3
var_0_0.PREFERENCE_TAG_NONE = 0
var_0_0.PREFERENCE_TAG_COMMON = 1

local var_0_1 = {
	vanguard = i18n("word_vanguard_fleet"),
	main = i18n("word_main_fleet")
}

var_0_0.CVBattleKey = {
	skill = "skill",
	link2 = "link2",
	lose = "lose",
	link5 = "link5",
	link3 = "link3",
	link6 = "link6",
	hp = "hp",
	link1 = "link1",
	link4 = "link4",
	warcry = "warcry",
	mvp = "mvp"
}
var_0_0.LOCK_STATE_UNLOCK = 0
var_0_0.LOCK_STATE_LOCK = 1
var_0_0.WEAPON_COUNT = 3
var_0_0.PREFAB_EQUIP = 4
var_0_0.MAX_SKILL_LEVEL = 10
var_0_0.ENERGY_RECOVER_TIME = 360
var_0_0.STATE_NORMAL = 1
var_0_0.STATE_REST = 2
var_0_0.STATE_CLASS = 3
var_0_0.STATE_COLLECT = 4
var_0_0.STATE_TRAIN = 5

local var_0_2 = 4
local var_0_3 = 100
local var_0_4 = 120
local var_0_5 = pg.ship_data_strengthen
local var_0_6 = pg.ship_level
local var_0_7 = pg.equip_skin_template
local var_0_8 = pg.ship_data_breakout

function nation2print(arg_1_0)
	return Nation.Nation2Print(arg_1_0)
end

function var_0_0.getRecoverEnergyPoint(arg_2_0)
	return arg_2_0.propose and 3 or 2
end

function shipType2name(arg_3_0)
	return ShipType.Type2Name(arg_3_0)
end

function shipType2print(arg_4_0)
	return ShipType.Type2Print(arg_4_0)
end

function shipType2Battleprint(arg_5_0)
	return ShipType.Type2BattlePrint(arg_5_0)
end

function skinId2bgPrint(arg_6_0)
	local var_6_0 = pg.ship_skin_template[arg_6_0].rarity_bg

	if var_6_0 and var_6_0 ~= "" then
		return var_6_0
	end
end

function var_0_0.useSkin(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0:getSkinId()

	if var_7_0 == arg_7_1 then
		return true
	end

	local var_7_1 = ShipSkin.GetChangeSkinGroupId(var_7_0)
	local var_7_2 = ShipSkin.GetChangeSkinGroupId(arg_7_1)

	if var_7_1 and var_7_2 and var_7_1 == var_7_2 then
		return true
	end

	return false
end

function var_0_0.rarity2bgPrint(arg_8_0)
	return shipRarity2bgPrint(arg_8_0:getRarity(), arg_8_0:isBluePrintShip(), arg_8_0:isMetaShip())
end

function var_0_0.rarity2bgPrintForGet(arg_9_0)
	return skinId2bgPrint(arg_9_0:getSkinId()) or arg_9_0:rarity2bgPrint()
end

function var_0_0.getShipBgPrint(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0:getSkinId()
	local var_10_1 = pg.ship_skin_template[var_10_0]

	assert(var_10_1, "ship_skin_template not exist: " .. var_10_0)

	local var_10_2

	if not arg_10_1 and var_10_1.bg_sp and var_10_1.bg_sp ~= "" and PlayerPrefs.GetInt("paint_hide_other_obj_" .. var_10_1.painting, 0) == 0 then
		var_10_2 = var_10_1.bg_sp
	end

	return var_10_2 and var_10_2 or var_10_1.bg and #var_10_1.bg > 0 and var_10_1.bg or arg_10_0:rarity2bgPrintForGet()
end

function var_0_0.getStar(arg_11_0)
	return arg_11_0:getConfig("star")
end

function var_0_0.getMaxStar(arg_12_0)
	return pg.ship_data_template[arg_12_0.configId].star_max
end

function var_0_0.getShipArmor(arg_13_0)
	return arg_13_0:getConfig("armor_type")
end

function var_0_0.getShipArmorName(arg_14_0)
	local var_14_0 = arg_14_0:getShipArmor()

	return ArmorType.Type2Name(var_14_0)
end

function var_0_0.getGroupId(arg_15_0)
	return pg.ship_data_template[arg_15_0.configId].group_type
end

function var_0_0.getGroupIdByConfigId(arg_16_0)
	return math.floor(arg_16_0 / 10)
end

function var_0_0.getShipWords(arg_17_0)
	local var_17_0 = pg.ship_skin_words[arg_17_0]

	if not var_17_0 then
		warning("找不到ship_skin_words: " .. arg_17_0)

		return
	end

	local var_17_1 = Clone(var_17_0)

	for iter_17_0, iter_17_1 in pairs(var_17_1) do
		if type(iter_17_1) == "string" then
			var_17_1[iter_17_0] = HXSet.hxLan(iter_17_1)
		end
	end

	local var_17_2 = pg.ship_skin_words_extra[arg_17_0]

	return var_17_1, var_17_2
end

function var_0_0.getMainwordsCount(arg_18_0)
	local var_18_0 = var_0_0.getShipWords(arg_18_0)

	if not var_18_0.main or var_18_0.main == "" then
		var_18_0 = var_0_0.getShipWords(var_0_0.getOriginalSkinId(arg_18_0))
	end

	return #string.split(var_18_0.main, "|")
end

function var_0_0.getWordsEx(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4, arg_19_5)
	local var_19_0 = arg_19_0 and arg_19_0[arg_19_1] or nil
	local var_19_1 = false

	if not var_19_0 or var_19_0 == "" then
		if arg_19_0 and arg_19_0.id == arg_19_4 then
			return
		end

		if not arg_19_5 then
			return
		end

		local var_19_2, var_19_3 = var_0_0.getShipWords(arg_19_4)

		if not var_19_3 then
			return
		end

		var_19_0 = var_19_3[arg_19_1]

		if not var_19_0 then
			return
		end

		var_19_1 = true
	end

	if type(var_19_0) == "string" then
		return
	end

	arg_19_3 = arg_19_3 or 0

	for iter_19_0, iter_19_1 in ipairs(var_19_0) do
		if arg_19_3 >= iter_19_1[1] then
			if arg_19_1 == "main" then
				return string.split(iter_19_1[2], "|")[arg_19_2], iter_19_1[1], var_19_1
			else
				return iter_19_1[2], iter_19_1[1], var_19_1
			end
		end
	end
end

function var_0_0.getWords(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	local var_20_0, var_20_1 = var_0_0.getShipWords(arg_20_0)
	local var_20_2 = var_0_0.getOriginalSkinId(arg_20_0)
	local var_20_3 = math.fmod(arg_20_0, var_20_2)

	if not var_20_0 then
		var_20_0, var_20_1 = var_0_0.getShipWords(var_20_2)

		if not var_20_0 then
			return nil
		end
	end

	local var_20_4 = 0
	local var_20_5 = false
	local var_20_6 = var_20_0[arg_20_1]

	if not var_20_6 or var_20_6 == "" then
		var_20_5 = true

		if var_20_0.id == var_20_2 then
			return nil
		else
			var_20_0 = var_0_0.getShipWords(var_20_2)

			if not var_20_0 then
				return nil
			end

			var_20_6 = var_20_0[arg_20_1]

			if not var_20_6 or var_20_6 == "" then
				return nil
			end
		end
	end

	local var_20_7 = string.split(var_20_6, "|")
	local var_20_8 = arg_20_2 or math.random(#var_20_7)

	if arg_20_1 == "main" and var_20_7[var_20_8] == "nil" then
		var_20_5 = true
		var_20_0 = var_0_0.getShipWords(var_20_2)

		if not var_20_0 then
			return nil
		end

		local var_20_9 = var_20_0[arg_20_1]

		if not var_20_9 or var_20_9 == "" then
			return nil
		end

		var_20_7 = string.split(var_20_9, "|")
	end

	rstEx, cvEx, defaultCoverEx = var_0_0.getWordsEx(var_20_1, arg_20_1, var_20_8, arg_20_4, var_20_2, var_20_5)

	local var_20_10
	local var_20_11 = PlayerPrefs.GetInt("CV_LANGUAGE_" .. pg.ship_skin_template[arg_20_0].ship_group) == 2 and var_20_0.voice_key_2 or var_20_0.voice_key

	if var_20_11 == 0 then
		if not var_20_5 or rstEx and not defaultCoverEx then
			var_20_10 = var_0_0.getCVPath(var_20_2, arg_20_1, var_20_8, var_20_3)
		end
	elseif var_20_11 == -2 then
		-- block empty
	else
		var_20_10 = var_0_0.getCVPath(var_20_2, arg_20_1, var_20_8)
	end

	local var_20_12 = var_20_7[var_20_8]

	if var_20_12 and (arg_20_3 == nil and PLATFORM_CODE ~= PLATFORM_US or arg_20_3 == true) then
		var_20_12 = var_20_12:gsub("%s", " ")
	end

	if rstEx then
		var_20_10 = var_20_10 and var_20_10 .. "_ex" .. cvEx
	end

	return rstEx or var_20_12, var_20_10, cvEx
end

function var_0_0.getCVKeyID(arg_21_0)
	local var_21_0 = Ship.getShipWords(arg_21_0)

	if not var_21_0 then
		return -1
	end

	local var_21_1
	local var_21_2 = PlayerPrefs.GetInt("CV_LANGUAGE_" .. pg.ship_skin_template[arg_21_0].ship_group)
	local var_21_3 = var_21_2 == 2 and var_21_0.voice_key_2 >= 0 and var_21_0.voice_key_2 or var_21_0.voice_key

	if var_21_3 == 0 or var_21_3 == -2 then
		local var_21_4 = var_0_0.getOriginalSkinId(arg_21_0)
		local var_21_5 = var_0_0.getShipWords(var_21_4)

		var_21_3 = var_21_2 == 2 and var_21_5.voice_key_2 >= 0 and var_21_5.voice_key_2 or var_21_5.voice_key
	end

	return var_21_3
end

function var_0_0.getCVPath(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	arg_22_2 = arg_22_2 or 1

	local var_22_0 = Ship.getShipWords(arg_22_0)
	local var_22_1 = var_0_0.getOriginalSkinId(arg_22_0)

	if not var_22_0 then
		var_22_0 = var_0_0.getShipWords(var_22_1)

		if not var_22_0 then
			return
		end
	end

	local var_22_2 = PlayerPrefs.GetInt("CV_LANGUAGE_" .. arg_22_0 / 10)
	local var_22_3 = var_22_0[arg_22_1]

	if arg_22_1 == "main" then
		var_22_3 = string.split(var_22_3, "|")[arg_22_2]
		arg_22_1 = arg_22_1 .. arg_22_2
	end

	if arg_22_1 == "skill" or string.find(arg_22_1, "link") then
		if var_22_0.voice_key == 0 then
			var_22_0 = var_0_0.getShipWords(var_22_1)
		end
	elseif not var_22_3 or var_22_3 == "" or var_22_3 == "nil" then
		var_22_0 = var_0_0.getShipWords(var_22_1)
	end

	local var_22_4
	local var_22_5 = var_22_2 == 2 and var_22_0.voice_key_2 or var_22_0.voice_key

	if var_22_5 ~= -1 and pg.character_voice[arg_22_1] then
		var_22_4 = pg.character_voice[arg_22_1].resource_key

		if var_22_4 then
			var_22_4 = "event:/cv/" .. var_22_5 .. "/" .. var_22_4

			if arg_22_3 then
				var_22_4 = var_22_4 .. "_" .. arg_22_3
			end
		end
	end

	return var_22_4
end

function var_0_0.getCVCalibrate(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = pg.ship_skin_template[arg_23_0]

	if not var_23_0 then
		return 0
	end

	if arg_23_1 == "main" then
		arg_23_1 = arg_23_1 .. "_" .. arg_23_2
	end

	return var_23_0.l2d_voice_calibrate[arg_23_1]
end

function var_0_0.getL2dSoundEffect(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = pg.ship_skin_template[arg_24_0]

	if not var_24_0 then
		return 0
	end

	if arg_24_1 == "main" then
		arg_24_1 = arg_24_1 .. "_" .. arg_24_2
	end

	return var_24_0.l2d_se[arg_24_1]
end

function var_0_0.getOriginalSkinId(arg_25_0)
	local var_25_0 = pg.ship_skin_template[arg_25_0].ship_group

	return ShipGroup.getDefaultSkin(var_25_0).id
end

function var_0_0.getTransformShipId(arg_26_0)
	local var_26_0 = pg.ship_data_template[arg_26_0].group_type
	local var_26_1 = pg.ship_data_trans[var_26_0]

	if var_26_1 then
		for iter_26_0, iter_26_1 in ipairs(var_26_1.transform_list) do
			for iter_26_2, iter_26_3 in ipairs(iter_26_1) do
				local var_26_2 = pg.transform_data_template[iter_26_3[2]]

				for iter_26_4, iter_26_5 in ipairs(var_26_2.ship_id) do
					if iter_26_5[1] == arg_26_0 then
						return iter_26_5[2]
					end
				end
			end
		end
	end
end

function var_0_0.getAircraftCount(arg_27_0)
	local var_27_0 = arg_27_0:getConfigTable().base_list
	local var_27_1 = arg_27_0:getConfigTable().default_equip_list
	local var_27_2 = {}

	for iter_27_0 = 1, 3 do
		local var_27_3 = arg_27_0:getEquip(iter_27_0) and arg_27_0:getEquip(iter_27_0).configId or var_27_1[iter_27_0]
		local var_27_4 = Equipment.getConfigData(var_27_3).type

		if table.contains(EquipType.AirDomainEquip, var_27_4) then
			var_27_2[var_27_4] = defaultValue(var_27_2[var_27_4], 0) + var_27_0[iter_27_0]
		end
	end

	return var_27_2
end

function var_0_0.getShipType(arg_28_0)
	return arg_28_0:getConfig("type")
end

function var_0_0.getEnergy(arg_29_0)
	return arg_29_0.energy
end

function var_0_0.getEnergeConfig(arg_30_0)
	local var_30_0 = pg.energy_template
	local var_30_1 = arg_30_0:getEnergy()

	for iter_30_0, iter_30_1 in pairs(var_30_0) do
		if type(iter_30_0) == "number" and var_30_1 >= iter_30_1.lower_bound and var_30_1 <= iter_30_1.upper_bound then
			return iter_30_1
		end
	end

	assert(false, "疲劳配置不存在：" .. arg_30_0.energy)
end

function var_0_0.isLowEnergy(arg_31_0)
	return arg_31_0:getEnergeConfig().id < 3
end

function var_0_0.getEnergyPrint(arg_32_0)
	local var_32_0 = arg_32_0:getEnergeConfig()

	return var_32_0.icon, var_32_0.desc
end

function var_0_0.getIntimacy(arg_33_0)
	return arg_33_0.intimacy
end

function var_0_0.getCVIntimacy(arg_34_0)
	return arg_34_0:getIntimacy() / 100 + (arg_34_0.propose and 1000 or 0)
end

function var_0_0.getIntimacyMax(arg_35_0)
	if arg_35_0.propose then
		return 200
	else
		return arg_35_0:GetNoProposeIntimacyMax()
	end
end

function var_0_0.GetNoProposeIntimacyMax(arg_36_0)
	return 100
end

function var_0_0.getIntimacyIcon(arg_37_0)
	local var_37_0 = pg.intimacy_template[arg_37_0:getIntimacyLevel()]
	local var_37_1 = ""

	if arg_37_0:isMetaShip() then
		var_37_1 = "_meta"
	elseif arg_37_0:IsXIdol() then
		var_37_1 = "_imas"
	end

	if not arg_37_0.propose and math.floor(arg_37_0:getIntimacy() / 100) >= arg_37_0:getIntimacyMax() then
		return var_37_0.icon .. var_37_1, "heart" .. var_37_1
	else
		return var_37_0.icon .. var_37_1
	end
end

function var_0_0.getIntimacyDetail(arg_38_0)
	return arg_38_0:getIntimacyMax(), math.floor(arg_38_0:getIntimacy() / 100)
end

function var_0_0.getIntimacyInfo(arg_39_0)
	local var_39_0 = pg.intimacy_template[arg_39_0:getIntimacyLevel()]

	return var_39_0.icon, var_39_0.desc
end

function var_0_0.getIntimacyLevel(arg_40_0)
	local var_40_0 = 0
	local var_40_1 = pg.intimacy_template

	for iter_40_0, iter_40_1 in pairs(var_40_1) do
		if type(iter_40_0) == "number" and arg_40_0:getIntimacy() >= iter_40_1.lower_bound and arg_40_0:getIntimacy() <= iter_40_1.upper_bound then
			var_40_0 = iter_40_0

			break
		end
	end

	if var_40_0 < arg_40_0.INTIMACY_PROPOSE and arg_40_0.propose then
		var_40_0 = arg_40_0.INTIMACY_PROPOSE
	end

	return var_40_0
end

function var_0_0.getBluePrint(arg_41_0)
	local var_41_0 = ShipBluePrint.New({
		id = arg_41_0.groupId
	})
	local var_41_1 = arg_41_0.strengthList[1] or {
		exp = 0,
		level = 0
	}

	var_41_0:updateInfo({
		blue_print_level = var_41_1.level,
		exp = var_41_1.exp
	})

	return var_41_0
end

function var_0_0.getBaseList(arg_42_0)
	if arg_42_0:isBluePrintShip() then
		local var_42_0 = arg_42_0:getBluePrint()

		assert(var_42_0, "blueprint can not be nil" .. arg_42_0.configId)

		return var_42_0:getBaseList(arg_42_0)
	else
		return arg_42_0:getConfig("base_list")
	end
end

function var_0_0.getPreLoadCount(arg_43_0)
	if arg_43_0:isBluePrintShip() then
		return arg_43_0:getBluePrint():getPreLoadCount(arg_43_0)
	else
		return arg_43_0:getConfig("preload_count")
	end
end

function var_0_0.getNation(arg_44_0)
	return arg_44_0:getConfig("nationality")
end

function var_0_0.getPaintingName(arg_45_0)
	local var_45_0 = pg.ship_data_statistics[arg_45_0].skin_id
	local var_45_1 = pg.ship_skin_template[var_45_0]

	assert(var_45_1, "ship_skin_template not exist: " .. arg_45_0 .. " " .. var_45_0)

	return var_45_1.painting
end

function var_0_0.getName(arg_46_0)
	if arg_46_0.propose and pg.PushNotificationMgr.GetInstance():isEnableShipName() then
		return arg_46_0.name
	end

	if arg_46_0:isRemoulded() then
		return pg.ship_skin_template[arg_46_0:getRemouldSkinId()].name
	end

	return pg.ship_data_statistics[arg_46_0.configId].name
end

function var_0_0.GetDefaultName(arg_47_0)
	if arg_47_0:isRemoulded() then
		return pg.ship_skin_template[arg_47_0:getRemouldSkinId()].name
	else
		return pg.ship_data_statistics[arg_47_0.configId].name
	end
end

function var_0_0.getShipName(arg_48_0)
	return pg.ship_data_statistics[arg_48_0].name
end

function var_0_0.getBreakOutLevel(arg_49_0)
	assert(arg_49_0, "必须存在配置id")
	assert(pg.ship_data_statistics[arg_49_0], "必须存在配置" .. arg_49_0)

	return pg.ship_data_statistics[arg_49_0].star
end

function var_0_0.Ctor(arg_50_0, arg_50_1)
	arg_50_0.id = arg_50_1.id
	arg_50_0.configId = arg_50_1.template_id or arg_50_1.configId
	arg_50_0.level = arg_50_1.level
	arg_50_0.exp = arg_50_1.exp
	arg_50_0.energy = arg_50_1.energy
	arg_50_0.lockState = arg_50_1.is_locked
	arg_50_0.intimacy = arg_50_1.intimacy
	arg_50_0.propose = arg_50_1.propose and arg_50_1.propose > 0
	arg_50_0.proposeTime = arg_50_1.propose

	if arg_50_0.intimacy and arg_50_0.intimacy > 10000 and not arg_50_0.propose then
		arg_50_0.intimacy = 10000
	end

	arg_50_0.renameTime = arg_50_1.change_name_timestamp

	if arg_50_1.name and arg_50_1.name ~= "" then
		arg_50_0.name = arg_50_1.name
	else
		assert(pg.ship_data_statistics[arg_50_0.configId], "必须存在配置" .. arg_50_0.configId)

		arg_50_0.name = pg.ship_data_statistics[arg_50_0.configId].name
	end

	arg_50_0.bluePrintFlag = arg_50_1.blue_print_flag or 0
	arg_50_0.strengthList = {}

	for iter_50_0, iter_50_1 in ipairs(arg_50_1.strength_list or {}) do
		if not arg_50_0:isBluePrintShip() then
			local var_50_0 = ShipModAttr.ID_TO_ATTR[iter_50_1.id]

			arg_50_0.strengthList[var_50_0] = iter_50_1.exp
		else
			table.insert(arg_50_0.strengthList, {
				level = iter_50_1.id,
				exp = iter_50_1.exp
			})
		end
	end

	local var_50_1 = arg_50_1.state or {}

	arg_50_0.state = var_50_1.state or 0
	arg_50_0.state_info_1 = var_50_1.state_info_1 or 0
	arg_50_0.state_info_2 = var_50_1.state_info_2 or 0
	arg_50_0.state_info_3 = var_50_1.state_info_3 or 0
	arg_50_0.state_info_4 = var_50_1.state_info_4 or 0
	arg_50_0.equipmentSkins = {}
	arg_50_0.equipments = {}

	if arg_50_1.equip_info_list then
		for iter_50_2, iter_50_3 in ipairs(arg_50_1.equip_info_list or {}) do
			arg_50_0.equipments[iter_50_2] = iter_50_3.id > 0 and Equipment.New({
				count = 1,
				id = iter_50_3.id,
				config_id = iter_50_3.id,
				skinId = iter_50_3.skinId
			}) or false
			arg_50_0.equipmentSkins[iter_50_2] = iter_50_3.skinId > 0 and iter_50_3.skinId or 0

			arg_50_0:reletiveEquipSkin(iter_50_2)
		end
	end

	arg_50_0.spWeapon = nil

	if arg_50_1.spweapon then
		arg_50_0:UpdateSpWeapon(SpWeapon.CreateByNet(arg_50_1.spweapon))
	end

	arg_50_0.skills = {}

	for iter_50_4, iter_50_5 in ipairs(arg_50_1.skill_id_list or {}) do
		arg_50_0:updateSkill(iter_50_5)
	end

	arg_50_0.star = arg_50_0:getConfig("rarity")
	arg_50_0.transforms = {}

	for iter_50_6, iter_50_7 in ipairs(arg_50_1.transform_list or {}) do
		arg_50_0.transforms[iter_50_7.id] = {
			id = iter_50_7.id,
			level = iter_50_7.level
		}
	end

	arg_50_0.groupId = pg.ship_data_template[arg_50_0.configId].group_type
	arg_50_0.createTime = arg_50_1.create_time or 0

	local var_50_2 = getProxy(CollectionProxy)

	arg_50_0.virgin = var_50_2 and var_50_2.shipGroups[arg_50_0.groupId] == nil

	local var_50_3 = {
		pg.gameset.test_ship_config_1.key_value,
		pg.gameset.test_ship_config_2.key_value,
		pg.gameset.test_ship_config_3.key_value
	}
	local var_50_4 = table.indexof(var_50_3, arg_50_0.configId)

	if var_50_4 == 1 then
		arg_50_0.testShip = {
			2,
			3,
			4
		}
	elseif var_50_4 == 2 then
		arg_50_0.testShip = {
			5
		}
	elseif var_50_4 == 3 then
		arg_50_0.testShip = {
			6
		}
	else
		arg_50_0.testShip = nil
	end

	arg_50_0.maxIntimacy = pg.intimacy_template[#pg.intimacy_template.all].upper_bound

	local var_50_5 = 0

	if not HXSet.isHxSkin() then
		var_50_5 = arg_50_1.skin_id or 0
	end

	arg_50_0.phantomDic = {}

	arg_50_0:updateSkinId(var_50_5, 0)

	for iter_50_8, iter_50_9 in ipairs(arg_50_1.skin_shadow_list or {}) do
		arg_50_0:updateSkinId(iter_50_9.value, iter_50_9.key)
	end

	arg_50_0.noChangeSkin = arg_50_1.noChangeSkin or false
	arg_50_0.phantomRandomFlag = {}

	for iter_50_10, iter_50_11 in ipairs(arg_50_1.char_random_flag or {}) do
		arg_50_0:updateRandomFlag(1, iter_50_11)
	end

	if arg_50_1.name and arg_50_1.name ~= "" then
		arg_50_0.name = arg_50_1.name
	elseif arg_50_0:isRemoulded() then
		arg_50_0.name = pg.ship_skin_template[arg_50_0:getRemouldSkinId()].name
	else
		arg_50_0.name = pg.ship_data_statistics[arg_50_0.configId].name
	end

	arg_50_0.maxLevel = arg_50_1.max_level
	arg_50_0.proficiency = arg_50_1.proficiency or 0
	arg_50_0.preferenceTag = arg_50_1.common_flag
	arg_50_0.hpRant = 10000
	arg_50_0.strategies = {}
	arg_50_0.triggers = {}
	arg_50_0.commanderId = arg_50_1.commanderid or 0
	arg_50_0.activityNpc = arg_50_1.activity_npc or 0

	if var_0_0.isMetaShipByConfigID(arg_50_0.configId) then
		local var_50_6 = MetaCharacterConst.GetMetaShipGroupIDByConfigID(arg_50_0.configId)

		arg_50_0.metaCharacter = MetaCharacter.New({
			id = var_50_6,
			repair_attr_info = arg_50_1.meta_repair_list
		}, arg_50_0)
	end
end

function var_0_0.isMetaShipByConfigID(arg_51_0)
	local var_51_0 = pg.ship_meta_breakout.all
	local var_51_1 = var_51_0[1]
	local var_51_2 = false

	if var_51_1 <= arg_51_0 then
		for iter_51_0, iter_51_1 in ipairs(var_51_0) do
			if arg_51_0 == iter_51_1 then
				var_51_2 = true

				break
			end
		end
	end

	return var_51_2
end

function var_0_0.isMetaShip(arg_52_0)
	return arg_52_0.metaCharacter ~= nil
end

function var_0_0.getMetaCharacter(arg_53_0)
	return arg_53_0.metaCharacter
end

function var_0_0.unlockActivityNpc(arg_54_0, arg_54_1)
	arg_54_0.activityNpc = arg_54_1
end

function var_0_0.isActivityNpc(arg_55_0)
	return arg_55_0.activityNpc > 0
end

function var_0_0.getActiveEquipments(arg_56_0)
	local var_56_0 = Clone(arg_56_0.equipments)

	for iter_56_0 = #var_56_0, 1, -1 do
		local var_56_1 = var_56_0[iter_56_0]

		if var_56_1 then
			for iter_56_1 = 1, iter_56_0 - 1 do
				local var_56_2 = var_56_0[iter_56_1]

				if var_56_2 and var_56_1:getConfig("equip_limit") ~= 0 and var_56_2:getConfig("equip_limit") == var_56_1:getConfig("equip_limit") then
					var_56_0[iter_56_0] = false
				end
			end
		end
	end

	return var_56_0
end

function var_0_0.getAllEquipments(arg_57_0)
	return arg_57_0.equipments
end

function var_0_0.isBluePrintShip(arg_58_0)
	return arg_58_0.bluePrintFlag == 1
end

function var_0_0.getSkinId(arg_59_0, arg_59_1)
	local var_59_0 = arg_59_0:getPhantomSkin(arg_59_1 or 0)

	if not arg_59_0.noChangeSkin and tobool(arg_59_0.id) and ShipSkin.IsChangeSkin(var_59_0) then
		local var_59_1 = ShipSkin.GetStoreChangeSkinId(ShipSkin.GetChangeSkinGroupId(var_59_0), arg_59_0:GetShipPhantomMark())

		if var_59_1 then
			return var_59_1
		end
	end

	return var_59_0
end

function var_0_0.getPhantomSkin(arg_60_0, arg_60_1)
	if not arg_60_1 or arg_60_1 == 0 then
		return arg_60_0.skinId
	else
		return arg_60_0.phantomDic[arg_60_0.phantomId] or arg_60_0:getConfig("skin_id")
	end
end

function var_0_0.updateSkinId(arg_61_0, arg_61_1, arg_61_2)
	if not arg_61_1 or arg_61_1 == 0 then
		arg_61_1 = arg_61_0:getConfig("skin_id")
	end

	if arg_61_2 == 0 then
		arg_61_0.skinId = arg_61_1
	else
		arg_61_0.phantomDic[arg_61_2] = arg_61_1
	end
end

function var_0_0.getAllShipPhantomMarks(arg_62_0)
	local var_62_0 = getGameset("technology_shadow_num")[1]
	local var_62_1 = {}

	for iter_62_0 = 0, var_62_0 do
		if iter_62_0 == 0 or arg_62_0.phantomDic[iter_62_0] then
			table.insert(var_62_1, ShipPhantom.PackMark(arg_62_0.id, iter_62_0))
		end
	end

	return var_62_1
end

function var_0_0.getAllShipPhantom(arg_63_0)
	local var_63_0 = getGameset("technology_shadow_num")[1]
	local var_63_1 = {}

	for iter_63_0 = 0, var_63_0 do
		if iter_63_0 == 0 or arg_63_0.phantomDic[iter_63_0] then
			table.insert(var_63_1, ShipPhantom.Create(arg_63_0, iter_63_0))
		end
	end

	return var_63_1
end

function var_0_0.updateRandomFlag(arg_64_0, arg_64_1, arg_64_2)
	arg_64_2 = defaultValue(arg_64_2, 0)
	arg_64_0.phantomRandomFlag[arg_64_2] = arg_64_1
end

function var_0_0.getRandomFlag(arg_65_0, arg_65_1)
	return defaultValue(arg_65_0.phantomRandomFlag[arg_65_1 or 0], 0) > 0
end

function var_0_0.getRandomFlagShipPhantomMarks(arg_66_0)
	local var_66_0 = getGameset("technology_shadow_num")[1]
	local var_66_1 = {}

	for iter_66_0 = 0, var_66_0 do
		if defaultValue(arg_66_0.phantomRandomFlag[iter_66_0], 0) > 0 then
			table.insert(var_66_1, arg_66_0:GetShipPhantomMark(iter_66_0))
		end
	end

	return var_66_1
end

function var_0_0.updateName(arg_67_0)
	if arg_67_0.name ~= pg.ship_data_statistics[arg_67_0.configId].name then
		return
	end

	if arg_67_0:isRemoulded() then
		arg_67_0.name = pg.ship_skin_template[arg_67_0:getRemouldSkinId()].name
	else
		arg_67_0.name = pg.ship_data_statistics[arg_67_0.configId].name
	end
end

function var_0_0.isRemoulded(arg_68_0)
	if arg_68_0.remoulded then
		return true
	end

	local var_68_0 = pg.ship_data_trans[arg_68_0.groupId]

	if var_68_0 then
		for iter_68_0, iter_68_1 in ipairs(var_68_0.transform_list) do
			for iter_68_2, iter_68_3 in ipairs(iter_68_1) do
				local var_68_1 = pg.transform_data_template[iter_68_3[2]]

				if var_68_1.skin_id ~= 0 and arg_68_0.transforms[iter_68_3[2]] and arg_68_0.transforms[iter_68_3[2]].level == var_68_1.max_level then
					return true
				end
			end
		end
	end

	return false
end

function var_0_0.getRemouldSkinId(arg_69_0)
	local var_69_0 = ShipGroup.getModSkin(arg_69_0.groupId)

	if var_69_0 then
		return var_69_0.id
	end

	return nil
end

function var_0_0.hasEquipmentSkinInPos(arg_70_0, arg_70_1)
	local var_70_0 = arg_70_0.equipments[arg_70_1]

	return var_70_0 and var_70_0:hasSkin()
end

function var_0_0.getPrefab(arg_71_0, arg_71_1)
	local var_71_0 = arg_71_0:getSkinId()

	if arg_71_0:hasEquipmentSkinInPos(var_0_2) then
		local var_71_1 = arg_71_0:getEquip(var_0_2)
		local var_71_2 = var_0_7[var_71_1:getSkinId()].ship_skin_id

		var_71_0 = var_71_2 ~= 0 and var_71_2 or var_71_0
	end

	local var_71_3 = pg.ship_skin_template[var_71_0]

	assert(var_71_3, "ship_skin_template not exist: " .. arg_71_0.configId .. " " .. var_71_0)

	if var_71_3.double_char and var_71_3.double_char == 1 and arg_71_1 ~= nil then
		local var_71_4

		if arg_71_1 == 1 then
			return var_71_3.prefab .. "_L"
		elseif arg_71_1 == 2 then
			return var_71_3.prefab .. "_R"
		end
	end

	return var_71_3.prefab
end

function var_0_0.IsDoubleSkin(arg_72_0)
	local var_72_0 = arg_72_0:getSkinId()
	local var_72_1 = pg.ship_skin_template[var_72_0]

	assert(var_72_1, "ship_skin_template not exist: " .. arg_72_0.configId .. " " .. var_72_0)

	return var_72_1.double_char and var_72_1.double_char == 1 or false
end

function var_0_0.getAttachmentPrefab(arg_73_0)
	local var_73_0 = {}

	for iter_73_0, iter_73_1 in ipairs(arg_73_0.equipments) do
		if iter_73_1 and iter_73_1:hasSkinOrbit() then
			local var_73_1 = iter_73_1:getSkinId()
			local var_73_2 = var_0_7[var_73_1]

			var_73_0[var_73_1] = {
				config = var_73_2,
				index = iter_73_0
			}
		end
	end

	return var_73_0
end

function var_0_0.getPainting(arg_74_0)
	local var_74_0 = arg_74_0:getSkinId()
	local var_74_1 = pg.ship_skin_template[var_74_0]

	assert(var_74_1, "ship_skin_template not exist: " .. arg_74_0.configId .. " " .. var_74_0)

	return var_74_1.painting
end

function var_0_0.GetSkinConfig(arg_75_0, arg_75_1)
	local var_75_0 = arg_75_0:getSkinId()
	local var_75_1 = pg.ship_skin_template[var_75_0]

	assert(var_75_1, "ship_skin_template not exist: " .. arg_75_0.configId .. " " .. var_75_0)

	return var_75_1
end

function var_0_0.getRemouldPainting(arg_76_0)
	local var_76_0 = arg_76_0:getRemouldSkinId()
	local var_76_1 = pg.ship_skin_template[var_76_0]

	assert(var_76_1, "ship_skin_template not exist: " .. arg_76_0.configId .. " " .. var_76_0)

	return var_76_1.painting
end

function var_0_0.updateStateInfo34(arg_77_0, arg_77_1, arg_77_2)
	arg_77_0.state_info_3 = arg_77_1
	arg_77_0.state_info_4 = arg_77_2
end

function var_0_0.hasStateInfo3Or4(arg_78_0)
	return arg_78_0.state_info_3 ~= 0 or arg_78_0.state_info_4 ~= 0
end

function var_0_0.isTestShip(arg_79_0)
	return arg_79_0.testShip
end

function var_0_0.canUseTestShip(arg_80_0, arg_80_1)
	assert(arg_80_0.testShip, "ship is not TestShip")

	return table.contains(arg_80_0.testShip, arg_80_1)
end

function var_0_0.updateEquip(arg_81_0, arg_81_1, arg_81_2)
	assert(arg_81_2 == nil or arg_81_2.count == 1)

	local var_81_0 = arg_81_0.equipments[arg_81_1]

	arg_81_0.equipments[arg_81_1] = arg_81_2 and Clone(arg_81_2) or false

	local function var_81_1(arg_82_0)
		arg_82_0 = CreateShell(arg_82_0)
		arg_82_0.shipId = arg_81_0.id
		arg_82_0.shipPos = arg_81_1

		return arg_82_0
	end

	if var_81_0 then
		getProxy(EquipmentProxy):OnShipEquipsRemove(var_81_0, arg_81_0.id, arg_81_1)
		var_81_0:setSkinId(0)
		pg.m02:sendNotification(BayProxy.SHIP_EQUIPMENT_REMOVED, var_81_1(var_81_0))
	end

	if arg_81_2 then
		getProxy(EquipmentProxy):OnShipEquipsAdd(arg_81_2, arg_81_0.id, arg_81_1)
		arg_81_0:reletiveEquipSkin(arg_81_1)
		pg.m02:sendNotification(BayProxy.SHIP_EQUIPMENT_ADDED, var_81_1(arg_81_2))
	end
end

function var_0_0.reletiveEquipSkin(arg_83_0, arg_83_1)
	if arg_83_0.equipments[arg_83_1] and arg_83_0.equipmentSkins[arg_83_1] ~= 0 then
		local var_83_0 = pg.equip_skin_template[arg_83_0.equipmentSkins[arg_83_1]].equip_type
		local var_83_1 = arg_83_0.equipments[arg_83_1]:getType()

		if table.contains(var_83_0, var_83_1) then
			arg_83_0.equipments[arg_83_1]:setSkinId(arg_83_0.equipmentSkins[arg_83_1])
		else
			arg_83_0.equipments[arg_83_1]:setSkinId(0)
		end
	elseif arg_83_0.equipments[arg_83_1] then
		arg_83_0.equipments[arg_83_1]:setSkinId(0)
	end
end

function var_0_0.updateEquipmentSkin(arg_84_0, arg_84_1, arg_84_2)
	if not arg_84_1 then
		return
	end

	if arg_84_2 and arg_84_2 > 0 then
		local var_84_0 = arg_84_0:getSkinTypes(arg_84_1)
		local var_84_1 = pg.equip_skin_template[arg_84_2].equip_type
		local var_84_2 = false

		for iter_84_0, iter_84_1 in ipairs(var_84_0) do
			for iter_84_2, iter_84_3 in ipairs(var_84_1) do
				if iter_84_1 == iter_84_3 then
					var_84_2 = true

					break
				end
			end
		end

		if not var_84_2 then
			assert(var_84_2, "部位" .. arg_84_1 .. " 无法穿戴皮肤 " .. arg_84_2)

			return
		end

		local var_84_3 = arg_84_0.equipments[arg_84_1] and arg_84_0.equipments[arg_84_1]:getType() or false

		arg_84_0.equipmentSkins[arg_84_1] = arg_84_2

		if var_84_3 and table.contains(var_84_1, var_84_3) then
			arg_84_0.equipments[arg_84_1]:setSkinId(arg_84_0.equipmentSkins[arg_84_1])
		elseif var_84_3 and not table.contains(var_84_1, var_84_3) then
			arg_84_0.equipments[arg_84_1]:setSkinId(0)
		end
	else
		arg_84_0.equipmentSkins[arg_84_1] = 0

		if arg_84_0.equipments[arg_84_1] then
			arg_84_0.equipments[arg_84_1]:setSkinId(0)
		end
	end
end

function var_0_0.getEquip(arg_85_0, arg_85_1)
	return Clone(arg_85_0.equipments[arg_85_1])
end

function var_0_0.getEquipSkins(arg_86_0)
	return Clone(arg_86_0.equipmentSkins)
end

function var_0_0.getEquipSkin(arg_87_0, arg_87_1)
	return arg_87_0.equipmentSkins[arg_87_1]
end

function var_0_0.getCanEquipSkin(arg_88_0, arg_88_1)
	local var_88_0 = arg_88_0:getSkinTypes(arg_88_1)

	if var_88_0 and #var_88_0 then
		for iter_88_0, iter_88_1 in ipairs(var_88_0) do
			if pg.equip_data_by_type[iter_88_1].equip_skin == 1 then
				return true
			end
		end
	end

	return false
end

function var_0_0.checkCanEquipSkin(arg_89_0, arg_89_1, arg_89_2)
	if not arg_89_1 or not arg_89_2 then
		return
	end

	local var_89_0 = arg_89_0:getSkinTypes(arg_89_1)
	local var_89_1 = pg.equip_skin_template[arg_89_2].equip_type

	for iter_89_0, iter_89_1 in ipairs(var_89_0) do
		if table.contains(var_89_1, iter_89_1) then
			return true
		end
	end

	return false
end

function var_0_0.getSkinTypes(arg_90_0, arg_90_1)
	return pg.ship_data_template[arg_90_0.configId]["equip_" .. arg_90_1] or {}
end

function var_0_0.updateState(arg_91_0, arg_91_1)
	arg_91_0.state = arg_91_1
end

function var_0_0.addSkillExp(arg_92_0, arg_92_1, arg_92_2)
	local var_92_0 = arg_92_0.skills[arg_92_1] or {
		exp = 0,
		level = 1,
		id = arg_92_1
	}
	local var_92_1 = var_92_0.level and var_92_0.level or 1
	local var_92_2 = pg.skill_need_exp.all[#pg.skill_need_exp.all]

	if var_92_1 == var_92_2 then
		return
	end

	local var_92_3 = var_92_0.exp and arg_92_2 + var_92_0.exp or 0 + arg_92_2

	while var_92_3 >= pg.skill_need_exp[var_92_1].exp do
		var_92_3 = var_92_3 - pg.skill_need_exp[var_92_1].exp
		var_92_1 = var_92_1 + 1

		if var_92_1 == var_92_2 then
			var_92_3 = 0

			break
		end
	end

	arg_92_0:updateSkill({
		id = var_92_0.id,
		level = var_92_1,
		exp = var_92_3
	})
end

function var_0_0.upSkillLevelForMeta(arg_93_0, arg_93_1)
	local var_93_0 = arg_93_0.skills[arg_93_1] or {
		exp = 0,
		level = 0,
		id = arg_93_1
	}
	local var_93_1 = arg_93_0:isSkillLevelMax(arg_93_1)
	local var_93_2 = var_93_0.level

	if not var_93_1 then
		var_93_2 = var_93_2 + 1
	end

	arg_93_0:updateSkill({
		exp = 0,
		id = var_93_0.id,
		level = var_93_2
	})
end

function var_0_0.getMetaSkillLevelBySkillID(arg_94_0, arg_94_1)
	return (arg_94_0.skills[arg_94_1] or {
		exp = 0,
		level = 0,
		id = arg_94_1
	}).level
end

function var_0_0.isSkillLevelMax(arg_95_0, arg_95_1)
	local var_95_0 = arg_95_0.skills[arg_95_1] or {
		exp = 0,
		level = 1,
		id = arg_95_1
	}

	return (var_95_0.level and var_95_0.level or 1) >= pg.skill_data_template[arg_95_1].max_level
end

function var_0_0.isAllMetaSkillLevelMax(arg_96_0)
	local var_96_0 = true
	local var_96_1 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(arg_96_0.configId)

	for iter_96_0, iter_96_1 in ipairs(var_96_1) do
		if not arg_96_0:isSkillLevelMax(iter_96_1) then
			var_96_0 = false

			break
		end
	end

	return var_96_0
end

function var_0_0.isAllMetaSkillLock(arg_97_0)
	local var_97_0 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(arg_97_0.configId)
	local var_97_1 = true

	for iter_97_0, iter_97_1 in ipairs(var_97_0) do
		if arg_97_0:getMetaSkillLevelBySkillID(iter_97_1) > 0 then
			var_97_1 = false

			break
		end
	end

	return var_97_1
end

function var_0_0.bindConfigTable(arg_98_0)
	return pg.ship_data_statistics
end

function var_0_0.isAvaiable(arg_99_0)
	return true
end

var_0_0.PROPERTIES = {
	AttributeType.Durability,
	AttributeType.Cannon,
	AttributeType.Torpedo,
	AttributeType.AntiAircraft,
	AttributeType.Air,
	AttributeType.Reload,
	AttributeType.Armor,
	AttributeType.Hit,
	AttributeType.Dodge,
	AttributeType.Speed,
	AttributeType.Luck,
	AttributeType.AntiSub
}
var_0_0.PROPERTIES_ENHANCEMENT = {
	AttributeType.Durability,
	AttributeType.Cannon,
	AttributeType.Torpedo,
	AttributeType.AntiAircraft,
	AttributeType.Air,
	AttributeType.Reload,
	AttributeType.Hit,
	AttributeType.Dodge,
	AttributeType.Speed,
	AttributeType.Luck,
	AttributeType.AntiSub
}
var_0_0.DIVE_PROPERTIES = {
	AttributeType.OxyMax,
	AttributeType.OxyCost,
	AttributeType.OxyRecovery,
	AttributeType.OxyRecoveryBench,
	AttributeType.OxyRecoverySurface,
	AttributeType.OxyAttackDuration,
	AttributeType.OxyRaidDistance
}
var_0_0.SONAR_PROPERTIES = {
	AttributeType.SonarRange
}

function var_0_0.intimacyAdditions(arg_100_0, arg_100_1)
	local var_100_0 = pg.intimacy_template[arg_100_0:getIntimacyLevel()].attr_bonus * 0.0001

	for iter_100_0, iter_100_1 in pairs(arg_100_1) do
		if iter_100_0 == AttributeType.Durability or iter_100_0 == AttributeType.Cannon or iter_100_0 == AttributeType.Torpedo or iter_100_0 == AttributeType.AntiAircraft or iter_100_0 == AttributeType.AntiSub or iter_100_0 == AttributeType.Air or iter_100_0 == AttributeType.Reload or iter_100_0 == AttributeType.Hit or iter_100_0 == AttributeType.Dodge then
			arg_100_1[iter_100_0] = arg_100_1[iter_100_0] * (var_100_0 + 1)
		end
	end
end

function var_0_0.getShipProperties(arg_101_0)
	local var_101_0 = arg_101_0:getBaseProperties()

	if arg_101_0:isBluePrintShip() then
		local var_101_1 = arg_101_0:getBluePrint()

		assert(var_101_1, "blueprint can not be nil" .. arg_101_0.configId)

		local var_101_2 = var_101_1:getTotalAdditions()

		for iter_101_0, iter_101_1 in pairs(var_101_2) do
			var_101_0[iter_101_0] = var_101_0[iter_101_0] + calcFloor(iter_101_1)
		end

		arg_101_0:intimacyAdditions(var_101_0)
	elseif arg_101_0:isMetaShip() then
		assert(arg_101_0.metaCharacter)

		for iter_101_2, iter_101_3 in pairs(var_101_0) do
			var_101_0[iter_101_2] = var_101_0[iter_101_2] + arg_101_0.metaCharacter:getAttrAddition(iter_101_2)
		end

		arg_101_0:intimacyAdditions(var_101_0)
	else
		local var_101_3 = pg.ship_data_template[arg_101_0.configId].strengthen_id
		local var_101_4 = var_0_5[var_101_3]

		for iter_101_4, iter_101_5 in pairs(arg_101_0.strengthList) do
			local var_101_5 = ShipModAttr.ATTR_TO_INDEX[iter_101_4]
			local var_101_6 = math.min(iter_101_5, var_101_4.durability[var_101_5] * var_101_4.level_exp[var_101_5])
			local var_101_7 = math.max(arg_101_0:getModExpRatio(iter_101_4), 1)

			var_101_0[iter_101_4] = var_101_0[iter_101_4] + calcFloor(var_101_6 / var_101_7)
		end

		arg_101_0:intimacyAdditions(var_101_0)

		for iter_101_6, iter_101_7 in pairs(arg_101_0.transforms) do
			local var_101_8 = pg.transform_data_template[iter_101_7.id].effect

			for iter_101_8 = 1, iter_101_7.level do
				local var_101_9 = var_101_8[iter_101_8] or {}

				for iter_101_9, iter_101_10 in pairs(var_101_0) do
					if var_101_9[iter_101_9] then
						var_101_0[iter_101_9] = var_101_0[iter_101_9] + var_101_9[iter_101_9]
					end
				end
			end
		end
	end

	return var_101_0
end

function var_0_0.getTechNationAddition(arg_102_0, arg_102_1)
	local var_102_0 = getProxy(TechnologyNationProxy)
	local var_102_1 = arg_102_0:getConfig("type")

	if var_102_1 == ShipType.DaoQuV or var_102_1 == ShipType.DaoQuM then
		var_102_1 = ShipType.QuZhu
	end

	return var_102_0:getShipAddition(var_102_1, arg_102_1)
end

function var_0_0.getTechNationMaxAddition(arg_103_0, arg_103_1)
	local var_103_0 = getProxy(TechnologyNationProxy)
	local var_103_1 = arg_103_0:getConfig("type")

	return var_103_0:getShipMaxAddition(var_103_1, arg_103_1)
end

function var_0_0.getEquipProficiencyByPos(arg_104_0, arg_104_1)
	return arg_104_0:getEquipProficiencyList()[arg_104_1]
end

function var_0_0.getEquipProficiencyList(arg_105_0)
	local var_105_0 = arg_105_0:getConfigTable()
	local var_105_1 = Clone(var_105_0.equipment_proficiency)

	if arg_105_0:isBluePrintShip() then
		local var_105_2 = arg_105_0:getBluePrint()

		assert(var_105_2, "blueprint can not be nil >>>" .. arg_105_0.groupId)

		var_105_1 = var_105_2:getEquipProficiencyList(arg_105_0)
	else
		for iter_105_0, iter_105_1 in ipairs(var_105_1) do
			local var_105_3 = 0

			for iter_105_2, iter_105_3 in pairs(arg_105_0.transforms) do
				local var_105_4 = pg.transform_data_template[iter_105_3.id].effect

				for iter_105_4 = 1, iter_105_3.level do
					local var_105_5 = var_105_4[iter_105_4] or {}

					if var_105_5["equipment_proficiency_" .. iter_105_0] then
						var_105_3 = var_105_3 + var_105_5["equipment_proficiency_" .. iter_105_0]
					end
				end
			end

			var_105_1[iter_105_0] = iter_105_1 + var_105_3
		end
	end

	return var_105_1
end

function var_0_0.getBaseProperties(arg_106_0)
	local var_106_0 = arg_106_0:getConfigTable()

	assert(var_106_0, "配置表没有这艘船" .. arg_106_0.configId)

	local var_106_1 = {}
	local var_106_2 = {}

	for iter_106_0, iter_106_1 in ipairs(var_0_0.PROPERTIES) do
		var_106_1[iter_106_1] = arg_106_0:getGrowthForAttr(iter_106_1)
		var_106_2[iter_106_1] = var_106_1[iter_106_1]
	end

	for iter_106_2, iter_106_3 in ipairs(arg_106_0:getConfig("lock")) do
		var_106_2[iter_106_3] = var_106_1[iter_106_3]
	end

	for iter_106_4, iter_106_5 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_106_2[iter_106_5] = var_106_0[iter_106_5]
	end

	for iter_106_6, iter_106_7 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_106_2[iter_106_7] = 0
	end

	return var_106_2
end

function var_0_0.getGrowthForAttr(arg_107_0, arg_107_1)
	local var_107_0 = arg_107_0:getConfigTable()
	local var_107_1 = table.indexof(var_0_0.PROPERTIES, arg_107_1)
	local var_107_2 = pg.gameset.extra_attr_level_limit.key_value
	local var_107_3 = var_107_0.attrs[var_107_1] + (arg_107_0.level - 1) * var_107_0.attrs_growth[var_107_1] / 1000

	if var_107_2 < arg_107_0.level then
		var_107_3 = var_107_3 + (arg_107_0.level - var_107_2) * var_107_0.attrs_growth_extra[var_107_1] / 1000
	end

	return var_107_3
end

function var_0_0.isMaxStar(arg_108_0)
	return arg_108_0:getStar() >= arg_108_0:getMaxStar()
end

function var_0_0.IsMaxStarByTmpID(arg_109_0)
	local var_109_0 = pg.ship_data_template[arg_109_0]

	return var_109_0.star >= var_109_0.star_max
end

function var_0_0.IsSpweaponUnlock(arg_110_0)
	if not arg_110_0:CanAccumulateExp() then
		return false, "spweapon_tip_locked"
	else
		return true
	end
end

function var_0_0.getModProperties(arg_111_0, arg_111_1)
	return arg_111_0.strengthList[arg_111_1] or 0
end

function var_0_0.addModAttrExp(arg_112_0, arg_112_1, arg_112_2)
	local var_112_0 = arg_112_0:getModAttrTopLimit(arg_112_1)

	if var_112_0 == 0 then
		return
	end

	local var_112_1 = arg_112_0:getModExpRatio(arg_112_1)
	local var_112_2 = arg_112_0:getModProperties(arg_112_1)

	if var_112_2 + arg_112_2 > var_112_0 * var_112_1 then
		arg_112_0.strengthList[arg_112_1] = var_112_0 * var_112_1
	else
		arg_112_0.strengthList[arg_112_1] = var_112_2 + arg_112_2
	end
end

function var_0_0.getNeedModExp(arg_113_0)
	local var_113_0 = {}

	for iter_113_0, iter_113_1 in pairs(ShipModAttr.ID_TO_ATTR) do
		local var_113_1 = arg_113_0:getModAttrTopLimit(iter_113_1)

		if var_113_1 == 0 then
			var_113_0[iter_113_1] = 0
		else
			var_113_0[iter_113_1] = var_113_1 * arg_113_0:getModExpRatio(iter_113_1) - arg_113_0:getModProperties(iter_113_1)
		end
	end

	return var_113_0
end

function var_0_0.attrVertify(arg_114_0)
	if not BayProxy.checkShiplevelVertify(arg_114_0) then
		return false
	end

	for iter_114_0, iter_114_1 in ipairs(arg_114_0.equipments) do
		if iter_114_1 and not iter_114_1:vertify() then
			return false
		end
	end

	return true
end

function var_0_0.getEquipmentProperties(arg_115_0)
	local var_115_0 = {}
	local var_115_1 = {}

	for iter_115_0, iter_115_1 in ipairs(var_0_0.PROPERTIES) do
		var_115_0[iter_115_1] = 0
	end

	for iter_115_2, iter_115_3 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_115_0[iter_115_3] = 0
	end

	for iter_115_4, iter_115_5 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_115_0[iter_115_5] = 0
	end

	for iter_115_6, iter_115_7 in ipairs(var_0_0.PROPERTIES_ENHANCEMENT) do
		var_115_1[iter_115_7] = 0
	end

	var_115_0[AttributeType.AirDominate] = 0
	var_115_0[AttributeType.AntiSiren] = 0

	local var_115_2 = arg_115_0:getActiveEquipments()

	for iter_115_8, iter_115_9 in ipairs(var_115_2) do
		if iter_115_9 then
			local var_115_3 = iter_115_9:GetAttributes()

			for iter_115_10, iter_115_11 in ipairs(var_115_3) do
				if iter_115_11 and var_115_0[iter_115_11.type] then
					var_115_0[iter_115_11.type] = var_115_0[iter_115_11.type] + iter_115_11.value
				end
			end

			local var_115_4 = iter_115_9:GetPropertyRate()

			for iter_115_12, iter_115_13 in pairs(var_115_4) do
				var_115_1[iter_115_12] = math.max(var_115_1[iter_115_12], iter_115_13)
			end

			local var_115_5 = iter_115_9:GetSonarProperty()

			if var_115_5 then
				for iter_115_14, iter_115_15 in pairs(var_115_5) do
					var_115_0[iter_115_14] = var_115_0[iter_115_14] + iter_115_15
				end
			end

			local var_115_6 = iter_115_9:GetAntiSirenPower()

			if var_115_6 then
				var_115_0[AttributeType.AntiSiren] = var_115_0[AttributeType.AntiSiren] + var_115_6 / 10000
			end
		end
	end

	;(function()
		local var_116_0 = arg_115_0:GetSpWeapon()

		if not var_116_0 then
			return
		end

		local var_116_1 = var_116_0:GetPropertiesInfo().attrs

		for iter_116_0, iter_116_1 in ipairs(var_116_1) do
			if iter_116_1 and var_115_0[iter_116_1.type] then
				var_115_0[iter_116_1.type] = var_115_0[iter_116_1.type] + iter_116_1.value
			end
		end
	end)()

	for iter_115_16, iter_115_17 in pairs(var_115_1) do
		var_115_1[iter_115_16] = iter_115_17 + 1
	end

	return var_115_0, var_115_1
end

function var_0_0.getSkillEffects(arg_117_0)
	local var_117_0 = arg_117_0:getShipSkillEffects()

	_.each(arg_117_0:getEquipmentSkillEffects(), function(arg_118_0)
		table.insert(var_117_0, arg_118_0)
	end)

	return var_117_0
end

function var_0_0.getShipSkillEffects(arg_119_0)
	local var_119_0 = {}
	local var_119_1 = arg_119_0:getSkillList()

	for iter_119_0, iter_119_1 in ipairs(var_119_1) do
		local var_119_2 = arg_119_0:RemapSkillId(iter_119_1)
		local var_119_3 = pg.buffCfg["buff_" .. var_119_2]

		arg_119_0:FilterActiveSkill(var_119_0, var_119_3, arg_119_0.skills[iter_119_1])
	end

	return var_119_0
end

function var_0_0.getEquipmentSkillEffects(arg_120_0)
	local var_120_0 = {}
	local var_120_1 = arg_120_0:getActiveEquipments()

	for iter_120_0, iter_120_1 in ipairs(var_120_1) do
		local var_120_2
		local var_120_3 = iter_120_1 and iter_120_1:getConfig("skill_id")[1] and iter_120_1:getConfig("skill_id")[1][1]

		if var_120_3 then
			var_120_2 = pg.buffCfg["buff_" .. var_120_3]
		end

		arg_120_0:FilterActiveSkill(var_120_0, var_120_2)
	end

	;(function()
		local var_121_0 = arg_120_0:GetSpWeapon()
		local var_121_1 = var_121_0 and var_121_0:GetEffect() or 0
		local var_121_2

		if var_121_1 > 0 then
			var_121_2 = pg.buffCfg["buff_" .. var_121_1]
		end

		arg_120_0:FilterActiveSkill(var_120_0, var_121_2)
	end)()

	return var_120_0
end

function var_0_0.FilterActiveSkill(arg_122_0, arg_122_1, arg_122_2, arg_122_3)
	if not arg_122_2 or not arg_122_2.const_effect_list then
		return
	end

	for iter_122_0 = 1, #arg_122_2.const_effect_list do
		local var_122_0 = arg_122_2.const_effect_list[iter_122_0]
		local var_122_1 = var_122_0.trigger
		local var_122_2 = var_122_0.arg_list
		local var_122_3 = 1

		if arg_122_3 then
			var_122_3 = arg_122_3.level

			local var_122_4 = arg_122_2[var_122_3].const_effect_list

			if var_122_4 and var_122_4[iter_122_0] then
				var_122_1 = var_122_4[iter_122_0].trigger or var_122_1
				var_122_2 = var_122_4[iter_122_0].arg_list or var_122_2
			end
		end

		local var_122_5 = true

		for iter_122_1, iter_122_2 in pairs(var_122_1) do
			if arg_122_0.triggers[iter_122_1] ~= iter_122_2 then
				var_122_5 = false

				break
			end
		end

		if var_122_5 then
			table.insert(arg_122_1, {
				type = var_122_0.type,
				arg_list = var_122_2,
				level = var_122_3
			})
		end
	end
end

function var_0_0.getEquipmentGearScore(arg_123_0)
	local var_123_0 = 0
	local var_123_1 = arg_123_0:getActiveEquipments()

	for iter_123_0, iter_123_1 in ipairs(var_123_1) do
		if iter_123_1 then
			var_123_0 = var_123_0 + iter_123_1:GetGearScore()
		end
	end

	return var_123_0
end

function var_0_0.getProperties(arg_124_0, arg_124_1, arg_124_2, arg_124_3, arg_124_4)
	local var_124_0 = arg_124_1 or {}
	local var_124_1 = arg_124_0:getConfig("nationality")
	local var_124_2 = arg_124_0:getConfig("type")
	local var_124_3 = arg_124_0:getShipProperties()
	local var_124_4, var_124_5 = arg_124_0:getEquipmentProperties()
	local var_124_6
	local var_124_7
	local var_124_8

	if arg_124_3 and arg_124_0:getFlag("inWorld") then
		local var_124_9 = WorldConst.FetchWorldShip(arg_124_0.id)

		var_124_6, var_124_7 = var_124_9:GetShipBuffProperties()
		var_124_8 = var_124_9:GetShipPowerBuffProperties()
	end

	for iter_124_0, iter_124_1 in ipairs(var_0_0.PROPERTIES) do
		local var_124_10 = 0
		local var_124_11 = 0

		for iter_124_2, iter_124_3 in pairs(var_124_0) do
			var_124_10 = var_124_10 + iter_124_3:getAttrRatioAddition(iter_124_1, var_124_1, var_124_2) / 100
			var_124_11 = var_124_11 + iter_124_3:getAttrValueAddition(iter_124_1, var_124_1, var_124_2)
		end

		local var_124_12 = var_124_10 + (var_124_5[iter_124_1] or 1)
		local var_124_13 = var_124_7 and var_124_7[iter_124_1] or 1
		local var_124_14 = var_124_6 and var_124_6[iter_124_1] or 0

		if iter_124_1 == AttributeType.Speed then
			var_124_3[iter_124_1] = var_124_3[iter_124_1] * var_124_12 * var_124_13 + var_124_11 + var_124_4[iter_124_1] + var_124_14
		else
			var_124_3[iter_124_1] = calcFloor(calcFloor(var_124_3[iter_124_1]) * var_124_12 * var_124_13) + var_124_11 + var_124_4[iter_124_1] + var_124_14
		end
	end

	if not arg_124_2 and arg_124_0:isMaxStar() then
		for iter_124_4, iter_124_5 in pairs(var_124_3) do
			local var_124_15 = arg_124_4 and arg_124_0:getTechNationMaxAddition(iter_124_4) or arg_124_0:getTechNationAddition(iter_124_4)

			var_124_3[iter_124_4] = var_124_3[iter_124_4] + var_124_15
		end
	end

	for iter_124_6, iter_124_7 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_124_3[iter_124_7] = var_124_3[iter_124_7] + var_124_4[iter_124_7]
	end

	for iter_124_8, iter_124_9 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_124_3[iter_124_9] = var_124_3[iter_124_9] + var_124_4[iter_124_9]
	end

	if arg_124_3 then
		var_124_3[AttributeType.AntiSiren] = (var_124_3[AttributeType.AntiSiren] or 0) + var_124_4[AttributeType.AntiSiren]
	end

	if var_124_8 then
		for iter_124_10, iter_124_11 in pairs(var_124_8) do
			if var_124_3[iter_124_10] then
				if iter_124_10 == AttributeType.Speed then
					var_124_3[iter_124_10] = var_124_3[iter_124_10] * iter_124_11
				else
					var_124_3[iter_124_10] = math.floor(var_124_3[iter_124_10] * iter_124_11)
				end
			end
		end
	end

	return var_124_3
end

function var_0_0.getTransGearScore(arg_125_0)
	local var_125_0 = 0
	local var_125_1 = pg.transform_data_template

	for iter_125_0, iter_125_1 in pairs(arg_125_0.transforms) do
		for iter_125_2 = 1, iter_125_1.level do
			var_125_0 = var_125_0 + (var_125_1[iter_125_1.id].gear_score[iter_125_2] or 0)
		end
	end

	return var_125_0
end

function var_0_0.getShipCombatPower(arg_126_0, arg_126_1)
	local var_126_0 = arg_126_0:getProperties(arg_126_1, nil, nil, true)
	local var_126_1 = var_126_0[AttributeType.Durability] / 5 + var_126_0[AttributeType.Cannon] + var_126_0[AttributeType.Torpedo] + var_126_0[AttributeType.AntiAircraft] + var_126_0[AttributeType.Air] + var_126_0[AttributeType.AntiSub] + var_126_0[AttributeType.Reload] + var_126_0[AttributeType.Hit] * 2 + var_126_0[AttributeType.Dodge] * 2 + var_126_0[AttributeType.Speed] + arg_126_0:getEquipmentGearScore() + arg_126_0:getTransGearScore()

	return math.floor(var_126_1)
end

function var_0_0.cosumeEnergy(arg_127_0, arg_127_1)
	arg_127_0:setEnergy(math.max(arg_127_0:getEnergy() - arg_127_1, 0))
end

function var_0_0.addEnergy(arg_128_0, arg_128_1)
	arg_128_0:setEnergy(arg_128_0:getEnergy() + arg_128_1)
end

function var_0_0.setEnergy(arg_129_0, arg_129_1)
	arg_129_0.energy = arg_129_1
end

function var_0_0.setLikability(arg_130_0, arg_130_1)
	assert(arg_130_1 >= 0 and arg_130_1 <= arg_130_0.maxIntimacy, "intimacy value invaild" .. arg_130_1)
	arg_130_0:setIntimacy(arg_130_1)
end

function var_0_0.addLikability(arg_131_0, arg_131_1)
	local var_131_0 = Mathf.Clamp(arg_131_0:getIntimacy() + arg_131_1, 0, arg_131_0.maxIntimacy)

	arg_131_0:setIntimacy(var_131_0)
end

function var_0_0.setIntimacy(arg_132_0, arg_132_1)
	if arg_132_1 > 10000 and not arg_132_0.propose then
		arg_132_1 = 10000
	end

	arg_132_0.intimacy = arg_132_1

	if not arg_132_0:isActivityNpc() then
		getProxy(CollectionProxy).shipGroups[arg_132_0.groupId]:updateMaxIntimacy(arg_132_0:getIntimacy())
	end
end

function var_0_0.getLevelExpConfig(arg_133_0, arg_133_1)
	if arg_133_0:getConfig("rarity") == ShipRarity.SSR then
		local var_133_0 = Clone(getConfigFromLevel1(var_0_6, arg_133_1 or arg_133_0.level))

		var_133_0.exp = var_133_0.exp_ur
		var_133_0.exp_start = var_133_0.exp_ur_start
		var_133_0.exp_interval = var_133_0.exp_ur_interval
		var_133_0.exp_end = var_133_0.exp_ur_end

		return var_133_0
	else
		return getConfigFromLevel1(var_0_6, arg_133_1 or arg_133_0.level)
	end
end

function var_0_0.getExp(arg_134_0)
	local var_134_0 = arg_134_0:getMaxLevel()

	if arg_134_0.level == var_134_0 and LOCK_FULL_EXP then
		return 0
	end

	return arg_134_0.exp
end

function var_0_0.getProficiency(arg_135_0)
	return arg_135_0.proficiency
end

function var_0_0.addExp(arg_136_0, arg_136_1, arg_136_2)
	local var_136_0 = arg_136_0:getMaxLevel()

	if arg_136_0.level == var_136_0 then
		if arg_136_0.exp >= pg.gameset.exp_overflow_max.key_value then
			return
		end

		if LOCK_FULL_EXP or not arg_136_2 or not arg_136_0:CanAccumulateExp() then
			arg_136_1 = 0
		end
	end

	arg_136_0.exp = arg_136_0.exp + arg_136_1

	local var_136_1 = false

	while arg_136_0:canLevelUp() do
		arg_136_0.exp = arg_136_0.exp - arg_136_0:getLevelExpConfig().exp_interval
		arg_136_0.level = math.min(arg_136_0.level + 1, var_136_0)
		var_136_1 = true
	end

	if arg_136_0.level == var_136_0 then
		if arg_136_2 and arg_136_0:CanAccumulateExp() then
			arg_136_0.exp = math.min(arg_136_0.exp, pg.gameset.exp_overflow_max.key_value)
		elseif var_136_1 then
			arg_136_0.exp = 0
		end
	end
end

function var_0_0.getMaxLevel(arg_137_0)
	return arg_137_0.maxLevel
end

function var_0_0.canLevelUp(arg_138_0)
	local var_138_0 = arg_138_0:getLevelExpConfig(arg_138_0.level + 1)
	local var_138_1 = arg_138_0:getMaxLevel() <= arg_138_0.level

	return var_138_0 and arg_138_0:getLevelExpConfig().exp_interval <= arg_138_0.exp and not var_138_1
end

function var_0_0.getConfigMaxLevel(arg_139_0)
	return var_0_6.all[#var_0_6.all]
end

function var_0_0.isConfigMaxLevel(arg_140_0)
	return arg_140_0.level == arg_140_0:getConfigMaxLevel()
end

function var_0_0.updateMaxLevel(arg_141_0, arg_141_1)
	local var_141_0 = arg_141_0:getConfigMaxLevel()

	arg_141_0.maxLevel = math.max(math.min(var_141_0, arg_141_1), arg_141_0.maxLevel)
end

function var_0_0.getNextMaxLevel(arg_142_0)
	local var_142_0 = arg_142_0:getConfigMaxLevel()

	for iter_142_0 = arg_142_0:getMaxLevel() + 1, var_142_0 do
		if var_0_6[iter_142_0].level_limit == 1 then
			return iter_142_0
		end
	end
end

function var_0_0.canUpgrade(arg_143_0)
	if arg_143_0:isBluePrintShip() then
		return false
	end

	if arg_143_0:isMetaShip() then
		local var_143_0 = arg_143_0:getMetaCharacter()

		if not var_143_0 then
			return false
		end

		local var_143_1 = var_143_0:getBreakOutInfo()

		if not var_143_1:hasNextInfo() then
			return false
		end

		local var_143_2, var_143_3 = var_143_1:getLimited()

		if var_143_2 > arg_143_0.level then
			return false
		end

		return true
	else
		local var_143_4 = var_0_8[arg_143_0.configId]

		assert(var_143_4, "不存在配置" .. arg_143_0.configId)

		return not arg_143_0:isMaxStar() and arg_143_0.level >= var_143_4.level
	end
end

function var_0_0.isReachNextMaxLevel(arg_144_0)
	return arg_144_0.level == arg_144_0:getMaxLevel() and arg_144_0:CanAccumulateExp() and arg_144_0:getNextMaxLevel() ~= nil
end

function var_0_0.isAwakening(arg_145_0)
	return arg_145_0:isReachNextMaxLevel() and arg_145_0.level < var_0_4
end

function var_0_0.isAwakening2(arg_146_0)
	return arg_146_0:isReachNextMaxLevel() and arg_146_0.level >= var_0_4
end

function var_0_0.notMaxLevelForFilter(arg_147_0)
	return arg_147_0.level ~= arg_147_0:getMaxLevel()
end

function var_0_0.getNextMaxLevelConsume(arg_148_0)
	local var_148_0 = arg_148_0:getMaxLevel()
	local var_148_1 = var_0_6[var_148_0]["need_item_rarity" .. arg_148_0:getConfig("rarity")]

	assert(var_148_1, "items  can not be nil")

	return _.map(var_148_1, function(arg_149_0)
		return {
			type = arg_149_0[1],
			id = arg_149_0[2],
			count = arg_149_0[3]
		}
	end)
end

function var_0_0.canUpgradeMaxLevel(arg_150_0)
	if not arg_150_0:isReachNextMaxLevel() then
		return false, i18n("upgrade_to_next_maxlevel_failed")
	else
		local var_150_0 = getProxy(PlayerProxy):getData()
		local var_150_1 = getProxy(BagProxy)
		local var_150_2 = arg_150_0:getNextMaxLevelConsume()

		for iter_150_0, iter_150_1 in pairs(var_150_2) do
			if iter_150_1.type == DROP_TYPE_RESOURCE then
				if var_150_0:getResById(iter_150_1.id) < iter_150_1.count then
					return false, i18n("common_no_resource")
				end
			elseif iter_150_1.type == DROP_TYPE_ITEM and var_150_1:getItemCountById(iter_150_1.id) < iter_150_1.count then
				return false, i18n("common_no_item_1")
			end
		end
	end

	return true
end

function var_0_0.CanAccumulateExp(arg_151_0)
	return pg.ship_data_template[arg_151_0.configId].can_get_proficency == 1
end

function var_0_0.getTotalExp(arg_152_0)
	return arg_152_0:getLevelExpConfig().exp_start + arg_152_0.exp
end

function var_0_0.getStartBattleExpend(arg_153_0)
	if table.contains(TeamType.SubShipType, arg_153_0:getShipType()) then
		return 0
	else
		return pg.ship_data_template[arg_153_0.configId].oil_at_start
	end
end

function var_0_0.getEndBattleExpend(arg_154_0)
	local var_154_0 = pg.ship_data_template[arg_154_0.configId]
	local var_154_1 = arg_154_0:getLevelExpConfig()

	return (math.floor(var_154_0.oil_at_end * var_154_1.fight_oil_ratio / 10000))
end

function var_0_0.getBattleTotalExpend(arg_155_0)
	return arg_155_0:getStartBattleExpend() + arg_155_0:getEndBattleExpend()
end

function var_0_0.getShipAmmo(arg_156_0)
	local var_156_0 = arg_156_0:getConfig(AttributeType.Ammo)

	for iter_156_0, iter_156_1 in pairs(arg_156_0:getAllSkills()) do
		local var_156_1 = tonumber(iter_156_0 .. string.format("%.2d", iter_156_1.level))
		local var_156_2 = pg.skill_benefit_template[var_156_1]

		if var_156_2 and arg_156_0:IsBenefitSkillActive(var_156_2) and (var_156_2.type == var_0_0.BENEFIT_EQUIP or var_156_2.type == var_0_0.BENEFIT_SKILL) then
			var_156_0 = var_156_0 + defaultValue(var_156_2.effect[1], 0)
		end
	end

	local var_156_3 = arg_156_0:getActiveEquipments()

	for iter_156_2, iter_156_3 in ipairs(var_156_3) do
		local var_156_4 = iter_156_3 and iter_156_3:getConfig("equip_parameters").ammo

		if var_156_4 then
			var_156_0 = var_156_0 + var_156_4
		end
	end

	return var_156_0
end

function var_0_0.getHuntingLv(arg_157_0)
	local var_157_0 = arg_157_0:getConfig("huntingrange_level")

	for iter_157_0, iter_157_1 in pairs(arg_157_0:getAllSkills()) do
		local var_157_1 = tonumber(iter_157_0 .. string.format("%.2d", iter_157_1.level))
		local var_157_2 = pg.skill_benefit_template[var_157_1]

		if var_157_2 and arg_157_0:IsBenefitSkillActive(var_157_2) and (var_157_2.type == var_0_0.BENEFIT_EQUIP or var_157_2.type == var_0_0.BENEFIT_SKILL) then
			var_157_0 = var_157_0 + defaultValue(var_157_2.effect[2], 0)
		end
	end

	local var_157_3 = arg_157_0:getActiveEquipments()

	for iter_157_2, iter_157_3 in ipairs(var_157_3) do
		local var_157_4 = iter_157_3 and iter_157_3:getConfig("equip_parameters").hunting_lv

		if var_157_4 then
			var_157_0 = var_157_0 + var_157_4
		end
	end

	return (math.min(var_157_0, arg_157_0:getMaxHuntingLv()))
end

function var_0_0.getMapAuras(arg_158_0)
	local var_158_0 = {}

	for iter_158_0, iter_158_1 in pairs(arg_158_0:getAllSkills()) do
		local var_158_1 = tonumber(iter_158_0 .. string.format("%.2d", iter_158_1.level))
		local var_158_2 = pg.skill_benefit_template[var_158_1]

		if var_158_2 and arg_158_0:IsBenefitSkillActive(var_158_2) and var_158_2.type == var_0_0.BENEFIT_MAP_AURA then
			local var_158_3 = {
				id = var_158_2.effect[1],
				level = iter_158_1.level
			}

			table.insert(var_158_0, var_158_3)
		end
	end

	return var_158_0
end

function var_0_0.getMapAids(arg_159_0)
	local var_159_0 = {}

	for iter_159_0, iter_159_1 in pairs(arg_159_0:getAllSkills()) do
		local var_159_1 = tonumber(iter_159_0 .. string.format("%.2d", iter_159_1.level))
		local var_159_2 = pg.skill_benefit_template[var_159_1]

		if var_159_2 and arg_159_0:IsBenefitSkillActive(var_159_2) and var_159_2.type == var_0_0.BENEFIT_AID then
			local var_159_3 = {
				id = var_159_2.effect[1],
				level = iter_159_1.level
			}

			table.insert(var_159_0, var_159_3)
		end
	end

	return var_159_0
end

var_0_0.BENEFIT_SKILL = 2
var_0_0.BENEFIT_EQUIP = 3
var_0_0.BENEFIT_MAP_AURA = 4
var_0_0.BENEFIT_AID = 5

function var_0_0.IsBenefitSkillActive(arg_160_0, arg_160_1)
	local var_160_0 = false

	if arg_160_1.type == var_0_0.BENEFIT_SKILL then
		if not arg_160_1.limit[1] or arg_160_1.limit[1] == arg_160_0.triggers.TeamNumbers then
			var_160_0 = true
		end
	elseif arg_160_1.type == var_0_0.BENEFIT_EQUIP then
		local var_160_1 = arg_160_1.limit
		local var_160_2 = arg_160_0:getAllEquipments()

		for iter_160_0, iter_160_1 in ipairs(var_160_2) do
			if iter_160_1 and table.contains(var_160_1, iter_160_1:getConfig("id")) then
				var_160_0 = true

				break
			end
		end
	elseif arg_160_1.type == var_0_0.BENEFIT_MAP_AURA then
		if arg_160_0.hpRant and arg_160_0.hpRant > 0 then
			return true
		end
	elseif arg_160_1.type == var_0_0.BENEFIT_AID and arg_160_0.hpRant and arg_160_0.hpRant > 0 then
		return true
	end

	return var_160_0
end

function var_0_0.getMaxHuntingLv(arg_161_0)
	return #arg_161_0:getConfig("hunting_range")
end

function var_0_0.getHuntingRange(arg_162_0, arg_162_1)
	local var_162_0 = arg_162_0:getConfig("hunting_range")
	local var_162_1 = Clone(var_162_0[1])
	local var_162_2 = arg_162_1 or arg_162_0:getHuntingLv()
	local var_162_3 = math.min(var_162_2, arg_162_0:getMaxHuntingLv())

	for iter_162_0 = 2, var_162_3 do
		_.each(var_162_0[iter_162_0], function(arg_163_0)
			table.insert(var_162_1, {
				arg_163_0[1],
				arg_163_0[2]
			})
		end)
	end

	return var_162_1
end

function var_0_0.getTriggerSkills(arg_164_0)
	local var_164_0 = {}
	local var_164_1 = arg_164_0:getSkillEffects()

	_.each(var_164_1, function(arg_165_0)
		if arg_165_0.type == "AddBuff" and arg_165_0.arg_list and arg_165_0.arg_list.buff_id then
			local var_165_0 = arg_165_0.arg_list.buff_id

			var_164_0[var_165_0] = {
				id = var_165_0,
				level = arg_165_0.level
			}
		end
	end)

	return var_164_0
end

function var_0_0.GetEquipmentSkills(arg_166_0)
	local var_166_0 = {}
	local var_166_1 = arg_166_0:getActiveEquipments()

	for iter_166_0, iter_166_1 in ipairs(var_166_1) do
		if iter_166_1 and iter_166_1:getConfig("skill_id")[1] then
			local var_166_2, var_166_3 = unpack(iter_166_1:getConfig("skill_id")[1])

			var_166_0[var_166_2] = {
				id = var_166_2,
				level = var_166_3
			}
		end
	end

	;(function()
		local var_167_0 = arg_166_0:GetSpWeapon()
		local var_167_1 = var_167_0 and var_167_0:GetEffect() or 0

		if var_167_1 > 0 then
			var_166_0[var_167_1] = {
				level = 1,
				id = var_167_1
			}
		end
	end)()

	return var_166_0
end

function var_0_0.getAllSkills(arg_168_0)
	local var_168_0 = Clone(arg_168_0.skills)

	for iter_168_0, iter_168_1 in pairs(arg_168_0:GetEquipmentSkills()) do
		var_168_0[iter_168_0] = iter_168_1
	end

	for iter_168_2, iter_168_3 in pairs(arg_168_0:getTriggerSkills()) do
		var_168_0[iter_168_2] = iter_168_3
	end

	return var_168_0
end

function var_0_0.isSameKind(arg_169_0, arg_169_1)
	return pg.ship_data_template[arg_169_0.configId].group_type == pg.ship_data_template[arg_169_1.configId].group_type
end

function var_0_0.GetLockState(arg_170_0)
	return arg_170_0.lockState
end

function var_0_0.IsLocked(arg_171_0)
	return arg_171_0.lockState == var_0_0.LOCK_STATE_LOCK
end

function var_0_0.SetLockState(arg_172_0, arg_172_1)
	arg_172_0.lockState = arg_172_1
end

function var_0_0.GetPreferenceTag(arg_173_0)
	return arg_173_0.preferenceTag or 0
end

function var_0_0.IsPreferenceTag(arg_174_0)
	return arg_174_0:GetPreferenceTag() == var_0_0.PREFERENCE_TAG_COMMON
end

function var_0_0.SetPreferenceTag(arg_175_0, arg_175_1)
	arg_175_0.preferenceTag = arg_175_1
end

function var_0_0.calReturnRes(arg_176_0)
	local var_176_0 = pg.ship_data_by_type[arg_176_0:getShipType()]
	local var_176_1 = var_176_0.distory_resource_gold_ratio
	local var_176_2 = var_176_0.distory_resource_oil_ratio
	local var_176_3 = pg.ship_data_by_star[arg_176_0:getConfig("rarity")].destory_item

	return var_176_1, 0, var_176_3
end

function var_0_0.getRarity(arg_177_0)
	local var_177_0 = arg_177_0:getConfig("rarity")

	if arg_177_0:isRemoulded() then
		var_177_0 = var_177_0 + 1
	end

	return var_177_0
end

function var_0_0.updateSkill(arg_178_0, arg_178_1)
	local var_178_0 = arg_178_1.skill_id or arg_178_1.id
	local var_178_1 = arg_178_1.skill_lv or arg_178_1.lv or arg_178_1.level
	local var_178_2 = arg_178_1.skill_exp or arg_178_1.exp

	arg_178_0.skills[var_178_0] = {
		id = var_178_0,
		level = var_178_1,
		exp = var_178_2
	}
end

function var_0_0.canEquipAtPos(arg_179_0, arg_179_1, arg_179_2)
	local var_179_0, var_179_1 = arg_179_0:isForbiddenAtPos(arg_179_1, arg_179_2)

	if var_179_0 then
		return false, var_179_1
	end

	for iter_179_0, iter_179_1 in ipairs(arg_179_0.equipments) do
		if iter_179_1 and iter_179_0 ~= arg_179_2 and iter_179_1:getConfig("equip_limit") ~= 0 and arg_179_1:getConfig("equip_limit") == iter_179_1:getConfig("equip_limit") then
			return false, i18n("ship_equip_same_group_equipment")
		end
	end

	return true
end

function var_0_0.isForbiddenAtPos(arg_180_0, arg_180_1, arg_180_2)
	local var_180_0 = pg.ship_data_template[arg_180_0.configId]

	assert(var_180_0, "can not find ship in ship_data_templtae: " .. arg_180_0.configId)

	local var_180_1 = var_180_0["equip_" .. arg_180_2]

	if not table.contains(var_180_1, arg_180_1:getConfig("type")) then
		return true, i18n("common_limit_equip")
	end

	if table.contains(arg_180_1:getConfig("ship_type_forbidden"), arg_180_0:getShipType()) then
		return true, i18n("common_limit_equip")
	end

	return false
end

function var_0_0.canEquipCommander(arg_181_0, arg_181_1)
	if arg_181_1:getShipType() ~= arg_181_0:getShipType() then
		return false, i18n("commander_type_unmatch")
	end

	return true
end

function var_0_0.upgrade(arg_182_0)
	local var_182_0 = pg.ship_data_transform[arg_182_0.configId]

	if var_182_0.trans_id and var_182_0.trans_id > 0 then
		arg_182_0.configId = var_182_0.trans_id
		arg_182_0.star = arg_182_0:getConfig("star")
	end
end

function var_0_0.getTeamType(arg_183_0)
	return TeamType.GetTeamFromShipType(arg_183_0:getShipType())
end

function var_0_0.getFleetName(arg_184_0)
	local var_184_0 = arg_184_0:getTeamType()

	return var_0_1[var_184_0]
end

function var_0_0.getMaxConfigId(arg_185_0)
	local var_185_0 = pg.ship_data_template
	local var_185_1

	for iter_185_0 = 4, 1, -1 do
		local var_185_2 = tonumber(arg_185_0.groupId .. iter_185_0)

		if var_185_0[var_185_2] then
			var_185_1 = var_185_2

			break
		end
	end

	return var_185_1
end

function var_0_0.getFlag(arg_186_0, arg_186_1, arg_186_2)
	return pg.ShipFlagMgr.GetInstance():GetShipFlag(arg_186_0.id, arg_186_1, arg_186_2)
end

function var_0_0.hasAnyFlag(arg_187_0, arg_187_1)
	return _.any(arg_187_1, function(arg_188_0)
		return arg_187_0:getFlag(arg_188_0)
	end)
end

function var_0_0.isBreakOut(arg_189_0)
	return arg_189_0.configId % 10 > 1
end

function var_0_0.fateSkillChange(arg_190_0, arg_190_1)
	if not arg_190_0.skillChangeList then
		arg_190_0.skillChangeList = arg_190_0:isBluePrintShip() and arg_190_0:getBluePrint():getChangeSkillList() or {}
	end

	for iter_190_0, iter_190_1 in ipairs(arg_190_0.skillChangeList) do
		if iter_190_1[1] == arg_190_1 and arg_190_0.skills[iter_190_1[2]] then
			return iter_190_1[2]
		end
	end

	return arg_190_1
end

function var_0_0.RemapSkillId(arg_191_0, arg_191_1)
	local var_191_0 = arg_191_0:GetSpWeapon()

	if var_191_0 then
		if table.contains(pg.ship_data_template[arg_191_0.configId].hide_buff_list, arg_191_1) then
			return var_191_0:RemapHiddenSkillId(arg_191_1)
		else
			return var_191_0:RemapSkillId(arg_191_1)
		end
	end

	return arg_191_1
end

function var_0_0.getSkillList(arg_192_0)
	local var_192_0 = pg.ship_data_template[arg_192_0.configId]
	local var_192_1 = Clone(var_192_0.buff_list_display)
	local var_192_2 = Clone(var_192_0.buff_list)
	local var_192_3 = pg.ship_data_trans[arg_192_0.groupId]
	local var_192_4 = 0

	if var_192_3 and var_192_3.skill_id ~= 0 then
		local var_192_5 = var_192_3.skill_id
		local var_192_6 = pg.transform_data_template[var_192_5]

		if arg_192_0.transforms[var_192_5] and var_192_6.skill_id ~= 0 then
			table.insert(var_192_2, var_192_6.skill_id)
		end
	end

	local var_192_7 = {}

	for iter_192_0, iter_192_1 in ipairs(var_192_1) do
		for iter_192_2, iter_192_3 in ipairs(var_192_2) do
			if iter_192_1 == iter_192_3 then
				table.insert(var_192_7, arg_192_0:fateSkillChange(iter_192_1))
			end
		end
	end

	return var_192_7
end

function var_0_0.getModAttrTopLimit(arg_193_0, arg_193_1)
	local var_193_0 = ShipModAttr.ATTR_TO_INDEX[arg_193_1]
	local var_193_1 = pg.ship_data_template[arg_193_0.configId].strengthen_id
	local var_193_2 = pg.ship_data_strengthen[var_193_1].durability[var_193_0]

	return calcFloor((3 + 7 * (math.min(arg_193_0.level, 100) / 100)) * var_193_2 * 0.1)
end

function var_0_0.leftModAdditionPoint(arg_194_0, arg_194_1)
	local var_194_0 = arg_194_0:getModProperties(arg_194_1)
	local var_194_1 = arg_194_0:getModExpRatio(arg_194_1)
	local var_194_2 = arg_194_0:getModAttrTopLimit(arg_194_1)
	local var_194_3 = calcFloor(var_194_0 / var_194_1)

	return math.max(0, var_194_2 - var_194_3)
end

function var_0_0.getModAttrBaseMax(arg_195_0, arg_195_1)
	if not table.contains(arg_195_0:getConfig("lock"), arg_195_1) then
		local var_195_0 = arg_195_0:leftModAdditionPoint(arg_195_1)
		local var_195_1 = arg_195_0:getShipProperties()

		return calcFloor(var_195_1[arg_195_1] + var_195_0)
	else
		return 0
	end
end

function var_0_0.getModExpRatio(arg_196_0, arg_196_1)
	if not table.contains(arg_196_0:getConfig("lock"), arg_196_1) then
		local var_196_0 = pg.ship_data_template[arg_196_0.configId].strengthen_id

		assert(pg.ship_data_strengthen[var_196_0], "ship_data_strengthen>>>>>>" .. var_196_0)

		return math.max(pg.ship_data_strengthen[var_196_0].level_exp[ShipModAttr.ATTR_TO_INDEX[arg_196_1]], 1)
	else
		return 1
	end
end

function var_0_0.inUnlockTip(arg_197_0)
	local var_197_0 = pg.gameset.tip_unlock_shipIds.description[0]

	return table.contains(var_197_0, arg_197_0)
end

function var_0_0.proposeSkinOwned(arg_198_0, arg_198_1)
	return arg_198_1 and arg_198_0.propose and arg_198_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE
end

function var_0_0.getProposeSkin(arg_199_0)
	return ShipSkin.GetSkinByType(arg_199_0.groupId, ShipSkin.SKIN_TYPE_PROPOSE)
end

function var_0_0.getDisplaySkillIds(arg_200_0)
	return _.map(pg.ship_data_template[arg_200_0.configId].buff_list_display, function(arg_201_0)
		return arg_200_0:fateSkillChange(arg_201_0)
	end)
end

function var_0_0.isFullSkillLevel(arg_202_0)
	local var_202_0 = pg.skill_data_template

	for iter_202_0, iter_202_1 in pairs(arg_202_0.skills) do
		if var_202_0[iter_202_1.id].max_level ~= iter_202_1.level then
			return false
		end
	end

	return true
end

function var_0_0.setEquipmentRecord(arg_203_0, arg_203_1, arg_203_2)
	local var_203_0 = "equipment_record" .. "_" .. arg_203_1 .. "_" .. arg_203_0.id

	PlayerPrefs.SetString(var_203_0, table.concat(_.flatten(arg_203_2), ":"))
	PlayerPrefs.Save()
end

function var_0_0.getEquipmentRecord(arg_204_0, arg_204_1)
	if not arg_204_0.equipmentRecords then
		local var_204_0 = "equipment_record" .. "_" .. arg_204_1 .. "_" .. arg_204_0.id
		local var_204_1 = string.split(PlayerPrefs.GetString(var_204_0) or "", ":")
		local var_204_2 = {}

		for iter_204_0 = 1, 3 do
			var_204_2[iter_204_0] = _.map(_.slice(var_204_1, 5 * iter_204_0 - 4, 5), function(arg_205_0)
				return tonumber(arg_205_0)
			end)
		end

		arg_204_0.equipmentRecords = var_204_2
	end

	return arg_204_0.equipmentRecords
end

function var_0_0.SetSpWeaponRecord(arg_206_0, arg_206_1, arg_206_2)
	local var_206_0 = "spweapon_record" .. "_" .. arg_206_1 .. "_" .. arg_206_0.id
	local var_206_1 = _.map({
		1,
		2,
		3
	}, function(arg_207_0)
		local var_207_0 = arg_206_2[arg_207_0]

		if var_207_0 then
			return (var_207_0:GetUID() or 0) .. "," .. var_207_0:GetConfigID()
		else
			return "0,0"
		end
	end)

	PlayerPrefs.SetString(var_206_0, table.concat(var_206_1, ":"))
	PlayerPrefs.Save()
end

function var_0_0.GetSpWeaponRecord(arg_208_0, arg_208_1)
	local var_208_0 = "spweapon_record" .. "_" .. arg_208_1 .. "_" .. arg_208_0.id

	return (_.map(string.split(PlayerPrefs.GetString(var_208_0, ""), ":"), function(arg_209_0)
		local var_209_0 = string.split(arg_209_0, ",")

		assert(var_209_0)

		local var_209_1 = tonumber(var_209_0[1])
		local var_209_2 = tonumber(var_209_0[2])

		if not var_209_2 or var_209_2 == 0 then
			return false
		end

		return (SpWeapon.New({
			id = var_209_2
		}))
	end))
end

function var_0_0.hasEquipEquipmentSkin(arg_210_0)
	for iter_210_0, iter_210_1 in ipairs(arg_210_0.equipments) do
		if iter_210_1 and iter_210_1:hasSkin() then
			return true
		end
	end

	return false
end

function var_0_0.hasCommander(arg_211_0)
	return arg_211_0.commanderId and arg_211_0.commanderId ~= 0
end

function var_0_0.getCommander(arg_212_0)
	return arg_212_0.commanderId
end

function var_0_0.setCommander(arg_213_0, arg_213_1)
	arg_213_0.commanderId = arg_213_1
end

function var_0_0.getSkillIndex(arg_214_0, arg_214_1)
	local var_214_0 = arg_214_0:getSkillList()

	for iter_214_0, iter_214_1 in ipairs(var_214_0) do
		if arg_214_1 == iter_214_1 then
			return iter_214_0
		end
	end
end

function var_0_0.getTactics(arg_215_0)
	return 1, "tactics_attack"
end

function var_0_0.IsBgmSkin(arg_216_0)
	local var_216_0 = arg_216_0:GetSkinConfig()

	return table.contains(var_216_0.tag, ShipSkin.WITH_BGM)
end

function var_0_0.GetSkinBgm(arg_217_0)
	if arg_217_0:IsBgmSkin() then
		return arg_217_0:GetSkinConfig().bgm
	end
end

function var_0_0.isIntensifyMax(arg_218_0)
	local var_218_0 = intProperties(arg_218_0:getShipProperties())

	if arg_218_0:isBluePrintShip() then
		return true
	end

	for iter_218_0, iter_218_1 in pairs(ShipModAttr.ID_TO_ATTR) do
		if arg_218_0:getModAttrBaseMax(iter_218_1) ~= var_218_0[iter_218_1] then
			return false
		end
	end

	return true
end

function var_0_0.isRemouldable(arg_219_0)
	return not arg_219_0:isTestShip() and not arg_219_0:isBluePrintShip() and pg.ship_data_trans[arg_219_0.groupId]
end

function var_0_0.isAllRemouldFinish(arg_220_0)
	local var_220_0 = pg.ship_data_trans[arg_220_0.groupId]

	assert(var_220_0, "this ship group without remould config:" .. arg_220_0.groupId)

	for iter_220_0, iter_220_1 in ipairs(var_220_0.transform_list) do
		for iter_220_2, iter_220_3 in ipairs(iter_220_1) do
			local var_220_1 = pg.transform_data_template[iter_220_3[2]]

			if #var_220_1.edit_trans > 0 then
				-- block empty
			elseif not arg_220_0.transforms[iter_220_3[2]] or arg_220_0.transforms[iter_220_3[2]].level < var_220_1.max_level then
				return false
			end
		end
	end

	return true
end

function var_0_0.isSpecialFilter(arg_221_0)
	local var_221_0 = pg.ship_data_statistics[arg_221_0.configId]

	assert(var_221_0, "this ship without statistics:" .. arg_221_0.configId)

	for iter_221_0, iter_221_1 in ipairs(var_221_0.tag_list) do
		if iter_221_1 == "special" then
			return true
		end
	end

	return false
end

function var_0_0.hasAvailiableSkin(arg_222_0)
	local var_222_0 = getProxy(ShipSkinProxy)
	local var_222_1 = var_222_0:GetAllSkinForShip(arg_222_0)
	local var_222_2 = var_222_0:getRawData()
	local var_222_3 = 0

	for iter_222_0, iter_222_1 in ipairs(var_222_1) do
		if arg_222_0:proposeSkinOwned(iter_222_1) or var_222_2[iter_222_1.id] or var_222_0:hasSkin(iter_222_1.id) then
			var_222_3 = var_222_3 + 1
		end
	end

	return var_222_3 > 0
end

function var_0_0.hasProposeSkin(arg_223_0)
	local var_223_0 = getProxy(ShipSkinProxy)
	local var_223_1 = var_223_0:GetAllSkinForShip(arg_223_0)

	for iter_223_0, iter_223_1 in ipairs(var_223_1) do
		if iter_223_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE then
			return true
		end
	end

	local var_223_2 = var_223_0:GetShareSkinsForShip(arg_223_0)

	for iter_223_2, iter_223_3 in ipairs(var_223_2) do
		if iter_223_3.skin_type == ShipSkin.SKIN_TYPE_PROPOSE then
			return true
		end
	end

	return false
end

function var_0_0.HasUniqueSpWeapon(arg_224_0)
	return tobool(pg.spweapon_data_statistics.get_id_list_by_unique[arg_224_0:getGroupId()])
end

function var_0_0.getAircraftReloadCD(arg_225_0)
	local var_225_0 = arg_225_0:getConfigTable().base_list
	local var_225_1 = arg_225_0:getConfigTable().default_equip_list
	local var_225_2 = 0
	local var_225_3 = 0

	for iter_225_0 = 1, 3 do
		local var_225_4 = arg_225_0:getEquip(iter_225_0)
		local var_225_5 = var_225_4 and var_225_4.configId or var_225_1[iter_225_0]
		local var_225_6 = Equipment.getConfigData(var_225_5).type

		if underscore.any(EquipType.AirEquipTypes, function(arg_226_0)
			return var_225_6 == arg_226_0
		end) then
			var_225_2 = var_225_2 + Equipment.GetEquipReloadStatic(var_225_5) * var_225_0[iter_225_0]
			var_225_3 = var_225_3 + var_225_0[iter_225_0]
		end
	end

	local var_225_7 = ys.Battle.BattleConfig.AIR_ASSIST_RELOAD_RATIO * pg.bfConsts.PERCENT

	return {
		name = i18n("equip_info_31"),
		type = AttributeType.CD,
		value = var_225_2 / var_225_3 * var_225_7
	}
end

function var_0_0.IsTagShip(arg_227_0, arg_227_1)
	local var_227_0 = arg_227_0:getConfig("tag_list")

	return table.contains(var_227_0, arg_227_1)
end

function var_0_0.setReMetaSpecialItemVO(arg_228_0, arg_228_1)
	arg_228_0.reMetaSpecialItemVO = arg_228_1
end

function var_0_0.getReMetaSpecialItemVO(arg_229_0, arg_229_1)
	return arg_229_0.reMetaSpecialItemVO
end

function var_0_0.getProposeType(arg_230_0)
	if arg_230_0:isMetaShip() then
		return "meta"
	elseif arg_230_0:IsXIdol() then
		return "imas"
	else
		return "default"
	end
end

function var_0_0.IsXIdol(arg_231_0)
	return arg_231_0:getNation() == Nation.IDOL_LINK
end

function var_0_0.getSpecificType(arg_232_0)
	return pg.ship_data_template[arg_232_0.configId].specific_type
end

function var_0_0.GetSpWeapon(arg_233_0)
	return arg_233_0.spWeapon
end

function var_0_0.UpdateSpWeapon(arg_234_0, arg_234_1)
	local var_234_0 = (arg_234_1 and arg_234_1:GetUID() or 0) == (arg_234_0.spWeapon and arg_234_0.spWeapon:GetUID() or 0)

	arg_234_0.spWeapon = arg_234_1

	if arg_234_1 then
		arg_234_1:SetShipId(arg_234_0.id)
	end

	if var_234_0 then
		pg.m02:sendNotification(EquipmentProxy.SPWEAPONS_UPDATED)
	end
end

function var_0_0.CanEquipSpWeapon(arg_235_0, arg_235_1)
	local var_235_0, var_235_1 = arg_235_0:IsSpWeaponForbidden(arg_235_1)

	if var_235_0 then
		return false, var_235_1
	end

	return true
end

function var_0_0.IsSpWeaponForbidden(arg_236_0, arg_236_1)
	local var_236_0 = arg_236_1:GetWearableShipTypes()
	local var_236_1 = arg_236_0:getShipType()

	if not table.contains(var_236_0, var_236_1) then
		return true, i18n("spweapon_tip_group_error")
	end

	local var_236_2 = arg_236_1:GetUniqueGroup()
	local var_236_3 = arg_236_0:getGroupId()

	if var_236_2 ~= 0 and var_236_2 ~= var_236_3 then
		return true, i18n("spweapon_tip_group_error")
	end

	return false
end

function var_0_0.GetMapStrikeAnim(arg_237_0)
	local var_237_0
	local var_237_1 = arg_237_0:getShipType()

	switch(TeamType.GetTeamFromShipType(var_237_1), {
		[TeamType.Main] = function()
			if ShipType.IsTypeQuZhu(var_237_1) then
				var_237_0 = "SubTorpedoUI"
			elseif ShipType.ContainInLimitBundle(ShipType.BundleAircraftCarrier, var_237_1) then
				var_237_0 = "AirStrikeUI"
			elseif ShipType.ContainInLimitBundle(ShipType.BundleBattleShip, var_237_1) then
				var_237_0 = "CannonUI"
			else
				var_237_0 = "CannonUI"
			end
		end,
		[TeamType.Vanguard] = function()
			if ShipType.IsTypeQuZhu(var_237_1) then
				var_237_0 = "SubTorpedoUI"
			end
		end,
		[TeamType.Submarine] = function()
			if arg_237_0:getNation() == Nation.MOT then
				var_237_0 = "CannonUI"
			else
				var_237_0 = "SubTorpedoUI"
			end
		end
	})

	return var_237_0
end

function var_0_0.IsDefaultSkin(arg_241_0)
	local var_241_0 = arg_241_0:getSkinId()

	return var_241_0 == 0 or var_241_0 == arg_241_0:getConfig("skin_id")
end

function var_0_0.IsMatchKey(arg_242_0, arg_242_1)
	if not arg_242_1 or arg_242_1 == "" then
		return true
	end

	arg_242_1 = string.lower(string.gsub(arg_242_1, "%.", "%%."))

	local var_242_0 = {
		arg_242_0:getName(),
		arg_242_0:GetDefaultName()
	}

	if var_242_0[1] == var_242_0[2] then
		table.remove(var_242_0)
	end

	return underscore.any(var_242_0, function(arg_243_0)
		return string.find(string.lower(arg_243_0), arg_242_1)
	end)
end

function var_0_0.IsOwner(arg_244_0)
	return tobool(arg_244_0.id)
end

function var_0_0.GetUniqueId(arg_245_0)
	return arg_245_0.id
end

function var_0_0.ShowPropose(arg_246_0)
	if not arg_246_0.propose then
		return false
	else
		return not HXSet.isHxPropose() or arg_246_0:IsOwner() and arg_246_0:GetUniqueId() == getProxy(PlayerProxy):getRawData():GetProposeShipId()
	end
end

function var_0_0.GetColorName(arg_247_0, arg_247_1)
	arg_247_1 = arg_247_1 or arg_247_0:getName()

	if PlayerPrefs.GetInt("SHIP_NAME_COLOR", PLATFORM_CODE == PLATFORM_CH and 1 or 0) == 1 and arg_247_0.propose then
		return setColorStr(arg_247_1, "#FFAACEFF")
	else
		return arg_247_1
	end
end

local var_0_9 = {
	effect = {
		"duang_meta_jiehun",
		"duang_6_jiehun_tuzhi",
		"duang_6_jiehun",
		"duang_meta_%s",
		"duang_6"
	},
	frame = {
		"prop4_1",
		"prop%s",
		"prop"
	}
}

function var_0_0.GetFrameAndEffect(arg_248_0, arg_248_1)
	arg_248_1 = tobool(arg_248_1)

	local var_248_0
	local var_248_1

	if arg_248_0.propose then
		if arg_248_0:isMetaShip() then
			var_248_1 = string.format(var_0_9.effect[1])
			var_248_0 = string.format(var_0_9.frame[1])
		elseif arg_248_0:isBluePrintShip() then
			var_248_1 = string.format(var_0_9.effect[2])
			var_248_0 = string.format(var_0_9.frame[2], arg_248_0:rarity2bgPrint())
		else
			var_248_1 = string.format(var_0_9.effect[3])
			var_248_0 = string.format(var_0_9.frame[3])
		end

		if not arg_248_0:ShowPropose() then
			var_248_0 = nil
		end
	elseif arg_248_0:isMetaShip() then
		var_248_1 = string.format(var_0_9.effect[4], arg_248_0:rarity2bgPrint())
	elseif arg_248_0:getRarity() == ShipRarity.SSR then
		var_248_1 = string.format(var_0_9.effect[5])
	end

	if arg_248_1 then
		var_248_1 = var_248_1 and var_248_1 .. "_1"
	end

	return var_248_0, var_248_1
end

function var_0_0.GetRecordPosKey(arg_249_0)
	return arg_249_0:getSkinId()
end

function var_0_0.GetShipPhantomMark(arg_250_0, arg_250_1)
	return ShipPhantom.PackMark(arg_250_0.id, arg_250_1)
end

function var_0_0.GetSelectMark(arg_251_0)
	return arg_251_0.id
end

return var_0_0
