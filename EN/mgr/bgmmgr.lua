pg = pg or {}

local var_0_0 = pg

var_0_0.BgmMgr = singletonClass("BgmMgr")

local var_0_1 = var_0_0.BgmMgr

function var_0_1.Ctor(arg_1_0)
	return
end

function var_0_1.Init(arg_2_0, arg_2_1)
	print("initializing bgm manager...")
	arg_2_0:Clear()
	arg_2_1()
end

function var_0_1.Clear(arg_3_0)
	arg_3_0._stack = {}
	arg_3_0._dictionary = {}
	arg_3_0._musicData = {}
	arg_3_0._musicCallbackDic = {}
end

function var_0_1.Push(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if not arg_4_0._dictionary[arg_4_1] then
		table.insert(arg_4_0._stack, arg_4_1)
	end

	arg_4_0._dictionary[arg_4_1] = arg_4_2
	arg_4_0._musicData[arg_4_1] = arg_4_3

	arg_4_0:CheckPlay()
end

function var_0_1.Pop(arg_5_0, arg_5_1)
	if arg_5_0._dictionary[arg_5_1] then
		table.removebyvalue(arg_5_0._stack, arg_5_1)

		arg_5_0._dictionary[arg_5_1] = nil
		arg_5_0._musicData[arg_5_1] = nil

		arg_5_0:CheckPlay()
	end
end

function var_0_1.CheckPlay(arg_6_0)
	if #arg_6_0._stack == 0 then
		return
	end

	local var_6_0 = arg_6_0._stack[#arg_6_0._stack]
	local var_6_1 = arg_6_0._dictionary[var_6_0]
	local var_6_2 = arg_6_0._musicData[var_6_0]

	if arg_6_0.isDirty or arg_6_0._now ~= var_6_1 then
		arg_6_0._now = var_6_1
		arg_6_0._nowData = var_6_2

		arg_6_0:ContinuePlay()
	end
end

function var_0_1.TempPlay(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.isDirty = true

	arg_7_0:FinalPlay(arg_7_1, arg_7_2)
end

function var_0_1.StopPlay(arg_8_0)
	arg_8_0.isDirty = true

	arg_8_0:FinalPause()
end

function var_0_1.ContinuePlay(arg_9_0)
	arg_9_0.isDirty = false

	arg_9_0:FinalPlay(arg_9_0._now, arg_9_0._nowData)
end

function var_0_1.RegisterMusicCallback(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	for iter_10_0, iter_10_1 in pairs(arg_10_3) do
		arg_10_0._musicCallbackDic[iter_10_0] = arg_10_0._musicCallbackDic[iter_10_0] or {}
		arg_10_0._musicCallbackDic[iter_10_0][arg_10_2] = arg_10_0._musicCallbackDic[iter_10_0][arg_10_2] or {}

		table.insert(arg_10_0._musicCallbackDic[iter_10_0][arg_10_2], {
			iter_10_1,
			arg_10_1
		})
	end
end

function var_0_1.UnregisterMusicCallback(arg_11_0, arg_11_1)
	for iter_11_0, iter_11_1 in pairs(arg_11_0._musicCallbackDic) do
		for iter_11_2, iter_11_3 in pairs(iter_11_1) do
			for iter_11_4 = #iter_11_3, 1, -1 do
				if iter_11_3[iter_11_4][2] == arg_11_1 then
					table.remove(iter_11_3, iter_11_4)
				end
			end
		end
	end
end

function var_0_1.GetNow(arg_12_0)
	return arg_12_0._now, arg_12_0._nowData
end

function var_0_1.GetPlayType(arg_13_0, arg_13_1)
	return switch(arg_13_1, {
		MainMusicPlayer = function()
			return "music"
		end,
		TempMusicPlayer = function()
			return "music"
		end
	}, function()
		return "bgm"
	end)
end

function var_0_1.FinalPlay(arg_17_0, arg_17_1, arg_17_2)
	if not arg_17_1 then
		return
	end

	local var_17_0 = arg_17_0:GetPlayType(arg_17_1)

	if arg_17_0.playType and arg_17_0.playType ~= var_17_0 then
		arg_17_0:FinalPause()
	end

	arg_17_0.playType = var_17_0

	if arg_17_0.playType == "music" then
		switch(arg_17_1, {
			MainMusicPlayer = function()
				arg_17_0:PlayMainMusicPlayer(arg_17_2, arg_17_1)
			end,
			TempMusicPlayer = function()
				arg_17_0:NewMusicPlayer(arg_17_2, arg_17_1)
			end
		})
	elseif arg_17_0.playType == "bgm" then
		var_0_0.CriMgr.GetInstance():PlayBGM(arg_17_1)
	end
end

function var_0_1.FinalPause(arg_20_0)
	if arg_20_0.playType == "music" then
		arg_20_0.musicPlayer:Pause()
	elseif arg_20_0.playType == "bgm" then
		var_0_0.CriMgr.GetInstance():StopBGM()
	end
end

function var_0_1.GetMusicPlayer(arg_21_0)
	return arg_21_0.musicPlayer
end

function var_0_1.PlayMainMusicPlayer(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_0.musicPlayer and arg_22_0.musicPlayer.music == arg_22_2 then
		arg_22_0.musicPlayer:ChangeData(arg_22_1)

		arg_22_0.musicPlayer.music = arg_22_2

		if arg_22_0.musicPlayer:IsPaused() then
			arg_22_0.musicPlayer:Resume()
		else
			arg_22_0.musicPlayer:Reflush(arg_22_0.musicPlayer.index)
		end

		return arg_22_0.musicPlayer
	else
		return arg_22_0:NewMusicPlayer(arg_22_1, arg_22_2)
	end
end

function var_0_1.NewMusicPlayer(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0:RemoveMusicPlayer()

	local var_23_0 = {}

	for iter_23_0, iter_23_1 in pairs(MusicPlayer.CALLBACK_DIC) do
		var_23_0[iter_23_0] = function(...)
			local var_24_0 = checkExist(arg_23_0._musicCallbackDic, {
				iter_23_0
			}, {
				arg_23_2
			})

			for iter_24_0, iter_24_1 in ipairs(var_24_0 or {}) do
				iter_24_1[1](...)
			end
		end
	end

	arg_23_0.musicPlayer = MusicPlayer.New(arg_23_1, var_23_0)
	arg_23_0.musicPlayer.music = arg_23_2

	return arg_23_0.musicPlayer
end

function var_0_1.RemoveMusicPlayer(arg_25_0)
	if not arg_25_0.musicPlayer then
		return
	end

	arg_25_0.musicPlayer:Dispose()

	arg_25_0.musicPlayer = nil
end
