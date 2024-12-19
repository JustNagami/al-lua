local var_0_0 = class("MedalDetailPanel")

var_0_0.ICON_SCALE = Vector2.New(1.35, 1.35)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0._parent = arg_1_2
	arg_1_0.UIMgr = pg.UIMgr.GetInstance()

	pg.DelegateInfo.New(arg_1_0)

	arg_1_0._mask = findTF(arg_1_0._tf, "mask")
	arg_1_0._medalIcon = findTF(arg_1_0._tf, "icon")
	arg_1_0._medalLock = findTF(arg_1_0._tf, "lock")
	arg_1_0._nameText = findTF(arg_1_0._tf, "name")
	arg_1_0._descText = findTF(arg_1_0._tf, "desc")
	arg_1_0._progressText = findTF(arg_1_0._tf, "progress")
	arg_1_0._conditionText = findTF(arg_1_0._tf, "condition")
	arg_1_0._stateText = findTF(arg_1_0._tf, "state")
	arg_1_0._prevBtn = findTF(arg_1_0._tf, "prevBtn")
	arg_1_0._nextBtn = findTF(arg_1_0._tf, "nextBtn")

	onButton(arg_1_0, arg_1_0._mask, function()
		arg_1_0:SetActive(false)
	end, SFX_CANCEL)
	onButton(arg_1_0, arg_1_0._prevBtn, function()
		arg_1_0._currentIndex = math.max(arg_1_0._currentIndex - 1, 1)

		arg_1_0:UpdateMedal()
	end)
	onButton(arg_1_0, arg_1_0._nextBtn, function()
		arg_1_0._currentIndex = math.min(arg_1_0._currentIndex + 1, #arg_1_0._medalGroup:getConfig("activity_medal_ids"))

		arg_1_0:UpdateMedal()
	end)
end

function var_0_0.SetMedalGroup(arg_5_0, arg_5_1)
	arg_5_0._medalGroup = arg_5_1
end

function var_0_0.SetCurrentIndex(arg_6_0, arg_6_1)
	arg_6_0._currentIndex = arg_6_1
end

function var_0_0.UpdateMedal(arg_7_0)
	local var_7_0 = arg_7_0._medalGroup:getConfig("activity_medal_ids")[arg_7_0._currentIndex]

	arg_7_0._medal = arg_7_0._medalGroup:GetMedalList()[var_7_0]

	local var_7_1 = pg.activity_medal_template[var_7_0]

	setText(arg_7_0._nameText, var_7_1.activity_medal_name)
	setText(arg_7_0._descText, var_7_1.activity_medal_desc)

	if arg_7_0._medal.timeStamp then
		LoadImageSpriteAsync("activitymedal/" .. var_7_0, arg_7_0._medalIcon, true)
	else
		LoadImageSpriteAsync("activitymedal/" .. var_7_0 .. "_l", arg_7_0._medalIcon, true)
	end

	arg_7_0._medalIcon.transform.localScale = var_0_0.ICON_SCALE

	SetActive(arg_7_0._medalLock, not arg_7_0._medal.timeStamp)

	if arg_7_0._medal.timeStamp then
		setText(arg_7_0._conditionText, i18n("word_gain_date") .. pg.TimeMgr.GetInstance():CTimeDescC(arg_7_0._medal.timeStamp, "%Y/%m/%d"))
		setText(arg_7_0._progressText, i18n("word_unlock"))
	else
		setText(arg_7_0._conditionText, pg.task_data_template[var_7_1.task_id].desc)
		setText(arg_7_0._progressText, i18n("word_lock"))
	end

	local var_7_2 = arg_7_0._medalGroup:GetMedalGroupState()

	if var_7_2 == ActivityMedalGroup.STATE_EXPIRE then
		setText(arg_7_0._stateText, setColorStr(i18n("word_cant_gain_anymore"), "#73757f"))
	elseif var_7_2 == ActivityMedalGroup.STATE_CLOSE then
		setText(arg_7_0._stateText, setColorStr(i18n("word_activity_not_open"), "#ed4646"))
	end

	SetActive(arg_7_0._stateText, var_7_2 ~= ActivityMedalGroup.STATE_ACTIVE)
	SetActive(arg_7_0._prevBtn, arg_7_0._currentIndex ~= 1)
	SetActive(arg_7_0._nextBtn, arg_7_0._currentIndex ~= #arg_7_0._medalGroup:getConfig("activity_medal_ids"))
end

function var_0_0.SetActive(arg_8_0, arg_8_1)
	SetActive(arg_8_0._go, arg_8_1)

	arg_8_0._active = arg_8_1

	if arg_8_1 then
		pg.UIMgr.GetInstance():BlurPanel(arg_8_0._go, false, {
			weight = LayerWeightConst.SECOND_LAYER
		})
	else
		pg.UIMgr.GetInstance():UnblurPanel(arg_8_0._go, arg_8_0._parent._tf)
	end
end

function var_0_0.IsActive(arg_9_0)
	return arg_9_0._active
end

function var_0_0.Dispose(arg_10_0)
	pg.DelegateInfo.Dispose(arg_10_0)
end

return var_0_0
