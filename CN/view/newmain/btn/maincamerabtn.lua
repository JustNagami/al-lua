local var_0_0 = class("MainCameraBtn", import(".MainBaseBtn"))

function var_0_0.OnClick(arg_1_0)
	arg_1_0:OpenCamera()
end

function var_0_0.Flush(arg_2_0, arg_2_1)
	setActive(arg_2_0._tf, true)
end

function var_0_0.OpenCamera(arg_3_0)
	if pg.SdkMgr.GetInstance():IsYunPackage() then
		pg.TipsMgr.GetInstance():ShowTips("指挥官，当前平台不支持该功能哦")

		return
	end

	local var_3_0
	local var_3_1

	local function var_3_2()
		arg_3_0:emit(NewMainMediator.GO_SNAPSHOT)
	end

	local function var_3_3()
		if PermissionHelper.IsAndroid() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("apply_permission_camera_tip3"),
				onYes = function()
					PermissionHelper.RequestCamera(var_3_2, var_3_3)
				end
			})
		elseif PermissionHelper.IsIOS() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("apply_permission_camera_tip2")
			})
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("apply_permission_camera_tip1"),
		onYes = function()
			PermissionHelper.RequestCamera(var_3_2, var_3_3)
		end
	})
end

return var_0_0
