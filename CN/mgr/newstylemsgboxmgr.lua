pg = pg or {}

local var_0_0 = pg
local var_0_1 = singletonClass("NewStyleMsgboxMgr")

var_0_0.NewStyleMsgboxMgr = var_0_1
var_0_1.TYPE_MSGBOX = 1
var_0_1.TYPE_DROP = 2
var_0_1.TYPE_DROP_CLIENT = 3
var_0_1.TYPE_COMMON_MSGBOX = 4
var_0_1.TYPE_COMMON_HELP = 5
var_0_1.TYPE_COMMON_DROP = 6
var_0_1.TYPE_COMMON_ITEMS = 7
var_0_1.TYPE_SHIP_PREVIEW = 8
var_0_1.TYPE_COMMON_SHOPPING = 9
var_0_1.UI_NAME_DIC = {
	[var_0_1.TYPE_MSGBOX] = "DormStyleMsgboxUI",
	[var_0_1.TYPE_DROP] = "DormStyleDropMsgboxUI",
	[var_0_1.TYPE_DROP_CLIENT] = "DormStyleDropMsgboxUI",
	[var_0_1.TYPE_COMMON_MSGBOX] = "NewStyleMsgboxUI",
	[var_0_1.TYPE_COMMON_HELP] = "NewStyleHelpMsgboxUI",
	[var_0_1.TYPE_COMMON_DROP] = "NewStyleDropMsgboxUI",
	[var_0_1.TYPE_COMMON_ITEMS] = "NewStyleItemsMsgboxUI",
	[var_0_1.TYPE_SHIP_PREVIEW] = "ShipPreviewUI",
	[var_0_1.TYPE_COMMON_SHOPPING] = "NewStyleShoppingMsgboxUI"
}
var_0_1.BUTTON_TYPE = {
	blue = "btn_confirm",
	gray = "btn_cancel",
	shopping = "btn_shopping",
	confirm = "btn_confirm",
	cancel = "btn_cancel"
}
var_0_1.RES_LIST = {
	diamond = {
		"ui/commonui_atlas",
		"res_diamond"
	},
	gold = {
		"ui/commonui_atlas",
		"res_gold"
	},
	res_oil = {
		"ui/commonui_atlas",
		"res_oil"
	},
	guildicon = {
		"ui/share/msgbox_atlas",
		"res_guildicon"
	},
	world_money = {
		"ui/share/world_common_atlas",
		"res_Whuobi"
	},
	port_money = {
		"ui/share/world_common_atlas",
		"res_Wzhaungbeibi"
	},
	world_boss = {
		"props/100000",
		""
	}
}
var_0_1.COLOR_MAP = {
	["#[Ff][Ff][Dd][Ee]38"] = "#ffa944",
	["#6[Dd][Dd]329"] = "#238c40",
	["#92[Ff][Cc]63"] = "#238c40"
}

function var_0_1.Init(arg_1_0, arg_1_1)
	print("initializing new style msgbox manager...")

	arg_1_0.showList = {}
	arg_1_0.rtDic = {}
	arg_1_0.richTextSprites = {}

	local var_1_0 = {}

	for iter_1_0, iter_1_1 in pairs(var_0_1.RES_LIST) do
		table.insert(var_1_0, function(arg_2_0)
			LoadSpriteAtlasAsync(iter_1_1[1], iter_1_1[2], function(arg_3_0)
				arg_1_0.richTextSprites[iter_1_0] = arg_3_0

				arg_2_0()
			end)
		end)
	end

	seriesAsync(var_1_0, function()
		existCall(arg_1_1)
	end)
end

function var_0_1.Show(arg_5_0, ...)
	table.insert(arg_5_0.showList, packEx(...))

	if #arg_5_0.showList == 1 then
		arg_5_0:DoShow(unpackEx(arg_5_0.showList[1]))
	end
end

function var_0_1.DeepShow(arg_6_0, ...)
	if #arg_6_0.showList == 0 then
		arg_6_0:Show(...)
	else
		table.insert(arg_6_0.showList, 1, packEx(...))
		arg_6_0:Hide(true)
	end
end

function var_0_1.DoShow(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = {}

	if not arg_7_0.rtDic[arg_7_1] then
		table.insert(var_7_0, function(arg_8_0)
			var_0_0.UIMgr.GetInstance():LoadingOn()
			PoolMgr.GetInstance():GetUI(var_0_1.UI_NAME_DIC[arg_7_1], true, function(arg_9_0)
				setParent(arg_9_0, var_0_0.UIMgr.GetInstance().OverlayMain, false)

				arg_7_0.rtDic[arg_7_1] = arg_9_0.transform

				var_0_0.UIMgr.GetInstance():LoadingOff()
				arg_8_0()
			end)
		end)
	end

	seriesAsync(var_7_0, function()
		arg_7_0._tf = arg_7_0.rtDic[arg_7_1]

		if arg_7_1 == var_0_1.TYPE_SHIP_PREVIEW then
			var_0_0.DelegateInfo.New(arg_7_0)
		else
			arg_7_0:CommonSetting(arg_7_2)
		end

		arg_7_0:DisplaySetting(arg_7_1, arg_7_2)
		var_0_0.UIMgr.GetInstance():BlurPanel(arg_7_0._tf, false, arg_7_2.blurParams or {
			weight = LayerWeightConst.SECOND_LAYER
		})
		setActive(arg_7_0._tf, true)
	end)
end

function var_0_1.Hide(arg_11_0, arg_11_1)
	if not arg_11_0._tf then
		return
	end

	setActive(arg_11_0._tf, false)
	arg_11_0:Clear()
	var_0_0.UIMgr.GetInstance():UnblurPanel(arg_11_0._tf, var_0_0.UIMgr.GetInstance().OverlayMain)

	arg_11_0._tf = nil

	if not arg_11_1 then
		table.remove(arg_11_0.showList, 1)
	end

	if #arg_11_0.showList > 0 then
		arg_11_0:DoShow(unpackEx(arg_11_0.showList[1]))
	end
end

function var_0_1.CommonSetting(arg_12_0, arg_12_1)
	var_0_0.DelegateInfo.New(arg_12_0)
	setText(arg_12_0._tf:Find("window/top/title"), arg_12_1.title or i18n("words_information"))

	function arg_12_0.hideCall()
		arg_12_0.hideCall = nil

		existCall(arg_12_1.onClose)
	end

	onButton(arg_12_0, arg_12_0._tf:Find("bg"), function()
		existCall(arg_12_0.hideCall)
		arg_12_0:Hide()
	end, SFX_CANCEL)
	onButton(arg_12_0, arg_12_0._tf:Find("window/top/btn_close"), function()
		existCall(arg_12_0.hideCall)
		arg_12_0:Hide()
	end, SFX_CANCEL)

	function arg_12_0.confirmCall()
		arg_12_0.confirmCall = nil

		existCall(arg_12_1.onConfirm)
	end

	local var_12_0 = arg_12_1.btnList or {
		{
			type = var_0_1.BUTTON_TYPE.cancel,
			name = i18n("msgbox_text_cancel"),
			func = function()
				existCall(arg_12_0.hideCall)
			end,
			sound = SFX_CANCEL
		},
		{
			type = var_0_1.BUTTON_TYPE.confirm,
			name = i18n("msgbox_text_confirm"),
			func = function()
				existCall(arg_12_0.confirmCall)
			end,
			sound = SFX_CONFIRM
		}
	}
	local var_12_1 = arg_12_0._tf:Find("window/bottom/button_container")

	eachChild(var_12_1, function(arg_19_0)
		setActive(arg_19_0, false)
	end)

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		local var_12_2 = var_12_1:Find(iter_12_1.type)

		if var_12_2:GetSiblingIndex() < var_12_1.childCount - iter_12_0 + 1 then
			var_12_2:SetAsLastSibling()
			setActive(var_12_2, true)
		else
			var_12_2 = cloneTplTo(var_12_2, var_12_1, var_12_2.name)
		end

		setText(var_12_2:Find("Text"), iter_12_1.name)
		onButton(arg_12_0, var_12_2, function()
			existCall(iter_12_1.func)
			arg_12_0:Hide()
		end, iter_12_1.sound or SFX_CONFIRM)
	end
end

function var_0_1.Clear(arg_21_0)
	var_0_0.DelegateInfo.Dispose(arg_21_0)

	arg_21_0.hideCall = nil
	arg_21_0.confirmCall = nil
end

function var_0_1.DisplaySetting(arg_22_0, arg_22_1, arg_22_2)
	switch(arg_22_1, {
		[var_0_1.TYPE_MSGBOX] = function(arg_23_0)
			setText(arg_22_0._tf:Find("window/middle/content"), arg_23_0.contentText)
		end,
		[var_0_1.TYPE_DROP] = function(arg_24_0)
			local var_24_0 = arg_24_0.drop
			local var_24_1 = arg_22_0._tf:Find("window/middle")

			updateDorm3dIcon(var_24_1:Find("Dorm3dIconTpl"), arg_24_0.drop)
			setText(var_24_1:Find("info/name"), var_24_0:getName())
			setText(var_24_1:Find("info/scroll/desc"), cancelColorRich(var_24_0.desc))

			local var_24_2, var_24_3 = var_24_0:getOwnedCount()

			setActive(var_24_1:Find("info/count"), var_24_3)

			if var_24_3 then
				setText(var_24_1:Find("info/count"), i18n("dorm3d_item_num") .. string.format("<color=#39bfff>%d</color>", var_24_2))
			end
		end,
		[var_0_1.TYPE_DROP_CLIENT] = function(arg_25_0)
			local var_25_0 = arg_22_0._tf:Find("window/middle")

			Dorm3dIconHelper.UpdateDorm3dIcon(var_25_0:Find("Dorm3dIconTpl"), arg_25_0.data)
			setActive(var_25_0:Find("info/count"), false)
			setActive(var_25_0:Find("Dorm3dIconTpl/count"), false)

			local var_25_1 = Dorm3dIconHelper.Data2Config(arg_25_0.data)

			setText(var_25_0:Find("info/name"), var_25_1.name)
			setText(var_25_0:Find("info/scroll/desc"), var_25_1.desc)
		end,
		[var_0_1.TYPE_COMMON_MSGBOX] = function(arg_26_0)
			local var_26_0 = arg_22_0._tf:Find("window/middle/content")

			arg_22_0:InitRichText(var_26_0)
			setTextInNewStyleBox(var_26_0, arg_26_0.contentText)
		end,
		[var_0_1.TYPE_COMMON_HELP] = function(arg_27_0)
			setActive(arg_22_0._tf:Find("window/bottom"), false)

			local var_27_0 = arg_22_0._tf:Find("window/middle/content")
			local var_27_1 = UIItemList.New(var_27_0, var_27_0:Find("tpl"))

			var_27_1:make(function(arg_28_0, arg_28_1, arg_28_2)
				arg_28_1 = arg_28_1 + 1

				if arg_28_0 == UIItemList.EventUpdate then
					local var_28_0 = arg_27_0.helps[arg_28_1]

					setActive(arg_28_2:Find("line"), var_28_0.line)
					setTextInNewStyleBox(arg_28_2:Find("Text"), HXSet.hxLan(var_28_0.info and SwitchSpecialChar(var_28_0.info, true) or ""))
				end
			end)
			var_27_1:align(#arg_27_0.helps)
		end,
		[var_0_1.TYPE_COMMON_DROP] = function(arg_29_0)
			local var_29_0 = arg_29_0.drop
			local var_29_1 = arg_22_0._tf:Find("window/middle")

			updateDrop(var_29_1:Find("left/IconTpl"), var_29_0)
			setText(var_29_1:Find("info/name_container/name/Text"), var_29_0:getConfig("name"))

			local var_29_2 = var_29_1:Find("info/desc/Text")

			arg_22_0:InitRichText(var_29_2)
			var_29_0:MsgboxIntroSet(arg_29_0, var_29_2)
			setTextInNewStyleBox(var_29_2, var_29_2:GetComponent(typeof(Text)).text)
			UpdateOwnDisplay(var_29_1:Find("left/own"), var_29_0)
			setText(var_29_1:Find("left/detail/Text"), i18n("technology_detail"))
			RegisterNewStyleDetailButton(arg_22_0, var_29_1:Find("left/detail"), var_29_0)

			local var_29_3 = var_29_0.type == DROP_TYPE_SHIP
			local var_29_4 = var_29_1:Find("info/name_container/shiptype")
			local var_29_5 = var_29_1:Find("extra_info/ship")

			setActive(var_29_4, var_29_3)
			setActive(var_29_5, var_29_3)

			if var_29_3 then
				GetImageSpriteFromAtlasAsync("shiptype", shipType2print(var_29_0:getConfig("type")), var_29_4)

				local var_29_6 = tobool(getProxy(CollectionProxy):getShipGroup(var_0_0.ship_data_template[var_29_0.id].group_type))

				setActive(var_29_5:Find("unlock"), var_29_6)
				setText(var_29_5:Find("unlock/Text"), i18n("tag_ship_unlocked"))
				setActive(var_29_5:Find("lock"), not var_29_6)
				setText(var_29_5:Find("lock/Text"), i18n("tag_ship_locked"))
			end

			local var_29_7 = var_29_0.type == DROP_TYPE_EQUIPMENT_SKIN
			local var_29_8 = var_29_1:Find("extra_info/equip_skin")

			setActive(var_29_8, var_29_7)
			setActive(var_29_1:Find("left/placeholder"), var_29_7)

			if var_29_7 then
				setTextInNewStyleBox(var_29_1:Find("info/desc/Text"), var_29_0:getConfig("desc"))

				local var_29_9 = var_0_0.equip_skin_template[var_29_0.id]
				local var_29_10 = underscore.map(var_29_9.equip_type, function(arg_30_0)
					return EquipType.Type2Name2(arg_30_0)
				end)
				local var_29_11 = table.concat(var_29_10, ",")

				setScrollText(var_29_8:Find("tag/mask/Text"), i18n("word_fit") .. ":" .. var_29_11)
				onButton(arg_22_0, var_29_8:Find("play"), function()
					local var_31_0 = Ship.New({
						id = var_29_9.ship_config_id,
						configId = var_29_9.ship_config_id,
						skin_id = var_29_9.ship_skin_id
					})

					arg_22_0:DeepShow(var_0_0.NewStyleMsgboxMgr.TYPE_SHIP_PREVIEW, {
						blurParams = {
							weight = LayerWeightConst.TOP_LAYER
						},
						shipVO = var_31_0,
						weaponIds = var_29_9.ship_skin_id == 0 and Clone(var_29_9.weapon_ids) or {},
						equipSkinId = var_29_9.ship_skin_id == 0 and var_29_0.id or 0
					})
				end, SFX_PANEL)
			end
		end,
		[var_0_1.TYPE_COMMON_ITEMS] = function(arg_32_0)
			local var_32_0 = arg_22_0._tf:Find("window/middle")

			setActive(var_32_0:Find("info/Text"), arg_32_0.content)
			setTextInNewStyleBox(var_32_0:Find("info/Text"), arg_32_0.content or "")

			local var_32_1 = arg_32_0.items
			local var_32_2 = arg_32_0.itemFunc
			local var_32_3 = var_32_0:Find("scrollview/content")

			UIItemList.StaticAlign(var_32_3, var_32_3:Find("item"), #var_32_1, function(arg_33_0, arg_33_1, arg_33_2)
				arg_33_1 = arg_33_1 + 1

				if arg_33_0 == UIItemList.EventUpdate then
					local var_33_0 = var_32_1[arg_33_1]

					updateDrop(arg_33_2:Find("IconTpl"), var_33_0, {
						anonymous = var_33_0.anonymous,
						hideName = var_33_0.hideName
					})

					local var_33_1 = arg_33_2:Find("IconTpl/name")

					setText(var_33_1, shortenString(getText(var_33_1), 6))
					setActive(arg_33_2:Find("own"), arg_32_0.showOwn)

					if arg_32_0.showOwn then
						setText(arg_33_2:Find("own/Text"), i18n("equip_skin_detail_count") .. var_33_0:getOwnedCount())
					end

					onButton(arg_22_0, arg_33_2, function()
						if var_33_0.anonymous then
							return
						elseif var_32_2 then
							var_32_2(var_33_0)
						end
					end, SFX_UI_CLICK)
				end
			end)
		end,
		[var_0_1.TYPE_SHIP_PREVIEW] = function(arg_35_0)
			local var_35_0 = arg_22_0._tf:Find("left_panel")
			local var_35_1 = var_35_0:Find("sea"):GetComponent("RawImage")

			setActive(var_35_1, false)

			local var_35_2 = GameObject.Find("BarrageCamera"):GetComponent("Camera")

			var_35_2.enabled = true
			var_35_2.targetTexture = var_35_1.texture

			local var_35_3 = arg_22_0._tf:Find("resources/heal")

			var_35_3.transform.localPosition = Vector3(-360, 50, 40)

			setActive(var_35_3, false)
			var_35_3:GetComponent("DftAniEvent"):SetEndEvent(function()
				setActive(var_35_3, false)
				setText(var_35_3:Find("text"), "")
			end)

			local var_35_4 = var_35_0:Find("bg/loading")
			local var_35_5

			onButton(arg_22_0, var_35_4, function()
				if not var_35_5 then
					var_35_5 = WeaponPreviewer.New(var_35_1)

					var_35_5:configUI(var_35_3)
					var_35_5:setDisplayWeapon(arg_35_0.weaponIds, arg_35_0.equipSkinId, true)
					var_35_5:load(40000, arg_35_0.shipVO, arg_35_0.weaponIds, function()
						setActive(var_35_4, false)
					end)
				end
			end)
			setActive(var_35_4, true)
			onButton(arg_22_0, arg_22_0._tf, function()
				setActive(var_35_4, false)

				if var_35_5 then
					var_35_5:clear()

					var_35_5 = nil
				end

				arg_22_0:Hide()
			end, SFX_PANEL)
		end,
		[var_0_1.TYPE_COMMON_SHOPPING] = function(arg_40_0)
			local var_40_0 = arg_22_0._tf:Find("window/middle")
			local var_40_1 = arg_40_0.drop

			updateDrop(var_40_0:Find("IconTpl"), var_40_1)
			setText(var_40_0:Find("info/name/Text"), var_40_1:getConfig("name"))
			setText(var_40_0:Find("IconTpl/own"), i18n("equip_skin_detail_count") .. var_40_1:getOwnedCount())

			local var_40_2 = var_40_0:Find("info/desc/Text")

			arg_22_0:InitRichText(var_40_2)

			local var_40_3 = arg_22_0._tf:Find("window/bottom/button_container/btn_shopping/price/Text")
			local var_40_4 = arg_22_0._tf:Find("window/bottom/count")
			local var_40_5 = PageUtil.New(var_40_4:Find("reduce"), var_40_4:Find("increase"), var_40_4:Find("max"), var_40_4:Find("Text"))
			local var_40_6 = arg_40_0.price
			local var_40_7 = arg_40_0.numUpdate
			local var_40_8 = arg_40_0.addNum or 1
			local var_40_9 = arg_40_0.maxNum or -1
			local var_40_10 = arg_40_0.defaultNum or 1

			var_40_5:setNumUpdate(function(arg_41_0)
				if var_40_7 ~= nil then
					var_40_7(var_40_2, arg_41_0)
				end

				setText(var_40_3, "x" .. arg_41_0 * var_40_6)
			end)
			var_40_5:setAddNum(var_40_8)
			var_40_5:setMaxNum(var_40_9)
			var_40_5:setDefaultNum(var_40_10)
		end
	}, nil, arg_22_2)
end

function var_0_1.InitRichText(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_1:GetComponent("RichText")

	for iter_42_0, iter_42_1 in pairs(arg_42_0.richTextSprites) do
		var_42_0:AddSprite(iter_42_0, iter_42_1)
	end
end

function var_0_1.emit(arg_43_0, arg_43_1, ...)
	if not arg_43_0.analogyMediator then
		arg_43_0.analogyMediator = {
			addSubLayers = function(arg_44_0, arg_44_1)
				var_0_0.m02:sendNotification(GAME.LOAD_LAYERS, {
					parentContext = getProxy(ContextProxy):getCurrentContext(),
					context = arg_44_1
				})
			end,
			sendNotification = function(arg_45_0, ...)
				var_0_0.m02:sendNotification(...)
			end,
			viewComponent = arg_43_0
		}
	end

	return ContextMediator.CommonBindDic[arg_43_1](arg_43_0.analogyMediator, arg_43_1, ...)
end

function var_0_1.closeView(arg_46_0)
	arg_46_0:hide()
end
