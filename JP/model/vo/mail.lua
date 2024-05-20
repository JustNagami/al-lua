local var_0_0 = class("Mail", import(".BaseVO"))

var_0_0.SINGLE_COUNT = 20
var_0_0.ATTACHMENT_NONE = 0
var_0_0.ATTACHMENT_EXIST = 1
var_0_0.ATTACHMENT_TAKEN = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.date = arg_1_1.date

	local var_1_0 = string.split(HXSet.hxLan(arg_1_1.title), "||")

	arg_1_0.title = var_1_0[1]
	arg_1_0.sender = #var_1_0 > 1 and var_1_0[2] or i18n("mail_sender_default")
	arg_1_0.readFlag = arg_1_1.read_flag
	arg_1_0.attachFlag = arg_1_1.attach_flag
	arg_1_0.importantFlag = arg_1_1.imp_flag
	arg_1_0.attachments = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.attachment_list) do
		table.insert(arg_1_0.attachments, Drop.New({
			type = iter_1_1.type,
			id = iter_1_1.id,
			count = iter_1_1.number
		}))
	end

	arg_1_0.openned = false
end

function var_0_0.extend(arg_2_0, arg_2_1)
	assert(arg_2_0.id == arg_2_1.id, "id should be the same")

	arg_2_0.content = string.gsub(HXSet.hxLan(arg_2_1.content), "\\n", "\n")
	arg_2_0.openned = true
end

function var_0_0.GetAttchmentDic(arg_3_0)
	return GetItemsOverflowDic(underscore.rest(arg_3_0.attachments, 1))
end

function var_0_0.sortByTime(arg_4_0, arg_4_1)
	if arg_4_0.readFlag == arg_4_1.readFlag then
		local var_4_0 = arg_4_0.attachFlag == var_0_0.ATTACHMENT_EXIST and 1 or 0
		local var_4_1 = arg_4_1.attachFlag == var_0_0.ATTACHMENT_EXIST and 1 or 0

		if var_4_0 == var_4_1 then
			if arg_4_0.date == arg_4_1.date then
				return arg_4_0.id > arg_4_1.id
			else
				return arg_4_0.date > arg_4_1.date
			end
		else
			return var_4_1 < var_4_0
		end
	else
		return arg_4_0.readFlag < arg_4_1.readFlag
	end
end

function var_0_0.setReadFlag(arg_5_0, arg_5_1)
	arg_5_0.readFlag = arg_5_1
end

function var_0_0.setImportantFlag(arg_6_0, arg_6_1)
	arg_6_0.importantFlag = arg_6_1
end

return var_0_0
