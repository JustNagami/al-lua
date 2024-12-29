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

function var_0_0.rarity2bgPrint(arg_7_0)
	return shipRarity2bgPrint(arg_7_0:getRarity(), arg_7_0:isBluePrintShip(), arg_7_0:isMetaShip())
end

function var_0_0.rarity2bgPrintForGet(arg_8_0)
	return skinId2bgPrint(arg_8_0.skinId) or arg_8_0:rarity2bgPrint()
end

function var_0_0.getShipBgPrint(arg_9_0, arg_9_1)
	local var_9_0 = pg.ship_skin_template[arg_9_0.skinId]

	assert(var_9_0, "ship_skin_template not exist: " .. arg_9_0.skinId)

	local var_9_1

	if not arg_9_1 and var_9_0.bg_sp and var_9_0.bg_sp ~= "" and PlayerPrefs.GetInt("paint_hide_other_obj_" .. var_9_0.painting, 0) == 0 then
		var_9_1 = var_9_0.bg_sp
	end

	return var_9_1 and var_9_1 or var_9_0.bg and #var_9_0.bg > 0 and var_9_0.bg or arg_9_0:rarity2bgPrintForGet()
end

function var_0_0.getStar(arg_10_0)
	return arg_10_0:getConfig("star")
end

function var_0_0.getMaxStar(arg_11_0)
	return pg.ship_data_template[arg_11_0.configId].star_max
end

function var_0_0.getShipArmor(arg_12_0)
	return arg_12_0:getConfig("armor_type")
end

function var_0_0.getShipArmorName(arg_13_0)
	local var_13_0 = arg_13_0:getShipArmor()

	return ArmorType.Type2Name(var_13_0)
end

function var_0_0.getGroupId(arg_14_0)
	return pg.ship_data_template[arg_14_0.configId].group_type
end

function var_0_0.getGroupIdByConfigId(arg_15_0)
	return math.floor(arg_15_0 / 10)
end

function var_0_0.getTransformShipId(arg_16_0)
	local var_16_0 = pg.ship_data_template[arg_16_0].group_type
	local var_16_1 = pg.ship_data_trans[var_16_0]

	if var_16_1 then
		for iter_16_0, iter_16_1 in ipairs(var_16_1.transform_list) do
			for iter_16_2, iter_16_3 in ipairs(iter_16_1) do
				local var_16_2 = pg.transform_data_template[iter_16_3[2]]

				for iter_16_4, iter_16_5 in ipairs(var_16_2.ship_id) do
					if iter_16_5[1] == arg_16_0 then
						return iter_16_5[2]
					end
				end
			end
		end
	end
end

function var_0_0.getAircraftCount(arg_17_0)
	local var_17_0 = arg_17_0:getConfigTable().base_list
	local var_17_1 = arg_17_0:getConfigTable().default_equip_list
	local var_17_2 = {}

	for iter_17_0 = 1, 3 do
		local var_17_3 = arg_17_0:getEquip(iter_17_0) and arg_17_0:getEquip(iter_17_0).configId or var_17_1[iter_17_0]
		local var_17_4 = Equipment.getConfigData(var_17_3).type

		if table.contains(EquipType.AirDomainEquip, var_17_4) then
			var_17_2[var_17_4] = defaultValue(var_17_2[var_17_4], 0) + var_17_0[iter_17_0]
		end
	end

	return var_17_2
end

function var_0_0.getShipType(arg_18_0)
	return arg_18_0:getConfig("type")
end

function var_0_0.getEnergy(arg_19_0)
	return arg_19_0.energy
end

function var_0_0.getEnergeConfig(arg_20_0)
	local var_20_0 = pg.energy_template
	local var_20_1 = arg_20_0:getEnergy()

	for iter_20_0, iter_20_1 in pairs(var_20_0) do
		if type(iter_20_0) == "number" and var_20_1 >= iter_20_1.lower_bound and var_20_1 <= iter_20_1.upper_bound then
			return iter_20_1
		end
	end

	assert(false, "疲劳配置不存在：" .. arg_20_0.energy)
end

function var_0_0.getEnergyPrint(arg_21_0)
	local var_21_0 = arg_21_0:getEnergeConfig()

	return var_21_0.icon, var_21_0.desc
end

function var_0_0.getIntimacy(arg_22_0)
	return arg_22_0.intimacy
end

function var_0_0.getCVIntimacy(arg_23_0)
	return arg_23_0:getIntimacy() / 100 + (arg_23_0.propose and 1000 or 0)
end

function var_0_0.getIntimacyMax(arg_24_0)
	if arg_24_0.propose then
		return 200
	else
		return arg_24_0:GetNoProposeIntimacyMax()
	end
end

function var_0_0.GetNoProposeIntimacyMax(arg_25_0)
	return 100
end

function var_0_0.getIntimacyIcon(arg_26_0)
	local var_26_0 = pg.intimacy_template[arg_26_0:getIntimacyLevel()]
	local var_26_1 = ""

	if arg_26_0:isMetaShip() then
		var_26_1 = "_meta"
	elseif arg_26_0:IsXIdol() then
		var_26_1 = "_imas"
	end

	if not arg_26_0.propose and math.floor(arg_26_0:getIntimacy() / 100) >= arg_26_0:getIntimacyMax() then
		return var_26_0.icon .. var_26_1, "heart" .. var_26_1
	else
		return var_26_0.icon .. var_26_1
	end
end

function var_0_0.getIntimacyDetail(arg_27_0)
	return arg_27_0:getIntimacyMax(), math.floor(arg_27_0:getIntimacy() / 100)
end

function var_0_0.getIntimacyInfo(arg_28_0)
	local var_28_0 = pg.intimacy_template[arg_28_0:getIntimacyLevel()]

	return var_28_0.icon, var_28_0.desc
end

function var_0_0.getIntimacyLevel(arg_29_0)
	local var_29_0 = 0
	local var_29_1 = pg.intimacy_template

	for iter_29_0, iter_29_1 in pairs(var_29_1) do
		if type(iter_29_0) == "number" and arg_29_0:getIntimacy() >= iter_29_1.lower_bound and arg_29_0:getIntimacy() <= iter_29_1.upper_bound then
			var_29_0 = iter_29_0

			break
		end
	end

	if var_29_0 < arg_29_0.INTIMACY_PROPOSE and arg_29_0.propose then
		var_29_0 = arg_29_0.INTIMACY_PROPOSE
	end

	return var_29_0
end

function var_0_0.getBluePrint(arg_30_0)
	local var_30_0 = ShipBluePrint.New({
		id = arg_30_0.groupId
	})
	local var_30_1 = arg_30_0.strengthList[1] or {
		exp = 0,
		level = 0
	}

	var_30_0:updateInfo({
		blue_print_level = var_30_1.level,
		exp = var_30_1.exp
	})

	return var_30_0
end

function var_0_0.getBaseList(arg_31_0)
	if arg_31_0:isBluePrintShip() then
		local var_31_0 = arg_31_0:getBluePrint()

		assert(var_31_0, "blueprint can not be nil" .. arg_31_0.configId)

		return var_31_0:getBaseList(arg_31_0)
	else
		return arg_31_0:getConfig("base_list")
	end
end

function var_0_0.getPreLoadCount(arg_32_0)
	if arg_32_0:isBluePrintShip() then
		return arg_32_0:getBluePrint():getPreLoadCount(arg_32_0)
	else
		return arg_32_0:getConfig("preload_count")
	end
end

function var_0_0.getNation(arg_33_0)
	return arg_33_0:getConfig("nationality")
end

function var_0_0.getPaintingName(arg_34_0)
	local var_34_0 = pg.ship_data_statistics[arg_34_0].skin_id
	local var_34_1 = pg.ship_skin_template[var_34_0]

	assert(var_34_1, "ship_skin_template not exist: " .. arg_34_0 .. " " .. var_34_0)

	return var_34_1.painting
end

function var_0_0.getName(arg_35_0)
	if arg_35_0.propose and pg.PushNotificationMgr.GetInstance():isEnableShipName() then
		return arg_35_0.name
	end

	if arg_35_0:isRemoulded() then
		return pg.ship_skin_template[arg_35_0:getRemouldSkinId()].name
	end

	return pg.ship_data_statistics[arg_35_0.configId].name
end

function var_0_0.GetDefaultName(arg_36_0)
	if arg_36_0:isRemoulded() then
		return pg.ship_skin_template[arg_36_0:getRemouldSkinId()].name
	else
		return pg.ship_data_statistics[arg_36_0.configId].name
	end
end

function var_0_0.getShipName(arg_37_0)
	return pg.ship_data_statistics[arg_37_0].name
end

function var_0_0.getBreakOutLevel(arg_38_0)
	assert(arg_38_0, "必须存在配置id")
	assert(pg.ship_data_statistics[arg_38_0], "必须存在配置" .. arg_38_0)

	return pg.ship_data_statistics[arg_38_0].star
end

function var_0_0.Ctor(arg_39_0, arg_39_1)
	arg_39_0.id = arg_39_1.id
	arg_39_0.configId = arg_39_1.template_id or arg_39_1.configId
	arg_39_0.level = arg_39_1.level
	arg_39_0.exp = arg_39_1.exp
	arg_39_0.energy = arg_39_1.energy
	arg_39_0.lockState = arg_39_1.is_locked
	arg_39_0.intimacy = arg_39_1.intimacy
	arg_39_0.propose = arg_39_1.propose and arg_39_1.propose > 0
	arg_39_0.proposeTime = arg_39_1.propose

	if arg_39_0.intimacy and arg_39_0.intimacy > 10000 and not arg_39_0.propose then
		arg_39_0.intimacy = 10000
	end

	arg_39_0.renameTime = arg_39_1.change_name_timestamp

	if arg_39_1.name and arg_39_1.name ~= "" then
		arg_39_0.name = arg_39_1.name
	else
		assert(pg.ship_data_statistics[arg_39_0.configId], "必须存在配置" .. arg_39_0.configId)

		arg_39_0.name = pg.ship_data_statistics[arg_39_0.configId].name
	end

	arg_39_0.bluePrintFlag = arg_39_1.blue_print_flag or 0
	arg_39_0.strengthList = {}

	for iter_39_0, iter_39_1 in ipairs(arg_39_1.strength_list or {}) do
		if not arg_39_0:isBluePrintShip() then
			local var_39_0 = ShipModAttr.ID_TO_ATTR[iter_39_1.id]

			arg_39_0.strengthList[var_39_0] = iter_39_1.exp
		else
			table.insert(arg_39_0.strengthList, {
				level = iter_39_1.id,
				exp = iter_39_1.exp
			})
		end
	end

	local var_39_1 = arg_39_1.state or {}

	arg_39_0.state = var_39_1.state
	arg_39_0.state_info_1 = var_39_1.state_info_1
	arg_39_0.state_info_2 = var_39_1.state_info_2
	arg_39_0.state_info_3 = var_39_1.state_info_3
	arg_39_0.state_info_4 = var_39_1.state_info_4
	arg_39_0.equipmentSkins = {}
	arg_39_0.equipments = {}

	if arg_39_1.equip_info_list then
		for iter_39_2, iter_39_3 in ipairs(arg_39_1.equip_info_list or {}) do
			arg_39_0.equipments[iter_39_2] = iter_39_3.id > 0 and Equipment.New({
				count = 1,
				id = iter_39_3.id,
				config_id = iter_39_3.id,
				skinId = iter_39_3.skinId
			}) or false
			arg_39_0.equipmentSkins[iter_39_2] = iter_39_3.skinId > 0 and iter_39_3.skinId or 0

			arg_39_0:reletiveEquipSkin(iter_39_2)
		end
	end

	arg_39_0.spWeapon = nil

	if arg_39_1.spweapon then
		arg_39_0:UpdateSpWeapon(SpWeapon.CreateByNet(arg_39_1.spweapon))
	end

	arg_39_0.skills = {}

	for iter_39_4, iter_39_5 in ipairs(arg_39_1.skill_id_list or {}) do
		arg_39_0:updateSkill(iter_39_5)
	end

	arg_39_0.star = arg_39_0:getConfig("rarity")
	arg_39_0.transforms = {}

	for iter_39_6, iter_39_7 in ipairs(arg_39_1.transform_list or {}) do
		arg_39_0.transforms[iter_39_7.id] = {
			id = iter_39_7.id,
			level = iter_39_7.level
		}
	end

	arg_39_0.groupId = pg.ship_data_template[arg_39_0.configId].group_type
	arg_39_0.createTime = arg_39_1.create_time or 0

	local var_39_2 = getProxy(CollectionProxy)

	arg_39_0.virgin = var_39_2 and var_39_2.shipGroups[arg_39_0.groupId] == nil

	local var_39_3 = {
		pg.gameset.test_ship_config_1.key_value,
		pg.gameset.test_ship_config_2.key_value,
		pg.gameset.test_ship_config_3.key_value
	}
	local var_39_4 = table.indexof(var_39_3, arg_39_0.configId)

	if var_39_4 == 1 then
		arg_39_0.testShip = {
			2,
			3,
			4
		}
	elseif var_39_4 == 2 then
		arg_39_0.testShip = {
			5
		}
	elseif var_39_4 == 3 then
		arg_39_0.testShip = {
			6
		}
	else
		arg_39_0.testShip = nil
	end

	arg_39_0.maxIntimacy = pg.intimacy_template[#pg.intimacy_template.all].upper_bound

	if not HXSet.isHxSkin() then
		arg_39_0.skinId = arg_39_1.skin_id or 0
	else
		arg_39_0.skinId = 0
	end

	if arg_39_0.skinId == 0 then
		arg_39_0.skinId = arg_39_0:getConfig("skin_id")
	end

	if arg_39_1.name and arg_39_1.name ~= "" then
		arg_39_0.name = arg_39_1.name
	elseif arg_39_0:isRemoulded() then
		arg_39_0.name = pg.ship_skin_template[arg_39_0:getRemouldSkinId()].name
	else
		arg_39_0.name = pg.ship_data_statistics[arg_39_0.configId].name
	end

	arg_39_0.maxLevel = arg_39_1.max_level
	arg_39_0.proficiency = arg_39_1.proficiency or 0
	arg_39_0.preferenceTag = arg_39_1.common_flag
	arg_39_0.hpRant = 10000
	arg_39_0.strategies = {}
	arg_39_0.triggers = {}
	arg_39_0.commanderId = arg_39_1.commanderid or 0
	arg_39_0.activityNpc = arg_39_1.activity_npc or 0

	if var_0_0.isMetaShipByConfigID(arg_39_0.configId) then
		local var_39_5 = MetaCharacterConst.GetMetaShipGroupIDByConfigID(arg_39_0.configId)

		arg_39_0.metaCharacter = MetaCharacter.New({
			id = var_39_5,
			repair_attr_info = arg_39_1.meta_repair_list
		}, arg_39_0)
	end
end

function var_0_0.isMetaShipByConfigID(arg_40_0)
	local var_40_0 = pg.ship_meta_breakout.all
	local var_40_1 = var_40_0[1]
	local var_40_2 = false

	if var_40_1 <= arg_40_0 then
		for iter_40_0, iter_40_1 in ipairs(var_40_0) do
			if arg_40_0 == iter_40_1 then
				var_40_2 = true

				break
			end
		end
	end

	return var_40_2
end

function var_0_0.isMetaShip(arg_41_0)
	return arg_41_0.metaCharacter ~= nil
end

function var_0_0.getMetaCharacter(arg_42_0)
	return arg_42_0.metaCharacter
end

function var_0_0.unlockActivityNpc(arg_43_0, arg_43_1)
	arg_43_0.activityNpc = arg_43_1
end

function var_0_0.isActivityNpc(arg_44_0)
	return arg_44_0.activityNpc > 0
end

function var_0_0.getActiveEquipments(arg_45_0)
	local var_45_0 = Clone(arg_45_0.equipments)

	for iter_45_0 = #var_45_0, 1, -1 do
		local var_45_1 = var_45_0[iter_45_0]

		if var_45_1 then
			for iter_45_1 = 1, iter_45_0 - 1 do
				local var_45_2 = var_45_0[iter_45_1]

				if var_45_2 and var_45_1:getConfig("equip_limit") ~= 0 and var_45_2:getConfig("equip_limit") == var_45_1:getConfig("equip_limit") then
					var_45_0[iter_45_0] = false
				end
			end
		end
	end

	return var_45_0
end

function var_0_0.getAllEquipments(arg_46_0)
	return arg_46_0.equipments
end

function var_0_0.isBluePrintShip(arg_47_0)
	return arg_47_0.bluePrintFlag == 1
end

function var_0_0.updateSkinId(arg_48_0, arg_48_1)
	arg_48_0.skinId = arg_48_1
end

function var_0_0.updateName(arg_49_0)
	if arg_49_0.name ~= pg.ship_data_statistics[arg_49_0.configId].name then
		return
	end

	if arg_49_0:isRemoulded() then
		arg_49_0.name = pg.ship_skin_template[arg_49_0:getRemouldSkinId()].name
	else
		arg_49_0.name = pg.ship_data_statistics[arg_49_0.configId].name
	end
end

function var_0_0.isRemoulded(arg_50_0)
	if arg_50_0.remoulded then
		return true
	end

	local var_50_0 = pg.ship_data_trans[arg_50_0.groupId]

	if var_50_0 then
		for iter_50_0, iter_50_1 in ipairs(var_50_0.transform_list) do
			for iter_50_2, iter_50_3 in ipairs(iter_50_1) do
				local var_50_1 = pg.transform_data_template[iter_50_3[2]]

				if var_50_1.skin_id ~= 0 and arg_50_0.transforms[iter_50_3[2]] and arg_50_0.transforms[iter_50_3[2]].level == var_50_1.max_level then
					return true
				end
			end
		end
	end

	return false
end

function var_0_0.getRemouldSkinId(arg_51_0)
	local var_51_0 = ShipGroup.getModSkin(arg_51_0.groupId)

	if var_51_0 then
		return var_51_0.id
	end

	return nil
end

function var_0_0.hasEquipmentSkinInPos(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_0.equipments[arg_52_1]

	return var_52_0 and var_52_0:hasSkin()
end

function var_0_0.getPrefab(arg_53_0)
	local var_53_0 = arg_53_0.skinId

	if arg_53_0:hasEquipmentSkinInPos(var_0_2) then
		local var_53_1 = arg_53_0:getEquip(var_0_2)
		local var_53_2 = var_0_7[var_53_1:getSkinId()].ship_skin_id

		var_53_0 = var_53_2 ~= 0 and var_53_2 or var_53_0
	end

	local var_53_3 = pg.ship_skin_template[var_53_0]

	assert(var_53_3, "ship_skin_template not exist: " .. arg_53_0.configId .. " " .. var_53_0)

	return var_53_3.prefab
end

function var_0_0.getAttachmentPrefab(arg_54_0)
	local var_54_0 = {}

	for iter_54_0, iter_54_1 in ipairs(arg_54_0.equipments) do
		if iter_54_1 and iter_54_1:hasSkinOrbit() then
			local var_54_1 = iter_54_1:getSkinId()

			var_54_0[var_54_1] = var_0_7[var_54_1]
		end
	end

	return var_54_0
end

function var_0_0.getPainting(arg_55_0)
	local var_55_0 = pg.ship_skin_template[arg_55_0.skinId]

	assert(var_55_0, "ship_skin_template not exist: " .. arg_55_0.configId .. " " .. arg_55_0.skinId)

	return var_55_0.painting
end

function var_0_0.GetSkinConfig(arg_56_0)
	local var_56_0 = pg.ship_skin_template[arg_56_0.skinId]

	assert(var_56_0, "ship_skin_template not exist: " .. arg_56_0.configId .. " " .. arg_56_0.skinId)

	return var_56_0
end

function var_0_0.getRemouldPainting(arg_57_0)
	local var_57_0 = pg.ship_skin_template[arg_57_0:getRemouldSkinId()]

	assert(var_57_0, "ship_skin_template not exist: " .. arg_57_0.configId .. " " .. arg_57_0.skinId)

	return var_57_0.painting
end

function var_0_0.updateStateInfo34(arg_58_0, arg_58_1, arg_58_2)
	arg_58_0.state_info_3 = arg_58_1
	arg_58_0.state_info_4 = arg_58_2
end

function var_0_0.hasStateInfo3Or4(arg_59_0)
	return arg_59_0.state_info_3 ~= 0 or arg_59_0.state_info_4 ~= 0
end

function var_0_0.isTestShip(arg_60_0)
	return arg_60_0.testShip
end

function var_0_0.canUseTestShip(arg_61_0, arg_61_1)
	assert(arg_61_0.testShip, "ship is not TestShip")

	return table.contains(arg_61_0.testShip, arg_61_1)
end

function var_0_0.updateEquip(arg_62_0, arg_62_1, arg_62_2)
	assert(arg_62_2 == nil or arg_62_2.count == 1)

	local var_62_0 = arg_62_0.equipments[arg_62_1]

	arg_62_0.equipments[arg_62_1] = arg_62_2 and Clone(arg_62_2) or false

	local function var_62_1(arg_63_0)
		arg_63_0 = CreateShell(arg_63_0)
		arg_63_0.shipId = arg_62_0.id
		arg_63_0.shipPos = arg_62_1

		return arg_63_0
	end

	if var_62_0 then
		getProxy(EquipmentProxy):OnShipEquipsRemove(var_62_0, arg_62_0.id, arg_62_1)
		var_62_0:setSkinId(0)
		pg.m02:sendNotification(BayProxy.SHIP_EQUIPMENT_REMOVED, var_62_1(var_62_0))
	end

	if arg_62_2 then
		getProxy(EquipmentProxy):OnShipEquipsAdd(arg_62_2, arg_62_0.id, arg_62_1)
		arg_62_0:reletiveEquipSkin(arg_62_1)
		pg.m02:sendNotification(BayProxy.SHIP_EQUIPMENT_ADDED, var_62_1(arg_62_2))
	end
end

function var_0_0.reletiveEquipSkin(arg_64_0, arg_64_1)
	if arg_64_0.equipments[arg_64_1] and arg_64_0.equipmentSkins[arg_64_1] ~= 0 then
		local var_64_0 = pg.equip_skin_template[arg_64_0.equipmentSkins[arg_64_1]].equip_type
		local var_64_1 = arg_64_0.equipments[arg_64_1]:getType()

		if table.contains(var_64_0, var_64_1) then
			arg_64_0.equipments[arg_64_1]:setSkinId(arg_64_0.equipmentSkins[arg_64_1])
		else
			arg_64_0.equipments[arg_64_1]:setSkinId(0)
		end
	elseif arg_64_0.equipments[arg_64_1] then
		arg_64_0.equipments[arg_64_1]:setSkinId(0)
	end
end

function var_0_0.updateEquipmentSkin(arg_65_0, arg_65_1, arg_65_2)
	if not arg_65_1 then
		return
	end

	if arg_65_2 and arg_65_2 > 0 then
		local var_65_0 = arg_65_0:getSkinTypes(arg_65_1)
		local var_65_1 = pg.equip_skin_template[arg_65_2].equip_type
		local var_65_2 = false

		for iter_65_0, iter_65_1 in ipairs(var_65_0) do
			for iter_65_2, iter_65_3 in ipairs(var_65_1) do
				if iter_65_1 == iter_65_3 then
					var_65_2 = true

					break
				end
			end
		end

		if not var_65_2 then
			assert(var_65_2, "部位" .. arg_65_1 .. " 无法穿戴皮肤 " .. arg_65_2)

			return
		end

		local var_65_3 = arg_65_0.equipments[arg_65_1] and arg_65_0.equipments[arg_65_1]:getType() or false

		arg_65_0.equipmentSkins[arg_65_1] = arg_65_2

		if var_65_3 and table.contains(var_65_1, var_65_3) then
			arg_65_0.equipments[arg_65_1]:setSkinId(arg_65_0.equipmentSkins[arg_65_1])
		elseif var_65_3 and not table.contains(var_65_1, var_65_3) then
			arg_65_0.equipments[arg_65_1]:setSkinId(0)
		end
	else
		arg_65_0.equipmentSkins[arg_65_1] = 0

		if arg_65_0.equipments[arg_65_1] then
			arg_65_0.equipments[arg_65_1]:setSkinId(0)
		end
	end
end

function var_0_0.getEquip(arg_66_0, arg_66_1)
	return Clone(arg_66_0.equipments[arg_66_1])
end

function var_0_0.getEquipSkins(arg_67_0)
	return Clone(arg_67_0.equipmentSkins)
end

function var_0_0.getEquipSkin(arg_68_0, arg_68_1)
	return arg_68_0.equipmentSkins[arg_68_1]
end

function var_0_0.getCanEquipSkin(arg_69_0, arg_69_1)
	local var_69_0 = arg_69_0:getSkinTypes(arg_69_1)

	if var_69_0 and #var_69_0 then
		for iter_69_0, iter_69_1 in ipairs(var_69_0) do
			if pg.equip_data_by_type[iter_69_1].equip_skin == 1 then
				return true
			end
		end
	end

	return false
end

function var_0_0.checkCanEquipSkin(arg_70_0, arg_70_1, arg_70_2)
	if not arg_70_1 or not arg_70_2 then
		return
	end

	local var_70_0 = arg_70_0:getSkinTypes(arg_70_1)
	local var_70_1 = pg.equip_skin_template[arg_70_2].equip_type

	for iter_70_0, iter_70_1 in ipairs(var_70_0) do
		if table.contains(var_70_1, iter_70_1) then
			return true
		end
	end

	return false
end

function var_0_0.getSkinTypes(arg_71_0, arg_71_1)
	return pg.ship_data_template[arg_71_0.configId]["equip_" .. arg_71_1] or {}
end

function var_0_0.updateState(arg_72_0, arg_72_1)
	arg_72_0.state = arg_72_1
end

function var_0_0.addSkillExp(arg_73_0, arg_73_1, arg_73_2)
	local var_73_0 = arg_73_0.skills[arg_73_1] or {
		exp = 0,
		level = 1,
		id = arg_73_1
	}
	local var_73_1 = var_73_0.level and var_73_0.level or 1
	local var_73_2 = pg.skill_need_exp.all[#pg.skill_need_exp.all]

	if var_73_1 == var_73_2 then
		return
	end

	local var_73_3 = var_73_0.exp and arg_73_2 + var_73_0.exp or 0 + arg_73_2

	while var_73_3 >= pg.skill_need_exp[var_73_1].exp do
		var_73_3 = var_73_3 - pg.skill_need_exp[var_73_1].exp
		var_73_1 = var_73_1 + 1

		if var_73_1 == var_73_2 then
			var_73_3 = 0

			break
		end
	end

	arg_73_0:updateSkill({
		id = var_73_0.id,
		level = var_73_1,
		exp = var_73_3
	})
end

function var_0_0.upSkillLevelForMeta(arg_74_0, arg_74_1)
	local var_74_0 = arg_74_0.skills[arg_74_1] or {
		exp = 0,
		level = 0,
		id = arg_74_1
	}
	local var_74_1 = arg_74_0:isSkillLevelMax(arg_74_1)
	local var_74_2 = var_74_0.level

	if not var_74_1 then
		var_74_2 = var_74_2 + 1
	end

	arg_74_0:updateSkill({
		exp = 0,
		id = var_74_0.id,
		level = var_74_2
	})
end

function var_0_0.getMetaSkillLevelBySkillID(arg_75_0, arg_75_1)
	return (arg_75_0.skills[arg_75_1] or {
		exp = 0,
		level = 0,
		id = arg_75_1
	}).level
end

function var_0_0.isSkillLevelMax(arg_76_0, arg_76_1)
	local var_76_0 = arg_76_0.skills[arg_76_1] or {
		exp = 0,
		level = 1,
		id = arg_76_1
	}

	return (var_76_0.level and var_76_0.level or 1) >= pg.skill_data_template[arg_76_1].max_level
end

function var_0_0.isAllMetaSkillLevelMax(arg_77_0)
	local var_77_0 = true
	local var_77_1 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(arg_77_0.configId)

	for iter_77_0, iter_77_1 in ipairs(var_77_1) do
		if not arg_77_0:isSkillLevelMax(iter_77_1) then
			var_77_0 = false

			break
		end
	end

	return var_77_0
end

function var_0_0.isAllMetaSkillLock(arg_78_0)
	local var_78_0 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(arg_78_0.configId)
	local var_78_1 = true

	for iter_78_0, iter_78_1 in ipairs(var_78_0) do
		if arg_78_0:getMetaSkillLevelBySkillID(iter_78_1) > 0 then
			var_78_1 = false

			break
		end
	end

	return var_78_1
end

function var_0_0.bindConfigTable(arg_79_0)
	return pg.ship_data_statistics
end

function var_0_0.isAvaiable(arg_80_0)
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

function var_0_0.intimacyAdditions(arg_81_0, arg_81_1)
	local var_81_0 = pg.intimacy_template[arg_81_0:getIntimacyLevel()].attr_bonus * 0.0001

	for iter_81_0, iter_81_1 in pairs(arg_81_1) do
		if iter_81_0 == AttributeType.Durability or iter_81_0 == AttributeType.Cannon or iter_81_0 == AttributeType.Torpedo or iter_81_0 == AttributeType.AntiAircraft or iter_81_0 == AttributeType.AntiSub or iter_81_0 == AttributeType.Air or iter_81_0 == AttributeType.Reload or iter_81_0 == AttributeType.Hit or iter_81_0 == AttributeType.Dodge then
			arg_81_1[iter_81_0] = arg_81_1[iter_81_0] * (var_81_0 + 1)
		end
	end
end

function var_0_0.getShipProperties(arg_82_0)
	local var_82_0 = arg_82_0:getBaseProperties()

	if arg_82_0:isBluePrintShip() then
		local var_82_1 = arg_82_0:getBluePrint()

		assert(var_82_1, "blueprint can not be nil" .. arg_82_0.configId)

		local var_82_2 = var_82_1:getTotalAdditions()

		for iter_82_0, iter_82_1 in pairs(var_82_2) do
			var_82_0[iter_82_0] = var_82_0[iter_82_0] + calcFloor(iter_82_1)
		end

		arg_82_0:intimacyAdditions(var_82_0)
	elseif arg_82_0:isMetaShip() then
		assert(arg_82_0.metaCharacter)

		for iter_82_2, iter_82_3 in pairs(var_82_0) do
			var_82_0[iter_82_2] = var_82_0[iter_82_2] + arg_82_0.metaCharacter:getAttrAddition(iter_82_2)
		end

		arg_82_0:intimacyAdditions(var_82_0)
	else
		local var_82_3 = pg.ship_data_template[arg_82_0.configId].strengthen_id
		local var_82_4 = var_0_5[var_82_3]

		for iter_82_4, iter_82_5 in pairs(arg_82_0.strengthList) do
			local var_82_5 = ShipModAttr.ATTR_TO_INDEX[iter_82_4]
			local var_82_6 = math.min(iter_82_5, var_82_4.durability[var_82_5] * var_82_4.level_exp[var_82_5])
			local var_82_7 = math.max(arg_82_0:getModExpRatio(iter_82_4), 1)

			var_82_0[iter_82_4] = var_82_0[iter_82_4] + calcFloor(var_82_6 / var_82_7)
		end

		arg_82_0:intimacyAdditions(var_82_0)

		for iter_82_6, iter_82_7 in pairs(arg_82_0.transforms) do
			local var_82_8 = pg.transform_data_template[iter_82_7.id].effect

			for iter_82_8 = 1, iter_82_7.level do
				local var_82_9 = var_82_8[iter_82_8] or {}

				for iter_82_9, iter_82_10 in pairs(var_82_0) do
					if var_82_9[iter_82_9] then
						var_82_0[iter_82_9] = var_82_0[iter_82_9] + var_82_9[iter_82_9]
					end
				end
			end
		end
	end

	return var_82_0
end

function var_0_0.getTechNationAddition(arg_83_0, arg_83_1)
	local var_83_0 = getProxy(TechnologyNationProxy)
	local var_83_1 = arg_83_0:getConfig("type")

	if var_83_1 == ShipType.DaoQuV or var_83_1 == ShipType.DaoQuM then
		var_83_1 = ShipType.QuZhu
	end

	return var_83_0:getShipAddition(var_83_1, arg_83_1)
end

function var_0_0.getTechNationMaxAddition(arg_84_0, arg_84_1)
	local var_84_0 = getProxy(TechnologyNationProxy)
	local var_84_1 = arg_84_0:getConfig("type")

	return var_84_0:getShipMaxAddition(var_84_1, arg_84_1)
end

function var_0_0.getEquipProficiencyByPos(arg_85_0, arg_85_1)
	return arg_85_0:getEquipProficiencyList()[arg_85_1]
end

function var_0_0.getEquipProficiencyList(arg_86_0)
	local var_86_0 = arg_86_0:getConfigTable()
	local var_86_1 = Clone(var_86_0.equipment_proficiency)

	if arg_86_0:isBluePrintShip() then
		local var_86_2 = arg_86_0:getBluePrint()

		assert(var_86_2, "blueprint can not be nil >>>" .. arg_86_0.groupId)

		var_86_1 = var_86_2:getEquipProficiencyList(arg_86_0)
	else
		for iter_86_0, iter_86_1 in ipairs(var_86_1) do
			local var_86_3 = 0

			for iter_86_2, iter_86_3 in pairs(arg_86_0.transforms) do
				local var_86_4 = pg.transform_data_template[iter_86_3.id].effect

				for iter_86_4 = 1, iter_86_3.level do
					local var_86_5 = var_86_4[iter_86_4] or {}

					if var_86_5["equipment_proficiency_" .. iter_86_0] then
						var_86_3 = var_86_3 + var_86_5["equipment_proficiency_" .. iter_86_0]
					end
				end
			end

			var_86_1[iter_86_0] = iter_86_1 + var_86_3
		end
	end

	return var_86_1
end

function var_0_0.getBaseProperties(arg_87_0)
	local var_87_0 = arg_87_0:getConfigTable()

	assert(var_87_0, "配置表没有这艘船" .. arg_87_0.configId)

	local var_87_1 = {}
	local var_87_2 = {}

	for iter_87_0, iter_87_1 in ipairs(var_0_0.PROPERTIES) do
		var_87_1[iter_87_1] = arg_87_0:getGrowthForAttr(iter_87_1)
		var_87_2[iter_87_1] = var_87_1[iter_87_1]
	end

	for iter_87_2, iter_87_3 in ipairs(arg_87_0:getConfig("lock")) do
		var_87_2[iter_87_3] = var_87_1[iter_87_3]
	end

	for iter_87_4, iter_87_5 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_87_2[iter_87_5] = var_87_0[iter_87_5]
	end

	for iter_87_6, iter_87_7 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_87_2[iter_87_7] = 0
	end

	return var_87_2
end

function var_0_0.getGrowthForAttr(arg_88_0, arg_88_1)
	local var_88_0 = arg_88_0:getConfigTable()
	local var_88_1 = table.indexof(var_0_0.PROPERTIES, arg_88_1)
	local var_88_2 = pg.gameset.extra_attr_level_limit.key_value
	local var_88_3 = var_88_0.attrs[var_88_1] + (arg_88_0.level - 1) * var_88_0.attrs_growth[var_88_1] / 1000

	if var_88_2 < arg_88_0.level then
		var_88_3 = var_88_3 + (arg_88_0.level - var_88_2) * var_88_0.attrs_growth_extra[var_88_1] / 1000
	end

	return var_88_3
end

function var_0_0.isMaxStar(arg_89_0)
	return arg_89_0:getStar() >= arg_89_0:getMaxStar()
end

function var_0_0.IsMaxStarByTmpID(arg_90_0)
	local var_90_0 = pg.ship_data_template[arg_90_0]

	return var_90_0.star >= var_90_0.star_max
end

function var_0_0.IsSpweaponUnlock(arg_91_0)
	if not arg_91_0:CanAccumulateExp() then
		return false, "spweapon_tip_locked"
	else
		return true
	end
end

function var_0_0.getModProperties(arg_92_0, arg_92_1)
	return arg_92_0.strengthList[arg_92_1] or 0
end

function var_0_0.addModAttrExp(arg_93_0, arg_93_1, arg_93_2)
	local var_93_0 = arg_93_0:getModAttrTopLimit(arg_93_1)

	if var_93_0 == 0 then
		return
	end

	local var_93_1 = arg_93_0:getModExpRatio(arg_93_1)
	local var_93_2 = arg_93_0:getModProperties(arg_93_1)

	if var_93_2 + arg_93_2 > var_93_0 * var_93_1 then
		arg_93_0.strengthList[arg_93_1] = var_93_0 * var_93_1
	else
		arg_93_0.strengthList[arg_93_1] = var_93_2 + arg_93_2
	end
end

function var_0_0.getNeedModExp(arg_94_0)
	local var_94_0 = {}

	for iter_94_0, iter_94_1 in pairs(ShipModAttr.ID_TO_ATTR) do
		local var_94_1 = arg_94_0:getModAttrTopLimit(iter_94_1)

		if var_94_1 == 0 then
			var_94_0[iter_94_1] = 0
		else
			var_94_0[iter_94_1] = var_94_1 * arg_94_0:getModExpRatio(iter_94_1) - arg_94_0:getModProperties(iter_94_1)
		end
	end

	return var_94_0
end

function var_0_0.attrVertify(arg_95_0)
	if not BayProxy.checkShiplevelVertify(arg_95_0) then
		return false
	end

	for iter_95_0, iter_95_1 in ipairs(arg_95_0.equipments) do
		if iter_95_1 and not iter_95_1:vertify() then
			return false
		end
	end

	return true
end

function var_0_0.getEquipmentProperties(arg_96_0)
	local var_96_0 = {}
	local var_96_1 = {}

	for iter_96_0, iter_96_1 in ipairs(var_0_0.PROPERTIES) do
		var_96_0[iter_96_1] = 0
	end

	for iter_96_2, iter_96_3 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_96_0[iter_96_3] = 0
	end

	for iter_96_4, iter_96_5 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_96_0[iter_96_5] = 0
	end

	for iter_96_6, iter_96_7 in ipairs(var_0_0.PROPERTIES_ENHANCEMENT) do
		var_96_1[iter_96_7] = 0
	end

	var_96_0[AttributeType.AirDominate] = 0
	var_96_0[AttributeType.AntiSiren] = 0

	local var_96_2 = arg_96_0:getActiveEquipments()

	for iter_96_8, iter_96_9 in ipairs(var_96_2) do
		if iter_96_9 then
			local var_96_3 = iter_96_9:GetAttributes()

			for iter_96_10, iter_96_11 in ipairs(var_96_3) do
				if iter_96_11 and var_96_0[iter_96_11.type] then
					var_96_0[iter_96_11.type] = var_96_0[iter_96_11.type] + iter_96_11.value
				end
			end

			local var_96_4 = iter_96_9:GetPropertyRate()

			for iter_96_12, iter_96_13 in pairs(var_96_4) do
				var_96_1[iter_96_12] = math.max(var_96_1[iter_96_12], iter_96_13)
			end

			local var_96_5 = iter_96_9:GetSonarProperty()

			if var_96_5 then
				for iter_96_14, iter_96_15 in pairs(var_96_5) do
					var_96_0[iter_96_14] = var_96_0[iter_96_14] + iter_96_15
				end
			end

			local var_96_6 = iter_96_9:GetAntiSirenPower()

			if var_96_6 then
				var_96_0[AttributeType.AntiSiren] = var_96_0[AttributeType.AntiSiren] + var_96_6 / 10000
			end
		end
	end

	;(function()
		local var_97_0 = arg_96_0:GetSpWeapon()

		if not var_97_0 then
			return
		end

		local var_97_1 = var_97_0:GetPropertiesInfo().attrs

		for iter_97_0, iter_97_1 in ipairs(var_97_1) do
			if iter_97_1 and var_96_0[iter_97_1.type] then
				var_96_0[iter_97_1.type] = var_96_0[iter_97_1.type] + iter_97_1.value
			end
		end
	end)()

	for iter_96_16, iter_96_17 in pairs(var_96_1) do
		var_96_1[iter_96_16] = iter_96_17 + 1
	end

	return var_96_0, var_96_1
end

function var_0_0.getSkillEffects(arg_98_0)
	local var_98_0 = arg_98_0:getShipSkillEffects()

	_.each(arg_98_0:getEquipmentSkillEffects(), function(arg_99_0)
		table.insert(var_98_0, arg_99_0)
	end)

	return var_98_0
end

function var_0_0.getShipSkillEffects(arg_100_0)
	local var_100_0 = {}
	local var_100_1 = arg_100_0:getSkillList()

	for iter_100_0, iter_100_1 in ipairs(var_100_1) do
		local var_100_2 = arg_100_0:RemapSkillId(iter_100_1)
		local var_100_3 = require("GameCfg.buff.buff_" .. var_100_2)

		arg_100_0:FilterActiveSkill(var_100_0, var_100_3, arg_100_0.skills[iter_100_1])
	end

	return var_100_0
end

function var_0_0.getEquipmentSkillEffects(arg_101_0)
	local var_101_0 = {}
	local var_101_1 = arg_101_0:getActiveEquipments()

	for iter_101_0, iter_101_1 in ipairs(var_101_1) do
		local var_101_2
		local var_101_3 = iter_101_1 and iter_101_1:getConfig("skill_id")[1]

		if var_101_3 then
			var_101_2 = require("GameCfg.buff.buff_" .. var_101_3)
		end

		arg_101_0:FilterActiveSkill(var_101_0, var_101_2)
	end

	;(function()
		local var_102_0 = arg_101_0:GetSpWeapon()
		local var_102_1 = var_102_0 and var_102_0:GetEffect() or 0
		local var_102_2

		if var_102_1 > 0 then
			var_102_2 = require("GameCfg.buff.buff_" .. var_102_1)
		end

		arg_101_0:FilterActiveSkill(var_101_0, var_102_2)
	end)()

	return var_101_0
end

function var_0_0.FilterActiveSkill(arg_103_0, arg_103_1, arg_103_2, arg_103_3)
	if not arg_103_2 or not arg_103_2.const_effect_list then
		return
	end

	for iter_103_0 = 1, #arg_103_2.const_effect_list do
		local var_103_0 = arg_103_2.const_effect_list[iter_103_0]
		local var_103_1 = var_103_0.trigger
		local var_103_2 = var_103_0.arg_list
		local var_103_3 = 1

		if arg_103_3 then
			var_103_3 = arg_103_3.level

			local var_103_4 = arg_103_2[var_103_3].const_effect_list

			if var_103_4 and var_103_4[iter_103_0] then
				var_103_1 = var_103_4[iter_103_0].trigger or var_103_1
				var_103_2 = var_103_4[iter_103_0].arg_list or var_103_2
			end
		end

		local var_103_5 = true

		for iter_103_1, iter_103_2 in pairs(var_103_1) do
			if arg_103_0.triggers[iter_103_1] ~= iter_103_2 then
				var_103_5 = false

				break
			end
		end

		if var_103_5 then
			table.insert(arg_103_1, {
				type = var_103_0.type,
				arg_list = var_103_2,
				level = var_103_3
			})
		end
	end
end

function var_0_0.getEquipmentGearScore(arg_104_0)
	local var_104_0 = 0
	local var_104_1 = arg_104_0:getActiveEquipments()

	for iter_104_0, iter_104_1 in ipairs(var_104_1) do
		if iter_104_1 then
			var_104_0 = var_104_0 + iter_104_1:GetGearScore()
		end
	end

	return var_104_0
end

function var_0_0.getProperties(arg_105_0, arg_105_1, arg_105_2, arg_105_3, arg_105_4)
	local var_105_0 = arg_105_1 or {}
	local var_105_1 = arg_105_0:getConfig("nationality")
	local var_105_2 = arg_105_0:getConfig("type")
	local var_105_3 = arg_105_0:getShipProperties()
	local var_105_4, var_105_5 = arg_105_0:getEquipmentProperties()
	local var_105_6
	local var_105_7
	local var_105_8

	if arg_105_3 and arg_105_0:getFlag("inWorld") then
		local var_105_9 = WorldConst.FetchWorldShip(arg_105_0.id)

		var_105_6, var_105_7 = var_105_9:GetShipBuffProperties()
		var_105_8 = var_105_9:GetShipPowerBuffProperties()
	end

	for iter_105_0, iter_105_1 in ipairs(var_0_0.PROPERTIES) do
		local var_105_10 = 0
		local var_105_11 = 0

		for iter_105_2, iter_105_3 in pairs(var_105_0) do
			var_105_10 = var_105_10 + iter_105_3:getAttrRatioAddition(iter_105_1, var_105_1, var_105_2) / 100
			var_105_11 = var_105_11 + iter_105_3:getAttrValueAddition(iter_105_1, var_105_1, var_105_2)
		end

		local var_105_12 = var_105_10 + (var_105_5[iter_105_1] or 1)
		local var_105_13 = var_105_7 and var_105_7[iter_105_1] or 1
		local var_105_14 = var_105_6 and var_105_6[iter_105_1] or 0

		if iter_105_1 == AttributeType.Speed then
			var_105_3[iter_105_1] = var_105_3[iter_105_1] * var_105_12 * var_105_13 + var_105_11 + var_105_4[iter_105_1] + var_105_14
		else
			var_105_3[iter_105_1] = calcFloor(calcFloor(var_105_3[iter_105_1]) * var_105_12 * var_105_13) + var_105_11 + var_105_4[iter_105_1] + var_105_14
		end
	end

	if not arg_105_2 and arg_105_0:isMaxStar() then
		for iter_105_4, iter_105_5 in pairs(var_105_3) do
			local var_105_15 = arg_105_4 and arg_105_0:getTechNationMaxAddition(iter_105_4) or arg_105_0:getTechNationAddition(iter_105_4)

			var_105_3[iter_105_4] = var_105_3[iter_105_4] + var_105_15
		end
	end

	for iter_105_6, iter_105_7 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_105_3[iter_105_7] = var_105_3[iter_105_7] + var_105_4[iter_105_7]
	end

	for iter_105_8, iter_105_9 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_105_3[iter_105_9] = var_105_3[iter_105_9] + var_105_4[iter_105_9]
	end

	if arg_105_3 then
		var_105_3[AttributeType.AntiSiren] = (var_105_3[AttributeType.AntiSiren] or 0) + var_105_4[AttributeType.AntiSiren]
	end

	if var_105_8 then
		for iter_105_10, iter_105_11 in pairs(var_105_8) do
			if var_105_3[iter_105_10] then
				if iter_105_10 == AttributeType.Speed then
					var_105_3[iter_105_10] = var_105_3[iter_105_10] * iter_105_11
				else
					var_105_3[iter_105_10] = math.floor(var_105_3[iter_105_10] * iter_105_11)
				end
			end
		end
	end

	return var_105_3
end

function var_0_0.getTransGearScore(arg_106_0)
	local var_106_0 = 0
	local var_106_1 = pg.transform_data_template

	for iter_106_0, iter_106_1 in pairs(arg_106_0.transforms) do
		for iter_106_2 = 1, iter_106_1.level do
			var_106_0 = var_106_0 + (var_106_1[iter_106_1.id].gear_score[iter_106_2] or 0)
		end
	end

	return var_106_0
end

function var_0_0.getShipCombatPower(arg_107_0, arg_107_1)
	local var_107_0 = arg_107_0:getProperties(arg_107_1, nil, nil, true)
	local var_107_1 = var_107_0[AttributeType.Durability] / 5 + var_107_0[AttributeType.Cannon] + var_107_0[AttributeType.Torpedo] + var_107_0[AttributeType.AntiAircraft] + var_107_0[AttributeType.Air] + var_107_0[AttributeType.AntiSub] + var_107_0[AttributeType.Reload] + var_107_0[AttributeType.Hit] * 2 + var_107_0[AttributeType.Dodge] * 2 + var_107_0[AttributeType.Speed] + arg_107_0:getEquipmentGearScore() + arg_107_0:getTransGearScore()

	return math.floor(var_107_1)
end

function var_0_0.cosumeEnergy(arg_108_0, arg_108_1)
	arg_108_0:setEnergy(math.max(arg_108_0:getEnergy() - arg_108_1, 0))
end

function var_0_0.addEnergy(arg_109_0, arg_109_1)
	arg_109_0:setEnergy(arg_109_0:getEnergy() + arg_109_1)
end

function var_0_0.setEnergy(arg_110_0, arg_110_1)
	arg_110_0.energy = arg_110_1
end

function var_0_0.setLikability(arg_111_0, arg_111_1)
	assert(arg_111_1 >= 0 and arg_111_1 <= arg_111_0.maxIntimacy, "intimacy value invaild" .. arg_111_1)
	arg_111_0:setIntimacy(arg_111_1)
end

function var_0_0.addLikability(arg_112_0, arg_112_1)
	local var_112_0 = Mathf.Clamp(arg_112_0:getIntimacy() + arg_112_1, 0, arg_112_0.maxIntimacy)

	arg_112_0:setIntimacy(var_112_0)
end

function var_0_0.setIntimacy(arg_113_0, arg_113_1)
	if arg_113_1 > 10000 and not arg_113_0.propose then
		arg_113_1 = 10000
	end

	arg_113_0.intimacy = arg_113_1

	if not arg_113_0:isActivityNpc() then
		getProxy(CollectionProxy).shipGroups[arg_113_0.groupId]:updateMaxIntimacy(arg_113_0:getIntimacy())
	end
end

function var_0_0.getLevelExpConfig(arg_114_0, arg_114_1)
	if arg_114_0:getConfig("rarity") == ShipRarity.SSR then
		local var_114_0 = Clone(getConfigFromLevel1(var_0_6, arg_114_1 or arg_114_0.level))

		var_114_0.exp = var_114_0.exp_ur
		var_114_0.exp_start = var_114_0.exp_ur_start
		var_114_0.exp_interval = var_114_0.exp_ur_interval
		var_114_0.exp_end = var_114_0.exp_ur_end

		return var_114_0
	else
		return getConfigFromLevel1(var_0_6, arg_114_1 or arg_114_0.level)
	end
end

function var_0_0.getExp(arg_115_0)
	local var_115_0 = arg_115_0:getMaxLevel()

	if arg_115_0.level == var_115_0 and LOCK_FULL_EXP then
		return 0
	end

	return arg_115_0.exp
end

function var_0_0.getProficiency(arg_116_0)
	return arg_116_0.proficiency
end

function var_0_0.addExp(arg_117_0, arg_117_1, arg_117_2)
	local var_117_0 = arg_117_0:getMaxLevel()

	if arg_117_0.level == var_117_0 then
		if arg_117_0.exp >= pg.gameset.exp_overflow_max.key_value then
			return
		end

		if LOCK_FULL_EXP or not arg_117_2 or not arg_117_0:CanAccumulateExp() then
			arg_117_1 = 0
		end
	end

	arg_117_0.exp = arg_117_0.exp + arg_117_1

	local var_117_1 = false

	while arg_117_0:canLevelUp() do
		arg_117_0.exp = arg_117_0.exp - arg_117_0:getLevelExpConfig().exp_interval
		arg_117_0.level = math.min(arg_117_0.level + 1, var_117_0)
		var_117_1 = true
	end

	if arg_117_0.level == var_117_0 then
		if arg_117_2 and arg_117_0:CanAccumulateExp() then
			arg_117_0.exp = math.min(arg_117_0.exp, pg.gameset.exp_overflow_max.key_value)
		elseif var_117_1 then
			arg_117_0.exp = 0
		end
	end
end

function var_0_0.getMaxLevel(arg_118_0)
	return arg_118_0.maxLevel
end

function var_0_0.canLevelUp(arg_119_0)
	local var_119_0 = arg_119_0:getLevelExpConfig(arg_119_0.level + 1)
	local var_119_1 = arg_119_0:getMaxLevel() <= arg_119_0.level

	return var_119_0 and arg_119_0:getLevelExpConfig().exp_interval <= arg_119_0.exp and not var_119_1
end

function var_0_0.getConfigMaxLevel(arg_120_0)
	return var_0_6.all[#var_0_6.all]
end

function var_0_0.isConfigMaxLevel(arg_121_0)
	return arg_121_0.level == arg_121_0:getConfigMaxLevel()
end

function var_0_0.updateMaxLevel(arg_122_0, arg_122_1)
	local var_122_0 = arg_122_0:getConfigMaxLevel()

	arg_122_0.maxLevel = math.max(math.min(var_122_0, arg_122_1), arg_122_0.maxLevel)
end

function var_0_0.getNextMaxLevel(arg_123_0)
	local var_123_0 = arg_123_0:getConfigMaxLevel()

	for iter_123_0 = arg_123_0:getMaxLevel() + 1, var_123_0 do
		if var_0_6[iter_123_0].level_limit == 1 then
			return iter_123_0
		end
	end
end

function var_0_0.canUpgrade(arg_124_0)
	if arg_124_0:isBluePrintShip() then
		return false
	end

	if arg_124_0:isMetaShip() then
		local var_124_0 = arg_124_0:getMetaCharacter()

		if not var_124_0 then
			return false
		end

		local var_124_1 = var_124_0:getBreakOutInfo()

		if not var_124_1:hasNextInfo() then
			return false
		end

		local var_124_2, var_124_3 = var_124_1:getLimited()

		if var_124_2 > arg_124_0.level then
			return false
		end

		return true
	else
		local var_124_4 = var_0_8[arg_124_0.configId]

		assert(var_124_4, "不存在配置" .. arg_124_0.configId)

		return not arg_124_0:isMaxStar() and arg_124_0.level >= var_124_4.level
	end
end

function var_0_0.isReachNextMaxLevel(arg_125_0)
	return arg_125_0.level == arg_125_0:getMaxLevel() and arg_125_0:CanAccumulateExp() and arg_125_0:getNextMaxLevel() ~= nil
end

function var_0_0.isAwakening(arg_126_0)
	return arg_126_0:isReachNextMaxLevel() and arg_126_0.level < var_0_4
end

function var_0_0.isAwakening2(arg_127_0)
	return arg_127_0:isReachNextMaxLevel() and arg_127_0.level >= var_0_4
end

function var_0_0.notMaxLevelForFilter(arg_128_0)
	return arg_128_0.level ~= arg_128_0:getMaxLevel()
end

function var_0_0.getNextMaxLevelConsume(arg_129_0)
	local var_129_0 = arg_129_0:getMaxLevel()
	local var_129_1 = var_0_6[var_129_0]["need_item_rarity" .. arg_129_0:getConfig("rarity")]

	assert(var_129_1, "items  can not be nil")

	return _.map(var_129_1, function(arg_130_0)
		return {
			type = arg_130_0[1],
			id = arg_130_0[2],
			count = arg_130_0[3]
		}
	end)
end

function var_0_0.canUpgradeMaxLevel(arg_131_0)
	if not arg_131_0:isReachNextMaxLevel() then
		return false, i18n("upgrade_to_next_maxlevel_failed")
	else
		local var_131_0 = getProxy(PlayerProxy):getData()
		local var_131_1 = getProxy(BagProxy)
		local var_131_2 = arg_131_0:getNextMaxLevelConsume()

		for iter_131_0, iter_131_1 in pairs(var_131_2) do
			if iter_131_1.type == DROP_TYPE_RESOURCE then
				if var_131_0:getResById(iter_131_1.id) < iter_131_1.count then
					return false, i18n("common_no_resource")
				end
			elseif iter_131_1.type == DROP_TYPE_ITEM and var_131_1:getItemCountById(iter_131_1.id) < iter_131_1.count then
				return false, i18n("common_no_item_1")
			end
		end
	end

	return true
end

function var_0_0.CanAccumulateExp(arg_132_0)
	return pg.ship_data_template[arg_132_0.configId].can_get_proficency == 1
end

function var_0_0.getTotalExp(arg_133_0)
	return arg_133_0:getLevelExpConfig().exp_start + arg_133_0.exp
end

function var_0_0.getStartBattleExpend(arg_134_0)
	if table.contains(TeamType.SubShipType, arg_134_0:getShipType()) then
		return 0
	else
		return pg.ship_data_template[arg_134_0.configId].oil_at_start
	end
end

function var_0_0.getEndBattleExpend(arg_135_0)
	local var_135_0 = pg.ship_data_template[arg_135_0.configId]
	local var_135_1 = arg_135_0:getLevelExpConfig()

	return (math.floor(var_135_0.oil_at_end * var_135_1.fight_oil_ratio / 10000))
end

function var_0_0.getBattleTotalExpend(arg_136_0)
	return arg_136_0:getStartBattleExpend() + arg_136_0:getEndBattleExpend()
end

function var_0_0.getShipAmmo(arg_137_0)
	local var_137_0 = arg_137_0:getConfig(AttributeType.Ammo)

	for iter_137_0, iter_137_1 in pairs(arg_137_0:getAllSkills()) do
		local var_137_1 = tonumber(iter_137_0 .. string.format("%.2d", iter_137_1.level))
		local var_137_2 = pg.skill_benefit_template[var_137_1]

		if var_137_2 and arg_137_0:IsBenefitSkillActive(var_137_2) and (var_137_2.type == var_0_0.BENEFIT_EQUIP or var_137_2.type == var_0_0.BENEFIT_SKILL) then
			var_137_0 = var_137_0 + defaultValue(var_137_2.effect[1], 0)
		end
	end

	local var_137_3 = arg_137_0:getActiveEquipments()

	for iter_137_2, iter_137_3 in ipairs(var_137_3) do
		local var_137_4 = iter_137_3 and iter_137_3:getConfig("equip_parameters").ammo

		if var_137_4 then
			var_137_0 = var_137_0 + var_137_4
		end
	end

	return var_137_0
end

function var_0_0.getHuntingLv(arg_138_0)
	local var_138_0 = arg_138_0:getConfig("huntingrange_level")

	for iter_138_0, iter_138_1 in pairs(arg_138_0:getAllSkills()) do
		local var_138_1 = tonumber(iter_138_0 .. string.format("%.2d", iter_138_1.level))
		local var_138_2 = pg.skill_benefit_template[var_138_1]

		if var_138_2 and arg_138_0:IsBenefitSkillActive(var_138_2) and (var_138_2.type == var_0_0.BENEFIT_EQUIP or var_138_2.type == var_0_0.BENEFIT_SKILL) then
			var_138_0 = var_138_0 + defaultValue(var_138_2.effect[2], 0)
		end
	end

	local var_138_3 = arg_138_0:getActiveEquipments()

	for iter_138_2, iter_138_3 in ipairs(var_138_3) do
		local var_138_4 = iter_138_3 and iter_138_3:getConfig("equip_parameters").hunting_lv

		if var_138_4 then
			var_138_0 = var_138_0 + var_138_4
		end
	end

	return (math.min(var_138_0, arg_138_0:getMaxHuntingLv()))
end

function var_0_0.getMapAuras(arg_139_0)
	local var_139_0 = {}

	for iter_139_0, iter_139_1 in pairs(arg_139_0:getAllSkills()) do
		local var_139_1 = tonumber(iter_139_0 .. string.format("%.2d", iter_139_1.level))
		local var_139_2 = pg.skill_benefit_template[var_139_1]

		if var_139_2 and arg_139_0:IsBenefitSkillActive(var_139_2) and var_139_2.type == var_0_0.BENEFIT_MAP_AURA then
			local var_139_3 = {
				id = var_139_2.effect[1],
				level = iter_139_1.level
			}

			table.insert(var_139_0, var_139_3)
		end
	end

	return var_139_0
end

function var_0_0.getMapAids(arg_140_0)
	local var_140_0 = {}

	for iter_140_0, iter_140_1 in pairs(arg_140_0:getAllSkills()) do
		local var_140_1 = tonumber(iter_140_0 .. string.format("%.2d", iter_140_1.level))
		local var_140_2 = pg.skill_benefit_template[var_140_1]

		if var_140_2 and arg_140_0:IsBenefitSkillActive(var_140_2) and var_140_2.type == var_0_0.BENEFIT_AID then
			local var_140_3 = {
				id = var_140_2.effect[1],
				level = iter_140_1.level
			}

			table.insert(var_140_0, var_140_3)
		end
	end

	return var_140_0
end

var_0_0.BENEFIT_SKILL = 2
var_0_0.BENEFIT_EQUIP = 3
var_0_0.BENEFIT_MAP_AURA = 4
var_0_0.BENEFIT_AID = 5

function var_0_0.IsBenefitSkillActive(arg_141_0, arg_141_1)
	local var_141_0 = false

	if arg_141_1.type == var_0_0.BENEFIT_SKILL then
		if not arg_141_1.limit[1] or arg_141_1.limit[1] == arg_141_0.triggers.TeamNumbers then
			var_141_0 = true
		end
	elseif arg_141_1.type == var_0_0.BENEFIT_EQUIP then
		local var_141_1 = arg_141_1.limit
		local var_141_2 = arg_141_0:getAllEquipments()

		for iter_141_0, iter_141_1 in ipairs(var_141_2) do
			if iter_141_1 and table.contains(var_141_1, iter_141_1:getConfig("id")) then
				var_141_0 = true

				break
			end
		end
	elseif arg_141_1.type == var_0_0.BENEFIT_MAP_AURA then
		if arg_141_0.hpRant and arg_141_0.hpRant > 0 then
			return true
		end
	elseif arg_141_1.type == var_0_0.BENEFIT_AID and arg_141_0.hpRant and arg_141_0.hpRant > 0 then
		return true
	end

	return var_141_0
end

function var_0_0.getMaxHuntingLv(arg_142_0)
	return #arg_142_0:getConfig("hunting_range")
end

function var_0_0.getHuntingRange(arg_143_0, arg_143_1)
	local var_143_0 = arg_143_0:getConfig("hunting_range")
	local var_143_1 = Clone(var_143_0[1])
	local var_143_2 = arg_143_1 or arg_143_0:getHuntingLv()
	local var_143_3 = math.min(var_143_2, arg_143_0:getMaxHuntingLv())

	for iter_143_0 = 2, var_143_3 do
		_.each(var_143_0[iter_143_0], function(arg_144_0)
			table.insert(var_143_1, {
				arg_144_0[1],
				arg_144_0[2]
			})
		end)
	end

	return var_143_1
end

function var_0_0.getTriggerSkills(arg_145_0)
	local var_145_0 = {}
	local var_145_1 = arg_145_0:getSkillEffects()

	_.each(var_145_1, function(arg_146_0)
		if arg_146_0.type == "AddBuff" and arg_146_0.arg_list and arg_146_0.arg_list.buff_id then
			local var_146_0 = arg_146_0.arg_list.buff_id

			var_145_0[var_146_0] = {
				id = var_146_0,
				level = arg_146_0.level
			}
		end
	end)

	return var_145_0
end

function var_0_0.GetEquipmentSkills(arg_147_0)
	local var_147_0 = {}
	local var_147_1 = arg_147_0:getActiveEquipments()

	for iter_147_0, iter_147_1 in ipairs(var_147_1) do
		if iter_147_1 then
			local var_147_2 = iter_147_1:getConfig("skill_id")[1]

			if var_147_2 then
				var_147_0[var_147_2] = {
					level = 1,
					id = var_147_2
				}
			end
		end
	end

	;(function()
		local var_148_0 = arg_147_0:GetSpWeapon()
		local var_148_1 = var_148_0 and var_148_0:GetEffect() or 0

		if var_148_1 > 0 then
			var_147_0[var_148_1] = {
				level = 1,
				id = var_148_1
			}
		end
	end)()

	return var_147_0
end

function var_0_0.getAllSkills(arg_149_0)
	local var_149_0 = Clone(arg_149_0.skills)

	for iter_149_0, iter_149_1 in pairs(arg_149_0:GetEquipmentSkills()) do
		var_149_0[iter_149_0] = iter_149_1
	end

	for iter_149_2, iter_149_3 in pairs(arg_149_0:getTriggerSkills()) do
		var_149_0[iter_149_2] = iter_149_3
	end

	return var_149_0
end

function var_0_0.isSameKind(arg_150_0, arg_150_1)
	return pg.ship_data_template[arg_150_0.configId].group_type == pg.ship_data_template[arg_150_1.configId].group_type
end

function var_0_0.GetLockState(arg_151_0)
	return arg_151_0.lockState
end

function var_0_0.IsLocked(arg_152_0)
	return arg_152_0.lockState == var_0_0.LOCK_STATE_LOCK
end

function var_0_0.SetLockState(arg_153_0, arg_153_1)
	arg_153_0.lockState = arg_153_1
end

function var_0_0.GetPreferenceTag(arg_154_0)
	return arg_154_0.preferenceTag or 0
end

function var_0_0.IsPreferenceTag(arg_155_0)
	return arg_155_0:GetPreferenceTag() == var_0_0.PREFERENCE_TAG_COMMON
end

function var_0_0.SetPreferenceTag(arg_156_0, arg_156_1)
	arg_156_0.preferenceTag = arg_156_1
end

function var_0_0.calReturnRes(arg_157_0)
	local var_157_0 = pg.ship_data_by_type[arg_157_0:getShipType()]
	local var_157_1 = var_157_0.distory_resource_gold_ratio
	local var_157_2 = var_157_0.distory_resource_oil_ratio
	local var_157_3 = pg.ship_data_by_star[arg_157_0:getConfig("rarity")].destory_item

	return var_157_1, 0, var_157_3
end

function var_0_0.getRarity(arg_158_0)
	local var_158_0 = arg_158_0:getConfig("rarity")

	if arg_158_0:isRemoulded() then
		var_158_0 = var_158_0 + 1
	end

	return var_158_0
end

function var_0_0.getExchangePrice(arg_159_0)
	local var_159_0 = arg_159_0:getConfig("rarity")

	return pg.ship_data_by_star[var_159_0].exchange_price
end

function var_0_0.updateSkill(arg_160_0, arg_160_1)
	local var_160_0 = arg_160_1.skill_id or arg_160_1.id
	local var_160_1 = arg_160_1.skill_lv or arg_160_1.lv or arg_160_1.level
	local var_160_2 = arg_160_1.skill_exp or arg_160_1.exp

	arg_160_0.skills[var_160_0] = {
		id = var_160_0,
		level = var_160_1,
		exp = var_160_2
	}
end

function var_0_0.canEquipAtPos(arg_161_0, arg_161_1, arg_161_2)
	local var_161_0, var_161_1 = arg_161_0:isForbiddenAtPos(arg_161_1, arg_161_2)

	if var_161_0 then
		return false, var_161_1
	end

	for iter_161_0, iter_161_1 in ipairs(arg_161_0.equipments) do
		if iter_161_1 and iter_161_0 ~= arg_161_2 and iter_161_1:getConfig("equip_limit") ~= 0 and arg_161_1:getConfig("equip_limit") == iter_161_1:getConfig("equip_limit") then
			return false, i18n("ship_equip_same_group_equipment")
		end
	end

	return true
end

function var_0_0.isForbiddenAtPos(arg_162_0, arg_162_1, arg_162_2)
	local var_162_0 = pg.ship_data_template[arg_162_0.configId]

	assert(var_162_0, "can not find ship in ship_data_templtae: " .. arg_162_0.configId)

	local var_162_1 = var_162_0["equip_" .. arg_162_2]

	if not table.contains(var_162_1, arg_162_1:getConfig("type")) then
		return true, i18n("common_limit_equip")
	end

	if table.contains(arg_162_1:getConfig("ship_type_forbidden"), arg_162_0:getShipType()) then
		return true, i18n("common_limit_equip")
	end

	return false
end

function var_0_0.canEquipCommander(arg_163_0, arg_163_1)
	if arg_163_1:getShipType() ~= arg_163_0:getShipType() then
		return false, i18n("commander_type_unmatch")
	end

	return true
end

function var_0_0.upgrade(arg_164_0)
	local var_164_0 = pg.ship_data_transform[arg_164_0.configId]

	if var_164_0.trans_id and var_164_0.trans_id > 0 then
		arg_164_0.configId = var_164_0.trans_id
		arg_164_0.star = arg_164_0:getConfig("star")
	end
end

function var_0_0.getTeamType(arg_165_0)
	return TeamType.GetTeamFromShipType(arg_165_0:getShipType())
end

function var_0_0.getFleetName(arg_166_0)
	local var_166_0 = arg_166_0:getTeamType()

	return var_0_1[var_166_0]
end

function var_0_0.getMaxConfigId(arg_167_0)
	local var_167_0 = pg.ship_data_template
	local var_167_1

	for iter_167_0 = 4, 1, -1 do
		local var_167_2 = tonumber(arg_167_0.groupId .. iter_167_0)

		if var_167_0[var_167_2] then
			var_167_1 = var_167_2

			break
		end
	end

	return var_167_1
end

function var_0_0.getFlag(arg_168_0, arg_168_1, arg_168_2)
	return pg.ShipFlagMgr.GetInstance():GetShipFlag(arg_168_0.id, arg_168_1, arg_168_2)
end

function var_0_0.hasAnyFlag(arg_169_0, arg_169_1)
	return _.any(arg_169_1, function(arg_170_0)
		return arg_169_0:getFlag(arg_170_0)
	end)
end

function var_0_0.isBreakOut(arg_171_0)
	return arg_171_0.configId % 10 > 1
end

function var_0_0.fateSkillChange(arg_172_0, arg_172_1)
	if not arg_172_0.skillChangeList then
		arg_172_0.skillChangeList = arg_172_0:isBluePrintShip() and arg_172_0:getBluePrint():getChangeSkillList() or {}
	end

	for iter_172_0, iter_172_1 in ipairs(arg_172_0.skillChangeList) do
		if iter_172_1[1] == arg_172_1 and arg_172_0.skills[iter_172_1[2]] then
			return iter_172_1[2]
		end
	end

	return arg_172_1
end

function var_0_0.RemapSkillId(arg_173_0, arg_173_1)
	local var_173_0 = arg_173_0:GetSpWeapon()

	if var_173_0 then
		return var_173_0:RemapSkillId(arg_173_1)
	end

	return arg_173_1
end

function var_0_0.getSkillList(arg_174_0)
	local var_174_0 = pg.ship_data_template[arg_174_0.configId]
	local var_174_1 = Clone(var_174_0.buff_list_display)
	local var_174_2 = Clone(var_174_0.buff_list)
	local var_174_3 = pg.ship_data_trans[arg_174_0.groupId]
	local var_174_4 = 0

	if var_174_3 and var_174_3.skill_id ~= 0 then
		local var_174_5 = var_174_3.skill_id
		local var_174_6 = pg.transform_data_template[var_174_5]

		if arg_174_0.transforms[var_174_5] and var_174_6.skill_id ~= 0 then
			table.insert(var_174_2, var_174_6.skill_id)
		end
	end

	local var_174_7 = {}

	for iter_174_0, iter_174_1 in ipairs(var_174_1) do
		for iter_174_2, iter_174_3 in ipairs(var_174_2) do
			if iter_174_1 == iter_174_3 then
				table.insert(var_174_7, arg_174_0:fateSkillChange(iter_174_1))
			end
		end
	end

	return var_174_7
end

function var_0_0.getModAttrTopLimit(arg_175_0, arg_175_1)
	local var_175_0 = ShipModAttr.ATTR_TO_INDEX[arg_175_1]
	local var_175_1 = pg.ship_data_template[arg_175_0.configId].strengthen_id
	local var_175_2 = pg.ship_data_strengthen[var_175_1].durability[var_175_0]

	return calcFloor((3 + 7 * (math.min(arg_175_0.level, 100) / 100)) * var_175_2 * 0.1)
end

function var_0_0.leftModAdditionPoint(arg_176_0, arg_176_1)
	local var_176_0 = arg_176_0:getModProperties(arg_176_1)
	local var_176_1 = arg_176_0:getModExpRatio(arg_176_1)
	local var_176_2 = arg_176_0:getModAttrTopLimit(arg_176_1)
	local var_176_3 = calcFloor(var_176_0 / var_176_1)

	return math.max(0, var_176_2 - var_176_3)
end

function var_0_0.getModAttrBaseMax(arg_177_0, arg_177_1)
	if not table.contains(arg_177_0:getConfig("lock"), arg_177_1) then
		local var_177_0 = arg_177_0:leftModAdditionPoint(arg_177_1)
		local var_177_1 = arg_177_0:getShipProperties()

		return calcFloor(var_177_1[arg_177_1] + var_177_0)
	else
		return 0
	end
end

function var_0_0.getModExpRatio(arg_178_0, arg_178_1)
	if not table.contains(arg_178_0:getConfig("lock"), arg_178_1) then
		local var_178_0 = pg.ship_data_template[arg_178_0.configId].strengthen_id

		assert(pg.ship_data_strengthen[var_178_0], "ship_data_strengthen>>>>>>" .. var_178_0)

		return math.max(pg.ship_data_strengthen[var_178_0].level_exp[ShipModAttr.ATTR_TO_INDEX[arg_178_1]], 1)
	else
		return 1
	end
end

function var_0_0.inUnlockTip(arg_179_0)
	local var_179_0 = pg.gameset.tip_unlock_shipIds.description[0]

	return table.contains(var_179_0, arg_179_0)
end

function var_0_0.proposeSkinOwned(arg_180_0, arg_180_1)
	return arg_180_1 and arg_180_0.propose and arg_180_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE
end

function var_0_0.getProposeSkin(arg_181_0)
	return ShipSkin.GetSkinByType(arg_181_0.groupId, ShipSkin.SKIN_TYPE_PROPOSE)
end

function var_0_0.getDisplaySkillIds(arg_182_0)
	return _.map(pg.ship_data_template[arg_182_0.configId].buff_list_display, function(arg_183_0)
		return arg_182_0:fateSkillChange(arg_183_0)
	end)
end

function var_0_0.isFullSkillLevel(arg_184_0)
	local var_184_0 = pg.skill_data_template

	for iter_184_0, iter_184_1 in pairs(arg_184_0.skills) do
		if var_184_0[iter_184_1.id].max_level ~= iter_184_1.level then
			return false
		end
	end

	return true
end

function var_0_0.setEquipmentRecord(arg_185_0, arg_185_1, arg_185_2)
	local var_185_0 = "equipment_record" .. "_" .. arg_185_1 .. "_" .. arg_185_0.id

	PlayerPrefs.SetString(var_185_0, table.concat(_.flatten(arg_185_2), ":"))
	PlayerPrefs.Save()
end

function var_0_0.getEquipmentRecord(arg_186_0, arg_186_1)
	if not arg_186_0.equipmentRecords then
		local var_186_0 = "equipment_record" .. "_" .. arg_186_1 .. "_" .. arg_186_0.id
		local var_186_1 = string.split(PlayerPrefs.GetString(var_186_0) or "", ":")
		local var_186_2 = {}

		for iter_186_0 = 1, 3 do
			var_186_2[iter_186_0] = _.map(_.slice(var_186_1, 5 * iter_186_0 - 4, 5), function(arg_187_0)
				return tonumber(arg_187_0)
			end)
		end

		arg_186_0.equipmentRecords = var_186_2
	end

	return arg_186_0.equipmentRecords
end

function var_0_0.SetSpWeaponRecord(arg_188_0, arg_188_1, arg_188_2)
	local var_188_0 = "spweapon_record" .. "_" .. arg_188_1 .. "_" .. arg_188_0.id
	local var_188_1 = _.map({
		1,
		2,
		3
	}, function(arg_189_0)
		local var_189_0 = arg_188_2[arg_189_0]

		if var_189_0 then
			return (var_189_0:GetUID() or 0) .. "," .. var_189_0:GetConfigID()
		else
			return "0,0"
		end
	end)

	PlayerPrefs.SetString(var_188_0, table.concat(var_188_1, ":"))
	PlayerPrefs.Save()
end

function var_0_0.GetSpWeaponRecord(arg_190_0, arg_190_1)
	local var_190_0 = "spweapon_record" .. "_" .. arg_190_1 .. "_" .. arg_190_0.id

	return (_.map(string.split(PlayerPrefs.GetString(var_190_0, ""), ":"), function(arg_191_0)
		local var_191_0 = string.split(arg_191_0, ",")

		assert(var_191_0)

		local var_191_1 = tonumber(var_191_0[1])
		local var_191_2 = tonumber(var_191_0[2])

		if not var_191_2 or var_191_2 == 0 then
			return false
		end

		return (SpWeapon.New({
			id = var_191_2
		}))
	end))
end

function var_0_0.hasEquipEquipmentSkin(arg_192_0)
	for iter_192_0, iter_192_1 in ipairs(arg_192_0.equipments) do
		if iter_192_1 and iter_192_1:hasSkin() then
			return true
		end
	end

	return false
end

function var_0_0.hasCommander(arg_193_0)
	return arg_193_0.commanderId and arg_193_0.commanderId ~= 0
end

function var_0_0.getCommander(arg_194_0)
	return arg_194_0.commanderId
end

function var_0_0.setCommander(arg_195_0, arg_195_1)
	arg_195_0.commanderId = arg_195_1
end

function var_0_0.getSkillIndex(arg_196_0, arg_196_1)
	local var_196_0 = arg_196_0:getSkillList()

	for iter_196_0, iter_196_1 in ipairs(var_196_0) do
		if arg_196_1 == iter_196_1 then
			return iter_196_0
		end
	end
end

function var_0_0.getTactics(arg_197_0)
	return 1, "tactics_attack"
end

function var_0_0.IsBgmSkin(arg_198_0)
	local var_198_0 = arg_198_0:GetSkinConfig()

	return table.contains(var_198_0.tag, ShipSkin.WITH_BGM)
end

function var_0_0.GetSkinBgm(arg_199_0)
	if arg_199_0:IsBgmSkin() then
		return arg_199_0:GetSkinConfig().bgm
	end
end

function var_0_0.isIntensifyMax(arg_200_0)
	local var_200_0 = intProperties(arg_200_0:getShipProperties())

	if arg_200_0:isBluePrintShip() then
		return true
	end

	for iter_200_0, iter_200_1 in pairs(ShipModAttr.ID_TO_ATTR) do
		if arg_200_0:getModAttrBaseMax(iter_200_1) ~= var_200_0[iter_200_1] then
			return false
		end
	end

	return true
end

function var_0_0.isRemouldable(arg_201_0)
	return not arg_201_0:isTestShip() and not arg_201_0:isBluePrintShip() and pg.ship_data_trans[arg_201_0.groupId]
end

function var_0_0.isAllRemouldFinish(arg_202_0)
	local var_202_0 = pg.ship_data_trans[arg_202_0.groupId]

	assert(var_202_0, "this ship group without remould config:" .. arg_202_0.groupId)

	for iter_202_0, iter_202_1 in ipairs(var_202_0.transform_list) do
		for iter_202_2, iter_202_3 in ipairs(iter_202_1) do
			local var_202_1 = pg.transform_data_template[iter_202_3[2]]

			if #var_202_1.edit_trans > 0 then
				-- block empty
			elseif not arg_202_0.transforms[iter_202_3[2]] or arg_202_0.transforms[iter_202_3[2]].level < var_202_1.max_level then
				return false
			end
		end
	end

	return true
end

function var_0_0.isSpecialFilter(arg_203_0)
	local var_203_0 = pg.ship_data_statistics[arg_203_0.configId]

	assert(var_203_0, "this ship without statistics:" .. arg_203_0.configId)

	for iter_203_0, iter_203_1 in ipairs(var_203_0.tag_list) do
		if iter_203_1 == "special" then
			return true
		end
	end

	return false
end

function var_0_0.hasAvailiableSkin(arg_204_0)
	local var_204_0 = getProxy(ShipSkinProxy)
	local var_204_1 = var_204_0:GetAllSkinForShip(arg_204_0)
	local var_204_2 = var_204_0:getRawData()
	local var_204_3 = 0

	for iter_204_0, iter_204_1 in ipairs(var_204_1) do
		if arg_204_0:proposeSkinOwned(iter_204_1) or var_204_2[iter_204_1.id] then
			var_204_3 = var_204_3 + 1
		end
	end

	return var_204_3 > 0
end

function var_0_0.hasProposeSkin(arg_205_0)
	local var_205_0 = getProxy(ShipSkinProxy)
	local var_205_1 = var_205_0:GetAllSkinForShip(arg_205_0)

	for iter_205_0, iter_205_1 in ipairs(var_205_1) do
		if iter_205_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE then
			return true
		end
	end

	local var_205_2 = var_205_0:GetShareSkinsForShip(arg_205_0)

	for iter_205_2, iter_205_3 in ipairs(var_205_2) do
		if iter_205_3.skin_type == ShipSkin.SKIN_TYPE_PROPOSE then
			return true
		end
	end

	return false
end

function var_0_0.HasUniqueSpWeapon(arg_206_0)
	return tobool(pg.spweapon_data_statistics.get_id_list_by_unique[arg_206_0:getGroupId()])
end

function var_0_0.getAircraftReloadCD(arg_207_0)
	local var_207_0 = arg_207_0:getConfigTable().base_list
	local var_207_1 = arg_207_0:getConfigTable().default_equip_list
	local var_207_2 = 0
	local var_207_3 = 0

	for iter_207_0 = 1, 3 do
		local var_207_4 = arg_207_0:getEquip(iter_207_0)
		local var_207_5 = var_207_4 and var_207_4.configId or var_207_1[iter_207_0]
		local var_207_6 = Equipment.getConfigData(var_207_5).type

		if underscore.any(EquipType.AirEquipTypes, function(arg_208_0)
			return var_207_6 == arg_208_0
		end) then
			var_207_2 = var_207_2 + Equipment.GetEquipReloadStatic(var_207_5) * var_207_0[iter_207_0]
			var_207_3 = var_207_3 + var_207_0[iter_207_0]
		end
	end

	local var_207_7 = ys.Battle.BattleConfig.AIR_ASSIST_RELOAD_RATIO * pg.bfConsts.PERCENT

	return {
		name = i18n("equip_info_31"),
		type = AttributeType.CD,
		value = var_207_2 / var_207_3 * var_207_7
	}
end

function var_0_0.IsTagShip(arg_209_0, arg_209_1)
	local var_209_0 = arg_209_0:getConfig("tag_list")

	return table.contains(var_209_0, arg_209_1)
end

function var_0_0.setReMetaSpecialItemVO(arg_210_0, arg_210_1)
	arg_210_0.reMetaSpecialItemVO = arg_210_1
end

function var_0_0.getReMetaSpecialItemVO(arg_211_0, arg_211_1)
	return arg_211_0.reMetaSpecialItemVO
end

function var_0_0.getProposeType(arg_212_0)
	if arg_212_0:isMetaShip() then
		return "meta"
	elseif arg_212_0:IsXIdol() then
		return "imas"
	else
		return "default"
	end
end

function var_0_0.IsXIdol(arg_213_0)
	return arg_213_0:getNation() == Nation.IDOL_LINK
end

function var_0_0.getSpecificType(arg_214_0)
	return pg.ship_data_template[arg_214_0.configId].specific_type
end

function var_0_0.GetSpWeapon(arg_215_0)
	return arg_215_0.spWeapon
end

function var_0_0.UpdateSpWeapon(arg_216_0, arg_216_1)
	local var_216_0 = (arg_216_1 and arg_216_1:GetUID() or 0) == (arg_216_0.spWeapon and arg_216_0.spWeapon:GetUID() or 0)

	arg_216_0.spWeapon = arg_216_1

	if arg_216_1 then
		arg_216_1:SetShipId(arg_216_0.id)
	end

	if var_216_0 then
		pg.m02:sendNotification(EquipmentProxy.SPWEAPONS_UPDATED)
	end
end

function var_0_0.CanEquipSpWeapon(arg_217_0, arg_217_1)
	local var_217_0, var_217_1 = arg_217_0:IsSpWeaponForbidden(arg_217_1)

	if var_217_0 then
		return false, var_217_1
	end

	return true
end

function var_0_0.IsSpWeaponForbidden(arg_218_0, arg_218_1)
	local var_218_0 = arg_218_1:GetWearableShipTypes()
	local var_218_1 = arg_218_0:getShipType()

	if not table.contains(var_218_0, var_218_1) then
		return true, i18n("spweapon_tip_group_error")
	end

	local var_218_2 = arg_218_1:GetUniqueGroup()
	local var_218_3 = arg_218_0:getGroupId()

	if var_218_2 ~= 0 and var_218_2 ~= var_218_3 then
		return true, i18n("spweapon_tip_group_error")
	end

	return false
end

function var_0_0.GetMapStrikeAnim(arg_219_0)
	local var_219_0
	local var_219_1 = arg_219_0:getShipType()

	switch(TeamType.GetTeamFromShipType(var_219_1), {
		[TeamType.Main] = function()
			if ShipType.IsTypeQuZhu(var_219_1) then
				var_219_0 = "SubTorpedoUI"
			elseif ShipType.ContainInLimitBundle(ShipType.BundleAircraftCarrier, var_219_1) then
				var_219_0 = "AirStrikeUI"
			elseif ShipType.ContainInLimitBundle(ShipType.BundleBattleShip, var_219_1) then
				var_219_0 = "CannonUI"
			else
				var_219_0 = "CannonUI"
			end
		end,
		[TeamType.Vanguard] = function()
			if ShipType.IsTypeQuZhu(var_219_1) then
				var_219_0 = "SubTorpedoUI"
			end
		end,
		[TeamType.Submarine] = function()
			if arg_219_0:getNation() == Nation.MOT then
				var_219_0 = "CannonUI"
			else
				var_219_0 = "SubTorpedoUI"
			end
		end
	})

	return var_219_0
end

function var_0_0.IsDefaultSkin(arg_223_0)
	return arg_223_0.skinId == 0 or arg_223_0.skinId == arg_223_0:getConfig("skin_id")
end

function var_0_0.IsMatchKey(arg_224_0, arg_224_1)
	if not arg_224_1 or arg_224_1 == "" then
		return true
	end

	arg_224_1 = string.lower(string.gsub(arg_224_1, "%.", "%%."))

	return string.find(string.lower(arg_224_0:GetDefaultName()), arg_224_1)
end

function var_0_0.IsOwner(arg_225_0)
	return tobool(arg_225_0.id)
end

function var_0_0.GetUniqueId(arg_226_0)
	return arg_226_0.id
end

function var_0_0.ShowPropose(arg_227_0)
	if not arg_227_0.propose then
		return false
	else
		return not HXSet.isHxPropose() or arg_227_0:IsOwner() and arg_227_0:GetUniqueId() == getProxy(PlayerProxy):getRawData():GetProposeShipId()
	end
end

function var_0_0.GetColorName(arg_228_0, arg_228_1)
	arg_228_1 = arg_228_1 or arg_228_0:getName()

	if PlayerPrefs.GetInt("SHIP_NAME_COLOR", PLATFORM_CODE == PLATFORM_CH and 1 or 0) == 1 and arg_228_0.propose then
		return setColorStr(arg_228_1, "#FFAACEFF")
	else
		return arg_228_1
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

function var_0_0.GetFrameAndEffect(arg_229_0, arg_229_1)
	arg_229_1 = tobool(arg_229_1)

	local var_229_0
	local var_229_1

	if arg_229_0.propose then
		if arg_229_0:isMetaShip() then
			var_229_1 = string.format(var_0_9.effect[1])
			var_229_0 = string.format(var_0_9.frame[1])
		elseif arg_229_0:isBluePrintShip() then
			var_229_1 = string.format(var_0_9.effect[2])
			var_229_0 = string.format(var_0_9.frame[2], arg_229_0:rarity2bgPrint())
		else
			var_229_1 = string.format(var_0_9.effect[3])
			var_229_0 = string.format(var_0_9.frame[3])
		end

		if not arg_229_0:ShowPropose() then
			var_229_0 = nil
		end
	elseif arg_229_0:isMetaShip() then
		var_229_1 = string.format(var_0_9.effect[4], arg_229_0:rarity2bgPrint())
	elseif arg_229_0:getRarity() == ShipRarity.SSR then
		var_229_1 = string.format(var_0_9.effect[5])
	end

	if arg_229_1 then
		var_229_1 = var_229_1 and var_229_1 .. "_1"
	end

	return var_229_0, var_229_1
end

function var_0_0.GetRecordPosKey(arg_230_0)
	return arg_230_0.skinId
end

return var_0_0
