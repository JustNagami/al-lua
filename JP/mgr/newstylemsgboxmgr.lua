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
	table.insert(arg_5_0.showList, 1, packEx(...))

	if #arg_5_0.showList > 0 then
		arg_5_0:DoShow(unpackEx(arg_5_0.showList[1]))
	end
end

function var_0_1.DoShow(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = {}

	if not arg_6_0.rtDic[arg_6_1] then
		table.insert(var_6_0, function(arg_7_0)
			var_0_0.UIMgr.GetInstance():LoadingOn()
			PoolMgr.GetInstance():GetUI(var_0_1.UI_NAME_DIC[arg_6_1], true, function(arg_8_0)
				setParent(arg_8_0, var_0_0.UIMgr.GetInstance().OverlayMain, false)

				arg_6_0.rtDic[arg_6_1] = arg_8_0.transform

				var_0_0.UIMgr.GetInstance():LoadingOff()
				arg_7_0()
			end)
		end)
	end

	seriesAsync(var_6_0, function()
		arg_6_0._tf = arg_6_0.rtDic[arg_6_1]

		if arg_6_1 == var_0_1.TYPE_SHIP_PREVIEW then
			var_0_0.DelegateInfo.New(arg_6_0)
		else
			arg_6_0:CommonSetting(arg_6_2)
		end

		arg_6_0:DisplaySetting(arg_6_1, arg_6_2)
		var_0_0.UIMgr.GetInstance():BlurPanel(arg_6_0._tf, false, arg_6_2.blurParams or {
			weight = LayerWeightConst.SECOND_LAYER
		})
		setActive(arg_6_0._tf, true)
	end)
end

function var_0_1.Hide(arg_10_0)
	if not arg_10_0._tf then
		return
	end

	setActive(arg_10_0._tf, false)
	arg_10_0:Clear()
	var_0_0.UIMgr.GetInstance():UnblurPanel(arg_10_0._tf, var_0_0.UIMgr.GetInstance().OverlayMain)

	arg_10_0._tf = nil

	table.remove(arg_10_0.showList, 1)

	if #arg_10_0.showList > 0 then
		arg_10_0:DoShow(unpackEx(arg_10_0.showList[1]))
	end
end

function var_0_1.CommonSetting(arg_11_0, arg_11_1)
	var_0_0.DelegateInfo.New(arg_11_0)
	setText(arg_11_0._tf:Find("window/top/title"), arg_11_1.title or i18n("words_information"))

	function arg_11_0.hideCall()
		arg_11_0.hideCall = nil

		existCall(arg_11_1.onClose)
	end

	onButton(arg_11_0, arg_11_0._tf:Find("bg"), function()
		existCall(arg_11_0.hideCall)
		arg_11_0:Hide()
	end, SFX_CANCEL)
	onButton(arg_11_0, arg_11_0._tf:Find("window/top/btn_close"), function()
		existCall(arg_11_0.hideCall)
		arg_11_0:Hide()
	end, SFX_CANCEL)

	function arg_11_0.confirmCall()
		arg_11_0.confirmCall = nil

		existCall(arg_11_1.onConfirm)
	end

	local var_11_0 = arg_11_1.btnList or {
		{
			type = var_0_1.BUTTON_TYPE.cancel,
			name = i18n("msgbox_text_cancel"),
			func = function()
				existCall(arg_11_0.hideCall)
			end,
			sound = SFX_CANCEL
		},
		{
			type = var_0_1.BUTTON_TYPE.confirm,
			name = i18n("msgbox_text_confirm"),
			func = function()
				existCall(arg_11_0.confirmCall)
			end,
			sound = SFX_CONFIRM
		}
	}
	local var_11_1 = arg_11_0._tf:Find("window/bottom/button_container")

	eachChild(var_11_1, function(arg_18_0)
		setActive(arg_18_0, false)
	end)

	for iter_11_0, iter_11_1 in ipairs(var_11_0) do
		local var_11_2 = var_11_1:Find(iter_11_1.type)

		if var_11_2:GetSiblingIndex() < var_11_1.childCount - iter_11_0 + 1 then
			var_11_2:SetAsLastSibling()
			setActive(var_11_2, true)
		else
			var_11_2 = cloneTplTo(var_11_2, var_11_1, var_11_2.name)
		end

		setText(var_11_2:Find("Text"), iter_11_1.name)
		onButton(arg_11_0, var_11_2, function()
			existCall(iter_11_1.func)
			arg_11_0:Hide()
		end, iter_11_1.sound or SFX_CONFIRM)
	end
end

function var_0_1.Clear(arg_20_0)
	var_0_0.DelegateInfo.Dispose(arg_20_0)

	arg_20_0.hideCall = nil
	arg_20_0.confirmCall = nil
end

function var_0_1.DisplaySetting(arg_21_0, arg_21_1, arg_21_2)
	switch(arg_21_1, {
		[var_0_1.TYPE_MSGBOX] = function(arg_22_0)
			setText(arg_21_0._tf:Find("window/middle/content"), arg_22_0.contentText)
		end,
		[var_0_1.TYPE_DROP] = function(arg_23_0)
			local var_23_0 = arg_23_0.drop
			local var_23_1 = arg_21_0._tf:Find("window/middle")

			updateDorm3dIcon(var_23_1:Find("Dorm3dIconTpl"), arg_23_0.drop)
			setText(var_23_1:Find("info/name"), var_23_0:getName())
			setText(var_23_1:Find("info/desc"), cancelColorRich(var_23_0.desc))

			local var_23_2, var_23_3 = var_23_0:getOwnedCount()

			setActive(var_23_1:Find("info/count"), var_23_3)

			if var_23_3 then
				setText(var_23_1:Find("info/count"), i18n("dorm3d_item_num") .. string.format("<color=#39bfff>%d</color>", var_23_2))
			end
		end,
		[var_0_1.TYPE_DROP_CLIENT] = function(arg_24_0)
			local var_24_0 = arg_21_0._tf:Find("window/middle")

			Dorm3dIconHelper.UpdateDorm3dIcon(var_24_0:Find("Dorm3dIconTpl"), arg_24_0.data)
			setActive(var_24_0:Find("info/count"), false)
			setActive(var_24_0:Find("Dorm3dIconTpl/count"), false)

			local var_24_1 = Dorm3dIconHelper.Data2Config(arg_24_0.data)

			setText(var_24_0:Find("info/name"), var_24_1.name)
			setText(var_24_0:Find("info/desc"), var_24_1.desc)
		end,
		[var_0_1.TYPE_COMMON_MSGBOX] = function(arg_25_0)
			local var_25_0 = arg_21_0._tf:Find("window/middle/content")

			arg_21_0:InitRichText(var_25_0)
			setTextInNewStyleBox(var_25_0, arg_25_0.contentText)
		end,
		[var_0_1.TYPE_COMMON_HELP] = function(arg_26_0)
			setActive(arg_21_0._tf:Find("window/bottom"), false)

			local var_26_0 = arg_21_0._tf:Find("window/middle/content")
			local var_26_1 = UIItemList.New(var_26_0, var_26_0:Find("tpl"))

			var_26_1:make(function(arg_27_0, arg_27_1, arg_27_2)
				arg_27_1 = arg_27_1 + 1

				if arg_27_0 == UIItemList.EventUpdate then
					local var_27_0 = arg_26_0.helps[arg_27_1]

					setActive(arg_27_2:Find("line"), var_27_0.line)
					setTextInNewStyleBox(arg_27_2:Find("Text"), HXSet.hxLan(var_27_0.info and SwitchSpecialChar(var_27_0.info, true) or ""))
				end
			end)
			var_26_1:align(#arg_26_0.helps)
		end,
		[var_0_1.TYPE_COMMON_DROP] = function(arg_28_0)
			local var_28_0 = arg_28_0.drop
			local var_28_1 = arg_21_0._tf:Find("window/middle")

			updateDrop(var_28_1:Find("left/IconTpl"), var_28_0)
			setText(var_28_1:Find("info/name_container/name/Text"), var_28_0:getConfig("name"))

			local var_28_2 = var_28_1:Find("info/desc/Text")

			arg_21_0:InitRichText(var_28_2)
			var_28_0:MsgboxIntroSet(arg_28_0, var_28_2)
			setTextInNewStyleBox(var_28_2, var_28_2:GetComponent(typeof(Text)).text)
			UpdateOwnDisplay(var_28_1:Find("left/own"), var_28_0)
			setText(var_28_1:Find("left/detail/Text"), i18n("technology_detail"))
			RegisterNewStyleDetailButton(arg_21_0, var_28_1:Find("left/detail"), var_28_0)

			local var_28_3 = var_28_0.type == DROP_TYPE_SHIP
			local var_28_4 = var_28_1:Find("info/name_container/shiptype")
			local var_28_5 = var_28_1:Find("extra_info/ship")

			setActive(var_28_4, var_28_3)
			setActive(var_28_5, var_28_3)

			if var_28_3 then
				GetImageSpriteFromAtlasAsync("shiptype", shipType2print(var_28_0:getConfig("type")), var_28_4)

				local var_28_6 = tobool(getProxy(CollectionProxy):getShipGroup(var_0_0.ship_data_template[var_28_0.id].group_type))

				setActive(var_28_5:Find("unlock"), var_28_6)
				setText(var_28_5:Find("unlock/Text"), i18n("tag_ship_unlocked"))
				setActive(var_28_5:Find("lock"), not var_28_6)
				setText(var_28_5:Find("lock/Text"), i18n("tag_ship_locked"))
			end

			local var_28_7 = var_28_0.type == DROP_TYPE_EQUIPMENT_SKIN
			local var_28_8 = var_28_1:Find("extra_info/equip_skin")

			setActive(var_28_8, var_28_7)
			setActive(var_28_1:Find("left/placeholder"), var_28_7)

			if var_28_7 then
				setTextInNewStyleBox(var_28_1:Find("info/desc/Text"), var_28_0:getConfig("desc"))

				local var_28_9 = var_0_0.equip_skin_template[var_28_0.id]
				local var_28_10 = underscore.map(var_28_9.equip_type, function(arg_29_0)
					return EquipType.Type2Name2(arg_29_0)
				end)
				local var_28_11 = table.concat(var_28_10, ",")

				setScrollText(var_28_8:Find("tag/mask/Text"), i18n("word_fit") .. ":" .. var_28_11)
				onButton(arg_21_0, var_28_8:Find("play"), function()
					local var_30_0 = Ship.New({
						id = var_28_9.ship_config_id,
						configId = var_28_9.ship_config_id,
						skin_id = var_28_9.ship_skin_id
					})

					arg_21_0:Show(var_0_0.NewStyleMsgboxMgr.TYPE_SHIP_PREVIEW, {
						blurParams = {
							weight = LayerWeightConst.TOP_LAYER
						},
						shipVO = var_30_0,
						weaponIds = var_28_9.ship_skin_id == 0 and Clone(var_28_9.weapon_ids) or {},
						equipSkinId = var_28_9.ship_skin_id == 0 and var_28_0.id or 0
					})
				end, SFX_PANEL)
			end
		end,
		[var_0_1.TYPE_COMMON_ITEMS] = function(arg_31_0)
			local var_31_0 = arg_21_0._tf:Find("window/middle")

			setActive(var_31_0:Find("info/Text"), arg_31_0.content)
			setTextInNewStyleBox(var_31_0:Find("info/Text"), arg_31_0.content or "")

			local var_31_1 = arg_31_0.items
			local var_31_2 = arg_31_0.itemFunc
			local var_31_3 = var_31_0:Find("scrollview/content")

			UIItemList.StaticAlign(var_31_3, var_31_3:Find("item"), #var_31_1, function(arg_32_0, arg_32_1, arg_32_2)
				arg_32_1 = arg_32_1 + 1

				if arg_32_0 == UIItemList.EventUpdate then
					local var_32_0 = var_31_1[arg_32_1]

					updateDrop(arg_32_2:Find("IconTpl"), var_32_0, {
						anonymous = var_32_0.anonymous,
						hideName = var_32_0.hideName
					})

					local var_32_1 = arg_32_2:Find("IconTpl/name")

					setText(var_32_1, shortenString(getText(var_32_1), 6))
					setActive(arg_32_2:Find("own"), arg_31_0.showOwn)

					if arg_31_0.showOwn then
						setText(arg_32_2:Find("own/Text"), i18n("equip_skin_detail_count") .. var_32_0:getOwnedCount())
					end

					onButton(arg_21_0, arg_32_2, function()
						if var_32_0.anonymous then
							return
						elseif var_31_2 then
							var_31_2(var_32_0)
						end
					end, SFX_UI_CLICK)
				end
			end)
		end,
		[var_0_1.TYPE_SHIP_PREVIEW] = function(arg_34_0)
			local var_34_0 = arg_21_0._tf:Find("left_panel")
			local var_34_1 = var_34_0:Find("sea"):GetComponent("RawImage")

			setActive(var_34_1, false)

			local var_34_2 = GameObject.Find("BarrageCamera"):GetComponent("Camera")

			var_34_2.enabled = true
			var_34_2.targetTexture = var_34_1.texture

			local var_34_3 = arg_21_0._tf:Find("resources/heal")

			var_34_3.transform.localPosition = Vector3(-360, 50, 40)

			setActive(var_34_3, false)
			var_34_3:GetComponent("DftAniEvent"):SetEndEvent(function()
				setActive(var_34_3, false)
				setText(var_34_3:Find("text"), "")
			end)

			local var_34_4 = var_34_0:Find("bg/loading")
			local var_34_5

			onButton(arg_21_0, var_34_4, function()
				if not var_34_5 then
					var_34_5 = WeaponPreviewer.New(var_34_1)

					var_34_5:configUI(var_34_3)
					var_34_5:setDisplayWeapon(arg_34_0.weaponIds, arg_34_0.equipSkinId, true)
					var_34_5:load(40000, arg_34_0.shipVO, arg_34_0.weaponIds, function()
						setActive(var_34_4, false)
					end)
				end
			end)
			setActive(var_34_4, true)
			onButton(arg_21_0, arg_21_0._tf, function()
				setActive(var_34_4, false)

				if var_34_5 then
					var_34_5:clear()

					var_34_5 = nil
				end

				arg_21_0:Hide()
			end, SFX_PANEL)
		end,
		[var_0_1.TYPE_COMMON_SHOPPING] = function(arg_39_0)
			local var_39_0 = arg_21_0._tf:Find("window/middle")
			local var_39_1 = arg_39_0.drop

			updateDrop(var_39_0:Find("IconTpl"), var_39_1)
			setText(var_39_0:Find("info/name/Text"), var_39_1:getConfig("name"))
			setText(var_39_0:Find("IconTpl/own"), i18n("equip_skin_detail_count") .. var_39_1:getOwnedCount())

			local var_39_2 = var_39_0:Find("info/desc/Text")

			arg_21_0:InitRichText(var_39_2)

			local var_39_3 = arg_21_0._tf:Find("window/bottom/button_container/btn_shopping/price/Text")
			local var_39_4 = arg_21_0._tf:Find("window/bottom/count")
			local var_39_5 = PageUtil.New(var_39_4:Find("reduce"), var_39_4:Find("increase"), var_39_4:Find("max"), var_39_4:Find("Text"))
			local var_39_6 = arg_39_0.price
			local var_39_7 = arg_39_0.numUpdate
			local var_39_8 = arg_39_0.addNum or 1
			local var_39_9 = arg_39_0.maxNum or -1
			local var_39_10 = arg_39_0.defaultNum or 1

			var_39_5:setNumUpdate(function(arg_40_0)
				if var_39_7 ~= nil then
					var_39_7(var_39_2, arg_40_0)
				end

				setText(var_39_3, "x" .. arg_40_0 * var_39_6)
			end)
			var_39_5:setAddNum(var_39_8)
			var_39_5:setMaxNum(var_39_9)
			var_39_5:setDefaultNum(var_39_10)
		end
	}, nil, arg_21_2)
end

function var_0_1.InitRichText(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_1:GetComponent("RichText")

	for iter_41_0, iter_41_1 in pairs(arg_41_0.richTextSprites) do
		var_41_0:AddSprite(iter_41_0, iter_41_1)
	end
end

function var_0_1.emit(arg_42_0, arg_42_1, ...)
	if not arg_42_0.analogyMediator then
		arg_42_0.analogyMediator = {
			addSubLayers = function(arg_43_0, arg_43_1)
				var_0_0.m02:sendNotification(GAME.LOAD_LAYERS, {
					parentContext = getProxy(ContextProxy):getCurrentContext(),
					context = arg_43_1
				})
			end,
			sendNotification = function(arg_44_0, ...)
				var_0_0.m02:sendNotification(...)
			end,
			viewComponent = arg_42_0
		}
	end

	return ContextMediator.CommonBindDic[arg_42_1](arg_42_0.analogyMediator, arg_42_1, ...)
end

function var_0_1.closeView(arg_45_0)
	arg_45_0:hide()
end
