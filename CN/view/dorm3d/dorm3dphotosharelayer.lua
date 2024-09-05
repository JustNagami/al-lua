local var_0_0 = class("Dorm3dPhotoShareLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dPhotoShareUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.photoImgTrans = arg_2_0:findTF("PhotoImg")
	arg_2_0.rawImage = arg_2_0.photoImgTrans:GetComponent("RawImage")
	arg_2_0.shareBtnTrans = arg_2_0:findTF("ShareBtn")
	arg_2_0.confirmBtnTrans = arg_2_0:findTF("ConfirmBtn")
	arg_2_0.cancelBtnTrans = arg_2_0:findTF("CancelBtn")
	arg_2_0.rawImage.texture = arg_2_0.contextData.photoTex
	arg_2_0.bytes = arg_2_0.contextData.photoData
	arg_2_0.realImage = arg_2_0:findTF("Realimage")

	local var_2_0 = arg_2_0.contextData.photoTex.width
	local var_2_1 = arg_2_0.contextData.photoTex.height

	arg_2_0.realImage.sizeDelta = Vector2.New(var_2_0, var_2_1)
	arg_2_0.realImage:GetComponent("RawImage").texture = arg_2_0.contextData.photoTex

	SetActive(arg_2_0.shareBtnTrans, false)
end

function var_0_0.didEnter(arg_3_0)
	local var_3_0 = false

	onButton(arg_3_0, arg_3_0.shareBtnTrans, function()
		local var_4_0 = pg.ShareMgr.GetInstance()

		SetActive(arg_3_0.realImage, true)
		var_4_0:Share(pg.ShareMgr.TypeDorm3dPhoto, nil, {
			weight = LayerWeightConst.TOP_LAYER
		}, true)
		SetActive(arg_3_0.realImage, false)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.confirmBtnTrans, function()
		local var_5_0 = pg.TimeMgr.GetInstance():STimeDescS(pg.TimeMgr.GetInstance():GetServerTime(), "*t")
		local var_5_1 = "azur" .. var_5_0.year .. var_5_0.month .. var_5_0.day .. var_5_0.hour .. var_5_0.min .. var_5_0.sec .. ".jpg"
		local var_5_2 = Application.persistentDataPath .. "/" .. var_5_1

		MediaSaver.SaveImageWithBytes(var_5_2, arg_3_0.bytes)
		pg.TipsMgr.GetInstance():ShowTips(i18n("word_save_ok"))
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("Mask"), function()
		arg_3_0:closeView()
	end)
	onButton(arg_3_0, arg_3_0.cancelBtnTrans, function()
		arg_3_0:closeView()
	end, SFX_CANCEL)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf, true, {
		weight = LayerWeightConst.SECOND_LAYER
	})
end

function var_0_0.willExit(arg_8_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_8_0._tf)
end

return var_0_0
