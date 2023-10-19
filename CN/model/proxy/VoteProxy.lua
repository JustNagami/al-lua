slot0 = class("VoteProxy", import(".NetProxy"))
slot0.VOTEGROUP_UPDATE = "VoteProxy:VOTEGROUP_UPDATE"
slot0.VOTE_ORDER_BOOK_UPDATE = "VoteProxy:VOTE_ORDER_BOOK_UPDATE"
slot0.VOTE_ORDER_BOOK_DELETE = "VoteProxy:VOTE_ORDER_BOOK_DELETE"
slot0.VOTES_COUNT_UPDATE = "VoteProxy:VOTES_COUNT_UPDATE"

slot0.register = function(slot0)
	slot0.orderBook = nil
	slot0.voteGroup = nil
	slot0.webVoteGroup = nil
	slot0.votes = 0
	slot0.lastRequestTime = 0
	slot0.lastWebRequestTime = 0
end

slot0.InitWebGroup = function(slot0, slot1, slot2)
	slot0.webVoteGroup = VoteGroup.New({
		onWeb = true,
		id = slot2,
		list = _.map(slot1.list, function (slot0)
			return VoteShip.New(slot0)
		end)
	})
end

slot0.GetWebGroup = function(slot0)
	return Clone(slot0.webVoteGroup)
end

slot0.initVoteGroup = function(slot0, slot1, slot2, slot3)
	slot0.votes = slot3
	slot0.voteGroup = VoteGroup.New({
		id = slot2,
		list = _.map(slot1.list, function (slot0)
			return VoteShip.New(slot0)
		end)
	})
end

slot0.UpdateVotes = function(slot0, slot1)
	slot0.votes = slot0.votes - slot1

	slot0:sendNotification(uv0.VOTES_COUNT_UPDATE, slot0.votes)
end

slot0.getVoteGroup = function(slot0)
	return Clone(slot0.voteGroup)
end

slot0.updateVoteGroup = function(slot0, slot1)
	slot0.voteGroup = slot1

	slot0:sendNotification(uv0.VOTEGROUP_UPDATE, slot0:getVoteGroup())
end

slot0.SetOrderBook = function(slot0, slot1)
	slot0.orderBook = slot1

	slot0:RemoveOrderBookTimer()

	if slot0.orderBook then
		slot0:AddOrderBookTimer(slot0.orderBook)
		slot0:sendNotification(uv0.VOTE_ORDER_BOOK_UPDATE, slot1)
	else
		slot0:sendNotification(uv0.VOTE_ORDER_BOOK_DELETE)
	end
end

slot0.GetOrderBook = function(slot0)
	return slot0.orderBook
end

slot0.IsNewOrderBook = function(slot0)
	slot1 = slot0.orderBook and slot0.orderBook.isNew

	if slot0.orderBook then
		slot0.orderBook:SetIsNew(false)
	end

	return slot1
end

slot0.AddOrderBookTimer = function(slot0, slot1)
	if slot1:GetEndTime() - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
		slot0.timer = Timer.New(function ()
			uv0:RemoveOrderBook()
		end, slot3, 1)

		slot0.timer:Start()
	end
end

slot0.RemoveOrderBookTimer = function(slot0)
	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end
end

slot0.RemoveOrderBook = function(slot0)
	slot0:RemoveOrderBookTimer()
	slot0:SetOrderBook(nil)
end

slot0.remove = function(slot0)
	slot0:RemoveOrderBookTimer()
end

slot0.GetVoteBookActivty = function(slot0)
	return getProxy(ActivityProxy):getActivityById(ActivityConst.VOTE_ORDER_BOOK_PHASE_1) or slot1:getActivityById(ActivityConst.VOTE_ORDER_BOOK_PHASE_2) or slot1:getActivityById(ActivityConst.VOTE_ORDER_BOOK_PHASE_3) or slot1:getActivityById(ActivityConst.VOTE_ORDER_BOOK_PHASE_4) or slot1:getActivityById(ActivityConst.VOTE_ORDER_BOOK_PHASE_5) or slot1:getActivityById(ActivityConst.VOTE_ORDER_BOOK_PHASE_6) or slot1:getActivityById(ActivityConst.VOTE_ORDER_BOOK_PHASE_7) or slot1:getActivityById(ActivityConst.VOTE_ORDER_BOOK_PHASE_8) or slot1:getActivityById(ActivityConst.VOTE_ORDER_BOOK_PHASE_9)
end

slot0.IsVoteBookAct = function(slot0, slot1)
	return _.any({
		ActivityConst.VOTE_ORDER_BOOK_PHASE_1,
		ActivityConst.VOTE_ORDER_BOOK_PHASE_2,
		ActivityConst.VOTE_ORDER_BOOK_PHASE_3,
		ActivityConst.VOTE_ORDER_BOOK_PHASE_4,
		ActivityConst.VOTE_ORDER_BOOK_PHASE_5,
		ActivityConst.VOTE_ORDER_BOOK_PHASE_6,
		ActivityConst.VOTE_ORDER_BOOK_PHASE_7,
		ActivityConst.VOTE_ORDER_BOOK_PHASE_8,
		ActivityConst.VOTE_ORDER_BOOK_PHASE_9
	}, function (slot0)
		return uv0 == slot0
	end)
end

slot0.GetVoteActivity = function(slot0)
	for slot6, slot7 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_VOTE)) do
		if slot7:getDataConfig("is_in_game") == 1 then
			return slot7
		end
	end
end

slot0.GetPastVoteData = function(slot0)
	if not slot0.pastVoteData then
		slot0.pastVoteData = pg.vote_champion.get_id_list_by_group
	end

	return slot0.pastVoteData
end

slot0.ExistPastVoteAward = function(slot0)
	for slot5, slot6 in pairs(slot0:GetPastVoteData()) do
		if _.any(slot6, function (slot0)
			return getProxy(TaskProxy):getTaskById(pg.vote_champion[slot0].task) and slot2:isFinish() and not slot2:isReceive()
		end) then
			return true
		end
	end

	return false
end

return slot0
