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
	if arg_7_0.type == DROP_TYPE_ICON_FRAME then
		return "Props/icon_frame"
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

function var_0_0.getDropRarityDorm(arg_13_0)
	return switch(arg_13_0.type, var_0_0.RarityCase, var_0_0.RarityDefaultDorm, arg_13_0)
end

function var_0_0.DropTrans(arg_14_0, ...)
	return switch(arg_14_0.type, var_0_0.TransCase, var_0_0.TransDefault, arg_14_0, ...)
end

function var_0_0.AddItemOperation(arg_15_0)
	return switch(arg_15_0.type, var_0_0.AddItemCase, var_0_0.AddItemDefault, arg_15_0)
end

function var_0_0.MsgboxIntroSet(arg_16_0, ...)
	return switch(arg_16_0.type, var_0_0.MsgboxIntroCase, var_0_0.MsgboxIntroDefault, arg_16_0, ...)
end

function var_0_0.UpdateDropTpl(arg_17_0, ...)
	return switch(arg_17_0.type, var_0_0.UpdateDropCase, var_0_0.UpdateDropDefault, arg_17_0, ...)
end

function var_0_0.InitSwitch()
	var_0_0.inited = true
	var_0_0.ConfigCase = {
		[DROP_TYPE_RESOURCE] = function(arg_19_0)
			local var_19_0 = Item.getConfigData(id2ItemId(arg_19_0.id))

			arg_19_0.desc = var_19_0.display

			return var_19_0
		end,
		[DROP_TYPE_ITEM] = function(arg_20_0)
			local var_20_0 = Item.getConfigData(arg_20_0.id)

			arg_20_0.desc = var_20_0.display

			if var_20_0.type == Item.LOVE_LETTER_TYPE then
				arg_20_0.desc = string.gsub(arg_20_0.desc, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_20_0.extra))
			end

			return var_20_0
		end,
		[DROP_TYPE_VITEM] = function(arg_21_0)
			local var_21_0 = Item.getConfigData(arg_21_0.id)

			arg_21_0.desc = var_21_0.display

			return var_21_0
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_22_0)
			local var_22_0 = Item.getConfigData(arg_22_0.id)

			arg_22_0.desc = string.gsub(var_22_0.display, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_22_0.count))

			return var_22_0
		end,
		[DROP_TYPE_EQUIP] = function(arg_23_0)
			local var_23_0 = Equipment.getConfigData(arg_23_0.id)

			arg_23_0.desc = var_23_0.descrip

			return var_23_0
		end,
		[DROP_TYPE_SHIP] = function(arg_24_0)
			local var_24_0 = pg.ship_data_statistics[arg_24_0.id]
			local var_24_1, var_24_2, var_24_3 = ShipWordHelper.GetWordAndCV(var_24_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_24_0.desc = var_24_3 or i18n("ship_drop_desc_default")
			arg_24_0.ship = Ship.New({
				configId = arg_24_0.id,
				skin_id = arg_24_0.skinId,
				propose = arg_24_0.propose
			})
			arg_24_0.ship.remoulded = arg_24_0.remoulded
			arg_24_0.ship.virgin = arg_24_0.virgin

			return var_24_0
		end,
		[DROP_TYPE_FURNITURE] = function(arg_25_0)
			local var_25_0 = pg.furniture_data_template[arg_25_0.id]

			arg_25_0.desc = var_25_0.describe

			return var_25_0
		end,
		[DROP_TYPE_SKIN] = function(arg_26_0)
			local var_26_0 = pg.ship_skin_template[arg_26_0.id]
			local var_26_1, var_26_2, var_26_3 = ShipWordHelper.GetWordAndCV(arg_26_0.id, ShipWordHelper.WORD_TYPE_DROP)

			arg_26_0.desc = var_26_3

			return var_26_0
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_27_0)
			local var_27_0 = pg.ship_skin_template[arg_27_0.id]
			local var_27_1, var_27_2, var_27_3 = ShipWordHelper.GetWordAndCV(arg_27_0.id, ShipWordHelper.WORD_TYPE_DROP)

			arg_27_0.desc = var_27_3

			return var_27_0
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_28_0)
			local var_28_0 = pg.equip_skin_template[arg_28_0.id]

			arg_28_0.desc = var_28_0.desc

			return var_28_0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_29_0)
			local var_29_0 = pg.world_item_data_template[arg_29_0.id]

			arg_29_0.desc = var_29_0.display

			return var_29_0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_30_0)
			local var_30_0 = pg.item_data_frame[arg_30_0.id]

			arg_30_0.desc = var_30_0.desc

			return var_30_0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_31_0)
			return pg.item_data_chat[arg_31_0.id]
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_32_0)
			local var_32_0 = pg.spweapon_data_statistics[arg_32_0.id]

			arg_32_0.desc = var_32_0.descrip

			return var_32_0
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_33_0)
			local var_33_0 = pg.activity_ryza_item[arg_33_0.id]

			arg_33_0.item = AtelierMaterial.New({
				configId = arg_33_0.id
			})
			arg_33_0.desc = arg_33_0.item:GetDesc()

			return var_33_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_34_0)
			arg_34_0.ship = getProxy(BayProxy):getShipById(arg_34_0.count)

			local var_34_0 = pg.ship_data_statistics[arg_34_0.ship.configId]
			local var_34_1, var_34_2, var_34_3 = ShipWordHelper.GetWordAndCV(var_34_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_34_0.desc = var_34_3 or i18n("ship_drop_desc_default")

			return var_34_0
		end,
		[DROP_TYPE_STRATEGY] = function(arg_35_0)
			return arg_35_0.isWorldBuff and pg.world_SLGbuff_data[arg_35_0.id] or pg.strategy_data_template[arg_35_0.id]
		end,
		[DROP_TYPE_EMOJI] = function(arg_36_0)
			local var_36_0 = pg.emoji_template[arg_36_0.id]

			arg_36_0.name = var_36_0.item_name
			arg_36_0.desc = var_36_0.item_desc

			return var_36_0
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_37_0)
			local var_37_0 = WorldCollectionProxy.GetCollectionTemplate(arg_37_0.id)

			arg_37_0.desc = var_37_0.name

			return var_37_0
		end,
		[DROP_TYPE_META_PT] = function(arg_38_0)
			local var_38_0 = pg.ship_strengthen_meta[arg_38_0.id]
			local var_38_1 = Item.getConfigData(var_38_0.itemid)

			arg_38_0.desc = var_38_1.display

			return var_38_1
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_39_0)
			local var_39_0 = pg.activity_workbench_item[arg_39_0.id]

			arg_39_0.item = WorkBenchItem.New({
				configId = arg_39_0.id
			})
			arg_39_0.desc = arg_39_0.item:GetDesc()

			return var_39_0
		end,
		[DROP_TYPE_BUFF] = function(arg_40_0)
			local var_40_0 = pg.benefit_buff_template[arg_40_0.id]

			arg_40_0.desc = var_40_0.desc

			return var_40_0
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_41_0)
			local var_41_0 = pg.commander_data_template[arg_41_0.id]

			arg_41_0.desc = ""

			return var_41_0
		end,
		[DROP_TYPE_TRANS_ITEM] = function(arg_42_0)
			return pg.drop_data_restore[arg_42_0.id]
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_43_0)
			local var_43_0 = pg.dorm3d_furniture_template[arg_43_0.id]

			arg_43_0.desc = var_43_0.desc

			return var_43_0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_44_0)
			local var_44_0 = pg.dorm3d_gift[arg_44_0.id]

			arg_44_0.desc = var_44_0.display

			return var_44_0
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_45_0)
			local var_45_0 = pg.dorm3d_resource[arg_45_0.id]

			arg_45_0.desc = ""

			return var_45_0
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_46_0)
			local var_46_0 = pg.livingarea_cover[arg_46_0.id]

			arg_46_0.desc = var_46_0.desc

			return var_46_0
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_47_0)
			return pg.item_data_battleui[arg_47_0.id]
		end
	}

	function var_0_0.ConfigDefault(arg_48_0)
		local var_48_0 = arg_48_0.type

		if var_48_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_48_1 = pg.activity_drop_type[var_48_0].relevance

			return var_48_1 and pg[var_48_1][arg_48_0.id]
		end
	end

	var_0_0.CountCase = {
		[DROP_TYPE_RESOURCE] = function(arg_49_0)
			return getProxy(PlayerProxy):getRawData():getResById(arg_49_0.id), true
		end,
		[DROP_TYPE_ITEM] = function(arg_50_0)
			local var_50_0 = getProxy(BagProxy):getItemCountById(arg_50_0.id)

			if arg_50_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				return math.min(var_50_0, 1), true
			else
				return var_50_0, true
			end
		end,
		[DROP_TYPE_EQUIP] = function(arg_51_0)
			local var_51_0 = arg_51_0:getConfig("group")

			assert(pg.equip_data_template.get_id_list_by_group[var_51_0], "equip groupId not exist")

			local var_51_1 = pg.equip_data_template.get_id_list_by_group[var_51_0]

			return underscore.reduce(var_51_1, 0, function(arg_52_0, arg_52_1)
				local var_52_0 = getProxy(EquipmentProxy):getEquipmentById(arg_52_1)

				return arg_52_0 + (var_52_0 and var_52_0.count or 0) + getProxy(BayProxy):GetEquipCountInShips(arg_52_1)
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_53_0)
			return getProxy(BayProxy):getConfigShipCount(arg_53_0.id)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_54_0)
			return getProxy(DormProxy):getRawData():GetOwnFurnitureCount(arg_54_0.id)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_55_0)
			return arg_55_0.count, tobool(arg_55_0.count)
		end,
		[DROP_TYPE_SKIN] = function(arg_56_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_56_0.id)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_57_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_57_0.id)
		end,
		[DROP_TYPE_VITEM] = function(arg_58_0)
			if arg_58_0:getConfig("virtual_type") == 22 then
				local var_58_0 = getProxy(ActivityProxy):getActivityById(arg_58_0:getConfig("link_id"))

				return var_58_0 and var_58_0.data1 or 0, true
			end
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_59_0)
			local var_59_0 = getProxy(EquipmentProxy):getEquipmnentSkinById(arg_59_0.id)

			return (var_59_0 and var_59_0.count or 0) + getProxy(BayProxy):GetEquipSkinCountInShips(arg_59_0.id)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_60_0)
			local var_60_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_60_0.type].activity_id):GetItemById(arg_60_0.id)

			return var_60_0 and var_60_0.count or 0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_61_0)
			local var_61_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_ICON_FRAME, arg_61_0.id)

			return var_61_0 and (not var_61_0:expiredType() or not not var_61_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_62_0)
			local var_62_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_CHAT_FRAME, arg_62_0.id)

			return var_62_0 and (not var_62_0:expiredType() or not not var_62_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_63_0)
			local var_63_0 = nowWorld()

			if var_63_0.type ~= World.TypeFull then
				assert(false)

				return 0, false
			else
				return var_63_0:GetInventoryProxy():GetItemCount(arg_63_0.id), false
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_64_0)
			return getProxy(CommanderProxy):GetSameConfigIdCommanderCount(arg_64_0.id)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_65_0)
			local var_65_0 = getProxy(LivingAreaCoverProxy):GetCover(arg_65_0.id)

			return var_65_0 and var_65_0:IsUnlock() and 1 or 0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_66_0)
			return getProxy(ApartmentProxy):getGiftCount(arg_66_0.id), true
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_67_0)
			local var_67_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_COMBAT_UI_STYLE, arg_67_0.id)

			return 1
		end
	}

	function var_0_0.CountDefault(arg_68_0)
		local var_68_0 = arg_68_0.type

		if var_68_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			return getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[var_68_0].activity_id):getVitemNumber(arg_68_0.id)
		else
			return 0, false
		end
	end

	var_0_0.SubClassCase = {
		[DROP_TYPE_RESOURCE] = function(arg_69_0)
			return
		end,
		[DROP_TYPE_ITEM] = function(arg_70_0)
			return Item.New(arg_70_0)
		end,
		[DROP_TYPE_VITEM] = function(arg_71_0)
			return Item.New(arg_71_0)
		end,
		[DROP_TYPE_EQUIP] = function(arg_72_0)
			return Equipment.New(arg_72_0)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_73_0)
			return Item.New({
				count = 1,
				id = arg_73_0.id,
				extra = arg_73_0.count
			})
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_74_0)
			return WorldItem.New(arg_74_0)
		end
	}

	function var_0_0.SubClassDefault(arg_75_0)
		assert(false, string.format("drop type %d without subClass", arg_75_0.type))
	end

	var_0_0.RarityCase = {
		[DROP_TYPE_RESOURCE] = function(arg_76_0)
			return arg_76_0:getConfig("rarity")
		end,
		[DROP_TYPE_ITEM] = function(arg_77_0)
			return arg_77_0:getConfig("rarity")
		end,
		[DROP_TYPE_EQUIP] = function(arg_78_0)
			return arg_78_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_SHIP] = function(arg_79_0)
			return arg_79_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_FURNITURE] = function(arg_80_0)
			return arg_80_0:getConfig("rarity")
		end,
		[DROP_TYPE_SKIN] = function(arg_81_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_82_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_VITEM] = function(arg_83_0)
			return arg_83_0:getConfig("rarity")
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_84_0)
			return arg_84_0:getConfig("rarity")
		end,
		[DROP_TYPE_BUFF] = function(arg_85_0)
			return ItemRarity.Purple
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_86_0)
			return arg_86_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_87_0)
			return arg_87_0:getConfig("rarity")
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_88_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_89_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_90_0)
			return arg_90_0:getConfig("rare")
		end
	}

	function var_0_0.RarityDefault(arg_91_0)
		return arg_91_0:getConfig("rarity") or ItemRarity.Gray
	end

	function var_0_0.RarityDefaultDorm(arg_92_0)
		return arg_92_0:getConfig("rarity") or ItemRarity.Purple
	end

	var_0_0.TransCase = {
		[DROP_TYPE_TRANS_ITEM] = function(arg_93_0)
			local var_93_0 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = arg_93_0:getConfig("resource_type"),
				count = arg_93_0:getConfig("resource_num") * arg_93_0.count
			})
			local var_93_1 = Drop.New({
				type = arg_93_0:getConfig("target_type"),
				id = arg_93_0:getConfig("target_id")
			})

			var_93_0.name = string.format("%s(%s)", var_93_0:getName(), var_93_1:getName())

			return var_93_0
		end,
		[DROP_TYPE_RESOURCE] = function(arg_94_0)
			for iter_94_0, iter_94_1 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)) do
				if pg.battlepass_event_pt[iter_94_1.id].pt == arg_94_0.id then
					return nil, arg_94_0
				end
			end

			return arg_94_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_95_0)
			if arg_95_0.id ~= 3 then
				return nil
			end

			return arg_95_0
		end,
		[DROP_TYPE_EMOJI] = function(arg_96_0)
			return nil, arg_96_0
		end,
		[DROP_TYPE_VITEM] = function(arg_97_0, arg_97_1, arg_97_2)
			assert(arg_97_0:getConfig("type") == 0, "item type error:must be virtual type from " .. arg_97_0.id)

			return switch(arg_97_0:getConfig("virtual_type"), {
				function()
					if arg_97_0:getConfig("link_id") == ActivityConst.LINLK_DUNHUANG_ACT then
						return nil, arg_97_0
					end

					return arg_97_0
				end,
				[6] = function()
					local var_99_0 = arg_97_2.taskId
					local var_99_1 = getProxy(ActivityProxy)
					local var_99_2 = var_99_1:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_99_2 then
						local var_99_3 = var_99_2.data1KeyValueList[1]

						var_99_3[var_99_0] = defaultValue(var_99_3[var_99_0], 0) + arg_97_0.count

						var_99_1:updateActivity(var_99_2)
					end

					return nil, arg_97_0
				end,
				[13] = function()
					local var_100_0 = arg_97_0:getName()

					if not SkinCouponActivity.StaticExistActivity() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_timeout_tip", var_100_0))

						return nil
					elseif SkinCouponActivity.StaticOwnMaxCntSkinCoupon() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_repeat_tip", var_100_0))

						return nil
					elseif SkinCouponActivity.StaticOwnAllSkin() then
						if arg_97_0.count > 1 then
							pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_repeat_tip", var_100_0))
						end

						return SkinCouponActivity.StaticGetEquivalentRes(), nil
					else
						return arg_97_0, nil
					end
				end,
				[21] = function()
					return nil, arg_97_0
				end,
				[28] = function()
					local var_102_0 = Drop.New({
						type = arg_97_0.type,
						id = arg_97_0.id,
						count = math.floor(arg_97_0.count / 1000)
					})
					local var_102_1 = Drop.New({
						type = arg_97_0.type,
						id = arg_97_0.id,
						count = arg_97_0.count - math.floor(arg_97_0.count / 1000)
					})

					return var_102_0, var_102_1
				end
			}, function()
				return arg_97_0
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_104_0, arg_104_1)
			if Ship.isMetaShipByConfigID(arg_104_0.id) and Player.isMetaShipNeedToTrans(arg_104_0.id) then
				local var_104_0 = table.indexof(arg_104_1, arg_104_0.id, 1)

				if var_104_0 then
					table.remove(arg_104_1, var_104_0)
				else
					local var_104_1 = Player.metaShip2Res(arg_104_0.id)
					local var_104_2 = Drop.New(var_104_1[1])

					getProxy(BayProxy):addMetaTransItemMap(arg_104_0.id, var_104_2)

					return arg_104_0, var_104_2
				end
			end

			return arg_104_0
		end,
		[DROP_TYPE_SKIN] = function(arg_105_0)
			arg_105_0.isNew = not getProxy(ShipSkinProxy):hasOldNonLimitSkin(arg_105_0.id)

			return arg_105_0
		end
	}

	function var_0_0.TransDefault(arg_106_0)
		return arg_106_0
	end

	var_0_0.AddItemCase = {
		[DROP_TYPE_RESOURCE] = function(arg_107_0)
			local var_107_0 = id2res(arg_107_0.id)

			assert(var_107_0, "res should be defined: " .. arg_107_0.id)

			local var_107_1 = getProxy(PlayerProxy)
			local var_107_2 = var_107_1:getData()

			var_107_2:addResources({
				[var_107_0] = arg_107_0.count
			})
			var_107_1:updatePlayer(var_107_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_108_0)
			if arg_108_0:getConfig("type") == Item.EXP_BOOK_TYPE then
				local var_108_0 = getProxy(BagProxy):getItemCountById(arg_108_0.id)
				local var_108_1 = math.min(arg_108_0:getConfig("max_num") - var_108_0, arg_108_0.count)

				if var_108_1 > 0 then
					getProxy(BagProxy):addItemById(arg_108_0.id, var_108_1)
				end
			else
				getProxy(BagProxy):addItemById(arg_108_0.id, arg_108_0.count, arg_108_0.extra)
			end
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_109_0)
			local var_109_0 = arg_109_0:getSubClass()

			getProxy(BagProxy):addItemById(var_109_0.id, var_109_0.count, var_109_0.extra)
		end,
		[DROP_TYPE_EQUIP] = function(arg_110_0)
			getProxy(EquipmentProxy):addEquipmentById(arg_110_0.id, arg_110_0.count)
		end,
		[DROP_TYPE_SHIP] = function(arg_111_0)
			return
		end,
		[DROP_TYPE_FURNITURE] = function(arg_112_0)
			local var_112_0 = getProxy(DormProxy)
			local var_112_1 = Furniture.New({
				id = arg_112_0.id,
				count = arg_112_0.count
			})

			if var_112_1:isRecordTime() then
				var_112_1.date = pg.TimeMgr.GetInstance():GetServerTime()
			end

			var_112_0:AddFurniture(var_112_1)
		end,
		[DROP_TYPE_SKIN] = function(arg_113_0)
			local var_113_0 = getProxy(ShipSkinProxy)
			local var_113_1 = ShipSkin.New({
				id = arg_113_0.id
			})

			var_113_0:addSkin(var_113_1)
		end,
		[DROP_TYPE_VITEM] = function(arg_114_0)
			arg_114_0 = arg_114_0:getSubClass()

			assert(arg_114_0:isVirtualItem(), "item type error(virtual item)>>" .. arg_114_0.id)
			switch(arg_114_0:getConfig("virtual_type"), {
				[0] = function()
					getProxy(ActivityProxy):addVitemById(arg_114_0.id, arg_114_0.count)
				end,
				function()
					local var_116_0 = getProxy(ActivityProxy)
					local var_116_1 = arg_114_0:getConfig("link_id")
					local var_116_2

					if var_116_1 > 0 then
						var_116_2 = var_116_0:getActivityById(var_116_1)
					else
						var_116_2 = var_116_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA)
					end

					if var_116_2 and not var_116_2:isEnd() then
						if not table.contains(var_116_2.data1_list, arg_114_0.id) then
							table.insert(var_116_2.data1_list, arg_114_0.id)
						end

						var_116_0:updateActivity(var_116_2)
					end
				end,
				function()
					local var_117_0 = getProxy(ActivityProxy)
					local var_117_1 = var_117_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_VOTE)

					for iter_117_0, iter_117_1 in ipairs(var_117_1) do
						iter_117_1.data1 = iter_117_1.data1 + arg_114_0.count

						local var_117_2 = iter_117_1:getConfig("config_id")
						local var_117_3 = pg.activity_vote[var_117_2]

						if var_117_3 and var_117_3.ticket_id_period == arg_114_0.id then
							iter_117_1.data3 = iter_117_1.data3 + arg_114_0.count
						end

						var_117_0:updateActivity(iter_117_1)
						pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_VOTE, {
							ptId = arg_114_0.id,
							ptCount = arg_114_0.count
						})
					end
				end,
				[4] = function()
					local var_118_0 = getProxy(ColoringProxy):getColorItems()

					var_118_0[arg_114_0.id] = (var_118_0[arg_114_0.id] or 0) + arg_114_0.count
				end,
				[6] = function()
					local var_119_0 = getProxy(ActivityProxy)
					local var_119_1 = var_119_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_119_1 then
						var_119_1.data3 = var_119_1.data3 + arg_114_0.count

						var_119_0:updateActivity(var_119_1)
					end
				end,
				[7] = function()
					local var_120_0 = getProxy(ChapterProxy)

					var_120_0:updateRemasterTicketsNum(math.min(var_120_0.remasterTickets + arg_114_0.count, pg.gameset.reactivity_ticket_max.key_value))
				end,
				[9] = function()
					local var_121_0 = getProxy(ActivityProxy)
					local var_121_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY)

					if var_121_1 then
						var_121_1.data1_list[1] = var_121_1.data1_list[1] + arg_114_0.count

						var_121_0:updateActivity(var_121_1)
					end
				end,
				[10] = function()
					local var_122_0 = getProxy(ActivityProxy)
					local var_122_1 = var_122_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM)

					if var_122_1 and not var_122_1:isEnd() then
						var_122_1.data1 = var_122_1.data1 + arg_114_0.count

						var_122_0:updateActivity(var_122_1)
						pg.m02:sendNotification(GAME.ACTIVITY_BE_UPDATED, {
							activity = var_122_1
						})
					end
				end,
				[11] = function()
					local var_123_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS)

					if var_123_0 and not var_123_0:isEnd() then
						var_123_0.data1 = var_123_0.data1 + arg_114_0.count
					end
				end,
				[12] = function()
					local var_124_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF)

					if var_124_0 and not var_124_0:isEnd() then
						var_124_0.data1KeyValueList[1][arg_114_0.id] = (var_124_0.data1KeyValueList[1][arg_114_0.id] or 0) + arg_114_0.count
					end
				end,
				[13] = function()
					SkinCouponActivity.AddSkinCoupon(arg_114_0.id)
				end,
				[14] = function()
					local var_126_0 = nowWorld():GetBossProxy()

					if WorldBossConst.WORLD_BOSS_ITEM_ID == arg_114_0.id then
						var_126_0:AddSummonPt(arg_114_0.count)
					elseif WorldBossConst.WORLD_PAST_BOSS_ITEM_ID == arg_114_0.id then
						var_126_0:AddSummonPtOld(arg_114_0.count)
					end
				end,
				[15] = function()
					local var_127_0 = getProxy(ActivityProxy)
					local var_127_1 = var_127_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE)

					if var_127_1 and not var_127_1:isEnd() then
						local var_127_2 = pg.activity_event_grid[var_127_1.data1]

						if arg_114_0.id == var_127_2.ticket_item then
							var_127_1.data2 = var_127_1.data2 + arg_114_0.count
						elseif arg_114_0.id == var_127_2.explore_item then
							var_127_1.data3 = var_127_1.data3 + arg_114_0.count
						end
					end

					var_127_0:updateActivity(var_127_1)
				end,
				[16] = function()
					local var_128_0 = getProxy(ActivityProxy)
					local var_128_1 = var_128_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHAKE_BEADS)

					for iter_128_0, iter_128_1 in pairs(var_128_1) do
						if iter_128_1 and not iter_128_1:isEnd() and arg_114_0.id == iter_128_1:getConfig("config_id") then
							iter_128_1.data1 = iter_128_1.data1 + arg_114_0.count

							var_128_0:updateActivity(iter_128_1)
						end
					end
				end,
				[20] = function()
					local var_129_0 = getProxy(BagProxy)
					local var_129_1 = pg.gameset.urpt_chapter_max.description
					local var_129_2 = var_129_1[1]
					local var_129_3 = var_129_1[2]
					local var_129_4 = var_129_0:GetLimitCntById(var_129_2)
					local var_129_5 = math.min(var_129_3 - var_129_4, arg_114_0.count)

					if var_129_5 > 0 then
						var_129_0:addItemById(var_129_2, var_129_5)
						var_129_0:AddLimitCnt(var_129_2, var_129_5)
					end
				end,
				[21] = function()
					local var_130_0 = getProxy(ActivityProxy)
					local var_130_1 = var_130_0:getActivityById(arg_114_0:getConfig("link_id"))

					if var_130_1 and not var_130_1:isEnd() then
						var_130_1.data2 = 1

						var_130_0:updateActivity(var_130_1)
					end
				end,
				[22] = function()
					local var_131_0 = getProxy(ActivityProxy)
					local var_131_1 = var_131_0:getActivityById(arg_114_0:getConfig("link_id"))

					if var_131_1 and not var_131_1:isEnd() then
						var_131_1.data1 = var_131_1.data1 + arg_114_0.count

						var_131_0:updateActivity(var_131_1)
					end
				end,
				[23] = function()
					local var_132_0 = (function()
						for iter_133_0, iter_133_1 in ipairs(pg.gameset.package_lv.description) do
							if arg_114_0.id == iter_133_1[1] then
								return iter_133_1[2]
							end
						end
					end)()

					assert(var_132_0)

					local var_132_1 = getProxy(PlayerProxy)
					local var_132_2 = var_132_1:getData()

					var_132_2:addExpToLevel(var_132_0)
					var_132_1:updatePlayer(var_132_2)
				end,
				[24] = function()
					local var_134_0 = arg_114_0:getConfig("link_id")
					local var_134_1 = getProxy(ActivityProxy):getActivityById(var_134_0)

					if var_134_1 and not var_134_1:isEnd() and var_134_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HOTSPRING then
						var_134_1.data2 = var_134_1.data2 + arg_114_0.count

						getProxy(ActivityProxy):updateActivity(var_134_1)
					end
				end,
				[25] = function()
					local var_135_0 = getProxy(ActivityProxy)
					local var_135_1 = var_135_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_FIREWORK)

					if var_135_1 and not var_135_1:isEnd() then
						var_135_1.data1 = var_135_1.data1 - 1

						if not table.contains(var_135_1.data1_list, arg_114_0.id) then
							table.insert(var_135_1.data1_list, arg_114_0.id)
						end

						var_135_0:updateActivity(var_135_1)

						local var_135_2 = arg_114_0:getConfig("link_id")

						if var_135_2 > 0 then
							local var_135_3 = var_135_0:getActivityById(var_135_2)

							if var_135_3 and not var_135_3:isEnd() then
								var_135_3.data1 = var_135_3.data1 + 1

								var_135_0:updateActivity(var_135_3)
							end
						end
					end
				end,
				[26] = function()
					local var_136_0 = getProxy(ActivityProxy)
					local var_136_1 = Clone(var_136_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING))

					if var_136_1 and not var_136_1:isEnd() then
						var_136_1.data1 = var_136_1.data1 + arg_114_0.count

						var_136_0:updateActivity(var_136_1)
					end
				end,
				[27] = function()
					local var_137_0 = getProxy(ActivityProxy)
					local var_137_1 = Clone(var_137_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_137_1 and not var_137_1:isEnd() then
						var_137_1:AddExp(arg_114_0.count)
						var_137_0:updateActivity(var_137_1)
					end
				end,
				[28] = function()
					local var_138_0 = getProxy(ActivityProxy)
					local var_138_1 = Clone(var_138_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_138_1 and not var_138_1:isEnd() then
						var_138_1:AddGold(arg_114_0.count)
						var_138_0:updateActivity(var_138_1)
					end
				end,
				[99] = function()
					return
				end,
				[100] = function()
					return
				end,
				[101] = function()
					local var_141_0 = arg_114_0:getConfig("link_id")
					local var_141_1 = getProxy(ActivityProxy):getActivityById(var_141_0)

					if var_141_1 and not var_141_1:isEnd() then
						var_141_1.data1 = var_141_1.data1 + arg_114_0.count

						getProxy(ActivityProxy):updateActivity(var_141_1)
					end
				end
			})
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_142_0)
			getProxy(EquipmentProxy):addEquipmentSkin(arg_142_0.id, arg_142_0.count)
		end,
		[DROP_TYPE_OPERATION] = function(arg_143_0)
			local var_143_0 = getProxy(BayProxy)
			local var_143_1 = var_143_0:getShipById(arg_143_0.count)

			if var_143_1 then
				var_143_1:unlockActivityNpc(0)
				var_143_0:updateShip(var_143_1)
				getProxy(CollectionProxy):flushCollection(var_143_1)
			end
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_144_0)
			nowWorld():GetInventoryProxy():AddItem(arg_144_0.id, arg_144_0.count)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_145_0)
			local var_145_0 = getProxy(AttireProxy)
			local var_145_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_145_2 = IconFrame.New({
				id = arg_145_0.id
			})
			local var_145_3 = var_145_1 + var_145_2:getConfig("time_second")

			var_145_2:updateData({
				isNew = true,
				end_time = var_145_3
			})
			var_145_0:addAttireFrame(var_145_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_145_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_146_0)
			local var_146_0 = getProxy(AttireProxy)
			local var_146_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_146_2 = ChatFrame.New({
				id = arg_146_0.id
			})
			local var_146_3 = var_146_1 + var_146_2:getConfig("time_second")

			var_146_2:updateData({
				isNew = true,
				end_time = var_146_3
			})
			var_146_0:addAttireFrame(var_146_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_146_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_147_0)
			getProxy(EmojiProxy):addNewEmojiID(arg_147_0.id)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_EMOJI, arg_147_0:getConfigTable())
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_148_0)
			nowWorld():GetCollectionProxy():Unlock(arg_148_0.id)
		end,
		[DROP_TYPE_META_PT] = function(arg_149_0)
			getProxy(MetaCharacterProxy):getMetaProgressVOByID(arg_149_0.id):addPT(arg_149_0.count)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_150_0)
			local var_150_0 = arg_150_0.id
			local var_150_1 = arg_150_0.count
			local var_150_2 = getProxy(ShipSkinProxy)
			local var_150_3 = var_150_2:getSkinById(var_150_0)

			if var_150_3 and var_150_3:isExpireType() then
				local var_150_4 = var_150_1 + var_150_3.endTime
				local var_150_5 = ShipSkin.New({
					id = var_150_0,
					end_time = var_150_4
				})

				var_150_2:addSkin(var_150_5)
			elseif not var_150_3 then
				local var_150_6 = var_150_1 + pg.TimeMgr.GetInstance():GetServerTime()
				local var_150_7 = ShipSkin.New({
					id = var_150_0,
					end_time = var_150_6
				})

				var_150_2:addSkin(var_150_7)
			end
		end,
		[DROP_TYPE_BUFF] = function(arg_151_0)
			local var_151_0 = arg_151_0.id
			local var_151_1 = pg.benefit_buff_template[var_151_0]

			assert(var_151_1 and var_151_1.act_id > 0, "should exist act id")

			local var_151_2 = getProxy(ActivityProxy):getActivityById(var_151_1.act_id)

			if var_151_2 and not var_151_2:isEnd() then
				local var_151_3 = var_151_1.max_time
				local var_151_4 = pg.TimeMgr.GetInstance():GetServerTime() + var_151_3

				var_151_2:AddBuff(ActivityBuff.New(var_151_2.id, var_151_0, var_151_4))
				getProxy(ActivityProxy):updateActivity(var_151_2)
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_152_0)
			return
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_153_0)
			local var_153_0 = getProxy(ApartmentProxy)
			local var_153_1 = var_153_0:getRoom(arg_153_0:getConfig("room_id"))

			var_153_1:AddFurnitureByID(arg_153_0.id)
			var_153_0:updateRoom(var_153_1)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_154_0)
			getProxy(ApartmentProxy):changeGiftCount(arg_154_0.id, arg_154_0.count)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_155_0)
			local var_155_0 = getProxy(ApartmentProxy)
			local var_155_1 = var_155_0:getApartment(arg_155_0:getConfig("ship_group"))

			var_155_1:addSkin(arg_155_0.id)
			var_155_0:updateApartment(var_155_1)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_156_0)
			local var_156_0 = getProxy(LivingAreaCoverProxy)
			local var_156_1 = LivingAreaCover.New({
				unlock = true,
				isNew = true,
				id = arg_156_0.id
			})

			var_156_0:UpdateCover(var_156_1)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COVER, var_156_1)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCover(arg_156_0.id, 1))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_157_0)
			local var_157_0 = getProxy(AttireProxy)
			local var_157_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_157_2 = CombatUIStyle.New({
				id = arg_157_0.id
			})

			var_157_2:setUnlock()
			var_157_2:setNew()
			var_157_0:addAttireFrame(var_157_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COMBAT_UI, var_157_2)
		end
	}

	function var_0_0.AddItemDefault(arg_158_0)
		if arg_158_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_158_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_158_0.type].activity_id)

			if arg_158_0.type == DROP_TYPE_RYZA_DROP then
				if var_158_0 and not var_158_0:isEnd() then
					var_158_0:AddItem(AtelierMaterial.New({
						configId = arg_158_0.id,
						count = arg_158_0.count
					}))
					getProxy(ActivityProxy):updateActivity(var_158_0)
				end
			elseif var_158_0 and not var_158_0:isEnd() then
				var_158_0:addVitemNumber(arg_158_0.id, arg_158_0.count)
				getProxy(ActivityProxy):updateActivity(var_158_0)
			end
		else
			print("can not handle this type>>" .. arg_158_0.type)
		end
	end

	var_0_0.MsgboxIntroCase = {
		[DROP_TYPE_RESOURCE] = function(arg_159_0, arg_159_1, arg_159_2)
			setText(arg_159_2, arg_159_0:getConfig("display"))
		end,
		[DROP_TYPE_ITEM] = function(arg_160_0, arg_160_1, arg_160_2)
			local var_160_0 = arg_160_0:getConfig("display")

			if arg_160_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				var_160_0 = string.gsub(var_160_0, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_160_0.extra))
			elseif arg_160_0:getConfig("combination_display") ~= nil then
				local var_160_1 = arg_160_0:getConfig("combination_display")

				if var_160_1 and #var_160_1 > 0 then
					var_160_0 = Item.StaticCombinationDisplay(var_160_1)
				end
			end

			setText(arg_160_2, SwitchSpecialChar(var_160_0, true))
		end,
		[DROP_TYPE_FURNITURE] = function(arg_161_0, arg_161_1, arg_161_2)
			setText(arg_161_2, arg_161_0:getConfig("describe"))
		end,
		[DROP_TYPE_SHIP] = function(arg_162_0, arg_162_1, arg_162_2)
			local var_162_0 = arg_162_0:getConfig("skin_id")
			local var_162_1, var_162_2, var_162_3 = ShipWordHelper.GetWordAndCV(var_162_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_162_2, var_162_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_OPERATION] = function(arg_163_0, arg_163_1, arg_163_2)
			local var_163_0 = arg_163_0:getConfig("skin_id")
			local var_163_1, var_163_2, var_163_3 = ShipWordHelper.GetWordAndCV(var_163_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_163_2, var_163_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_EQUIP] = function(arg_164_0, arg_164_1, arg_164_2)
			setText(arg_164_2, arg_164_1.name or arg_164_0:getConfig("name") or "")
		end,
		[DROP_TYPE_STRATEGY] = function(arg_165_0, arg_165_1, arg_165_2)
			local var_165_0 = arg_165_0:getConfig("desc")

			for iter_165_0, iter_165_1 in ipairs({
				arg_165_0.count
			}) do
				var_165_0 = string.gsub(var_165_0, "$" .. iter_165_0, iter_165_1)
			end

			setText(arg_165_2, var_165_0)
		end,
		[DROP_TYPE_SKIN] = function(arg_166_0, arg_166_1, arg_166_2)
			setText(arg_166_2, arg_166_0:getConfig("desc"))
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_167_0, arg_167_1, arg_167_2)
			setText(arg_167_2, arg_167_0:getConfig("desc"))
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_168_0, arg_168_1, arg_168_2)
			local var_168_0 = arg_168_0:getConfig("desc")
			local var_168_1 = _.map(arg_168_0:getConfig("equip_type"), function(arg_169_0)
				return EquipType.Type2Name2(arg_169_0)
			end)

			setText(arg_168_2, var_168_0 .. "\n\n" .. i18n("word_fit") .. ": " .. table.concat(var_168_1, ","))
		end,
		[DROP_TYPE_VITEM] = function(arg_170_0, arg_170_1, arg_170_2)
			setText(arg_170_2, arg_170_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_171_0, arg_171_1, arg_171_2)
			setText(arg_171_2, arg_171_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_172_0, arg_172_1, arg_172_2, arg_172_3)
			local var_172_0 = WorldCollectionProxy.GetCollectionType(arg_172_0.id) == WorldCollectionProxy.WorldCollectionType.FILE and "file" or "record"

			setText(arg_172_2, i18n("world_" .. var_172_0 .. "_desc", arg_172_0:getConfig("name")))
			setText(arg_172_3, i18n("world_" .. var_172_0 .. "_name", arg_172_0:getConfig("name")))
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_173_0, arg_173_1, arg_173_2)
			setText(arg_173_2, arg_173_0:getConfig("desc"))
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_174_0, arg_174_1, arg_174_2)
			setText(arg_174_2, arg_174_0:getConfig("desc"))
		end,
		[DROP_TYPE_EMOJI] = function(arg_175_0, arg_175_1, arg_175_2)
			setText(arg_175_2, arg_175_0:getConfig("item_desc"))
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_176_0, arg_176_1, arg_176_2)
			local var_176_0 = string.gsub(arg_176_0:getConfig("display"), "$1", ShipGroup.getDefaultShipNameByGroupID(arg_176_0.count))

			setText(arg_176_2, SwitchSpecialChar(var_176_0, true))
		end,
		[DROP_TYPE_META_PT] = function(arg_177_0, arg_177_1, arg_177_2)
			setText(arg_177_2, arg_177_0:getConfig("display"))
		end,
		[DROP_TYPE_BUFF] = function(arg_178_0, arg_178_1, arg_178_2)
			setText(arg_178_2, arg_178_0:getConfig("desc"))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_179_0, arg_179_1, arg_179_2)
			setText(arg_179_2, arg_179_0:getConfig("desc"))
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_180_0, arg_180_1, arg_180_2)
			setText(arg_180_2, arg_180_0:getConfig("desc"))
		end
	}

	function var_0_0.MsgboxIntroDefault(arg_181_0, arg_181_1, arg_181_2)
		if arg_181_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			setText(arg_181_2, arg_181_0:getConfig("display"))
		else
			setText(arg_181_2, arg_181_0.desc or "")
		end
	end

	var_0_0.UpdateDropCase = {
		[DROP_TYPE_RESOURCE] = function(arg_182_0, arg_182_1, arg_182_2)
			if arg_182_0.id == PlayerConst.ResStoreGold or arg_182_0.id == PlayerConst.ResStoreOil then
				arg_182_2 = arg_182_2 or {}
				arg_182_2.frame = "frame_store"
			end

			updateItem(arg_182_1, Item.New({
				id = id2ItemId(arg_182_0.id)
			}), arg_182_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_183_0, arg_183_1, arg_183_2)
			updateItem(arg_183_1, arg_183_0:getSubClass(), arg_183_2)
		end,
		[DROP_TYPE_EQUIP] = function(arg_184_0, arg_184_1, arg_184_2)
			updateEquipment(arg_184_1, arg_184_0:getSubClass(), arg_184_2)
		end,
		[DROP_TYPE_SHIP] = function(arg_185_0, arg_185_1, arg_185_2)
			updateShip(arg_185_1, arg_185_0.ship, arg_185_2)
		end,
		[DROP_TYPE_OPERATION] = function(arg_186_0, arg_186_1, arg_186_2)
			updateShip(arg_186_1, arg_186_0.ship, arg_186_2)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_187_0, arg_187_1, arg_187_2)
			updateFurniture(arg_187_1, arg_187_0, arg_187_2)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_188_0, arg_188_1, arg_188_2)
			arg_188_2.isWorldBuff = arg_188_0.isWorldBuff

			updateStrategy(arg_188_1, arg_188_0, arg_188_2)
		end,
		[DROP_TYPE_SKIN] = function(arg_189_0, arg_189_1, arg_189_2)
			arg_189_2.isSkin = true
			arg_189_2.isNew = arg_189_0.isNew

			updateShip(arg_189_1, Ship.New({
				configId = tonumber(arg_189_0:getConfig("ship_group") .. "1"),
				skin_id = arg_189_0.id
			}), arg_189_2)
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_190_0, arg_190_1, arg_190_2)
			local var_190_0 = setmetatable({
				count = arg_190_0.count
			}, {
				__index = arg_190_0:getConfigTable()
			})

			updateEquipmentSkin(arg_190_1, var_190_0, arg_190_2)
		end,
		[DROP_TYPE_VITEM] = function(arg_191_0, arg_191_1, arg_191_2)
			updateItem(arg_191_1, Item.New({
				id = arg_191_0.id
			}), arg_191_2)
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_192_0, arg_192_1, arg_192_2)
			updateWorldItem(arg_192_1, WorldItem.New({
				id = arg_192_0.id
			}), arg_192_2)
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_193_0, arg_193_1, arg_193_2)
			updateWorldCollection(arg_193_1, arg_193_0, arg_193_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_194_0, arg_194_1, arg_194_2)
			updateAttire(arg_194_1, AttireConst.TYPE_CHAT_FRAME, arg_194_0:getConfigTable(), arg_194_2)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_195_0, arg_195_1, arg_195_2)
			updateAttire(arg_195_1, AttireConst.TYPE_ICON_FRAME, arg_195_0:getConfigTable(), arg_195_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_196_0, arg_196_1, arg_196_2)
			updateEmoji(arg_196_1, arg_196_0:getConfigTable(), arg_196_2)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_197_0, arg_197_1, arg_197_2)
			arg_197_2.count = 1

			updateItem(arg_197_1, arg_197_0:getSubClass(), arg_197_2)
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_198_0, arg_198_1, arg_198_2)
			updateSpWeapon(arg_198_1, SpWeapon.New({
				id = arg_198_0.id
			}), arg_198_2)
		end,
		[DROP_TYPE_META_PT] = function(arg_199_0, arg_199_1, arg_199_2)
			updateItem(arg_199_1, Item.New({
				id = arg_199_0:getConfig("id")
			}), arg_199_2)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_200_0, arg_200_1, arg_200_2)
			arg_200_2.isSkin = true
			arg_200_2.isTimeLimit = true
			arg_200_2.count = 1

			updateShip(arg_200_1, Ship.New({
				configId = tonumber(arg_200_0:getConfig("ship_group") .. "1"),
				skin_id = arg_200_0.id
			}), arg_200_2)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_201_0, arg_201_1, arg_201_2)
			AtelierMaterial.UpdateRyzaItem(arg_201_1, arg_201_0.item, arg_201_2)
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_202_0, arg_202_1, arg_202_2)
			WorkBenchItem.UpdateDrop(arg_202_1, arg_202_0.item, arg_202_2)
		end,
		[DROP_TYPE_FEAST_DROP] = function(arg_203_0, arg_203_1, arg_203_2)
			WorkBenchItem.UpdateDrop(arg_203_1, WorkBenchItem.New({
				configId = arg_203_0.id,
				count = arg_203_0.count
			}), arg_203_2)
		end,
		[DROP_TYPE_BUFF] = function(arg_204_0, arg_204_1, arg_204_2)
			updateBuff(arg_204_1, arg_204_0.id, arg_204_2)
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_205_0, arg_205_1, arg_205_2)
			updateCommander(arg_205_1, arg_205_0, arg_205_2)
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_206_0, arg_206_1, arg_206_2)
			updateDorm3dFurniture(arg_206_1, arg_206_0, arg_206_2)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_207_0, arg_207_1, arg_207_2)
			updateDorm3dGift(arg_207_1, arg_207_0, arg_207_2)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_208_0, arg_208_1, arg_208_2)
			updateDorm3dSkin(arg_208_1, arg_208_0, arg_208_2)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_209_0, arg_209_1, arg_209_2)
			updateCover(arg_209_1, arg_209_0, arg_209_2)
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_210_0, arg_210_1, arg_210_2)
			updateAttireCombatUI(arg_210_1, AttireConst.TYPE_ICON_FRAME, arg_210_0:getConfigTable(), arg_210_2)
		end
	}

	function var_0_0.UpdateDropDefault(arg_211_0, arg_211_1, arg_211_2)
		warning(string.format("without dropType %d in updateDrop", arg_211_0.type))
	end
end

return var_0_0
