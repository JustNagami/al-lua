pg = pg or {}
pg.RedDotMgr = singletonClass("RedDotMgr")

require("Mgr/RedDot/Include")

local var_0_0 = pg.RedDotMgr
local var_0_1 = true

local function var_0_2(...)
	if var_0_1 then
		originalPrint(...)
	end
end

var_0_0.TYPES = {
	COURTYARD = 1,
	MEMORY_REVIEW = 19,
	ACT_RETURN = 16,
	COMMANDER = 10,
	RYZA_TASK = 21,
	BLUEPRINT = 14,
	DORM3D_GIFT = 23,
	SERVER = 12,
	ISLAND = 22,
	DORM3D_FURNITURE = 24,
	ACT_NEWBIE = 17,
	EVENT = 15,
	ATTIRE = 6,
	FRIEND = 8,
	NEW_SERVER = 20,
	DORM3D_SHOP_TIMELIMIT = 25,
	TASK = 2,
	BUILD = 4,
	MAIL = 3,
	GUILD = 5,
	SETTTING = 11,
	COMMISSION = 9,
	COLLECTION = 7,
	SCHOOL = 13
}

function var_0_0.Init(arg_2_0, arg_2_1)
	arg_2_0.conditions = {}
	arg_2_0.nodeList = {}

	arg_2_0:BindConditions()

	if arg_2_1 then
		arg_2_1()
	end
end

function var_0_0.BindConditions(arg_3_0)
	arg_3_0:BindCondition(var_0_0.TYPES.COURTYARD, function()
		return getProxy(DormProxy):IsShowRedDot()
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.TASK, function()
		return getProxy(TaskProxy):getCanReceiveCount() > 0 or getProxy(AvatarFrameProxy):getCanReceiveCount() > 0
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.MAIL, function()
		return getProxy(MailProxy):GetUnreadCount()
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.BUILD, function()
		return getProxy(BuildShipProxy):getFinishCount() > 0 or tobool(getProxy(ActivityProxy):IsShowFreeBuildMark(true))
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.GUILD, function()
		return getProxy(GuildProxy):ShouldShowTip()
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.ATTIRE, function()
		return getProxy(AttireProxy):IsShowRedDot() or getProxy(SettingsProxy):ShouldEducateCharTip()
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.COLLECTION, function()
		return getProxy(CollectionProxy):hasFinish() or getProxy(AppreciateProxy):isGalleryHaveNewRes() or getProxy(AppreciateProxy):isMusicHaveNewRes() or getProxy(AppreciateProxy):isMangaHaveNewRes()
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.FRIEND, function()
		return getProxy(NotificationProxy):getRequestCount() > 0 or getProxy(FriendProxy):getNewMsgCount() > 0
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.COMMISSION, function()
		return getProxy(PlayerProxy):IsShowCommssionTip()
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.COMMANDER, function()
		if getProxy(PlayerProxy):getRawData().level < 40 then
			return false
		end

		local var_13_0 = getProxy(CommanderProxy):IsFinishAllBox()

		if not LOCK_CATTERY then
			return var_13_0 or getProxy(CommanderProxy):AnyCatteryExistOP() or getProxy(CommanderProxy):AnyCatteryCanUse()
		else
			return var_13_0
		end
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.SETTTING, function()
		return PlayerPrefs.GetFloat("firstIntoOtherPanel") == 0
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.SERVER, function()
		return #getProxy(ServerNoticeProxy):getServerNotices(false) > 0 and getProxy(ServerNoticeProxy):hasNewNotice()
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.SCHOOL, function()
		return getProxy(NavalAcademyProxy):IsShowTip()
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.BLUEPRINT, function()
		return getProxy(TechnologyProxy):IsShowTip()
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.EVENT, function()
		return getProxy(EventProxy):hasFinishState() or LimitChallengeConst.IsShowRedPoint()
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.ACT_RETURN, function()
		local var_19_0 = RefluxTaskView.isAnyTaskCanGetAward()
		local var_19_1 = RefluxPTView.isAnyPTCanGetAward()
		local var_19_2 = RefluxShopView.isShowRedPot()

		return var_19_0 or var_19_1 or var_19_2
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.ACT_NEWBIE, function()
		local var_20_0, var_20_1 = TrainingCampScene.isNormalActOn()
		local var_20_2, var_20_3 = TrainingCampScene.isTecActOn()

		return var_20_1 or var_20_3
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.MEMORY_REVIEW, function()
		local var_21_0 = getProxy(PlayerProxy):getRawData()

		if var_21_0 then
			local var_21_1 = var_21_0.id

			do return _.any(pg.memory_group.all, function(arg_22_0)
				return PlayerPrefs.GetInt("MEMORY_GROUP_NOTIFICATION" .. var_21_1 .. " " .. arg_22_0, 0) == 1
			end) end
			return
		end

		return false
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.NEW_SERVER, function()
		return NewServerCarnivalScene.isTip()
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.RYZA_TASK, function()
		return getProxy(ActivityTaskProxy):getActTaskTip(ActivityConst.RYZA_TASK)
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.ISLAND, function()
		local var_25_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ISLAND)

		return Activity.IsActivityReady(var_25_0)
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.DORM3D_GIFT, function()
		return pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getRawData().level, "SelectDorm3DMediator") and Dorm3dGift.NeedViewTip()
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.DORM3D_FURNITURE, function()
		return pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getRawData().level, "SelectDorm3DMediator") and Dorm3dFurniture.NeedViewTip()
	end)
	arg_3_0:BindCondition(var_0_0.TYPES.DORM3D_SHOP_TIMELIMIT, function()
		return pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getRawData().level, "SelectDorm3DMediator") and Dorm3dFurniture.IsOnceTimelimitShopTip()
	end)
end

function var_0_0.BindCondition(arg_29_0, arg_29_1, arg_29_2)
	arg_29_0.conditions[arg_29_1] = arg_29_2
end

function var_0_0.RegisterRedDotNodes(arg_30_0, arg_30_1)
	for iter_30_0, iter_30_1 in ipairs(arg_30_1) do
		arg_30_0:RegisterRedDotNode(iter_30_1)
	end

	arg_30_0:_NotifyAll()
end

function var_0_0.RegisterRedDotNode(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_1:GetTypes()

	for iter_31_0, iter_31_1 in ipairs(var_31_0) do
		if not arg_31_0.nodeList[iter_31_1] then
			arg_31_0.nodeList[iter_31_1] = {}
		end

		table.insert(arg_31_0.nodeList[iter_31_1], arg_31_1)
	end

	arg_31_1:Init()
end

function var_0_0.UnRegisterRedDotNodes(arg_32_0, arg_32_1)
	for iter_32_0, iter_32_1 in ipairs(arg_32_1) do
		arg_32_0:UnRegisterRedDotNode(iter_32_1)
	end

	var_0_0.cache = {}
end

function var_0_0.UnRegisterRedDotNode(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_1:GetTypes()

	for iter_33_0, iter_33_1 in ipairs(var_33_0) do
		local var_33_1 = arg_33_0.nodeList[iter_33_1] or {}

		for iter_33_2, iter_33_3 in ipairs(var_33_1) do
			if iter_33_3 == arg_33_1 then
				iter_33_3:Remove()
				table.remove(var_33_1, iter_33_2)
			end
		end
	end
end

local function var_0_3(arg_34_0, arg_34_1)
	for iter_34_0, iter_34_1 in ipairs(arg_34_1) do
		local var_34_0

		if var_0_0.cache[iter_34_1] ~= nil then
			var_34_0 = var_0_0.cache[iter_34_1]
		else
			var_34_0 = arg_34_0.conditions[iter_34_1]()
			var_0_0.cache[iter_34_1] = var_34_0
		end

		if var_34_0 then
			return var_34_0
		end
	end

	return false
end

function var_0_0.NotifyAll(arg_35_0, arg_35_1)
	var_0_0.cache = {}

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.nodeList[arg_35_1] or {}) do
		local var_35_0 = iter_35_1:GetTypes()
		local var_35_1 = var_0_3(arg_35_0, var_35_0)

		iter_35_1:SetData(var_35_1)
	end

	var_0_0.cache = {}
end

function var_0_0._NotifyAll(arg_36_0)
	var_0_0.cache = {}

	local var_36_0 = {}

	local function var_36_1(arg_37_0, arg_37_1)
		local var_37_0 = arg_37_0:GetTypes()
		local var_37_1 = var_0_3(arg_36_0, var_37_0)

		arg_37_0:SetData(var_37_1)
		onNextTick(arg_37_1)
	end

	for iter_36_0, iter_36_1 in pairs(arg_36_0.nodeList) do
		for iter_36_2, iter_36_3 in ipairs(iter_36_1) do
			table.insert(var_36_0, function(arg_38_0)
				var_36_1(iter_36_3, arg_38_0)
			end)
		end
	end

	seriesAsync(var_36_0, function()
		var_0_0.cache = {}
	end)
end

function var_0_0.DebugNodes(arg_40_0)
	for iter_40_0, iter_40_1 in pairs(arg_40_0.nodeList) do
		var_0_2("type : ", iter_40_0)

		for iter_40_2, iter_40_3 in ipairs(iter_40_1) do
			var_0_2(" ", iter_40_3:GetName())
		end
	end
end
