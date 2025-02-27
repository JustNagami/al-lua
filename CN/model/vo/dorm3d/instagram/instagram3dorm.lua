local var_0_0 = class("Instagram3Dorm", import("...BaseVO"))

var_0_0.OP_DISCUSS = 2
var_0_0.OP_READ = 3
var_0_0.OP_LIKE = 4
var_0_0.OP_SHARE = 5
var_0_0.OP_EXIT = 6

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_1.id
	arg_1_0.time = arg_1_1.time or 0
	arg_1_0.isRead = defaultValue(arg_1_1.read_flag, 0) == 1
	arg_1_0.isGood = defaultValue(arg_1_1.good_flag, 0) == 1
	arg_1_0.isLock = defaultValue(arg_1_2, true)
	arg_1_0.exitTime = arg_1_1.exit_time or 0

	local var_1_0 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.reply_list or {}) do
		if not var_1_0[iter_1_1.key] then
			var_1_0[iter_1_1.key] = {}
		end

		table.insert(var_1_0[iter_1_1.key], {
			index = iter_1_1.value,
			time = iter_1_1.time
		})
	end

	arg_1_0.replyedList = arg_1_0:BuildReplyedList(var_1_0)
	arg_1_0.replyableList = arg_1_0:BuildReplyableList(var_1_0)
	arg_1_0.unlockDesc = arg_1_0.isLock and arg_1_0:BuildUnlockDesc() or ""
end

function var_0_0.BuildUnlockDesc(arg_2_0)
	local var_2_0 = pg.dorm3d_ins_unlock.get_id_list_by_type[Dorm3dInsProxy.UNLOCK_TYPE_INS] or {}
	local var_2_1 = _.detect(var_2_0, function(arg_3_0)
		return pg.dorm3d_ins_unlock[arg_3_0].content == arg_2_0.configId
	end)

	if not var_2_1 then
		return ""
	end

	local var_2_2 = pg.dorm3d_ins_unlock[var_2_1].text

	return (HXSet.hxLan(var_2_2))
end

function var_0_0.GetUnLockConditionDesc(arg_4_0)
	return arg_4_0.unlockDesc
end

function var_0_0.IsLock(arg_5_0)
	return arg_5_0.isLock
end

function var_0_0.Unlock(arg_6_0, arg_6_1)
	arg_6_0.isLock = false
	arg_6_0.time = arg_6_1
end

function var_0_0.GetReplyedList(arg_7_0)
	return arg_7_0.replyedList
end

function var_0_0.ExistAnyReplyable(arg_8_0)
	return #arg_8_0.replyableList > 0
end

function var_0_0.GetReplyableList(arg_9_0)
	return arg_9_0.replyableList
end

function var_0_0.MarkReply(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.replyableList
	local var_10_1

	for iter_10_0 = #var_10_0, 1, -1 do
		if var_10_0[iter_10_0].id == arg_10_1 then
			table.remove(var_10_0, iter_10_0)
		end
	end

	local var_10_2 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_10_3 = arg_10_0:BuildPlayerComment(arg_10_1, arg_10_2, var_10_2)

	table.insert(arg_10_0.replyedList, var_10_3)
end

function var_0_0.BuildPlayerComment(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	local var_11_0 = pg.dorm3d_ins_player_template[arg_11_1]
	local var_11_1 = var_11_0.message[arg_11_2]
	local var_11_2 = var_11_0.npc_reply[arg_11_2]

	return InstagramPlayerComment3Dorm.New(arg_11_1, arg_11_2, 10000, var_11_1, arg_11_3, {
		var_11_2
	})
end

function var_0_0.BuildReplyedList(arg_12_0, arg_12_1)
	local var_12_0 = {}
	local var_12_1 = pg.dorm3d_ins_player_template

	for iter_12_0, iter_12_1 in pairs(arg_12_1) do
		for iter_12_2, iter_12_3 in ipairs(iter_12_1) do
			local var_12_2 = arg_12_0:BuildPlayerComment(iter_12_0, iter_12_3.index, iter_12_3.time)

			table.insert(var_12_0, var_12_2)
		end
	end

	local var_12_3 = arg_12_0:getConfig("npc_discuss")
	local var_12_4 = InstagramComment3Dorm.BuildNpcReplayList(var_12_3, arg_12_0.time)

	for iter_12_4, iter_12_5 in ipairs(var_12_4) do
		table.insert(var_12_0, iter_12_5)
	end

	return var_12_0
end

function var_0_0.BuildReplyableList(arg_13_0, arg_13_1)
	local var_13_0 = {}
	local var_13_1 = pg.dorm3d_ins_player_template

	for iter_13_0, iter_13_1 in pairs(arg_13_0:getConfig("discuss")) do
		if not arg_13_1[iter_13_1] then
			local var_13_2 = var_13_1[iter_13_1]

			for iter_13_2, iter_13_3 in ipairs(var_13_2.message) do
				local var_13_3 = pg.TimeMgr.GetInstance():GetServerTime()
				local var_13_4 = arg_13_0:BuildPlayerComment(iter_13_1, iter_13_2, var_13_3)

				table.insert(var_13_0, var_13_4)
			end
		end
	end

	return var_13_0
end

function var_0_0.bindConfigTable(arg_14_0)
	return pg.dorm3d_ins_template
end

function var_0_0.GetBackground(arg_15_0)
	return arg_15_0:getConfig("background")
end

function var_0_0.IsRead(arg_16_0)
	return arg_16_0.isRead
end

function var_0_0.IsGood(arg_17_0)
	return arg_17_0.isGood
end

function var_0_0.GetText(arg_18_0)
	local var_18_0 = arg_18_0:getConfig("message")
	local var_18_1 = pg.dorm3d_ins_language[var_18_0].value

	return (HXSet.hxLan(var_18_1))
end

function var_0_0.GetPicture(arg_19_0)
	return arg_19_0:getConfig("picture")
end

function var_0_0.GetName(arg_20_0)
	return arg_20_0:getConfig("name")
end

function var_0_0.GetIcon(arg_21_0)
	return arg_21_0:getConfig("sculpture")
end

function var_0_0.GetPushTime(arg_22_0)
	return InstagramTimeStamp(arg_22_0.time)
end

function var_0_0.LockState(arg_23_0)
	return arg_23_0.isLock and 0 or 1
end

function var_0_0.MarkRead(arg_24_0)
	arg_24_0.isRead = true
end

function var_0_0.MarkLike(arg_25_0)
	arg_25_0.isGood = true
end

function var_0_0.CanShow(arg_26_0)
	return true
end

function var_0_0.SetExitTime(arg_27_0, arg_27_1)
	arg_27_0.exitTime = arg_27_1
end

function var_0_0.ShouldTip(arg_28_0)
	if arg_28_0:IsLock() or not arg_28_0:CanShow() then
		return false
	end

	if not arg_28_0:IsRead() then
		return true
	end

	if _.any(arg_28_0.replyedList, function(arg_29_0)
		return arg_29_0:CanShow() and arg_29_0:ShouldTip(arg_28_0.exitTime)
	end) then
		return true
	end

	return false
end

return var_0_0
