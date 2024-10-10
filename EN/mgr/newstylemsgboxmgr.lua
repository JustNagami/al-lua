pg = pg or {}

local var_0_0 = pg
local var_0_1 = singletonClass("NewStyleMsgboxMgr")

var_0_0.NewStyleMsgboxMgr = var_0_1
var_0_1.TYPE_MSGBOX = 1
var_0_1.TYPE_DROP = 2
var_0_1.TYPE_DROP_CLIENT = 3
var_0_1.UI_NAME_DIC = {
	[var_0_1.TYPE_MSGBOX] = "DormStyleMsgboxUI",
	[var_0_1.TYPE_DROP] = "DormStyleDropMsgboxUI",
	[var_0_1.TYPE_DROP_CLIENT] = "DormStyleDropMsgboxUI"
}
var_0_1.BUTTON_TYPE = {
	confirm = "btn_confirm",
	cancel = "btn_cancel",
	blue = "btn_confirm",
	gray = "btn_cancel"
}

function var_0_1.Init(arg_1_0, arg_1_1)
	print("initializing new style msgbox manager...")

	arg_1_0.showList = {}
	arg_1_0.rtDic = {}

	existCall(arg_1_1)
end

function var_0_1.Show(arg_2_0, ...)
	table.insert(arg_2_0.showList, packEx(...))

	if #arg_2_0.showList == 1 then
		arg_2_0:DoShow(unpackEx(arg_2_0.showList[1]))
	end
end

function var_0_1.DoShow(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = {}

	if not arg_3_0.rtDic[arg_3_1] then
		table.insert(var_3_0, function(arg_4_0)
			var_0_0.UIMgr.GetInstance():LoadingOn()
			PoolMgr.GetInstance():GetUI(var_0_1.UI_NAME_DIC[arg_3_1], true, function(arg_5_0)
				setParent(arg_5_0, var_0_0.UIMgr.GetInstance().OverlayMain, false)

				arg_3_0.rtDic[arg_3_1] = arg_5_0.transform

				var_0_0.UIMgr.GetInstance():LoadingOff()
				arg_4_0()
			end)
		end)
	end

	seriesAsync(var_3_0, function()
		arg_3_0._tf = arg_3_0.rtDic[arg_3_1]

		arg_3_0:CommonSetting(arg_3_2)
		arg_3_0:DisplaySetting(arg_3_1, arg_3_2)
		var_0_0.UIMgr.GetInstance():BlurPanel(arg_3_0._tf, false, arg_3_2.blurParams or {
			weight = LayerWeightConst.SECOND_LAYER
		})
		setActive(arg_3_0._tf, true)
	end)
end

function var_0_1.Hide(arg_7_0)
	if not arg_7_0._tf then
		return
	end

	setActive(arg_7_0._tf, false)
	arg_7_0:Clear()
	var_0_0.UIMgr.GetInstance():UnblurPanel(arg_7_0._tf, var_0_0.UIMgr.GetInstance().OverlayMain)

	arg_7_0._tf = nil

	table.remove(arg_7_0.showList, 1)

	if #arg_7_0.showList > 0 then
		arg_7_0:DoShow(unpackEx(arg_7_0.showList[1]))
	end
end

function var_0_1.CommonSetting(arg_8_0, arg_8_1)
	var_0_0.DelegateInfo.New(arg_8_0)
	setText(arg_8_0._tf:Find("window/top/title"), arg_8_1.title or i18n("words_information"))

	function arg_8_0.hideCall()
		arg_8_0.hideCall = nil

		existCall(arg_8_1.onClose)
	end

	onButton(arg_8_0, arg_8_0._tf:Find("bg"), function()
		existCall(arg_8_0.hideCall)
		arg_8_0:Hide()
	end, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0._tf:Find("window/top/btn_close"), function()
		existCall(arg_8_0.hideCall)
		arg_8_0:Hide()
	end, SFX_CANCEL)

	function arg_8_0.confirmCall()
		arg_8_0.confirmCall = nil

		existCall(arg_8_1.onConfirm)
	end

	local var_8_0 = arg_8_1.btnList or {
		{
			type = var_0_1.BUTTON_TYPE.cancel,
			name = i18n("msgbox_text_cancel"),
			func = function()
				existCall(arg_8_0.hideCall)
			end,
			sound = SFX_CANCEL
		},
		{
			type = var_0_1.BUTTON_TYPE.confirm,
			name = i18n("msgbox_text_confirm"),
			func = function()
				existCall(arg_8_0.confirmCall)
			end,
			sound = SFX_CONFIRM
		}
	}
	local var_8_1 = arg_8_0._tf:Find("window/bottom/button_container")

	eachChild(var_8_1, function(arg_15_0)
		setActive(arg_15_0, false)
	end)

	for iter_8_0, iter_8_1 in ipairs(var_8_0) do
		local var_8_2 = var_8_1:Find(iter_8_1.type)

		if var_8_2:GetSiblingIndex() < var_8_1.childCount - iter_8_0 + 1 then
			var_8_2:SetAsLastSibling()
			setActive(var_8_2, true)
		else
			var_8_2 = cloneTplTo(var_8_2, var_8_1, var_8_2.name)
		end

		setText(var_8_2:Find("Text"), iter_8_1.name)
		onButton(arg_8_0, var_8_2, function()
			existCall(iter_8_1.func)
			arg_8_0:Hide()
		end, iter_8_1.sound or SFX_CONFIRM)
	end

	onButton(arg_8_0, arg_8_0._tf:Find("window/top/btn_close"), function()
		existCall(arg_8_0.hideCall)
		arg_8_0:Hide()
	end, SFX_CANCEL)
end

function var_0_1.Clear(arg_18_0)
	var_0_0.DelegateInfo.Dispose(arg_18_0)

	arg_18_0.hideCall = nil
	arg_18_0.confirmCall = nil
end

function var_0_1.DisplaySetting(arg_19_0, arg_19_1, arg_19_2)
	switch(arg_19_1, {
		[var_0_1.TYPE_MSGBOX] = function(arg_20_0)
			setText(arg_19_0._tf:Find("window/middle/content"), arg_20_0.contentText)
		end,
		[var_0_1.TYPE_DROP] = function(arg_21_0)
			local var_21_0 = arg_21_0.drop
			local var_21_1 = arg_19_0._tf:Find("window/middle")

			updateDorm3dIcon(var_21_1:Find("Dorm3dIconTpl"), arg_21_0.drop)
			setText(var_21_1:Find("info/name"), var_21_0:getName())
			setText(var_21_1:Find("info/desc"), cancelColorRich(var_21_0.desc))

			local var_21_2, var_21_3 = var_21_0:getOwnedCount()

			setActive(var_21_1:Find("info/count"), var_21_3)

			if var_21_3 then
				setText(var_21_1:Find("info/count"), i18n("dorm3d_item_num") .. string.format("<color=#39bfff>%d</color>", var_21_2))
			end
		end,
		[var_0_1.TYPE_DROP_CLIENT] = function(arg_22_0)
			local var_22_0 = arg_19_0._tf:Find("window/middle")

			Dorm3dIconHelper.UpdateDorm3dIcon(var_22_0:Find("Dorm3dIconTpl"), arg_22_0.data)
			setActive(var_22_0:Find("info/count"), false)
			setActive(var_22_0:Find("Dorm3dIconTpl/count"), false)

			local var_22_1 = Dorm3dIconHelper.Data2Config(arg_22_0.data)

			setText(var_22_0:Find("info/name"), var_22_1.name)
			setText(var_22_0:Find("info/desc"), var_22_1.desc)
		end
	}, nil, arg_19_2)
end

function var_0_1.emit(arg_23_0, arg_23_1, ...)
	if not arg_23_0.analogyMediator then
		arg_23_0.analogyMediator = {
			addSubLayers = function(arg_24_0, arg_24_1)
				var_0_0.m02:sendNotification(GAME.LOAD_LAYERS, {
					parentContext = getProxy(ContextProxy):getCurrentContext(),
					context = arg_24_1
				})
			end,
			sendNotification = function(arg_25_0, ...)
				var_0_0.m02:sendNotification(...)
			end,
			viewComponent = arg_23_0
		}
	end

	return ContextMediator.CommonBindDic[arg_23_1](arg_23_0.analogyMediator, arg_23_1, ...)
end

function var_0_1.closeView(arg_26_0)
	arg_26_0:hide()
end
