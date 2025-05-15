local var_0_0 = class("IslandShipIslandCommanderMainPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandCommanderMainUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0:findTF("adapt/left_panel/back")
	arg_2_0.homeBtn = arg_2_0:findTF("adapt/home")

	setText(arg_2_0:findTF("adapt/left_panel/title/Text"), i18n1("装扮"))
end

function var_0_0.AddListeners(arg_3_0)
	return
end

function var_0_0.RemoveListeners(arg_4_0)
	return
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0.homeBtn, function()
		arg_5_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.backBtn, function()
		if arg_5_0.currentChildPage:CheckDressIsDirty() then
			arg_5_0:ShowMsgBox({
				content = "装扮信息存在改动,是否保存当前装扮",
				type = IslandMsgBox.TYPE_COMMON,
				onYes = function()
					arg_5_0.currentChildPage:SaveDressUpData()
					arg_5_0:Hide()
				end,
				onNo = function()
					arg_5_0:Hide()
				end
			})
		else
			arg_5_0:Hide()
		end
	end, SFX_PANEL)
end

function var_0_0.Show(arg_10_0)
	var_0_0.super.Show(arg_10_0)
	arg_10_0:Flush()

	arg_10_0.currentChildPage = arg_10_0:OpenPage(IslandShipDressUpPage)
end

function var_0_0.Flush(arg_11_0)
	return
end

function var_0_0.Hide(arg_12_0)
	var_0_0.super.Hide(arg_12_0)
end

function var_0_0.OnDestroy(arg_13_0)
	return
end

return var_0_0
