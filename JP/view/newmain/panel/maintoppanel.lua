local var_0_0 = class("MainTopPanel", import(".MainBasePanel"))

function var_0_0.OnSetUp(arg_1_0)
	arg_1_0.playerInfoBtn = findTF(arg_1_0._tf, "iconBack")
	arg_1_0.playerNameTxt = findTF(arg_1_0._tf, "name"):GetComponent(typeof(Text))
	arg_1_0.playerLevelTxt = findTF(arg_1_0._tf, "level"):GetComponent(typeof(Text))
	arg_1_0.expSlider = findTF(arg_1_0._tf, "exp"):GetComponent(typeof(Slider))
end

function var_0_0.OnRegist(arg_2_0)
	onButton(arg_2_0, arg_2_0.playerInfoBtn, function()
		arg_2_0:emit(NewMainMediator.GO_SCENE, SCENE.PLAYER_INFO)
	end, SFX_MAIN)
	arg_2_0:UpdatePlayer()
end

function var_0_0.UpdatePlayer(arg_4_0)
	local var_4_0 = getProxy(PlayerProxy):getRawData()

	arg_4_0.playerNameTxt.text = var_4_0.name
	arg_4_0.playerLevelTxt.text = "LV." .. var_4_0.level

	if var_4_0.level == var_4_0:getMaxLevel() then
		arg_4_0.expSlider.value = 1
	else
		local var_4_1 = getConfigFromLevel1(pg.user_level, var_4_0.level)

		arg_4_0.expSlider.value = var_4_0.exp / var_4_1.exp_interval
	end
end

function var_0_0.GetDirection(arg_5_0)
	return Vector2(0, 1)
end

function var_0_0.OnUpdatePlayer(arg_6_0)
	arg_6_0:UpdatePlayer()
end

function var_0_0.OnFresh(arg_7_0)
	arg_7_0:UpdatePlayer()

	arg_7_0.playerNameTxt.enabled = false
	arg_7_0.playerNameTxt.enabled = true
	arg_7_0.playerLevelTxt.enabled = false
	arg_7_0.playerLevelTxt.enabled = true
end

return var_0_0
