pg = pg or {}
pg.SeriesGuideMgr = singletonClass("SeriesGuideMgr")

local var_0_0 = pg.SeriesGuideMgr
local var_0_1 = false

function log(...)
	if var_0_1 then
		originalPrint(...)
	end
end

local var_0_2 = {
	IDLE = 1,
	BUSY = 2
}

var_0_0.CODES = {
	CONDITION = 4,
	MAINUI = 2,
	GUIDER = 1
}

function var_0_0.isRunning(arg_2_0)
	return arg_2_0.state == var_0_2.BUSY
end

function var_0_0.IsInit(arg_3_0)
	return arg_3_0.state and arg_3_0.state >= var_0_2.IDLE
end

function var_0_0.isNotFinish(arg_4_0)
	local var_4_0 = getProxy(PlayerProxy)

	if var_4_0 then
		return var_4_0:getRawData():GetGuideIndex(arg_4_0:IsNewVersion()) < arg_4_0.lastIndex - 1
	end
end

function var_0_0.IsNewVersion(arg_5_0)
	return arg_5_0.isNewVersion
end

function var_0_0.loadGuide(arg_6_0, arg_6_1)
	print("load guide script:", arg_6_1)

	return require("GameCfg.guide.newguide." .. arg_6_1)
end

function var_0_0.getStepConfig(arg_7_0, arg_7_1)
	return arg_7_0.guideCfgs[arg_7_1]
end

function var_0_0.CheckNewVersion(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_1 then
		return true
	end

	local var_8_0 = arg_8_2:GetGuideIndex(true)
	local var_8_1 = arg_8_2:GetGuideIndex(false)

	print("guild index:", var_8_0, var_8_1)

	return var_8_1 <= var_8_0
end

function var_0_0.Init(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.state = var_0_2.IDLE
	arg_9_0.isNewVersion = arg_9_0:CheckNewVersion(arg_9_1, arg_9_2)

	local var_9_0 = arg_9_0.isNewVersion and "SG002" or "SG001"

	arg_9_0.guideCfgs = arg_9_0:loadGuide(var_9_0)
	arg_9_0.lastIndex = #arg_9_0.guideCfgs + 1
	arg_9_0.guideMgr = pg.NewGuideMgr.GetInstance()
	arg_9_0.protocols = {}
	arg_9_0.onReceiceProtocol = nil

	arg_9_0:setPlayer(arg_9_2)
end

function var_0_0.dispatch(arg_10_0, arg_10_1)
	if arg_10_0:canPlay(arg_10_1) then
		arg_10_0.guideMgr:PlayNothing()
	end
end

function var_0_0.start(arg_11_0, arg_11_1)
	if arg_11_0:canPlay(arg_11_1) then
		arg_11_0.state = var_0_2.BUSY

		arg_11_0.guideMgr:StopNothing()

		arg_11_0.stepConfig = arg_11_0:getStepConfig(arg_11_0.currIndex)

		local function var_11_0(arg_12_0)
			arg_11_0.state = var_0_2.IDLE
			arg_11_0.protocols = {}

			if not arg_11_0.stepConfig.interrupt then
				arg_11_0:doNextStep(arg_11_0.currIndex, arg_12_0)
			end
		end

		arg_11_0:doGuideStep(arg_11_1, function(arg_13_0, arg_13_1)
			if arg_11_0.stepConfig.end_segment and arg_13_1 then
				arg_11_0.guideMgr:Play(arg_11_0.stepConfig.end_segment, arg_11_1.code, function()
					var_11_0(arg_13_0)
				end, nil, function(arg_15_0, arg_15_1)
					arg_11_0:Record(arg_11_0.currIndex - 1, arg_15_0, arg_15_1, arg_11_0.stepConfig.end_segment)
				end)
			else
				var_11_0(arg_13_0)
			end
		end)
	end
end

function var_0_0.doGuideStep(arg_16_0, arg_16_1, arg_16_2)
	if arg_16_0.stepConfig.condition then
		local var_16_0, var_16_1, var_16_2 = arg_16_0:checkCondition(arg_16_1)
		local var_16_3 = var_16_2 and var_16_1 > arg_16_0.currIndex

		arg_16_0:updateIndex(var_16_1, function()
			arg_16_2({
				var_16_0
			}, var_16_3)
		end)
	else
		local var_16_4 = arg_16_0.stepConfig.segment[arg_16_0:getSegmentIndex()]
		local var_16_5 = var_16_4[1]
		local var_16_6 = var_16_4[2]

		assert(var_16_6, "protocol can not be nil")

		local var_16_7 = {
			function(arg_18_0)
				arg_16_0.guideMgr:Play(var_16_5, arg_16_1.code, arg_18_0, function()
					arg_16_0:updateIndex(arg_16_0.lastIndex)
				end, function(arg_20_0, arg_20_1)
					arg_16_0:Record(arg_16_0.currIndex, arg_20_0, arg_20_1, var_16_5)
				end)
				arg_16_0.guideMgr:PlayNothing()
			end,
			function(arg_21_0)
				if _.any(arg_16_0.protocols, function(arg_22_0)
					return arg_22_0.protocol == var_16_6
				end) then
					arg_21_0()

					return
				end

				function arg_16_0.onReceiceProtocol(arg_23_0)
					if arg_23_0 == var_16_6 then
						arg_16_0.onReceiceProtocol = nil

						arg_21_0()
					end
				end
			end,
			function(arg_24_0)
				arg_16_0.guideMgr:StopNothing()
				arg_16_0:increaseIndex(arg_24_0)
			end
		}

		seriesAsync(var_16_7, function()
			arg_16_2({
				var_0_0.CODES.GUIDER
			}, true)
		end)
	end
end

function var_0_0.Record(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	local var_26_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_26_3

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildGuide(arg_26_0:IsNewVersion(), arg_26_1, arg_26_2, var_26_0, arg_26_4))
end

function var_0_0.getSegmentIndex(arg_27_0)
	local var_27_0 = 1

	if arg_27_0.stepConfig.getSegment then
		var_27_0 = arg_27_0.stepConfig.getSegment()
	end

	return var_27_0
end

local var_0_3 = 1
local var_0_4 = 2
local var_0_5 = 3

function var_0_0.checkCondition(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0.stepConfig
	local var_28_1
	local var_28_2
	local var_28_3 = true
	local var_28_4 = var_28_0.condition.arg

	if var_28_4[1] == var_0_3 then
		local var_28_5 = {
			protocol = var_28_4[2],
			func = var_28_0.condition.func
		}

		var_28_2, var_28_1 = arg_28_0:checkPtotocol(var_28_5, arg_28_1)
	elseif var_28_4[1] == var_0_4 then
		local var_28_6 = getProxy(PlayerProxy):getRawData()
		local var_28_7 = getProxy(BayProxy):getShipById(var_28_6.character)

		var_28_2, var_28_1 = var_28_0.condition.func(var_28_7)
		arg_28_0.stepConfig.condition = nil
	elseif var_28_4[1] == var_0_5 then
		var_28_2, var_28_1 = var_28_0.condition.func(NewServerCarnivalScene.isShow())
		arg_28_0.stepConfig.condition = nil
		var_28_3 = false
	end

	assert(var_28_1, "index can not be nil")

	return var_28_2, var_28_1, var_28_3
end

function var_0_0.checkPtotocol(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_1.protocol
	local var_29_1 = _.select(arg_29_0.protocols, function(arg_30_0)
		return arg_30_0.protocol == var_29_0
	end)[1] or {}

	return arg_29_1.func(arg_29_2.view, var_29_1.args)
end

function var_0_0.increaseIndex(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_0.currIndex + 1

	arg_31_0:updateIndex(var_31_0, arg_31_1)
end

function var_0_0.updateIndex(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = arg_32_0:IsNewVersion()

	pg.m02:sendNotification(GAME.UPDATE_GUIDE_INDEX, {
		isNewVersion = var_32_0,
		index = arg_32_1,
		callback = arg_32_2
	})
end

function var_0_0.doNextStep(arg_33_0, arg_33_1, arg_33_2)
	arg_33_0.stepConfig = nil

	if arg_33_0:isEnd() then
		return
	end

	local var_33_0 = arg_33_0.guideCfgs[arg_33_1]
	local var_33_1 = {
		view = var_33_0.view[#var_33_0.view],
		code = arg_33_2
	}

	if arg_33_0:canPlay(var_33_1) then
		arg_33_0:start(var_33_1)
	end
end

function var_0_0.isEnd(arg_34_0)
	return arg_34_0.currIndex > #arg_34_0.guideCfgs or not ENABLE_GUIDE
end

function var_0_0.receiceProtocol(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	if not arg_35_0:IsInit() then
		return
	end

	table.insert(arg_35_0.protocols, {
		protocol = arg_35_1,
		args = arg_35_2,
		data = arg_35_3
	})

	if arg_35_0.onReceiceProtocol then
		arg_35_0.onReceiceProtocol(arg_35_1)
	end
end

function var_0_0.canPlay(arg_36_0, arg_36_1)
	if arg_36_0.state ~= var_0_2.IDLE then
		log("guider is busy")

		return false
	end

	if not ENABLE_GUIDE then
		log("ENABLE is false")

		return false
	end

	if not arg_36_0.guideMgr then
		log("guideMgr is nil")

		return false
	end

	if not arg_36_0.playerLevel then
		log("player is nil")

		return false
	end

	if arg_36_0:isEnd() then
		log("guider is end")

		return false
	end

	local var_36_0 = arg_36_0:getStepConfig(arg_36_0.currIndex)

	if not table.contains(var_36_0.view, arg_36_1.view) then
		log("view is erro", arg_36_0.currIndex, arg_36_1.view, var_36_0.view[1], var_36_0.view[2])

		return false
	end

	return true
end

function var_0_0.setPlayer(arg_37_0, arg_37_1)
	arg_37_0.playerLevel = arg_37_1.level

	local var_37_0 = arg_37_1:GetGuideIndex(arg_37_0:IsNewVersion())

	arg_37_0.playerIndex = var_37_0
	arg_37_0.currIndex = var_37_0

	arg_37_0:compatibleOldPlayer()
end

function var_0_0.dispose(arg_38_0)
	arg_38_0.playerLevel = nil
	arg_38_0.protocols = {}
	arg_38_0.state = var_0_2.IDLE
end

function var_0_0.compatibleOldPlayer(arg_39_0)
	if not arg_39_0.playerLevel then
		return
	end

	local function var_39_0()
		arg_39_0:updateIndex(arg_39_0.lastIndex)
	end

	if arg_39_0.playerLevel >= 5 and arg_39_0.playerIndex < arg_39_0.lastIndex then
		var_39_0()

		return
	end

	if arg_39_0.playerIndex ~= arg_39_0.lastIndex then
		pg.SystemGuideMgr.GetInstance():FixGuide(function()
			if arg_39_0.playerIndex > 1 and arg_39_0.playerIndex < 101 then
				var_39_0()
			end
		end)
	end
end
