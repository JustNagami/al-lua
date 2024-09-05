local var_0_0 = class("LivingAreaCoverProxy", import(".NetProxy"))

var_0_0.ON_UPDATE = "LivingAreaCoverProxy:ON_UPDATE"

function var_0_0.register(arg_1_0)
	arg_1_0.data = {}
	arg_1_0.coverId = 0

	for iter_1_0, iter_1_1 in ipairs(pg.livingarea_cover.all) do
		arg_1_0.data[iter_1_1] = LivingAreaCover.New({
			id = iter_1_1,
			unlock = iter_1_1 == 0
		})
	end

	arg_1_0:on(11003, function(arg_2_0)
		arg_1_0.coverId = arg_2_0.cover.id

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.cover.covers or {}) do
			arg_1_0.data[iter_2_1]:SetUnlock(true)
		end
	end)
end

function var_0_0.GetCoverId(arg_3_0)
	return arg_3_0.coverId
end

function var_0_0.GetCurCover(arg_4_0)
	return arg_4_0:GetCover(arg_4_0:GetCoverId()) or {
		id = 0,
		GetBg = function(arg_5_0)
			if arg_5_0 == LivingAreaCover.TYPE_DAY then
				return "livingareaCover/0_bg_day"
			else
				return "livingareaCover/0_bg_night"
			end
		end
	}
end

function var_0_0.UpdateCoverId(arg_6_0, arg_6_1)
	arg_6_0.coverId = arg_6_1
end

function var_0_0.GetCover(arg_7_0, arg_7_1)
	return arg_7_0.data[arg_7_1]
end

function var_0_0.GetCover(arg_8_0, arg_8_1)
	return arg_8_0.data[arg_8_1]
end

function var_0_0.GetUnlockList(arg_9_0)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in pairs(arg_9_0.data) do
		if iter_9_1:IsUnlock() then
			table.insert(var_9_0, iter_9_1)
		end
	end

	return var_9_0
end

function var_0_0.GetLockList(arg_10_0)
	local var_10_0 = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0.data) do
		if not iter_10_1:IsUnlock() then
			table.insert(var_10_0, iter_10_1)
		end
	end

	return var_10_0
end

function var_0_0.UpdateCover(arg_11_0, arg_11_1)
	arg_11_0.data[arg_11_1.id] = arg_11_1

	arg_11_0:sendNotification(var_0_0.ON_UPDATE)
end

function var_0_0.IsTip(arg_12_0)
	for iter_12_0, iter_12_1 in pairs(arg_12_0.data) do
		if iter_12_1:IsNew() then
			return true
		end
	end

	return false
end

function var_0_0.remove(arg_13_0)
	return
end

return var_0_0
