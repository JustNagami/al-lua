pg = pg or {}
pg.ToastMgr = singletonClass("ToastMgr")

local var_0_0 = pg.ToastMgr
local var_0_1 = require("Mgr/Pool/PoolPlural")

var_0_0.TYPE_ATTIRE = "Attire"
var_0_0.TYPE_TECPOINT = "Tecpoint"
var_0_0.TYPE_TROPHY = "Trophy"
var_0_0.TYPE_META = "Meta"
var_0_0.TYPE_CRUSING = "Crusing"
var_0_0.TYPE_VOTE = "Vote"
var_0_0.TYPE_EMOJI = "Emoji"
var_0_0.TYPE_COMBAT_UI = "CombatUI"
var_0_0.ToastInfo = {
	[var_0_0.TYPE_ATTIRE] = {
		Attire = "attire_tpl"
	},
	[var_0_0.TYPE_TECPOINT] = {
		Buff = "buff_tpl",
		Point = "point_tpl"
	},
	[var_0_0.TYPE_TROPHY] = {
		Trophy = "trophy_tpl"
	},
	[var_0_0.TYPE_META] = {
		MetaLevel = "meta_level_tpl",
		MetaExp = "meta_exp_tpl"
	},
	[var_0_0.TYPE_CRUSING] = {
		Crusing = "crusing_pt_tpl"
	},
	[var_0_0.TYPE_VOTE] = {
		Vote = "vote_tpl"
	},
	[var_0_0.TYPE_EMOJI] = {
		Emoji = "emoji_tpl"
	},
	[var_0_0.TYPE_COMBAT_UI] = {
		CombatUI = "combatui_tpl"
	}
}

function var_0_0.Init(arg_1_0, arg_1_1)
	PoolMgr.GetInstance():GetUI("ToastUI", true, function(arg_2_0)
		arg_1_0._go = arg_2_0

		arg_1_0._go:SetActive(false)

		arg_1_0._tf = arg_1_0._go.transform
		arg_1_0.container = arg_1_0._tf:Find("container")

		arg_1_0._go.transform:SetParent(pg.UIMgr.GetInstance().OverlayToast, false)

		arg_1_0.pools = {}

		local var_2_0 = {}

		for iter_2_0, iter_2_1 in pairs(var_0_0.ToastInfo) do
			for iter_2_2, iter_2_3 in pairs(iter_2_1) do
				var_2_0[iter_2_2 .. "Tpl"] = iter_2_3
			end
		end

		for iter_2_4, iter_2_5 in pairs(var_2_0) do
			local var_2_1 = arg_1_0._tf:Find("resources/" .. iter_2_5)

			if iter_2_5 == "meta_exp_tpl" then
				local var_2_2 = var_2_1:Find("ExpFull/Tip")

				setText(var_2_2, i18n("meta_toast_fullexp"))

				local var_2_3 = var_2_1:Find("ExpAdd/Tip")

				setText(var_2_3, i18n("meta_toast_tactics"))
			end

			setActive(var_2_1, false)

			local var_2_4 = var_2_1.gameObject

			arg_1_0.pools[iter_2_4] = var_0_1.New(var_2_4, 5)
		end

		arg_1_0:ResetUIDandHistory()

		if arg_1_1 then
			arg_1_1()
		end
	end)
end

function var_0_0.ResetUIDandHistory(arg_3_0)
	arg_3_0.completedJob = 0
	arg_3_0.actionJob = 0
	arg_3_0.buffer = {}
end

function var_0_0.ShowToast(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = #arg_4_0.buffer

	table.insert(arg_4_0.buffer, {
		state = 0,
		type = arg_4_1,
		info = arg_4_2
	})
	setActive(arg_4_0._tf, true)

	if #arg_4_0.buffer == 1 or arg_4_0.buffer[var_4_0].state >= 2 then
		arg_4_0:Toast()
	end
end

function var_0_0.Toast(arg_5_0)
	if arg_5_0.actionJob >= #arg_5_0.buffer then
		return
	end

	if arg_5_0.buffer[arg_5_0.actionJob] and arg_5_0.buffer[arg_5_0.actionJob].state < 2 then
		return
	elseif arg_5_0.buffer[arg_5_0.actionJob] and arg_5_0.buffer[arg_5_0.actionJob].type ~= arg_5_0.buffer[arg_5_0.actionJob + 1].type and arg_5_0.buffer[arg_5_0.actionJob].state < 3 then
		return
	end

	arg_5_0.actionJob = arg_5_0.actionJob + 1

	local var_5_0 = arg_5_0.buffer[arg_5_0.actionJob]
	local var_5_1 = arg_5_0.actionJob

	var_5_0.state = 1

	arg_5_0["Update" .. var_5_0.type](arg_5_0, var_5_0, function()
		var_5_0.state = 2

		arg_5_0:Toast()
	end, function()
		var_5_0.state = 3

		if arg_5_0.buffer[var_5_1 + 1] and arg_5_0.buffer[var_5_1 + 1].state < 1 then
			arg_5_0:Toast()
		end

		arg_5_0.completedJob = arg_5_0.completedJob + 1

		if arg_5_0.completedJob >= #arg_5_0.buffer then
			arg_5_0:ResetUIDandHistory()
			setActive(arg_5_0._tf, false)

			for iter_7_0, iter_7_1 in pairs(arg_5_0.pools) do
				iter_7_1:ClearItems(false)
			end
		end
	end)
end

function var_0_0.GetAndSet(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.pools[arg_8_1 .. "Tpl"]:Dequeue()

	setActive(var_8_0, true)
	setParent(var_8_0, arg_8_2)
	var_8_0.transform:SetAsLastSibling()

	return var_8_0
end

function var_0_0.UpdateAttire(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0 = arg_9_0:GetAndSet(arg_9_1.type, arg_9_0.container)
	local var_9_1 = var_9_0:GetComponent(typeof(DftAniEvent))

	var_9_1:SetTriggerEvent(function(arg_10_0)
		if arg_9_2 then
			arg_9_2()
		end

		var_9_1:SetTriggerEvent(nil)
	end)
	var_9_1:SetEndEvent(function(arg_11_0)
		setActive(var_9_0, false)
		arg_9_0.pools[arg_9_1.type .. "Tpl"]:Enqueue(var_9_0)
		var_9_1:SetEndEvent(nil)

		if arg_9_3 then
			arg_9_3()
		end
	end)
	var_9_0:GetComponent(typeof(Animation)):Play("attire")

	local var_9_2 = arg_9_1.info

	assert(isa(var_9_2, AttireFrame))

	local var_9_3 = var_9_2:getType()

	setActive(var_9_0.transform:Find("bg/icon_frame"), var_9_3 == AttireConst.TYPE_ICON_FRAME)
	setActive(var_9_0.transform:Find("bg/chat_frame"), var_9_3 == AttireConst.TYPE_CHAT_FRAME)
	setText(var_9_0.transform:Find("bg/Text"), HXSet.hxLan(var_9_2:getConfig("name")))
end

function var_0_0.UpdateCombatUI(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = arg_12_0:GetAndSet(arg_12_1.type, arg_12_0.container)
	local var_12_1 = pg.item_data_battleui[arg_12_1.info.id]

	LoadImageSpriteAsync("Props/" .. var_12_1.display_icon, var_12_0.transform:Find("content/icon"), true)
	setText(var_12_0.transform:Find("content/name"), var_12_1.name)
	setText(var_12_0.transform:Find("content/label"), i18n("battle_ui_unlock"))

	local var_12_2 = var_12_0.transform:Find("content")

	var_12_2.anchoredPosition = Vector2(-550, 0)

	LeanTween.moveX(rtf(var_12_2), 0, 0.5)
	LeanTween.moveX(rtf(var_12_2), -550, 0.5):setDelay(5):setOnComplete(System.Action(function()
		setActive(var_12_0, false)
		arg_12_0.pools[arg_12_1.type .. "Tpl"]:Enqueue(var_12_0)

		if arg_12_3 then
			arg_12_3()
		end
	end))

	if arg_12_2 then
		arg_12_2()
	end
end

function var_0_0.UpdateEmoji(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	local var_14_0 = arg_14_0:GetAndSet(arg_14_1.type, arg_14_0.container)
	local var_14_1 = var_14_0:GetComponent(typeof(DftAniEvent))

	var_14_1:SetTriggerEvent(function(arg_15_0)
		if arg_14_2 then
			arg_14_2()
		end

		var_14_1:SetTriggerEvent(nil)
	end)
	var_14_1:SetEndEvent(function(arg_16_0)
		setActive(var_14_0, false)
		arg_14_0.pools[arg_14_1.type .. "Tpl"]:Enqueue(var_14_0)
		var_14_1:SetEndEvent(nil)

		if arg_14_3 then
			arg_14_3()
		end
	end)
	var_14_0:GetComponent(typeof(Animation)):Play("attire")

	local var_14_2 = arg_14_1.info

	setText(var_14_0.transform:Find("bg/label"), i18n("word_emoji_unlock"))
	setText(var_14_0.transform:Find("bg/Text"), i18n("word_get_emoji", var_14_2.item_name))
end

var_0_0.FADE_TIME = 0.4
var_0_0.FADE_OUT_TIME = 1
var_0_0.SHOW_TIME = 1.5
var_0_0.DELAY_TIME = 0.3

function var_0_0.UpdateTecpoint(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = arg_17_1.info
	local var_17_1 = var_17_0.point
	local var_17_2 = var_17_0.typeList
	local var_17_3 = var_17_0.attr
	local var_17_4 = var_17_0.value
	local var_17_5 = arg_17_0:GetAndSet("Point", arg_17_0.container)

	GetComponent(var_17_5.transform, "CanvasGroup").alpha = 0

	setText(findTF(var_17_5, "PointText"), "+" .. var_17_1)

	local var_17_6 = {}

	if var_17_2 then
		for iter_17_0 = 1, #var_17_2 do
			local var_17_7 = arg_17_0:GetAndSet("Buff", arg_17_0.container)

			GetComponent(var_17_7.transform, "CanvasGroup").alpha = 0

			local var_17_8 = var_17_7.transform:Find("TypeImg")
			local var_17_9 = var_17_7.transform:Find("AttrText")
			local var_17_10 = var_17_7.transform:Find("ValueText")
			local var_17_11 = var_17_2[iter_17_0]
			local var_17_12 = GetSpriteFromAtlas("ShipType", "buffitem_tec_" .. var_17_11)

			setImageSprite(var_17_8.transform, var_17_12)
			setText(var_17_9.transform, AttributeType.Type2Name(pg.attribute_info_by_type[var_17_3].name))
			setText(var_17_10.transform, "+" .. var_17_4)

			var_17_6[iter_17_0] = go(var_17_7)
		end
	end

	local function var_17_13()
		if arg_17_2 then
			arg_17_2()
		end

		if arg_17_3 then
			arg_17_3()
		end
	end

	local var_17_14 = go(var_17_5)
	local var_17_15 = GetComponent(var_17_5, "CanvasGroup")

	local function var_17_16(arg_19_0)
		var_17_15.alpha = arg_19_0
	end

	local function var_17_17()
		LeanTween.moveX(rtf(var_17_14), 0, var_0_0.FADE_OUT_TIME)
		LeanTween.value(var_17_14, 1, 0, var_0_0.FADE_OUT_TIME):setOnUpdate(System.Action_float(var_17_16)):setOnComplete(System.Action(function()
			setActive(var_17_5, false)
			arg_17_0.pools.PointTpl:Enqueue(var_17_5)

			if not var_17_2 then
				var_17_13()
			end
		end))
	end

	LeanTween.value(var_17_14, 0, 1, var_0_0.FADE_TIME):setOnUpdate(System.Action_float(var_17_16)):setOnComplete(System.Action(function()
		LeanTween.delayedCall(var_17_14, var_0_0.SHOW_TIME, System.Action(var_17_17))
	end))

	local function var_17_18(arg_23_0, arg_23_1, arg_23_2)
		local var_23_0 = GetComponent(arg_23_0.transform, "CanvasGroup")

		local function var_23_1(arg_24_0)
			var_23_0.alpha = arg_24_0
		end

		local function var_23_2()
			LeanTween.moveX(rtf(arg_23_0), 0, var_0_0.FADE_OUT_TIME)
			LeanTween.value(arg_23_0, 1, 0, var_0_0.FADE_OUT_TIME):setOnUpdate(System.Action_float(var_23_1)):setOnComplete(System.Action(function()
				setActive(arg_23_0, false)
				arg_17_0.pools.BuffTpl:Enqueue(arg_23_0)

				if arg_23_2 then
					var_17_13()
				end
			end))
		end

		LeanTween.value(arg_23_0, 0, 1, var_0_0.FADE_TIME):setOnUpdate(System.Action_float(var_23_1)):setOnComplete(System.Action(function()
			LeanTween.delayedCall(arg_23_0, var_0_0.SHOW_TIME + (var_0_0.FADE_OUT_TIME - var_0_0.DELAY_TIME) * arg_23_1, System.Action(var_23_2))
		end))
	end

	for iter_17_1, iter_17_2 in ipairs(var_17_6) do
		LeanTween.delayedCall(var_17_14, iter_17_1 * var_0_0.DELAY_TIME, System.Action(function()
			var_17_18(iter_17_2, iter_17_1, iter_17_1 == #var_17_6)
		end))
	end
end

function var_0_0.UpdateTrophy(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_29_1.info.sound or SFX_UI_TIP)

	local var_29_0 = arg_29_0:GetAndSet(arg_29_1.type, arg_29_0.container)
	local var_29_1 = pg.medal_template[arg_29_1.info.id]

	LoadImageSpriteAsync("medal/s_" .. var_29_1.icon, var_29_0.transform:Find("content/icon"), true)
	setText(var_29_0.transform:Find("content/name"), var_29_1.name)
	setText(var_29_0.transform:Find("content/label"), i18n("trophy_achieved"))

	local var_29_2 = var_29_0.transform:Find("content")

	var_29_2.anchoredPosition = Vector2(-550, 0)

	LeanTween.moveX(rtf(var_29_2), 0, 0.5)
	LeanTween.moveX(rtf(var_29_2), -550, 0.5):setDelay(5):setOnComplete(System.Action(function()
		setActive(var_29_0, false)
		arg_29_0.pools[arg_29_1.type .. "Tpl"]:Enqueue(var_29_0)

		if arg_29_3 then
			arg_29_3()
		end
	end))

	if arg_29_2 then
		arg_29_2()
	end
end

function var_0_0.UpdateMeta(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	local var_31_0 = arg_31_1.info
	local var_31_1 = var_31_0.metaShipVO
	local var_31_2 = MetaCharacterConst.GetMetaShipGroupIDByConfigID(var_31_1.configId)
	local var_31_3 = arg_31_0:GetAndSet("MetaExp", arg_31_0.container)
	local var_31_4 = arg_31_0:GetAndSet("MetaLevel", arg_31_0.container)
	local var_31_5 = var_31_3.transform:Find("ShipImg")
	local var_31_6, var_31_7 = MetaCharacterConst.GetMetaCharacterToastPath(var_31_2)

	setImageSprite(var_31_5, LoadSprite(var_31_6, var_31_7))

	local var_31_8 = var_31_3.transform:Find("Progress")
	local var_31_9 = pg.gameset.meta_skill_exp_max.key_value
	local var_31_10 = var_31_0.newDayExp
	local var_31_11 = var_31_0.addDayExp
	local var_31_12 = var_31_9 <= var_31_10

	setSlider(var_31_8, 0, var_31_9, var_31_10)

	local var_31_13 = var_31_0.curSkillID
	local var_31_14 = var_31_0.oldSkillLevel
	local var_31_15 = var_31_0.newSkillLevel
	local var_31_16 = var_31_14 < var_31_15
	local var_31_17 = var_31_3.transform:Find("ExpFull")
	local var_31_18 = var_31_3.transform:Find("ExpAdd")

	if var_31_12 then
		setActive(var_31_17, true)
		setActive(var_31_18, false)
	else
		local var_31_19 = var_31_3.transform:Find("ExpAdd/Value")

		setText(var_31_19, string.format("+%d", var_31_11))
		setActive(var_31_17, false)
		setActive(var_31_18, var_31_16)
	end

	if var_31_16 then
		local var_31_20 = var_31_4.transform:Find("Skill/Icon")
		local var_31_21 = getSkillConfig(var_31_13)

		setImageSprite(var_31_20, LoadSprite("skillicon/" .. var_31_21.icon))

		local var_31_22 = var_31_4.transform:Find("LevelUp")
		local var_31_23 = var_31_4.transform:Find("LevelMax")

		if var_31_15 >= pg.skill_data_template[var_31_13].max_level then
			setActive(var_31_22, false)
			setActive(var_31_23, true)
		else
			local var_31_24 = var_31_4.transform:Find("LevelUp/Value")

			setText(var_31_24, string.format("+%d", var_31_15 - var_31_14))
			setActive(var_31_22, true)
			setActive(var_31_23, false)
		end
	end

	local function var_31_25()
		if arg_31_2 then
			arg_31_2()
		end

		if arg_31_3 then
			arg_31_3()
		end
	end

	local var_31_26 = GetComponent(var_31_3, "CanvasGroup")
	local var_31_27 = GetComponent(var_31_4, "CanvasGroup")

	var_31_26.alpha = 0
	var_31_27.alpha = 0

	if var_31_12 or var_31_16 then
		local function var_31_28(arg_33_0)
			var_31_26.alpha = arg_33_0
		end

		local function var_31_29()
			LeanTween.moveX(rtf(var_31_3.transform), 0, var_0_0.FADE_OUT_TIME)
			LeanTween.value(var_31_3, 1, 0, var_0_0.FADE_OUT_TIME):setOnUpdate(System.Action_float(var_31_28)):setOnComplete(System.Action(function()
				arg_31_0.pools.MetaExpTpl:Enqueue(var_31_3)

				if not var_31_16 then
					arg_31_0.pools.MetaLevelTpl:Enqueue(var_31_4)
					var_31_25()
				end
			end))
		end

		local function var_31_30()
			LeanTween.delayedCall(var_31_3, var_0_0.SHOW_TIME, System.Action(var_31_29))
		end

		LeanTween.value(var_31_3, 0, 1, var_0_0.FADE_TIME):setOnUpdate(System.Action_float(var_31_28)):setOnComplete(System.Action(var_31_30))
	end

	if var_31_16 then
		local function var_31_31(arg_37_0)
			var_31_27.alpha = arg_37_0
		end

		local function var_31_32()
			LeanTween.moveX(rtf(var_31_4.transform), 0, var_0_0.FADE_OUT_TIME)
			LeanTween.value(var_31_4, 1, 0, var_0_0.FADE_OUT_TIME):setOnUpdate(System.Action_float(var_31_31)):setOnComplete(System.Action(function()
				arg_31_0.pools.MetaLevelTpl:Enqueue(var_31_4)
				var_31_25()
			end))
		end

		local function var_31_33()
			LeanTween.delayedCall(var_31_4, var_0_0.SHOW_TIME, System.Action(var_31_32))
		end

		LeanTween.delayedCall(var_31_4, var_0_0.DELAY_TIME, System.Action(function()
			LeanTween.value(var_31_4, 0, 1, var_0_0.FADE_TIME):setOnUpdate(System.Action_float(var_31_31)):setOnComplete(System.Action(var_31_33))
		end))
	end
end

function var_0_0.UpdateCrusing(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	local var_42_0 = arg_42_1.info
	local var_42_1 = var_42_0.ptId
	local var_42_2 = var_42_0.ptCount

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_42_1.info.sound or SFX_UI_TIP)

	local var_42_3 = tf(arg_42_0:GetAndSet(arg_42_1.type, arg_42_0.container))
	local var_42_4 = Drop.New({
		type = DROP_TYPE_VITEM,
		id = var_42_1
	})

	LoadImageSpriteAtlasAsync(var_42_4:getIcon(), "", var_42_3:Find("PointIcon"), true)
	setText(var_42_3:Find("info/name"), var_42_4:getName())
	setText(var_42_3:Find("info/pt"), "+" .. var_42_2)
	setAnchoredPosition(var_42_3, {
		x = var_42_3.rect.width
	})

	local var_42_5 = GetComponent(var_42_3, typeof(CanvasGroup))

	LeanTween.alphaCanvas(var_42_5, 1, 0.5):setFrom(0):setOnComplete(System.Action(function()
		LeanTween.alphaCanvas(var_42_5, 0, 0.5):setDelay(5):setOnComplete(System.Action(function()
			setActive(var_42_3, false)
			arg_42_0.pools[arg_42_1.type .. "Tpl"]:Enqueue(go(var_42_3))

			if arg_42_3 then
				arg_42_3()
			end
		end))

		if arg_42_2 then
			arg_42_2()
		end
	end))
end

function var_0_0.UpdateVote(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	local var_45_0 = arg_45_1.info
	local var_45_1 = var_45_0.ptId
	local var_45_2 = var_45_0.ptCount
	local var_45_3 = Drop.New({
		type = DROP_TYPE_ITEM,
		id = var_45_1
	})
	local var_45_4 = tf(arg_45_0:GetAndSet(arg_45_1.type, arg_45_0.container))

	LoadImageSpriteAtlasAsync(var_45_3:getIcon(), "", var_45_4:Find("PointIcon"), true)
	setText(var_45_4:Find("info/name"), var_45_3:getName())
	setText(var_45_4:Find("info/pt"), "+" .. var_45_2)
	setAnchoredPosition(var_45_4, {
		x = var_45_4.rect.width
	})

	local var_45_5 = GetComponent(var_45_4, typeof(CanvasGroup))

	LeanTween.alphaCanvas(var_45_5, 1, 0.5):setFrom(0):setOnComplete(System.Action(function()
		LeanTween.alphaCanvas(var_45_5, 0, 0.5):setDelay(5):setOnComplete(System.Action(function()
			setActive(var_45_4, false)
			arg_45_0.pools[arg_45_1.type .. "Tpl"]:Enqueue(go(var_45_4))

			if arg_45_3 then
				arg_45_3()
			end
		end))

		if arg_45_2 then
			arg_45_2()
		end
	end))
end

function var_0_0.Dispose(arg_48_0)
	setActive(arg_48_0._tf, false)
	arg_48_0:ResetUIDandHistory()

	for iter_48_0, iter_48_1 in pairs(arg_48_0.pools) do
		iter_48_1:Clear(false)
	end
end
