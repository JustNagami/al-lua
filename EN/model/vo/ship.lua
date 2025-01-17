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
	if arg_7_0.skinId == arg_7_1 then
		return true
	end

	local var_7_0 = ShipGroup.GetChangeSkinGroupId(arg_7_0.skinId)
	local var_7_1 = ShipGroup.GetChangeSkinGroupId(arg_7_1)

	if var_7_0 and var_7_1 and var_7_0 == var_7_1 then
		return true
	end

	return false
end

function var_0_0.rarity2bgPrint(arg_8_0)
	return shipRarity2bgPrint(arg_8_0:getRarity(), arg_8_0:isBluePrintShip(), arg_8_0:isMetaShip())
end

function var_0_0.rarity2bgPrintForGet(arg_9_0)
	return skinId2bgPrint(arg_9_0.skinId) or arg_9_0:rarity2bgPrint()
end

function var_0_0.getShipBgPrint(arg_10_0, arg_10_1)
	local var_10_0 = pg.ship_skin_template[arg_10_0.skinId]

	assert(var_10_0, "ship_skin_template not exist: " .. arg_10_0.skinId)

	local var_10_1

	if not arg_10_1 and var_10_0.bg_sp and var_10_0.bg_sp ~= "" and PlayerPrefs.GetInt("paint_hide_other_obj_" .. var_10_0.painting, 0) == 0 then
		var_10_1 = var_10_0.bg_sp
	end

	return var_10_1 and var_10_1 or var_10_0.bg and #var_10_0.bg > 0 and var_10_0.bg or arg_10_0:rarity2bgPrintForGet()
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

function var_0_0.getEnergyPrint(arg_31_0)
	local var_31_0 = arg_31_0:getEnergeConfig()

	return var_31_0.icon, var_31_0.desc
end

function var_0_0.getIntimacy(arg_32_0)
	return arg_32_0.intimacy
end

function var_0_0.getCVIntimacy(arg_33_0)
	return arg_33_0:getIntimacy() / 100 + (arg_33_0.propose and 1000 or 0)
end

function var_0_0.getIntimacyMax(arg_34_0)
	if arg_34_0.propose then
		return 200
	else
		return arg_34_0:GetNoProposeIntimacyMax()
	end
end

function var_0_0.GetNoProposeIntimacyMax(arg_35_0)
	return 100
end

function var_0_0.getIntimacyIcon(arg_36_0)
	local var_36_0 = pg.intimacy_template[arg_36_0:getIntimacyLevel()]
	local var_36_1 = ""

	if arg_36_0:isMetaShip() then
		var_36_1 = "_meta"
	elseif arg_36_0:IsXIdol() then
		var_36_1 = "_imas"
	end

	if not arg_36_0.propose and math.floor(arg_36_0:getIntimacy() / 100) >= arg_36_0:getIntimacyMax() then
		return var_36_0.icon .. var_36_1, "heart" .. var_36_1
	else
		return var_36_0.icon .. var_36_1
	end
end

function var_0_0.getIntimacyDetail(arg_37_0)
	return arg_37_0:getIntimacyMax(), math.floor(arg_37_0:getIntimacy() / 100)
end

function var_0_0.getIntimacyInfo(arg_38_0)
	local var_38_0 = pg.intimacy_template[arg_38_0:getIntimacyLevel()]

	return var_38_0.icon, var_38_0.desc
end

function var_0_0.getIntimacyLevel(arg_39_0)
	local var_39_0 = 0
	local var_39_1 = pg.intimacy_template

	for iter_39_0, iter_39_1 in pairs(var_39_1) do
		if type(iter_39_0) == "number" and arg_39_0:getIntimacy() >= iter_39_1.lower_bound and arg_39_0:getIntimacy() <= iter_39_1.upper_bound then
			var_39_0 = iter_39_0

			break
		end
	end

	if var_39_0 < arg_39_0.INTIMACY_PROPOSE and arg_39_0.propose then
		var_39_0 = arg_39_0.INTIMACY_PROPOSE
	end

	return var_39_0
end

function var_0_0.getBluePrint(arg_40_0)
	local var_40_0 = ShipBluePrint.New({
		id = arg_40_0.groupId
	})
	local var_40_1 = arg_40_0.strengthList[1] or {
		exp = 0,
		level = 0
	}

	var_40_0:updateInfo({
		blue_print_level = var_40_1.level,
		exp = var_40_1.exp
	})

	return var_40_0
end

function var_0_0.getBaseList(arg_41_0)
	if arg_41_0:isBluePrintShip() then
		local var_41_0 = arg_41_0:getBluePrint()

		assert(var_41_0, "blueprint can not be nil" .. arg_41_0.configId)

		return var_41_0:getBaseList(arg_41_0)
	else
		return arg_41_0:getConfig("base_list")
	end
end

function var_0_0.getPreLoadCount(arg_42_0)
	if arg_42_0:isBluePrintShip() then
		return arg_42_0:getBluePrint():getPreLoadCount(arg_42_0)
	else
		return arg_42_0:getConfig("preload_count")
	end
end

function var_0_0.getNation(arg_43_0)
	return arg_43_0:getConfig("nationality")
end

function var_0_0.getPaintingName(arg_44_0)
	local var_44_0 = pg.ship_data_statistics[arg_44_0].skin_id
	local var_44_1 = pg.ship_skin_template[var_44_0]

	assert(var_44_1, "ship_skin_template not exist: " .. arg_44_0 .. " " .. var_44_0)

	return var_44_1.painting
end

function var_0_0.getName(arg_45_0)
	if arg_45_0.propose and pg.PushNotificationMgr.GetInstance():isEnableShipName() then
		return arg_45_0.name
	end

	if arg_45_0:isRemoulded() then
		return pg.ship_skin_template[arg_45_0:getRemouldSkinId()].name
	end

	return pg.ship_data_statistics[arg_45_0.configId].name
end

function var_0_0.GetDefaultName(arg_46_0)
	if arg_46_0:isRemoulded() then
		return pg.ship_skin_template[arg_46_0:getRemouldSkinId()].name
	else
		return pg.ship_data_statistics[arg_46_0.configId].name
	end
end

function var_0_0.getShipName(arg_47_0)
	return pg.ship_data_statistics[arg_47_0].name
end

function var_0_0.getBreakOutLevel(arg_48_0)
	assert(arg_48_0, "必须存在配置id")
	assert(pg.ship_data_statistics[arg_48_0], "必须存在配置" .. arg_48_0)

	return pg.ship_data_statistics[arg_48_0].star
end

function var_0_0.Ctor(arg_49_0, arg_49_1)
	arg_49_0.id = arg_49_1.id
	arg_49_0.configId = arg_49_1.template_id or arg_49_1.configId
	arg_49_0.level = arg_49_1.level
	arg_49_0.exp = arg_49_1.exp
	arg_49_0.energy = arg_49_1.energy
	arg_49_0.lockState = arg_49_1.is_locked
	arg_49_0.intimacy = arg_49_1.intimacy
	arg_49_0.propose = arg_49_1.propose and arg_49_1.propose > 0
	arg_49_0.proposeTime = arg_49_1.propose

	if arg_49_0.intimacy and arg_49_0.intimacy > 10000 and not arg_49_0.propose then
		arg_49_0.intimacy = 10000
	end

	arg_49_0.renameTime = arg_49_1.change_name_timestamp

	if arg_49_1.name and arg_49_1.name ~= "" then
		arg_49_0.name = arg_49_1.name
	else
		assert(pg.ship_data_statistics[arg_49_0.configId], "必须存在配置" .. arg_49_0.configId)

		arg_49_0.name = pg.ship_data_statistics[arg_49_0.configId].name
	end

	arg_49_0.bluePrintFlag = arg_49_1.blue_print_flag or 0
	arg_49_0.strengthList = {}

	for iter_49_0, iter_49_1 in ipairs(arg_49_1.strength_list or {}) do
		if not arg_49_0:isBluePrintShip() then
			local var_49_0 = ShipModAttr.ID_TO_ATTR[iter_49_1.id]

			arg_49_0.strengthList[var_49_0] = iter_49_1.exp
		else
			table.insert(arg_49_0.strengthList, {
				level = iter_49_1.id,
				exp = iter_49_1.exp
			})
		end
	end

	local var_49_1 = arg_49_1.state or {}

	arg_49_0.state = var_49_1.state
	arg_49_0.state_info_1 = var_49_1.state_info_1
	arg_49_0.state_info_2 = var_49_1.state_info_2
	arg_49_0.state_info_3 = var_49_1.state_info_3
	arg_49_0.state_info_4 = var_49_1.state_info_4
	arg_49_0.equipmentSkins = {}
	arg_49_0.equipments = {}

	if arg_49_1.equip_info_list then
		for iter_49_2, iter_49_3 in ipairs(arg_49_1.equip_info_list or {}) do
			arg_49_0.equipments[iter_49_2] = iter_49_3.id > 0 and Equipment.New({
				count = 1,
				id = iter_49_3.id,
				config_id = iter_49_3.id,
				skinId = iter_49_3.skinId
			}) or false
			arg_49_0.equipmentSkins[iter_49_2] = iter_49_3.skinId > 0 and iter_49_3.skinId or 0

			arg_49_0:reletiveEquipSkin(iter_49_2)
		end
	end

	arg_49_0.spWeapon = nil

	if arg_49_1.spweapon then
		arg_49_0:UpdateSpWeapon(SpWeapon.CreateByNet(arg_49_1.spweapon))
	end

	arg_49_0.skills = {}

	for iter_49_4, iter_49_5 in ipairs(arg_49_1.skill_id_list or {}) do
		arg_49_0:updateSkill(iter_49_5)
	end

	arg_49_0.star = arg_49_0:getConfig("rarity")
	arg_49_0.transforms = {}

	for iter_49_6, iter_49_7 in ipairs(arg_49_1.transform_list or {}) do
		arg_49_0.transforms[iter_49_7.id] = {
			id = iter_49_7.id,
			level = iter_49_7.level
		}
	end

	arg_49_0.groupId = pg.ship_data_template[arg_49_0.configId].group_type
	arg_49_0.createTime = arg_49_1.create_time or 0

	local var_49_2 = getProxy(CollectionProxy)

	arg_49_0.virgin = var_49_2 and var_49_2.shipGroups[arg_49_0.groupId] == nil

	local var_49_3 = {
		pg.gameset.test_ship_config_1.key_value,
		pg.gameset.test_ship_config_2.key_value,
		pg.gameset.test_ship_config_3.key_value
	}
	local var_49_4 = table.indexof(var_49_3, arg_49_0.configId)

	if var_49_4 == 1 then
		arg_49_0.testShip = {
			2,
			3,
			4
		}
	elseif var_49_4 == 2 then
		arg_49_0.testShip = {
			5
		}
	elseif var_49_4 == 3 then
		arg_49_0.testShip = {
			6
		}
	else
		arg_49_0.testShip = nil
	end

	arg_49_0.maxIntimacy = pg.intimacy_template[#pg.intimacy_template.all].upper_bound

	local var_49_5 = 0

	if not HXSet.isHxSkin() then
		var_49_5 = arg_49_1.skin_id or 0
	end

	if var_49_5 == 0 then
		var_49_5 = arg_49_0:getConfig("skin_id")
	end

	arg_49_0:updateSkinId(var_49_5)

	if arg_49_1.name and arg_49_1.name ~= "" then
		arg_49_0.name = arg_49_1.name
	elseif arg_49_0:isRemoulded() then
		arg_49_0.name = pg.ship_skin_template[arg_49_0:getRemouldSkinId()].name
	else
		arg_49_0.name = pg.ship_data_statistics[arg_49_0.configId].name
	end

	arg_49_0.maxLevel = arg_49_1.max_level
	arg_49_0.proficiency = arg_49_1.proficiency or 0
	arg_49_0.preferenceTag = arg_49_1.common_flag
	arg_49_0.hpRant = 10000
	arg_49_0.strategies = {}
	arg_49_0.triggers = {}
	arg_49_0.commanderId = arg_49_1.commanderid or 0
	arg_49_0.activityNpc = arg_49_1.activity_npc or 0

	if var_0_0.isMetaShipByConfigID(arg_49_0.configId) then
		local var_49_6 = MetaCharacterConst.GetMetaShipGroupIDByConfigID(arg_49_0.configId)

		arg_49_0.metaCharacter = MetaCharacter.New({
			id = var_49_6,
			repair_attr_info = arg_49_1.meta_repair_list
		}, arg_49_0)
	end
end

function var_0_0.isMetaShipByConfigID(arg_50_0)
	local var_50_0 = pg.ship_meta_breakout.all
	local var_50_1 = var_50_0[1]
	local var_50_2 = false

	if var_50_1 <= arg_50_0 then
		for iter_50_0, iter_50_1 in ipairs(var_50_0) do
			if arg_50_0 == iter_50_1 then
				var_50_2 = true

				break
			end
		end
	end

	return var_50_2
end

function var_0_0.isMetaShip(arg_51_0)
	return arg_51_0.metaCharacter ~= nil
end

function var_0_0.getMetaCharacter(arg_52_0)
	return arg_52_0.metaCharacter
end

function var_0_0.unlockActivityNpc(arg_53_0, arg_53_1)
	arg_53_0.activityNpc = arg_53_1
end

function var_0_0.isActivityNpc(arg_54_0)
	return arg_54_0.activityNpc > 0
end

function var_0_0.getActiveEquipments(arg_55_0)
	local var_55_0 = Clone(arg_55_0.equipments)

	for iter_55_0 = #var_55_0, 1, -1 do
		local var_55_1 = var_55_0[iter_55_0]

		if var_55_1 then
			for iter_55_1 = 1, iter_55_0 - 1 do
				local var_55_2 = var_55_0[iter_55_1]

				if var_55_2 and var_55_1:getConfig("equip_limit") ~= 0 and var_55_2:getConfig("equip_limit") == var_55_1:getConfig("equip_limit") then
					var_55_0[iter_55_0] = false
				end
			end
		end
	end

	return var_55_0
end

function var_0_0.getAllEquipments(arg_56_0)
	return arg_56_0.equipments
end

function var_0_0.isBluePrintShip(arg_57_0)
	return arg_57_0.bluePrintFlag == 1
end

function var_0_0.getSkinId(arg_58_0)
	return arg_58_0.skinId
end

function var_0_0.updateSkinId(arg_59_0, arg_59_1)
	if not arg_59_1 or arg_59_1 == 0 then
		arg_59_1 = arg_59_0:getConfig("skin_id")
	end

	local var_59_0 = ShipGroup.GetChangeSkinGroupId(arg_59_1)

	if var_59_0 then
		local var_59_1 = ShipGroup.GetStoreChangeSkinId(var_59_0, arg_59_0.id)

		arg_59_0.skinId = var_59_1 and var_59_1 or arg_59_1
	else
		arg_59_0.skinId = arg_59_1
	end
end

function var_0_0.updateName(arg_60_0)
	if arg_60_0.name ~= pg.ship_data_statistics[arg_60_0.configId].name then
		return
	end

	if arg_60_0:isRemoulded() then
		arg_60_0.name = pg.ship_skin_template[arg_60_0:getRemouldSkinId()].name
	else
		arg_60_0.name = pg.ship_data_statistics[arg_60_0.configId].name
	end
end

function var_0_0.isRemoulded(arg_61_0)
	if arg_61_0.remoulded then
		return true
	end

	local var_61_0 = pg.ship_data_trans[arg_61_0.groupId]

	if var_61_0 then
		for iter_61_0, iter_61_1 in ipairs(var_61_0.transform_list) do
			for iter_61_2, iter_61_3 in ipairs(iter_61_1) do
				local var_61_1 = pg.transform_data_template[iter_61_3[2]]

				if var_61_1.skin_id ~= 0 and arg_61_0.transforms[iter_61_3[2]] and arg_61_0.transforms[iter_61_3[2]].level == var_61_1.max_level then
					return true
				end
			end
		end
	end

	return false
end

function var_0_0.getRemouldSkinId(arg_62_0)
	local var_62_0 = ShipGroup.getModSkin(arg_62_0.groupId)

	if var_62_0 then
		return var_62_0.id
	end

	return nil
end

function var_0_0.hasEquipmentSkinInPos(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_0.equipments[arg_63_1]

	return var_63_0 and var_63_0:hasSkin()
end

function var_0_0.getPrefab(arg_64_0)
	local var_64_0 = arg_64_0.skinId

	if arg_64_0:hasEquipmentSkinInPos(var_0_2) then
		local var_64_1 = arg_64_0:getEquip(var_0_2)
		local var_64_2 = var_0_7[var_64_1:getSkinId()].ship_skin_id

		var_64_0 = var_64_2 ~= 0 and var_64_2 or var_64_0
	end

	local var_64_3 = pg.ship_skin_template[var_64_0]

	assert(var_64_3, "ship_skin_template not exist: " .. arg_64_0.configId .. " " .. var_64_0)

	return var_64_3.prefab
end

function var_0_0.getAttachmentPrefab(arg_65_0)
	local var_65_0 = {}

	for iter_65_0, iter_65_1 in ipairs(arg_65_0.equipments) do
		if iter_65_1 and iter_65_1:hasSkinOrbit() then
			local var_65_1 = iter_65_1:getSkinId()
			local var_65_2 = var_0_7[var_65_1]

			var_65_0[var_65_1] = {
				config = var_65_2,
				index = iter_65_0
			}
		end
	end

	return var_65_0
end

function var_0_0.getPainting(arg_66_0)
	local var_66_0 = pg.ship_skin_template[arg_66_0.skinId]

	assert(var_66_0, "ship_skin_template not exist: " .. arg_66_0.configId .. " " .. arg_66_0.skinId)

	return var_66_0.painting
end

function var_0_0.GetSkinConfig(arg_67_0)
	local var_67_0 = pg.ship_skin_template[arg_67_0.skinId]

	assert(var_67_0, "ship_skin_template not exist: " .. arg_67_0.configId .. " " .. arg_67_0.skinId)

	return var_67_0
end

function var_0_0.getRemouldPainting(arg_68_0)
	local var_68_0 = pg.ship_skin_template[arg_68_0:getRemouldSkinId()]

	assert(var_68_0, "ship_skin_template not exist: " .. arg_68_0.configId .. " " .. arg_68_0.skinId)

	return var_68_0.painting
end

function var_0_0.updateStateInfo34(arg_69_0, arg_69_1, arg_69_2)
	arg_69_0.state_info_3 = arg_69_1
	arg_69_0.state_info_4 = arg_69_2
end

function var_0_0.hasStateInfo3Or4(arg_70_0)
	return arg_70_0.state_info_3 ~= 0 or arg_70_0.state_info_4 ~= 0
end

function var_0_0.isTestShip(arg_71_0)
	return arg_71_0.testShip
end

function var_0_0.canUseTestShip(arg_72_0, arg_72_1)
	assert(arg_72_0.testShip, "ship is not TestShip")

	return table.contains(arg_72_0.testShip, arg_72_1)
end

function var_0_0.updateEquip(arg_73_0, arg_73_1, arg_73_2)
	assert(arg_73_2 == nil or arg_73_2.count == 1)

	local var_73_0 = arg_73_0.equipments[arg_73_1]

	arg_73_0.equipments[arg_73_1] = arg_73_2 and Clone(arg_73_2) or false

	local function var_73_1(arg_74_0)
		arg_74_0 = CreateShell(arg_74_0)
		arg_74_0.shipId = arg_73_0.id
		arg_74_0.shipPos = arg_73_1

		return arg_74_0
	end

	if var_73_0 then
		getProxy(EquipmentProxy):OnShipEquipsRemove(var_73_0, arg_73_0.id, arg_73_1)
		var_73_0:setSkinId(0)
		pg.m02:sendNotification(BayProxy.SHIP_EQUIPMENT_REMOVED, var_73_1(var_73_0))
	end

	if arg_73_2 then
		getProxy(EquipmentProxy):OnShipEquipsAdd(arg_73_2, arg_73_0.id, arg_73_1)
		arg_73_0:reletiveEquipSkin(arg_73_1)
		pg.m02:sendNotification(BayProxy.SHIP_EQUIPMENT_ADDED, var_73_1(arg_73_2))
	end
end

function var_0_0.reletiveEquipSkin(arg_75_0, arg_75_1)
	if arg_75_0.equipments[arg_75_1] and arg_75_0.equipmentSkins[arg_75_1] ~= 0 then
		local var_75_0 = pg.equip_skin_template[arg_75_0.equipmentSkins[arg_75_1]].equip_type
		local var_75_1 = arg_75_0.equipments[arg_75_1]:getType()

		if table.contains(var_75_0, var_75_1) then
			arg_75_0.equipments[arg_75_1]:setSkinId(arg_75_0.equipmentSkins[arg_75_1])
		else
			arg_75_0.equipments[arg_75_1]:setSkinId(0)
		end
	elseif arg_75_0.equipments[arg_75_1] then
		arg_75_0.equipments[arg_75_1]:setSkinId(0)
	end
end

function var_0_0.updateEquipmentSkin(arg_76_0, arg_76_1, arg_76_2)
	if not arg_76_1 then
		return
	end

	if arg_76_2 and arg_76_2 > 0 then
		local var_76_0 = arg_76_0:getSkinTypes(arg_76_1)
		local var_76_1 = pg.equip_skin_template[arg_76_2].equip_type
		local var_76_2 = false

		for iter_76_0, iter_76_1 in ipairs(var_76_0) do
			for iter_76_2, iter_76_3 in ipairs(var_76_1) do
				if iter_76_1 == iter_76_3 then
					var_76_2 = true

					break
				end
			end
		end

		if not var_76_2 then
			assert(var_76_2, "部位" .. arg_76_1 .. " 无法穿戴皮肤 " .. arg_76_2)

			return
		end

		local var_76_3 = arg_76_0.equipments[arg_76_1] and arg_76_0.equipments[arg_76_1]:getType() or false

		arg_76_0.equipmentSkins[arg_76_1] = arg_76_2

		if var_76_3 and table.contains(var_76_1, var_76_3) then
			arg_76_0.equipments[arg_76_1]:setSkinId(arg_76_0.equipmentSkins[arg_76_1])
		elseif var_76_3 and not table.contains(var_76_1, var_76_3) then
			arg_76_0.equipments[arg_76_1]:setSkinId(0)
		end
	else
		arg_76_0.equipmentSkins[arg_76_1] = 0

		if arg_76_0.equipments[arg_76_1] then
			arg_76_0.equipments[arg_76_1]:setSkinId(0)
		end
	end
end

function var_0_0.getEquip(arg_77_0, arg_77_1)
	return Clone(arg_77_0.equipments[arg_77_1])
end

function var_0_0.getEquipSkins(arg_78_0)
	return Clone(arg_78_0.equipmentSkins)
end

function var_0_0.getEquipSkin(arg_79_0, arg_79_1)
	return arg_79_0.equipmentSkins[arg_79_1]
end

function var_0_0.getCanEquipSkin(arg_80_0, arg_80_1)
	local var_80_0 = arg_80_0:getSkinTypes(arg_80_1)

	if var_80_0 and #var_80_0 then
		for iter_80_0, iter_80_1 in ipairs(var_80_0) do
			if pg.equip_data_by_type[iter_80_1].equip_skin == 1 then
				return true
			end
		end
	end

	return false
end

function var_0_0.checkCanEquipSkin(arg_81_0, arg_81_1, arg_81_2)
	if not arg_81_1 or not arg_81_2 then
		return
	end

	local var_81_0 = arg_81_0:getSkinTypes(arg_81_1)
	local var_81_1 = pg.equip_skin_template[arg_81_2].equip_type

	for iter_81_0, iter_81_1 in ipairs(var_81_0) do
		if table.contains(var_81_1, iter_81_1) then
			return true
		end
	end

	return false
end

function var_0_0.getSkinTypes(arg_82_0, arg_82_1)
	return pg.ship_data_template[arg_82_0.configId]["equip_" .. arg_82_1] or {}
end

function var_0_0.updateState(arg_83_0, arg_83_1)
	arg_83_0.state = arg_83_1
end

function var_0_0.addSkillExp(arg_84_0, arg_84_1, arg_84_2)
	local var_84_0 = arg_84_0.skills[arg_84_1] or {
		exp = 0,
		level = 1,
		id = arg_84_1
	}
	local var_84_1 = var_84_0.level and var_84_0.level or 1
	local var_84_2 = pg.skill_need_exp.all[#pg.skill_need_exp.all]

	if var_84_1 == var_84_2 then
		return
	end

	local var_84_3 = var_84_0.exp and arg_84_2 + var_84_0.exp or 0 + arg_84_2

	while var_84_3 >= pg.skill_need_exp[var_84_1].exp do
		var_84_3 = var_84_3 - pg.skill_need_exp[var_84_1].exp
		var_84_1 = var_84_1 + 1

		if var_84_1 == var_84_2 then
			var_84_3 = 0

			break
		end
	end

	arg_84_0:updateSkill({
		id = var_84_0.id,
		level = var_84_1,
		exp = var_84_3
	})
end

function var_0_0.upSkillLevelForMeta(arg_85_0, arg_85_1)
	local var_85_0 = arg_85_0.skills[arg_85_1] or {
		exp = 0,
		level = 0,
		id = arg_85_1
	}
	local var_85_1 = arg_85_0:isSkillLevelMax(arg_85_1)
	local var_85_2 = var_85_0.level

	if not var_85_1 then
		var_85_2 = var_85_2 + 1
	end

	arg_85_0:updateSkill({
		exp = 0,
		id = var_85_0.id,
		level = var_85_2
	})
end

function var_0_0.getMetaSkillLevelBySkillID(arg_86_0, arg_86_1)
	return (arg_86_0.skills[arg_86_1] or {
		exp = 0,
		level = 0,
		id = arg_86_1
	}).level
end

function var_0_0.isSkillLevelMax(arg_87_0, arg_87_1)
	local var_87_0 = arg_87_0.skills[arg_87_1] or {
		exp = 0,
		level = 1,
		id = arg_87_1
	}

	return (var_87_0.level and var_87_0.level or 1) >= pg.skill_data_template[arg_87_1].max_level
end

function var_0_0.isAllMetaSkillLevelMax(arg_88_0)
	local var_88_0 = true
	local var_88_1 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(arg_88_0.configId)

	for iter_88_0, iter_88_1 in ipairs(var_88_1) do
		if not arg_88_0:isSkillLevelMax(iter_88_1) then
			var_88_0 = false

			break
		end
	end

	return var_88_0
end

function var_0_0.isAllMetaSkillLock(arg_89_0)
	local var_89_0 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(arg_89_0.configId)
	local var_89_1 = true

	for iter_89_0, iter_89_1 in ipairs(var_89_0) do
		if arg_89_0:getMetaSkillLevelBySkillID(iter_89_1) > 0 then
			var_89_1 = false

			break
		end
	end

	return var_89_1
end

function var_0_0.bindConfigTable(arg_90_0)
	return pg.ship_data_statistics
end

function var_0_0.isAvaiable(arg_91_0)
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

function var_0_0.intimacyAdditions(arg_92_0, arg_92_1)
	local var_92_0 = pg.intimacy_template[arg_92_0:getIntimacyLevel()].attr_bonus * 0.0001

	for iter_92_0, iter_92_1 in pairs(arg_92_1) do
		if iter_92_0 == AttributeType.Durability or iter_92_0 == AttributeType.Cannon or iter_92_0 == AttributeType.Torpedo or iter_92_0 == AttributeType.AntiAircraft or iter_92_0 == AttributeType.AntiSub or iter_92_0 == AttributeType.Air or iter_92_0 == AttributeType.Reload or iter_92_0 == AttributeType.Hit or iter_92_0 == AttributeType.Dodge then
			arg_92_1[iter_92_0] = arg_92_1[iter_92_0] * (var_92_0 + 1)
		end
	end
end

function var_0_0.getShipProperties(arg_93_0)
	local var_93_0 = arg_93_0:getBaseProperties()

	if arg_93_0:isBluePrintShip() then
		local var_93_1 = arg_93_0:getBluePrint()

		assert(var_93_1, "blueprint can not be nil" .. arg_93_0.configId)

		local var_93_2 = var_93_1:getTotalAdditions()

		for iter_93_0, iter_93_1 in pairs(var_93_2) do
			var_93_0[iter_93_0] = var_93_0[iter_93_0] + calcFloor(iter_93_1)
		end

		arg_93_0:intimacyAdditions(var_93_0)
	elseif arg_93_0:isMetaShip() then
		assert(arg_93_0.metaCharacter)

		for iter_93_2, iter_93_3 in pairs(var_93_0) do
			var_93_0[iter_93_2] = var_93_0[iter_93_2] + arg_93_0.metaCharacter:getAttrAddition(iter_93_2)
		end

		arg_93_0:intimacyAdditions(var_93_0)
	else
		local var_93_3 = pg.ship_data_template[arg_93_0.configId].strengthen_id
		local var_93_4 = var_0_5[var_93_3]

		for iter_93_4, iter_93_5 in pairs(arg_93_0.strengthList) do
			local var_93_5 = ShipModAttr.ATTR_TO_INDEX[iter_93_4]
			local var_93_6 = math.min(iter_93_5, var_93_4.durability[var_93_5] * var_93_4.level_exp[var_93_5])
			local var_93_7 = math.max(arg_93_0:getModExpRatio(iter_93_4), 1)

			var_93_0[iter_93_4] = var_93_0[iter_93_4] + calcFloor(var_93_6 / var_93_7)
		end

		arg_93_0:intimacyAdditions(var_93_0)

		for iter_93_6, iter_93_7 in pairs(arg_93_0.transforms) do
			local var_93_8 = pg.transform_data_template[iter_93_7.id].effect

			for iter_93_8 = 1, iter_93_7.level do
				local var_93_9 = var_93_8[iter_93_8] or {}

				for iter_93_9, iter_93_10 in pairs(var_93_0) do
					if var_93_9[iter_93_9] then
						var_93_0[iter_93_9] = var_93_0[iter_93_9] + var_93_9[iter_93_9]
					end
				end
			end
		end
	end

	return var_93_0
end

function var_0_0.getTechNationAddition(arg_94_0, arg_94_1)
	local var_94_0 = getProxy(TechnologyNationProxy)
	local var_94_1 = arg_94_0:getConfig("type")

	if var_94_1 == ShipType.DaoQuV or var_94_1 == ShipType.DaoQuM then
		var_94_1 = ShipType.QuZhu
	end

	return var_94_0:getShipAddition(var_94_1, arg_94_1)
end

function var_0_0.getTechNationMaxAddition(arg_95_0, arg_95_1)
	local var_95_0 = getProxy(TechnologyNationProxy)
	local var_95_1 = arg_95_0:getConfig("type")

	return var_95_0:getShipMaxAddition(var_95_1, arg_95_1)
end

function var_0_0.getEquipProficiencyByPos(arg_96_0, arg_96_1)
	return arg_96_0:getEquipProficiencyList()[arg_96_1]
end

function var_0_0.getEquipProficiencyList(arg_97_0)
	local var_97_0 = arg_97_0:getConfigTable()
	local var_97_1 = Clone(var_97_0.equipment_proficiency)

	if arg_97_0:isBluePrintShip() then
		local var_97_2 = arg_97_0:getBluePrint()

		assert(var_97_2, "blueprint can not be nil >>>" .. arg_97_0.groupId)

		var_97_1 = var_97_2:getEquipProficiencyList(arg_97_0)
	else
		for iter_97_0, iter_97_1 in ipairs(var_97_1) do
			local var_97_3 = 0

			for iter_97_2, iter_97_3 in pairs(arg_97_0.transforms) do
				local var_97_4 = pg.transform_data_template[iter_97_3.id].effect

				for iter_97_4 = 1, iter_97_3.level do
					local var_97_5 = var_97_4[iter_97_4] or {}

					if var_97_5["equipment_proficiency_" .. iter_97_0] then
						var_97_3 = var_97_3 + var_97_5["equipment_proficiency_" .. iter_97_0]
					end
				end
			end

			var_97_1[iter_97_0] = iter_97_1 + var_97_3
		end
	end

	return var_97_1
end

function var_0_0.getBaseProperties(arg_98_0)
	local var_98_0 = arg_98_0:getConfigTable()

	assert(var_98_0, "配置表没有这艘船" .. arg_98_0.configId)

	local var_98_1 = {}
	local var_98_2 = {}

	for iter_98_0, iter_98_1 in ipairs(var_0_0.PROPERTIES) do
		var_98_1[iter_98_1] = arg_98_0:getGrowthForAttr(iter_98_1)
		var_98_2[iter_98_1] = var_98_1[iter_98_1]
	end

	for iter_98_2, iter_98_3 in ipairs(arg_98_0:getConfig("lock")) do
		var_98_2[iter_98_3] = var_98_1[iter_98_3]
	end

	for iter_98_4, iter_98_5 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_98_2[iter_98_5] = var_98_0[iter_98_5]
	end

	for iter_98_6, iter_98_7 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_98_2[iter_98_7] = 0
	end

	return var_98_2
end

function var_0_0.getGrowthForAttr(arg_99_0, arg_99_1)
	local var_99_0 = arg_99_0:getConfigTable()
	local var_99_1 = table.indexof(var_0_0.PROPERTIES, arg_99_1)
	local var_99_2 = pg.gameset.extra_attr_level_limit.key_value
	local var_99_3 = var_99_0.attrs[var_99_1] + (arg_99_0.level - 1) * var_99_0.attrs_growth[var_99_1] / 1000

	if var_99_2 < arg_99_0.level then
		var_99_3 = var_99_3 + (arg_99_0.level - var_99_2) * var_99_0.attrs_growth_extra[var_99_1] / 1000
	end

	return var_99_3
end

function var_0_0.isMaxStar(arg_100_0)
	return arg_100_0:getStar() >= arg_100_0:getMaxStar()
end

function var_0_0.IsMaxStarByTmpID(arg_101_0)
	local var_101_0 = pg.ship_data_template[arg_101_0]

	return var_101_0.star >= var_101_0.star_max
end

function var_0_0.IsSpweaponUnlock(arg_102_0)
	if not arg_102_0:CanAccumulateExp() then
		return false, "spweapon_tip_locked"
	else
		return true
	end
end

function var_0_0.getModProperties(arg_103_0, arg_103_1)
	return arg_103_0.strengthList[arg_103_1] or 0
end

function var_0_0.addModAttrExp(arg_104_0, arg_104_1, arg_104_2)
	local var_104_0 = arg_104_0:getModAttrTopLimit(arg_104_1)

	if var_104_0 == 0 then
		return
	end

	local var_104_1 = arg_104_0:getModExpRatio(arg_104_1)
	local var_104_2 = arg_104_0:getModProperties(arg_104_1)

	if var_104_2 + arg_104_2 > var_104_0 * var_104_1 then
		arg_104_0.strengthList[arg_104_1] = var_104_0 * var_104_1
	else
		arg_104_0.strengthList[arg_104_1] = var_104_2 + arg_104_2
	end
end

function var_0_0.getNeedModExp(arg_105_0)
	local var_105_0 = {}

	for iter_105_0, iter_105_1 in pairs(ShipModAttr.ID_TO_ATTR) do
		local var_105_1 = arg_105_0:getModAttrTopLimit(iter_105_1)

		if var_105_1 == 0 then
			var_105_0[iter_105_1] = 0
		else
			var_105_0[iter_105_1] = var_105_1 * arg_105_0:getModExpRatio(iter_105_1) - arg_105_0:getModProperties(iter_105_1)
		end
	end

	return var_105_0
end

function var_0_0.attrVertify(arg_106_0)
	if not BayProxy.checkShiplevelVertify(arg_106_0) then
		return false
	end

	for iter_106_0, iter_106_1 in ipairs(arg_106_0.equipments) do
		if iter_106_1 and not iter_106_1:vertify() then
			return false
		end
	end

	return true
end

function var_0_0.getEquipmentProperties(arg_107_0)
	local var_107_0 = {}
	local var_107_1 = {}

	for iter_107_0, iter_107_1 in ipairs(var_0_0.PROPERTIES) do
		var_107_0[iter_107_1] = 0
	end

	for iter_107_2, iter_107_3 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_107_0[iter_107_3] = 0
	end

	for iter_107_4, iter_107_5 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_107_0[iter_107_5] = 0
	end

	for iter_107_6, iter_107_7 in ipairs(var_0_0.PROPERTIES_ENHANCEMENT) do
		var_107_1[iter_107_7] = 0
	end

	var_107_0[AttributeType.AirDominate] = 0
	var_107_0[AttributeType.AntiSiren] = 0

	local var_107_2 = arg_107_0:getActiveEquipments()

	for iter_107_8, iter_107_9 in ipairs(var_107_2) do
		if iter_107_9 then
			local var_107_3 = iter_107_9:GetAttributes()

			for iter_107_10, iter_107_11 in ipairs(var_107_3) do
				if iter_107_11 and var_107_0[iter_107_11.type] then
					var_107_0[iter_107_11.type] = var_107_0[iter_107_11.type] + iter_107_11.value
				end
			end

			local var_107_4 = iter_107_9:GetPropertyRate()

			for iter_107_12, iter_107_13 in pairs(var_107_4) do
				var_107_1[iter_107_12] = math.max(var_107_1[iter_107_12], iter_107_13)
			end

			local var_107_5 = iter_107_9:GetSonarProperty()

			if var_107_5 then
				for iter_107_14, iter_107_15 in pairs(var_107_5) do
					var_107_0[iter_107_14] = var_107_0[iter_107_14] + iter_107_15
				end
			end

			local var_107_6 = iter_107_9:GetAntiSirenPower()

			if var_107_6 then
				var_107_0[AttributeType.AntiSiren] = var_107_0[AttributeType.AntiSiren] + var_107_6 / 10000
			end
		end
	end

	;(function()
		local var_108_0 = arg_107_0:GetSpWeapon()

		if not var_108_0 then
			return
		end

		local var_108_1 = var_108_0:GetPropertiesInfo().attrs

		for iter_108_0, iter_108_1 in ipairs(var_108_1) do
			if iter_108_1 and var_107_0[iter_108_1.type] then
				var_107_0[iter_108_1.type] = var_107_0[iter_108_1.type] + iter_108_1.value
			end
		end
	end)()

	for iter_107_16, iter_107_17 in pairs(var_107_1) do
		var_107_1[iter_107_16] = iter_107_17 + 1
	end

	return var_107_0, var_107_1
end

function var_0_0.getSkillEffects(arg_109_0)
	local var_109_0 = arg_109_0:getShipSkillEffects()

	_.each(arg_109_0:getEquipmentSkillEffects(), function(arg_110_0)
		table.insert(var_109_0, arg_110_0)
	end)

	return var_109_0
end

function var_0_0.getShipSkillEffects(arg_111_0)
	local var_111_0 = {}
	local var_111_1 = arg_111_0:getSkillList()

	for iter_111_0, iter_111_1 in ipairs(var_111_1) do
		local var_111_2 = arg_111_0:RemapSkillId(iter_111_1)
		local var_111_3 = pg.buffCfg["buff_" .. var_111_2]

		arg_111_0:FilterActiveSkill(var_111_0, var_111_3, arg_111_0.skills[iter_111_1])
	end

	return var_111_0
end

function var_0_0.getEquipmentSkillEffects(arg_112_0)
	local var_112_0 = {}
	local var_112_1 = arg_112_0:getActiveEquipments()

	for iter_112_0, iter_112_1 in ipairs(var_112_1) do
		local var_112_2
		local var_112_3 = iter_112_1 and iter_112_1:getConfig("skill_id")[1]

		if var_112_3 then
			var_112_2 = pg.buffCfg["buff_" .. var_112_3]
		end

		arg_112_0:FilterActiveSkill(var_112_0, var_112_2)
	end

	;(function()
		local var_113_0 = arg_112_0:GetSpWeapon()
		local var_113_1 = var_113_0 and var_113_0:GetEffect() or 0
		local var_113_2

		if var_113_1 > 0 then
			var_113_2 = pg.buffCfg["buff_" .. var_113_1]
		end

		arg_112_0:FilterActiveSkill(var_112_0, var_113_2)
	end)()

	return var_112_0
end

function var_0_0.FilterActiveSkill(arg_114_0, arg_114_1, arg_114_2, arg_114_3)
	if not arg_114_2 or not arg_114_2.const_effect_list then
		return
	end

	for iter_114_0 = 1, #arg_114_2.const_effect_list do
		local var_114_0 = arg_114_2.const_effect_list[iter_114_0]
		local var_114_1 = var_114_0.trigger
		local var_114_2 = var_114_0.arg_list
		local var_114_3 = 1

		if arg_114_3 then
			var_114_3 = arg_114_3.level

			local var_114_4 = arg_114_2[var_114_3].const_effect_list

			if var_114_4 and var_114_4[iter_114_0] then
				var_114_1 = var_114_4[iter_114_0].trigger or var_114_1
				var_114_2 = var_114_4[iter_114_0].arg_list or var_114_2
			end
		end

		local var_114_5 = true

		for iter_114_1, iter_114_2 in pairs(var_114_1) do
			if arg_114_0.triggers[iter_114_1] ~= iter_114_2 then
				var_114_5 = false

				break
			end
		end

		if var_114_5 then
			table.insert(arg_114_1, {
				type = var_114_0.type,
				arg_list = var_114_2,
				level = var_114_3
			})
		end
	end
end

function var_0_0.getEquipmentGearScore(arg_115_0)
	local var_115_0 = 0
	local var_115_1 = arg_115_0:getActiveEquipments()

	for iter_115_0, iter_115_1 in ipairs(var_115_1) do
		if iter_115_1 then
			var_115_0 = var_115_0 + iter_115_1:GetGearScore()
		end
	end

	return var_115_0
end

function var_0_0.getProperties(arg_116_0, arg_116_1, arg_116_2, arg_116_3, arg_116_4)
	local var_116_0 = arg_116_1 or {}
	local var_116_1 = arg_116_0:getConfig("nationality")
	local var_116_2 = arg_116_0:getConfig("type")
	local var_116_3 = arg_116_0:getShipProperties()
	local var_116_4, var_116_5 = arg_116_0:getEquipmentProperties()
	local var_116_6
	local var_116_7
	local var_116_8

	if arg_116_3 and arg_116_0:getFlag("inWorld") then
		local var_116_9 = WorldConst.FetchWorldShip(arg_116_0.id)

		var_116_6, var_116_7 = var_116_9:GetShipBuffProperties()
		var_116_8 = var_116_9:GetShipPowerBuffProperties()
	end

	for iter_116_0, iter_116_1 in ipairs(var_0_0.PROPERTIES) do
		local var_116_10 = 0
		local var_116_11 = 0

		for iter_116_2, iter_116_3 in pairs(var_116_0) do
			var_116_10 = var_116_10 + iter_116_3:getAttrRatioAddition(iter_116_1, var_116_1, var_116_2) / 100
			var_116_11 = var_116_11 + iter_116_3:getAttrValueAddition(iter_116_1, var_116_1, var_116_2)
		end

		local var_116_12 = var_116_10 + (var_116_5[iter_116_1] or 1)
		local var_116_13 = var_116_7 and var_116_7[iter_116_1] or 1
		local var_116_14 = var_116_6 and var_116_6[iter_116_1] or 0

		if iter_116_1 == AttributeType.Speed then
			var_116_3[iter_116_1] = var_116_3[iter_116_1] * var_116_12 * var_116_13 + var_116_11 + var_116_4[iter_116_1] + var_116_14
		else
			var_116_3[iter_116_1] = calcFloor(calcFloor(var_116_3[iter_116_1]) * var_116_12 * var_116_13) + var_116_11 + var_116_4[iter_116_1] + var_116_14
		end
	end

	if not arg_116_2 and arg_116_0:isMaxStar() then
		for iter_116_4, iter_116_5 in pairs(var_116_3) do
			local var_116_15 = arg_116_4 and arg_116_0:getTechNationMaxAddition(iter_116_4) or arg_116_0:getTechNationAddition(iter_116_4)

			var_116_3[iter_116_4] = var_116_3[iter_116_4] + var_116_15
		end
	end

	for iter_116_6, iter_116_7 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_116_3[iter_116_7] = var_116_3[iter_116_7] + var_116_4[iter_116_7]
	end

	for iter_116_8, iter_116_9 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_116_3[iter_116_9] = var_116_3[iter_116_9] + var_116_4[iter_116_9]
	end

	if arg_116_3 then
		var_116_3[AttributeType.AntiSiren] = (var_116_3[AttributeType.AntiSiren] or 0) + var_116_4[AttributeType.AntiSiren]
	end

	if var_116_8 then
		for iter_116_10, iter_116_11 in pairs(var_116_8) do
			if var_116_3[iter_116_10] then
				if iter_116_10 == AttributeType.Speed then
					var_116_3[iter_116_10] = var_116_3[iter_116_10] * iter_116_11
				else
					var_116_3[iter_116_10] = math.floor(var_116_3[iter_116_10] * iter_116_11)
				end
			end
		end
	end

	return var_116_3
end

function var_0_0.getTransGearScore(arg_117_0)
	local var_117_0 = 0
	local var_117_1 = pg.transform_data_template

	for iter_117_0, iter_117_1 in pairs(arg_117_0.transforms) do
		for iter_117_2 = 1, iter_117_1.level do
			var_117_0 = var_117_0 + (var_117_1[iter_117_1.id].gear_score[iter_117_2] or 0)
		end
	end

	return var_117_0
end

function var_0_0.getShipCombatPower(arg_118_0, arg_118_1)
	local var_118_0 = arg_118_0:getProperties(arg_118_1, nil, nil, true)
	local var_118_1 = var_118_0[AttributeType.Durability] / 5 + var_118_0[AttributeType.Cannon] + var_118_0[AttributeType.Torpedo] + var_118_0[AttributeType.AntiAircraft] + var_118_0[AttributeType.Air] + var_118_0[AttributeType.AntiSub] + var_118_0[AttributeType.Reload] + var_118_0[AttributeType.Hit] * 2 + var_118_0[AttributeType.Dodge] * 2 + var_118_0[AttributeType.Speed] + arg_118_0:getEquipmentGearScore() + arg_118_0:getTransGearScore()

	return math.floor(var_118_1)
end

function var_0_0.cosumeEnergy(arg_119_0, arg_119_1)
	arg_119_0:setEnergy(math.max(arg_119_0:getEnergy() - arg_119_1, 0))
end

function var_0_0.addEnergy(arg_120_0, arg_120_1)
	arg_120_0:setEnergy(arg_120_0:getEnergy() + arg_120_1)
end

function var_0_0.setEnergy(arg_121_0, arg_121_1)
	arg_121_0.energy = arg_121_1
end

function var_0_0.setLikability(arg_122_0, arg_122_1)
	assert(arg_122_1 >= 0 and arg_122_1 <= arg_122_0.maxIntimacy, "intimacy value invaild" .. arg_122_1)
	arg_122_0:setIntimacy(arg_122_1)
end

function var_0_0.addLikability(arg_123_0, arg_123_1)
	local var_123_0 = Mathf.Clamp(arg_123_0:getIntimacy() + arg_123_1, 0, arg_123_0.maxIntimacy)

	arg_123_0:setIntimacy(var_123_0)
end

function var_0_0.setIntimacy(arg_124_0, arg_124_1)
	if arg_124_1 > 10000 and not arg_124_0.propose then
		arg_124_1 = 10000
	end

	arg_124_0.intimacy = arg_124_1

	if not arg_124_0:isActivityNpc() then
		getProxy(CollectionProxy).shipGroups[arg_124_0.groupId]:updateMaxIntimacy(arg_124_0:getIntimacy())
	end
end

function var_0_0.getLevelExpConfig(arg_125_0, arg_125_1)
	if arg_125_0:getConfig("rarity") == ShipRarity.SSR then
		local var_125_0 = Clone(getConfigFromLevel1(var_0_6, arg_125_1 or arg_125_0.level))

		var_125_0.exp = var_125_0.exp_ur
		var_125_0.exp_start = var_125_0.exp_ur_start
		var_125_0.exp_interval = var_125_0.exp_ur_interval
		var_125_0.exp_end = var_125_0.exp_ur_end

		return var_125_0
	else
		return getConfigFromLevel1(var_0_6, arg_125_1 or arg_125_0.level)
	end
end

function var_0_0.getExp(arg_126_0)
	local var_126_0 = arg_126_0:getMaxLevel()

	if arg_126_0.level == var_126_0 and LOCK_FULL_EXP then
		return 0
	end

	return arg_126_0.exp
end

function var_0_0.getProficiency(arg_127_0)
	return arg_127_0.proficiency
end

function var_0_0.addExp(arg_128_0, arg_128_1, arg_128_2)
	local var_128_0 = arg_128_0:getMaxLevel()

	if arg_128_0.level == var_128_0 then
		if arg_128_0.exp >= pg.gameset.exp_overflow_max.key_value then
			return
		end

		if LOCK_FULL_EXP or not arg_128_2 or not arg_128_0:CanAccumulateExp() then
			arg_128_1 = 0
		end
	end

	arg_128_0.exp = arg_128_0.exp + arg_128_1

	local var_128_1 = false

	while arg_128_0:canLevelUp() do
		arg_128_0.exp = arg_128_0.exp - arg_128_0:getLevelExpConfig().exp_interval
		arg_128_0.level = math.min(arg_128_0.level + 1, var_128_0)
		var_128_1 = true
	end

	if arg_128_0.level == var_128_0 then
		if arg_128_2 and arg_128_0:CanAccumulateExp() then
			arg_128_0.exp = math.min(arg_128_0.exp, pg.gameset.exp_overflow_max.key_value)
		elseif var_128_1 then
			arg_128_0.exp = 0
		end
	end
end

function var_0_0.getMaxLevel(arg_129_0)
	return arg_129_0.maxLevel
end

function var_0_0.canLevelUp(arg_130_0)
	local var_130_0 = arg_130_0:getLevelExpConfig(arg_130_0.level + 1)
	local var_130_1 = arg_130_0:getMaxLevel() <= arg_130_0.level

	return var_130_0 and arg_130_0:getLevelExpConfig().exp_interval <= arg_130_0.exp and not var_130_1
end

function var_0_0.getConfigMaxLevel(arg_131_0)
	return var_0_6.all[#var_0_6.all]
end

function var_0_0.isConfigMaxLevel(arg_132_0)
	return arg_132_0.level == arg_132_0:getConfigMaxLevel()
end

function var_0_0.updateMaxLevel(arg_133_0, arg_133_1)
	local var_133_0 = arg_133_0:getConfigMaxLevel()

	arg_133_0.maxLevel = math.max(math.min(var_133_0, arg_133_1), arg_133_0.maxLevel)
end

function var_0_0.getNextMaxLevel(arg_134_0)
	local var_134_0 = arg_134_0:getConfigMaxLevel()

	for iter_134_0 = arg_134_0:getMaxLevel() + 1, var_134_0 do
		if var_0_6[iter_134_0].level_limit == 1 then
			return iter_134_0
		end
	end
end

function var_0_0.canUpgrade(arg_135_0)
	if arg_135_0:isBluePrintShip() then
		return false
	end

	if arg_135_0:isMetaShip() then
		local var_135_0 = arg_135_0:getMetaCharacter()

		if not var_135_0 then
			return false
		end

		local var_135_1 = var_135_0:getBreakOutInfo()

		if not var_135_1:hasNextInfo() then
			return false
		end

		local var_135_2, var_135_3 = var_135_1:getLimited()

		if var_135_2 > arg_135_0.level then
			return false
		end

		return true
	else
		local var_135_4 = var_0_8[arg_135_0.configId]

		assert(var_135_4, "不存在配置" .. arg_135_0.configId)

		return not arg_135_0:isMaxStar() and arg_135_0.level >= var_135_4.level
	end
end

function var_0_0.isReachNextMaxLevel(arg_136_0)
	return arg_136_0.level == arg_136_0:getMaxLevel() and arg_136_0:CanAccumulateExp() and arg_136_0:getNextMaxLevel() ~= nil
end

function var_0_0.isAwakening(arg_137_0)
	return arg_137_0:isReachNextMaxLevel() and arg_137_0.level < var_0_4
end

function var_0_0.isAwakening2(arg_138_0)
	return arg_138_0:isReachNextMaxLevel() and arg_138_0.level >= var_0_4
end

function var_0_0.notMaxLevelForFilter(arg_139_0)
	return arg_139_0.level ~= arg_139_0:getMaxLevel()
end

function var_0_0.getNextMaxLevelConsume(arg_140_0)
	local var_140_0 = arg_140_0:getMaxLevel()
	local var_140_1 = var_0_6[var_140_0]["need_item_rarity" .. arg_140_0:getConfig("rarity")]

	assert(var_140_1, "items  can not be nil")

	return _.map(var_140_1, function(arg_141_0)
		return {
			type = arg_141_0[1],
			id = arg_141_0[2],
			count = arg_141_0[3]
		}
	end)
end

function var_0_0.canUpgradeMaxLevel(arg_142_0)
	if not arg_142_0:isReachNextMaxLevel() then
		return false, i18n("upgrade_to_next_maxlevel_failed")
	else
		local var_142_0 = getProxy(PlayerProxy):getData()
		local var_142_1 = getProxy(BagProxy)
		local var_142_2 = arg_142_0:getNextMaxLevelConsume()

		for iter_142_0, iter_142_1 in pairs(var_142_2) do
			if iter_142_1.type == DROP_TYPE_RESOURCE then
				if var_142_0:getResById(iter_142_1.id) < iter_142_1.count then
					return false, i18n("common_no_resource")
				end
			elseif iter_142_1.type == DROP_TYPE_ITEM and var_142_1:getItemCountById(iter_142_1.id) < iter_142_1.count then
				return false, i18n("common_no_item_1")
			end
		end
	end

	return true
end

function var_0_0.CanAccumulateExp(arg_143_0)
	return pg.ship_data_template[arg_143_0.configId].can_get_proficency == 1
end

function var_0_0.getTotalExp(arg_144_0)
	return arg_144_0:getLevelExpConfig().exp_start + arg_144_0.exp
end

function var_0_0.getStartBattleExpend(arg_145_0)
	if table.contains(TeamType.SubShipType, arg_145_0:getShipType()) then
		return 0
	else
		return pg.ship_data_template[arg_145_0.configId].oil_at_start
	end
end

function var_0_0.getEndBattleExpend(arg_146_0)
	local var_146_0 = pg.ship_data_template[arg_146_0.configId]
	local var_146_1 = arg_146_0:getLevelExpConfig()

	return (math.floor(var_146_0.oil_at_end * var_146_1.fight_oil_ratio / 10000))
end

function var_0_0.getBattleTotalExpend(arg_147_0)
	return arg_147_0:getStartBattleExpend() + arg_147_0:getEndBattleExpend()
end

function var_0_0.getShipAmmo(arg_148_0)
	local var_148_0 = arg_148_0:getConfig(AttributeType.Ammo)

	for iter_148_0, iter_148_1 in pairs(arg_148_0:getAllSkills()) do
		local var_148_1 = tonumber(iter_148_0 .. string.format("%.2d", iter_148_1.level))
		local var_148_2 = pg.skill_benefit_template[var_148_1]

		if var_148_2 and arg_148_0:IsBenefitSkillActive(var_148_2) and (var_148_2.type == var_0_0.BENEFIT_EQUIP or var_148_2.type == var_0_0.BENEFIT_SKILL) then
			var_148_0 = var_148_0 + defaultValue(var_148_2.effect[1], 0)
		end
	end

	local var_148_3 = arg_148_0:getActiveEquipments()

	for iter_148_2, iter_148_3 in ipairs(var_148_3) do
		local var_148_4 = iter_148_3 and iter_148_3:getConfig("equip_parameters").ammo

		if var_148_4 then
			var_148_0 = var_148_0 + var_148_4
		end
	end

	return var_148_0
end

function var_0_0.getHuntingLv(arg_149_0)
	local var_149_0 = arg_149_0:getConfig("huntingrange_level")

	for iter_149_0, iter_149_1 in pairs(arg_149_0:getAllSkills()) do
		local var_149_1 = tonumber(iter_149_0 .. string.format("%.2d", iter_149_1.level))
		local var_149_2 = pg.skill_benefit_template[var_149_1]

		if var_149_2 and arg_149_0:IsBenefitSkillActive(var_149_2) and (var_149_2.type == var_0_0.BENEFIT_EQUIP or var_149_2.type == var_0_0.BENEFIT_SKILL) then
			var_149_0 = var_149_0 + defaultValue(var_149_2.effect[2], 0)
		end
	end

	local var_149_3 = arg_149_0:getActiveEquipments()

	for iter_149_2, iter_149_3 in ipairs(var_149_3) do
		local var_149_4 = iter_149_3 and iter_149_3:getConfig("equip_parameters").hunting_lv

		if var_149_4 then
			var_149_0 = var_149_0 + var_149_4
		end
	end

	return (math.min(var_149_0, arg_149_0:getMaxHuntingLv()))
end

function var_0_0.getMapAuras(arg_150_0)
	local var_150_0 = {}

	for iter_150_0, iter_150_1 in pairs(arg_150_0:getAllSkills()) do
		local var_150_1 = tonumber(iter_150_0 .. string.format("%.2d", iter_150_1.level))
		local var_150_2 = pg.skill_benefit_template[var_150_1]

		if var_150_2 and arg_150_0:IsBenefitSkillActive(var_150_2) and var_150_2.type == var_0_0.BENEFIT_MAP_AURA then
			local var_150_3 = {
				id = var_150_2.effect[1],
				level = iter_150_1.level
			}

			table.insert(var_150_0, var_150_3)
		end
	end

	return var_150_0
end

function var_0_0.getMapAids(arg_151_0)
	local var_151_0 = {}

	for iter_151_0, iter_151_1 in pairs(arg_151_0:getAllSkills()) do
		local var_151_1 = tonumber(iter_151_0 .. string.format("%.2d", iter_151_1.level))
		local var_151_2 = pg.skill_benefit_template[var_151_1]

		if var_151_2 and arg_151_0:IsBenefitSkillActive(var_151_2) and var_151_2.type == var_0_0.BENEFIT_AID then
			local var_151_3 = {
				id = var_151_2.effect[1],
				level = iter_151_1.level
			}

			table.insert(var_151_0, var_151_3)
		end
	end

	return var_151_0
end

var_0_0.BENEFIT_SKILL = 2
var_0_0.BENEFIT_EQUIP = 3
var_0_0.BENEFIT_MAP_AURA = 4
var_0_0.BENEFIT_AID = 5

function var_0_0.IsBenefitSkillActive(arg_152_0, arg_152_1)
	local var_152_0 = false

	if arg_152_1.type == var_0_0.BENEFIT_SKILL then
		if not arg_152_1.limit[1] or arg_152_1.limit[1] == arg_152_0.triggers.TeamNumbers then
			var_152_0 = true
		end
	elseif arg_152_1.type == var_0_0.BENEFIT_EQUIP then
		local var_152_1 = arg_152_1.limit
		local var_152_2 = arg_152_0:getAllEquipments()

		for iter_152_0, iter_152_1 in ipairs(var_152_2) do
			if iter_152_1 and table.contains(var_152_1, iter_152_1:getConfig("id")) then
				var_152_0 = true

				break
			end
		end
	elseif arg_152_1.type == var_0_0.BENEFIT_MAP_AURA then
		if arg_152_0.hpRant and arg_152_0.hpRant > 0 then
			return true
		end
	elseif arg_152_1.type == var_0_0.BENEFIT_AID and arg_152_0.hpRant and arg_152_0.hpRant > 0 then
		return true
	end

	return var_152_0
end

function var_0_0.getMaxHuntingLv(arg_153_0)
	return #arg_153_0:getConfig("hunting_range")
end

function var_0_0.getHuntingRange(arg_154_0, arg_154_1)
	local var_154_0 = arg_154_0:getConfig("hunting_range")
	local var_154_1 = Clone(var_154_0[1])
	local var_154_2 = arg_154_1 or arg_154_0:getHuntingLv()
	local var_154_3 = math.min(var_154_2, arg_154_0:getMaxHuntingLv())

	for iter_154_0 = 2, var_154_3 do
		_.each(var_154_0[iter_154_0], function(arg_155_0)
			table.insert(var_154_1, {
				arg_155_0[1],
				arg_155_0[2]
			})
		end)
	end

	return var_154_1
end

function var_0_0.getTriggerSkills(arg_156_0)
	local var_156_0 = {}
	local var_156_1 = arg_156_0:getSkillEffects()

	_.each(var_156_1, function(arg_157_0)
		if arg_157_0.type == "AddBuff" and arg_157_0.arg_list and arg_157_0.arg_list.buff_id then
			local var_157_0 = arg_157_0.arg_list.buff_id

			var_156_0[var_157_0] = {
				id = var_157_0,
				level = arg_157_0.level
			}
		end
	end)

	return var_156_0
end

function var_0_0.GetEquipmentSkills(arg_158_0)
	local var_158_0 = {}
	local var_158_1 = arg_158_0:getActiveEquipments()

	for iter_158_0, iter_158_1 in ipairs(var_158_1) do
		if iter_158_1 then
			local var_158_2 = iter_158_1:getConfig("skill_id")[1]

			if var_158_2 then
				var_158_0[var_158_2] = {
					level = 1,
					id = var_158_2
				}
			end
		end
	end

	;(function()
		local var_159_0 = arg_158_0:GetSpWeapon()
		local var_159_1 = var_159_0 and var_159_0:GetEffect() or 0

		if var_159_1 > 0 then
			var_158_0[var_159_1] = {
				level = 1,
				id = var_159_1
			}
		end
	end)()

	return var_158_0
end

function var_0_0.getAllSkills(arg_160_0)
	local var_160_0 = Clone(arg_160_0.skills)

	for iter_160_0, iter_160_1 in pairs(arg_160_0:GetEquipmentSkills()) do
		var_160_0[iter_160_0] = iter_160_1
	end

	for iter_160_2, iter_160_3 in pairs(arg_160_0:getTriggerSkills()) do
		var_160_0[iter_160_2] = iter_160_3
	end

	return var_160_0
end

function var_0_0.isSameKind(arg_161_0, arg_161_1)
	return pg.ship_data_template[arg_161_0.configId].group_type == pg.ship_data_template[arg_161_1.configId].group_type
end

function var_0_0.GetLockState(arg_162_0)
	return arg_162_0.lockState
end

function var_0_0.IsLocked(arg_163_0)
	return arg_163_0.lockState == var_0_0.LOCK_STATE_LOCK
end

function var_0_0.SetLockState(arg_164_0, arg_164_1)
	arg_164_0.lockState = arg_164_1
end

function var_0_0.GetPreferenceTag(arg_165_0)
	return arg_165_0.preferenceTag or 0
end

function var_0_0.IsPreferenceTag(arg_166_0)
	return arg_166_0:GetPreferenceTag() == var_0_0.PREFERENCE_TAG_COMMON
end

function var_0_0.SetPreferenceTag(arg_167_0, arg_167_1)
	arg_167_0.preferenceTag = arg_167_1
end

function var_0_0.calReturnRes(arg_168_0)
	local var_168_0 = pg.ship_data_by_type[arg_168_0:getShipType()]
	local var_168_1 = var_168_0.distory_resource_gold_ratio
	local var_168_2 = var_168_0.distory_resource_oil_ratio
	local var_168_3 = pg.ship_data_by_star[arg_168_0:getConfig("rarity")].destory_item

	return var_168_1, 0, var_168_3
end

function var_0_0.getRarity(arg_169_0)
	local var_169_0 = arg_169_0:getConfig("rarity")

	if arg_169_0:isRemoulded() then
		var_169_0 = var_169_0 + 1
	end

	return var_169_0
end

function var_0_0.getExchangePrice(arg_170_0)
	local var_170_0 = arg_170_0:getConfig("rarity")

	return pg.ship_data_by_star[var_170_0].exchange_price
end

function var_0_0.updateSkill(arg_171_0, arg_171_1)
	local var_171_0 = arg_171_1.skill_id or arg_171_1.id
	local var_171_1 = arg_171_1.skill_lv or arg_171_1.lv or arg_171_1.level
	local var_171_2 = arg_171_1.skill_exp or arg_171_1.exp

	arg_171_0.skills[var_171_0] = {
		id = var_171_0,
		level = var_171_1,
		exp = var_171_2
	}
end

function var_0_0.canEquipAtPos(arg_172_0, arg_172_1, arg_172_2)
	local var_172_0, var_172_1 = arg_172_0:isForbiddenAtPos(arg_172_1, arg_172_2)

	if var_172_0 then
		return false, var_172_1
	end

	for iter_172_0, iter_172_1 in ipairs(arg_172_0.equipments) do
		if iter_172_1 and iter_172_0 ~= arg_172_2 and iter_172_1:getConfig("equip_limit") ~= 0 and arg_172_1:getConfig("equip_limit") == iter_172_1:getConfig("equip_limit") then
			return false, i18n("ship_equip_same_group_equipment")
		end
	end

	return true
end

function var_0_0.isForbiddenAtPos(arg_173_0, arg_173_1, arg_173_2)
	local var_173_0 = pg.ship_data_template[arg_173_0.configId]

	assert(var_173_0, "can not find ship in ship_data_templtae: " .. arg_173_0.configId)

	local var_173_1 = var_173_0["equip_" .. arg_173_2]

	if not table.contains(var_173_1, arg_173_1:getConfig("type")) then
		return true, i18n("common_limit_equip")
	end

	if table.contains(arg_173_1:getConfig("ship_type_forbidden"), arg_173_0:getShipType()) then
		return true, i18n("common_limit_equip")
	end

	return false
end

function var_0_0.canEquipCommander(arg_174_0, arg_174_1)
	if arg_174_1:getShipType() ~= arg_174_0:getShipType() then
		return false, i18n("commander_type_unmatch")
	end

	return true
end

function var_0_0.upgrade(arg_175_0)
	local var_175_0 = pg.ship_data_transform[arg_175_0.configId]

	if var_175_0.trans_id and var_175_0.trans_id > 0 then
		arg_175_0.configId = var_175_0.trans_id
		arg_175_0.star = arg_175_0:getConfig("star")
	end
end

function var_0_0.getTeamType(arg_176_0)
	return TeamType.GetTeamFromShipType(arg_176_0:getShipType())
end

function var_0_0.getFleetName(arg_177_0)
	local var_177_0 = arg_177_0:getTeamType()

	return var_0_1[var_177_0]
end

function var_0_0.getMaxConfigId(arg_178_0)
	local var_178_0 = pg.ship_data_template
	local var_178_1

	for iter_178_0 = 4, 1, -1 do
		local var_178_2 = tonumber(arg_178_0.groupId .. iter_178_0)

		if var_178_0[var_178_2] then
			var_178_1 = var_178_2

			break
		end
	end

	return var_178_1
end

function var_0_0.getFlag(arg_179_0, arg_179_1, arg_179_2)
	return pg.ShipFlagMgr.GetInstance():GetShipFlag(arg_179_0.id, arg_179_1, arg_179_2)
end

function var_0_0.hasAnyFlag(arg_180_0, arg_180_1)
	return _.any(arg_180_1, function(arg_181_0)
		return arg_180_0:getFlag(arg_181_0)
	end)
end

function var_0_0.isBreakOut(arg_182_0)
	return arg_182_0.configId % 10 > 1
end

function var_0_0.fateSkillChange(arg_183_0, arg_183_1)
	if not arg_183_0.skillChangeList then
		arg_183_0.skillChangeList = arg_183_0:isBluePrintShip() and arg_183_0:getBluePrint():getChangeSkillList() or {}
	end

	for iter_183_0, iter_183_1 in ipairs(arg_183_0.skillChangeList) do
		if iter_183_1[1] == arg_183_1 and arg_183_0.skills[iter_183_1[2]] then
			return iter_183_1[2]
		end
	end

	return arg_183_1
end

function var_0_0.RemapSkillId(arg_184_0, arg_184_1)
	local var_184_0 = arg_184_0:GetSpWeapon()

	if var_184_0 then
		return var_184_0:RemapSkillId(arg_184_1)
	end

	return arg_184_1
end

function var_0_0.getSkillList(arg_185_0)
	local var_185_0 = pg.ship_data_template[arg_185_0.configId]
	local var_185_1 = Clone(var_185_0.buff_list_display)
	local var_185_2 = Clone(var_185_0.buff_list)
	local var_185_3 = pg.ship_data_trans[arg_185_0.groupId]
	local var_185_4 = 0

	if var_185_3 and var_185_3.skill_id ~= 0 then
		local var_185_5 = var_185_3.skill_id
		local var_185_6 = pg.transform_data_template[var_185_5]

		if arg_185_0.transforms[var_185_5] and var_185_6.skill_id ~= 0 then
			table.insert(var_185_2, var_185_6.skill_id)
		end
	end

	local var_185_7 = {}

	for iter_185_0, iter_185_1 in ipairs(var_185_1) do
		for iter_185_2, iter_185_3 in ipairs(var_185_2) do
			if iter_185_1 == iter_185_3 then
				table.insert(var_185_7, arg_185_0:fateSkillChange(iter_185_1))
			end
		end
	end

	return var_185_7
end

function var_0_0.getModAttrTopLimit(arg_186_0, arg_186_1)
	local var_186_0 = ShipModAttr.ATTR_TO_INDEX[arg_186_1]
	local var_186_1 = pg.ship_data_template[arg_186_0.configId].strengthen_id
	local var_186_2 = pg.ship_data_strengthen[var_186_1].durability[var_186_0]

	return calcFloor((3 + 7 * (math.min(arg_186_0.level, 100) / 100)) * var_186_2 * 0.1)
end

function var_0_0.leftModAdditionPoint(arg_187_0, arg_187_1)
	local var_187_0 = arg_187_0:getModProperties(arg_187_1)
	local var_187_1 = arg_187_0:getModExpRatio(arg_187_1)
	local var_187_2 = arg_187_0:getModAttrTopLimit(arg_187_1)
	local var_187_3 = calcFloor(var_187_0 / var_187_1)

	return math.max(0, var_187_2 - var_187_3)
end

function var_0_0.getModAttrBaseMax(arg_188_0, arg_188_1)
	if not table.contains(arg_188_0:getConfig("lock"), arg_188_1) then
		local var_188_0 = arg_188_0:leftModAdditionPoint(arg_188_1)
		local var_188_1 = arg_188_0:getShipProperties()

		return calcFloor(var_188_1[arg_188_1] + var_188_0)
	else
		return 0
	end
end

function var_0_0.getModExpRatio(arg_189_0, arg_189_1)
	if not table.contains(arg_189_0:getConfig("lock"), arg_189_1) then
		local var_189_0 = pg.ship_data_template[arg_189_0.configId].strengthen_id

		assert(pg.ship_data_strengthen[var_189_0], "ship_data_strengthen>>>>>>" .. var_189_0)

		return math.max(pg.ship_data_strengthen[var_189_0].level_exp[ShipModAttr.ATTR_TO_INDEX[arg_189_1]], 1)
	else
		return 1
	end
end

function var_0_0.inUnlockTip(arg_190_0)
	local var_190_0 = pg.gameset.tip_unlock_shipIds.description[0]

	return table.contains(var_190_0, arg_190_0)
end

function var_0_0.proposeSkinOwned(arg_191_0, arg_191_1)
	return arg_191_1 and arg_191_0.propose and arg_191_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE
end

function var_0_0.getProposeSkin(arg_192_0)
	return ShipSkin.GetSkinByType(arg_192_0.groupId, ShipSkin.SKIN_TYPE_PROPOSE)
end

function var_0_0.getDisplaySkillIds(arg_193_0)
	return _.map(pg.ship_data_template[arg_193_0.configId].buff_list_display, function(arg_194_0)
		return arg_193_0:fateSkillChange(arg_194_0)
	end)
end

function var_0_0.isFullSkillLevel(arg_195_0)
	local var_195_0 = pg.skill_data_template

	for iter_195_0, iter_195_1 in pairs(arg_195_0.skills) do
		if var_195_0[iter_195_1.id].max_level ~= iter_195_1.level then
			return false
		end
	end

	return true
end

function var_0_0.setEquipmentRecord(arg_196_0, arg_196_1, arg_196_2)
	local var_196_0 = "equipment_record" .. "_" .. arg_196_1 .. "_" .. arg_196_0.id

	PlayerPrefs.SetString(var_196_0, table.concat(_.flatten(arg_196_2), ":"))
	PlayerPrefs.Save()
end

function var_0_0.getEquipmentRecord(arg_197_0, arg_197_1)
	if not arg_197_0.equipmentRecords then
		local var_197_0 = "equipment_record" .. "_" .. arg_197_1 .. "_" .. arg_197_0.id
		local var_197_1 = string.split(PlayerPrefs.GetString(var_197_0) or "", ":")
		local var_197_2 = {}

		for iter_197_0 = 1, 3 do
			var_197_2[iter_197_0] = _.map(_.slice(var_197_1, 5 * iter_197_0 - 4, 5), function(arg_198_0)
				return tonumber(arg_198_0)
			end)
		end

		arg_197_0.equipmentRecords = var_197_2
	end

	return arg_197_0.equipmentRecords
end

function var_0_0.SetSpWeaponRecord(arg_199_0, arg_199_1, arg_199_2)
	local var_199_0 = "spweapon_record" .. "_" .. arg_199_1 .. "_" .. arg_199_0.id
	local var_199_1 = _.map({
		1,
		2,
		3
	}, function(arg_200_0)
		local var_200_0 = arg_199_2[arg_200_0]

		if var_200_0 then
			return (var_200_0:GetUID() or 0) .. "," .. var_200_0:GetConfigID()
		else
			return "0,0"
		end
	end)

	PlayerPrefs.SetString(var_199_0, table.concat(var_199_1, ":"))
	PlayerPrefs.Save()
end

function var_0_0.GetSpWeaponRecord(arg_201_0, arg_201_1)
	local var_201_0 = "spweapon_record" .. "_" .. arg_201_1 .. "_" .. arg_201_0.id

	return (_.map(string.split(PlayerPrefs.GetString(var_201_0, ""), ":"), function(arg_202_0)
		local var_202_0 = string.split(arg_202_0, ",")

		assert(var_202_0)

		local var_202_1 = tonumber(var_202_0[1])
		local var_202_2 = tonumber(var_202_0[2])

		if not var_202_2 or var_202_2 == 0 then
			return false
		end

		return (SpWeapon.New({
			id = var_202_2
		}))
	end))
end

function var_0_0.hasEquipEquipmentSkin(arg_203_0)
	for iter_203_0, iter_203_1 in ipairs(arg_203_0.equipments) do
		if iter_203_1 and iter_203_1:hasSkin() then
			return true
		end
	end

	return false
end

function var_0_0.hasCommander(arg_204_0)
	return arg_204_0.commanderId and arg_204_0.commanderId ~= 0
end

function var_0_0.getCommander(arg_205_0)
	return arg_205_0.commanderId
end

function var_0_0.setCommander(arg_206_0, arg_206_1)
	arg_206_0.commanderId = arg_206_1
end

function var_0_0.getSkillIndex(arg_207_0, arg_207_1)
	local var_207_0 = arg_207_0:getSkillList()

	for iter_207_0, iter_207_1 in ipairs(var_207_0) do
		if arg_207_1 == iter_207_1 then
			return iter_207_0
		end
	end
end

function var_0_0.getTactics(arg_208_0)
	return 1, "tactics_attack"
end

function var_0_0.IsBgmSkin(arg_209_0)
	local var_209_0 = arg_209_0:GetSkinConfig()

	return table.contains(var_209_0.tag, ShipSkin.WITH_BGM)
end

function var_0_0.GetSkinBgm(arg_210_0)
	if arg_210_0:IsBgmSkin() then
		return arg_210_0:GetSkinConfig().bgm
	end
end

function var_0_0.isIntensifyMax(arg_211_0)
	local var_211_0 = intProperties(arg_211_0:getShipProperties())

	if arg_211_0:isBluePrintShip() then
		return true
	end

	for iter_211_0, iter_211_1 in pairs(ShipModAttr.ID_TO_ATTR) do
		if arg_211_0:getModAttrBaseMax(iter_211_1) ~= var_211_0[iter_211_1] then
			return false
		end
	end

	return true
end

function var_0_0.isRemouldable(arg_212_0)
	return not arg_212_0:isTestShip() and not arg_212_0:isBluePrintShip() and pg.ship_data_trans[arg_212_0.groupId]
end

function var_0_0.isAllRemouldFinish(arg_213_0)
	local var_213_0 = pg.ship_data_trans[arg_213_0.groupId]

	assert(var_213_0, "this ship group without remould config:" .. arg_213_0.groupId)

	for iter_213_0, iter_213_1 in ipairs(var_213_0.transform_list) do
		for iter_213_2, iter_213_3 in ipairs(iter_213_1) do
			local var_213_1 = pg.transform_data_template[iter_213_3[2]]

			if #var_213_1.edit_trans > 0 then
				-- block empty
			elseif not arg_213_0.transforms[iter_213_3[2]] or arg_213_0.transforms[iter_213_3[2]].level < var_213_1.max_level then
				return false
			end
		end
	end

	return true
end

function var_0_0.isSpecialFilter(arg_214_0)
	local var_214_0 = pg.ship_data_statistics[arg_214_0.configId]

	assert(var_214_0, "this ship without statistics:" .. arg_214_0.configId)

	for iter_214_0, iter_214_1 in ipairs(var_214_0.tag_list) do
		if iter_214_1 == "special" then
			return true
		end
	end

	return false
end

function var_0_0.hasAvailiableSkin(arg_215_0)
	local var_215_0 = getProxy(ShipSkinProxy)
	local var_215_1 = var_215_0:GetAllSkinForShip(arg_215_0)
	local var_215_2 = var_215_0:getRawData()
	local var_215_3 = 0

	for iter_215_0, iter_215_1 in ipairs(var_215_1) do
		if arg_215_0:proposeSkinOwned(iter_215_1) or var_215_2[iter_215_1.id] then
			var_215_3 = var_215_3 + 1
		end
	end

	return var_215_3 > 0
end

function var_0_0.hasProposeSkin(arg_216_0)
	local var_216_0 = getProxy(ShipSkinProxy)
	local var_216_1 = var_216_0:GetAllSkinForShip(arg_216_0)

	for iter_216_0, iter_216_1 in ipairs(var_216_1) do
		if iter_216_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE then
			return true
		end
	end

	local var_216_2 = var_216_0:GetShareSkinsForShip(arg_216_0)

	for iter_216_2, iter_216_3 in ipairs(var_216_2) do
		if iter_216_3.skin_type == ShipSkin.SKIN_TYPE_PROPOSE then
			return true
		end
	end

	return false
end

function var_0_0.HasUniqueSpWeapon(arg_217_0)
	return tobool(pg.spweapon_data_statistics.get_id_list_by_unique[arg_217_0:getGroupId()])
end

function var_0_0.getAircraftReloadCD(arg_218_0)
	local var_218_0 = arg_218_0:getConfigTable().base_list
	local var_218_1 = arg_218_0:getConfigTable().default_equip_list
	local var_218_2 = 0
	local var_218_3 = 0

	for iter_218_0 = 1, 3 do
		local var_218_4 = arg_218_0:getEquip(iter_218_0)
		local var_218_5 = var_218_4 and var_218_4.configId or var_218_1[iter_218_0]
		local var_218_6 = Equipment.getConfigData(var_218_5).type

		if underscore.any(EquipType.AirEquipTypes, function(arg_219_0)
			return var_218_6 == arg_219_0
		end) then
			var_218_2 = var_218_2 + Equipment.GetEquipReloadStatic(var_218_5) * var_218_0[iter_218_0]
			var_218_3 = var_218_3 + var_218_0[iter_218_0]
		end
	end

	local var_218_7 = ys.Battle.BattleConfig.AIR_ASSIST_RELOAD_RATIO * pg.bfConsts.PERCENT

	return {
		name = i18n("equip_info_31"),
		type = AttributeType.CD,
		value = var_218_2 / var_218_3 * var_218_7
	}
end

function var_0_0.IsTagShip(arg_220_0, arg_220_1)
	local var_220_0 = arg_220_0:getConfig("tag_list")

	return table.contains(var_220_0, arg_220_1)
end

function var_0_0.setReMetaSpecialItemVO(arg_221_0, arg_221_1)
	arg_221_0.reMetaSpecialItemVO = arg_221_1
end

function var_0_0.getReMetaSpecialItemVO(arg_222_0, arg_222_1)
	return arg_222_0.reMetaSpecialItemVO
end

function var_0_0.getProposeType(arg_223_0)
	if arg_223_0:isMetaShip() then
		return "meta"
	elseif arg_223_0:IsXIdol() then
		return "imas"
	else
		return "default"
	end
end

function var_0_0.IsXIdol(arg_224_0)
	return arg_224_0:getNation() == Nation.IDOL_LINK
end

function var_0_0.getSpecificType(arg_225_0)
	return pg.ship_data_template[arg_225_0.configId].specific_type
end

function var_0_0.GetSpWeapon(arg_226_0)
	return arg_226_0.spWeapon
end

function var_0_0.UpdateSpWeapon(arg_227_0, arg_227_1)
	local var_227_0 = (arg_227_1 and arg_227_1:GetUID() or 0) == (arg_227_0.spWeapon and arg_227_0.spWeapon:GetUID() or 0)

	arg_227_0.spWeapon = arg_227_1

	if arg_227_1 then
		arg_227_1:SetShipId(arg_227_0.id)
	end

	if var_227_0 then
		pg.m02:sendNotification(EquipmentProxy.SPWEAPONS_UPDATED)
	end
end

function var_0_0.CanEquipSpWeapon(arg_228_0, arg_228_1)
	local var_228_0, var_228_1 = arg_228_0:IsSpWeaponForbidden(arg_228_1)

	if var_228_0 then
		return false, var_228_1
	end

	return true
end

function var_0_0.IsSpWeaponForbidden(arg_229_0, arg_229_1)
	local var_229_0 = arg_229_1:GetWearableShipTypes()
	local var_229_1 = arg_229_0:getShipType()

	if not table.contains(var_229_0, var_229_1) then
		return true, i18n("spweapon_tip_group_error")
	end

	local var_229_2 = arg_229_1:GetUniqueGroup()
	local var_229_3 = arg_229_0:getGroupId()

	if var_229_2 ~= 0 and var_229_2 ~= var_229_3 then
		return true, i18n("spweapon_tip_group_error")
	end

	return false
end

function var_0_0.GetMapStrikeAnim(arg_230_0)
	local var_230_0
	local var_230_1 = arg_230_0:getShipType()

	switch(TeamType.GetTeamFromShipType(var_230_1), {
		[TeamType.Main] = function()
			if ShipType.IsTypeQuZhu(var_230_1) then
				var_230_0 = "SubTorpedoUI"
			elseif ShipType.ContainInLimitBundle(ShipType.BundleAircraftCarrier, var_230_1) then
				var_230_0 = "AirStrikeUI"
			elseif ShipType.ContainInLimitBundle(ShipType.BundleBattleShip, var_230_1) then
				var_230_0 = "CannonUI"
			else
				var_230_0 = "CannonUI"
			end
		end,
		[TeamType.Vanguard] = function()
			if ShipType.IsTypeQuZhu(var_230_1) then
				var_230_0 = "SubTorpedoUI"
			end
		end,
		[TeamType.Submarine] = function()
			if arg_230_0:getNation() == Nation.MOT then
				var_230_0 = "CannonUI"
			else
				var_230_0 = "SubTorpedoUI"
			end
		end
	})

	return var_230_0
end

function var_0_0.IsDefaultSkin(arg_234_0)
	return arg_234_0.skinId == 0 or arg_234_0.skinId == arg_234_0:getConfig("skin_id")
end

function var_0_0.IsMatchKey(arg_235_0, arg_235_1)
	if not arg_235_1 or arg_235_1 == "" then
		return true
	end

	arg_235_1 = string.lower(string.gsub(arg_235_1, "%.", "%%."))

	return string.find(string.lower(arg_235_0:GetDefaultName()), arg_235_1)
end

function var_0_0.IsOwner(arg_236_0)
	return tobool(arg_236_0.id)
end

function var_0_0.GetUniqueId(arg_237_0)
	return arg_237_0.id
end

function var_0_0.ShowPropose(arg_238_0)
	if not arg_238_0.propose then
		return false
	else
		return not HXSet.isHxPropose() or arg_238_0:IsOwner() and arg_238_0:GetUniqueId() == getProxy(PlayerProxy):getRawData():GetProposeShipId()
	end
end

function var_0_0.GetColorName(arg_239_0, arg_239_1)
	arg_239_1 = arg_239_1 or arg_239_0:getName()

	if PlayerPrefs.GetInt("SHIP_NAME_COLOR", PLATFORM_CODE == PLATFORM_CH and 1 or 0) == 1 and arg_239_0.propose then
		return setColorStr(arg_239_1, "#FFAACEFF")
	else
		return arg_239_1
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

function var_0_0.GetFrameAndEffect(arg_240_0, arg_240_1)
	arg_240_1 = tobool(arg_240_1)

	local var_240_0
	local var_240_1

	if arg_240_0.propose then
		if arg_240_0:isMetaShip() then
			var_240_1 = string.format(var_0_9.effect[1])
			var_240_0 = string.format(var_0_9.frame[1])
		elseif arg_240_0:isBluePrintShip() then
			var_240_1 = string.format(var_0_9.effect[2])
			var_240_0 = string.format(var_0_9.frame[2], arg_240_0:rarity2bgPrint())
		else
			var_240_1 = string.format(var_0_9.effect[3])
			var_240_0 = string.format(var_0_9.frame[3])
		end

		if not arg_240_0:ShowPropose() then
			var_240_0 = nil
		end
	elseif arg_240_0:isMetaShip() then
		var_240_1 = string.format(var_0_9.effect[4], arg_240_0:rarity2bgPrint())
	elseif arg_240_0:getRarity() == ShipRarity.SSR then
		var_240_1 = string.format(var_0_9.effect[5])
	end

	if arg_240_1 then
		var_240_1 = var_240_1 and var_240_1 .. "_1"
	end

	return var_240_0, var_240_1
end

function var_0_0.GetRecordPosKey(arg_241_0)
	return arg_241_0.skinId
end

return var_0_0
