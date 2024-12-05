pg = pg or {}
pg.GMTMgr = singletonClass("GMTMgr")

local var_0_0 = pg.GMTMgr

var_0_0.TYPE_DEFAULT_RES = 2
var_0_0.TYPE_L2D = 4
var_0_0.TYPE_PAINTING = 8
var_0_0.TYPE_CIPHER = 16

function var_0_0.Init(arg_1_0, arg_1_1)
	if arg_1_1 then
		arg_1_1()
	end
end

function var_0_0.initUI(arg_2_0, arg_2_1)
	if arg_2_0._go == nil then
		PoolMgr.GetInstance():GetUI("GMTUI", true, function(arg_3_0)
			arg_2_0._go = arg_3_0

			arg_2_0._go:SetActive(false)

			arg_2_0._textTf = findTF(arg_2_0._go, "ad/text")

			local var_3_0 = GameObject.Find("OverlayCamera/Overlay/UITop")

			arg_2_0._go.transform:SetParent(var_3_0.transform, false)

			arg_2_0._animator = GetComponent(arg_2_0._go, typeof(Animator))

			arg_2_1()
		end)
	end
end

function var_0_0.showGMT(arg_4_0, arg_4_1)
	arg_4_0._subTime = arg_4_1 - pg.TimeMgr:GetInstance():GetServerTime()

	if arg_4_0._go == nil then
		arg_4_0:initUI(function()
			arg_4_0:showTip()
		end)
	else
		arg_4_0:showTip()
	end
end

function var_0_0.showTip(arg_6_0)
	arg_6_0._go:SetActive(false)
	arg_6_0._go:SetActive(true)

	if arg_6_0._subTime >= 10 then
		arg_6_0._animator:SetTrigger("once")
	elseif not arg_6_0._triggerStop then
		arg_6_0._triggerStop = true

		arg_6_0._animator:SetTrigger("repeat")
	end

	local var_6_0 = arg_6_0:getTimeTip()

	setText(arg_6_0._textTf, var_6_0)
end

function var_0_0.getTimeTip(arg_7_0)
	if arg_7_0._subTime > 0 then
		local var_7_0 = math.floor(arg_7_0._subTime / 3600)
		local var_7_1 = math.floor(arg_7_0._subTime / 60)
		local var_7_2 = arg_7_0._subTime % 60
		local var_7_3

		if var_7_0 > 0 then
			var_7_3 = tostring(var_7_0) .. i18n("word_hour")
		elseif var_7_1 > 0 then
			var_7_3 = tostring(var_7_1) .. i18n("word_minute")
		else
			var_7_3 = tostring(var_7_2) .. i18n("word_second")
		end

		return i18n("maintenance_message_text", var_7_3)
	end

	return i18n("maintenance_message_stop_text")
end
