local var_0_0 = class("IslandOrderAgency", import(".IslandBaseAgency"))

var_0_0.GEN_NEW_ORDER = "IslandOrderAgency:GEN_NEW_ORDER"
var_0_0.UDPATE_ORDER = "IslandOrderAgency:UDPATE_ORDER"
var_0_0.ORDER_FINISH_UPDATE = "IslandOrderAgency:ORDER_FINISH_UPDATE"
var_0_0.COMMON_ORDER_TYPE = 1
var_0_0.URGENCY_ORDER_TYPE = 2
var_0_0.SHIP_ORDER_TYPE = 3

function var_0_0.OnInit(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.order_system or {}

	arg_1_0.exp = var_1_0.favor or 0
	arg_1_0.tendency = var_1_0.daily_select or IslandOrderSlot.TENDENCY_TYPE_COMMON
	arg_1_0.finishCnt = var_1_0.daily_slot_num or 0
	arg_1_0.urgencyFinishCnt = var_1_0.time_slot_num or 0
	arg_1_0.awardIndexList = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0.get_favor or {}) do
		table.insert(arg_1_0.awardIndexList, iter_1_1)
	end

	arg_1_0.slotList = {}

	for iter_1_2, iter_1_3 in ipairs(var_1_0.slot_list or {}) do
		local var_1_1 = IslandOrderSlot.New(iter_1_3)

		arg_1_0.slotList[var_1_1.id] = var_1_1
	end

	arg_1_0.shipSlotList = {}

	for iter_1_4, iter_1_5 in ipairs(pg.island_order_list.get_id_list_by_type[var_0_0.SHIP_ORDER_TYPE]) do
		local var_1_2 = IslandShipOrderSlot.New({
			id = iter_1_5
		})

		arg_1_0.shipSlotList[var_1_2.id] = var_1_2
	end

	for iter_1_6, iter_1_7 in ipairs(var_1_0.ship_slot_list or {}) do
		local var_1_3 = arg_1_0.shipSlotList[iter_1_7.id]

		if var_1_3 then
			var_1_3:Init(iter_1_7, true)
		end
	end
end

function var_0_0.GetShipSlotList(arg_2_0)
	return arg_2_0.shipSlotList
end

function var_0_0.GetShipOrderSlot(arg_3_0, arg_3_1)
	return arg_3_0.shipSlotList[arg_3_1]
end

function var_0_0.AddSlot(arg_4_0, arg_4_1)
	local var_4_0 = IslandOrderSlot.New(arg_4_1)

	arg_4_0.slotList[var_4_0.id] = var_4_0

	arg_4_0:DispatchEvent(var_0_0.GEN_NEW_ORDER, {
		slotId = var_4_0.id
	})
end

function var_0_0.UpdateSlot(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0.slotList[arg_5_1.id]

	var_5_0:Flush(arg_5_1)
	arg_5_0:DispatchEvent(var_0_0.UDPATE_ORDER, {
		slotId = var_5_0.id
	})
end

function var_0_0.RemoveSlot(arg_6_0, arg_6_1)
	arg_6_0.slotList[arg_6_1] = nil
end

function var_0_0.UpdateOrAddOrder(arg_7_0, arg_7_1)
	if arg_7_0.slotList[arg_7_1.id] then
		arg_7_0:AddSlot(arg_7_1)
	else
		arg_7_0:UpdateSlot(arg_7_1)
	end
end

function var_0_0.IncFinishCnt(arg_8_0)
	arg_8_0.finishCnt = arg_8_0.finishCnt + 1
end

function var_0_0.GetFinishCnt(arg_9_0)
	return arg_9_0.finishCnt
end

function var_0_0.GetMaxFinishCount(arg_10_0)
	return pg.island_set.order_daily_limit_num.key_value_int
end

function var_0_0.IncUrgencyFinishCnt(arg_11_0)
	arg_11_0.urgencyFinishCnt = arg_11_0.urgencyFinishCnt + 1
end

function var_0_0.GetUrgentFinishCnt(arg_12_0)
	return arg_12_0.urgencyFinishCnt
end

function var_0_0.GetMaxUrgentFinishCnt(arg_13_0)
	return pg.island_set.order_special_limit_num.key_value_int
end

function var_0_0.GetLeftUrgentCnt(arg_14_0)
	return arg_14_0:GetMaxUrgentFinishCnt() - arg_14_0:GetUrgentFinishCnt()
end

function var_0_0.GetTendency(arg_15_0)
	return arg_15_0.tendency
end

function var_0_0.SetTendency(arg_16_0, arg_16_1)
	arg_16_0.tendency = arg_16_1
end

function var_0_0.AddExp(arg_17_0, arg_17_1)
	if arg_17_0:IsMaxLevel() then
		return
	end

	arg_17_0.exp = arg_17_0.exp + arg_17_1
end

function var_0_0.GetExp(arg_18_0)
	return arg_18_0.exp
end

function var_0_0.GetTargetExp(arg_19_0)
	local var_19_0 = arg_19_0:GetLevel()

	return arg_19_0:StaticGetTargetExp(var_19_0)
end

function var_0_0.GetNextTargetExp(arg_20_0)
	if arg_20_0:IsMaxLevel() then
		return 0
	end

	local var_20_0 = arg_20_0:GetLevel()

	return arg_20_0:StaticGetTargetExp(var_20_0 + 1)
end

function var_0_0.StaticGetTargetExp(arg_21_0, arg_21_1)
	return pg.island_order_favor[arg_21_1].exp
end

function var_0_0.GetLevel(arg_22_0)
	local var_22_0 = 0

	for iter_22_0, iter_22_1 in ipairs(pg.island_order_favor.all) do
		local var_22_1 = pg.island_order_favor[iter_22_1]

		if arg_22_0.exp >= var_22_1.exp then
			var_22_0 = iter_22_1
		end
	end

	return var_22_0
end

function var_0_0.IsMaxLevel(arg_23_0)
	local var_23_0 = arg_23_0:GetLevel()

	return arg_23_0:StaticIsMaxLevel(var_23_0)
end

function var_0_0.StaticIsMaxLevel(arg_24_0, arg_24_1)
	local var_24_0 = pg.island_order_favor.all

	return arg_24_1 >= var_24_0[#var_24_0]
end

function var_0_0.GetSlots(arg_25_0)
	return arg_25_0.slotList
end

function var_0_0.GetSlot(arg_26_0, arg_26_1)
	return arg_26_0.slotList[arg_26_1]
end

function var_0_0.IsGotAward(arg_27_0, arg_27_1)
	return table.contains(arg_27_0.awardIndexList, arg_27_1)
end

function var_0_0.UpdateGotAwardList(arg_28_0, arg_28_1)
	if not arg_28_0:IsGotAward(arg_28_1) then
		table.insert(arg_28_0.awardIndexList, arg_28_1)
	end
end

function var_0_0.GetAllCanGetAwardList(arg_29_0)
	local var_29_0 = {}

	for iter_29_0, iter_29_1 in ipairs(pg.island_order_favor.all) do
		if arg_29_0:CanGetAward(iter_29_1) then
			table.insert(var_29_0, iter_29_1)
		end
	end

	return var_29_0
end

function var_0_0.CanGetAward(arg_30_0, arg_30_1)
	if arg_30_0:IsGotAward(arg_30_1) then
		return false
	end

	return arg_30_0:StaticGetTargetExp(arg_30_1) <= arg_30_0.exp
end

local var_0_1 = "island_next_submit_order_time"

function var_0_0.RecordNextCanSubmitTime(arg_31_0)
	local var_31_0 = getProxy(PlayerProxy):getRawData().id
	local var_31_1 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_31_2 = pg.island_set.order_complete_refresh_time.key_value_int

	PlayerPrefs.SetInt(var_0_1 .. var_31_0, var_31_1 + var_31_2)
	PlayerPrefs.Save()
end

function var_0_0.CanSubmitOrder(arg_32_0)
	local var_32_0 = getProxy(PlayerProxy):getRawData().id
	local var_32_1 = PlayerPrefs.GetInt(var_0_1 .. var_32_0, 0)
	local var_32_2 = pg.TimeMgr.GetInstance():GetServerTime()

	return var_32_1 <= 0 or var_32_1 <= var_32_2, var_32_1
end

local var_0_2 = "island_selected_order_id"

function var_0_0.GetCacheSelectedId(arg_33_0)
	local var_33_0 = getProxy(PlayerProxy):getRawData().id

	return (PlayerPrefs.GetInt(var_0_2 .. var_33_0, 0))
end

function var_0_0.SetCacheSelectedId(arg_34_0, arg_34_1)
	local var_34_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_0_2 .. var_34_0, arg_34_1)
	PlayerPrefs.Save()
end

function var_0_0.UpdatePerDay(arg_35_0)
	arg_35_0.finishCnt = 0

	if pg.TimeMgr.GetInstance():GetServerWeek() == 1 then
		arg_35_0.urgencyFinishCnt = 0
		arg_35_0.exp = 0
	end

	arg_35_0:DispatchEvent(var_0_0.ORDER_FINISH_UPDATE)
end

return var_0_0
