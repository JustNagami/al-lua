local var_0_0 = class("MailProxy", import(".NetProxy"))

var_0_0.MAIL_TOTAL = "mail total"
var_0_0.MAIL_OPENNED = "mail openned"
var_0_0.MAIL_ATTACHMENT_TAKEN = "mail attachment taken"
var_0_0.UPDATE_ATTACHMENT_COUNT = "UPDATE_ATTACHMENT_COUNT"

function var_0_0.register(arg_1_0)
	arg_1_0.init = false
	arg_1_0.dirty = false
	arg_1_0.unread = 0
	arg_1_0.total = 0

	arg_1_0:on(30001, function(arg_2_0)
		if arg_1_0.init then
			arg_1_0.dirty = true
		end

		arg_1_0:unpdateExistAttachment(arg_2_0.unread_number)
		arg_1_0:updateTotal(arg_2_0.total_number)
	end)
end

function var_0_0.resetData(arg_3_0)
	arg_3_0.data = {}
	arg_3_0.init = false
	arg_3_0.dirty = false
end

function var_0_0.addMail(arg_4_0, arg_4_1)
	assert(isa(arg_4_1, Mail), "should be an instance of Mail")
	assert(arg_4_0.data[arg_4_1.id] == nil, "mail already exist")

	arg_4_0.data[arg_4_1.id] = arg_4_1:clone()

	arg_4_0.data[arg_4_1.id]:display("added")
end

function var_0_0.getMails(arg_5_0)
	local var_5_0 = {}

	for iter_5_0, iter_5_1 in pairs(arg_5_0.data) do
		table.insert(var_5_0, iter_5_1)
	end

	return Clone(var_5_0)
end

function var_0_0.getMailById(arg_6_0, arg_6_1)
	if arg_6_0.data[arg_6_1] ~= nil then
		return arg_6_0.data[arg_6_1]:clone()
	end
end

function var_0_0.GetAttachmentCount(arg_7_0)
	return arg_7_0._existAttachmentCount
end

function var_0_0.getOldestMail(arg_8_0)
	local var_8_0

	for iter_8_0, iter_8_1 in pairs(arg_8_0.data) do
		if not var_8_0 or var_8_0.id > iter_8_1.id then
			var_8_0 = iter_8_1
		end
	end

	return var_8_0 and var_8_0:clone()
end

function var_0_0.getNewestMail(arg_9_0)
	local var_9_0

	for iter_9_0, iter_9_1 in pairs(arg_9_0.data) do
		if not var_9_0 or var_9_0.id < iter_9_1.id then
			var_9_0 = iter_9_1
		end
	end

	return var_9_0 and var_9_0:clone()
end

function var_0_0.takeMailAttachment(arg_10_0, arg_10_1)
	assert(isa(arg_10_1, Mail), "should be an instance of Mail")

	arg_10_1.isTaken = true

	arg_10_0:updateMail(arg_10_1)
	arg_10_0.facade:sendNotification(var_0_0.MAIL_ATTACHMENT_TAKEN, arg_10_1:clone())
end

function var_0_0.updateMail(arg_11_0, arg_11_1)
	assert(isa(arg_11_1, Mail), "should be an instance of Mail")
	assert(arg_11_0.data[arg_11_1.id] ~= nil, "ship should exist")

	arg_11_0.data[arg_11_1.id] = arg_11_1:clone()

	arg_11_0.data[arg_11_1.id]:display("updated")
end

function var_0_0.removeMail(arg_12_0, arg_12_1)
	assert(isa(arg_12_1, Mail), "should be an instance of Mail")
	arg_12_0:removeMailById(arg_12_1.id)
end

function var_0_0.removeMailById(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0.data[arg_13_1]

	assert(arg_13_0.data[arg_13_1] ~= nil, "mail should exist")
	arg_13_0.data[var_13_0.id]:display("removed")

	arg_13_0.data[var_13_0.id] = nil

	arg_13_0:updateTotal(arg_13_0.total - 1)
end

function var_0_0.hasMailById(arg_14_0, arg_14_1)
	return arg_14_0.data[arg_14_1] ~= nil
end

function var_0_0.unpdateExistAttachment(arg_15_0, arg_15_1)
	arg_15_0._existAttachmentCount = arg_15_1

	arg_15_0:sendNotification(var_0_0.UPDATE_ATTACHMENT_COUNT)
end

function var_0_0.updateTotal(arg_16_0, arg_16_1)
	arg_16_0.total = arg_16_1

	arg_16_0:sendNotification(var_0_0.MAIL_TOTAL, arg_16_0.total)
end

function var_0_0.getUnreadCount(arg_17_0)
	return arg_17_0.unread
end

function var_0_0.GetAttchmentDic(arg_18_0)
	local var_18_0 = {
		[DROP_TYPE_ITEM] = {},
		[DROP_TYPE_RESOURCE] = {},
		[DROP_TYPE_EQUIP] = 0,
		[DROP_TYPE_SHIP] = 0,
		[DROP_TYPE_WORLD_ITEM] = 0
	}

	for iter_18_0, iter_18_1 in ipairs(arg_18_0:getMails()) do
		if iter_18_1.attachFlag == Mail.ATTACHMENT_EXIST then
			local var_18_1 = iter_18_1:GetAttchmentDic()

			for iter_18_2, iter_18_3 in pairs(var_18_1) do
				switch(iter_18_2, {
					[DROP_TYPE_ITEM] = function()
						for iter_19_0, iter_19_1 in pairs(iter_18_3) do
							var_18_0[iter_18_2][iter_19_0] = defaultValue(var_18_0[iter_18_2][iter_19_0], 0) + iter_19_1
						end
					end,
					[DROP_TYPE_RESOURCE] = function()
						for iter_20_0, iter_20_1 in pairs(iter_18_3) do
							var_18_0[iter_18_2][iter_20_0] = defaultValue(var_18_0[iter_18_2][iter_20_0], 0) + iter_20_1
						end
					end,
					[DROP_TYPE_EQUIP] = function()
						var_18_0[iter_18_2] = var_18_0[iter_18_2] + iter_18_3
					end,
					[DROP_TYPE_SHIP] = function()
						var_18_0[iter_18_2] = var_18_0[iter_18_2] + iter_18_3
					end,
					[DROP_TYPE_WORLD_ITEM] = function()
						var_18_0[iter_18_2] = var_18_0[iter_18_2] + iter_18_3
					end
				})
			end
		end
	end

	return var_18_0
end

function var_0_0.getMailAttachments(arg_24_0)
	local var_24_0 = {}
	local var_24_1 = arg_24_0:getMails()

	for iter_24_0, iter_24_1 in ipairs(var_24_1) do
		if iter_24_1.attachFlag == Mail.ATTACHMENT_EXIST then
			table.insert(var_24_0, iter_24_1)
		end
	end

	return var_24_0
end

function var_0_0.getAllAttachment(arg_25_0)
	local var_25_0 = {}
	local var_25_1 = {}
	local var_25_2 = arg_25_0:getMailAttachments()

	_.each(var_25_2, function(arg_26_0)
		_.each(arg_26_0.attachments or {}, function(arg_27_0)
			if arg_27_0.type == DROP_TYPE_LOVE_LETTER then
				table.insert(var_25_1, arg_27_0)
			else
				local var_27_0 = arg_27_0.type .. "_" .. arg_27_0.id

				if var_25_0[var_27_0] then
					var_25_0[var_27_0].count = var_25_0[var_27_0].count + arg_27_0.count
				else
					var_25_0[var_27_0] = arg_27_0
				end
			end
		end)
	end)

	for iter_25_0, iter_25_1 in pairs(var_25_0) do
		table.insert(var_25_1, iter_25_1)
	end

	return var_25_1
end

return var_0_0
