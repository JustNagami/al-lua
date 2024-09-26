local var_0_0 = class("Dorm3dPhotoShareLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dPhotoShareUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.photoImgTrans = arg_2_0:findTF("PhotoImg")
	arg_2_0.shareBtnTrans = arg_2_0:findTF("ShareBtn")
	arg_2_0.confirmBtnTrans = arg_2_0:findTF("ConfirmBtn")
	arg_2_0.cancelBtnTrans = arg_2_0:findTF("CancelBtn")
	arg_2_0.frameBtn = arg_2_0:findTF("frameBtn")
	arg_2_0.photoAdapter = arg_2_0:findTF("photoAdapter")
	arg_2_0.bytes = arg_2_0.contextData.photoData
	arg_2_0.frameDic = {}
	arg_2_0.loadingDic = {}

	arg_2_0:InitFrame()
end

function var_0_0.didEnter(arg_3_0)
	local var_3_0 = false

	onButton(arg_3_0, arg_3_0.shareBtnTrans, function()
		local var_4_0 = arg_3_0.frameDic[arg_3_0.selectFrameId]

		if var_4_0 then
			local var_4_1 = pg.dorm3d_camera_photo_frame[arg_3_0.selectFrameId]

			pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeDorm3dPhoto, nil, {
				weight = LayerWeightConst.TOP_LAYER
			}, true, var_4_0:Find("frame").sizeDelta, var_4_1.watermark_location)
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.confirmBtnTrans, function()
		local var_5_0 = arg_3_0.frameDic[arg_3_0.selectFrameId]

		if var_5_0 then
			local var_5_1 = pg.ShareMgr.GetInstance()
			local var_5_2 = var_5_0:Find("frame").sizeDelta
			local var_5_3 = arg_3_0:TakePhoto(pg.ShareMgr.TypeDorm3dPhoto, var_5_2)
			local var_5_4 = pg.TimeMgr.GetInstance():STimeDescS(pg.TimeMgr.GetInstance():GetServerTime(), "*t")
			local var_5_5 = "azur" .. var_5_4.year .. var_5_4.month .. var_5_4.day .. var_5_4.hour .. var_5_4.min .. var_5_4.sec .. ".jpg"
			local var_5_6 = Application.persistentDataPath .. "/" .. var_5_5

			MediaSaver.SaveImageWithBytes(var_5_6, var_5_3)
			pg.TipsMgr.GetInstance():ShowTips(i18n("word_save_ok"))
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("Mask"), function()
		arg_3_0:closeView()
	end)
	onButton(arg_3_0, arg_3_0.cancelBtnTrans, function()
		arg_3_0:emit(Dorm3dPhotoShareLayerMediator.EXIT_SHARE)
		arg_3_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0.frameBtn, function()
		arg_3_0:emit(Dorm3dPhotoShareLayerMediator.SELECTFRAME, arg_3_0.contextData.photoTex, arg_3_0.contextData.photoData)
	end)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf, true, {
		weight = LayerWeightConst.SECOND_LAYER
	})
end

function var_0_0.willExit(arg_9_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_9_0._tf)
end

function var_0_0.exit(arg_10_0)
	var_0_0.super.exit(arg_10_0)
end

function var_0_0.AfterSelectFrame(arg_11_0, arg_11_1)
	arg_11_0.selectFrameId = arg_11_1.selectFrameId

	for iter_11_0, iter_11_1 in pairs(arg_11_0.frameDic) do
		setActive(iter_11_1, false)
	end

	arg_11_0:LoadFrame(arg_11_1.imagePos, arg_11_1.imageScale)
end

function var_0_0.InitFrame(arg_12_0)
	arg_12_0.selectFrameId = 1001

	arg_12_0:LoadFrame({
		0,
		0
	})
end

function var_0_0.LoadFrame(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = pg.dorm3d_camera_photo_frame[arg_13_0.selectFrameId]

	local function var_13_1(arg_14_0)
		local var_14_0 = arg_14_0:Find("mask/realImage")
		local var_14_1 = var_14_0:GetComponent(typeof(RawImage))

		var_14_1.texture = arg_13_0.contextData.photoTex
		var_14_0.sizeDelta = GameObject.Find("OverlayCamera").transform:GetChild(0).sizeDelta

		setAnchoredPosition(var_14_1, {
			x = arg_13_1.x,
			y = arg_13_1.y
		})

		if arg_13_2 then
			var_14_0.localScale = arg_13_2
		end
	end

	local var_13_2 = arg_13_0.frameDic[arg_13_0.selectFrameId]

	if var_13_2 then
		setActive(var_13_2, true)
		var_13_1(var_13_2)

		return
	end

	if arg_13_0.loadingDic[arg_13_0.selectFrameId] then
		return
	end

	local var_13_3 = arg_13_0.selectFrameId

	ResourceMgr.Inst:getAssetAsync("ui/" .. var_13_0.frameTfName, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_15_0)
		arg_13_0.loadingDic[var_13_3] = false

		local var_15_0 = Object.Instantiate(arg_15_0, arg_13_0.photoAdapter).transform

		arg_13_0.frameDic[var_13_3] = var_15_0

		if arg_13_0.selectFrameId == var_13_3 then
			var_13_1(var_15_0)
		else
			setActive(var_15_0, false)
		end

		var_15_0:Find("mask/realImage"):GetComponent(typeof(ScrollRect)).enabled = false
		var_15_0:Find("mask/realImage"):GetComponent(typeof(PinchZoom)).enabled = false

		var_13_1(var_15_0)
	end), true, true)
end

function var_0_0.TakePhoto(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = {}
	local var_16_1 = {}
	local var_16_2 = {}
	local var_16_3 = pg.share_template[arg_16_1]

	assert(var_16_3, "share_template not exist: " .. arg_16_1)
	_.each(var_16_3.hidden_comps, function(arg_17_0)
		local var_17_0 = GameObject.Find(arg_17_0)

		if not IsNil(var_17_0) and var_17_0.activeSelf then
			table.insert(var_16_0, var_17_0)
			var_17_0:SetActive(false)
		end
	end)
	_.each(var_16_3.show_comps, function(arg_18_0)
		local var_18_0 = GameObject.Find(arg_18_0)

		if not IsNil(var_18_0) and not var_18_0.activeSelf then
			table.insert(var_16_1, var_18_0)
			var_18_0:SetActive(true)
		end
	end)
	_.each(var_16_3.move_comps, function(arg_19_0)
		local var_19_0 = GameObject.Find(arg_19_0.path)

		if not IsNil(var_19_0) then
			local var_19_1 = var_19_0.transform.anchoredPosition.x
			local var_19_2 = var_19_0.transform.anchoredPosition.y
			local var_19_3 = arg_19_0.x
			local var_19_4 = arg_19_0.y

			table.insert(var_16_2, {
				var_19_0,
				var_19_1,
				var_19_2
			})
			setAnchoredPosition(var_19_0, {
				x = var_19_3,
				y = var_19_4
			})
		end
	end)

	local var_16_4 = GameObject.Find(var_16_3.camera):GetComponent(typeof(Camera))
	local var_16_5 = var_16_4.transform:GetChild(0)
	local var_16_6 = ScreenShooter.New(Screen.width, Screen.height, TextureFormat.ARGB32)
	local var_16_7 = arg_16_0:TakeTexture(var_16_6, var_16_4)

	_.each(var_16_0, function(arg_20_0)
		arg_20_0:SetActive(true)
	end)

	var_16_0 = {}

	_.each(var_16_1, function(arg_21_0)
		arg_21_0:SetActive(false)
	end)

	var_16_1 = {}

	_.each(var_16_2, function(arg_22_0)
		setAnchoredPosition(arg_22_0[1], {
			x = arg_22_0[2],
			y = arg_22_0[3]
		})
	end)

	var_16_2 = {}

	local var_16_8 = arg_16_2.x / var_16_5.sizeDelta.x * Screen.width
	local var_16_9 = arg_16_2.y / var_16_5.sizeDelta.y * Screen.height
	local var_16_10 = UnityEngine.Texture2D.New(var_16_8, var_16_9)
	local var_16_11 = (Screen.width - var_16_8) / 2
	local var_16_12 = (Screen.height - var_16_9) / 2
	local var_16_13 = var_16_7:GetPixels(var_16_11, var_16_12, var_16_8, var_16_9)

	var_16_10:SetPixels(var_16_13)
	var_16_10:Apply()

	local var_16_14 = var_16_6:EncodeToJPG(var_16_10)

	return (Tex2DExtension.EncodeToJPG(var_16_14))
end

function var_0_0.TakeTexture(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_1:TakePhoto(arg_23_2)

	return (arg_23_1:EncodeToJPG(var_23_0))
end

return var_0_0
