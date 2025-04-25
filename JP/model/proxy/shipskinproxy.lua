local var_0_0 = class("ShipSkinProxy", import(".NetProxy"))

var_0_0.SHIP_SKINS_UPDATE = "ship skins update"
var_0_0.SHIP_SKIN_EXPIRED = "ship skin expired"
var_0_0.FORBIDDEN_TYPE_HIDE = 0
var_0_0.FORBIDDEN_TYPE_SHOW = 1

function var_0_0.register(arg_1_0)
	arg_1_0.skins = {}
	arg_1_0.cacheSkins = {}
	arg_1_0.timers = {}
	arg_1_0.forbiddenSkinList = {}

	arg_1_0:on(12201, function(arg_2_0)
		_.each(arg_2_0.skin_list, function(arg_3_0)
			local var_3_0 = ShipSkin.New(arg_3_0)

			arg_1_0:addSkin(ShipSkin.New(arg_3_0))
		end)
		_.each(arg_2_0.forbidden_skin_list, function(arg_4_0)
			table.insert(arg_1_0.forbiddenSkinList, {
				id = arg_4_0,
				type = var_0_0.FORBIDDEN_TYPE_HIDE
			})
		end)

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.forbidden_skin_type) do
			arg_1_0.forbiddenSkinList[iter_2_0].type = iter_2_1
		end
	end)
end

function var_0_0.getOverDueSkins(arg_5_0)
	local var_5_0 = {}

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.cacheSkins) do
		table.insert(var_5_0, iter_5_1)
	end

	arg_5_0.cacheSkins = {}

	return var_5_0
end

function var_0_0.getRawData(arg_6_0)
	return arg_6_0.skins
end

function var_0_0.getSkinList(arg_7_0)
	return _.map(_.values(arg_7_0.skins), function(arg_8_0)
		return arg_8_0.id
	end)
end

function var_0_0.addSkin(arg_9_0, arg_9_1)
	assert(isa(arg_9_1, ShipSkin), "skin should be an instance of ShipSkin")

	if arg_9_0.prevNewSkin then
		arg_9_0.prevNewSkin:SetIsNew(false)
	end

	arg_9_0.skins[arg_9_1.id] = arg_9_1
	arg_9_0.prevNewSkin = arg_9_1

	arg_9_0:addExpireTimer(arg_9_1)

	if arg_9_1:getConfig("skin_type") == ShipSkin.SKIN_TYPE_TB then
		NewEducateHelper.UpdateUnlockBySkinId(arg_9_1.id)
	end

	arg_9_0.facade:sendNotification(var_0_0.SHIP_SKINS_UPDATE)
end

function var_0_0.getSkinById(arg_10_0, arg_10_1)
	return arg_10_0.skins[arg_10_1]
end

function var_0_0.addExpireTimer(arg_11_0, arg_11_1)
	arg_11_0:removeExpireTimer(arg_11_1.id)

	if not arg_11_1:isExpireType() then
		return
	end

	local function var_11_0()
		table.insert(arg_11_0.cacheSkins, arg_11_1)
		arg_11_0:removeSkinById(arg_11_1.id)

		local var_12_0 = getProxy(BayProxy)
		local var_12_1 = var_12_0:getShips()

		_.each(var_12_1, function(arg_13_0)
			if arg_13_0.skinId == arg_11_1.id then
				arg_13_0.skinId = arg_13_0:getConfig("skin_id")

				var_12_0:updateShip(arg_13_0)
			end
		end)
		arg_11_0:sendNotification(GAME.SHIP_SKIN_EXPIRED)
	end

	local var_11_1 = arg_11_1:getExpireTime() - pg.TimeMgr.GetInstance():GetServerTime()

	if var_11_1 <= 0 then
		var_11_0()
	else
		arg_11_0.timers[arg_11_1.id] = Timer.New(var_11_0, var_11_1, 1)

		arg_11_0.timers[arg_11_1.id]:Start()
	end
end

function var_0_0.removeExpireTimer(arg_14_0, arg_14_1)
	if arg_14_0.timers[arg_14_1] then
		arg_14_0.timers[arg_14_1]:Stop()

		arg_14_0.timers[arg_14_1] = nil
	end
end

function var_0_0.removeSkinById(arg_15_0, arg_15_1)
	arg_15_0.skins[arg_15_1] = nil

	arg_15_0:removeExpireTimer(arg_15_1)
	arg_15_0.facade:sendNotification(var_0_0.SHIP_SKINS_UPDATE)
end

function var_0_0.hasSkin(arg_16_0, arg_16_1)
	if ShipGroup.IsChangeSkin(arg_16_1) then
		local var_16_0 = ShipGroup.GetChangeSkinGroupId(arg_16_1)

		return arg_16_0:hasChangeSkin(var_16_0)
	end

	return arg_16_0.skins[arg_16_1] ~= nil
end

function var_0_0.hasChangeSkin(arg_17_0, arg_17_1)
	for iter_17_0, iter_17_1 in pairs(arg_17_0.skins) do
		if iter_17_1:IsChangeSkin() and ShipGroup.GetChangeSkinGroupId(iter_17_0) == arg_17_1 then
			return true
		end
	end

	return false
end

function var_0_0.hasNonLimitSkin(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0.skins[arg_18_1]

	return var_18_0 ~= nil and not var_18_0:isExpireType()
end

function var_0_0.hasOldNonLimitSkin(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.skins[arg_19_1]

	return var_19_0 and not var_19_0:HasNewFlag() and not var_19_0:isExpireType()
end

function var_0_0.getSkinCountById(arg_20_0, arg_20_1)
	return arg_20_0:hasSkin(arg_20_1) and 1 or 0
end

function var_0_0.InForbiddenSkinListAndHide(arg_21_0, arg_21_1)
	return _.any(arg_21_0.forbiddenSkinList, function(arg_22_0)
		return arg_22_0.id == arg_21_1 and arg_22_0.type == var_0_0.FORBIDDEN_TYPE_HIDE
	end)
end

function var_0_0.InForbiddenSkinListAndShow(arg_23_0, arg_23_1)
	return _.any(arg_23_0.forbiddenSkinList, function(arg_24_0)
		return arg_24_0.id == arg_23_1 and arg_24_0.type == var_0_0.FORBIDDEN_TYPE_SHOW
	end)
end

function var_0_0.InForbiddenSkinList(arg_25_0, arg_25_1)
	return _.any(arg_25_0.forbiddenSkinList, function(arg_26_0)
		return arg_26_0.id == arg_25_1
	end)
end

function var_0_0.remove(arg_27_0)
	for iter_27_0, iter_27_1 in pairs(arg_27_0.timers) do
		iter_27_1:Stop()
	end

	arg_27_0.timers = nil
end

function var_0_0.GetAllSkins(arg_28_0)
	local var_28_0 = {}

	local function var_28_1(arg_29_0)
		local var_29_0 = arg_29_0:getSkinId()
		local var_29_1 = getProxy(ShipSkinProxy):getSkinById(var_29_0)
		local var_29_2 = var_29_1 and not var_29_1:isExpireType() and 1 or 0

		arg_29_0:updateBuyCount(var_29_2)
	end

	local function var_28_2(arg_30_0)
		local var_30_0 = Goods.Create({
			shop_id = arg_30_0
		}, Goods.TYPE_SKIN)

		var_28_1(var_30_0)

		local var_30_1 = pg.shop_template[arg_30_0].collaboration_skin_time
		local var_30_2 = var_30_1 == "" or var_30_1 == pg.shop_template[arg_30_0].time
		local var_30_3, var_30_4 = pg.TimeMgr.GetInstance():inTime(pg.shop_template[arg_30_0].time)

		if var_30_2 and var_30_3 then
			table.insert(var_28_0, var_30_0)
		end
	end

	for iter_28_0, iter_28_1 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShop]) do
		var_28_2(iter_28_1)
	end

	for iter_28_2, iter_28_3 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShopTimeLimit]) do
		var_28_2(iter_28_3)
	end

	local var_28_3 = getProxy(ActivityProxy)
	local var_28_4 = pg.activity_shop_extra.get_id_list_by_commodity_type[DROP_TYPE_SKIN]

	for iter_28_4, iter_28_5 in ipairs(var_28_4) do
		local var_28_5 = pg.activity_shop_extra[iter_28_5]
		local var_28_6 = var_28_3:getActivityById(var_28_5.activity)

		if var_28_5.activity == 0 and pg.TimeMgr.GetInstance():inTime(var_28_5.time) or var_28_6 and not var_28_6:isEnd() then
			local var_28_7 = Goods.Create({
				shop_id = iter_28_5
			}, Goods.TYPE_ACTIVITY_EXTRA)

			var_28_1(var_28_7)
			table.insert(var_28_0, var_28_7)
		end
	end

	local var_28_8 = pg.activity_shop_template.get_id_list_by_commodity_type[DROP_TYPE_SKIN]

	for iter_28_6, iter_28_7 in ipairs(var_28_8) do
		local var_28_9 = pg.activity_shop_template[iter_28_7]
		local var_28_10 = var_28_3:getActivityById(var_28_9.activity)

		if var_28_10 and not var_28_10:isEnd() then
			local var_28_11 = Goods.Create({
				shop_id = iter_28_7
			}, Goods.TYPE_ACTIVITY)

			var_28_1(var_28_11)

			if not _.any(var_28_0, function(arg_31_0)
				return arg_31_0:getSkinId() == var_28_11:getSkinId()
			end) then
				table.insert(var_28_0, var_28_11)
			end
		end
	end

	for iter_28_8 = #var_28_0, 1, -1 do
		local var_28_12 = var_28_0[iter_28_8]:getSkinId()

		if arg_28_0:InForbiddenSkinList(var_28_12) or not arg_28_0:InShowTime(var_28_12) then
			table.remove(var_28_0, iter_28_8)
		end
	end

	return var_28_0
end

function var_0_0.GetShopShowingSkins(arg_32_0)
	local var_32_0 = {}

	local function var_32_1(arg_33_0)
		local var_33_0 = arg_33_0:getSkinId()
		local var_33_1 = getProxy(ShipSkinProxy):getSkinById(var_33_0)
		local var_33_2 = var_33_1 and not var_33_1:isExpireType() and 1 or 0

		arg_33_0:updateBuyCount(var_33_2)
	end

	local function var_32_2(arg_34_0)
		local var_34_0 = Goods.Create({
			shop_id = arg_34_0
		}, Goods.TYPE_SKIN)

		var_32_1(var_34_0)
		table.insert(var_32_0, var_34_0)
	end

	for iter_32_0, iter_32_1 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShop]) do
		var_32_2(iter_32_1)
	end

	for iter_32_2, iter_32_3 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShopTimeLimit]) do
		var_32_2(iter_32_3)
	end

	local var_32_3 = getProxy(ActivityProxy)
	local var_32_4 = pg.activity_shop_extra.get_id_list_by_commodity_type[DROP_TYPE_SKIN]

	for iter_32_4, iter_32_5 in ipairs(var_32_4) do
		local var_32_5 = Goods.Create({
			shop_id = iter_32_5
		}, Goods.TYPE_ACTIVITY_EXTRA)

		var_32_1(var_32_5)
		table.insert(var_32_0, var_32_5)
	end

	local var_32_6 = pg.activity_shop_template.get_id_list_by_commodity_type[DROP_TYPE_SKIN]

	for iter_32_6, iter_32_7 in ipairs(var_32_6) do
		local var_32_7 = Goods.Create({
			shop_id = iter_32_7
		}, Goods.TYPE_ACTIVITY)

		var_32_1(var_32_7)

		if not _.any(var_32_0, function(arg_35_0)
			return arg_35_0:getSkinId() == var_32_7:getSkinId()
		end) then
			table.insert(var_32_0, var_32_7)
		end
	end

	return var_32_0
end

function var_0_0.GetAllSkinForShip(arg_36_0, arg_36_1)
	assert(isa(arg_36_1, Ship), "ship should be an instance of Ship")

	local var_36_0 = arg_36_1.groupId
	local var_36_1 = ShipGroup.getSkinList(var_36_0)

	for iter_36_0 = #var_36_1, 1, -1 do
		local var_36_2 = var_36_1[iter_36_0]

		if var_36_2.skin_type == ShipSkin.SKIN_TYPE_NOT_HAVE_HIDE and not arg_36_0:hasSkin(var_36_2.id) then
			table.remove(var_36_1, iter_36_0)
		elseif not arg_36_0:InShowTime(var_36_2.id) then
			table.remove(var_36_1, iter_36_0)
		end
	end

	if pg.ship_data_trans[var_36_0] and not arg_36_1:isRemoulded() then
		local var_36_3 = ShipGroup.GetGroupConfig(var_36_0).trans_skin

		for iter_36_1 = #var_36_1, 1, -1 do
			if var_36_1[iter_36_1].id == var_36_3 then
				table.remove(var_36_1, iter_36_1)

				break
			end
		end
	end

	for iter_36_2 = #var_36_1, 1, -1 do
		local var_36_4 = var_36_1[iter_36_2]

		if var_36_4.show_time and (type(var_36_4.show_time) == "string" and var_36_4.show_time == "stop" or type(var_36_4.show_time) == "table" and not pg.TimeMgr.GetInstance():inTime(var_36_4.show_time)) then
			table.remove(var_36_1, iter_36_2)
		end

		if var_36_4.no_showing == "1" then
			table.remove(var_36_1, iter_36_2)
		elseif PLATFORM == PLATFORM_KR and pg.ship_skin_template[var_36_4.id].isHX == 1 then
			table.remove(var_36_1, iter_36_2)
		end
	end

	if PLATFORM_CODE == PLATFORM_CH then
		local var_36_5 = pg.gameset.big_seven_old_skin_timestamp.key_value

		for iter_36_3 = #var_36_1, 1, -1 do
			if var_36_1[iter_36_3].skin_type == ShipSkin.SKIN_TYPE_OLD and var_36_5 < arg_36_1.createTime then
				table.remove(var_36_1, iter_36_3)
			end
		end
	end

	if #arg_36_0.forbiddenSkinList > 0 then
		for iter_36_4 = #var_36_1, 1, -1 do
			local var_36_6 = var_36_1[iter_36_4].id

			if not arg_36_0:hasSkin(var_36_6) and arg_36_0:InForbiddenSkinListAndHide(var_36_6) then
				table.remove(var_36_1, iter_36_4)
			end
		end
	end

	for iter_36_5 = #var_36_1, 1, -1 do
		local var_36_7 = var_36_1[iter_36_5]

		if var_36_7 and var_36_7.change_skin and var_36_7.change_skin.group then
			local var_36_8 = var_36_7.change_skin.group
			local var_36_9 = ShipGroup.GetStoreChangeSkinId(var_36_8, arg_36_1.id)

			if var_36_9 and var_36_9 ~= var_36_7.id then
				print("有缓存的id = " .. var_36_9 .. "移除了id" .. var_36_7.id)
				table.remove(var_36_1, iter_36_5)
			elseif not var_36_9 and var_36_7.change_skin.index ~= 1 then
				print("没有缓存的id ，" .. "移除了id" .. var_36_7.id)
				table.remove(var_36_1, iter_36_5)
			end
		end
	end

	return var_36_1
end

function var_0_0.GetShareSkinsForShipGroup(arg_37_0, arg_37_1)
	local var_37_0 = pg.ship_data_group.get_id_list_by_group_type[arg_37_1][1]
	local var_37_1 = pg.ship_data_group[var_37_0]

	if not var_37_1.share_group_id or #var_37_1.share_group_id <= 0 then
		return {}
	end

	local var_37_2 = {}

	for iter_37_0, iter_37_1 in ipairs(var_37_1.share_group_id) do
		local var_37_3 = pg.ship_skin_template.get_id_list_by_ship_group[iter_37_1]

		for iter_37_2, iter_37_3 in ipairs(var_37_3) do
			local var_37_4 = ShipSkin.New({
				id = iter_37_3
			})

			if var_37_4:CanShare() then
				table.insert(var_37_2, var_37_4)
			end
		end
	end

	return var_37_2
end

function var_0_0.GetShareSkinsForShip(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_1.groupId

	return arg_38_0:GetShareSkinsForShipGroup(var_38_0)
end

function var_0_0.GetAllSkinForARCamera(arg_39_0, arg_39_1)
	local var_39_0 = ShipGroup.getSkinList(arg_39_1)

	for iter_39_0 = #var_39_0, 1, -1 do
		if var_39_0[iter_39_0].skin_type == ShipSkin.SKIN_TYPE_OLD then
			table.remove(var_39_0, iter_39_0)
		end
	end

	local var_39_1 = ShipGroup.GetGroupConfig(arg_39_1).trans_skin

	if var_39_1 ~= 0 then
		local var_39_2 = false
		local var_39_3 = getProxy(CollectionProxy):getShipGroup(arg_39_1)

		if var_39_3 then
			for iter_39_1, iter_39_2 in ipairs(var_39_0) do
				if iter_39_2.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_39_3.trans then
					var_39_2 = true

					break
				end
			end
		end

		if not var_39_2 then
			for iter_39_3 = #var_39_0, 1, -1 do
				if var_39_0[iter_39_3].id == var_39_1 then
					table.remove(var_39_0, iter_39_3)

					break
				end
			end
		end
	end

	for iter_39_4 = #var_39_0, 1, -1 do
		local var_39_4 = var_39_0[iter_39_4]

		if var_39_4.skin_type == ShipSkin.SKIN_TYPE_NOT_HAVE_HIDE and not arg_39_0:hasSkin(var_39_4.id) then
			table.remove(var_39_0, iter_39_4)
		elseif var_39_4.no_showing == "1" then
			table.remove(var_39_0, iter_39_4)
		elseif PLATFORM == PLATFORM_KR and pg.ship_skin_template[var_39_4.id].isHX == 1 then
			table.remove(var_39_0, iter_39_4)
		elseif not arg_39_0:InShowTime(var_39_4.id) then
			table.remove(var_39_0, iter_39_4)
		end
	end

	if #arg_39_0.forbiddenSkinList > 0 then
		for iter_39_5 = #var_39_0, 1, -1 do
			local var_39_5 = var_39_0[iter_39_5].id

			if not arg_39_0:hasSkin(var_39_5) and arg_39_0:InForbiddenSkinListAndHide(var_39_5) then
				table.remove(var_39_0, iter_39_5)
			end
		end
	end

	for iter_39_6 = #var_39_0, 1, -1 do
		local var_39_6 = var_39_0[iter_39_6]

		if var_39_6 and var_39_6.change_skin and var_39_6.change_skin.index and var_39_6.change_skin.index ~= 1 then
			table.remove(var_39_0, iter_39_6)
		end
	end

	return var_39_0
end

function var_0_0.InShowTime(arg_40_0, arg_40_1)
	local var_40_0 = pg.ship_skin_template_column_time[arg_40_1]

	if var_40_0 and var_40_0.time ~= "" and type(var_40_0.time) == "table" and #var_40_0.time > 0 then
		return pg.TimeMgr.GetInstance():passTime(var_40_0.time)
	end

	return true
end

function var_0_0.HasFashion(arg_41_0, arg_41_1)
	if #arg_41_0:GetShareSkinsForShip(arg_41_1) > 0 then
		return true
	end

	local var_41_0 = arg_41_0:GetAllSkinForShip(arg_41_1)

	if #var_41_0 == 1 then
		local var_41_1 = var_41_0[1]

		return (checkABExist("painting/" .. var_41_1.painting .. "_n"))
	end

	return #var_41_0 > 1
end

function var_0_0.GetEncoreSkins(arg_42_0)
	local var_42_0 = {}
	local var_42_1 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_BUFF)

	local function var_42_2(arg_43_0)
		local var_43_0 = arg_43_0:getConfig("config_client")

		if var_43_0 and var_43_0[1] and type(var_43_0[1]) == "table" then
			return pg.TimeMgr.GetInstance():parseTimeFromConfig(var_43_0[1]) <= pg.TimeMgr.GetInstance():GetServerTime()
		else
			return arg_43_0:isEnd()
		end
	end

	for iter_42_0, iter_42_1 in ipairs(var_42_1) do
		if iter_42_1:getDataConfig("type") == 5 and not var_42_2(iter_42_1) then
			for iter_42_2, iter_42_3 in ipairs(iter_42_1:getConfig("config_data")) do
				table.insert(var_42_0, iter_42_3)
			end
		end
	end

	local var_42_3 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SKIN_COUPON_COUNTING)

	for iter_42_4, iter_42_5 in ipairs(var_42_3) do
		if iter_42_5 and not iter_42_5:isEnd() then
			for iter_42_6, iter_42_7 in ipairs(iter_42_5:getConfig("config_data")[2]) do
				if not table.contains(var_42_0, iter_42_7) then
					table.insert(var_42_0, iter_42_7)
				end
			end
		end
	end

	return var_42_0
end

function var_0_0.GetOwnSkins(arg_44_0)
	local var_44_0 = {}
	local var_44_1 = arg_44_0:getRawData()

	for iter_44_0, iter_44_1 in pairs(var_44_1) do
		table.insert(var_44_0, iter_44_1)
	end

	local var_44_2 = getProxy(CollectionProxy).shipGroups

	for iter_44_2, iter_44_3 in pairs(var_44_2) do
		if iter_44_3.married == 1 then
			local var_44_3 = ShipGroup.getProposeSkin(iter_44_3.id)

			if var_44_3 then
				table.insert(var_44_0, ShipSkin.New({
					id = var_44_3.id
				}))
			end
		end

		if iter_44_3.trans then
			local var_44_4 = pg.ship_data_trans[iter_44_3.id].skin_id

			table.insert(var_44_0, ShipSkin.New({
				id = var_44_4
			}))
		end
	end

	return var_44_0
end

function var_0_0.GetOwnAndShareSkins(arg_45_0)
	local var_45_0 = arg_45_0:GetOwnSkins()
	local var_45_1 = {}

	for iter_45_0, iter_45_1 in ipairs(var_45_0) do
		var_45_1[iter_45_1.id] = iter_45_1
	end

	local var_45_2 = getProxy(CollectionProxy).shipGroups

	for iter_45_2, iter_45_3 in pairs(var_45_2) do
		if iter_45_3.married == 1 then
			local var_45_3 = arg_45_0:GetShareSkinsForShipGroup(iter_45_3.id)

			for iter_45_4, iter_45_5 in ipairs(var_45_3) do
				if not var_45_1[iter_45_5.id] then
					table.insert(var_45_0, iter_45_5)
				end
			end
		end
	end

	return var_45_0
end

function var_0_0.GetProbabilitySkins(arg_46_0, arg_46_1)
	local var_46_0 = {}

	local function var_46_1(arg_47_0)
		local var_47_0 = arg_47_0:getSkinId()
		local var_47_1 = getProxy(ShipSkinProxy):getSkinById(var_47_0)
		local var_47_2 = var_47_1 and not var_47_1:isExpireType() and 1 or 0

		arg_47_0:updateBuyCount(var_47_2)
	end

	local function var_46_2(arg_48_0)
		local var_48_0 = Goods.Create({
			shop_id = arg_48_0
		}, Goods.TYPE_SKIN)

		var_46_1(var_48_0)

		local var_48_1, var_48_2 = pg.TimeMgr.GetInstance():inTime(pg.shop_template[arg_48_0].time)

		if var_48_1 then
			table.insert(var_46_0, var_48_0)
		end
	end

	local var_46_3 = getProxy(ShipSkinProxy):GetAllSkins()
	local var_46_4 = {}

	for iter_46_0, iter_46_1 in ipairs(var_46_3) do
		if iter_46_1:getConfig("genre") ~= ShopArgs.SkinShopTimeLimit then
			var_46_4[iter_46_1:getSkinId()] = iter_46_1.id
		end
	end

	for iter_46_2, iter_46_3 in ipairs(arg_46_1) do
		local var_46_5 = var_46_4[iter_46_3[1]]

		if var_46_5 then
			var_46_2(var_46_5)
		end
	end

	return var_46_0
end

function var_0_0.GetSkinProbabilitys(arg_49_0, arg_49_1)
	local var_49_0 = {}

	for iter_49_0, iter_49_1 in ipairs(arg_49_1) do
		var_49_0[iter_49_1[1]] = iter_49_1[2]
	end

	return var_49_0
end

return var_0_0
