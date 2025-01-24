local var_0_0 = class("NewEducateGuideSequence")

var_0_0.config = {
	NewEducateTalentLayer = {
		{
			id = "tb2_1",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 1
			end,
			args = function()
				return {}
			end
		}
	},
	NewEducateMainScene = {
		{
			id = "tb2_2",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 1
			end,
			args = function()
				return {}
			end,
			nextOne = function()
				return "tb2_3"
			end
		},
		{
			id = "tb2_3",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 1 and not getProxy(NewEducateProxy):GetCurChar():GetFSM():GetState(NewEducateFSM.STYSTEM.TOPIC)
			end,
			args = function()
				return {}
			end,
			nextOne = function()
				return "tb2_4"
			end
		},
		{
			id = "tb2_4",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 1
			end,
			args = function()
				return {}
			end,
			nextOne = function()
				return "tb2_5"
			end
		},
		{
			id = "tb2_5",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 1
			end,
			args = function()
				return {}
			end,
			nextOne = function()
				return "tb2_6"
			end
		},
		{
			id = "tb2_6",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 1
			end,
			args = function()
				return {}
			end,
			nextOne = function()
				return "tb2_7"
			end
		},
		{
			id = "tb2_7",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 1
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb2_9",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 2
			end,
			args = function()
				return {}
			end,
			nextOne = function()
				return "tb2_10"
			end
		},
		{
			id = "tb2_10",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 2
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb2_11",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 3
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb2_13",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 6
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb2_15",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 8
			end,
			args = function()
				return {}
			end
		}
	},
	NewEducateScheduleScene = {
		{
			id = "tb2_8",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 1
			end,
			args = function()
				return {}
			end
		},
		{
			id = "tb2_14",
			condition = function()
				return getProxy(NewEducateProxy):GetCurChar():GetRoundData().round == 6
			end,
			args = function()
				return {}
			end
		}
	}
}

function var_0_0.CheckGuide(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_1 or function()
		return
	end

	if NewEducateConst.LOCK_GUIDE then
		var_35_0()

		return
	end

	if getProxy(NewEducateProxy):GetCurChar():GetGameCnt() ~= 1 then
		var_35_0()

		return
	end

	local var_35_1 = var_0_0.config[arg_35_0] or {}
	local var_35_2 = underscore.detect(var_35_1, function(arg_37_0)
		local var_37_0 = arg_37_0.id
		local var_37_1 = arg_37_0.condition

		return not pg.NewStoryMgr.GetInstance():IsPlayed(var_37_0) and var_37_1()
	end)

	if not var_35_2 then
		var_35_0()

		return
	end

	local var_35_3 = var_35_2.id
	local var_35_4 = var_35_2.args()

	if pg.SeriesGuideMgr.GetInstance():isRunning() then
		var_35_0()

		return
	end

	if not pg.NewGuideMgr.GetInstance():CanPlay() then
		var_35_0()

		return
	end

	pg.m02:sendNotification(GAME.STORY_UPDATE, {
		storyId = var_35_3
	})
	pg.NewGuideMgr.GetInstance():Play(var_35_3, var_35_4, function()
		if var_35_2.nextOne then
			local var_38_0, var_38_1 = var_35_2.nextOne()

			var_0_0.PlayNextOne(var_38_0, var_38_1)
		end
	end, var_35_0)
end

function var_0_0.PlayNextOne(arg_39_0, arg_39_1)
	if not arg_39_0 then
		return
	end

	pg.NewGuideMgr.GetInstance():Play(arg_39_0, arg_39_1, function()
		return
	end)
	pg.m02:sendNotification(GAME.STORY_UPDATE, {
		storyId = arg_39_0
	})
end

return var_0_0
