local var_0_0 = class("SyncUnitStatic", import(".SyncUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.owners = {}

	arg_1_0:UpdateOwner(arg_1_1.slots)
end

function var_0_0.UpdateOwner(arg_2_0, arg_2_1)
	local var_2_0 = #arg_2_1 > table.getCount(arg_2_0.owners)
	local var_2_1

	if var_2_0 then
		for iter_2_0, iter_2_1 in ipairs(arg_2_1) do
			if not arg_2_0.owners[iter_2_1.slot_id] then
				arg_2_0.owners[iter_2_1.slot_id] = iter_2_1.owner_id
				var_2_1 = iter_2_1.owner_id

				break
			end
		end
	else
		local var_2_2 = {}

		for iter_2_2, iter_2_3 in ipairs(arg_2_1) do
			var_2_2[iter_2_3.slot_id] = iter_2_3.owner_id
		end

		for iter_2_4, iter_2_5 in pairs(arg_2_0.owners) do
			if not var_2_2[iter_2_4] then
				var_2_1 = iter_2_5
				arg_2_0.owners[iter_2_4] = nil

				break
			end
		end
	end

	return var_2_0, var_2_1
end

return var_0_0
