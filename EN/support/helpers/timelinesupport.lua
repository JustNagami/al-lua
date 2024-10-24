TimelineSupport = {}

local var_0_0 = TimelineSupport

function var_0_0.InitTimeline(arg_1_0)
	var_0_0.DynamicBinding(arg_1_0)
	var_0_0.InitCriAtomTrack(arg_1_0)
end

function var_0_0.DynamicBinding(arg_2_0)
	local var_2_0 = _.reduce(pg.dorm3d_timeline_dynamic_binding, {}, function(arg_3_0, arg_3_1)
		if arg_3_1.track_name then
			arg_3_0[arg_3_1.track_name] = arg_3_1.object_name
		end

		return arg_3_0
	end)

	eachChild(arg_2_0, function(arg_4_0)
		local var_4_0 = arg_4_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		if not var_4_0 then
			return
		end

		table.IpairsCArray(TimelineHelper.GetTimelineTracks(var_4_0), function(arg_5_0, arg_5_1)
			if var_2_0[arg_5_1.name] then
				local var_5_0 = GameObject.Find(var_2_0[arg_5_1.name])

				if var_5_0 then
					TimelineHelper.SetSceneBinding(var_4_0, arg_5_1, var_5_0)
				else
					warning(string.format("轨道%s需要绑定的物体%s不存在", arg_5_1.name, var_2_0[arg_5_1.name]))
				end
			end
		end)
	end)
end

function var_0_0.InitSubtitle(arg_6_0, arg_6_1)
	local var_6_0 = GameObject.Find("[subtitle]")

	if var_6_0 then
		var_6_0:GetComponent(typeof(Canvas)).worldCamera = pg.UIMgr.GetInstance().overlayCameraComp
	end

	eachChild(arg_6_0, function(arg_7_0)
		local var_7_0 = arg_7_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		if not var_7_0 then
			return
		end

		table.IpairsCArray(TimelineHelper.GetTimelineTracks(var_7_0), function(arg_8_0, arg_8_1)
			if var_0_0.CheckTrackType(arg_8_1, "Lens.Gameplay.Tools.SubtitleTrack") then
				local var_8_0 = ReflectionHelp.RefCallMethod(typeof("Lens.Gameplay.Tools.SubtitleTrack"), "GetClips", arg_8_1)

				table.IpairsCArray(var_8_0, function(arg_9_0, arg_9_1)
					local var_9_0 = ReflectionHelp.RefGetProperty(arg_9_1:GetType(), "asset", arg_9_1)
					local var_9_1 = ReflectionHelp.RefGetField(var_9_0:GetType(), "behaviour", var_9_0)
					local var_9_2 = ReflectionHelp.RefGetField(var_9_1:GetType(), "subtitle", var_9_1)
					local var_9_3 = string.gsub(var_9_2, "{dorm3d}", arg_6_1)

					ReflectionHelp.RefSetField(var_9_1:GetType(), "subtitle", var_9_1, var_9_3)
				end)
			end
		end)
	end)
end

function var_0_0.CheckTrackType(arg_10_0, arg_10_1)
	return tostring(arg_10_0:GetType()) == arg_10_1
end

function var_0_0.InitCriAtomTrack(arg_11_0)
	eachChild(arg_11_0, function(arg_12_0)
		local var_12_0 = arg_12_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		if not var_12_0 then
			return
		end

		table.IpairsCArray(TimelineHelper.GetTimelineTracks(var_12_0), function(arg_13_0, arg_13_1)
			if var_0_0.CheckTrackType(arg_13_1, "CriTimeline.Atom.CriAtomTrack") then
				local var_13_0 = ReflectionHelp.RefCallMethod(typeof("CriTimeline.Atom.CriAtomTrack"), "GetClips", arg_13_1)

				table.IpairsCArray(var_13_0, function(arg_14_0, arg_14_1)
					local var_14_0 = ReflectionHelp.RefGetProperty(arg_14_1:GetType(), "asset", arg_14_1)
					local var_14_1 = ReflectionHelp.RefGetField(typeof("CriTimeline.Atom.CriAtomClip"), "cueSheet", var_14_0)

					pg.CriMgr.GetInstance():LoadCueSheet(var_14_1)
				end)
			end
		end)
	end)
end
