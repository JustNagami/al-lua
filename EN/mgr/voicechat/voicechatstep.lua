local var_0_0 = class("VoiceChatStep")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.say = arg_1_1.say or ""
	arg_1_0.voice = arg_1_1.voice
	arg_1_0.options = arg_1_1.options
	arg_1_0.waitForClick = arg_1_1.wait or 0
	arg_1_0.optionFlag = arg_1_1.optionFlag
end

function var_0_0.IsSameBranch(arg_2_0, arg_2_1)
	return not arg_2_0.optionFlag or arg_2_0.optionFlag == arg_2_1
end

function var_0_0.GetSay(arg_3_0)
	return arg_3_0.say
end

function var_0_0.GetVoice(arg_4_0)
	return arg_4_0.voice
end

function var_0_0.ExistOption(arg_5_0)
	return arg_5_0.options ~= nil and #arg_5_0.options > 0
end

function var_0_0.GetOptions(arg_6_0)
	return _.map(arg_6_0.options or {}, function(arg_7_0)
		local var_7_0 = arg_7_0.content
		local var_7_1 = HXSet.hxLan(var_7_0)

		return {
			var_7_1,
			arg_7_0.flag
		}
	end)
end

function var_0_0.GetWaitForClickTime(arg_8_0)
	return arg_8_0.waitForClick
end

return var_0_0
