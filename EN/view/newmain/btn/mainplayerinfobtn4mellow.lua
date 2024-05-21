local var_0_0 = class("MainPlayerInfoBtn4Mellow", import(".MainPlayerInfoBtn"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.super.Ctor(arg_1_0, arg_1_1, arg_1_2)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0.playerInfoBtn = findTF(arg_1_0._tf, "name_bg")
	arg_1_0.playerNameTxt = findTF(arg_1_0._tf, "name_bg/Text"):GetComponent(typeof(Text))
	arg_1_0.playerLevelTr = findTF(arg_1_0._tf, "name_bg/level/Text")
	arg_1_0.playerLevelTxt = findTF(arg_1_0._tf, "name_bg/level/Text"):GetComponent(typeof(Text))
	arg_1_0.expTxt = findTF(arg_1_0._tf, "name_bg/level/mask/Text"):GetComponent(typeof(Text))
	arg_1_0.goldMax = findTF(arg_1_0._tf, "res/gold/max"):GetComponent(typeof(Text))
	arg_1_0.goldValue = findTF(arg_1_0._tf, "res/gold/Text"):GetComponent(typeof(Text))
	arg_1_0.oilMax = findTF(arg_1_0._tf, "res/oil/max"):GetComponent(typeof(Text))
	arg_1_0.oilValue = findTF(arg_1_0._tf, "res/oil/Text"):GetComponent(typeof(Text))
	arg_1_0.gemValue = findTF(arg_1_0._tf, "res/gem/Text"):GetComponent(typeof(Text))
	arg_1_0.expTr = findTF(arg_1_0._tf, "name_bg/level/mask")

	onButton(arg_1_0, findTF(arg_1_0._tf, "res/gold"), function()
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_1_0, findTF(arg_1_0._tf, "res/oil"), function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_1_0, findTF(arg_1_0._tf, "res/gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
end

function var_0_0.Flush(arg_5_0, arg_5_1)
	var_0_0.super.Flush(arg_5_0, arg_5_1)
	arg_5_0:UpdateRes()
end

function var_0_0.UpdateRes(arg_6_0)
	local var_6_0 = getProxy(PlayerProxy):getRawData()

	PlayerResUI.StaticFlush(var_6_0, arg_6_0.goldMax, arg_6_0.goldValue, arg_6_0.oilMax, arg_6_0.oilValue, arg_6_0.gemValue)
end

function var_0_0.UpdateExp(arg_7_0)
	local var_7_0 = 0
	local var_7_1 = getProxy(PlayerProxy):getRawData()

	arg_7_0.playerLevelTxt.text = var_7_1.level
	arg_7_0.expTxt.text = var_7_1.level

	local var_7_2

	if var_7_1.level == var_7_1:getMaxLevel() then
		var_7_2 = 1
	else
		local var_7_3 = getConfigFromLevel1(pg.user_level, var_7_1.level)

		var_7_2 = var_7_1.exp / var_7_3.exp_interval
	end

	local var_7_4 = 34 * var_7_2

	arg_7_0.expTr.sizeDelta = Vector2(70, var_7_4)
end

function var_0_0.Dispose(arg_8_0)
	var_0_0.super.Dispose(arg_8_0)
	pg.DelegateInfo.Dispose(arg_8_0)
end

return var_0_0
