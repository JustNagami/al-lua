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

			YSNormalTool.MediaTool.SaveImageWithBytes(var_5_3, function(arg_6_0, arg_6_1)
				if arg_6_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("word_save_ok"))
				end
			end)
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

function var_0_0.willExit(arg_10_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_10_0._tf)
end

function var_0_0.exit(arg_11_0)
	var_0_0.super.exit(arg_11_0)
end

function var_0_0.AfterSelectFrame(arg_12_0, arg_12_1)
	arg_12_0.selectFrameId = arg_12_1.selectFrameId

	for iter_12_0, iter_12_1 in pairs(arg_12_0.frameDic) do
		setActive(iter_12_1, false)
	end

	arg_12_0:LoadFrame(arg_12_1.imagePos, arg_12_1.imageScale, arg_12_1.specialPosDic)
end

function var_0_0.InitFrame(arg_13_0)
	arg_13_0.selectFrameId = 1001

	arg_13_0:LoadFrame({
		0,
		0
	})
end

function var_0_0.LoadFrame(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	local var_14_0 = pg.dorm3d_camera_photo_frame[arg_14_0.selectFrameId]
	local var_14_1 = var_14_0.frameTfName == "FilmFrame"
	local var_14_2 = var_14_0.frameTfName == "InsFrame"

	local function var_14_3(arg_15_0)
		local var_15_0 = arg_15_0:Find("mask/realImage")
		local var_15_1 = var_15_0:GetComponent(typeof(RawImage))

		var_15_1.texture = arg_14_0.contextData.photoTex
		var_15_0.sizeDelta = GameObject.Find("OverlayCamera").transform:GetChild(0).sizeDelta

		setAnchoredPosition(var_15_1, {
			x = arg_14_1.x,
			y = arg_14_1.y
		})

		if arg_14_2 then
			var_15_0.localScale = arg_14_2
		end

		if arg_14_3 then
			local var_15_2 = {
				"mask_up/realImage"
			}

			if var_14_1 then
				table.insert(var_15_2, "mask_down/realImage")
			end

			local var_15_3 = {
				"upPos",
				"downPos"
			}
			local var_15_4 = {
				"upScale",
				"downScale"
			}

			for iter_15_0, iter_15_1 in ipairs(var_15_2) do
				local var_15_5 = arg_15_0:Find(iter_15_1)
				local var_15_6 = var_15_5:GetComponent(typeof(RawImage))

				var_15_6.texture = arg_14_0.contextData.photoTex

				local var_15_7 = GameObject.Find("OverlayCamera").transform:GetChild(0)

				if var_14_2 and iter_15_1 == "mask_up/realImage" then
					var_15_5.sizeDelta = Vector2(var_15_7.sizeDelta.x / 10, var_15_7.sizeDelta.y / 10)
				else
					var_15_5.sizeDelta = var_15_7.sizeDelta
				end

				local var_15_8 = var_15_3[iter_15_0]

				setAnchoredPosition(var_15_6, {
					x = arg_14_3[var_15_8].x,
					y = arg_14_3[var_15_8].y
				})

				local var_15_9 = arg_14_3[var_15_4[iter_15_0]]

				if var_15_9 then
					var_15_5.localScale = var_15_9
				end
			end
		end
	end

	local var_14_4 = arg_14_0.frameDic[arg_14_0.selectFrameId]

	if var_14_4 then
		setActive(var_14_4, true)
		var_14_3(var_14_4)

		return
	end

	if arg_14_0.loadingDic[arg_14_0.selectFrameId] then
		return
	end

	local var_14_5 = arg_14_0.selectFrameId

	ResourceMgr.Inst:getAssetAsync("ui/" .. var_14_0.frameTfName, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_16_0)
		arg_14_0.loadingDic[var_14_5] = false

		local var_16_0 = Object.Instantiate(arg_16_0, arg_14_0.photoAdapter).transform

		arg_14_0.frameDic[var_14_5] = var_16_0

		if arg_14_0.selectFrameId == var_14_5 then
			var_14_3(var_16_0)
		else
			setActive(var_16_0, false)
		end

		var_16_0:Find("mask/realImage"):GetComponent(typeof(ScrollRect)).enabled = false
		var_16_0:Find("mask/realImage"):GetComponent(typeof(PinchZoom)).enabled = false

		local var_16_1 = var_16_0:Find("mask_up/realImage")
		local var_16_2 = var_16_0:Find("mask_down/realImage")

		if var_16_1 then
			var_16_1:GetComponent(typeof(PinchZoom)).enabled = false
		end

		if var_16_2 then
			var_16_2:GetComponent(typeof(PinchZoom)).enabled = false
		end

		var_14_3(var_16_0)
	end), true, true)
end

function var_0_0.TakePhoto(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = {}
	local var_17_1 = {}
	local var_17_2 = {}
	local var_17_3 = pg.share_template[arg_17_1]

	assert(var_17_3, "share_template not exist: " .. arg_17_1)
	_.each(var_17_3.hidden_comps, function(arg_18_0)
		local var_18_0 = GameObject.Find(arg_18_0)

		if not IsNil(var_18_0) and var_18_0.activeSelf then
			table.insert(var_17_0, var_18_0)
			var_18_0:SetActive(false)
		end
	end)
	_.each(var_17_3.show_comps, function(arg_19_0)
		local var_19_0 = GameObject.Find(arg_19_0)

		if not IsNil(var_19_0) and not var_19_0.activeSelf then
			table.insert(var_17_1, var_19_0)
			var_19_0:SetActive(true)
		end
	end)
	_.each(var_17_3.move_comps, function(arg_20_0)
		local var_20_0 = GameObject.Find(arg_20_0.path)

		if not IsNil(var_20_0) then
			local var_20_1 = var_20_0.transform.anchoredPosition.x
			local var_20_2 = var_20_0.transform.anchoredPosition.y
			local var_20_3 = arg_20_0.x
			local var_20_4 = arg_20_0.y

			table.insert(var_17_2, {
				var_20_0,
				var_20_1,
				var_20_2
			})
			setAnchoredPosition(var_20_0, {
				x = var_20_3,
				y = var_20_4
			})
		end
	end)

	local var_17_4 = GameObject.Find(var_17_3.camera):GetComponent(typeof(Camera))
	local var_17_5 = var_17_4.transform:GetChild(0)
	local var_17_6 = ScreenShooter.New(Screen.width, Screen.height, TextureFormat.ARGB32)
	local var_17_7 = arg_17_0:TakeTexture(var_17_6, var_17_4)

	_.each(var_17_0, function(arg_21_0)
		arg_21_0:SetActive(true)
	end)

	var_17_0 = {}

	_.each(var_17_1, function(arg_22_0)
		arg_22_0:SetActive(false)
	end)

	var_17_1 = {}

	_.each(var_17_2, function(arg_23_0)
		setAnchoredPosition(arg_23_0[1], {
			x = arg_23_0[2],
			y = arg_23_0[3]
		})
	end)

	var_17_2 = {}

	local var_17_8 = arg_17_2.x / var_17_5.sizeDelta.x * Screen.width
	local var_17_9 = arg_17_2.y / var_17_5.sizeDelta.y * Screen.height
	local var_17_10 = UnityEngine.Texture2D.New(var_17_8, var_17_9)
	local var_17_11 = (Screen.width - var_17_8) / 2
	local var_17_12 = (Screen.height - var_17_9) / 2
	local var_17_13 = var_17_7:GetPixels(var_17_11, var_17_12, var_17_8, var_17_9)

	var_17_10:SetPixels(var_17_13)
	var_17_10:Apply()

	local var_17_14 = var_17_6:EncodeToJPG(var_17_10)

	return (Tex2DExtension.EncodeToJPG(var_17_14))
end

function var_0_0.TakeTexture(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_1:TakePhoto(arg_24_2)

	return (arg_24_1:EncodeToJPG(var_24_0))
end

return var_0_0
