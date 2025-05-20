local var_0_0 = class("MusicPlayer")

var_0_0.NO_PLAY_MUSIC_NOTIFICATION = "MusicPlayer.NO_PLAY_MUSIC_NOTIFICATION"
var_0_0.CALLBACK_DIC = {
	startCall = function(arg_1_0)
		return
	end,
	progressCall = function(arg_2_0)
		return
	end,
	noPlayCall = function()
		return
	end
}

function var_0_0.Ctor(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0:ChangeData(arg_4_1)

	arg_4_0.callbackDic = arg_4_2

	arg_4_0:Reflush(arg_4_1.index)
end

function var_0_0.ChangeData(arg_5_0, arg_5_1)
	for iter_5_0, iter_5_1 in pairs(arg_5_1) do
		arg_5_0[iter_5_0] = iter_5_1
	end
end

function var_0_0.Reflush(arg_6_0, arg_6_1)
	arg_6_0.finishDic = {}

	if not arg_6_0.list then
		arg_6_0.list = getProxy(AppreciateProxy):getAlbumMusicList(arg_6_0.albumName)
	end

	arg_6_0.count = #arg_6_0.list

	if arg_6_0.count == 0 then
		pg.TipsMgr.GetInstance():ShowTips("this album without any song")
		existCall(arg_6_0.callbackDic.noPlayCall)
		pg.m02:sendNotification(MusicPlayer.NO_PLAY_MUSIC_NOTIFICATION)

		return
	end

	if not arg_6_1 then
		switch(arg_6_0.loopType, {
			one = function()
				arg_6_0.index = 1
			end,
			list = function()
				arg_6_0.index = 1
			end,
			random = function()
				arg_6_0.index = math.random(arg_6_0.count)
			end
		})
	end

	arg_6_0:Play()
end

function var_0_0.Play(arg_10_0)
	local var_10_0 = pg.music_collect_config[arg_10_0.list[arg_10_0.index]].music

	if not arg_10_0.cueData then
		arg_10_0.cueData = CueData.GetCueData()
	end

	arg_10_0.cueData.channelName = pg.CriMgr.C_GALLERY_MUSIC
	arg_10_0.cueData.cueSheetName = var_10_0
	arg_10_0.cueData.cueName = ""

	CriWareMgr.Inst:PlaySound(arg_10_0.cueData, CriWareMgr.CRI_FADE_TYPE.FADE_INOUT, function(arg_11_0)
		arg_10_0.playbackInfo = arg_11_0

		arg_10_0.playbackInfo:SetIgnoreAutoUnload(true)

		arg_10_0.finishDic[arg_10_0.index] = true

		existCall(arg_10_0.callbackDic.startCall, arg_10_0.playbackInfo:GetLength())

		if not arg_10_0.timer then
			arg_10_0.timer = Timer.New(function()
				if not arg_10_0.playbackInfo then
					return
				end

				existCall(arg_10_0.callbackDic.progressCall, arg_10_0.playbackInfo:GetTime())

				if arg_10_0.playbackInfo.playback:GetStatus():ToInt() == 3 then
					arg_10_0:Finish()
				end
			end, 0.033, -1)

			arg_10_0.timer:Start()
		end
	end)
end

function var_0_0.Stop(arg_13_0)
	if not arg_13_0.playbackInfo then
		return
	end

	arg_13_0.playbackInfo:SetStartTime(0)
	CriWareMgr.Inst:StopSound(arg_13_0.cueData, CriWareMgr.CRI_FADE_TYPE.NONE)

	arg_13_0.playbackInfo = nil

	if arg_13_0.timer then
		arg_13_0.timer:Stop()

		arg_13_0.timer = nil
	end
end

function var_0_0.Finish(arg_14_0, arg_14_1)
	arg_14_0:Stop()

	if table.getCount(arg_14_0.finishDic) < arg_14_0.count then
		switch(arg_14_0.loopType, {
			one = function()
				arg_14_0.index = arg_14_0.index
			end,
			list = function()
				arg_14_1 = arg_14_1 or 1
				arg_14_0.index = (arg_14_0.index + arg_14_1 - 1) % arg_14_0.count + 1
			end,
			random = function()
				local var_17_0 = underscore.filter(underscore.keys(arg_14_0.list), function(arg_18_0)
					return not arg_14_0.finishDic[arg_18_0]
				end)

				arg_14_0.index = var_17_0[math.random(#var_17_0)]
			end
		})
		arg_14_0:Play()
	else
		arg_14_0.list = nil

		arg_14_0:Reflush()
	end
end

function var_0_0.Next(arg_19_0)
	arg_19_0:Finish(1)
end

function var_0_0.Last(arg_20_0)
	arg_20_0:Finish(-1)
end

function var_0_0.SetProgress(arg_21_0, arg_21_1)
	if not arg_21_0.playbackInfo then
		return
	end

	arg_21_0.progress = arg_21_1

	if not arg_21_0.playbackInfo.playback:IsPaused() then
		arg_21_0:Resume()
	end
end

function var_0_0.Resume(arg_22_0)
	if not arg_22_0.playbackInfo then
		return
	end

	if arg_22_0.progress then
		arg_22_0.playbackInfo:SetStartTimeAndPlay(arg_22_0.progress)
	else
		arg_22_0.playbackInfo.playback:Resume(CriWare.CriAtomEx.ResumeMode.PausedPlayback)
	end

	arg_22_0.progress = nil

	arg_22_0.timer:Resume()
end

function var_0_0.Pause(arg_23_0)
	if not arg_23_0.playbackInfo then
		return
	end

	arg_23_0.playbackInfo.playback:Pause()
	arg_23_0.timer:Pause()
end

function var_0_0.IsPaused(arg_24_0)
	if not arg_24_0.playbackInfo then
		return
	end

	return arg_24_0.playbackInfo.playback:IsPaused()
end

function var_0_0.GetCurrentMusicId(arg_25_0)
	return arg_25_0.list[arg_25_0.index]
end

function var_0_0.Dispose(arg_26_0)
	arg_26_0:Stop()
end

return var_0_0
