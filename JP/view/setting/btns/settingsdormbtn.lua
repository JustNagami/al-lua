local var_0_0 = class("SettingsDormBtn", import(".SettingsDownloadableBtn"))

function var_0_0.GetDownloadGroup(arg_1_0)
	return "DORM"
end

function var_0_0.Check(arg_2_0)
	local var_2_0 = arg_2_0:GetDownloadGroup()
	local var_2_1 = BundleWizard.Inst:GetGroupMgr(var_2_0)

	arg_2_0.timer = Timer.New(function()
		arg_2_0:UpdateDownLoadState()
	end, 0.5, -1)

	arg_2_0.timer:Start()
	arg_2_0:UpdateDownLoadState()

	if var_2_1.state == DownloadState.None then
		var_2_1:CheckD()
	end

	onButton(arg_2_0, arg_2_0._tf, function()
		if DormGroupConst.IsDownloading() then
			pg.TipsMgr.GetInstance():ShowTips("アセットダウンロード中です")

			return
		end

		local var_4_0 = var_2_1.state

		if var_4_0 == DownloadState.CheckFailure then
			var_2_1:CheckD()
		elseif var_4_0 == DownloadState.CheckToUpdate or var_4_0 == DownloadState.UpdateFailure then
			VersionMgr.Inst:RequestUIForUpdateD(var_2_0, true)
		end
	end, SFX_PANEL)
end

function var_0_0.GetLocaltion(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = ""

	if arg_5_1 == DownloadState.None then
		if arg_5_2 == 1 then
			var_5_0 = i18n("word_soundfiles_download_title")
		elseif arg_5_2 == 2 then
			var_5_0 = i18n("word_soundfiles_download")
		end
	elseif arg_5_1 == DownloadState.Checking then
		if arg_5_2 == 1 then
			var_5_0 = i18n("word_soundfiles_checking_title")
		elseif arg_5_2 == 2 then
			var_5_0 = i18n("word_soundfiles_checking")
		end
	elseif arg_5_1 == DownloadState.CheckToUpdate then
		if arg_5_2 == 1 then
			var_5_0 = i18n("word_soundfiles_checkend_title")
		elseif arg_5_2 == 2 then
			var_5_0 = i18n("word_soundfiles_checkend")
		end
	elseif arg_5_1 == DownloadState.CheckOver then
		if arg_5_2 == 1 then
			var_5_0 = i18n("word_soundfiles_checkend_title")
		elseif arg_5_2 == 2 then
			var_5_0 = i18n("word_soundfiles_noneedupdate")
		end
	elseif arg_5_1 == DownloadState.CheckFailure then
		if arg_5_2 == 1 then
			var_5_0 = i18n("word_soundfiles_checkfailed")
		elseif arg_5_2 == 2 then
			var_5_0 = i18n("word_soundfiles_retry")
		end
	elseif arg_5_1 == DownloadState.Updating then
		if arg_5_2 == 1 then
			var_5_0 = i18n("word_soundfiles_update")
		end
	elseif arg_5_1 == DownloadState.UpdateSuccess then
		if arg_5_2 == 1 then
			var_5_0 = i18n("word_soundfiles_update_end_title")
		elseif arg_5_2 == 2 then
			var_5_0 = i18n("word_soundfiles_update_end")
		end
	elseif arg_5_1 == DownloadState.UpdateFailure then
		if arg_5_2 == 1 then
			var_5_0 = i18n("word_soundfiles_update_failed")
		elseif arg_5_2 == 2 then
			var_5_0 = i18n("word_soundfiles_update_retry")
		end
	end

	return var_5_0
end

function var_0_0.GetTitle(arg_6_0)
	return i18n("setting_resdownload_title_dorm")
end

return var_0_0
