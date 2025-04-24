TimelineSupport = {}

local var_0_0 = TimelineSupport

function var_0_0.InitTimeline(arg_1_0)
	var_0_0.DynamicBinding(arg_1_0)
	var_0_0.InitCriAtomTrack(arg_1_0)
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

	var_0_0.EachSubDirector(arg_9_0, function(arg_10_0, arg_10_1)
		if var_0_0.CheckTrackType(arg_10_1, "Lens.Gameplay.Tools.SubtitleTrack") then
			if EDITOR_TOOL then
				local function var_10_0(arg_11_0)
					local var_11_0 = tonumber(arg_11_0)

					if not var_11_0 then
						return arg_11_0
					end

					local var_11_1 = pg.dorm3d_subtitle[var_11_0].subtitle

					return (HXSet.hxLan(string.gsub(var_11_1, "$dorm3d", arg_9_1)))
				end

				Lens.Gameplay.Tools.SubtitleMixer.func = var_10_0
			else
				local var_10_1 = ReflectionHelp.RefCallMethod(typeof("Lens.Gameplay.Tools.SubtitleTrack"), "GetClips", arg_10_1)

				table.IpairsCArray(var_10_1, function(arg_12_0, arg_12_1)
					local var_12_0 = ReflectionHelp.RefGetProperty(arg_12_1:GetType(), "asset", arg_12_1)
					local var_12_1 = ReflectionHelp.RefGetField(var_12_0:GetType(), "behaviour", var_12_0)
					local var_12_2 = tonumber(ReflectionHelp.RefGetField(var_12_1:GetType(), "subtitle", var_12_1))

					if not var_12_2 then
						return
					end

					local var_12_3 = pg.dorm3d_subtitle[var_12_2].subtitle
					local var_12_4 = HXSet.hxLan(string.gsub(var_12_3, "$dorm3d", arg_9_1))

					ReflectionHelp.RefSetField(var_12_1:GetType(), "subtitle", var_12_1, var_12_4)
				end)
			end
		end
	end)
end

function var_0_0.CheckTrackType(arg_13_0, arg_13_1)
	return tostring(arg_13_0:GetType()) == arg_13_1
end

function var_0_0.InitCriAtomTrack(arg_14_0)
	var_0_0.EachSubDirector(arg_14_0, function(arg_15_0, arg_15_1)
		if var_0_0.CheckTrackType(arg_15_1, "CriTimeline.Atom.CriAtomTrack") then
			local var_15_0 = ReflectionHelp.RefCallMethod(typeof("CriTimeline.Atom.CriAtomTrack"), "GetClips", arg_15_1)

			table.IpairsCArray(var_15_0, function(arg_16_0, arg_16_1)
				local var_16_0 = ReflectionHelp.RefGetProperty(arg_16_1:GetType(), "asset", arg_16_1)
				local var_16_1 = ReflectionHelp.RefGetField(typeof("CriTimeline.Atom.CriAtomClip"), "cueSheet", var_16_0)

				pg.CriMgr.GetInstance():LoadCueSheet(var_16_1)
			end)
		end
	end)
end

function var_0_0.UnloadPlayable(arg_17_0)
	var_0_0.UnloadCriAtomTrack(arg_17_0)
end

function var_0_0.UnloadCriAtomTrack(arg_18_0)
	var_0_0.EachSubDirector(arg_18_0, function(arg_19_0, arg_19_1)
		if var_0_0.CheckTrackType(arg_19_1, "CriTimeline.Atom.CriAtomTrack") then
			local var_19_0 = ReflectionHelp.RefCallMethod(typeof("CriTimeline.Atom.CriAtomTrack"), "GetClips", arg_19_1)

			table.IpairsCArray(var_19_0, function(arg_20_0, arg_20_1)
				local var_20_0 = ReflectionHelp.RefGetProperty(arg_20_1:GetType(), "asset", arg_20_1)
				local var_20_1 = ReflectionHelp.RefGetField(typeof("CriTimeline.Atom.CriAtomClip"), "cueSheet", var_20_0)

				pg.CriMgr.GetInstance():UnloadCueSheet(var_20_1)
			end)
		end
	end)
end
