local var_0_0 = class("Dorm3dPhotoSelectFrame", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dPhotoSelectfFrameUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.cancelBtnTrans = arg_2_0:findTF("cancelBtn")
	arg_2_0.confirmBtnTrans = arg_2_0:findTF("selectPage/confirmBtn")
	arg_2_0.frameAdapter = arg_2_0:findTF("frameAdapter")

	local var_2_0 = arg_2_0:findTF("selectPage/Scroll/Viewport/Content")
	local var_2_1 = pg.dorm3d_camera_photo_frame.all

	local function var_2_2()
		UIItemList.StaticAlign(var_2_0, var_2_0:GetChild(0), #var_2_1, function(arg_4_0, arg_4_1, arg_4_2)
			if arg_4_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_4_1 = arg_4_1 + 1

			setActive(arg_4_2:Find("Selected"), arg_2_0.selectIndex == arg_4_1)
		end)
	end

	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf, true, {
		weight = LayerWeightConst.TOP_LAYER
	})

	arg_2_0.frameDic = {}
	arg_2_0.loadingDic = {}
	arg_2_0.lateFuncDic = {}

	UIItemList.StaticAlign(var_2_0, var_2_0:GetChild(0), #var_2_1, function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_5_1 = arg_5_1 + 1

		local var_5_0 = pg.dorm3d_camera_photo_frame[var_2_1[arg_5_1]]

		GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_5_0.farme_small_path), "", arg_5_2:Find("Icon"))
		setActive(arg_5_2:Find("Selected"), false)

		local var_5_1, var_5_2 = ApartmentProxy.CheckUnlockConfig(var_5_0.unlock)

		setActive(arg_5_2:Find("lock"), not var_5_1)

		if not var_5_1 then
			setText(arg_5_2:Find("lock/Image/Text"), var_5_0.unlock_text)
		end

		onButton(arg_2_0, arg_5_2, function()
			if not var_5_1 then
				pg.TipsMgr.GetInstance():ShowTips(var_5_2)

				return
			end

			if arg_2_0.selectIndex == arg_5_1 then
				return
			end

			arg_2_0.selectIndex = arg_5_1

			var_2_2()

			for iter_6_0, iter_6_1 in pairs(arg_2_0.frameDic) do
				setActive(iter_6_1, false)
			end

			local function var_6_0(arg_7_0)
				local var_7_0 = arg_7_0:Find("mask/realImage")

				var_7_0:GetComponent(typeof(RawImage)).texture = arg_2_0.contextData.photoTex
				var_7_0.sizeDelta = GameObject.Find("OverlayCamera").transform:GetChild(0).sizeDelta

				setAnchoredPosition(var_7_0, {
					x = 0,
					y = 0
				})

				var_7_0.localScale = Vector3(1, 1, 1)
			end

			local var_6_1 = arg_2_0.frameDic[arg_2_0.selectIndex]

			if var_6_1 then
				setActive(var_6_1, true)
				var_6_0(var_6_1)

				return
			end

			if arg_2_0.loadingDic[arg_5_1] then
				return
			end

			arg_2_0.loadingDic[arg_5_1] = true

			ResourceMgr.Inst:getAssetAsync("ui/" .. var_5_0.frameTfName, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_8_0)
				arg_2_0.loadingDic[arg_5_1] = false

				local var_8_0 = Object.Instantiate(arg_8_0, arg_2_0.frameAdapter).transform

				arg_2_0.frameDic[arg_5_1] = var_8_0

				;(function()
					local var_9_0 = var_8_0:Find("mask/realImage")
					local var_9_1 = GetOrAddComponent(var_8_0:Find("mask/realImage"), "PinchZoom")
					local var_9_2 = GetOrAddComponent(var_8_0:Find("mask/realImage"), "EventTriggerListener")
					local var_9_3 = true

					var_9_2:AddPointDownFunc(function(arg_10_0)
						if Input.touchCount == 1 or IsUnityEditor then
							var_9_3 = true
						elseif Input.touchCount >= 2 then
							var_9_3 = false
						end
					end)
					var_9_2:AddPointUpFunc(function(arg_11_0)
						if Input.touchCount <= 2 then
							var_9_3 = true
						end
					end)

					local var_9_4 = GameObject.Find("OverlayCamera").transform:GetChild(0).sizeDelta
					local var_9_5 = var_8_0:Find("mask").sizeDelta

					var_9_2:AddBeginDragFunc(function(arg_12_0, arg_12_1)
						touchOffsetX = arg_12_1.position.x - var_9_0.localPosition.x
						touchOffsetY = arg_12_1.position.y - var_9_0.localPosition.y
					end)

					local var_9_6 = LateUpdateBeat:CreateListener(function()
						if var_9_1.processing then
							local var_13_0 = var_9_0.localScale
							local var_13_1 = (var_9_4.x * var_13_0.x - var_9_5.x) / 2
							local var_13_2 = (var_9_4.y * var_13_0.x - var_9_5.y) / 2
							local var_13_3 = math.clamp(var_9_0.localPosition.x, -var_13_1, var_13_1)
							local var_13_4 = math.clamp(var_9_0.localPosition.y, -var_13_2, var_13_2)

							var_9_0.localPosition = Vector3(var_13_3, var_13_4, 1)
						end
					end, arg_2_0)

					LateUpdateBeat:AddListener(var_9_6)

					arg_2_0.lateFuncDic[arg_5_1] = var_9_6

					var_9_2:AddDragFunc(function(arg_14_0, arg_14_1)
						if var_9_1.processing then
							return
						end

						if var_9_3 then
							local var_14_0 = var_9_0.localScale
							local var_14_1 = (var_9_4.x * var_14_0.x - var_9_5.x) / 2
							local var_14_2 = (var_9_4.y * var_14_0.x - var_9_5.y) / 2
							local var_14_3 = math.clamp(arg_14_1.position.x - touchOffsetX, -var_14_1, var_14_1)
							local var_14_4 = math.clamp(arg_14_1.position.y - touchOffsetY, -var_14_2, var_14_2)

							var_9_0.localPosition = Vector3(var_14_3, var_14_4, 1)
						end
					end)
				end)()

				if arg_2_0.selectIndex == arg_5_1 then
					var_6_0(var_8_0)
				else
					setActive(var_8_0, false)
				end
			end), true, true)
		end)

		if arg_5_1 == 1 then
			triggerButton(arg_5_2)
		end
	end)
end

function var_0_0.didEnter(arg_15_0)
	onButton(arg_15_0, arg_15_0.cancelBtnTrans, function()
		arg_15_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_15_0, arg_15_0.confirmBtnTrans, function()
		arg_15_0:SelectFrame()
		arg_15_0:closeView()
	end, SFX_CANCEL)
end

function var_0_0.SelectFrame(arg_18_0)
	local var_18_0 = pg.dorm3d_camera_photo_frame.all[arg_18_0.selectIndex]
	local var_18_1 = arg_18_0.frameDic[arg_18_0.selectIndex]
	local var_18_2 = var_18_1:Find("mask/realImage").anchoredPosition
	local var_18_3 = var_18_1:Find("mask/realImage").localScale

	arg_18_0:emit(Dorm3dPhotoSelectFrameMediator.CONFIRMFRAME, var_18_0, var_18_2, var_18_3)
end

function var_0_0.willExit(arg_19_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_19_0._tf)

	for iter_19_0, iter_19_1 in pairs(arg_19_0.lateFuncDic) do
		LateUpdateBeat:RemoveListener(iter_19_1)
	end
end

return var_0_0
