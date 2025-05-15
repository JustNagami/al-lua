local var_0_0 = class("AgoraFurniture", import(".AgoraPlaceableItem"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.configId = arg_1_1.configId
	arg_1_0.config = pg.island_furniture_template[arg_1_0.configId]

	var_0_0.super.Ctor(arg_1_0, arg_1_1, Vector2(arg_1_0.config.size[1], arg_1_0.config.size[2]))

	arg_1_0.slots = {}

	arg_1_0:InitSlots()
end

function var_0_0.InitSlots(arg_2_0)
	for iter_2_0 = 1, arg_2_0.config.slot_cnt do
		table.insert(arg_2_0.slots, AgoraFurnitureSlot.New(iter_2_0, arg_2_0.id))
	end
end

function var_0_0.GetEmptySlot(arg_3_0)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0.slots) do
		if iter_3_1:IsEmpty() then
			return iter_3_1
		end
	end

	return nil
end

function var_0_0.GetUsingSlot(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in ipairs(arg_4_0.slots) do
		if not iter_4_1:IsEmpty() and iter_4_1:IsUsing(arg_4_1) then
			return iter_4_1
		end
	end

	return nil
end

function var_0_0.AnySlotUsing(arg_5_0)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0.slots) do
		if not iter_5_1:IsEmpty() then
			return true
		end
	end

	return false
end

function var_0_0.HasBt(arg_6_0)
	return arg_6_0.config.bt ~= nil and arg_6_0.config.bt ~= ""
end

function var_0_0.GetBt(arg_7_0)
	return arg_7_0.config.bt
end

function var_0_0.GetResPath(arg_8_0)
	return arg_8_0.config.model
end

function var_0_0.HasTimeline(arg_9_0)
	return arg_9_0.config.timeline ~= nil and arg_9_0.config.timeline ~= ""
end

function var_0_0.GetTimeline(arg_10_0)
	return arg_10_0.config.timeline
end

function var_0_0.GetName(arg_11_0)
	return arg_11_0.config.name
end

return var_0_0
