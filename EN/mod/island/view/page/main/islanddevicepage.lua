local var_0_0 = class("IslandDevicePage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandDeviceUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.systemTimeUtil = LocalSystemTimeUtil.New()
	arg_2_0.timeTxt = arg_2_0._tf:Find("panel/time"):GetComponent(typeof(Text))
	arg_2_0.timeEnTxt = arg_2_0._tf:Find("panel/time/time_en"):GetComponent(typeof(Text))
	arg_2_0.batteryTxt = arg_2_0._tf:Find("panel/battery/Text"):GetComponent(typeof(Text))
	arg_2_0.electric = {
		arg_2_0._tf:Find("panel/battery/kwh/1"),
		arg_2_0._tf:Find("panel/battery/kwh/2"),
		arg_2_0._tf:Find("panel/battery/kwh/3")
	}
	arg_2_0.btnContainer = arg_2_0._tf:Find("panel/content")
	arg_2_0.btnUIList = UIItemList.New(arg_2_0.btnContainer, arg_2_0.btnContainer:Find("tpl"))

	local var_2_0 = arg_2_0._tf:Find("panel/banner")

	arg_2_0.scrollSnap = BannerScrollRect4Mellow.New(var_2_0:Find("mask/content"), var_2_0:Find("dots"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("close"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("panel/exit"), function()
		arg_3_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	arg_3_0:InitBtns()
	arg_3_0:InitBanner()
end

function var_0_0.InitBtns(arg_6_0)
	arg_6_0.btnUIList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventInit then
			local var_7_0 = arg_6_0.btnList[arg_7_1 + 1]
			local var_7_1 = pg.island_main_btns[var_7_0]

			arg_7_2.name = var_7_1.btn_name

			setText(arg_7_2:Find("Text"), var_7_1.name)
			LoadImageSpriteAsync("islandbtnicon/" .. var_7_1.icon, arg_7_2:Find("icon"), true)
		elseif arg_7_0 == UIItemList.EventUpdate then
			local var_7_2 = arg_6_0.btnList[arg_7_1 + 1]
			local var_7_3 = pg.island_main_btns[var_7_2]
			local var_7_4 = var_7_3.ability_id ~= 0 and getProxy(IslandProxy):GetIsland():GetAblityAgency():HasAbility(var_7_3.ability_id)

			setActive(arg_7_2:Find("lock"), var_7_4)
			onButton(arg_6_0, arg_7_2:Find("lock"), function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_sell_lock"))
			end, SFX_PANEL)

			if var_7_3.open_page ~= "" then
				onButton(arg_6_0, arg_7_2:Find("icon"), function()
					arg_6_0:OpenPage(_G[var_7_3.open_page], unpack(var_7_3.page_param))
				end, SFX_PANEL)
			end
		end
	end)

	arg_6_0.btnList = pg.island_main_btns.get_id_list_by_main_type[2]
end

function var_0_0.InitBanner(arg_10_0)
	local var_10_0 = arg_10_0:GetBannerDisplays()

	arg_10_0.banners = var_10_0

	for iter_10_0 = 0, #var_10_0 - 1 do
		local var_10_1 = var_10_0[iter_10_0 + 1]
		local var_10_2 = arg_10_0.scrollSnap:AddChild()

		LoadImageSpriteAsync("islandbanner/" .. var_10_1.pic, var_10_2)
		onButton(arg_10_0, var_10_2, function()
			arg_10_0:BannerSkip(var_10_1)
		end, SFX_MAIN)
	end

	arg_10_0.scrollSnap:SetUp()
end

function var_0_0.OnShow(arg_12_0)
	arg_12_0:AddTimer()
	arg_12_0:Flush()
	arg_12_0:FlushTime()
end

function var_0_0.Flush(arg_13_0)
	arg_13_0.btnUIList:align(#arg_13_0.btnList)

	local var_13_0 = arg_13_0:GetBannerDisplays()

	if #arg_13_0.banners ~= #var_13_0 then
		arg_13_0.scrollSnap:Reset()
		arg_13_0:InitBanner()
	else
		arg_13_0.scrollSnap:Resume()
	end
end

function var_0_0.FlushBattery(arg_14_0)
	local var_14_0 = SystemInfo.batteryLevel

	if var_14_0 < 0 then
		var_14_0 = 1
	end

	local var_14_1 = math.floor(var_14_0 * 100)

	arg_14_0.batteryTxt.text = var_14_1 .. "%"

	local var_14_2 = 1 / #arg_14_0.electric

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.electric) do
		local var_14_3 = var_14_1 < (iter_14_0 - 1) * var_14_2

		setActive(iter_14_1, not var_14_3)
	end
end

function var_0_0.FlushTime(arg_15_0)
	arg_15_0.systemTimeUtil:SetUp(function(arg_16_0, arg_16_1, arg_16_2)
		if SettingsMainScenePanel.IsEnable24HourSystem() then
			arg_15_0.timeEnTxt.color = Color.New(1, 1, 1, 0)
		else
			arg_15_0.timeEnTxt.color = Color.New(1, 1, 1, 1)
			arg_16_0 = arg_16_0 > 12 and arg_16_0 - 12 or arg_16_0
		end

		if arg_16_0 < 10 then
			arg_16_0 = "0" .. arg_16_0
		end

		arg_15_0.timeTxt.text = arg_16_0 .. ":" .. arg_16_1
		arg_15_0.timeEnTxt.text = arg_16_2
	end)
end

function var_0_0.AddTimer(arg_17_0)
	arg_17_0:RemoveTimer()

	arg_17_0.timer = Timer.New(function()
		arg_17_0:FlushBattery()
	end, 60, -1)

	arg_17_0.timer:Start()
end

function var_0_0.RemoveTimer(arg_19_0)
	if arg_19_0.timer then
		arg_19_0.timer:Stop()

		arg_19_0.timer = nil
	end
end

function var_0_0.OnHide(arg_20_0)
	arg_20_0:RemoveTimer()
end

function var_0_0.OnDestroy(arg_21_0)
	arg_21_0.systemTimeUtil:Dispose()

	arg_21_0.systemTimeUtil = nil

	arg_21_0.scrollSnap:Dispose()

	arg_21_0.scrollSnap = nil
end

function var_0_0.GetBannerDisplays(arg_22_0)
	return underscore(pg.island_banner.all):chain():map(function(arg_23_0)
		return pg.island_banner[arg_23_0]
	end):select(function(arg_24_0)
		return pg.TimeMgr.GetInstance():inTime(arg_24_0.time)
	end):value()
end

function var_0_0.BannerSkip(arg_25_0, arg_25_1)
	if arg_25_1.type == IslandConst.BANNER_TYPE_OPEN_URL then
		Application.OpenURL(arg_25_1.param)
	elseif arg_25_1.type == IslandConst.BANNER_TYPE_SWITCH_MAP then
		arg_25_0:Hide()
		arg_25_0:emit(IslandMediator.SWITCH_MAP, unpack(arg_25_1.param))
	elseif arg_25_1.type == IslandConst.BANNER_TYPE_OPEN_PAGE then
		arg_25_0:OpenPage(_G[arg_25_1.param[1]], arg_25_1.param[2] and unpack(arg_25_1.param[2]))
	end
end

return var_0_0
