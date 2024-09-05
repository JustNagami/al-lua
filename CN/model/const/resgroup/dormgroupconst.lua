local var_0_0 = {}

var_0_0.DormGroupName = "DORM"
var_0_0.DormMgr = nil

function var_0_0.GetDormMgr()
	if not var_0_0.DormMgr then
		var_0_0.DormMgr = BundleWizard.Inst:GetGroupMgr(var_0_0.DormGroupName)
	end

	return var_0_0.DormMgr
end

var_0_0.NotifyDormDownloadStart = "DormGroupConst.NotifyDormDownloadStart"
var_0_0.NotifyDormDownloadProgress = "DormGroupConst.NotifyDormDownloadProgress"
var_0_0.NotifyDormDownloadFinish = "DormGroupConst.NotifyDormDownloadFinish"

function var_0_0.VerifyDormFileName(arg_2_0)
	return GroupHelper.VerifyFile(var_0_0.DormGroupName, arg_2_0)
end

function var_0_0.CalcDormListSize(arg_3_0)
	local var_3_0 = GroupHelper.CreateArrByLuaFileList(var_0_0.DormGroupName, arg_3_0)
	local var_3_1 = GroupHelper.CalcSizeWithFileArr(var_0_0.DormGroupName, var_3_0)
	local var_3_2 = HashUtil.BytesToString(var_3_1)

	return var_3_1, var_3_2
end

function var_0_0.IsDormNeedCheck()
	if Application.isEditor then
		return false
	end

	if GroupHelper.IsGroupVerLastest(var_0_0.DormGroupName) then
		return false
	end

	if not GroupHelper.IsGroupWaitToUpdate(var_0_0.DormGroupName) then
		return false
	end

	return true
end

function var_0_0.DormDownload(arg_5_0)
	local var_5_0 = {}

	if var_0_0.IsDormNeedCheck() then
		local var_5_1 = arg_5_0.isShowBox
		local var_5_2 = pg.FileDownloadMgr.GetInstance():IsNeedRemind()
		local var_5_3 = IsUsingWifi()
		local var_5_4 = var_5_1 and var_5_2
		local var_5_5 = arg_5_0.fileList

		if #var_5_5 > 0 then
			if var_5_4 then
				local var_5_6, var_5_7 = var_0_0.CalcDormListSize(var_5_5)

				if var_5_6 > 0 then
					table.insert(var_5_0, function(arg_6_0)
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							modal = true,
							locked = true,
							hideToggle = true,
							type = MSGBOX_TYPE_FILE_DOWNLOAD,
							content = string.format(i18n("file_down_msgbox", var_5_7)),
							onYes = arg_6_0,
							onNo = arg_5_0.onNo,
							onClose = arg_5_0.onClose
						})
					end)
				end
			end

			table.insert(var_5_0, function(arg_7_0)
				var_0_0.DormDownloadLock = {
					curSize = 0,
					totalSize = 1,
					roomId = arg_5_0.roomId
				}

				local var_7_0 = {
					groupName = var_0_0.DormGroupName,
					fileNameList = var_5_5
				}
				local var_7_1 = {
					dataList = {
						var_7_0
					},
					onFinish = arg_7_0
				}

				var_0_0.ExtraDownload(var_7_1.dataList[1], var_7_1.onFinish)
			end)
			table.insert(var_5_0, function(arg_8_0, arg_8_1)
				pg.m02:sendNotification(var_0_0.NotifyDormDownloadFinish, var_0_0.DormDownloadLock.roomId)

				var_0_0.DormDownloadLock = nil

				arg_8_0(arg_8_1)
			end)
		end
	end

	seriesAsync(var_5_0, arg_5_0.finishFunc)
end

function var_0_0.ExtraDownload(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0.groupName
	local var_9_1 = #arg_9_0.fileNameList > 0 and GroupHelper.CreateArrByLuaFileList(var_9_0, arg_9_0.fileNameList) or nil

	if not var_9_1 or var_9_1.Length == 0 then
		arg_9_1()

		return
	end

	local var_9_2 = GroupHelper.GetGroupMgrByName(var_9_0)

	local function var_9_3(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
		if var_0_0.DormDownloadLock.curSize ~= arg_10_2 then
			var_0_0.DormDownloadLock.curSize = arg_10_2
			var_0_0.DormDownloadLock.totalSize = arg_10_3

			pg.m02:sendNotification(var_0_0.NotifyDormDownloadProgress)
		end
	end

	local function var_9_4(arg_11_0, arg_11_1)
		return
	end

	local function var_9_5(arg_12_0, arg_12_1)
		warning("----------------------Tag 单组下载完成,恢复UpdateD----------------------")

		var_9_2.isPauseUpdateD = false

		warning("----------------------Tag 单组下载完成,调用groupComplete----------------------")

		if pg.dorm3d_rooms[var_0_0.DormDownloadLock.roomId].type == 2 then
			local var_12_0 = pg.dorm3d_rooms[var_0_0.DormDownloadLock.roomId].character[1]

			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDownload(var_12_0, 1))
		end

		arg_9_1(true)
	end

	local var_9_6

	local function var_9_7(arg_13_0, arg_13_1)
		if pg.dorm3d_rooms[var_0_0.DormDownloadLock.roomId].type == 2 then
			local var_13_0 = pg.dorm3d_rooms[var_0_0.DormDownloadLock.roomId].character[1]

			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDownload(var_13_0, 1))
		end

		local function var_13_1()
			var_0_0.ExtraDownload(arg_9_0, arg_9_1)
		end

		local function var_13_2()
			var_9_2.isPauseUpdateD = false

			arg_9_1()
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			locked = true,
			content = i18n("file_down_mgr_error", arg_13_0, arg_13_1),
			onYes = var_13_1,
			onNo = var_13_2,
			onClose = var_13_2,
			weight = LayerWeightConst.TOP_LAYER
		})
	end

	pg.m02:sendNotification(var_0_0.NotifyDormDownloadStart)
	warning("----------------------Tag 停止UpdateD----------------------")

	var_9_2.isPauseUpdateD = true

	warning("----------------------Tag 开始UpdateFileArray----------------------")
	var_9_2:UpdateFileArray(var_9_1, var_9_3, var_9_4, var_9_5, var_9_7)
end

function var_0_0.IsDownloading()
	local var_16_0 = GroupHelper.GetGroupMgrByName(var_0_0.DormGroupName)

	return var_0_0.DormDownloadLock or GroupHelper.GetGroupMgrByName(var_0_0.DormGroupName).state == DownloadState.Updating
end

function var_0_0.GetDownloadList()
	local var_17_0 = {}
	local var_17_1 = GroupHelper.GetGroupMgrByName(var_0_0.DormGroupName)

	if var_17_1.toUpdate then
		local var_17_2 = var_17_1.toUpdate.Count

		for iter_17_0 = 0, var_17_2 - 1 do
			local var_17_3 = var_17_1.toUpdate[iter_17_0]
			local var_17_4 = var_17_3[0]
			local var_17_5 = var_17_3[1]
			local var_17_6 = var_17_3[2]

			table.insert(var_17_0, var_17_4)
		end
	end

	return var_17_0
end

function var_0_0.GetDownloadResourceDic()
	local var_18_0 = {}

	for iter_18_0, iter_18_1 in ipairs(DormGroupConst.GetDownloadList()) do
		local var_18_1 = "common"

		for iter_18_2, iter_18_3 in ipairs({
			"assets/dorm3d/character"
		}) do
			if string.find(iter_18_1, iter_18_3) then
				var_18_1 = string.split(string.gsub(iter_18_1, iter_18_3, ""), "/")[1]

				break
			end
		end

		var_18_0[var_18_1] = var_18_0[var_18_1] or {}

		table.insert(var_18_0[var_18_1], iter_18_1)
	end

	return var_18_0
end

function var_0_0.DelDir(arg_19_0)
	local var_19_0 = Application.persistentDataPath .. "/AssetBundles/"
	local var_19_1 = var_19_0 .. arg_19_0

	if not var_19_0:match("/$") then
		var_19_0 = var_19_0 .. "/"
	end

	warning(var_19_1)
	warning(var_19_0)

	local var_19_2 = {}
	local var_19_3 = System.IO.Directory
	local var_19_4 = ReflectionHelp.RefGetField(typeof("System.IO.SearchOption"), "AllDirectories", nil)

	warning(tostring(var_19_3.Exists(var_19_1)))

	if var_19_3.Exists(var_19_1) then
		local var_19_5 = var_19_3.GetFiles(var_19_1, "*", var_19_4)

		warning(var_19_5.Length)

		for iter_19_0 = 0, var_19_5.Length - 1 do
			local var_19_6 = var_19_5[iter_19_0]:gsub("\\", "/"):gsub("^" .. var_19_0, "")

			warning(var_19_6)
			table.insert(var_19_2, var_19_6)
		end
	end

	local var_19_7 = #var_19_2

	if var_19_7 > 0 then
		local var_19_8 = System.Array.CreateInstance(typeof(System.String), var_19_7)

		for iter_19_1 = 0, var_19_7 - 1 do
			var_19_8[iter_19_1] = var_19_2[iter_19_1 + 1]
		end

		var_0_0.GetDormMgr():DelFile(var_19_8)
	end
end

return var_0_0
