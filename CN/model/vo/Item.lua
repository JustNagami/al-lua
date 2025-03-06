local var_0_0 = class("Item", import(".BaseVO"))

var_0_0.REVERT_EQUIPMENT_ID = 15007
var_0_0.COMMANDER_QUICKLY_TOOL_ID = 20010
var_0_0.QUICK_TASK_PASS_TICKET_ID = 15013
var_0_0.DOA_SELECT_CHAR_ID = 70144
var_0_0.INVISIBLE_TYPE = {
	[0] = true,
	[9] = true
}
var_0_0.PUZZLA_TYPE = 0
var_0_0.EQUIPMENT_BOX_TYPE_5 = 5
var_0_0.LESSON_TYPE = 10
var_0_0.EQUIPMENT_SKIN_BOX = 11
var_0_0.BLUEPRINT_TYPE = 12
var_0_0.ASSIGNED_TYPE = 13
var_0_0.GOLD_BOX_TYPE = 14
var_0_0.OIL_BOX_TYPE = 15
var_0_0.EQUIPMENT_ASSIGNED_TYPE = 16
var_0_0.GIFT_BOX = 17
var_0_0.TEC_SPEEDUP_TYPE = 18
var_0_0.SPECIAL_OPERATION_TICKET = 19
var_0_0.GUILD_OPENABLE = 20
var_0_0.INVITATION_TYPE = 21
var_0_0.EXP_BOOK_TYPE = 22
var_0_0.LOVE_LETTER_TYPE = 23
var_0_0.SPWEAPON_MATERIAL_TYPE = 24
var_0_0.METALESSON_TYPE = 25
var_0_0.SKIN_ASSIGNED_TYPE = 26

function var_0_0.Ctor(arg_1_0, arg_1_1)
	assert(not arg_1_1.type or arg_1_1.type == DROP_TYPE_VITEM or arg_1_1.type == DROP_TYPE_ITEM)

	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.count = arg_1_1.count
	arg_1_0.name = arg_1_1.name
	arg_1_0.extra = arg_1_1.extra

	arg_1_0:InitConfig()
end

function var_0_0.CanOpen(arg_2_0)
	local var_2_0 = arg_2_0:getConfig("type")

	return var_2_0 == var_0_0.EQUIPMENT_BOX_TYPE_5 or var_2_0 == var_0_0.EQUIPMENT_SKIN_BOX or var_2_0 == var_0_0.GOLD_BOX_TYPE or var_2_0 == var_0_0.OIL_BOX_TYPE or var_2_0 == var_0_0.GIFT_BOX or var_2_0 == var_0_0.GUILD_OPENABLE
end

function var_0_0.IsShipExpType(arg_3_0)
	return arg_3_0:getConfig("type") == var_0_0.EXP_BOOK_TYPE
end

function var_0_0.getConfigData(arg_4_0)
	local var_4_0 = {
		pg.item_virtual_data_statistics,
		pg.item_data_statistics
	}
	local var_4_1

	if underscore.any(var_4_0, function(arg_5_0)
		return arg_5_0[arg_4_0] ~= nil
	end) then
		var_4_1 = setmetatable({}, {
			__index = function(arg_6_0, arg_6_1)
				for iter_6_0, iter_6_1 in ipairs(var_4_0) do
					if iter_6_1[arg_4_0] and iter_6_1[arg_4_0][arg_6_1] ~= nil then
						arg_6_0[arg_6_1] = iter_6_1[arg_4_0][arg_6_1]

						return arg_6_0[arg_6_1]
					end
				end
			end
		})
	end

	return var_4_1
end

function var_0_0.InitConfig(arg_7_0)
	arg_7_0.cfg = var_0_0.getConfigData(arg_7_0.configId)

	assert(arg_7_0.cfg, string.format("without item config from id_%d", arg_7_0.id))
end

function var_0_0.getConfigTable(arg_8_0)
	return arg_8_0.cfg
end

function var_0_0.CanInBag(arg_9_0)
	return tobool(pg.item_data_statistics[arg_9_0])
end

function var_0_0.couldSell(arg_10_0)
	return table.getCount(arg_10_0:getConfig("price")) > 0
end

function var_0_0.GetPrice(arg_11_0)
	if arg_11_0:couldSell() then
		return arg_11_0:getConfig("price")
	else
		return nil
	end
end

function var_0_0.isEnough(arg_12_0, arg_12_1)
	return arg_12_1 <= arg_12_0.count
end

function var_0_0.consume(arg_13_0, arg_13_1)
	arg_13_0.count = arg_13_0.count - arg_13_1
end

function var_0_0.isDesignDrawing(arg_14_0)
	return arg_14_0:getConfig("type") == 9
end

function var_0_0.isVirtualItem(arg_15_0)
	return arg_15_0:getConfig("type") == 0
end

function var_0_0.isEquipmentSkinBox(arg_16_0)
	return arg_16_0:getConfig("type") == var_0_0.EQUIPMENT_SKIN_BOX
end

function var_0_0.isBluePrintType(arg_17_0)
	return arg_17_0:getConfig("type") == var_0_0.BLUEPRINT_TYPE
end

function var_0_0.isTecSpeedUpType(arg_18_0)
	return arg_18_0:getConfig("type") == var_0_0.TEC_SPEEDUP_TYPE
end

function var_0_0.IsMaxCnt(arg_19_0)
	return arg_19_0:getConfig("max_num") <= arg_19_0.count
end

function var_0_0.IsDoaSelectCharItem(arg_20_0)
	return arg_20_0.id == var_0_0.DOA_SELECT_CHAR_ID
end

function var_0_0.getConfig(arg_21_0, arg_21_1)
	if arg_21_1 == "display" then
		local var_21_0 = var_0_0.super.getConfig(arg_21_0, "combination_display")

		if var_21_0 and #var_21_0 > 0 then
			return arg_21_0:CombinationDisplay(var_21_0)
		end
	end

	return var_0_0.super.getConfig(arg_21_0, arg_21_1)
end

function var_0_0.StaticCombinationDisplay(arg_22_0)
	local var_22_0 = _.map(arg_22_0, function(arg_23_0)
		local var_23_0 = string.format("%0.2f", arg_23_0[2] / 100)
		local var_23_1 = ShipSkin.New({
			id = arg_23_0[1]
		})
		local var_23_2 = ""

		if var_23_1:IsLive2d() then
			var_23_2 = "（<color=#92fc63>" .. i18n("luckybag_skin_islive2d") .. "</color>）"
		elseif var_23_1:IsSpine() then
			var_23_2 = "（<color=#92fc63>" .. i18n("luckybag_skin_isani") .. "</color>）"
		end

		local var_23_3 = i18n("random_skin_list_item_desc_label")
		local var_23_4 = ""

		if var_23_1:ExistReward() then
			var_23_4 = i18n("word_show_extra_reward_at_fudai_dialog", var_23_1:GetRewardListDesc())
		end

		return "\n（<color=#92fc63>" .. var_23_0 .. "%%</color>）" .. var_23_1.shipName .. var_23_3 .. var_23_1.skinName .. var_23_2 .. var_23_4
	end)
	local var_22_1 = table.concat(var_22_0, ";")

	return i18n("skin_gift_desc", var_22_1)
end

function var_0_0.CombinationDisplay(arg_24_0, arg_24_1)
	return var_0_0.StaticCombinationDisplay(arg_24_1)
end

function var_0_0.InTimeLimitSkinAssigned(arg_25_0)
	local var_25_0 = var_0_0.getConfigData(arg_25_0)

	if var_25_0.type ~= var_0_0.SKIN_ASSIGNED_TYPE then
		return false
	end

	local var_25_1 = var_25_0.usage_arg[1]

	return getProxy(ActivityProxy):IsActivityNotEnd(var_25_1)
end

function var_0_0.GetValidSkinList(arg_26_0)
	assert(arg_26_0:getConfig("type") == var_0_0.SKIN_ASSIGNED_TYPE)

	local var_26_0 = arg_26_0:getConfig("usage_arg")

	if Item.InTimeLimitSkinAssigned(arg_26_0.id) then
		return table.mergeArray(var_26_0[2], var_26_0[3], true)
	else
		return underscore.rest(var_26_0[3], 1)
	end
end

function var_0_0.IsAllSkinOwner(arg_27_0)
	assert(arg_27_0:getConfig("type") == var_0_0.SKIN_ASSIGNED_TYPE)

	local var_27_0 = getProxy(ShipSkinProxy)

	return underscore.all(arg_27_0:GetValidSkinList(), function(arg_28_0)
		return var_27_0:hasNonLimitSkin(arg_28_0)
	end)
end

function var_0_0.GetOverflowCheckItems(arg_29_0, arg_29_1)
	arg_29_1 = arg_29_1 or 1

	local var_29_0 = {}

	if arg_29_0:getConfig("usage") == ItemUsage.DROP_TEMPLATE then
		local var_29_1, var_29_2, var_29_3 = unpack(arg_29_0:getConfig("usage_arg"))

		if var_29_2 > 0 then
			table.insert(var_29_0, {
				type = DROP_TYPE_RESOURCE,
				id = PlayerConst.ResGold,
				count = var_29_2 * arg_29_1
			})
		end

		if var_29_3 > 0 then
			table.insert(var_29_0, {
				type = DROP_TYPE_RESOURCE,
				id = PlayerConst.ResOil,
				count = var_29_3 * arg_29_1
			})
		end
	end

	switch(arg_29_0:getConfig("type"), {
		[Item.EQUIPMENT_BOX_TYPE_5] = function()
			table.insert(var_29_0, {
				type = DROP_TYPE_EQUIP,
				id = EQUIP_OCCUPATION_ID,
				count = arg_29_1
			})
		end,
		[Item.EQUIPMENT_ASSIGNED_TYPE] = function()
			table.insert(var_29_0, {
				type = DROP_TYPE_EQUIP,
				id = EQUIP_OCCUPATION_ID,
				count = arg_29_1
			})
		end
	})
	underscore.map(var_29_0, function(arg_32_0)
		return Drop.New(arg_32_0)
	end)

	return var_29_0
end

function var_0_0.IsSkinShopDiscountType(arg_33_0)
	return arg_33_0:getConfig("usage") == ItemUsage.SKIN_SHOP_DISCOUNT
end

function var_0_0.IsExclusiveDiscountType(arg_34_0)
	return arg_34_0:getConfig("usage") == ItemUsage.USAGE_SHOP_DISCOUNT
end

function var_0_0.IsSkinExperienceType(arg_35_0)
	return arg_35_0:getConfig("usage") == ItemUsage.USAGE_SKIN_EXP
end

function var_0_0.CanUseForShop(arg_36_0, arg_36_1)
	if arg_36_0:IsSkinShopDiscountType() then
		local var_36_0 = arg_36_0:getConfig("usage_arg")

		if not var_36_0 or type(var_36_0) ~= "table" then
			return false
		end

		local var_36_1 = var_36_0[1] or {}

		return #var_36_1 == 1 and var_36_1[1] == 0 or table.contains(var_36_1, arg_36_1)
	elseif arg_36_0:IsSkinExperienceType() then
		local var_36_2 = arg_36_0:getConfig("usage_arg")

		if not var_36_2 or type(var_36_2) ~= "table" then
			return false
		end

		return (var_36_2[1] or -1) == arg_36_1
	elseif arg_36_0:IsExclusiveDiscountType() then
		local var_36_3 = arg_36_0:getConfig("usage_arg")[1]

		if not var_36_3 or type(var_36_3) ~= "table" then
			return false
		end

		return (var_36_3[1] or -1) == arg_36_1
	end

	return false
end

function var_0_0.GetConsumeForSkinShopDiscount(arg_37_0, arg_37_1)
	if arg_37_0:IsSkinShopDiscountType() or arg_37_0:IsExclusiveDiscountType() and arg_37_0:CanUseForShop(arg_37_1) then
		local var_37_0 = pg.item_data_statistics[arg_37_0.configId].usage_arg[2] or 0
		local var_37_1 = Goods.Create({
			shop_id = arg_37_1
		}, Goods.TYPE_SKIN)

		return math.max(0, var_37_1:GetPrice() - var_37_0), var_37_1:getConfig("resource_type")
	else
		return 0
	end
end

function var_0_0.getName(arg_38_0)
	return arg_38_0.name or arg_38_0:getConfig("name")
end

function var_0_0.getIcon(arg_39_0)
	return arg_39_0:getConfig("Icon")
end

local var_0_1

function var_0_0.IsLoveLetterCheckItem(arg_40_0)
	if not var_0_1 then
		var_0_1 = {}

		for iter_40_0, iter_40_1 in ipairs(getGameset("loveletter_item_old_year")[2]) do
			local var_40_0, var_40_1 = unpack(iter_40_1)

			var_0_1[var_40_0] = underscore.flatten({
				var_40_1
			})
		end

		for iter_40_2, iter_40_3 in ipairs(pg.loveletter_2018_2021.all) do
			var_0_1[iter_40_3] = {
				pg.loveletter_2018_2021[iter_40_3].year
			}
		end
	end

	return var_0_1[arg_40_0]
end

return var_0_0
