local var_0_0 = class("InstagramChatMediator", import("...base.ContextMediator"))

var_0_0.CHANGE_CARE = "InstagramChatMediator:CHANGE_CARE"
var_0_0.REPLY = "InstagramChatMediator:REPLY"
var_0_0.GET_REDPACKET = "InstagramChatMediator:GET_REDPACKET"
var_0_0.SET_CURRENT_TOPIC = "InstagramChatMediator:SET_CURRENT_TOPIC"
var_0_0.SET_CURRENT_BACKGROUND = "InstagramChatMediator:SET_CURRENT_BACKGROUND"
var_0_0.SET_READED = "InstagramChatMediator:SET_READED"
var_0_0.CLOSE_ALL = "InstagramChatMediator:CLOSE_ALL"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.CHANGE_CARE, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:sendNotification(GAME.ACT_INSTAGRAM_CHAT, {
			operation = ActivityConst.INSTAGRAM_CHAT_SET_CARE,
			characterId = arg_2_1,
			care = arg_2_2
		})
	end)
	arg_1_0:bind(var_0_0.REPLY, function(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		arg_1_0:sendNotification(GAME.ACT_INSTAGRAM_CHAT, {
			isRedPacket = false,
			operation = ActivityConst.INSTAGRAM_CHAT_REPLY,
			topicId = arg_3_1,
			wordId = arg_3_2,
			replyId = arg_3_3
		})
	end)
	arg_1_0:bind(var_0_0.GET_REDPACKET, function(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
		arg_1_0:sendNotification(GAME.ACT_INSTAGRAM_CHAT, {
			isRedPacket = true,
			operation = ActivityConst.INSTAGRAM_CHAT_REPLY,
			topicId = arg_4_1,
			wordId = arg_4_2,
			replyId = arg_4_3
		})
	end)
	arg_1_0:bind(var_0_0.SET_CURRENT_TOPIC, function(arg_5_0, arg_5_1)
		arg_1_0:sendNotification(GAME.ACT_INSTAGRAM_CHAT, {
			operation = ActivityConst.INSTAGRAM_CHAT_SET_TOPIC,
			topicId = arg_5_1
		})
	end)
	arg_1_0:bind(var_0_0.SET_CURRENT_BACKGROUND, function(arg_6_0, arg_6_1, arg_6_2)
		arg_1_0:sendNotification(GAME.ACT_INSTAGRAM_CHAT, {
			operation = ActivityConst.INSTAGRAM_CHAT_SET_SKIN,
			characterId = arg_6_1,
			skinId = arg_6_2
		})
	end)
	arg_1_0:bind(var_0_0.SET_READED, function(arg_7_0, arg_7_1)
		arg_1_0:sendNotification(GAME.ACT_INSTAGRAM_CHAT, {
			operation = ActivityConst.INSTAGRAM_CHAT_SET_READTIP,
			topicIdList = arg_7_1
		})
	end)
	arg_1_0:bind(var_0_0.CLOSE_ALL, function(arg_8_0)
		arg_1_0:sendNotification(InstagramMainMediator.CLOSE_ALL)
	end)
end

function var_0_0.listNotificationInterests(arg_9_0)
	return {
		GAME.ACT_INSTAGRAM_CHAT_DONE
	}
end

function var_0_0.handleNotification(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1:getName()
	local var_10_1 = arg_10_1:getBody()

	if var_10_0 == GAME.ACT_INSTAGRAM_CHAT_DONE then
		local var_10_2 = getProxy(InstagramChatProxy)
		local var_10_3 = false
		local var_10_4 = false

		if var_10_1.operation == ActivityConst.INSTAGRAM_CHAT_REPLY then
			if var_10_1.awards ~= nil then
				arg_10_0.viewComponent:SetEndAniEvent(arg_10_0.viewComponent.redPacketGot, function()
					arg_10_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_10_1.awards)
				end)
				arg_10_0.viewComponent:UpdateRedPacketUI(var_10_1.redPacketId)
			end

			var_10_3 = true
		elseif var_10_1.operation == ActivityConst.INSTAGRAM_CHAT_SET_SKIN then
			-- block empty
		elseif var_10_1.operation == ActivityConst.INSTAGRAM_CHAT_SET_CARE then
			-- block empty
		elseif var_10_1.operation == ActivityConst.INSTAGRAM_CHAT_SET_TOPIC then
			-- block empty
		elseif var_10_1.operation == ActivityConst.INSTAGRAM_CHAT_SET_READTIP then
			arg_10_0:sendNotification(InstagramMainMediator.CHANGE_CHAT_TIP)

			var_10_4 = true
		end

		if var_10_1.operation == ActivityConst.INSTAGRAM_CHAT_REPLY then
			if var_10_1.awards ~= nil then
				arg_10_0.viewComponent:ChangeFresh()
			else
				arg_10_0.viewComponent:SetEndAniEvent(arg_10_0.viewComponent.optionPanel, function()
					arg_10_0.viewComponent:UpdateCharaList(var_10_3, var_10_4)
				end)
				arg_10_0.viewComponent.optionPanel:GetComponent(typeof(Animation)):Play("anim_newinstagram_option_out")
			end
		else
			arg_10_0.viewComponent:UpdateCharaList(var_10_3, var_10_4)
		end
	end
end

return var_0_0
