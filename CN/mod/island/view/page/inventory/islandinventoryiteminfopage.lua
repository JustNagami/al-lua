local var_0_0 = class("IslandInventoryItemInfoPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandInventoryItemInfoUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.nameTxt = arg_2_0:findTF("frame/Text"):GetComponent(typeof(Text))
	arg_2_0.descTxt = arg_2_0:findTF("frame/desc"):GetComponent(typeof(Text))
	arg_2_0.originTxt = arg_2_0:findTF("frame/origin"):GetComponent(typeof(Text))
	arg_2_0.compositionTxt = arg_2_0:findTF("frame/composition"):GetComponent(typeof(Text))
	arg_2_0.calcPanel = arg_2_0:findTF("frame/calc")
	arg_2_0.addBtn = arg_2_0:findTF("add", arg_2_0.calcPanel)
	arg_2_0.reduceBtn = arg_2_0:findTF("reduce", arg_2_0.calcPanel)
	arg_2_0.valueTxt = arg_2_0:findTF("value/Text", arg_2_0.calcPanel):GetComponent(typeof(Text))
	arg_2_0.sellBtn = arg_2_0:findTF("sell", arg_2_0.calcPanel)
	arg_2_0.priceTxt = arg_2_0:findTF("Text", arg_2_0.sellBtn):GetComponent(typeof(Text))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_5_0, arg_5_1)
	var_0_0.super.Show(arg_5_0)

	arg_5_0.nameTxt.text = arg_5_1:GetName()
	arg_5_0.descTxt.text = arg_5_1:GetDesc()

	setActive(arg_5_0.originTxt.gameObject, arg_5_1:IsMaterial())

	arg_5_0.originTxt.text = i18n1("来源:") .. arg_5_1:GetMaterialFacility()

	setActive(arg_5_0.compositionTxt.gameObject, arg_5_1:IsMaterial())

	arg_5_0.compositionTxt.text = i18n1("合成:")

	local var_5_0 = arg_5_1:CanSell()

	setActive(arg_5_0.calcPanel, var_5_0)

	arg_5_0.count = 0

	if var_5_0 then
		arg_5_0:InitCalcPanel(arg_5_1)
	end
end

function var_0_0.InitCalcPanel(arg_6_0, arg_6_1)
	arg_6_0.count = 1
	arg_6_0.maxCnt = arg_6_1:GetCount()

	pressPersistTrigger(arg_6_0.reduceBtn, 0.5, function(arg_7_0)
		if arg_6_0.count == 1 then
			if arg_7_0 then
				arg_7_0()
			end

			return
		end

		arg_6_0.count = math.max(1, arg_6_0.count - 1)

		arg_6_0:UpdateValue(arg_6_1)
	end, nil, true, true, 0.1, SFX_PANEL)
	pressPersistTrigger(arg_6_0.addBtn, 0.5, function(arg_8_0)
		if arg_6_0.count == arg_6_0.maxCnt then
			if arg_8_0 then
				arg_8_0()
			end

			return
		end

		arg_6_0.count = math.min(arg_6_0.maxCnt, arg_6_0.count + 1)

		arg_6_0:UpdateValue(arg_6_1)
	end, nil, true, true, 0.1, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.sellBtn, function()
		local var_9_0 = arg_6_1:GetSellingPrice()
		local var_9_1 = getDropInfo({
			{
				var_9_0.type,
				var_9_0.id,
				var_9_0.count * arg_6_0.count
			}
		})

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n1("确认出售" .. arg_6_1:GetName() .. "X" .. arg_6_0.count .. "\n获得" .. var_9_1),
			onYes = function()
				arg_6_0:emit(IslandMediator.ON_SELL_ITEM, arg_6_1.id, arg_6_0.count)
			end
		})
	end, SFX_PANEL)
	arg_6_0:UpdateValue(arg_6_1)
end

function var_0_0.UpdateValue(arg_11_0, arg_11_1)
	arg_11_0.valueTxt.text = arg_11_0.count

	local var_11_0 = arg_11_1:GetSellingPrice()

	arg_11_0.priceTxt.text = arg_11_0.count * var_11_0.count
end

function var_0_0.OnDestroy(arg_12_0)
	return
end

return var_0_0
