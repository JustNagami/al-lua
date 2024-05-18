local var_0_0 = class("CourtYardRightPanel", import(".CourtYardBasePanel"))

function var_0_0.GetUIName(arg_1_0)
	return "main/rightPanel"
end

function var_0_0.init(arg_2_0)
	arg_2_0.buffBtn = arg_2_0._tf:Find("buff")
	arg_2_0.buffPage = CourtYardBuffPage.New(arg_2_0._tf.parent.parent, arg_2_0.parent)
end

function var_0_0.GenBuffData(arg_3_0)
	local var_3_0 = {}

	for iter_3_0, iter_3_1 in ipairs(BuffHelper.GetBackYardPlayerBuffs()) do
		if iter_3_1:isActivate() then
			table.insert(var_3_0, iter_3_1)
		end
	end

	return var_3_0
end

function var_0_0.OnRegister(arg_4_0)
	onButton(arg_4_0, arg_4_0.buffBtn, function()
		local var_5_0 = arg_4_0.buffList or arg_4_0:GenBuffData()

		if #var_5_0 > 0 then
			arg_4_0.buffPage:ExecuteAction("Show", var_5_0)
		end
	end, SFX_PANEL)
end

function var_0_0.OnVisitRegister(arg_6_0)
	setActive(arg_6_0._tf, false)
end

function var_0_0.OnFlush(arg_7_0, arg_7_1)
	arg_7_1 = arg_7_1 or bit.bor(BackYardConst.DORM_UPDATE_TYPE_LEVEL, BackYardConst.DORM_UPDATE_TYPE_USEFOOD, BackYardConst.DORM_UPDATE_TYPE_SHIP)

	local var_7_0 = arg_7_0.dorm

	if bit.band(arg_7_1, BackYardConst.DORM_UPDATE_TYPE_USEFOOD) > 0 and arg_7_0:IsInner() then
		arg_7_0.buffList = arg_7_0:GenBuffData()

		setActive(arg_7_0.buffBtn, #arg_7_0.buffList > 0)
	end

	if bit.band(arg_7_1, BackYardConst.DORM_UPDATE_TYPE_SHIP) > 0 then
		-- block empty
	end
end

function var_0_0.GetMoveX(arg_8_0)
	return {
		{
			arg_8_0._tf,
			1
		}
	}
end

function var_0_0.OnDispose(arg_9_0)
	if arg_9_0.buffPage then
		arg_9_0.buffPage:Destroy()

		arg_9_0.buffPage = nil
	end
end

return var_0_0
