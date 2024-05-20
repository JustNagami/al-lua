local var_0_0 = class("SkinExperienceDiplayPage", import("...base.BaseSubView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0:bind(NewMainScene.ON_SKIN_FREEUSAGE_DESC, function(arg_2_0, arg_2_1)
		arg_1_0:ExecuteAction("Show", arg_2_1)
	end)
end

function var_0_0.getUIName(arg_3_0)
	return "ExSkinListUI"
end

function var_0_0.OnLoaded(arg_4_0)
	arg_4_0.uilist = UIItemList.New(arg_4_0:findTF("window/list/content"), arg_4_0:findTF("window/list/content/tpl"))
	arg_4_0.skinTimers = {}
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0:findTF("window/top/btnBack"), function()
		arg_5_0:Hide()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0._tf, function()
		arg_5_0:Hide()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0:findTF("window/button_container/confirm_btn"), function()
		arg_5_0:Hide()
	end, SFX_CANCEL)
end

function var_0_0.Show(arg_9_0, arg_9_1)
	var_0_0.super.Show(arg_9_0)
	arg_9_0:Display(arg_9_1)
	pg.UIMgr.GetInstance():BlurPanel(arg_9_0._tf, false, {
		weight = LayerWeightConst.SECOND_LAYER
	})
end

function var_0_0.Hide(arg_10_0)
	var_0_0.super.Hide(arg_10_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_10_0._tf, pg.UIMgr.GetInstance()._normalUIMain)
end

function var_0_0.Display(arg_11_0, arg_11_1)
	arg_11_0:Clear()
	arg_11_0.uilist:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventUpdate then
			local var_12_0 = arg_11_1[arg_12_1 + 1]

			setText(arg_12_2:Find("name/Text"), var_12_0:getConfig("name"))

			if arg_11_0.skinTimers[var_12_0.id] then
				arg_11_0.skinTimers[var_12_0.id]:Stop()
			end

			arg_11_0.skinTimers[var_12_0.id] = Timer.New(function()
				local var_13_0 = skinTimeStamp(var_12_0:getRemainTime())

				setText(arg_12_2:Find("time/Text"), var_13_0)
			end, 1, -1)

			arg_11_0.skinTimers[var_12_0.id]:Start()
			arg_11_0.skinTimers[var_12_0.id].func()

			local var_12_1 = arg_12_2:Find("icon_bg/icon")

			LoadSpriteAsync("qicon/" .. var_12_0:getIcon(), function(arg_14_0)
				if not IsNil(arg_11_0._tf) then
					var_12_1:GetComponent(typeof(Image)).sprite = arg_14_0
				end
			end)
		end
	end)
	arg_11_0.uilist:align(#arg_11_1)
end

function var_0_0.Clear(arg_15_0)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.skinTimers) do
		iter_15_1:Stop()
	end

	arg_15_0.skinTimers = {}
end

function var_0_0.OnDestroy(arg_16_0)
	arg_16_0:Clear()

	arg_16_0.skinTimers = nil
end

return var_0_0
