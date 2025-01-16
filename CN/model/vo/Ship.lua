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

function var_0_0.getTransformShipId(arg_17_0)
	local var_17_0 = pg.ship_data_template[arg_17_0].group_type
	local var_17_1 = pg.ship_data_trans[var_17_0]

	if var_17_1 then
		for iter_17_0, iter_17_1 in ipairs(var_17_1.transform_list) do
			for iter_17_2, iter_17_3 in ipairs(iter_17_1) do
				local var_17_2 = pg.transform_data_template[iter_17_3[2]]

				for iter_17_4, iter_17_5 in ipairs(var_17_2.ship_id) do
					if iter_17_5[1] == arg_17_0 then
						return iter_17_5[2]
					end
				end
			end
		end
	end
end

function var_0_0.getAircraftCount(arg_18_0)
	local var_18_0 = arg_18_0:getConfigTable().base_list
	local var_18_1 = arg_18_0:getConfigTable().default_equip_list
	local var_18_2 = {}

	for iter_18_0 = 1, 3 do
		local var_18_3 = arg_18_0:getEquip(iter_18_0) and arg_18_0:getEquip(iter_18_0).configId or var_18_1[iter_18_0]
		local var_18_4 = Equipment.getConfigData(var_18_3).type

		if table.contains(EquipType.AirDomainEquip, var_18_4) then
			var_18_2[var_18_4] = defaultValue(var_18_2[var_18_4], 0) + var_18_0[iter_18_0]
		end
	end

	return var_18_2
end

function var_0_0.getShipType(arg_19_0)
	return arg_19_0:getConfig("type")
end

function var_0_0.getEnergy(arg_20_0)
	return arg_20_0.energy
end

function var_0_0.getEnergeConfig(arg_21_0)
	local var_21_0 = pg.energy_template
	local var_21_1 = arg_21_0:getEnergy()

	for iter_21_0, iter_21_1 in pairs(var_21_0) do
		if type(iter_21_0) == "number" and var_21_1 >= iter_21_1.lower_bound and var_21_1 <= iter_21_1.upper_bound then
			return iter_21_1
		end
	end

	assert(false, "疲劳配置不存在：" .. arg_21_0.energy)
end

function var_0_0.getEnergyPrint(arg_22_0)
	local var_22_0 = arg_22_0:getEnergeConfig()

	return var_22_0.icon, var_22_0.desc
end

function var_0_0.getIntimacy(arg_23_0)
	return arg_23_0.intimacy
end

function var_0_0.getCVIntimacy(arg_24_0)
	return arg_24_0:getIntimacy() / 100 + (arg_24_0.propose and 1000 or 0)
end

function var_0_0.getIntimacyMax(arg_25_0)
	if arg_25_0.propose then
		return 200
	else
		return arg_25_0:GetNoProposeIntimacyMax()
	end
end

function var_0_0.GetNoProposeIntimacyMax(arg_26_0)
	return 100
end

function var_0_0.getIntimacyIcon(arg_27_0)
	local var_27_0 = pg.intimacy_template[arg_27_0:getIntimacyLevel()]
	local var_27_1 = ""

	if arg_27_0:isMetaShip() then
		var_27_1 = "_meta"
	elseif arg_27_0:IsXIdol() then
		var_27_1 = "_imas"
	end

	if not arg_27_0.propose and math.floor(arg_27_0:getIntimacy() / 100) >= arg_27_0:getIntimacyMax() then
		return var_27_0.icon .. var_27_1, "heart" .. var_27_1
	else
		return var_27_0.icon .. var_27_1
	end
end

function var_0_0.getIntimacyDetail(arg_28_0)
	return arg_28_0:getIntimacyMax(), math.floor(arg_28_0:getIntimacy() / 100)
end

function var_0_0.getIntimacyInfo(arg_29_0)
	local var_29_0 = pg.intimacy_template[arg_29_0:getIntimacyLevel()]

	return var_29_0.icon, var_29_0.desc
end

function var_0_0.getIntimacyLevel(arg_30_0)
	local var_30_0 = 0
	local var_30_1 = pg.intimacy_template

	for iter_30_0, iter_30_1 in pairs(var_30_1) do
		if type(iter_30_0) == "number" and arg_30_0:getIntimacy() >= iter_30_1.lower_bound and arg_30_0:getIntimacy() <= iter_30_1.upper_bound then
			var_30_0 = iter_30_0

			break
		end
	end

	if var_30_0 < arg_30_0.INTIMACY_PROPOSE and arg_30_0.propose then
		var_30_0 = arg_30_0.INTIMACY_PROPOSE
	end

	return var_30_0
end

function var_0_0.getBluePrint(arg_31_0)
	local var_31_0 = ShipBluePrint.New({
		id = arg_31_0.groupId
	})
	local var_31_1 = arg_31_0.strengthList[1] or {
		exp = 0,
		level = 0
	}

	var_31_0:updateInfo({
		blue_print_level = var_31_1.level,
		exp = var_31_1.exp
	})

	return var_31_0
end

function var_0_0.getBaseList(arg_32_0)
	if arg_32_0:isBluePrintShip() then
		local var_32_0 = arg_32_0:getBluePrint()

		assert(var_32_0, "blueprint can not be nil" .. arg_32_0.configId)

		return var_32_0:getBaseList(arg_32_0)
	else
		return arg_32_0:getConfig("base_list")
	end
end

function var_0_0.getPreLoadCount(arg_33_0)
	if arg_33_0:isBluePrintShip() then
		return arg_33_0:getBluePrint():getPreLoadCount(arg_33_0)
	else
		return arg_33_0:getConfig("preload_count")
	end
end

function var_0_0.getNation(arg_34_0)
	return arg_34_0:getConfig("nationality")
end

function var_0_0.getPaintingName(arg_35_0)
	local var_35_0 = pg.ship_data_statistics[arg_35_0].skin_id
	local var_35_1 = pg.ship_skin_template[var_35_0]

	assert(var_35_1, "ship_skin_template not exist: " .. arg_35_0 .. " " .. var_35_0)

	return var_35_1.painting
end

function var_0_0.getName(arg_36_0)
	if arg_36_0.propose and pg.PushNotificationMgr.GetInstance():isEnableShipName() then
		return arg_36_0.name
	end

	if arg_36_0:isRemoulded() then
		return pg.ship_skin_template[arg_36_0:getRemouldSkinId()].name
	end

	return pg.ship_data_statistics[arg_36_0.configId].name
end

function var_0_0.GetDefaultName(arg_37_0)
	if arg_37_0:isRemoulded() then
		return pg.ship_skin_template[arg_37_0:getRemouldSkinId()].name
	else
		return pg.ship_data_statistics[arg_37_0.configId].name
	end
end

function var_0_0.getShipName(arg_38_0)
	return pg.ship_data_statistics[arg_38_0].name
end

function var_0_0.getBreakOutLevel(arg_39_0)
	assert(arg_39_0, "必须存在配置id")
	assert(pg.ship_data_statistics[arg_39_0], "必须存在配置" .. arg_39_0)

	return pg.ship_data_statistics[arg_39_0].star
end

function var_0_0.Ctor(arg_40_0, arg_40_1)
	arg_40_0.id = arg_40_1.id
	arg_40_0.configId = arg_40_1.template_id or arg_40_1.configId
	arg_40_0.level = arg_40_1.level
	arg_40_0.exp = arg_40_1.exp
	arg_40_0.energy = arg_40_1.energy
	arg_40_0.lockState = arg_40_1.is_locked
	arg_40_0.intimacy = arg_40_1.intimacy
	arg_40_0.propose = arg_40_1.propose and arg_40_1.propose > 0
	arg_40_0.proposeTime = arg_40_1.propose

	if arg_40_0.intimacy and arg_40_0.intimacy > 10000 and not arg_40_0.propose then
		arg_40_0.intimacy = 10000
	end

	arg_40_0.renameTime = arg_40_1.change_name_timestamp

	if arg_40_1.name and arg_40_1.name ~= "" then
		arg_40_0.name = arg_40_1.name
	else
		assert(pg.ship_data_statistics[arg_40_0.configId], "必须存在配置" .. arg_40_0.configId)

		arg_40_0.name = pg.ship_data_statistics[arg_40_0.configId].name
	end

	arg_40_0.bluePrintFlag = arg_40_1.blue_print_flag or 0
	arg_40_0.strengthList = {}

	for iter_40_0, iter_40_1 in ipairs(arg_40_1.strength_list or {}) do
		if not arg_40_0:isBluePrintShip() then
			local var_40_0 = ShipModAttr.ID_TO_ATTR[iter_40_1.id]

			arg_40_0.strengthList[var_40_0] = iter_40_1.exp
		else
			table.insert(arg_40_0.strengthList, {
				level = iter_40_1.id,
				exp = iter_40_1.exp
			})
		end
	end

	local var_40_1 = arg_40_1.state or {}

	arg_40_0.state = var_40_1.state
	arg_40_0.state_info_1 = var_40_1.state_info_1
	arg_40_0.state_info_2 = var_40_1.state_info_2
	arg_40_0.state_info_3 = var_40_1.state_info_3
	arg_40_0.state_info_4 = var_40_1.state_info_4
	arg_40_0.equipmentSkins = {}
	arg_40_0.equipments = {}

	if arg_40_1.equip_info_list then
		for iter_40_2, iter_40_3 in ipairs(arg_40_1.equip_info_list or {}) do
			arg_40_0.equipments[iter_40_2] = iter_40_3.id > 0 and Equipment.New({
				count = 1,
				id = iter_40_3.id,
				config_id = iter_40_3.id,
				skinId = iter_40_3.skinId
			}) or false
			arg_40_0.equipmentSkins[iter_40_2] = iter_40_3.skinId > 0 and iter_40_3.skinId or 0

			arg_40_0:reletiveEquipSkin(iter_40_2)
		end
	end

	arg_40_0.spWeapon = nil

	if arg_40_1.spweapon then
		arg_40_0:UpdateSpWeapon(SpWeapon.CreateByNet(arg_40_1.spweapon))
	end

	arg_40_0.skills = {}

	for iter_40_4, iter_40_5 in ipairs(arg_40_1.skill_id_list or {}) do
		arg_40_0:updateSkill(iter_40_5)
	end

	arg_40_0.star = arg_40_0:getConfig("rarity")
	arg_40_0.transforms = {}

	for iter_40_6, iter_40_7 in ipairs(arg_40_1.transform_list or {}) do
		arg_40_0.transforms[iter_40_7.id] = {
			id = iter_40_7.id,
			level = iter_40_7.level
		}
	end

	arg_40_0.groupId = pg.ship_data_template[arg_40_0.configId].group_type
	arg_40_0.createTime = arg_40_1.create_time or 0

	local var_40_2 = getProxy(CollectionProxy)

	arg_40_0.virgin = var_40_2 and var_40_2.shipGroups[arg_40_0.groupId] == nil

	local var_40_3 = {
		pg.gameset.test_ship_config_1.key_value,
		pg.gameset.test_ship_config_2.key_value,
		pg.gameset.test_ship_config_3.key_value
	}
	local var_40_4 = table.indexof(var_40_3, arg_40_0.configId)

	if var_40_4 == 1 then
		arg_40_0.testShip = {
			2,
			3,
			4
		}
	elseif var_40_4 == 2 then
		arg_40_0.testShip = {
			5
		}
	elseif var_40_4 == 3 then
		arg_40_0.testShip = {
			6
		}
	else
		arg_40_0.testShip = nil
	end

	arg_40_0.maxIntimacy = pg.intimacy_template[#pg.intimacy_template.all].upper_bound

	local var_40_5 = 0

	if not HXSet.isHxSkin() then
		var_40_5 = arg_40_1.skin_id or 0
	end

	if var_40_5 == 0 then
		var_40_5 = arg_40_0:getConfig("skin_id")
	end

	arg_40_0:updateSkinId(var_40_5)

	if arg_40_1.name and arg_40_1.name ~= "" then
		arg_40_0.name = arg_40_1.name
	elseif arg_40_0:isRemoulded() then
		arg_40_0.name = pg.ship_skin_template[arg_40_0:getRemouldSkinId()].name
	else
		arg_40_0.name = pg.ship_data_statistics[arg_40_0.configId].name
	end

	arg_40_0.maxLevel = arg_40_1.max_level
	arg_40_0.proficiency = arg_40_1.proficiency or 0
	arg_40_0.preferenceTag = arg_40_1.common_flag
	arg_40_0.hpRant = 10000
	arg_40_0.strategies = {}
	arg_40_0.triggers = {}
	arg_40_0.commanderId = arg_40_1.commanderid or 0
	arg_40_0.activityNpc = arg_40_1.activity_npc or 0

	if var_0_0.isMetaShipByConfigID(arg_40_0.configId) then
		local var_40_6 = MetaCharacterConst.GetMetaShipGroupIDByConfigID(arg_40_0.configId)

		arg_40_0.metaCharacter = MetaCharacter.New({
			id = var_40_6,
			repair_attr_info = arg_40_1.meta_repair_list
		}, arg_40_0)
	end
end

function var_0_0.isMetaShipByConfigID(arg_41_0)
	local var_41_0 = pg.ship_meta_breakout.all
	local var_41_1 = var_41_0[1]
	local var_41_2 = false

	if var_41_1 <= arg_41_0 then
		for iter_41_0, iter_41_1 in ipairs(var_41_0) do
			if arg_41_0 == iter_41_1 then
				var_41_2 = true

				break
			end
		end
	end

	return var_41_2
end

function var_0_0.isMetaShip(arg_42_0)
	return arg_42_0.metaCharacter ~= nil
end

function var_0_0.getMetaCharacter(arg_43_0)
	return arg_43_0.metaCharacter
end

function var_0_0.unlockActivityNpc(arg_44_0, arg_44_1)
	arg_44_0.activityNpc = arg_44_1
end

function var_0_0.isActivityNpc(arg_45_0)
	return arg_45_0.activityNpc > 0
end

function var_0_0.getActiveEquipments(arg_46_0)
	local var_46_0 = Clone(arg_46_0.equipments)

	for iter_46_0 = #var_46_0, 1, -1 do
		local var_46_1 = var_46_0[iter_46_0]

		if var_46_1 then
			for iter_46_1 = 1, iter_46_0 - 1 do
				local var_46_2 = var_46_0[iter_46_1]

				if var_46_2 and var_46_1:getConfig("equip_limit") ~= 0 and var_46_2:getConfig("equip_limit") == var_46_1:getConfig("equip_limit") then
					var_46_0[iter_46_0] = false
				end
			end
		end
	end

	return var_46_0
end

function var_0_0.getAllEquipments(arg_47_0)
	return arg_47_0.equipments
end

function var_0_0.isBluePrintShip(arg_48_0)
	return arg_48_0.bluePrintFlag == 1
end

function var_0_0.getSkinId(arg_49_0)
	return arg_49_0.skinId
end

function var_0_0.updateSkinId(arg_50_0, arg_50_1)
	if not arg_50_1 or arg_50_1 == 0 then
		arg_50_1 = arg_50_0:getConfig("skin_id")
	end

	local var_50_0 = ShipGroup.GetChangeSkinGroupId(arg_50_1)

	if var_50_0 then
		local var_50_1 = ShipGroup.GetStoreChangeSkinId(var_50_0, arg_50_0.id)

		arg_50_0.skinId = var_50_1 and var_50_1 or arg_50_1
	else
		arg_50_0.skinId = arg_50_1
	end
end

function var_0_0.updateName(arg_51_0)
	if arg_51_0.name ~= pg.ship_data_statistics[arg_51_0.configId].name then
		return
	end

	if arg_51_0:isRemoulded() then
		arg_51_0.name = pg.ship_skin_template[arg_51_0:getRemouldSkinId()].name
	else
		arg_51_0.name = pg.ship_data_statistics[arg_51_0.configId].name
	end
end

function var_0_0.isRemoulded(arg_52_0)
	if arg_52_0.remoulded then
		return true
	end

	local var_52_0 = pg.ship_data_trans[arg_52_0.groupId]

	if var_52_0 then
		for iter_52_0, iter_52_1 in ipairs(var_52_0.transform_list) do
			for iter_52_2, iter_52_3 in ipairs(iter_52_1) do
				local var_52_1 = pg.transform_data_template[iter_52_3[2]]

				if var_52_1.skin_id ~= 0 and arg_52_0.transforms[iter_52_3[2]] and arg_52_0.transforms[iter_52_3[2]].level == var_52_1.max_level then
					return true
				end
			end
		end
	end

	return false
end

function var_0_0.getRemouldSkinId(arg_53_0)
	local var_53_0 = ShipGroup.getModSkin(arg_53_0.groupId)

	if var_53_0 then
		return var_53_0.id
	end

	return nil
end

function var_0_0.hasEquipmentSkinInPos(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_0.equipments[arg_54_1]

	return var_54_0 and var_54_0:hasSkin()
end

function var_0_0.getPrefab(arg_55_0)
	local var_55_0 = arg_55_0.skinId

	if arg_55_0:hasEquipmentSkinInPos(var_0_2) then
		local var_55_1 = arg_55_0:getEquip(var_0_2)
		local var_55_2 = var_0_7[var_55_1:getSkinId()].ship_skin_id

		var_55_0 = var_55_2 ~= 0 and var_55_2 or var_55_0
	end

	local var_55_3 = pg.ship_skin_template[var_55_0]

	assert(var_55_3, "ship_skin_template not exist: " .. arg_55_0.configId .. " " .. var_55_0)

	return var_55_3.prefab
end

function var_0_0.getAttachmentPrefab(arg_56_0)
	local var_56_0 = {}

	for iter_56_0, iter_56_1 in ipairs(arg_56_0.equipments) do
		if iter_56_1 and iter_56_1:hasSkinOrbit() then
			local var_56_1 = iter_56_1:getSkinId()
			local var_56_2 = var_0_7[var_56_1]

			var_56_0[var_56_1] = {
				config = var_56_2,
				index = iter_56_0
			}
		end
	end

	return var_56_0
end

function var_0_0.getPainting(arg_57_0)
	local var_57_0 = pg.ship_skin_template[arg_57_0.skinId]

	assert(var_57_0, "ship_skin_template not exist: " .. arg_57_0.configId .. " " .. arg_57_0.skinId)

	return var_57_0.painting
end

function var_0_0.GetSkinConfig(arg_58_0)
	local var_58_0 = pg.ship_skin_template[arg_58_0.skinId]

	assert(var_58_0, "ship_skin_template not exist: " .. arg_58_0.configId .. " " .. arg_58_0.skinId)

	return var_58_0
end

function var_0_0.getRemouldPainting(arg_59_0)
	local var_59_0 = pg.ship_skin_template[arg_59_0:getRemouldSkinId()]

	assert(var_59_0, "ship_skin_template not exist: " .. arg_59_0.configId .. " " .. arg_59_0.skinId)

	return var_59_0.painting
end

function var_0_0.updateStateInfo34(arg_60_0, arg_60_1, arg_60_2)
	arg_60_0.state_info_3 = arg_60_1
	arg_60_0.state_info_4 = arg_60_2
end

function var_0_0.hasStateInfo3Or4(arg_61_0)
	return arg_61_0.state_info_3 ~= 0 or arg_61_0.state_info_4 ~= 0
end

function var_0_0.isTestShip(arg_62_0)
	return arg_62_0.testShip
end

function var_0_0.canUseTestShip(arg_63_0, arg_63_1)
	assert(arg_63_0.testShip, "ship is not TestShip")

	return table.contains(arg_63_0.testShip, arg_63_1)
end

function var_0_0.updateEquip(arg_64_0, arg_64_1, arg_64_2)
	assert(arg_64_2 == nil or arg_64_2.count == 1)

	local var_64_0 = arg_64_0.equipments[arg_64_1]

	arg_64_0.equipments[arg_64_1] = arg_64_2 and Clone(arg_64_2) or false

	local function var_64_1(arg_65_0)
		arg_65_0 = CreateShell(arg_65_0)
		arg_65_0.shipId = arg_64_0.id
		arg_65_0.shipPos = arg_64_1

		return arg_65_0
	end

	if var_64_0 then
		getProxy(EquipmentProxy):OnShipEquipsRemove(var_64_0, arg_64_0.id, arg_64_1)
		var_64_0:setSkinId(0)
		pg.m02:sendNotification(BayProxy.SHIP_EQUIPMENT_REMOVED, var_64_1(var_64_0))
	end

	if arg_64_2 then
		getProxy(EquipmentProxy):OnShipEquipsAdd(arg_64_2, arg_64_0.id, arg_64_1)
		arg_64_0:reletiveEquipSkin(arg_64_1)
		pg.m02:sendNotification(BayProxy.SHIP_EQUIPMENT_ADDED, var_64_1(arg_64_2))
	end
end

function var_0_0.reletiveEquipSkin(arg_66_0, arg_66_1)
	if arg_66_0.equipments[arg_66_1] and arg_66_0.equipmentSkins[arg_66_1] ~= 0 then
		local var_66_0 = pg.equip_skin_template[arg_66_0.equipmentSkins[arg_66_1]].equip_type
		local var_66_1 = arg_66_0.equipments[arg_66_1]:getType()

		if table.contains(var_66_0, var_66_1) then
			arg_66_0.equipments[arg_66_1]:setSkinId(arg_66_0.equipmentSkins[arg_66_1])
		else
			arg_66_0.equipments[arg_66_1]:setSkinId(0)
		end
	elseif arg_66_0.equipments[arg_66_1] then
		arg_66_0.equipments[arg_66_1]:setSkinId(0)
	end
end

function var_0_0.updateEquipmentSkin(arg_67_0, arg_67_1, arg_67_2)
	if not arg_67_1 then
		return
	end

	if arg_67_2 and arg_67_2 > 0 then
		local var_67_0 = arg_67_0:getSkinTypes(arg_67_1)
		local var_67_1 = pg.equip_skin_template[arg_67_2].equip_type
		local var_67_2 = false

		for iter_67_0, iter_67_1 in ipairs(var_67_0) do
			for iter_67_2, iter_67_3 in ipairs(var_67_1) do
				if iter_67_1 == iter_67_3 then
					var_67_2 = true

					break
				end
			end
		end

		if not var_67_2 then
			assert(var_67_2, "部位" .. arg_67_1 .. " 无法穿戴皮肤 " .. arg_67_2)

			return
		end

		local var_67_3 = arg_67_0.equipments[arg_67_1] and arg_67_0.equipments[arg_67_1]:getType() or false

		arg_67_0.equipmentSkins[arg_67_1] = arg_67_2

		if var_67_3 and table.contains(var_67_1, var_67_3) then
			arg_67_0.equipments[arg_67_1]:setSkinId(arg_67_0.equipmentSkins[arg_67_1])
		elseif var_67_3 and not table.contains(var_67_1, var_67_3) then
			arg_67_0.equipments[arg_67_1]:setSkinId(0)
		end
	else
		arg_67_0.equipmentSkins[arg_67_1] = 0

		if arg_67_0.equipments[arg_67_1] then
			arg_67_0.equipments[arg_67_1]:setSkinId(0)
		end
	end
end

function var_0_0.getEquip(arg_68_0, arg_68_1)
	return Clone(arg_68_0.equipments[arg_68_1])
end

function var_0_0.getEquipSkins(arg_69_0)
	return Clone(arg_69_0.equipmentSkins)
end

function var_0_0.getEquipSkin(arg_70_0, arg_70_1)
	return arg_70_0.equipmentSkins[arg_70_1]
end

function var_0_0.getCanEquipSkin(arg_71_0, arg_71_1)
	local var_71_0 = arg_71_0:getSkinTypes(arg_71_1)

	if var_71_0 and #var_71_0 then
		for iter_71_0, iter_71_1 in ipairs(var_71_0) do
			if pg.equip_data_by_type[iter_71_1].equip_skin == 1 then
				return true
			end
		end
	end

	return false
end

function var_0_0.checkCanEquipSkin(arg_72_0, arg_72_1, arg_72_2)
	if not arg_72_1 or not arg_72_2 then
		return
	end

	local var_72_0 = arg_72_0:getSkinTypes(arg_72_1)
	local var_72_1 = pg.equip_skin_template[arg_72_2].equip_type

	for iter_72_0, iter_72_1 in ipairs(var_72_0) do
		if table.contains(var_72_1, iter_72_1) then
			return true
		end
	end

	return false
end

function var_0_0.getSkinTypes(arg_73_0, arg_73_1)
	return pg.ship_data_template[arg_73_0.configId]["equip_" .. arg_73_1] or {}
end

function var_0_0.updateState(arg_74_0, arg_74_1)
	arg_74_0.state = arg_74_1
end

function var_0_0.addSkillExp(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0 = arg_75_0.skills[arg_75_1] or {
		exp = 0,
		level = 1,
		id = arg_75_1
	}
	local var_75_1 = var_75_0.level and var_75_0.level or 1
	local var_75_2 = pg.skill_need_exp.all[#pg.skill_need_exp.all]

	if var_75_1 == var_75_2 then
		return
	end

	local var_75_3 = var_75_0.exp and arg_75_2 + var_75_0.exp or 0 + arg_75_2

	while var_75_3 >= pg.skill_need_exp[var_75_1].exp do
		var_75_3 = var_75_3 - pg.skill_need_exp[var_75_1].exp
		var_75_1 = var_75_1 + 1

		if var_75_1 == var_75_2 then
			var_75_3 = 0

			break
		end
	end

	arg_75_0:updateSkill({
		id = var_75_0.id,
		level = var_75_1,
		exp = var_75_3
	})
end

function var_0_0.upSkillLevelForMeta(arg_76_0, arg_76_1)
	local var_76_0 = arg_76_0.skills[arg_76_1] or {
		exp = 0,
		level = 0,
		id = arg_76_1
	}
	local var_76_1 = arg_76_0:isSkillLevelMax(arg_76_1)
	local var_76_2 = var_76_0.level

	if not var_76_1 then
		var_76_2 = var_76_2 + 1
	end

	arg_76_0:updateSkill({
		exp = 0,
		id = var_76_0.id,
		level = var_76_2
	})
end

function var_0_0.getMetaSkillLevelBySkillID(arg_77_0, arg_77_1)
	return (arg_77_0.skills[arg_77_1] or {
		exp = 0,
		level = 0,
		id = arg_77_1
	}).level
end

function var_0_0.isSkillLevelMax(arg_78_0, arg_78_1)
	local var_78_0 = arg_78_0.skills[arg_78_1] or {
		exp = 0,
		level = 1,
		id = arg_78_1
	}

	return (var_78_0.level and var_78_0.level or 1) >= pg.skill_data_template[arg_78_1].max_level
end

function var_0_0.isAllMetaSkillLevelMax(arg_79_0)
	local var_79_0 = true
	local var_79_1 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(arg_79_0.configId)

	for iter_79_0, iter_79_1 in ipairs(var_79_1) do
		if not arg_79_0:isSkillLevelMax(iter_79_1) then
			var_79_0 = false

			break
		end
	end

	return var_79_0
end

function var_0_0.isAllMetaSkillLock(arg_80_0)
	local var_80_0 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(arg_80_0.configId)
	local var_80_1 = true

	for iter_80_0, iter_80_1 in ipairs(var_80_0) do
		if arg_80_0:getMetaSkillLevelBySkillID(iter_80_1) > 0 then
			var_80_1 = false

			break
		end
	end

	return var_80_1
end

function var_0_0.bindConfigTable(arg_81_0)
	return pg.ship_data_statistics
end

function var_0_0.isAvaiable(arg_82_0)
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

function var_0_0.intimacyAdditions(arg_83_0, arg_83_1)
	local var_83_0 = pg.intimacy_template[arg_83_0:getIntimacyLevel()].attr_bonus * 0.0001

	for iter_83_0, iter_83_1 in pairs(arg_83_1) do
		if iter_83_0 == AttributeType.Durability or iter_83_0 == AttributeType.Cannon or iter_83_0 == AttributeType.Torpedo or iter_83_0 == AttributeType.AntiAircraft or iter_83_0 == AttributeType.AntiSub or iter_83_0 == AttributeType.Air or iter_83_0 == AttributeType.Reload or iter_83_0 == AttributeType.Hit or iter_83_0 == AttributeType.Dodge then
			arg_83_1[iter_83_0] = arg_83_1[iter_83_0] * (var_83_0 + 1)
		end
	end
end

function var_0_0.getShipProperties(arg_84_0)
	local var_84_0 = arg_84_0:getBaseProperties()

	if arg_84_0:isBluePrintShip() then
		local var_84_1 = arg_84_0:getBluePrint()

		assert(var_84_1, "blueprint can not be nil" .. arg_84_0.configId)

		local var_84_2 = var_84_1:getTotalAdditions()

		for iter_84_0, iter_84_1 in pairs(var_84_2) do
			var_84_0[iter_84_0] = var_84_0[iter_84_0] + calcFloor(iter_84_1)
		end

		arg_84_0:intimacyAdditions(var_84_0)
	elseif arg_84_0:isMetaShip() then
		assert(arg_84_0.metaCharacter)

		for iter_84_2, iter_84_3 in pairs(var_84_0) do
			var_84_0[iter_84_2] = var_84_0[iter_84_2] + arg_84_0.metaCharacter:getAttrAddition(iter_84_2)
		end

		arg_84_0:intimacyAdditions(var_84_0)
	else
		local var_84_3 = pg.ship_data_template[arg_84_0.configId].strengthen_id
		local var_84_4 = var_0_5[var_84_3]

		for iter_84_4, iter_84_5 in pairs(arg_84_0.strengthList) do
			local var_84_5 = ShipModAttr.ATTR_TO_INDEX[iter_84_4]
			local var_84_6 = math.min(iter_84_5, var_84_4.durability[var_84_5] * var_84_4.level_exp[var_84_5])
			local var_84_7 = math.max(arg_84_0:getModExpRatio(iter_84_4), 1)

			var_84_0[iter_84_4] = var_84_0[iter_84_4] + calcFloor(var_84_6 / var_84_7)
		end

		arg_84_0:intimacyAdditions(var_84_0)

		for iter_84_6, iter_84_7 in pairs(arg_84_0.transforms) do
			local var_84_8 = pg.transform_data_template[iter_84_7.id].effect

			for iter_84_8 = 1, iter_84_7.level do
				local var_84_9 = var_84_8[iter_84_8] or {}

				for iter_84_9, iter_84_10 in pairs(var_84_0) do
					if var_84_9[iter_84_9] then
						var_84_0[iter_84_9] = var_84_0[iter_84_9] + var_84_9[iter_84_9]
					end
				end
			end
		end
	end

	return var_84_0
end

function var_0_0.getTechNationAddition(arg_85_0, arg_85_1)
	local var_85_0 = getProxy(TechnologyNationProxy)
	local var_85_1 = arg_85_0:getConfig("type")

	if var_85_1 == ShipType.DaoQuV or var_85_1 == ShipType.DaoQuM then
		var_85_1 = ShipType.QuZhu
	end

	return var_85_0:getShipAddition(var_85_1, arg_85_1)
end

function var_0_0.getTechNationMaxAddition(arg_86_0, arg_86_1)
	local var_86_0 = getProxy(TechnologyNationProxy)
	local var_86_1 = arg_86_0:getConfig("type")

	return var_86_0:getShipMaxAddition(var_86_1, arg_86_1)
end

function var_0_0.getEquipProficiencyByPos(arg_87_0, arg_87_1)
	return arg_87_0:getEquipProficiencyList()[arg_87_1]
end

function var_0_0.getEquipProficiencyList(arg_88_0)
	local var_88_0 = arg_88_0:getConfigTable()
	local var_88_1 = Clone(var_88_0.equipment_proficiency)

	if arg_88_0:isBluePrintShip() then
		local var_88_2 = arg_88_0:getBluePrint()

		assert(var_88_2, "blueprint can not be nil >>>" .. arg_88_0.groupId)

		var_88_1 = var_88_2:getEquipProficiencyList(arg_88_0)
	else
		for iter_88_0, iter_88_1 in ipairs(var_88_1) do
			local var_88_3 = 0

			for iter_88_2, iter_88_3 in pairs(arg_88_0.transforms) do
				local var_88_4 = pg.transform_data_template[iter_88_3.id].effect

				for iter_88_4 = 1, iter_88_3.level do
					local var_88_5 = var_88_4[iter_88_4] or {}

					if var_88_5["equipment_proficiency_" .. iter_88_0] then
						var_88_3 = var_88_3 + var_88_5["equipment_proficiency_" .. iter_88_0]
					end
				end
			end

			var_88_1[iter_88_0] = iter_88_1 + var_88_3
		end
	end

	return var_88_1
end

function var_0_0.getBaseProperties(arg_89_0)
	local var_89_0 = arg_89_0:getConfigTable()

	assert(var_89_0, "配置表没有这艘船" .. arg_89_0.configId)

	local var_89_1 = {}
	local var_89_2 = {}

	for iter_89_0, iter_89_1 in ipairs(var_0_0.PROPERTIES) do
		var_89_1[iter_89_1] = arg_89_0:getGrowthForAttr(iter_89_1)
		var_89_2[iter_89_1] = var_89_1[iter_89_1]
	end

	for iter_89_2, iter_89_3 in ipairs(arg_89_0:getConfig("lock")) do
		var_89_2[iter_89_3] = var_89_1[iter_89_3]
	end

	for iter_89_4, iter_89_5 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_89_2[iter_89_5] = var_89_0[iter_89_5]
	end

	for iter_89_6, iter_89_7 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_89_2[iter_89_7] = 0
	end

	return var_89_2
end

function var_0_0.getGrowthForAttr(arg_90_0, arg_90_1)
	local var_90_0 = arg_90_0:getConfigTable()
	local var_90_1 = table.indexof(var_0_0.PROPERTIES, arg_90_1)
	local var_90_2 = pg.gameset.extra_attr_level_limit.key_value
	local var_90_3 = var_90_0.attrs[var_90_1] + (arg_90_0.level - 1) * var_90_0.attrs_growth[var_90_1] / 1000

	if var_90_2 < arg_90_0.level then
		var_90_3 = var_90_3 + (arg_90_0.level - var_90_2) * var_90_0.attrs_growth_extra[var_90_1] / 1000
	end

	return var_90_3
end

function var_0_0.isMaxStar(arg_91_0)
	return arg_91_0:getStar() >= arg_91_0:getMaxStar()
end

function var_0_0.IsMaxStarByTmpID(arg_92_0)
	local var_92_0 = pg.ship_data_template[arg_92_0]

	return var_92_0.star >= var_92_0.star_max
end

function var_0_0.IsSpweaponUnlock(arg_93_0)
	if not arg_93_0:CanAccumulateExp() then
		return false, "spweapon_tip_locked"
	else
		return true
	end
end

function var_0_0.getModProperties(arg_94_0, arg_94_1)
	return arg_94_0.strengthList[arg_94_1] or 0
end

function var_0_0.addModAttrExp(arg_95_0, arg_95_1, arg_95_2)
	local var_95_0 = arg_95_0:getModAttrTopLimit(arg_95_1)

	if var_95_0 == 0 then
		return
	end

	local var_95_1 = arg_95_0:getModExpRatio(arg_95_1)
	local var_95_2 = arg_95_0:getModProperties(arg_95_1)

	if var_95_2 + arg_95_2 > var_95_0 * var_95_1 then
		arg_95_0.strengthList[arg_95_1] = var_95_0 * var_95_1
	else
		arg_95_0.strengthList[arg_95_1] = var_95_2 + arg_95_2
	end
end

function var_0_0.getNeedModExp(arg_96_0)
	local var_96_0 = {}

	for iter_96_0, iter_96_1 in pairs(ShipModAttr.ID_TO_ATTR) do
		local var_96_1 = arg_96_0:getModAttrTopLimit(iter_96_1)

		if var_96_1 == 0 then
			var_96_0[iter_96_1] = 0
		else
			var_96_0[iter_96_1] = var_96_1 * arg_96_0:getModExpRatio(iter_96_1) - arg_96_0:getModProperties(iter_96_1)
		end
	end

	return var_96_0
end

function var_0_0.attrVertify(arg_97_0)
	if not BayProxy.checkShiplevelVertify(arg_97_0) then
		return false
	end

	for iter_97_0, iter_97_1 in ipairs(arg_97_0.equipments) do
		if iter_97_1 and not iter_97_1:vertify() then
			return false
		end
	end

	return true
end

function var_0_0.getEquipmentProperties(arg_98_0)
	local var_98_0 = {}
	local var_98_1 = {}

	for iter_98_0, iter_98_1 in ipairs(var_0_0.PROPERTIES) do
		var_98_0[iter_98_1] = 0
	end

	for iter_98_2, iter_98_3 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_98_0[iter_98_3] = 0
	end

	for iter_98_4, iter_98_5 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_98_0[iter_98_5] = 0
	end

	for iter_98_6, iter_98_7 in ipairs(var_0_0.PROPERTIES_ENHANCEMENT) do
		var_98_1[iter_98_7] = 0
	end

	var_98_0[AttributeType.AirDominate] = 0
	var_98_0[AttributeType.AntiSiren] = 0

	local var_98_2 = arg_98_0:getActiveEquipments()

	for iter_98_8, iter_98_9 in ipairs(var_98_2) do
		if iter_98_9 then
			local var_98_3 = iter_98_9:GetAttributes()

			for iter_98_10, iter_98_11 in ipairs(var_98_3) do
				if iter_98_11 and var_98_0[iter_98_11.type] then
					var_98_0[iter_98_11.type] = var_98_0[iter_98_11.type] + iter_98_11.value
				end
			end

			local var_98_4 = iter_98_9:GetPropertyRate()

			for iter_98_12, iter_98_13 in pairs(var_98_4) do
				var_98_1[iter_98_12] = math.max(var_98_1[iter_98_12], iter_98_13)
			end

			local var_98_5 = iter_98_9:GetSonarProperty()

			if var_98_5 then
				for iter_98_14, iter_98_15 in pairs(var_98_5) do
					var_98_0[iter_98_14] = var_98_0[iter_98_14] + iter_98_15
				end
			end

			local var_98_6 = iter_98_9:GetAntiSirenPower()

			if var_98_6 then
				var_98_0[AttributeType.AntiSiren] = var_98_0[AttributeType.AntiSiren] + var_98_6 / 10000
			end
		end
	end

	;(function()
		local var_99_0 = arg_98_0:GetSpWeapon()

		if not var_99_0 then
			return
		end

		local var_99_1 = var_99_0:GetPropertiesInfo().attrs

		for iter_99_0, iter_99_1 in ipairs(var_99_1) do
			if iter_99_1 and var_98_0[iter_99_1.type] then
				var_98_0[iter_99_1.type] = var_98_0[iter_99_1.type] + iter_99_1.value
			end
		end
	end)()

	for iter_98_16, iter_98_17 in pairs(var_98_1) do
		var_98_1[iter_98_16] = iter_98_17 + 1
	end

	return var_98_0, var_98_1
end

function var_0_0.getSkillEffects(arg_100_0)
	local var_100_0 = arg_100_0:getShipSkillEffects()

	_.each(arg_100_0:getEquipmentSkillEffects(), function(arg_101_0)
		table.insert(var_100_0, arg_101_0)
	end)

	return var_100_0
end

function var_0_0.getShipSkillEffects(arg_102_0)
	local var_102_0 = {}
	local var_102_1 = arg_102_0:getSkillList()

	for iter_102_0, iter_102_1 in ipairs(var_102_1) do
		local var_102_2 = arg_102_0:RemapSkillId(iter_102_1)
		local var_102_3 = pg.buffCfg["buff_" .. var_102_2]

		arg_102_0:FilterActiveSkill(var_102_0, var_102_3, arg_102_0.skills[iter_102_1])
	end

	return var_102_0
end

function var_0_0.getEquipmentSkillEffects(arg_103_0)
	local var_103_0 = {}
	local var_103_1 = arg_103_0:getActiveEquipments()

	for iter_103_0, iter_103_1 in ipairs(var_103_1) do
		local var_103_2
		local var_103_3 = iter_103_1 and iter_103_1:getConfig("skill_id")[1]

		if var_103_3 then
			var_103_2 = pg.buffCfg["buff_" .. var_103_3]
		end

		arg_103_0:FilterActiveSkill(var_103_0, var_103_2)
	end

	;(function()
		local var_104_0 = arg_103_0:GetSpWeapon()
		local var_104_1 = var_104_0 and var_104_0:GetEffect() or 0
		local var_104_2

		if var_104_1 > 0 then
			var_104_2 = pg.buffCfg["buff_" .. var_104_1]
		end

		arg_103_0:FilterActiveSkill(var_103_0, var_104_2)
	end)()

	return var_103_0
end

function var_0_0.FilterActiveSkill(arg_105_0, arg_105_1, arg_105_2, arg_105_3)
	if not arg_105_2 or not arg_105_2.const_effect_list then
		return
	end

	for iter_105_0 = 1, #arg_105_2.const_effect_list do
		local var_105_0 = arg_105_2.const_effect_list[iter_105_0]
		local var_105_1 = var_105_0.trigger
		local var_105_2 = var_105_0.arg_list
		local var_105_3 = 1

		if arg_105_3 then
			var_105_3 = arg_105_3.level

			local var_105_4 = arg_105_2[var_105_3].const_effect_list

			if var_105_4 and var_105_4[iter_105_0] then
				var_105_1 = var_105_4[iter_105_0].trigger or var_105_1
				var_105_2 = var_105_4[iter_105_0].arg_list or var_105_2
			end
		end

		local var_105_5 = true

		for iter_105_1, iter_105_2 in pairs(var_105_1) do
			if arg_105_0.triggers[iter_105_1] ~= iter_105_2 then
				var_105_5 = false

				break
			end
		end

		if var_105_5 then
			table.insert(arg_105_1, {
				type = var_105_0.type,
				arg_list = var_105_2,
				level = var_105_3
			})
		end
	end
end

function var_0_0.getEquipmentGearScore(arg_106_0)
	local var_106_0 = 0
	local var_106_1 = arg_106_0:getActiveEquipments()

	for iter_106_0, iter_106_1 in ipairs(var_106_1) do
		if iter_106_1 then
			var_106_0 = var_106_0 + iter_106_1:GetGearScore()
		end
	end

	return var_106_0
end

function var_0_0.getProperties(arg_107_0, arg_107_1, arg_107_2, arg_107_3, arg_107_4)
	local var_107_0 = arg_107_1 or {}
	local var_107_1 = arg_107_0:getConfig("nationality")
	local var_107_2 = arg_107_0:getConfig("type")
	local var_107_3 = arg_107_0:getShipProperties()
	local var_107_4, var_107_5 = arg_107_0:getEquipmentProperties()
	local var_107_6
	local var_107_7
	local var_107_8

	if arg_107_3 and arg_107_0:getFlag("inWorld") then
		local var_107_9 = WorldConst.FetchWorldShip(arg_107_0.id)

		var_107_6, var_107_7 = var_107_9:GetShipBuffProperties()
		var_107_8 = var_107_9:GetShipPowerBuffProperties()
	end

	for iter_107_0, iter_107_1 in ipairs(var_0_0.PROPERTIES) do
		local var_107_10 = 0
		local var_107_11 = 0

		for iter_107_2, iter_107_3 in pairs(var_107_0) do
			var_107_10 = var_107_10 + iter_107_3:getAttrRatioAddition(iter_107_1, var_107_1, var_107_2) / 100
			var_107_11 = var_107_11 + iter_107_3:getAttrValueAddition(iter_107_1, var_107_1, var_107_2)
		end

		local var_107_12 = var_107_10 + (var_107_5[iter_107_1] or 1)
		local var_107_13 = var_107_7 and var_107_7[iter_107_1] or 1
		local var_107_14 = var_107_6 and var_107_6[iter_107_1] or 0

		if iter_107_1 == AttributeType.Speed then
			var_107_3[iter_107_1] = var_107_3[iter_107_1] * var_107_12 * var_107_13 + var_107_11 + var_107_4[iter_107_1] + var_107_14
		else
			var_107_3[iter_107_1] = calcFloor(calcFloor(var_107_3[iter_107_1]) * var_107_12 * var_107_13) + var_107_11 + var_107_4[iter_107_1] + var_107_14
		end
	end

	if not arg_107_2 and arg_107_0:isMaxStar() then
		for iter_107_4, iter_107_5 in pairs(var_107_3) do
			local var_107_15 = arg_107_4 and arg_107_0:getTechNationMaxAddition(iter_107_4) or arg_107_0:getTechNationAddition(iter_107_4)

			var_107_3[iter_107_4] = var_107_3[iter_107_4] + var_107_15
		end
	end

	for iter_107_6, iter_107_7 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_107_3[iter_107_7] = var_107_3[iter_107_7] + var_107_4[iter_107_7]
	end

	for iter_107_8, iter_107_9 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_107_3[iter_107_9] = var_107_3[iter_107_9] + var_107_4[iter_107_9]
	end

	if arg_107_3 then
		var_107_3[AttributeType.AntiSiren] = (var_107_3[AttributeType.AntiSiren] or 0) + var_107_4[AttributeType.AntiSiren]
	end

	if var_107_8 then
		for iter_107_10, iter_107_11 in pairs(var_107_8) do
			if var_107_3[iter_107_10] then
				if iter_107_10 == AttributeType.Speed then
					var_107_3[iter_107_10] = var_107_3[iter_107_10] * iter_107_11
				else
					var_107_3[iter_107_10] = math.floor(var_107_3[iter_107_10] * iter_107_11)
				end
			end
		end
	end

	return var_107_3
end

function var_0_0.getTransGearScore(arg_108_0)
	local var_108_0 = 0
	local var_108_1 = pg.transform_data_template

	for iter_108_0, iter_108_1 in pairs(arg_108_0.transforms) do
		for iter_108_2 = 1, iter_108_1.level do
			var_108_0 = var_108_0 + (var_108_1[iter_108_1.id].gear_score[iter_108_2] or 0)
		end
	end

	return var_108_0
end

function var_0_0.getShipCombatPower(arg_109_0, arg_109_1)
	local var_109_0 = arg_109_0:getProperties(arg_109_1, nil, nil, true)
	local var_109_1 = var_109_0[AttributeType.Durability] / 5 + var_109_0[AttributeType.Cannon] + var_109_0[AttributeType.Torpedo] + var_109_0[AttributeType.AntiAircraft] + var_109_0[AttributeType.Air] + var_109_0[AttributeType.AntiSub] + var_109_0[AttributeType.Reload] + var_109_0[AttributeType.Hit] * 2 + var_109_0[AttributeType.Dodge] * 2 + var_109_0[AttributeType.Speed] + arg_109_0:getEquipmentGearScore() + arg_109_0:getTransGearScore()

	return math.floor(var_109_1)
end

function var_0_0.cosumeEnergy(arg_110_0, arg_110_1)
	arg_110_0:setEnergy(math.max(arg_110_0:getEnergy() - arg_110_1, 0))
end

function var_0_0.addEnergy(arg_111_0, arg_111_1)
	arg_111_0:setEnergy(arg_111_0:getEnergy() + arg_111_1)
end

function var_0_0.setEnergy(arg_112_0, arg_112_1)
	arg_112_0.energy = arg_112_1
end

function var_0_0.setLikability(arg_113_0, arg_113_1)
	assert(arg_113_1 >= 0 and arg_113_1 <= arg_113_0.maxIntimacy, "intimacy value invaild" .. arg_113_1)
	arg_113_0:setIntimacy(arg_113_1)
end

function var_0_0.addLikability(arg_114_0, arg_114_1)
	local var_114_0 = Mathf.Clamp(arg_114_0:getIntimacy() + arg_114_1, 0, arg_114_0.maxIntimacy)

	arg_114_0:setIntimacy(var_114_0)
end

function var_0_0.setIntimacy(arg_115_0, arg_115_1)
	if arg_115_1 > 10000 and not arg_115_0.propose then
		arg_115_1 = 10000
	end

	arg_115_0.intimacy = arg_115_1

	if not arg_115_0:isActivityNpc() then
		getProxy(CollectionProxy).shipGroups[arg_115_0.groupId]:updateMaxIntimacy(arg_115_0:getIntimacy())
	end
end

function var_0_0.getLevelExpConfig(arg_116_0, arg_116_1)
	if arg_116_0:getConfig("rarity") == ShipRarity.SSR then
		local var_116_0 = Clone(getConfigFromLevel1(var_0_6, arg_116_1 or arg_116_0.level))

		var_116_0.exp = var_116_0.exp_ur
		var_116_0.exp_start = var_116_0.exp_ur_start
		var_116_0.exp_interval = var_116_0.exp_ur_interval
		var_116_0.exp_end = var_116_0.exp_ur_end

		return var_116_0
	else
		return getConfigFromLevel1(var_0_6, arg_116_1 or arg_116_0.level)
	end
end

function var_0_0.getExp(arg_117_0)
	local var_117_0 = arg_117_0:getMaxLevel()

	if arg_117_0.level == var_117_0 and LOCK_FULL_EXP then
		return 0
	end

	return arg_117_0.exp
end

function var_0_0.getProficiency(arg_118_0)
	return arg_118_0.proficiency
end

function var_0_0.addExp(arg_119_0, arg_119_1, arg_119_2)
	local var_119_0 = arg_119_0:getMaxLevel()

	if arg_119_0.level == var_119_0 then
		if arg_119_0.exp >= pg.gameset.exp_overflow_max.key_value then
			return
		end

		if LOCK_FULL_EXP or not arg_119_2 or not arg_119_0:CanAccumulateExp() then
			arg_119_1 = 0
		end
	end

	arg_119_0.exp = arg_119_0.exp + arg_119_1

	local var_119_1 = false

	while arg_119_0:canLevelUp() do
		arg_119_0.exp = arg_119_0.exp - arg_119_0:getLevelExpConfig().exp_interval
		arg_119_0.level = math.min(arg_119_0.level + 1, var_119_0)
		var_119_1 = true
	end

	if arg_119_0.level == var_119_0 then
		if arg_119_2 and arg_119_0:CanAccumulateExp() then
			arg_119_0.exp = math.min(arg_119_0.exp, pg.gameset.exp_overflow_max.key_value)
		elseif var_119_1 then
			arg_119_0.exp = 0
		end
	end
end

function var_0_0.getMaxLevel(arg_120_0)
	return arg_120_0.maxLevel
end

function var_0_0.canLevelUp(arg_121_0)
	local var_121_0 = arg_121_0:getLevelExpConfig(arg_121_0.level + 1)
	local var_121_1 = arg_121_0:getMaxLevel() <= arg_121_0.level

	return var_121_0 and arg_121_0:getLevelExpConfig().exp_interval <= arg_121_0.exp and not var_121_1
end

function var_0_0.getConfigMaxLevel(arg_122_0)
	return var_0_6.all[#var_0_6.all]
end

function var_0_0.isConfigMaxLevel(arg_123_0)
	return arg_123_0.level == arg_123_0:getConfigMaxLevel()
end

function var_0_0.updateMaxLevel(arg_124_0, arg_124_1)
	local var_124_0 = arg_124_0:getConfigMaxLevel()

	arg_124_0.maxLevel = math.max(math.min(var_124_0, arg_124_1), arg_124_0.maxLevel)
end

function var_0_0.getNextMaxLevel(arg_125_0)
	local var_125_0 = arg_125_0:getConfigMaxLevel()

	for iter_125_0 = arg_125_0:getMaxLevel() + 1, var_125_0 do
		if var_0_6[iter_125_0].level_limit == 1 then
			return iter_125_0
		end
	end
end

function var_0_0.canUpgrade(arg_126_0)
	if arg_126_0:isBluePrintShip() then
		return false
	end

	if arg_126_0:isMetaShip() then
		local var_126_0 = arg_126_0:getMetaCharacter()

		if not var_126_0 then
			return false
		end

		local var_126_1 = var_126_0:getBreakOutInfo()

		if not var_126_1:hasNextInfo() then
			return false
		end

		local var_126_2, var_126_3 = var_126_1:getLimited()

		if var_126_2 > arg_126_0.level then
			return false
		end

		return true
	else
		local var_126_4 = var_0_8[arg_126_0.configId]

		assert(var_126_4, "不存在配置" .. arg_126_0.configId)

		return not arg_126_0:isMaxStar() and arg_126_0.level >= var_126_4.level
	end
end

function var_0_0.isReachNextMaxLevel(arg_127_0)
	return arg_127_0.level == arg_127_0:getMaxLevel() and arg_127_0:CanAccumulateExp() and arg_127_0:getNextMaxLevel() ~= nil
end

function var_0_0.isAwakening(arg_128_0)
	return arg_128_0:isReachNextMaxLevel() and arg_128_0.level < var_0_4
end

function var_0_0.isAwakening2(arg_129_0)
	return arg_129_0:isReachNextMaxLevel() and arg_129_0.level >= var_0_4
end

function var_0_0.notMaxLevelForFilter(arg_130_0)
	return arg_130_0.level ~= arg_130_0:getMaxLevel()
end

function var_0_0.getNextMaxLevelConsume(arg_131_0)
	local var_131_0 = arg_131_0:getMaxLevel()
	local var_131_1 = var_0_6[var_131_0]["need_item_rarity" .. arg_131_0:getConfig("rarity")]

	assert(var_131_1, "items  can not be nil")

	return _.map(var_131_1, function(arg_132_0)
		return {
			type = arg_132_0[1],
			id = arg_132_0[2],
			count = arg_132_0[3]
		}
	end)
end

function var_0_0.canUpgradeMaxLevel(arg_133_0)
	if not arg_133_0:isReachNextMaxLevel() then
		return false, i18n("upgrade_to_next_maxlevel_failed")
	else
		local var_133_0 = getProxy(PlayerProxy):getData()
		local var_133_1 = getProxy(BagProxy)
		local var_133_2 = arg_133_0:getNextMaxLevelConsume()

		for iter_133_0, iter_133_1 in pairs(var_133_2) do
			if iter_133_1.type == DROP_TYPE_RESOURCE then
				if var_133_0:getResById(iter_133_1.id) < iter_133_1.count then
					return false, i18n("common_no_resource")
				end
			elseif iter_133_1.type == DROP_TYPE_ITEM and var_133_1:getItemCountById(iter_133_1.id) < iter_133_1.count then
				return false, i18n("common_no_item_1")
			end
		end
	end

	return true
end

function var_0_0.CanAccumulateExp(arg_134_0)
	return pg.ship_data_template[arg_134_0.configId].can_get_proficency == 1
end

function var_0_0.getTotalExp(arg_135_0)
	return arg_135_0:getLevelExpConfig().exp_start + arg_135_0.exp
end

function var_0_0.getStartBattleExpend(arg_136_0)
	if table.contains(TeamType.SubShipType, arg_136_0:getShipType()) then
		return 0
	else
		return pg.ship_data_template[arg_136_0.configId].oil_at_start
	end
end

function var_0_0.getEndBattleExpend(arg_137_0)
	local var_137_0 = pg.ship_data_template[arg_137_0.configId]
	local var_137_1 = arg_137_0:getLevelExpConfig()

	return (math.floor(var_137_0.oil_at_end * var_137_1.fight_oil_ratio / 10000))
end

function var_0_0.getBattleTotalExpend(arg_138_0)
	return arg_138_0:getStartBattleExpend() + arg_138_0:getEndBattleExpend()
end

function var_0_0.getShipAmmo(arg_139_0)
	local var_139_0 = arg_139_0:getConfig(AttributeType.Ammo)

	for iter_139_0, iter_139_1 in pairs(arg_139_0:getAllSkills()) do
		local var_139_1 = tonumber(iter_139_0 .. string.format("%.2d", iter_139_1.level))
		local var_139_2 = pg.skill_benefit_template[var_139_1]

		if var_139_2 and arg_139_0:IsBenefitSkillActive(var_139_2) and (var_139_2.type == var_0_0.BENEFIT_EQUIP or var_139_2.type == var_0_0.BENEFIT_SKILL) then
			var_139_0 = var_139_0 + defaultValue(var_139_2.effect[1], 0)
		end
	end

	local var_139_3 = arg_139_0:getActiveEquipments()

	for iter_139_2, iter_139_3 in ipairs(var_139_3) do
		local var_139_4 = iter_139_3 and iter_139_3:getConfig("equip_parameters").ammo

		if var_139_4 then
			var_139_0 = var_139_0 + var_139_4
		end
	end

	return var_139_0
end

function var_0_0.getHuntingLv(arg_140_0)
	local var_140_0 = arg_140_0:getConfig("huntingrange_level")

	for iter_140_0, iter_140_1 in pairs(arg_140_0:getAllSkills()) do
		local var_140_1 = tonumber(iter_140_0 .. string.format("%.2d", iter_140_1.level))
		local var_140_2 = pg.skill_benefit_template[var_140_1]

		if var_140_2 and arg_140_0:IsBenefitSkillActive(var_140_2) and (var_140_2.type == var_0_0.BENEFIT_EQUIP or var_140_2.type == var_0_0.BENEFIT_SKILL) then
			var_140_0 = var_140_0 + defaultValue(var_140_2.effect[2], 0)
		end
	end

	local var_140_3 = arg_140_0:getActiveEquipments()

	for iter_140_2, iter_140_3 in ipairs(var_140_3) do
		local var_140_4 = iter_140_3 and iter_140_3:getConfig("equip_parameters").hunting_lv

		if var_140_4 then
			var_140_0 = var_140_0 + var_140_4
		end
	end

	return (math.min(var_140_0, arg_140_0:getMaxHuntingLv()))
end

function var_0_0.getMapAuras(arg_141_0)
	local var_141_0 = {}

	for iter_141_0, iter_141_1 in pairs(arg_141_0:getAllSkills()) do
		local var_141_1 = tonumber(iter_141_0 .. string.format("%.2d", iter_141_1.level))
		local var_141_2 = pg.skill_benefit_template[var_141_1]

		if var_141_2 and arg_141_0:IsBenefitSkillActive(var_141_2) and var_141_2.type == var_0_0.BENEFIT_MAP_AURA then
			local var_141_3 = {
				id = var_141_2.effect[1],
				level = iter_141_1.level
			}

			table.insert(var_141_0, var_141_3)
		end
	end

	return var_141_0
end

function var_0_0.getMapAids(arg_142_0)
	local var_142_0 = {}

	for iter_142_0, iter_142_1 in pairs(arg_142_0:getAllSkills()) do
		local var_142_1 = tonumber(iter_142_0 .. string.format("%.2d", iter_142_1.level))
		local var_142_2 = pg.skill_benefit_template[var_142_1]

		if var_142_2 and arg_142_0:IsBenefitSkillActive(var_142_2) and var_142_2.type == var_0_0.BENEFIT_AID then
			local var_142_3 = {
				id = var_142_2.effect[1],
				level = iter_142_1.level
			}

			table.insert(var_142_0, var_142_3)
		end
	end

	return var_142_0
end

var_0_0.BENEFIT_SKILL = 2
var_0_0.BENEFIT_EQUIP = 3
var_0_0.BENEFIT_MAP_AURA = 4
var_0_0.BENEFIT_AID = 5

function var_0_0.IsBenefitSkillActive(arg_143_0, arg_143_1)
	local var_143_0 = false

	if arg_143_1.type == var_0_0.BENEFIT_SKILL then
		if not arg_143_1.limit[1] or arg_143_1.limit[1] == arg_143_0.triggers.TeamNumbers then
			var_143_0 = true
		end
	elseif arg_143_1.type == var_0_0.BENEFIT_EQUIP then
		local var_143_1 = arg_143_1.limit
		local var_143_2 = arg_143_0:getAllEquipments()

		for iter_143_0, iter_143_1 in ipairs(var_143_2) do
			if iter_143_1 and table.contains(var_143_1, iter_143_1:getConfig("id")) then
				var_143_0 = true

				break
			end
		end
	elseif arg_143_1.type == var_0_0.BENEFIT_MAP_AURA then
		if arg_143_0.hpRant and arg_143_0.hpRant > 0 then
			return true
		end
	elseif arg_143_1.type == var_0_0.BENEFIT_AID and arg_143_0.hpRant and arg_143_0.hpRant > 0 then
		return true
	end

	return var_143_0
end

function var_0_0.getMaxHuntingLv(arg_144_0)
	return #arg_144_0:getConfig("hunting_range")
end

function var_0_0.getHuntingRange(arg_145_0, arg_145_1)
	local var_145_0 = arg_145_0:getConfig("hunting_range")
	local var_145_1 = Clone(var_145_0[1])
	local var_145_2 = arg_145_1 or arg_145_0:getHuntingLv()
	local var_145_3 = math.min(var_145_2, arg_145_0:getMaxHuntingLv())

	for iter_145_0 = 2, var_145_3 do
		_.each(var_145_0[iter_145_0], function(arg_146_0)
			table.insert(var_145_1, {
				arg_146_0[1],
				arg_146_0[2]
			})
		end)
	end

	return var_145_1
end

function var_0_0.getTriggerSkills(arg_147_0)
	local var_147_0 = {}
	local var_147_1 = arg_147_0:getSkillEffects()

	_.each(var_147_1, function(arg_148_0)
		if arg_148_0.type == "AddBuff" and arg_148_0.arg_list and arg_148_0.arg_list.buff_id then
			local var_148_0 = arg_148_0.arg_list.buff_id

			var_147_0[var_148_0] = {
				id = var_148_0,
				level = arg_148_0.level
			}
		end
	end)

	return var_147_0
end

function var_0_0.GetEquipmentSkills(arg_149_0)
	local var_149_0 = {}
	local var_149_1 = arg_149_0:getActiveEquipments()

	for iter_149_0, iter_149_1 in ipairs(var_149_1) do
		if iter_149_1 then
			local var_149_2 = iter_149_1:getConfig("skill_id")[1]

			if var_149_2 then
				var_149_0[var_149_2] = {
					level = 1,
					id = var_149_2
				}
			end
		end
	end

	;(function()
		local var_150_0 = arg_149_0:GetSpWeapon()
		local var_150_1 = var_150_0 and var_150_0:GetEffect() or 0

		if var_150_1 > 0 then
			var_149_0[var_150_1] = {
				level = 1,
				id = var_150_1
			}
		end
	end)()

	return var_149_0
end

function var_0_0.getAllSkills(arg_151_0)
	local var_151_0 = Clone(arg_151_0.skills)

	for iter_151_0, iter_151_1 in pairs(arg_151_0:GetEquipmentSkills()) do
		var_151_0[iter_151_0] = iter_151_1
	end

	for iter_151_2, iter_151_3 in pairs(arg_151_0:getTriggerSkills()) do
		var_151_0[iter_151_2] = iter_151_3
	end

	return var_151_0
end

function var_0_0.isSameKind(arg_152_0, arg_152_1)
	return pg.ship_data_template[arg_152_0.configId].group_type == pg.ship_data_template[arg_152_1.configId].group_type
end

function var_0_0.GetLockState(arg_153_0)
	return arg_153_0.lockState
end

function var_0_0.IsLocked(arg_154_0)
	return arg_154_0.lockState == var_0_0.LOCK_STATE_LOCK
end

function var_0_0.SetLockState(arg_155_0, arg_155_1)
	arg_155_0.lockState = arg_155_1
end

function var_0_0.GetPreferenceTag(arg_156_0)
	return arg_156_0.preferenceTag or 0
end

function var_0_0.IsPreferenceTag(arg_157_0)
	return arg_157_0:GetPreferenceTag() == var_0_0.PREFERENCE_TAG_COMMON
end

function var_0_0.SetPreferenceTag(arg_158_0, arg_158_1)
	arg_158_0.preferenceTag = arg_158_1
end

function var_0_0.calReturnRes(arg_159_0)
	local var_159_0 = pg.ship_data_by_type[arg_159_0:getShipType()]
	local var_159_1 = var_159_0.distory_resource_gold_ratio
	local var_159_2 = var_159_0.distory_resource_oil_ratio
	local var_159_3 = pg.ship_data_by_star[arg_159_0:getConfig("rarity")].destory_item

	return var_159_1, 0, var_159_3
end

function var_0_0.getRarity(arg_160_0)
	local var_160_0 = arg_160_0:getConfig("rarity")

	if arg_160_0:isRemoulded() then
		var_160_0 = var_160_0 + 1
	end

	return var_160_0
end

function var_0_0.getExchangePrice(arg_161_0)
	local var_161_0 = arg_161_0:getConfig("rarity")

	return pg.ship_data_by_star[var_161_0].exchange_price
end

function var_0_0.updateSkill(arg_162_0, arg_162_1)
	local var_162_0 = arg_162_1.skill_id or arg_162_1.id
	local var_162_1 = arg_162_1.skill_lv or arg_162_1.lv or arg_162_1.level
	local var_162_2 = arg_162_1.skill_exp or arg_162_1.exp

	arg_162_0.skills[var_162_0] = {
		id = var_162_0,
		level = var_162_1,
		exp = var_162_2
	}
end

function var_0_0.canEquipAtPos(arg_163_0, arg_163_1, arg_163_2)
	local var_163_0, var_163_1 = arg_163_0:isForbiddenAtPos(arg_163_1, arg_163_2)

	if var_163_0 then
		return false, var_163_1
	end

	for iter_163_0, iter_163_1 in ipairs(arg_163_0.equipments) do
		if iter_163_1 and iter_163_0 ~= arg_163_2 and iter_163_1:getConfig("equip_limit") ~= 0 and arg_163_1:getConfig("equip_limit") == iter_163_1:getConfig("equip_limit") then
			return false, i18n("ship_equip_same_group_equipment")
		end
	end

	return true
end

function var_0_0.isForbiddenAtPos(arg_164_0, arg_164_1, arg_164_2)
	local var_164_0 = pg.ship_data_template[arg_164_0.configId]

	assert(var_164_0, "can not find ship in ship_data_templtae: " .. arg_164_0.configId)

	local var_164_1 = var_164_0["equip_" .. arg_164_2]

	if not table.contains(var_164_1, arg_164_1:getConfig("type")) then
		return true, i18n("common_limit_equip")
	end

	if table.contains(arg_164_1:getConfig("ship_type_forbidden"), arg_164_0:getShipType()) then
		return true, i18n("common_limit_equip")
	end

	return false
end

function var_0_0.canEquipCommander(arg_165_0, arg_165_1)
	if arg_165_1:getShipType() ~= arg_165_0:getShipType() then
		return false, i18n("commander_type_unmatch")
	end

	return true
end

function var_0_0.upgrade(arg_166_0)
	local var_166_0 = pg.ship_data_transform[arg_166_0.configId]

	if var_166_0.trans_id and var_166_0.trans_id > 0 then
		arg_166_0.configId = var_166_0.trans_id
		arg_166_0.star = arg_166_0:getConfig("star")
	end
end

function var_0_0.getTeamType(arg_167_0)
	return TeamType.GetTeamFromShipType(arg_167_0:getShipType())
end

function var_0_0.getFleetName(arg_168_0)
	local var_168_0 = arg_168_0:getTeamType()

	return var_0_1[var_168_0]
end

function var_0_0.getMaxConfigId(arg_169_0)
	local var_169_0 = pg.ship_data_template
	local var_169_1

	for iter_169_0 = 4, 1, -1 do
		local var_169_2 = tonumber(arg_169_0.groupId .. iter_169_0)

		if var_169_0[var_169_2] then
			var_169_1 = var_169_2

			break
		end
	end

	return var_169_1
end

function var_0_0.getFlag(arg_170_0, arg_170_1, arg_170_2)
	return pg.ShipFlagMgr.GetInstance():GetShipFlag(arg_170_0.id, arg_170_1, arg_170_2)
end

function var_0_0.hasAnyFlag(arg_171_0, arg_171_1)
	return _.any(arg_171_1, function(arg_172_0)
		return arg_171_0:getFlag(arg_172_0)
	end)
end

function var_0_0.isBreakOut(arg_173_0)
	return arg_173_0.configId % 10 > 1
end

function var_0_0.fateSkillChange(arg_174_0, arg_174_1)
	if not arg_174_0.skillChangeList then
		arg_174_0.skillChangeList = arg_174_0:isBluePrintShip() and arg_174_0:getBluePrint():getChangeSkillList() or {}
	end

	for iter_174_0, iter_174_1 in ipairs(arg_174_0.skillChangeList) do
		if iter_174_1[1] == arg_174_1 and arg_174_0.skills[iter_174_1[2]] then
			return iter_174_1[2]
		end
	end

	return arg_174_1
end

function var_0_0.RemapSkillId(arg_175_0, arg_175_1)
	local var_175_0 = arg_175_0:GetSpWeapon()

	if var_175_0 then
		return var_175_0:RemapSkillId(arg_175_1)
	end

	return arg_175_1
end

function var_0_0.getSkillList(arg_176_0)
	local var_176_0 = pg.ship_data_template[arg_176_0.configId]
	local var_176_1 = Clone(var_176_0.buff_list_display)
	local var_176_2 = Clone(var_176_0.buff_list)
	local var_176_3 = pg.ship_data_trans[arg_176_0.groupId]
	local var_176_4 = 0

	if var_176_3 and var_176_3.skill_id ~= 0 then
		local var_176_5 = var_176_3.skill_id
		local var_176_6 = pg.transform_data_template[var_176_5]

		if arg_176_0.transforms[var_176_5] and var_176_6.skill_id ~= 0 then
			table.insert(var_176_2, var_176_6.skill_id)
		end
	end

	local var_176_7 = {}

	for iter_176_0, iter_176_1 in ipairs(var_176_1) do
		for iter_176_2, iter_176_3 in ipairs(var_176_2) do
			if iter_176_1 == iter_176_3 then
				table.insert(var_176_7, arg_176_0:fateSkillChange(iter_176_1))
			end
		end
	end

	return var_176_7
end

function var_0_0.getModAttrTopLimit(arg_177_0, arg_177_1)
	local var_177_0 = ShipModAttr.ATTR_TO_INDEX[arg_177_1]
	local var_177_1 = pg.ship_data_template[arg_177_0.configId].strengthen_id
	local var_177_2 = pg.ship_data_strengthen[var_177_1].durability[var_177_0]

	return calcFloor((3 + 7 * (math.min(arg_177_0.level, 100) / 100)) * var_177_2 * 0.1)
end

function var_0_0.leftModAdditionPoint(arg_178_0, arg_178_1)
	local var_178_0 = arg_178_0:getModProperties(arg_178_1)
	local var_178_1 = arg_178_0:getModExpRatio(arg_178_1)
	local var_178_2 = arg_178_0:getModAttrTopLimit(arg_178_1)
	local var_178_3 = calcFloor(var_178_0 / var_178_1)

	return math.max(0, var_178_2 - var_178_3)
end

function var_0_0.getModAttrBaseMax(arg_179_0, arg_179_1)
	if not table.contains(arg_179_0:getConfig("lock"), arg_179_1) then
		local var_179_0 = arg_179_0:leftModAdditionPoint(arg_179_1)
		local var_179_1 = arg_179_0:getShipProperties()

		return calcFloor(var_179_1[arg_179_1] + var_179_0)
	else
		return 0
	end
end

function var_0_0.getModExpRatio(arg_180_0, arg_180_1)
	if not table.contains(arg_180_0:getConfig("lock"), arg_180_1) then
		local var_180_0 = pg.ship_data_template[arg_180_0.configId].strengthen_id

		assert(pg.ship_data_strengthen[var_180_0], "ship_data_strengthen>>>>>>" .. var_180_0)

		return math.max(pg.ship_data_strengthen[var_180_0].level_exp[ShipModAttr.ATTR_TO_INDEX[arg_180_1]], 1)
	else
		return 1
	end
end

function var_0_0.inUnlockTip(arg_181_0)
	local var_181_0 = pg.gameset.tip_unlock_shipIds.description[0]

	return table.contains(var_181_0, arg_181_0)
end

function var_0_0.proposeSkinOwned(arg_182_0, arg_182_1)
	return arg_182_1 and arg_182_0.propose and arg_182_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE
end

function var_0_0.getProposeSkin(arg_183_0)
	return ShipSkin.GetSkinByType(arg_183_0.groupId, ShipSkin.SKIN_TYPE_PROPOSE)
end

function var_0_0.getDisplaySkillIds(arg_184_0)
	return _.map(pg.ship_data_template[arg_184_0.configId].buff_list_display, function(arg_185_0)
		return arg_184_0:fateSkillChange(arg_185_0)
	end)
end

function var_0_0.isFullSkillLevel(arg_186_0)
	local var_186_0 = pg.skill_data_template

	for iter_186_0, iter_186_1 in pairs(arg_186_0.skills) do
		if var_186_0[iter_186_1.id].max_level ~= iter_186_1.level then
			return false
		end
	end

	return true
end

function var_0_0.setEquipmentRecord(arg_187_0, arg_187_1, arg_187_2)
	local var_187_0 = "equipment_record" .. "_" .. arg_187_1 .. "_" .. arg_187_0.id

	PlayerPrefs.SetString(var_187_0, table.concat(_.flatten(arg_187_2), ":"))
	PlayerPrefs.Save()
end

function var_0_0.getEquipmentRecord(arg_188_0, arg_188_1)
	if not arg_188_0.equipmentRecords then
		local var_188_0 = "equipment_record" .. "_" .. arg_188_1 .. "_" .. arg_188_0.id
		local var_188_1 = string.split(PlayerPrefs.GetString(var_188_0) or "", ":")
		local var_188_2 = {}

		for iter_188_0 = 1, 3 do
			var_188_2[iter_188_0] = _.map(_.slice(var_188_1, 5 * iter_188_0 - 4, 5), function(arg_189_0)
				return tonumber(arg_189_0)
			end)
		end

		arg_188_0.equipmentRecords = var_188_2
	end

	return arg_188_0.equipmentRecords
end

function var_0_0.SetSpWeaponRecord(arg_190_0, arg_190_1, arg_190_2)
	local var_190_0 = "spweapon_record" .. "_" .. arg_190_1 .. "_" .. arg_190_0.id
	local var_190_1 = _.map({
		1,
		2,
		3
	}, function(arg_191_0)
		local var_191_0 = arg_190_2[arg_191_0]

		if var_191_0 then
			return (var_191_0:GetUID() or 0) .. "," .. var_191_0:GetConfigID()
		else
			return "0,0"
		end
	end)

	PlayerPrefs.SetString(var_190_0, table.concat(var_190_1, ":"))
	PlayerPrefs.Save()
end

function var_0_0.GetSpWeaponRecord(arg_192_0, arg_192_1)
	local var_192_0 = "spweapon_record" .. "_" .. arg_192_1 .. "_" .. arg_192_0.id

	return (_.map(string.split(PlayerPrefs.GetString(var_192_0, ""), ":"), function(arg_193_0)
		local var_193_0 = string.split(arg_193_0, ",")

		assert(var_193_0)

		local var_193_1 = tonumber(var_193_0[1])
		local var_193_2 = tonumber(var_193_0[2])

		if not var_193_2 or var_193_2 == 0 then
			return false
		end

		return (SpWeapon.New({
			id = var_193_2
		}))
	end))
end

function var_0_0.hasEquipEquipmentSkin(arg_194_0)
	for iter_194_0, iter_194_1 in ipairs(arg_194_0.equipments) do
		if iter_194_1 and iter_194_1:hasSkin() then
			return true
		end
	end

	return false
end

function var_0_0.hasCommander(arg_195_0)
	return arg_195_0.commanderId and arg_195_0.commanderId ~= 0
end

function var_0_0.getCommander(arg_196_0)
	return arg_196_0.commanderId
end

function var_0_0.setCommander(arg_197_0, arg_197_1)
	arg_197_0.commanderId = arg_197_1
end

function var_0_0.getSkillIndex(arg_198_0, arg_198_1)
	local var_198_0 = arg_198_0:getSkillList()

	for iter_198_0, iter_198_1 in ipairs(var_198_0) do
		if arg_198_1 == iter_198_1 then
			return iter_198_0
		end
	end
end

function var_0_0.getTactics(arg_199_0)
	return 1, "tactics_attack"
end

function var_0_0.IsBgmSkin(arg_200_0)
	local var_200_0 = arg_200_0:GetSkinConfig()

	return table.contains(var_200_0.tag, ShipSkin.WITH_BGM)
end

function var_0_0.GetSkinBgm(arg_201_0)
	if arg_201_0:IsBgmSkin() then
		return arg_201_0:GetSkinConfig().bgm
	end
end

function var_0_0.isIntensifyMax(arg_202_0)
	local var_202_0 = intProperties(arg_202_0:getShipProperties())

	if arg_202_0:isBluePrintShip() then
		return true
	end

	for iter_202_0, iter_202_1 in pairs(ShipModAttr.ID_TO_ATTR) do
		if arg_202_0:getModAttrBaseMax(iter_202_1) ~= var_202_0[iter_202_1] then
			return false
		end
	end

	return true
end

function var_0_0.isRemouldable(arg_203_0)
	return not arg_203_0:isTestShip() and not arg_203_0:isBluePrintShip() and pg.ship_data_trans[arg_203_0.groupId]
end

function var_0_0.isAllRemouldFinish(arg_204_0)
	local var_204_0 = pg.ship_data_trans[arg_204_0.groupId]

	assert(var_204_0, "this ship group without remould config:" .. arg_204_0.groupId)

	for iter_204_0, iter_204_1 in ipairs(var_204_0.transform_list) do
		for iter_204_2, iter_204_3 in ipairs(iter_204_1) do
			local var_204_1 = pg.transform_data_template[iter_204_3[2]]

			if #var_204_1.edit_trans > 0 then
				-- block empty
			elseif not arg_204_0.transforms[iter_204_3[2]] or arg_204_0.transforms[iter_204_3[2]].level < var_204_1.max_level then
				return false
			end
		end
	end

	return true
end

function var_0_0.isSpecialFilter(arg_205_0)
	local var_205_0 = pg.ship_data_statistics[arg_205_0.configId]

	assert(var_205_0, "this ship without statistics:" .. arg_205_0.configId)

	for iter_205_0, iter_205_1 in ipairs(var_205_0.tag_list) do
		if iter_205_1 == "special" then
			return true
		end
	end

	return false
end

function var_0_0.hasAvailiableSkin(arg_206_0)
	local var_206_0 = getProxy(ShipSkinProxy)
	local var_206_1 = var_206_0:GetAllSkinForShip(arg_206_0)
	local var_206_2 = var_206_0:getRawData()
	local var_206_3 = 0

	for iter_206_0, iter_206_1 in ipairs(var_206_1) do
		if arg_206_0:proposeSkinOwned(iter_206_1) or var_206_2[iter_206_1.id] then
			var_206_3 = var_206_3 + 1
		end
	end

	return var_206_3 > 0
end

function var_0_0.hasProposeSkin(arg_207_0)
	local var_207_0 = getProxy(ShipSkinProxy)
	local var_207_1 = var_207_0:GetAllSkinForShip(arg_207_0)

	for iter_207_0, iter_207_1 in ipairs(var_207_1) do
		if iter_207_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE then
			return true
		end
	end

	local var_207_2 = var_207_0:GetShareSkinsForShip(arg_207_0)

	for iter_207_2, iter_207_3 in ipairs(var_207_2) do
		if iter_207_3.skin_type == ShipSkin.SKIN_TYPE_PROPOSE then
			return true
		end
	end

	return false
end

function var_0_0.HasUniqueSpWeapon(arg_208_0)
	return tobool(pg.spweapon_data_statistics.get_id_list_by_unique[arg_208_0:getGroupId()])
end

function var_0_0.getAircraftReloadCD(arg_209_0)
	local var_209_0 = arg_209_0:getConfigTable().base_list
	local var_209_1 = arg_209_0:getConfigTable().default_equip_list
	local var_209_2 = 0
	local var_209_3 = 0

	for iter_209_0 = 1, 3 do
		local var_209_4 = arg_209_0:getEquip(iter_209_0)
		local var_209_5 = var_209_4 and var_209_4.configId or var_209_1[iter_209_0]
		local var_209_6 = Equipment.getConfigData(var_209_5).type

		if underscore.any(EquipType.AirEquipTypes, function(arg_210_0)
			return var_209_6 == arg_210_0
		end) then
			var_209_2 = var_209_2 + Equipment.GetEquipReloadStatic(var_209_5) * var_209_0[iter_209_0]
			var_209_3 = var_209_3 + var_209_0[iter_209_0]
		end
	end

	local var_209_7 = ys.Battle.BattleConfig.AIR_ASSIST_RELOAD_RATIO * pg.bfConsts.PERCENT

	return {
		name = i18n("equip_info_31"),
		type = AttributeType.CD,
		value = var_209_2 / var_209_3 * var_209_7
	}
end

function var_0_0.IsTagShip(arg_211_0, arg_211_1)
	local var_211_0 = arg_211_0:getConfig("tag_list")

	return table.contains(var_211_0, arg_211_1)
end

function var_0_0.setReMetaSpecialItemVO(arg_212_0, arg_212_1)
	arg_212_0.reMetaSpecialItemVO = arg_212_1
end

function var_0_0.getReMetaSpecialItemVO(arg_213_0, arg_213_1)
	return arg_213_0.reMetaSpecialItemVO
end

function var_0_0.getProposeType(arg_214_0)
	if arg_214_0:isMetaShip() then
		return "meta"
	elseif arg_214_0:IsXIdol() then
		return "imas"
	else
		return "default"
	end
end

function var_0_0.IsXIdol(arg_215_0)
	return arg_215_0:getNation() == Nation.IDOL_LINK
end

function var_0_0.getSpecificType(arg_216_0)
	return pg.ship_data_template[arg_216_0.configId].specific_type
end

function var_0_0.GetSpWeapon(arg_217_0)
	return arg_217_0.spWeapon
end

function var_0_0.UpdateSpWeapon(arg_218_0, arg_218_1)
	local var_218_0 = (arg_218_1 and arg_218_1:GetUID() or 0) == (arg_218_0.spWeapon and arg_218_0.spWeapon:GetUID() or 0)

	arg_218_0.spWeapon = arg_218_1

	if arg_218_1 then
		arg_218_1:SetShipId(arg_218_0.id)
	end

	if var_218_0 then
		pg.m02:sendNotification(EquipmentProxy.SPWEAPONS_UPDATED)
	end
end

function var_0_0.CanEquipSpWeapon(arg_219_0, arg_219_1)
	local var_219_0, var_219_1 = arg_219_0:IsSpWeaponForbidden(arg_219_1)

	if var_219_0 then
		return false, var_219_1
	end

	return true
end

function var_0_0.IsSpWeaponForbidden(arg_220_0, arg_220_1)
	local var_220_0 = arg_220_1:GetWearableShipTypes()
	local var_220_1 = arg_220_0:getShipType()

	if not table.contains(var_220_0, var_220_1) then
		return true, i18n("spweapon_tip_group_error")
	end

	local var_220_2 = arg_220_1:GetUniqueGroup()
	local var_220_3 = arg_220_0:getGroupId()

	if var_220_2 ~= 0 and var_220_2 ~= var_220_3 then
		return true, i18n("spweapon_tip_group_error")
	end

	return false
end

function var_0_0.GetMapStrikeAnim(arg_221_0)
	local var_221_0
	local var_221_1 = arg_221_0:getShipType()

	switch(TeamType.GetTeamFromShipType(var_221_1), {
		[TeamType.Main] = function()
			if ShipType.IsTypeQuZhu(var_221_1) then
				var_221_0 = "SubTorpedoUI"
			elseif ShipType.ContainInLimitBundle(ShipType.BundleAircraftCarrier, var_221_1) then
				var_221_0 = "AirStrikeUI"
			elseif ShipType.ContainInLimitBundle(ShipType.BundleBattleShip, var_221_1) then
				var_221_0 = "CannonUI"
			else
				var_221_0 = "CannonUI"
			end
		end,
		[TeamType.Vanguard] = function()
			if ShipType.IsTypeQuZhu(var_221_1) then
				var_221_0 = "SubTorpedoUI"
			end
		end,
		[TeamType.Submarine] = function()
			if arg_221_0:getNation() == Nation.MOT then
				var_221_0 = "CannonUI"
			else
				var_221_0 = "SubTorpedoUI"
			end
		end
	})

	return var_221_0
end

function var_0_0.IsDefaultSkin(arg_225_0)
	return arg_225_0.skinId == 0 or arg_225_0.skinId == arg_225_0:getConfig("skin_id")
end

function var_0_0.IsMatchKey(arg_226_0, arg_226_1)
	if not arg_226_1 or arg_226_1 == "" then
		return true
	end

	arg_226_1 = string.lower(string.gsub(arg_226_1, "%.", "%%."))

	return string.find(string.lower(arg_226_0:GetDefaultName()), arg_226_1)
end

function var_0_0.IsOwner(arg_227_0)
	return tobool(arg_227_0.id)
end

function var_0_0.GetUniqueId(arg_228_0)
	return arg_228_0.id
end

function var_0_0.ShowPropose(arg_229_0)
	if not arg_229_0.propose then
		return false
	else
		return not HXSet.isHxPropose() or arg_229_0:IsOwner() and arg_229_0:GetUniqueId() == getProxy(PlayerProxy):getRawData():GetProposeShipId()
	end
end

function var_0_0.GetColorName(arg_230_0, arg_230_1)
	arg_230_1 = arg_230_1 or arg_230_0:getName()

	if PlayerPrefs.GetInt("SHIP_NAME_COLOR", PLATFORM_CODE == PLATFORM_CH and 1 or 0) == 1 and arg_230_0.propose then
		return setColorStr(arg_230_1, "#FFAACEFF")
	else
		return arg_230_1
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

function var_0_0.GetFrameAndEffect(arg_231_0, arg_231_1)
	arg_231_1 = tobool(arg_231_1)

	local var_231_0
	local var_231_1

	if arg_231_0.propose then
		if arg_231_0:isMetaShip() then
			var_231_1 = string.format(var_0_9.effect[1])
			var_231_0 = string.format(var_0_9.frame[1])
		elseif arg_231_0:isBluePrintShip() then
			var_231_1 = string.format(var_0_9.effect[2])
			var_231_0 = string.format(var_0_9.frame[2], arg_231_0:rarity2bgPrint())
		else
			var_231_1 = string.format(var_0_9.effect[3])
			var_231_0 = string.format(var_0_9.frame[3])
		end

		if not arg_231_0:ShowPropose() then
			var_231_0 = nil
		end
	elseif arg_231_0:isMetaShip() then
		var_231_1 = string.format(var_0_9.effect[4], arg_231_0:rarity2bgPrint())
	elseif arg_231_0:getRarity() == ShipRarity.SSR then
		var_231_1 = string.format(var_0_9.effect[5])
	end

	if arg_231_1 then
		var_231_1 = var_231_1 and var_231_1 .. "_1"
	end

	return var_231_0, var_231_1
end

function var_0_0.GetRecordPosKey(arg_232_0)
	return arg_232_0.skinId
end

return var_0_0
