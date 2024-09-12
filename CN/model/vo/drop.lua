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
	if arg_7_0.type == DROP_TYPE_LIVINGAREA_COVER then
		return "Props/icon_cover"
	else
		return arg_7_0:getConfig("icon")
	end
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

			arg_43_0.desc = var_43_0.display

			return var_43_0
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_44_0)
			local var_44_0 = pg.dorm3d_resource[arg_44_0.id]

			arg_44_0.desc = ""

			return var_44_0
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_45_0)
			return pg.livingarea_cover[arg_45_0.id]
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_46_0)
			return pg.item_data_battleui[arg_46_0.id]
		end
	}

	function var_0_0.ConfigDefault(arg_47_0)
		local var_47_0 = arg_47_0.type

		if var_47_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_47_1 = pg.activity_drop_type[var_47_0].relevance

			return var_47_1 and pg[var_47_1][arg_47_0.id]
		end
	end

	var_0_0.CountCase = {
		[DROP_TYPE_RESOURCE] = function(arg_48_0)
			return getProxy(PlayerProxy):getRawData():getResById(arg_48_0.id), true
		end,
		[DROP_TYPE_ITEM] = function(arg_49_0)
			local var_49_0 = getProxy(BagProxy):getItemCountById(arg_49_0.id)

			if arg_49_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				return math.min(var_49_0, 1), true
			else
				return var_49_0, true
			end
		end,
		[DROP_TYPE_EQUIP] = function(arg_50_0)
			local var_50_0 = arg_50_0:getConfig("group")

			assert(pg.equip_data_template.get_id_list_by_group[var_50_0], "equip groupId not exist")

			local var_50_1 = pg.equip_data_template.get_id_list_by_group[var_50_0]

			return underscore.reduce(var_50_1, 0, function(arg_51_0, arg_51_1)
				local var_51_0 = getProxy(EquipmentProxy):getEquipmentById(arg_51_1)

				return arg_51_0 + (var_51_0 and var_51_0.count or 0) + getProxy(BayProxy):GetEquipCountInShips(arg_51_1)
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_52_0)
			return getProxy(BayProxy):getConfigShipCount(arg_52_0.id)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_53_0)
			return getProxy(DormProxy):getRawData():GetOwnFurnitureCount(arg_53_0.id)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_54_0)
			return arg_54_0.count, tobool(arg_54_0.count)
		end,
		[DROP_TYPE_SKIN] = function(arg_55_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_55_0.id)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_56_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_56_0.id)
		end,
		[DROP_TYPE_VITEM] = function(arg_57_0)
			if arg_57_0:getConfig("virtual_type") == 22 then
				local var_57_0 = getProxy(ActivityProxy):getActivityById(arg_57_0:getConfig("link_id"))

				return var_57_0 and var_57_0.data1 or 0, true
			end
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_58_0)
			local var_58_0 = getProxy(EquipmentProxy):getEquipmnentSkinById(arg_58_0.id)

			return (var_58_0 and var_58_0.count or 0) + getProxy(BayProxy):GetEquipSkinCountInShips(arg_58_0.id)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_59_0)
			local var_59_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_59_0.type].activity_id):GetItemById(arg_59_0.id)

			return var_59_0 and var_59_0.count or 0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_60_0)
			local var_60_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_ICON_FRAME, arg_60_0.id)

			return var_60_0 and (not var_60_0:expiredType() or not not var_60_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_61_0)
			local var_61_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_CHAT_FRAME, arg_61_0.id)

			return var_61_0 and (not var_61_0:expiredType() or not not var_61_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_62_0)
			local var_62_0 = nowWorld()

			if var_62_0.type ~= World.TypeFull then
				assert(false)

				return 0, false
			else
				return var_62_0:GetInventoryProxy():GetItemCount(arg_62_0.id), false
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_63_0)
			return getProxy(CommanderProxy):GetSameConfigIdCommanderCount(arg_63_0.id)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_64_0)
			local var_64_0 = getProxy(LivingAreaCoverProxy):GetCover(arg_64_0.id)

			return var_64_0 and var_64_0:IsUnlock() and 1 or 0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_65_0)
			return getProxy(ApartmentProxy):getGiftCount(arg_65_0.id), true
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_66_0)
			local var_66_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_COMBAT_UI_STYLE, arg_66_0.id)

			return 1
		end
	}

	function var_0_0.CountDefault(arg_67_0)
		local var_67_0 = arg_67_0.type

		if var_67_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			return getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[var_67_0].activity_id):getVitemNumber(arg_67_0.id)
		else
			return 0, false
		end
	end

	var_0_0.SubClassCase = {
		[DROP_TYPE_RESOURCE] = function(arg_68_0)
			return
		end,
		[DROP_TYPE_ITEM] = function(arg_69_0)
			return Item.New(arg_69_0)
		end,
		[DROP_TYPE_VITEM] = function(arg_70_0)
			return Item.New(arg_70_0)
		end,
		[DROP_TYPE_EQUIP] = function(arg_71_0)
			return Equipment.New(arg_71_0)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_72_0)
			return Item.New({
				count = 1,
				id = arg_72_0.id,
				extra = arg_72_0.count
			})
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_73_0)
			return WorldItem.New(arg_73_0)
		end
	}

	function var_0_0.SubClassDefault(arg_74_0)
		assert(false, string.format("drop type %d without subClass", arg_74_0.type))
	end

	var_0_0.RarityCase = {
		[DROP_TYPE_RESOURCE] = function(arg_75_0)
			return arg_75_0:getConfig("rarity")
		end,
		[DROP_TYPE_ITEM] = function(arg_76_0)
			return arg_76_0:getConfig("rarity")
		end,
		[DROP_TYPE_EQUIP] = function(arg_77_0)
			return arg_77_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_SHIP] = function(arg_78_0)
			return arg_78_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_FURNITURE] = function(arg_79_0)
			return arg_79_0:getConfig("rarity")
		end,
		[DROP_TYPE_SKIN] = function(arg_80_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_81_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_VITEM] = function(arg_82_0)
			return arg_82_0:getConfig("rarity")
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_83_0)
			return arg_83_0:getConfig("rarity")
		end,
		[DROP_TYPE_BUFF] = function(arg_84_0)
			return ItemRarity.Purple
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_85_0)
			return arg_85_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_86_0)
			return arg_86_0:getConfig("rarity")
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_87_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_88_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_89_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_90_0)
			return arg_90_0:getConfig("rare")
		end
	}

	function var_0_0.RarityDefault(arg_91_0)
		return arg_91_0:getConfig("rarity") or ItemRarity.Gray
	end

	var_0_0.TransCase = {
		[DROP_TYPE_TRANS_ITEM] = function(arg_92_0)
			local var_92_0 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = arg_92_0:getConfig("resource_type"),
				count = arg_92_0:getConfig("resource_num") * arg_92_0.count
			})
			local var_92_1 = Drop.New({
				type = arg_92_0:getConfig("target_type"),
				id = arg_92_0:getConfig("target_id")
			})

			var_92_0.name = string.format("%s(%s)", var_92_0:getName(), var_92_1:getName())

			return var_92_0
		end,
		[DROP_TYPE_RESOURCE] = function(arg_93_0)
			for iter_93_0, iter_93_1 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)) do
				if pg.battlepass_event_pt[iter_93_1.id].pt == arg_93_0.id then
					return nil, arg_93_0
				end
			end

			return arg_93_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_94_0)
			if arg_94_0.id ~= 3 then
				return nil
			end

			return arg_94_0
		end,
		[DROP_TYPE_VITEM] = function(arg_95_0, arg_95_1, arg_95_2)
			assert(arg_95_0:getConfig("type") == 0, "item type error:must be virtual type from " .. arg_95_0.id)

			return switch(arg_95_0:getConfig("virtual_type"), {
				function()
					if arg_95_0:getConfig("link_id") == ActivityConst.LINLK_DUNHUANG_ACT then
						return nil, arg_95_0
					end

					return arg_95_0
				end,
				[6] = function()
					local var_97_0 = arg_95_2.taskId
					local var_97_1 = getProxy(ActivityProxy)
					local var_97_2 = var_97_1:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_97_2 then
						local var_97_3 = var_97_2.data1KeyValueList[1]

						var_97_3[var_97_0] = defaultValue(var_97_3[var_97_0], 0) + arg_95_0.count

						var_97_1:updateActivity(var_97_2)
					end

					return nil, arg_95_0
				end,
				[13] = function()
					local var_98_0 = arg_95_0:getName()

					if not SkinCouponActivity.StaticExistActivity() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_timeout_tip", var_98_0))

						return nil
					elseif SkinCouponActivity.StaticOwnMaxCntSkinCoupon() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_repeat_tip", var_98_0))

						return nil
					elseif SkinCouponActivity.StaticOwnAllSkin() then
						if arg_95_0.count > 1 then
							pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_repeat_tip", var_98_0))
						end

						return SkinCouponActivity.StaticGetEquivalentRes(), nil
					else
						return arg_95_0, nil
					end
				end,
				[21] = function()
					return nil, arg_95_0
				end,
				[28] = function()
					local var_100_0 = Drop.New({
						type = arg_95_0.type,
						id = arg_95_0.id,
						count = math.floor(arg_95_0.count / 1000)
					})
					local var_100_1 = Drop.New({
						type = arg_95_0.type,
						id = arg_95_0.id,
						count = arg_95_0.count - math.floor(arg_95_0.count / 1000)
					})

					return var_100_0, var_100_1
				end
			}, function()
				return arg_95_0
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_102_0, arg_102_1)
			if Ship.isMetaShipByConfigID(arg_102_0.id) and Player.isMetaShipNeedToTrans(arg_102_0.id) then
				local var_102_0 = table.indexof(arg_102_1, arg_102_0.id, 1)

				if var_102_0 then
					table.remove(arg_102_1, var_102_0)
				else
					local var_102_1 = Player.metaShip2Res(arg_102_0.id)
					local var_102_2 = Drop.New(var_102_1[1])

					getProxy(BayProxy):addMetaTransItemMap(arg_102_0.id, var_102_2)

					return arg_102_0, var_102_2
				end
			end

			return arg_102_0
		end,
		[DROP_TYPE_SKIN] = function(arg_103_0)
			arg_103_0.isNew = not getProxy(ShipSkinProxy):hasOldNonLimitSkin(arg_103_0.id)

			return arg_103_0
		end
	}

	function var_0_0.TransDefault(arg_104_0)
		return arg_104_0
	end

	var_0_0.AddItemCase = {
		[DROP_TYPE_RESOURCE] = function(arg_105_0)
			local var_105_0 = id2res(arg_105_0.id)

			assert(var_105_0, "res should be defined: " .. arg_105_0.id)

			local var_105_1 = getProxy(PlayerProxy)
			local var_105_2 = var_105_1:getData()

			var_105_2:addResources({
				[var_105_0] = arg_105_0.count
			})
			var_105_1:updatePlayer(var_105_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_106_0)
			if arg_106_0:getConfig("type") == Item.EXP_BOOK_TYPE then
				local var_106_0 = getProxy(BagProxy):getItemCountById(arg_106_0.id)
				local var_106_1 = math.min(arg_106_0:getConfig("max_num") - var_106_0, arg_106_0.count)

				if var_106_1 > 0 then
					getProxy(BagProxy):addItemById(arg_106_0.id, var_106_1)
				end
			else
				getProxy(BagProxy):addItemById(arg_106_0.id, arg_106_0.count, arg_106_0.extra)
			end
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_107_0)
			local var_107_0 = arg_107_0:getSubClass()

			getProxy(BagProxy):addItemById(var_107_0.id, var_107_0.count, var_107_0.extra)
		end,
		[DROP_TYPE_EQUIP] = function(arg_108_0)
			getProxy(EquipmentProxy):addEquipmentById(arg_108_0.id, arg_108_0.count)
		end,
		[DROP_TYPE_SHIP] = function(arg_109_0)
			return
		end,
		[DROP_TYPE_FURNITURE] = function(arg_110_0)
			local var_110_0 = getProxy(DormProxy)
			local var_110_1 = Furniture.New({
				id = arg_110_0.id,
				count = arg_110_0.count
			})

			if var_110_1:isRecordTime() then
				var_110_1.date = pg.TimeMgr.GetInstance():GetServerTime()
			end

			var_110_0:AddFurniture(var_110_1)
		end,
		[DROP_TYPE_SKIN] = function(arg_111_0)
			local var_111_0 = getProxy(ShipSkinProxy)
			local var_111_1 = ShipSkin.New({
				id = arg_111_0.id
			})

			var_111_0:addSkin(var_111_1)
		end,
		[DROP_TYPE_VITEM] = function(arg_112_0)
			arg_112_0 = arg_112_0:getSubClass()

			assert(arg_112_0:isVirtualItem(), "item type error(virtual item)>>" .. arg_112_0.id)
			switch(arg_112_0:getConfig("virtual_type"), {
				[0] = function()
					getProxy(ActivityProxy):addVitemById(arg_112_0.id, arg_112_0.count)
				end,
				function()
					local var_114_0 = getProxy(ActivityProxy)
					local var_114_1 = arg_112_0:getConfig("link_id")
					local var_114_2

					if var_114_1 > 0 then
						var_114_2 = var_114_0:getActivityById(var_114_1)
					else
						var_114_2 = var_114_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA)
					end

					if var_114_2 and not var_114_2:isEnd() then
						if not table.contains(var_114_2.data1_list, arg_112_0.id) then
							table.insert(var_114_2.data1_list, arg_112_0.id)
						end

						var_114_0:updateActivity(var_114_2)
					end
				end,
				function()
					local var_115_0 = getProxy(ActivityProxy)
					local var_115_1 = var_115_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_VOTE)

					for iter_115_0, iter_115_1 in ipairs(var_115_1) do
						iter_115_1.data1 = iter_115_1.data1 + arg_112_0.count

						local var_115_2 = iter_115_1:getConfig("config_id")
						local var_115_3 = pg.activity_vote[var_115_2]

						if var_115_3 and var_115_3.ticket_id_period == arg_112_0.id then
							iter_115_1.data3 = iter_115_1.data3 + arg_112_0.count
						end

						var_115_0:updateActivity(iter_115_1)
						pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_VOTE, {
							ptId = arg_112_0.id,
							ptCount = arg_112_0.count
						})
					end
				end,
				[4] = function()
					local var_116_0 = getProxy(ColoringProxy):getColorItems()

					var_116_0[arg_112_0.id] = (var_116_0[arg_112_0.id] or 0) + arg_112_0.count
				end,
				[6] = function()
					local var_117_0 = getProxy(ActivityProxy)
					local var_117_1 = var_117_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_117_1 then
						var_117_1.data3 = var_117_1.data3 + arg_112_0.count

						var_117_0:updateActivity(var_117_1)
					end
				end,
				[7] = function()
					local var_118_0 = getProxy(ChapterProxy)

					var_118_0:updateRemasterTicketsNum(math.min(var_118_0.remasterTickets + arg_112_0.count, pg.gameset.reactivity_ticket_max.key_value))
				end,
				[9] = function()
					local var_119_0 = getProxy(ActivityProxy)
					local var_119_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY)

					if var_119_1 then
						var_119_1.data1_list[1] = var_119_1.data1_list[1] + arg_112_0.count

						var_119_0:updateActivity(var_119_1)
					end
				end,
				[10] = function()
					local var_120_0 = getProxy(ActivityProxy)
					local var_120_1 = var_120_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM)

					if var_120_1 and not var_120_1:isEnd() then
						var_120_1.data1 = var_120_1.data1 + arg_112_0.count

						var_120_0:updateActivity(var_120_1)
						pg.m02:sendNotification(GAME.ACTIVITY_BE_UPDATED, {
							activity = var_120_1
						})
					end
				end,
				[11] = function()
					local var_121_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS)

					if var_121_0 and not var_121_0:isEnd() then
						var_121_0.data1 = var_121_0.data1 + arg_112_0.count
					end
				end,
				[12] = function()
					local var_122_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF)

					if var_122_0 and not var_122_0:isEnd() then
						var_122_0.data1KeyValueList[1][arg_112_0.id] = (var_122_0.data1KeyValueList[1][arg_112_0.id] or 0) + arg_112_0.count
					end
				end,
				[13] = function()
					SkinCouponActivity.AddSkinCoupon(arg_112_0.id)
				end,
				[14] = function()
					local var_124_0 = nowWorld():GetBossProxy()

					if WorldBossConst.WORLD_BOSS_ITEM_ID == arg_112_0.id then
						var_124_0:AddSummonPt(arg_112_0.count)
					elseif WorldBossConst.WORLD_PAST_BOSS_ITEM_ID == arg_112_0.id then
						var_124_0:AddSummonPtOld(arg_112_0.count)
					end
				end,
				[15] = function()
					local var_125_0 = getProxy(ActivityProxy)
					local var_125_1 = var_125_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE)

					if var_125_1 and not var_125_1:isEnd() then
						local var_125_2 = pg.activity_event_grid[var_125_1.data1]

						if arg_112_0.id == var_125_2.ticket_item then
							var_125_1.data2 = var_125_1.data2 + arg_112_0.count
						elseif arg_112_0.id == var_125_2.explore_item then
							var_125_1.data3 = var_125_1.data3 + arg_112_0.count
						end
					end

					var_125_0:updateActivity(var_125_1)
				end,
				[16] = function()
					local var_126_0 = getProxy(ActivityProxy)
					local var_126_1 = var_126_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHAKE_BEADS)

					for iter_126_0, iter_126_1 in pairs(var_126_1) do
						if iter_126_1 and not iter_126_1:isEnd() and arg_112_0.id == iter_126_1:getConfig("config_id") then
							iter_126_1.data1 = iter_126_1.data1 + arg_112_0.count

							var_126_0:updateActivity(iter_126_1)
						end
					end
				end,
				[20] = function()
					local var_127_0 = getProxy(BagProxy)
					local var_127_1 = pg.gameset.urpt_chapter_max.description
					local var_127_2 = var_127_1[1]
					local var_127_3 = var_127_1[2]
					local var_127_4 = var_127_0:GetLimitCntById(var_127_2)
					local var_127_5 = math.min(var_127_3 - var_127_4, arg_112_0.count)

					if var_127_5 > 0 then
						var_127_0:addItemById(var_127_2, var_127_5)
						var_127_0:AddLimitCnt(var_127_2, var_127_5)
					end
				end,
				[21] = function()
					local var_128_0 = getProxy(ActivityProxy)
					local var_128_1 = var_128_0:getActivityById(arg_112_0:getConfig("link_id"))

					if var_128_1 and not var_128_1:isEnd() then
						var_128_1.data2 = 1

						var_128_0:updateActivity(var_128_1)
					end
				end,
				[22] = function()
					local var_129_0 = getProxy(ActivityProxy)
					local var_129_1 = var_129_0:getActivityById(arg_112_0:getConfig("link_id"))

					if var_129_1 and not var_129_1:isEnd() then
						var_129_1.data1 = var_129_1.data1 + arg_112_0.count

						var_129_0:updateActivity(var_129_1)
					end
				end,
				[23] = function()
					local var_130_0 = (function()
						for iter_131_0, iter_131_1 in ipairs(pg.gameset.package_lv.description) do
							if arg_112_0.id == iter_131_1[1] then
								return iter_131_1[2]
							end
						end
					end)()

					assert(var_130_0)

					local var_130_1 = getProxy(PlayerProxy)
					local var_130_2 = var_130_1:getData()

					var_130_2:addExpToLevel(var_130_0)
					var_130_1:updatePlayer(var_130_2)
				end,
				[24] = function()
					local var_132_0 = arg_112_0:getConfig("link_id")
					local var_132_1 = getProxy(ActivityProxy):getActivityById(var_132_0)

					if var_132_1 and not var_132_1:isEnd() and var_132_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HOTSPRING then
						var_132_1.data2 = var_132_1.data2 + arg_112_0.count

						getProxy(ActivityProxy):updateActivity(var_132_1)
					end
				end,
				[25] = function()
					local var_133_0 = getProxy(ActivityProxy)
					local var_133_1 = var_133_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_FIREWORK)

					if var_133_1 and not var_133_1:isEnd() then
						var_133_1.data1 = var_133_1.data1 - 1

						if not table.contains(var_133_1.data1_list, arg_112_0.id) then
							table.insert(var_133_1.data1_list, arg_112_0.id)
						end

						var_133_0:updateActivity(var_133_1)

						local var_133_2 = arg_112_0:getConfig("link_id")

						if var_133_2 > 0 then
							local var_133_3 = var_133_0:getActivityById(var_133_2)

							if var_133_3 and not var_133_3:isEnd() then
								var_133_3.data1 = var_133_3.data1 + 1

								var_133_0:updateActivity(var_133_3)
							end
						end
					end
				end,
				[26] = function()
					local var_134_0 = getProxy(ActivityProxy)
					local var_134_1 = Clone(var_134_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING))

					if var_134_1 and not var_134_1:isEnd() then
						var_134_1.data1 = var_134_1.data1 + arg_112_0.count

						var_134_0:updateActivity(var_134_1)
					end
				end,
				[27] = function()
					local var_135_0 = getProxy(ActivityProxy)
					local var_135_1 = Clone(var_135_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_135_1 and not var_135_1:isEnd() then
						var_135_1:AddExp(arg_112_0.count)
						var_135_0:updateActivity(var_135_1)
					end
				end,
				[28] = function()
					local var_136_0 = getProxy(ActivityProxy)
					local var_136_1 = Clone(var_136_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_136_1 and not var_136_1:isEnd() then
						var_136_1:AddGold(arg_112_0.count)
						var_136_0:updateActivity(var_136_1)
					end
				end,
				[99] = function()
					return
				end,
				[100] = function()
					return
				end,
				[101] = function()
					local var_139_0 = arg_112_0:getConfig("link_id")
					local var_139_1 = getProxy(ActivityProxy):getActivityById(var_139_0)

					if var_139_1 and not var_139_1:isEnd() then
						var_139_1.data1 = var_139_1.data1 + arg_112_0.count

						getProxy(ActivityProxy):updateActivity(var_139_1)
					end
				end
			})
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_140_0)
			getProxy(EquipmentProxy):addEquipmentSkin(arg_140_0.id, arg_140_0.count)
		end,
		[DROP_TYPE_OPERATION] = function(arg_141_0)
			local var_141_0 = getProxy(BayProxy)
			local var_141_1 = var_141_0:getShipById(arg_141_0.count)

			if var_141_1 then
				var_141_1:unlockActivityNpc(0)
				var_141_0:updateShip(var_141_1)
				getProxy(CollectionProxy):flushCollection(var_141_1)
			end
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_142_0)
			nowWorld():GetInventoryProxy():AddItem(arg_142_0.id, arg_142_0.count)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_143_0)
			local var_143_0 = getProxy(AttireProxy)
			local var_143_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_143_2 = IconFrame.New({
				id = arg_143_0.id
			})
			local var_143_3 = var_143_1 + var_143_2:getConfig("time_second")

			var_143_2:updateData({
				isNew = true,
				end_time = var_143_3
			})
			var_143_0:addAttireFrame(var_143_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_143_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_144_0)
			local var_144_0 = getProxy(AttireProxy)
			local var_144_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_144_2 = ChatFrame.New({
				id = arg_144_0.id
			})
			local var_144_3 = var_144_1 + var_144_2:getConfig("time_second")

			var_144_2:updateData({
				isNew = true,
				end_time = var_144_3
			})
			var_144_0:addAttireFrame(var_144_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_144_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_145_0)
			getProxy(EmojiProxy):addNewEmojiID(arg_145_0.id)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_EMOJI, arg_145_0:getConfigTable())
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_146_0)
			nowWorld():GetCollectionProxy():Unlock(arg_146_0.id)
		end,
		[DROP_TYPE_META_PT] = function(arg_147_0)
			getProxy(MetaCharacterProxy):getMetaProgressVOByID(arg_147_0.id):addPT(arg_147_0.count)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_148_0)
			local var_148_0 = arg_148_0.id
			local var_148_1 = arg_148_0.count
			local var_148_2 = getProxy(ShipSkinProxy)
			local var_148_3 = var_148_2:getSkinById(var_148_0)

			if var_148_3 and var_148_3:isExpireType() then
				local var_148_4 = var_148_1 + var_148_3.endTime
				local var_148_5 = ShipSkin.New({
					id = var_148_0,
					end_time = var_148_4
				})

				var_148_2:addSkin(var_148_5)
			elseif not var_148_3 then
				local var_148_6 = var_148_1 + pg.TimeMgr.GetInstance():GetServerTime()
				local var_148_7 = ShipSkin.New({
					id = var_148_0,
					end_time = var_148_6
				})

				var_148_2:addSkin(var_148_7)
			end
		end,
		[DROP_TYPE_BUFF] = function(arg_149_0)
			local var_149_0 = arg_149_0.id
			local var_149_1 = pg.benefit_buff_template[var_149_0]

			assert(var_149_1 and var_149_1.act_id > 0, "should exist act id")

			local var_149_2 = getProxy(ActivityProxy):getActivityById(var_149_1.act_id)

			if var_149_2 and not var_149_2:isEnd() then
				local var_149_3 = var_149_1.max_time
				local var_149_4 = pg.TimeMgr.GetInstance():GetServerTime() + var_149_3

				var_149_2:AddBuff(ActivityBuff.New(var_149_2.id, var_149_0, var_149_4))
				getProxy(ActivityProxy):updateActivity(var_149_2)
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_150_0)
			return
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_151_0)
			local var_151_0 = getProxy(ApartmentProxy)
			local var_151_1 = var_151_0:getApartment(arg_151_0:getConfig("char_id"))

			var_151_1:AddFurnitureByID(arg_151_0.id)
			var_151_0:updateApartment(var_151_1)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_152_0)
			getProxy(ApartmentProxy):changeGiftCount(arg_152_0.id, arg_152_0.count)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_153_0)
			local var_153_0 = getProxy(ApartmentProxy)
			local var_153_1 = var_153_0:getApartment(arg_153_0:getConfig("ship_group"))

			var_153_1:addSkin(arg_153_0.id)
			var_153_0:updateApartment(var_153_1)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_154_0)
			local var_154_0 = getProxy(LivingAreaCoverProxy)
			local var_154_1 = LivingAreaCover.New({
				unlock = true,
				isNew = true,
				id = arg_154_0.id
			})

			var_154_0:UpdateCover(var_154_1)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COVER, var_154_1)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCover(arg_154_0.id, 1))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_155_0)
			local var_155_0 = getProxy(AttireProxy)
			local var_155_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_155_2 = CombatUIStyle.New({
				id = arg_155_0.id
			})

			var_155_2:setUnlock()
			var_155_2:setNew()
			var_155_0:addAttireFrame(var_155_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COMBAT_UI, var_155_2)
		end
	}

	function var_0_0.AddItemDefault(arg_156_0)
		if arg_156_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_156_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_156_0.type].activity_id)

			if arg_156_0.type == DROP_TYPE_RYZA_DROP then
				if var_156_0 and not var_156_0:isEnd() then
					var_156_0:AddItem(AtelierMaterial.New({
						configId = arg_156_0.id,
						count = arg_156_0.count
					}))
					getProxy(ActivityProxy):updateActivity(var_156_0)
				end
			elseif var_156_0 and not var_156_0:isEnd() then
				var_156_0:addVitemNumber(arg_156_0.id, arg_156_0.count)
				getProxy(ActivityProxy):updateActivity(var_156_0)
			end
		else
			print("can not handle this type>>" .. arg_156_0.type)
		end
	end

	var_0_0.MsgboxIntroCase = {
		[DROP_TYPE_RESOURCE] = function(arg_157_0, arg_157_1, arg_157_2)
			setText(arg_157_2, arg_157_0:getConfig("display"))
		end,
		[DROP_TYPE_ITEM] = function(arg_158_0, arg_158_1, arg_158_2)
			local var_158_0 = arg_158_0:getConfig("display")

			if arg_158_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				var_158_0 = string.gsub(var_158_0, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_158_0.extra))
			elseif arg_158_0:getConfig("combination_display") ~= nil then
				local var_158_1 = arg_158_0:getConfig("combination_display")

				if var_158_1 and #var_158_1 > 0 then
					var_158_0 = Item.StaticCombinationDisplay(var_158_1)
				end
			end

			setText(arg_158_2, SwitchSpecialChar(var_158_0, true))
		end,
		[DROP_TYPE_FURNITURE] = function(arg_159_0, arg_159_1, arg_159_2)
			setText(arg_159_2, arg_159_0:getConfig("describe"))
		end,
		[DROP_TYPE_SHIP] = function(arg_160_0, arg_160_1, arg_160_2)
			local var_160_0 = arg_160_0:getConfig("skin_id")
			local var_160_1, var_160_2, var_160_3 = ShipWordHelper.GetWordAndCV(var_160_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_160_2, var_160_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_OPERATION] = function(arg_161_0, arg_161_1, arg_161_2)
			local var_161_0 = arg_161_0:getConfig("skin_id")
			local var_161_1, var_161_2, var_161_3 = ShipWordHelper.GetWordAndCV(var_161_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_161_2, var_161_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_EQUIP] = function(arg_162_0, arg_162_1, arg_162_2)
			setText(arg_162_2, arg_162_1.name or arg_162_0:getConfig("name") or "")
		end,
		[DROP_TYPE_STRATEGY] = function(arg_163_0, arg_163_1, arg_163_2)
			local var_163_0 = arg_163_0:getConfig("desc")

			for iter_163_0, iter_163_1 in ipairs({
				arg_163_0.count
			}) do
				var_163_0 = string.gsub(var_163_0, "$" .. iter_163_0, iter_163_1)
			end

			setText(arg_163_2, var_163_0)
		end,
		[DROP_TYPE_SKIN] = function(arg_164_0, arg_164_1, arg_164_2)
			setText(arg_164_2, arg_164_0:getConfig("desc"))
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_165_0, arg_165_1, arg_165_2)
			setText(arg_165_2, arg_165_0:getConfig("desc"))
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_166_0, arg_166_1, arg_166_2)
			local var_166_0 = arg_166_0:getConfig("desc")
			local var_166_1 = _.map(arg_166_0:getConfig("equip_type"), function(arg_167_0)
				return EquipType.Type2Name2(arg_167_0)
			end)

			setText(arg_166_2, var_166_0 .. "\n\n" .. i18n("word_fit") .. ": " .. table.concat(var_166_1, ","))
		end,
		[DROP_TYPE_VITEM] = function(arg_168_0, arg_168_1, arg_168_2)
			setText(arg_168_2, arg_168_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_169_0, arg_169_1, arg_169_2)
			setText(arg_169_2, arg_169_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_170_0, arg_170_1, arg_170_2, arg_170_3)
			local var_170_0 = WorldCollectionProxy.GetCollectionType(arg_170_0.id) == WorldCollectionProxy.WorldCollectionType.FILE and "file" or "record"

			setText(arg_170_2, i18n("world_" .. var_170_0 .. "_desc", arg_170_0:getConfig("name")))
			setText(arg_170_3, i18n("world_" .. var_170_0 .. "_name", arg_170_0:getConfig("name")))
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_171_0, arg_171_1, arg_171_2)
			setText(arg_171_2, arg_171_0:getConfig("desc"))
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_172_0, arg_172_1, arg_172_2)
			setText(arg_172_2, arg_172_0:getConfig("desc"))
		end,
		[DROP_TYPE_EMOJI] = function(arg_173_0, arg_173_1, arg_173_2)
			setText(arg_173_2, arg_173_0:getConfig("item_desc"))
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_174_0, arg_174_1, arg_174_2)
			local var_174_0 = string.gsub(arg_174_0:getConfig("display"), "$1", ShipGroup.getDefaultShipNameByGroupID(arg_174_0.count))

			setText(arg_174_2, SwitchSpecialChar(var_174_0, true))
		end,
		[DROP_TYPE_META_PT] = function(arg_175_0, arg_175_1, arg_175_2)
			setText(arg_175_2, arg_175_0:getConfig("display"))
		end,
		[DROP_TYPE_BUFF] = function(arg_176_0, arg_176_1, arg_176_2)
			setText(arg_176_2, arg_176_0:getConfig("desc"))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_177_0, arg_177_1, arg_177_2)
			setText(arg_177_2, arg_177_0:getConfig("desc"))
		end
	}

	function var_0_0.MsgboxIntroDefault(arg_178_0, arg_178_1, arg_178_2)
		if arg_178_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			setText(arg_178_2, arg_178_0:getConfig("display"))
		else
			setText(arg_178_2, arg_178_0.desc or "")
		end
	end

	var_0_0.UpdateDropCase = {
		[DROP_TYPE_RESOURCE] = function(arg_179_0, arg_179_1, arg_179_2)
			if arg_179_0.id == PlayerConst.ResStoreGold or arg_179_0.id == PlayerConst.ResStoreOil then
				arg_179_2 = arg_179_2 or {}
				arg_179_2.frame = "frame_store"
			end

			updateItem(arg_179_1, Item.New({
				id = id2ItemId(arg_179_0.id)
			}), arg_179_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_180_0, arg_180_1, arg_180_2)
			updateItem(arg_180_1, arg_180_0:getSubClass(), arg_180_2)
		end,
		[DROP_TYPE_EQUIP] = function(arg_181_0, arg_181_1, arg_181_2)
			updateEquipment(arg_181_1, arg_181_0:getSubClass(), arg_181_2)
		end,
		[DROP_TYPE_SHIP] = function(arg_182_0, arg_182_1, arg_182_2)
			updateShip(arg_182_1, arg_182_0.ship, arg_182_2)
		end,
		[DROP_TYPE_OPERATION] = function(arg_183_0, arg_183_1, arg_183_2)
			updateShip(arg_183_1, arg_183_0.ship, arg_183_2)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_184_0, arg_184_1, arg_184_2)
			updateFurniture(arg_184_1, arg_184_0, arg_184_2)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_185_0, arg_185_1, arg_185_2)
			arg_185_2.isWorldBuff = arg_185_0.isWorldBuff

			updateStrategy(arg_185_1, arg_185_0, arg_185_2)
		end,
		[DROP_TYPE_SKIN] = function(arg_186_0, arg_186_1, arg_186_2)
			arg_186_2.isSkin = true
			arg_186_2.isNew = arg_186_0.isNew

			updateShip(arg_186_1, Ship.New({
				configId = tonumber(arg_186_0:getConfig("ship_group") .. "1"),
				skin_id = arg_186_0.id
			}), arg_186_2)
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_187_0, arg_187_1, arg_187_2)
			local var_187_0 = setmetatable({
				count = arg_187_0.count
			}, {
				__index = arg_187_0:getConfigTable()
			})

			updateEquipmentSkin(arg_187_1, var_187_0, arg_187_2)
		end,
		[DROP_TYPE_VITEM] = function(arg_188_0, arg_188_1, arg_188_2)
			updateItem(arg_188_1, Item.New({
				id = arg_188_0.id
			}), arg_188_2)
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_189_0, arg_189_1, arg_189_2)
			updateWorldItem(arg_189_1, WorldItem.New({
				id = arg_189_0.id
			}), arg_189_2)
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_190_0, arg_190_1, arg_190_2)
			updateWorldCollection(arg_190_1, arg_190_0, arg_190_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_191_0, arg_191_1, arg_191_2)
			updateAttire(arg_191_1, AttireConst.TYPE_CHAT_FRAME, arg_191_0:getConfigTable(), arg_191_2)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_192_0, arg_192_1, arg_192_2)
			updateAttire(arg_192_1, AttireConst.TYPE_ICON_FRAME, arg_192_0:getConfigTable(), arg_192_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_193_0, arg_193_1, arg_193_2)
			updateEmoji(arg_193_1, arg_193_0:getConfigTable(), arg_193_2)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_194_0, arg_194_1, arg_194_2)
			arg_194_2.count = 1

			updateItem(arg_194_1, arg_194_0:getSubClass(), arg_194_2)
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_195_0, arg_195_1, arg_195_2)
			updateSpWeapon(arg_195_1, SpWeapon.New({
				id = arg_195_0.id
			}), arg_195_2)
		end,
		[DROP_TYPE_META_PT] = function(arg_196_0, arg_196_1, arg_196_2)
			updateItem(arg_196_1, Item.New({
				id = arg_196_0:getConfig("id")
			}), arg_196_2)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_197_0, arg_197_1, arg_197_2)
			arg_197_2.isSkin = true
			arg_197_2.isTimeLimit = true
			arg_197_2.count = 1

			updateShip(arg_197_1, Ship.New({
				configId = tonumber(arg_197_0:getConfig("ship_group") .. "1"),
				skin_id = arg_197_0.id
			}), arg_197_2)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_198_0, arg_198_1, arg_198_2)
			AtelierMaterial.UpdateRyzaItem(arg_198_1, arg_198_0.item, arg_198_2)
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_199_0, arg_199_1, arg_199_2)
			WorkBenchItem.UpdateDrop(arg_199_1, arg_199_0.item, arg_199_2)
		end,
		[DROP_TYPE_FEAST_DROP] = function(arg_200_0, arg_200_1, arg_200_2)
			WorkBenchItem.UpdateDrop(arg_200_1, WorkBenchItem.New({
				configId = arg_200_0.id,
				count = arg_200_0.count
			}), arg_200_2)
		end,
		[DROP_TYPE_BUFF] = function(arg_201_0, arg_201_1, arg_201_2)
			updateBuff(arg_201_1, arg_201_0.id, arg_201_2)
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_202_0, arg_202_1, arg_202_2)
			updateCommander(arg_202_1, arg_202_0, arg_202_2)
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_203_0, arg_203_1, arg_203_2)
			updateDorm3dFurniture(arg_203_1, arg_203_0, arg_203_2)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_204_0, arg_204_1, arg_204_2)
			updateDorm3dGift(arg_204_1, arg_204_0, arg_204_2)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_205_0, arg_205_1, arg_205_2)
			updateDorm3dSkin(arg_205_1, arg_205_0, arg_205_2)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_206_0, arg_206_1, arg_206_2)
			updateCover(arg_206_1, arg_206_0, arg_206_2)
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_207_0, arg_207_1, arg_207_2)
			updateAttireCombatUI(arg_207_1, AttireConst.TYPE_ICON_FRAME, arg_207_0:getConfigTable(), arg_207_2)
		end
	}

	function var_0_0.UpdateDropDefault(arg_208_0, arg_208_1, arg_208_2)
		warning(string.format("without dropType %d in updateDrop", arg_208_0.type))
	end
end

return var_0_0
