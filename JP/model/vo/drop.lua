local var_0_0 = class("Drop", import(".BaseVO"))

function var_0_0.Create(arg_1_0)
	local var_1_0 = {}

	var_1_0.type, var_1_0.id, var_1_0.count = unpack(arg_1_0)

	return var_0_0.New(var_1_0)
end

function var_0_0.Change(arg_2_0)
	if not getmetatable(arg_2_0) then
		setmetatable(arg_2_0, var_0_0)

		arg_2_0.class = var_0_0

		arg_2_0:InitConfig()
	else
		assert(instanceof(arg_2_0, var_0_0))
	end

	return arg_2_0
end

function var_0_0.Ctor(arg_3_0, arg_3_1)
	assert(not getmetatable(arg_3_1), "drop data should not has metatable")

	for iter_3_0, iter_3_1 in pairs(arg_3_1) do
		arg_3_0[iter_3_0] = iter_3_1
	end

	arg_3_0:InitConfig()
end

function var_0_0.InitConfig(arg_4_0)
	if not var_0_0.inited then
		var_0_0.InitSwitch()
	end

	arg_4_0.configId = arg_4_0.id
	arg_4_0.cfg = switch(arg_4_0.type, var_0_0.ConfigCase, var_0_0.ConfigDefault, arg_4_0)
end

function var_0_0.getConfigTable(arg_5_0)
	return arg_5_0.cfg
end

function var_0_0.getName(arg_6_0)
	return arg_6_0.name or arg_6_0:getConfig("name")
end

function var_0_0.getIcon(arg_7_0)
	return arg_7_0:getConfig("icon")
end

function var_0_0.getCount(arg_8_0)
	if arg_8_0.type == DROP_TYPE_OPERATION or arg_8_0.type == DROP_TYPE_LOVE_LETTER then
		return 1
	else
		return arg_8_0.count
	end
end

function var_0_0.isLoveLetter(arg_9_0)
	return arg_9_0.type == DROP_TYPE_LOVE_LETTER or arg_9_0.type == DROP_TYPE_ITEM and arg_9_0:getConfig("type") == Item.LOVE_LETTER_TYPE
end

function var_0_0.getOwnedCount(arg_10_0)
	return switch(arg_10_0.type, var_0_0.CountCase, var_0_0.CountDefault, arg_10_0)
end

function var_0_0.getSubClass(arg_11_0)
	return switch(arg_11_0.type, var_0_0.SubClassCase, var_0_0.SubClassDefault, arg_11_0)
end

function var_0_0.getDropRarity(arg_12_0)
	return switch(arg_12_0.type, var_0_0.RarityCase, var_0_0.RarityDefault, arg_12_0)
end

function var_0_0.DropTrans(arg_13_0, ...)
	return switch(arg_13_0.type, var_0_0.TransCase, var_0_0.TransDefault, arg_13_0, ...)
end

function var_0_0.AddItemOperation(arg_14_0)
	return switch(arg_14_0.type, var_0_0.AddItemCase, var_0_0.AddItemDefault, arg_14_0)
end

function var_0_0.MsgboxIntroSet(arg_15_0, ...)
	return switch(arg_15_0.type, var_0_0.MsgboxIntroCase, var_0_0.MsgboxIntroDefault, arg_15_0, ...)
end

function var_0_0.UpdateDropTpl(arg_16_0, ...)
	return switch(arg_16_0.type, var_0_0.UpdateDropCase, var_0_0.UpdateDropDefault, arg_16_0, ...)
end

function var_0_0.InitSwitch()
	var_0_0.inited = true
	var_0_0.ConfigCase = {
		[DROP_TYPE_RESOURCE] = function(arg_18_0)
			local var_18_0 = Item.getConfigData(id2ItemId(arg_18_0.id))

			arg_18_0.desc = var_18_0.display

			return var_18_0
		end,
		[DROP_TYPE_ITEM] = function(arg_19_0)
			local var_19_0 = Item.getConfigData(arg_19_0.id)

			arg_19_0.desc = var_19_0.display

			if var_19_0.type == Item.LOVE_LETTER_TYPE then
				arg_19_0.desc = string.gsub(arg_19_0.desc, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_19_0.extra))
			end

			return var_19_0
		end,
		[DROP_TYPE_VITEM] = function(arg_20_0)
			local var_20_0 = Item.getConfigData(arg_20_0.id)

			arg_20_0.desc = var_20_0.display

			return var_20_0
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_21_0)
			local var_21_0 = Item.getConfigData(arg_21_0.id)

			arg_21_0.desc = string.gsub(var_21_0.display, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_21_0.count))

			return var_21_0
		end,
		[DROP_TYPE_EQUIP] = function(arg_22_0)
			local var_22_0 = Equipment.getConfigData(arg_22_0.id)

			arg_22_0.desc = var_22_0.descrip

			return var_22_0
		end,
		[DROP_TYPE_SHIP] = function(arg_23_0)
			local var_23_0 = pg.ship_data_statistics[arg_23_0.id]
			local var_23_1, var_23_2, var_23_3 = ShipWordHelper.GetWordAndCV(var_23_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_23_0.desc = var_23_3 or i18n("ship_drop_desc_default")
			arg_23_0.ship = Ship.New({
				configId = arg_23_0.id,
				skin_id = arg_23_0.skinId,
				propose = arg_23_0.propose
			})
			arg_23_0.ship.remoulded = arg_23_0.remoulded
			arg_23_0.ship.virgin = arg_23_0.virgin

			return var_23_0
		end,
		[DROP_TYPE_FURNITURE] = function(arg_24_0)
			local var_24_0 = pg.furniture_data_template[arg_24_0.id]

			arg_24_0.desc = var_24_0.describe

			return var_24_0
		end,
		[DROP_TYPE_SKIN] = function(arg_25_0)
			local var_25_0 = pg.ship_skin_template[arg_25_0.id]
			local var_25_1, var_25_2, var_25_3 = ShipWordHelper.GetWordAndCV(arg_25_0.id, ShipWordHelper.WORD_TYPE_DROP)

			arg_25_0.desc = var_25_3

			return var_25_0
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_26_0)
			local var_26_0 = pg.ship_skin_template[arg_26_0.id]
			local var_26_1, var_26_2, var_26_3 = ShipWordHelper.GetWordAndCV(arg_26_0.id, ShipWordHelper.WORD_TYPE_DROP)

			arg_26_0.desc = var_26_3

			return var_26_0
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_27_0)
			local var_27_0 = pg.equip_skin_template[arg_27_0.id]

			arg_27_0.desc = var_27_0.desc

			return var_27_0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_28_0)
			local var_28_0 = pg.world_item_data_template[arg_28_0.id]

			arg_28_0.desc = var_28_0.display

			return var_28_0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_29_0)
			return pg.item_data_frame[arg_29_0.id]
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_30_0)
			return pg.item_data_chat[arg_30_0.id]
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_31_0)
			local var_31_0 = pg.spweapon_data_statistics[arg_31_0.id]

			arg_31_0.desc = var_31_0.descrip

			return var_31_0
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_32_0)
			local var_32_0 = pg.activity_ryza_item[arg_32_0.id]

			arg_32_0.item = AtelierMaterial.New({
				configId = arg_32_0.id
			})
			arg_32_0.desc = arg_32_0.item:GetDesc()

			return var_32_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_33_0)
			arg_33_0.ship = getProxy(BayProxy):getShipById(arg_33_0.count)

			local var_33_0 = pg.ship_data_statistics[arg_33_0.ship.configId]
			local var_33_1, var_33_2, var_33_3 = ShipWordHelper.GetWordAndCV(var_33_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_33_0.desc = var_33_3 or i18n("ship_drop_desc_default")

			return var_33_0
		end,
		[DROP_TYPE_STRATEGY] = function(arg_34_0)
			return arg_34_0.isWorldBuff and pg.world_SLGbuff_data[arg_34_0.id] or pg.strategy_data_template[arg_34_0.id]
		end,
		[DROP_TYPE_EMOJI] = function(arg_35_0)
			local var_35_0 = pg.emoji_template[arg_35_0.id]

			arg_35_0.name = var_35_0.item_name
			arg_35_0.desc = var_35_0.item_desc

			return var_35_0
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_36_0)
			local var_36_0 = WorldCollectionProxy.GetCollectionTemplate(arg_36_0.id)

			arg_36_0.desc = var_36_0.name

			return var_36_0
		end,
		[DROP_TYPE_META_PT] = function(arg_37_0)
			local var_37_0 = pg.ship_strengthen_meta[arg_37_0.id]
			local var_37_1 = Item.getConfigData(var_37_0.itemid)

			arg_37_0.desc = var_37_1.display

			return var_37_1
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_38_0)
			local var_38_0 = pg.activity_workbench_item[arg_38_0.id]

			arg_38_0.item = WorkBenchItem.New({
				configId = arg_38_0.id
			})
			arg_38_0.desc = arg_38_0.item:GetDesc()

			return var_38_0
		end,
		[DROP_TYPE_BUFF] = function(arg_39_0)
			local var_39_0 = pg.benefit_buff_template[arg_39_0.id]

			arg_39_0.desc = var_39_0.desc

			return var_39_0
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_40_0)
			local var_40_0 = pg.commander_data_template[arg_40_0.id]

			arg_40_0.desc = ""

			return var_40_0
		end,
		[DROP_TYPE_TRANS_ITEM] = function(arg_41_0)
			return pg.drop_data_restore[arg_41_0.id]
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_42_0)
			local var_42_0 = pg.dorm3d_furniture_template[arg_42_0.id]

			arg_42_0.desc = var_42_0.desc

			return var_42_0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_43_0)
			local var_43_0 = pg.dorm3d_gift[arg_43_0.id]

			arg_43_0.desc = ""

			return var_43_0
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_44_0)
			local var_44_0 = pg.dorm3d_resource[arg_44_0.id]

			arg_44_0.desc = ""

			return var_44_0
		end
	}

	function var_0_0.ConfigDefault(arg_45_0)
		local var_45_0 = arg_45_0.type

		if var_45_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_45_1 = pg.activity_drop_type[var_45_0].relevance

			return var_45_1 and pg[var_45_1][arg_45_0.id]
		end
	end

	var_0_0.CountCase = {
		[DROP_TYPE_RESOURCE] = function(arg_46_0)
			return getProxy(PlayerProxy):getRawData():getResById(arg_46_0.id), true
		end,
		[DROP_TYPE_ITEM] = function(arg_47_0)
			local var_47_0 = getProxy(BagProxy):getItemCountById(arg_47_0.id)

			if arg_47_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				return math.min(var_47_0, 1), true
			else
				return var_47_0, true
			end
		end,
		[DROP_TYPE_EQUIP] = function(arg_48_0)
			local var_48_0 = arg_48_0:getConfig("group")

			assert(pg.equip_data_template.get_id_list_by_group[var_48_0], "equip groupId not exist")

			local var_48_1 = pg.equip_data_template.get_id_list_by_group[var_48_0]

			return underscore.reduce(var_48_1, 0, function(arg_49_0, arg_49_1)
				local var_49_0 = getProxy(EquipmentProxy):getEquipmentById(arg_49_1)

				return arg_49_0 + (var_49_0 and var_49_0.count or 0) + getProxy(BayProxy):GetEquipCountInShips(arg_49_1)
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_50_0)
			return getProxy(BayProxy):getConfigShipCount(arg_50_0.id)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_51_0)
			return getProxy(DormProxy):getRawData():GetOwnFurnitureCount(arg_51_0.id)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_52_0)
			return arg_52_0.count, tobool(arg_52_0.count)
		end,
		[DROP_TYPE_SKIN] = function(arg_53_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_53_0.id)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_54_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_54_0.id)
		end,
		[DROP_TYPE_VITEM] = function(arg_55_0)
			if arg_55_0:getConfig("virtual_type") == 22 then
				local var_55_0 = getProxy(ActivityProxy):getActivityById(arg_55_0:getConfig("link_id"))

				return var_55_0 and var_55_0.data1 or 0, true
			end
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_56_0)
			local var_56_0 = getProxy(EquipmentProxy):getEquipmnentSkinById(arg_56_0.id)

			return (var_56_0 and var_56_0.count or 0) + getProxy(BayProxy):GetEquipSkinCountInShips(arg_56_0.id)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_57_0)
			local var_57_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_57_0.type].activity_id):GetItemById(arg_57_0.id)

			return var_57_0 and var_57_0.count or 0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_58_0)
			local var_58_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_ICON_FRAME, arg_58_0.id)

			return var_58_0 and (not var_58_0:expiredType() or not not var_58_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_59_0)
			local var_59_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_CHAT_FRAME, arg_59_0.id)

			return var_59_0 and (not var_59_0:expiredType() or not not var_59_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_60_0)
			local var_60_0 = nowWorld()

			if var_60_0.type ~= World.TypeFull then
				assert(false)

				return 0, false
			else
				return var_60_0:GetInventoryProxy():GetItemCount(arg_60_0.id), false
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_61_0)
			return getProxy(CommanderProxy):GetSameConfigIdCommanderCount(arg_61_0.id)
		end
	}

	function var_0_0.CountDefault(arg_62_0)
		local var_62_0 = arg_62_0.type

		if var_62_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			return getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[var_62_0].activity_id):getVitemNumber(arg_62_0.id)
		else
			return 0, false
		end
	end

	var_0_0.SubClassCase = {
		[DROP_TYPE_RESOURCE] = function(arg_63_0)
			return
		end,
		[DROP_TYPE_ITEM] = function(arg_64_0)
			return Item.New(arg_64_0)
		end,
		[DROP_TYPE_VITEM] = function(arg_65_0)
			return Item.New(arg_65_0)
		end,
		[DROP_TYPE_EQUIP] = function(arg_66_0)
			return Equipment.New(arg_66_0)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_67_0)
			return Item.New({
				count = 1,
				id = arg_67_0.id,
				extra = arg_67_0.count
			})
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_68_0)
			return WorldItem.New(arg_68_0)
		end
	}

	function var_0_0.SubClassDefault(arg_69_0)
		assert(false, string.format("drop type %d without subClass", arg_69_0.type))
	end

	var_0_0.RarityCase = {
		[DROP_TYPE_RESOURCE] = function(arg_70_0)
			return arg_70_0:getConfig("rarity")
		end,
		[DROP_TYPE_ITEM] = function(arg_71_0)
			return arg_71_0:getConfig("rarity")
		end,
		[DROP_TYPE_EQUIP] = function(arg_72_0)
			return arg_72_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_SHIP] = function(arg_73_0)
			return arg_73_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_FURNITURE] = function(arg_74_0)
			return arg_74_0:getConfig("rarity")
		end,
		[DROP_TYPE_SKIN] = function(arg_75_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_76_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_VITEM] = function(arg_77_0)
			return arg_77_0:getConfig("rarity")
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_78_0)
			return arg_78_0:getConfig("rarity")
		end,
		[DROP_TYPE_BUFF] = function(arg_79_0)
			return ItemRarity.Purple
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_80_0)
			return arg_80_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_81_0)
			return arg_81_0:getConfig("rarity")
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_82_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_83_0)
			return ItemRarity.Gold
		end
	}

	function var_0_0.RarityDefault(arg_84_0)
		return 1
	end

	var_0_0.TransCase = {
		[DROP_TYPE_TRANS_ITEM] = function(arg_85_0)
			local var_85_0 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = arg_85_0:getConfig("resource_type"),
				count = arg_85_0:getConfig("resource_num") * arg_85_0.count
			})
			local var_85_1 = Drop.New({
				type = arg_85_0:getConfig("target_type"),
				id = arg_85_0:getConfig("target_id")
			})

			var_85_0.name = string.format("%s(%s)", var_85_0:getName(), var_85_1:getName())

			return var_85_0
		end,
		[DROP_TYPE_RESOURCE] = function(arg_86_0)
			for iter_86_0, iter_86_1 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)) do
				if pg.battlepass_event_pt[iter_86_1.id].pt == arg_86_0.id then
					return nil, arg_86_0
				end
			end

			return arg_86_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_87_0)
			if arg_87_0.id ~= 3 then
				return nil
			end

			return arg_87_0
		end,
		[DROP_TYPE_VITEM] = function(arg_88_0, arg_88_1, arg_88_2)
			assert(arg_88_0:getConfig("type") == 0, "item type error:must be virtual type from " .. arg_88_0.id)

			return switch(arg_88_0:getConfig("virtual_type"), {
				function()
					if arg_88_0:getConfig("link_id") == ActivityConst.LINLK_DUNHUANG_ACT then
						return nil, arg_88_0
					end

					return arg_88_0
				end,
				[6] = function()
					local var_90_0 = arg_88_2.taskId
					local var_90_1 = getProxy(ActivityProxy)
					local var_90_2 = var_90_1:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_90_2 then
						local var_90_3 = var_90_2.data1KeyValueList[1]

						var_90_3[var_90_0] = defaultValue(var_90_3[var_90_0], 0) + arg_88_0.count

						var_90_1:updateActivity(var_90_2)
					end

					return nil, arg_88_0
				end,
				[13] = function()
					local var_91_0 = arg_88_0:getName()

					if not SkinCouponActivity.StaticExistActivity() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_timeout_tip", var_91_0))

						return nil
					elseif SkinCouponActivity.StaticOwnMaxCntSkinCoupon() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_repeat_tip", var_91_0))

						return nil
					elseif SkinCouponActivity.StaticOwnAllSkin() then
						if arg_88_0.count > 1 then
							pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_repeat_tip", var_91_0))
						end

						return SkinCouponActivity.StaticGetEquivalentRes(), nil
					else
						return arg_88_0, nil
					end
				end,
				[21] = function()
					return nil, arg_88_0
				end
			}, function()
				return arg_88_0
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_94_0, arg_94_1)
			if Ship.isMetaShipByConfigID(arg_94_0.id) and Player.isMetaShipNeedToTrans(arg_94_0.id) then
				local var_94_0 = table.indexof(arg_94_1, arg_94_0.id, 1)

				if var_94_0 then
					table.remove(arg_94_1, var_94_0)
				else
					local var_94_1 = Player.metaShip2Res(arg_94_0.id)
					local var_94_2 = Drop.New(var_94_1[1])

					getProxy(BayProxy):addMetaTransItemMap(arg_94_0.id, var_94_2)

					return arg_94_0, var_94_2
				end
			end

			return arg_94_0
		end,
		[DROP_TYPE_SKIN] = function(arg_95_0)
			arg_95_0.isNew = not getProxy(ShipSkinProxy):hasOldNonLimitSkin(arg_95_0.id)

			return arg_95_0
		end
	}

	function var_0_0.TransDefault(arg_96_0)
		return arg_96_0
	end

	var_0_0.AddItemCase = {
		[DROP_TYPE_RESOURCE] = function(arg_97_0)
			local var_97_0 = id2res(arg_97_0.id)

			assert(var_97_0, "res should be defined: " .. arg_97_0.id)

			local var_97_1 = getProxy(PlayerProxy)
			local var_97_2 = var_97_1:getData()

			var_97_2:addResources({
				[var_97_0] = arg_97_0.count
			})
			var_97_1:updatePlayer(var_97_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_98_0)
			if arg_98_0:getConfig("type") == Item.EXP_BOOK_TYPE then
				local var_98_0 = getProxy(BagProxy):getItemCountById(arg_98_0.id)
				local var_98_1 = math.min(arg_98_0:getConfig("max_num") - var_98_0, arg_98_0.count)

				if var_98_1 > 0 then
					getProxy(BagProxy):addItemById(arg_98_0.id, var_98_1)
				end
			else
				getProxy(BagProxy):addItemById(arg_98_0.id, arg_98_0.count, arg_98_0.extra)
			end
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_99_0)
			local var_99_0 = arg_99_0:getSubClass()

			getProxy(BagProxy):addItemById(var_99_0.id, var_99_0.count, var_99_0.extra)
		end,
		[DROP_TYPE_EQUIP] = function(arg_100_0)
			getProxy(EquipmentProxy):addEquipmentById(arg_100_0.id, arg_100_0.count)
		end,
		[DROP_TYPE_SHIP] = function(arg_101_0)
			return
		end,
		[DROP_TYPE_FURNITURE] = function(arg_102_0)
			local var_102_0 = getProxy(DormProxy)
			local var_102_1 = Furniture.New({
				id = arg_102_0.id,
				count = arg_102_0.count
			})

			if var_102_1:isRecordTime() then
				var_102_1.date = pg.TimeMgr.GetInstance():GetServerTime()
			end

			var_102_0:AddFurniture(var_102_1)
		end,
		[DROP_TYPE_SKIN] = function(arg_103_0)
			local var_103_0 = getProxy(ShipSkinProxy)
			local var_103_1 = ShipSkin.New({
				id = arg_103_0.id
			})

			var_103_0:addSkin(var_103_1)
		end,
		[DROP_TYPE_VITEM] = function(arg_104_0)
			arg_104_0 = arg_104_0:getSubClass()

			assert(arg_104_0:isVirtualItem(), "item type error(virtual item)>>" .. arg_104_0.id)
			switch(arg_104_0:getConfig("virtual_type"), {
				[0] = function()
					getProxy(ActivityProxy):addVitemById(arg_104_0.id, arg_104_0.count)
				end,
				function()
					local var_106_0 = getProxy(ActivityProxy)
					local var_106_1 = arg_104_0:getConfig("link_id")
					local var_106_2

					if var_106_1 > 0 then
						var_106_2 = var_106_0:getActivityById(var_106_1)
					else
						var_106_2 = var_106_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA)
					end

					if var_106_2 and not var_106_2:isEnd() then
						if not table.contains(var_106_2.data1_list, arg_104_0.id) then
							table.insert(var_106_2.data1_list, arg_104_0.id)
						end

						var_106_0:updateActivity(var_106_2)
					end
				end,
				function()
					local var_107_0 = getProxy(ActivityProxy)
					local var_107_1 = var_107_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_VOTE)

					for iter_107_0, iter_107_1 in ipairs(var_107_1) do
						iter_107_1.data1 = iter_107_1.data1 + arg_104_0.count

						local var_107_2 = iter_107_1:getConfig("config_id")
						local var_107_3 = pg.activity_vote[var_107_2]

						if var_107_3 and var_107_3.ticket_id_period == arg_104_0.id then
							iter_107_1.data3 = iter_107_1.data3 + arg_104_0.count
						end

						var_107_0:updateActivity(iter_107_1)
						pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_VOTE, {
							ptId = arg_104_0.id,
							ptCount = arg_104_0.count
						})
					end
				end,
				[4] = function()
					local var_108_0 = getProxy(ColoringProxy):getColorItems()

					var_108_0[arg_104_0.id] = (var_108_0[arg_104_0.id] or 0) + arg_104_0.count
				end,
				[6] = function()
					local var_109_0 = getProxy(ActivityProxy)
					local var_109_1 = var_109_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_109_1 then
						var_109_1.data3 = var_109_1.data3 + arg_104_0.count

						var_109_0:updateActivity(var_109_1)
					end
				end,
				[7] = function()
					local var_110_0 = getProxy(ChapterProxy)

					var_110_0:updateRemasterTicketsNum(math.min(var_110_0.remasterTickets + arg_104_0.count, pg.gameset.reactivity_ticket_max.key_value))
				end,
				[9] = function()
					local var_111_0 = getProxy(ActivityProxy)
					local var_111_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY)

					if var_111_1 then
						var_111_1.data1_list[1] = var_111_1.data1_list[1] + arg_104_0.count

						var_111_0:updateActivity(var_111_1)
					end
				end,
				[10] = function()
					local var_112_0 = getProxy(ActivityProxy)
					local var_112_1 = var_112_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM)

					if var_112_1 and not var_112_1:isEnd() then
						var_112_1.data1 = var_112_1.data1 + arg_104_0.count

						var_112_0:updateActivity(var_112_1)
						pg.m02:sendNotification(GAME.ACTIVITY_BE_UPDATED, {
							activity = var_112_1
						})
					end
				end,
				[11] = function()
					local var_113_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS)

					if var_113_0 and not var_113_0:isEnd() then
						var_113_0.data1 = var_113_0.data1 + arg_104_0.count
					end
				end,
				[12] = function()
					local var_114_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF)

					if var_114_0 and not var_114_0:isEnd() then
						var_114_0.data1KeyValueList[1][arg_104_0.id] = (var_114_0.data1KeyValueList[1][arg_104_0.id] or 0) + arg_104_0.count
					end
				end,
				[13] = function()
					SkinCouponActivity.AddSkinCoupon(arg_104_0.id)
				end,
				[14] = function()
					local var_116_0 = nowWorld():GetBossProxy()

					if WorldBossConst.WORLD_BOSS_ITEM_ID == arg_104_0.id then
						var_116_0:AddSummonPt(arg_104_0.count)
					elseif WorldBossConst.WORLD_PAST_BOSS_ITEM_ID == arg_104_0.id then
						var_116_0:AddSummonPtOld(arg_104_0.count)
					end
				end,
				[15] = function()
					local var_117_0 = getProxy(ActivityProxy)
					local var_117_1 = var_117_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE)

					if var_117_1 and not var_117_1:isEnd() then
						local var_117_2 = pg.activity_event_grid[var_117_1.data1]

						if arg_104_0.id == var_117_2.ticket_item then
							var_117_1.data2 = var_117_1.data2 + arg_104_0.count
						elseif arg_104_0.id == var_117_2.explore_item then
							var_117_1.data3 = var_117_1.data3 + arg_104_0.count
						end
					end

					var_117_0:updateActivity(var_117_1)
				end,
				[16] = function()
					local var_118_0 = getProxy(ActivityProxy)
					local var_118_1 = var_118_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHAKE_BEADS)

					for iter_118_0, iter_118_1 in pairs(var_118_1) do
						if iter_118_1 and not iter_118_1:isEnd() and arg_104_0.id == iter_118_1:getConfig("config_id") then
							iter_118_1.data1 = iter_118_1.data1 + arg_104_0.count

							var_118_0:updateActivity(iter_118_1)
						end
					end
				end,
				[20] = function()
					local var_119_0 = getProxy(BagProxy)
					local var_119_1 = pg.gameset.urpt_chapter_max.description
					local var_119_2 = var_119_1[1]
					local var_119_3 = var_119_1[2]
					local var_119_4 = var_119_0:GetLimitCntById(var_119_2)
					local var_119_5 = math.min(var_119_3 - var_119_4, arg_104_0.count)

					if var_119_5 > 0 then
						var_119_0:addItemById(var_119_2, var_119_5)
						var_119_0:AddLimitCnt(var_119_2, var_119_5)
					end
				end,
				[21] = function()
					local var_120_0 = getProxy(ActivityProxy)
					local var_120_1 = var_120_0:getActivityById(arg_104_0:getConfig("link_id"))

					if var_120_1 and not var_120_1:isEnd() then
						var_120_1.data2 = 1

						var_120_0:updateActivity(var_120_1)
					end
				end,
				[22] = function()
					local var_121_0 = getProxy(ActivityProxy)
					local var_121_1 = var_121_0:getActivityById(arg_104_0:getConfig("link_id"))

					if var_121_1 and not var_121_1:isEnd() then
						var_121_1.data1 = var_121_1.data1 + arg_104_0.count

						var_121_0:updateActivity(var_121_1)
					end
				end,
				[23] = function()
					local var_122_0 = (function()
						for iter_123_0, iter_123_1 in ipairs(pg.gameset.package_lv.description) do
							if arg_104_0.id == iter_123_1[1] then
								return iter_123_1[2]
							end
						end
					end)()

					assert(var_122_0)

					local var_122_1 = getProxy(PlayerProxy)
					local var_122_2 = var_122_1:getData()

					var_122_2:addExpToLevel(var_122_0)
					var_122_1:updatePlayer(var_122_2)
				end,
				[24] = function()
					local var_124_0 = arg_104_0:getConfig("link_id")
					local var_124_1 = getProxy(ActivityProxy):getActivityById(var_124_0)

					if var_124_1 and not var_124_1:isEnd() and var_124_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HOTSPRING then
						var_124_1.data2 = var_124_1.data2 + arg_104_0.count

						getProxy(ActivityProxy):updateActivity(var_124_1)
					end
				end,
				[25] = function()
					local var_125_0 = getProxy(ActivityProxy)
					local var_125_1 = var_125_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_FIREWORK)

					if var_125_1 and not var_125_1:isEnd() then
						var_125_1.data1 = var_125_1.data1 - 1

						if not table.contains(var_125_1.data1_list, arg_104_0.id) then
							table.insert(var_125_1.data1_list, arg_104_0.id)
						end

						var_125_0:updateActivity(var_125_1)

						local var_125_2 = arg_104_0:getConfig("link_id")

						if var_125_2 > 0 then
							local var_125_3 = var_125_0:getActivityById(var_125_2)

							if var_125_3 and not var_125_3:isEnd() then
								var_125_3.data1 = var_125_3.data1 + 1

								var_125_0:updateActivity(var_125_3)
							end
						end
					end
				end,
				[26] = function()
					local var_126_0 = getProxy(ActivityProxy)
					local var_126_1 = Clone(var_126_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING))

					if var_126_1 and not var_126_1:isEnd() then
						var_126_1.data1 = var_126_1.data1 + arg_104_0.count

						var_126_0:updateActivity(var_126_1)
					end
				end,
				[99] = function()
					return
				end,
				[100] = function()
					return
				end
			})
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_129_0)
			getProxy(EquipmentProxy):addEquipmentSkin(arg_129_0.id, arg_129_0.count)
		end,
		[DROP_TYPE_OPERATION] = function(arg_130_0)
			local var_130_0 = getProxy(BayProxy)
			local var_130_1 = var_130_0:getShipById(arg_130_0.count)

			if var_130_1 then
				var_130_1:unlockActivityNpc(0)
				var_130_0:updateShip(var_130_1)
				getProxy(CollectionProxy):flushCollection(var_130_1)
			end
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_131_0)
			nowWorld():GetInventoryProxy():AddItem(arg_131_0.id, arg_131_0.count)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_132_0)
			local var_132_0 = getProxy(AttireProxy)
			local var_132_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_132_2 = IconFrame.New({
				id = arg_132_0.id
			})
			local var_132_3 = var_132_1 + var_132_2:getConfig("time_second")

			var_132_2:updateData({
				isNew = true,
				end_time = var_132_3
			})
			var_132_0:addAttireFrame(var_132_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_132_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_133_0)
			local var_133_0 = getProxy(AttireProxy)
			local var_133_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_133_2 = ChatFrame.New({
				id = arg_133_0.id
			})
			local var_133_3 = var_133_1 + var_133_2:getConfig("time_second")

			var_133_2:updateData({
				isNew = true,
				end_time = var_133_3
			})
			var_133_0:addAttireFrame(var_133_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_133_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_134_0)
			getProxy(EmojiProxy):addNewEmojiID(arg_134_0.id)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_EMOJI, arg_134_0:getConfigTable())
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_135_0)
			nowWorld():GetCollectionProxy():Unlock(arg_135_0.id)
		end,
		[DROP_TYPE_META_PT] = function(arg_136_0)
			getProxy(MetaCharacterProxy):getMetaProgressVOByID(arg_136_0.id):addPT(arg_136_0.count)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_137_0)
			local var_137_0 = arg_137_0.id
			local var_137_1 = arg_137_0.count
			local var_137_2 = getProxy(ShipSkinProxy)
			local var_137_3 = var_137_2:getSkinById(var_137_0)

			if var_137_3 and var_137_3:isExpireType() then
				local var_137_4 = var_137_1 + var_137_3.endTime
				local var_137_5 = ShipSkin.New({
					id = var_137_0,
					end_time = var_137_4
				})

				var_137_2:addSkin(var_137_5)
			elseif not var_137_3 then
				local var_137_6 = var_137_1 + pg.TimeMgr.GetInstance():GetServerTime()
				local var_137_7 = ShipSkin.New({
					id = var_137_0,
					end_time = var_137_6
				})

				var_137_2:addSkin(var_137_7)
			end
		end,
		[DROP_TYPE_BUFF] = function(arg_138_0)
			local var_138_0 = arg_138_0.id
			local var_138_1 = pg.benefit_buff_template[var_138_0]

			assert(var_138_1 and var_138_1.act_id > 0, "should exist act id")

			local var_138_2 = getProxy(ActivityProxy):getActivityById(var_138_1.act_id)

			if var_138_2 and not var_138_2:isEnd() then
				local var_138_3 = var_138_1.max_time
				local var_138_4 = pg.TimeMgr.GetInstance():GetServerTime() + var_138_3

				var_138_2:AddBuff(ActivityBuff.New(var_138_2.id, var_138_0, var_138_4))
				getProxy(ActivityProxy):updateActivity(var_138_2)
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_139_0)
			return
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_140_0)
			getProxy(ApartmentProxy):changeGiftCount(arg_140_0.id, arg_140_0.count)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_141_0)
			local var_141_0 = getProxy(ApartmentProxy)
			local var_141_1 = var_141_0:getApartment(arg_141_0:getConfig("ship_group"))

			var_141_1:addSkin(arg_141_0.id)
			var_141_0:updateApartment(var_141_1)
		end
	}

	function var_0_0.AddItemDefault(arg_142_0)
		if arg_142_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_142_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_142_0.type].activity_id)

			if arg_142_0.type == DROP_TYPE_RYZA_DROP then
				if var_142_0 and not var_142_0:isEnd() then
					var_142_0:AddItem(AtelierMaterial.New({
						configId = arg_142_0.id,
						count = arg_142_0.count
					}))
					getProxy(ActivityProxy):updateActivity(var_142_0)
				end
			elseif var_142_0 and not var_142_0:isEnd() then
				var_142_0:addVitemNumber(arg_142_0.id, arg_142_0.count)
				getProxy(ActivityProxy):updateActivity(var_142_0)
			end
		else
			print("can not handle this type>>" .. arg_142_0.type)
		end
	end

	var_0_0.MsgboxIntroCase = {
		[DROP_TYPE_RESOURCE] = function(arg_143_0, arg_143_1, arg_143_2)
			setText(arg_143_2, arg_143_0:getConfig("display"))
		end,
		[DROP_TYPE_ITEM] = function(arg_144_0, arg_144_1, arg_144_2)
			local var_144_0 = arg_144_0:getConfig("display")

			if arg_144_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				var_144_0 = string.gsub(var_144_0, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_144_0.extra))
			elseif arg_144_0:getConfig("combination_display") ~= nil then
				local var_144_1 = arg_144_0:getConfig("combination_display")

				if var_144_1 and #var_144_1 > 0 then
					var_144_0 = Item.StaticCombinationDisplay(var_144_1)
				end
			end

			setText(arg_144_2, SwitchSpecialChar(var_144_0, true))
		end,
		[DROP_TYPE_FURNITURE] = function(arg_145_0, arg_145_1, arg_145_2)
			setText(arg_145_2, arg_145_0:getConfig("describe"))
		end,
		[DROP_TYPE_SHIP] = function(arg_146_0, arg_146_1, arg_146_2)
			local var_146_0 = arg_146_0:getConfig("skin_id")
			local var_146_1, var_146_2, var_146_3 = ShipWordHelper.GetWordAndCV(var_146_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_146_2, var_146_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_OPERATION] = function(arg_147_0, arg_147_1, arg_147_2)
			local var_147_0 = arg_147_0:getConfig("skin_id")
			local var_147_1, var_147_2, var_147_3 = ShipWordHelper.GetWordAndCV(var_147_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_147_2, var_147_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_EQUIP] = function(arg_148_0, arg_148_1, arg_148_2)
			setText(arg_148_2, arg_148_1.name or arg_148_0:getConfig("name") or "")
		end,
		[DROP_TYPE_STRATEGY] = function(arg_149_0, arg_149_1, arg_149_2)
			local var_149_0 = arg_149_0:getConfig("desc")

			for iter_149_0, iter_149_1 in ipairs({
				arg_149_0.count
			}) do
				var_149_0 = string.gsub(var_149_0, "$" .. iter_149_0, iter_149_1)
			end

			setText(arg_149_2, var_149_0)
		end,
		[DROP_TYPE_SKIN] = function(arg_150_0, arg_150_1, arg_150_2)
			setText(arg_150_2, arg_150_0:getConfig("desc"))
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_151_0, arg_151_1, arg_151_2)
			setText(arg_151_2, arg_151_0:getConfig("desc"))
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_152_0, arg_152_1, arg_152_2)
			local var_152_0 = arg_152_0:getConfig("desc")
			local var_152_1 = _.map(arg_152_0:getConfig("equip_type"), function(arg_153_0)
				return EquipType.Type2Name2(arg_153_0)
			end)

			setText(arg_152_2, var_152_0 .. "\n\n" .. i18n("word_fit") .. ": " .. table.concat(var_152_1, ","))
		end,
		[DROP_TYPE_VITEM] = function(arg_154_0, arg_154_1, arg_154_2)
			setText(arg_154_2, arg_154_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_155_0, arg_155_1, arg_155_2)
			setText(arg_155_2, arg_155_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_156_0, arg_156_1, arg_156_2, arg_156_3)
			local var_156_0 = WorldCollectionProxy.GetCollectionType(arg_156_0.id) == WorldCollectionProxy.WorldCollectionType.FILE and "file" or "record"

			setText(arg_156_2, i18n("world_" .. var_156_0 .. "_desc", arg_156_0:getConfig("name")))
			setText(arg_156_3, i18n("world_" .. var_156_0 .. "_name", arg_156_0:getConfig("name")))
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_157_0, arg_157_1, arg_157_2)
			setText(arg_157_2, arg_157_0:getConfig("desc"))
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_158_0, arg_158_1, arg_158_2)
			setText(arg_158_2, arg_158_0:getConfig("desc"))
		end,
		[DROP_TYPE_EMOJI] = function(arg_159_0, arg_159_1, arg_159_2)
			setText(arg_159_2, arg_159_0:getConfig("item_desc"))
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_160_0, arg_160_1, arg_160_2)
			local var_160_0 = string.gsub(arg_160_0:getConfig("display"), "$1", ShipGroup.getDefaultShipNameByGroupID(arg_160_0.count))

			setText(arg_160_2, SwitchSpecialChar(var_160_0, true))
		end,
		[DROP_TYPE_META_PT] = function(arg_161_0, arg_161_1, arg_161_2)
			setText(arg_161_2, arg_161_0:getConfig("display"))
		end,
		[DROP_TYPE_BUFF] = function(arg_162_0, arg_162_1, arg_162_2)
			setText(arg_162_2, arg_162_0:getConfig("desc"))
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_163_0, arg_163_1, arg_163_2)
			setText(arg_163_2, "")
		end
	}

	function var_0_0.MsgboxIntroDefault(arg_164_0, arg_164_1, arg_164_2)
		if arg_164_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			setText(arg_164_2, arg_164_0:getConfig("display"))
		else
			assert(false, "can not handle this type>>" .. arg_164_0.type)
		end
	end

	var_0_0.UpdateDropCase = {
		[DROP_TYPE_RESOURCE] = function(arg_165_0, arg_165_1, arg_165_2)
			if arg_165_0.id == PlayerConst.ResStoreGold or arg_165_0.id == PlayerConst.ResStoreOil then
				arg_165_2 = arg_165_2 or {}
				arg_165_2.frame = "frame_store"
			end

			updateItem(arg_165_1, Item.New({
				id = id2ItemId(arg_165_0.id)
			}), arg_165_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_166_0, arg_166_1, arg_166_2)
			updateItem(arg_166_1, arg_166_0:getSubClass(), arg_166_2)
		end,
		[DROP_TYPE_EQUIP] = function(arg_167_0, arg_167_1, arg_167_2)
			updateEquipment(arg_167_1, arg_167_0:getSubClass(), arg_167_2)
		end,
		[DROP_TYPE_SHIP] = function(arg_168_0, arg_168_1, arg_168_2)
			updateShip(arg_168_1, arg_168_0.ship, arg_168_2)
		end,
		[DROP_TYPE_OPERATION] = function(arg_169_0, arg_169_1, arg_169_2)
			updateShip(arg_169_1, arg_169_0.ship, arg_169_2)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_170_0, arg_170_1, arg_170_2)
			updateFurniture(arg_170_1, arg_170_0, arg_170_2)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_171_0, arg_171_1, arg_171_2)
			arg_171_2.isWorldBuff = arg_171_0.isWorldBuff

			updateStrategy(arg_171_1, arg_171_0, arg_171_2)
		end,
		[DROP_TYPE_SKIN] = function(arg_172_0, arg_172_1, arg_172_2)
			arg_172_2.isSkin = true
			arg_172_2.isNew = arg_172_0.isNew

			updateShip(arg_172_1, Ship.New({
				configId = tonumber(arg_172_0:getConfig("ship_group") .. "1"),
				skin_id = arg_172_0.id
			}), arg_172_2)
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_173_0, arg_173_1, arg_173_2)
			local var_173_0 = setmetatable({
				count = arg_173_0.count
			}, {
				__index = arg_173_0:getConfigTable()
			})

			updateEquipmentSkin(arg_173_1, var_173_0, arg_173_2)
		end,
		[DROP_TYPE_VITEM] = function(arg_174_0, arg_174_1, arg_174_2)
			updateItem(arg_174_1, Item.New({
				id = arg_174_0.id
			}), arg_174_2)
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_175_0, arg_175_1, arg_175_2)
			updateWorldItem(arg_175_1, WorldItem.New({
				id = arg_175_0.id
			}), arg_175_2)
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_176_0, arg_176_1, arg_176_2)
			updateWorldCollection(arg_176_1, arg_176_0, arg_176_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_177_0, arg_177_1, arg_177_2)
			updateAttire(arg_177_1, AttireConst.TYPE_CHAT_FRAME, arg_177_0:getConfigTable(), arg_177_2)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_178_0, arg_178_1, arg_178_2)
			updateAttire(arg_178_1, AttireConst.TYPE_ICON_FRAME, arg_178_0:getConfigTable(), arg_178_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_179_0, arg_179_1, arg_179_2)
			updateEmoji(arg_179_1, arg_179_0:getConfigTable(), arg_179_2)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_180_0, arg_180_1, arg_180_2)
			arg_180_2.count = 1

			updateItem(arg_180_1, arg_180_0:getSubClass(), arg_180_2)
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_181_0, arg_181_1, arg_181_2)
			updateSpWeapon(arg_181_1, SpWeapon.New({
				id = arg_181_0.id
			}), arg_181_2)
		end,
		[DROP_TYPE_META_PT] = function(arg_182_0, arg_182_1, arg_182_2)
			updateItem(arg_182_1, Item.New({
				id = arg_182_0:getConfig("id")
			}), arg_182_2)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_183_0, arg_183_1, arg_183_2)
			arg_183_2.isSkin = true
			arg_183_2.isTimeLimit = true
			arg_183_2.count = 1

			updateShip(arg_183_1, Ship.New({
				configId = tonumber(arg_183_0:getConfig("ship_group") .. "1"),
				skin_id = arg_183_0.id
			}), arg_183_2)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_184_0, arg_184_1, arg_184_2)
			AtelierMaterial.UpdateRyzaItem(arg_184_1, arg_184_0.item, arg_184_2)
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_185_0, arg_185_1, arg_185_2)
			WorkBenchItem.UpdateDrop(arg_185_1, arg_185_0.item, arg_185_2)
		end,
		[DROP_TYPE_FEAST_DROP] = function(arg_186_0, arg_186_1, arg_186_2)
			WorkBenchItem.UpdateDrop(arg_186_1, WorkBenchItem.New({
				configId = arg_186_0.id,
				count = arg_186_0.count
			}), arg_186_2)
		end,
		[DROP_TYPE_BUFF] = function(arg_187_0, arg_187_1, arg_187_2)
			updateBuff(arg_187_1, arg_187_0.id, arg_187_2)
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_188_0, arg_188_1, arg_188_2)
			updateCommander(arg_188_1, arg_188_0, arg_188_2)
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_189_0, arg_189_1, arg_189_2)
			updateDorm3dFurniture(arg_189_1, arg_189_0, arg_189_2)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_190_0, arg_190_1, arg_190_2)
			updateDorm3dGift(arg_190_1, arg_190_0, arg_190_2)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_191_0, arg_191_1, arg_191_2)
			updateDorm3dSkin(arg_191_1, arg_191_0, arg_191_2)
		end
	}

	function var_0_0.UpdateDropDefault(arg_192_0, arg_192_1, arg_192_2)
		warning(string.format("without dropType %d in updateDrop", arg_192_0.type))
	end
end

return var_0_0
