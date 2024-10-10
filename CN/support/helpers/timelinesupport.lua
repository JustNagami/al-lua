TimelineSupport = {}

local var_0_0 = TimelineSupport

function var_0_0.InitTimeline(arg_1_0)
	var_0_0.DynamicBinding(arg_1_0)
	var_0_0.InitSubtitle()
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

function var_0_0.InitSubtitle()
	local var_6_0 = GameObject.Find("[subtitle]")

	if var_6_0 then
		var_6_0:GetComponent(typeof(Canvas)).worldCamera = pg.UIMgr.GetInstance().overlayCameraComp
	end
end

function var_0_0.CheckTrackType(arg_7_0, arg_7_1)
	return tostring(arg_7_0:GetType()) == arg_7_1
end

function var_0_0.InitCriAtomTrack(arg_8_0)
	eachChild(arg_8_0, function(arg_9_0)
		local var_9_0 = arg_9_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		if not var_9_0 then
			return
		end

		table.IpairsCArray(TimelineHelper.GetTimelineTracks(var_9_0), function(arg_10_0, arg_10_1)
			if var_0_0.CheckTrackType(arg_10_1, "CriTimeline.Atom.CriAtomTrack") then
				local var_10_0 = ReflectionHelp.RefCallMethod(typeof("CriTimeline.Atom.CriAtomTrack"), "GetClips", arg_10_1)

				table.IpairsCArray(var_10_0, function(arg_11_0, arg_11_1)
					local var_11_0 = ReflectionHelp.RefGetProperty(arg_11_1:GetType(), "asset", arg_11_1)
					local var_11_1 = ReflectionHelp.RefGetField(typeof("CriTimeline.Atom.CriAtomClip"), "cueSheet", var_11_0)

					pg.CriMgr.GetInstance():LoadCueSheet(var_11_1)
				end)
			end
		end)
	end)
end
