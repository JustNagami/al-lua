local var_0_0 = class("MainReddotView")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._tf = tf(arg_1_1)
	arg_1_0.listener = {}
	arg_1_0.redDotMgr = pg.RedDotMgr.GetInstance()
	arg_1_0.nodes = {
		RedDotNode.New(arg_1_0._tf:Find("main/frame/bottom/taskButton/tip"), {
			pg.RedDotMgr.TYPES.TASK
		}),
		MailRedDotNode.New(arg_1_0._tf:Find("main/frame/right/mailButton")),
		RedDotNode.New(arg_1_0._tf:Find("main/frame/bottom/buildButton/tip"), {
			pg.RedDotMgr.TYPES.BUILD
		}),
		RedDotNode.New(arg_1_0._tf:Find("main/frame/bottom/guildButton/tip"), {
			pg.RedDotMgr.TYPES.GUILD
		}),
		RedDotNode.New(arg_1_0._tf:Find("main/frame/top/tip"), {
			pg.RedDotMgr.TYPES.ATTIRE
		}),
		RedDotNode.New(arg_1_0._tf:Find("main/frame/right/memoryButton/tip"), {
			pg.RedDotMgr.TYPES.MEMORY_REVIEW
		}),
		RedDotNode.New(arg_1_0._tf:Find("main/frame/right/collectionButton/tip"), {
			pg.RedDotMgr.TYPES.COLLECTION
		}),
		RedDotNode.New(arg_1_0._tf:Find("main/frame/right/friendButton/tip"), {
			pg.RedDotMgr.TYPES.FRIEND
		}),
		RedDotNode.New(arg_1_0._tf:Find("main/frame/left/commissionButton/tip"), {
			pg.RedDotMgr.TYPES.COMMISSION
		}),
		SettingsRedDotNode.New(arg_1_0._tf:Find("main/frame/right/settingButton/tip"), {
			pg.RedDotMgr.TYPES.SETTTING
		}),
		RedDotNode.New(arg_1_0._tf:Find("main/frame/right/noticeButton/tip"), {
			pg.RedDotMgr.TYPES.SERVER
		}),
		RedDotNode.New(arg_1_0._tf:Find("main/frame/bottom/technologyButton/tip"), {
			pg.RedDotMgr.TYPES.BLUEPRINT
		}),
		RedDotNode.New(arg_1_0._tf:Find("main/frame/right/combatBtn/tip"), {
			pg.RedDotMgr.TYPES.EVENT
		}),
		RedDotNode.New(arg_1_0._tf:Find("main/frame/bottom/liveButton/tip"), {
			pg.RedDotMgr.TYPES.COURTYARD,
			pg.RedDotMgr.TYPES.SCHOOL,
			pg.RedDotMgr.TYPES.COMMANDER
		})
	}

	arg_1_0.redDotMgr:RegisterRedDotNodes(arg_1_0.nodes)
end

function var_0_0.AddNode(arg_2_0, arg_2_1)
	table.insert(arg_2_0.nodes, arg_2_1)
	arg_2_0.redDotMgr:RegisterRedDotNode(arg_2_1)
	arg_2_1:RefreshSelf()
end

function var_0_0.RemoveNode(arg_3_0, arg_3_1)
	table.removebyvalue(arg_3_0.nodes, arg_3_1)
	arg_3_0.redDotMgr:UnRegisterRedDotNode(arg_3_1)
end

function var_0_0.Refresh(arg_4_0)
	for iter_4_0, iter_4_1 in ipairs(arg_4_0.nodes) do
		if iter_4_1.Resume then
			iter_4_1:Resume()
		end
	end

	arg_4_0.redDotMgr:_NotifyAll()
end

function var_0_0.Disable(arg_5_0)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0.nodes) do
		if iter_5_1.Puase then
			iter_5_1:Puase()
		end
	end
end

function var_0_0.GetNotifyType(arg_6_0)
	if not arg_6_0.listener or #arg_6_0.listener == 0 then
		arg_6_0.listener = {
			[pg.RedDotMgr.TYPES.ATTIRE] = {
				GAME.EDUCATE_GET_ENDINGS_DONE
			},
			[pg.RedDotMgr.TYPES.TASK] = {
				TaskProxy.TASK_UPDATED,
				AvatarFrameProxy.FRAME_TASK_UPDATED
			},
			[pg.RedDotMgr.TYPES.COURTYARD] = {
				DormProxy.INIMACY_AND_MONEY_ADD
			},
			[pg.RedDotMgr.TYPES.MAIL] = {
				MailProxy.UPDATE_ATTACHMENT_COUNT
			},
			[pg.RedDotMgr.TYPES.BUILD] = {
				BuildShipProxy.TIMEUP
			},
			[pg.RedDotMgr.TYPES.GUILD] = {
				GAME.GUILD_GET_REQUEST_LIST_DONE,
				GuildProxy.REQUEST_DELETED,
				GuildProxy.REQUEST_COUNT_UPDATED,
				GAME.BOSS_EVENT_START_DONE,
				GAME.GET_GUILD_INFO_DONE
			},
			[pg.RedDotMgr.TYPES.SCHOOL] = {
				CollectionProxy.TROPHY_UPDATE
			},
			[pg.RedDotMgr.TYPES.FRIEND] = {
				NotificationProxy.FRIEND_REQUEST_ADDED,
				NotificationProxy.FRIEND_REQUEST_REMOVED,
				FriendProxy.FRIEND_NEW_MSG,
				FriendProxy.FRIEND_UPDATED
			},
			[pg.RedDotMgr.TYPES.COMMISSION] = {
				PlayerProxy.UPDATED,
				GAME.EVENT_LIST_UPDATE,
				GAME.CANCEL_LEARN_TACTICS_DONE
			},
			[pg.RedDotMgr.TYPES.SERVER] = {
				ServerNoticeProxy.SERVER_NOTICES_UPDATE
			},
			[pg.RedDotMgr.TYPES.BLUEPRINT] = {
				TechnologyConst.UPDATE_REDPOINT_ON_TOP
			},
			[pg.RedDotMgr.TYPES.EVENT] = {
				GAME.EVENT_LIST_UPDATE
			},
			[pg.RedDotMgr.TYPES.ACT_NEWBIE] = {
				GAME.REMOVE_LAYERS
			},
			[pg.RedDotMgr.TYPES.ACT_RETURN] = {
				GAME.REMOVE_LAYERS
			}
		}
	end

	return arg_6_0.listener
end

function var_0_0.Notify(arg_7_0, arg_7_1)
	for iter_7_0, iter_7_1 in pairs(arg_7_0:GetNotifyType()) do
		for iter_7_2, iter_7_3 in ipairs(iter_7_1) do
			if iter_7_3 == arg_7_1 then
				arg_7_0.redDotMgr:NotifyAll(iter_7_0)
			end
		end
	end
end

function var_0_0.Dispose(arg_8_0)
	arg_8_0.redDotMgr:UnRegisterRedDotNodes(arg_8_0.nodes)

	arg_8_0.listener = nil
end

return var_0_0
