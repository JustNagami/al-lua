TimelineSupport = {}

local var_0_0 = TimelineSupport

function var_0_0.InitTimeline(arg_1_0)
	var_0_0.DynamicBinding(arg_1_0)
end

function var_0_0.EachSubDirector(arg_2_0, arg_2_1)
	eachChild(arg_2_0, function(arg_3_0)
		local var_3_0 = arg_3_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		if not var_3_0 then
			return
		end

		table.IpairsCArray(TimelineHelper.GetTimelineTracks(var_3_0), function(arg_4_0, arg_4_1)
			arg_2_1(arg_4_0, arg_4_1)
		end)
		var_0_0.EachSubDirector(var_3_0, arg_2_1)
	end)
end

function var_0_0.DynamicBinding(arg_5_0)
	local var_5_0 = _.reduce(pg.dorm3d_timeline_dynamic_binding, {}, function(arg_6_0, arg_6_1)
		if arg_6_1.track_name then
			arg_6_0[arg_6_1.track_name] = arg_6_1.object_name
		end

		return arg_6_0
	end)

	eachChild(arg_5_0, function(arg_7_0)
		local var_7_0 = arg_7_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		if not var_7_0 then
			return
		end

		table.IpairsCArray(TimelineHelper.GetTimelineTracks(var_7_0), function(arg_8_0, arg_8_1)
			if var_5_0[arg_8_1.name] then
				local var_8_0 = GameObject.Find(var_5_0[arg_8_1.name])

				if var_8_0 then
					TimelineHelper.SetSceneBinding(var_7_0, arg_8_1, var_8_0)
				else
					warning(string.format("轨道%s需要绑定的物体%s不存在", arg_8_1.name, var_5_0[arg_8_1.name]))
				end
			end
		end)
	end)
end

function var_0_0.InitSubtitle(arg_9_0, arg_9_1)
	local var_9_0 = GameObject.Find("[subtitle]")

	if var_9_0 then
		var_9_0:GetComponent(typeof(Canvas)).worldCamera = pg.UIMgr.GetInstance().overlayCameraComp
	end

	local function var_9_1(arg_10_0)
		local var_10_0 = tonumber(arg_10_0)

		if not var_10_0 then
			return arg_10_0
		end

		local var_10_1 = pg.dorm3d_subtitle[var_10_0].subtitle

		return (HXSet.hxLan(string.gsub(var_10_1, "$dorm3d", arg_9_1)))
	end

	BLHXTimeline.SubtitleMixer.func = var_9_1
end

function var_0_0.CheckTrackType(arg_11_0, arg_11_1)
	return tostring(arg_11_0:GetType()) == arg_11_1
end

function var_0_0.InitCriAtomTrack(arg_12_0)
	var_0_0.EachSubDirector(arg_12_0, function(arg_13_0, arg_13_1)
		if var_0_0.CheckTrackType(arg_13_1, "BLHXTimeline.BLHXCriAtomTrack") then
			local var_13_0 = ReflectionHelp.RefCallMethod(typeof("BLHXTimeline.BLHXCriAtomTrack"), "GetClips", arg_13_1)

			table.IpairsCArray(var_13_0, function(arg_14_0, arg_14_1)
				local var_14_0 = ReflectionHelp.RefGetProperty(arg_14_1:GetType(), "asset", arg_14_1)
				local var_14_1 = ReflectionHelp.RefGetField(typeof("BLHXTimeline.BLHXCriAtomClip"), "cueSheet", var_14_0)

				pg.CriMgr.GetInstance():LoadCueSheet(var_14_1, nil, true)
			end)
		end
	end)
end

function var_0_0.UnloadPlayable(arg_15_0)
	var_0_0.UnloadCriAtomTrack(arg_15_0)
end

function var_0_0.UnloadCriAtomTrack(arg_16_0)
	var_0_0.EachSubDirector(arg_16_0, function(arg_17_0, arg_17_1)
		if var_0_0.CheckTrackType(arg_17_1, "BLHXTimeline.BLHXCriAtomTrack") then
			local var_17_0 = ReflectionHelp.RefCallMethod(typeof("BLHXTimeline.BLHXCriAtomTrack"), "GetClips", arg_17_1)

			table.IpairsCArray(var_17_0, function(arg_18_0, arg_18_1)
				local var_18_0 = ReflectionHelp.RefGetProperty(arg_18_1:GetType(), "asset", arg_18_1)
				local var_18_1 = ReflectionHelp.RefGetField(typeof("BLHXTimeline.BLHXCriAtomClip"), "cueSheet", var_18_0)

				pg.CriMgr.GetInstance():UnloadCueSheet(var_18_1)
			end)
		end
	end)
end
