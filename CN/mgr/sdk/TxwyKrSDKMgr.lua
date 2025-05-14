local var_0_0 = {}
local var_0_1 = TxwyKrSdkMgr.inst

function var_0_0.CheckPretest()
	return NetConst.GATEWAY_HOST == "bl-kr-test.xdg.com" and NetConst.GATEWAY_PORT == 30001 or IsUnityEditor
end

function var_0_0.GetPNInfo()
	local var_2_0 = "null"
	local var_2_1 = "null"
	local var_2_2 = "not logged in"
	local var_2_3 = getProxy(PlayerProxy)

	if var_2_3 then
		var_2_0 = var_2_3:getData().id
		var_2_1 = var_2_3:getData().level
		var_2_2 = var_2_3:getData().name
	end

	local var_2_4 = "none"
	local var_2_5 = getProxy(UserProxy):getData()

	if var_2_5 then
		var_2_4 = getProxy(ServerProxy):getLastServer(var_2_5.uid).id
	end

	local var_2_6 = PNInfo.New(var_2_0, var_2_1)

	return {
		info = PNInfo.New(var_2_0, var_2_1),
		playerID = var_2_0,
		playerName = var_2_2,
		playerLevel = var_2_1,
		serverID = var_2_4
	}
end

function var_0_0.GetClientVer()
	return (BundleWizard.Inst:GetGroupMgr(GroupMainHelper.DefaultGroupName).CurrentVersion:ToString())
end

function var_0_0.GoSDkLoginScene()
	var_0_1:GoLoginScene()
end

function var_0_0.LoginSdk(arg_5_0)
	var_0_1:Login()
end

function var_0_0.SdkGateWayLogined()
	var_0_1:OnGatewayLogined()
end

function var_0_0.SdkLoginGetaWayFailed()
	var_0_1:OnLoginGatewayFailed()
end

function var_0_0.LogoutSDK()
	var_0_1:LocalLogout()
end

function var_0_0.EnterServer(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4, arg_9_5, arg_9_6)
	return
end

function var_0_0.SdkLevelUp(arg_10_0, arg_10_1)
	return
end

function var_0_0.UserCenter()
	local var_11_0 = var_0_0.GetPNInfo()
	local var_11_1 = var_0_0.GetClientVer()

	var_0_1:UserCenter(var_11_0.playerName, var_11_1, var_11_0.serverID, var_11_0.info)
end

function var_0_0.BugReport()
	local var_12_0 = var_0_0.GetPNInfo()
	local var_12_1 = var_0_0.GetClientVer()

	var_0_1:BugReport(var_12_0.playerName, var_12_1, var_12_0.serverID, var_12_0.info)
end

function var_0_0.StoreReview()
	local var_13_0 = var_0_0.GetPNInfo()
	local var_13_1 = var_0_0.GetClientVer()

	var_0_1:StoreReview(var_13_0.playerName, var_13_1, var_13_0.serverID, var_13_0.info)
end

function var_0_0.ShareImg(arg_14_0)
	var_0_1:ShareImg(arg_14_0, "")
end

function var_0_0.CompletedTutorial()
	return
end

function var_0_0.UnlockAchievement()
	return
end

function var_0_0.OnAndoridBackPress()
	PressBack()
end

function var_0_0.QueryWithProduct()
	return
end

function var_0_0.SdkPay(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4, arg_19_5, arg_19_6, arg_19_7, arg_19_8, arg_19_9)
	local var_19_0 = var_0_0.GetPNInfo()
	local var_19_1 = var_19_0.serverID .. "-" .. var_19_0.playerID .. "-" .. arg_19_4

	originalPrint("SdkPay nonce", tostring(var_19_1))
	var_0_1:Pay(arg_19_0, var_19_1, var_19_0.info)
end

function var_0_0.BindCPU()
	var_0_1:callSdkApi("bindCpu", nil)
end

function var_0_0.SwitchAccount()
	var_0_1:SwitchAccount()
end

function var_0_0.GetBiliServerId()
	local var_22_0 = var_0_1.serverId

	originalPrint("serverId : " .. var_22_0)

	return var_22_0
end

function var_0_0.GetChannelUID()
	local var_23_0 = var_0_1.channelUID

	originalPrint("channelUID : " .. var_23_0)

	return var_23_0
end

function var_0_0.GetLoginType()
	return var_0_1.loginType
end

function var_0_0.GetIsPlatform()
	return var_0_1.isPlatform
end

function var_0_0.GetDeviceModel()
	return var_0_1:GetDeviceModel()
end

function var_0_0.OnAndoridBackPress()
	PressBack()
end

function GoLoginScene()
	if not pg.m02 then
		originalPrint("game is not start")

		return
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LOGIN)
	gcAll()
end

function SDKLogined(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	if not pg.m02 then
		originalPrint("game is not start")

		return
	end

	local var_29_0 = User.New({
		type = 1,
		arg1 = arg_29_0,
		arg2 = arg_29_1,
		arg3 = arg_29_2,
		arg4 = arg_29_3
	})

	pg.m02:sendNotification(GAME.PLATFORM_LOGIN_DONE, {
		user = var_29_0
	})
end

function SDKLogouted(arg_30_0)
	if not pg.m02 then
		originalPrint("game is not start")

		return
	end

	pg.m02:sendNotification(GAME.LOGOUT, {
		code = arg_30_0
	})
end

function PaySuccess(arg_31_0, arg_31_1)
	if not pg.m02 then
		originalPrint("game is not start")

		return
	end

	getProxy(ShopsProxy):removeWaitTimer()
end

function PayFailed(arg_32_0, arg_32_1)
	getProxy(ShopsProxy):removeWaitTimer()

	arg_32_1 = tonumber(arg_32_1)

	if not arg_32_1 then
		return
	end

	pg.m02:sendNotification(GAME.CHARGE_FAILED, {
		payId = arg_32_0,
		code = arg_32_1
	})

	if arg_32_1 == -202 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("pay_cancel") .. arg_32_1)
	end
end

function var_0_0.Survey(arg_33_0)
	Application.OpenURL(arg_33_0)
end

function OnQueryProductsSucess(arg_34_0)
	local function var_34_0(arg_35_0, arg_35_1)
		for iter_35_0, iter_35_1 in ipairs(pg.pay_data_display.all) do
			local var_35_0 = pg.pay_data_display[iter_35_1]

			if var_35_0.id_str == arg_35_0 and var_35_0.money ~= arg_35_1 then
				-- block empty
			end
		end
	end

	local var_34_1 = arg_34_0.Count

	for iter_34_0 = 0, var_34_1 - 1 do
		local var_34_2 = arg_34_0[iter_34_0]
		local var_34_3 = var_34_2.ProductID
		local var_34_4 = var_34_2.Price

		var_34_0(var_34_3, var_34_4)
	end
end

function OnAdRewards(arg_36_0)
	return
end

function OnQuerySubscriptionSuccess(arg_37_0)
	return
end

function OnRequestPayment(arg_38_0)
	return
end

function OnQuerySuccess(arg_39_0, arg_39_1)
	return
end

return var_0_0
