local var_0_0 = class("Dorm3dPhotoLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dPhotoUI"
end

local var_0_1 = {
	"/OverlayCamera/Overlay/UIOverlay/TipPanel(Clone)"
}

var_0_0.PANEL = {
	CAMERA = 2,
	LIGHTING = 3,
	ACTION = 1
}

function var_0_0.init(arg_2_0)
	arg_2_0.centerPanel = arg_2_0._tf:Find("Center")
	arg_2_0.normalPanel = arg_2_0._tf:Find("Center/Normal")

	setActive(arg_2_0.normalPanel, true)

	arg_2_0.settingPanel = arg_2_0._tf:Find("Center/Settings")
	arg_2_0.btnAction = arg_2_0.settingPanel:Find("Action")
	arg_2_0.btnCamera = arg_2_0.settingPanel:Find("Camera")
	arg_2_0.btnLighting = arg_2_0.settingPanel:Find("Lighting")
	arg_2_0.panelAction = arg_2_0.settingPanel:Find("ActionSelect")

	setActive(arg_2_0.panelAction, false)
	setActive(arg_2_0.panelAction:Find("Mask"), false)

	arg_2_0.panelCamera = arg_2_0.settingPanel:Find("CameraSettings")

	setActive(arg_2_0.panelCamera, false)

	arg_2_0.panelLightning = arg_2_0.settingPanel:Find("LightningSettings")

	setActive(arg_2_0.panelLightning, false)

	arg_2_0.listZones = arg_2_0._tf:Find("ZoneList")

	setActive(arg_2_0.listZones, false)

	arg_2_0.zoneMask = arg_2_0.listZones:Find("Mask")
	arg_2_0.btnHideUI = arg_2_0._tf:Find("Center/HideUI")
	arg_2_0.btnReset = arg_2_0._tf:Find("Center/Reset")
	arg_2_0.btnFreeze = arg_2_0._tf:Find("Center/Freeze")
	arg_2_0.btnMove = arg_2_0._tf:Find("Center/Move")
	arg_2_0.btnZone = arg_2_0._tf:Find("Center/Zone")
	arg_2_0.btnAr = arg_2_0._tf:Find("Center/Ar")
	arg_2_0.ARchecker = GetComponent(arg_2_0.btnAr.gameObject, "ARChecker")
	arg_2_0.btnAnimSpeed = arg_2_0._tf:Find("Center/AnimSpeed")
	arg_2_0.listAnimSpeed = arg_2_0.btnAnimSpeed:Find("Bar")

	setActive(arg_2_0.listAnimSpeed, false)

	arg_2_0.textAnimSpeed = arg_2_0.btnAnimSpeed:Find("Text")
	arg_2_0.hideuiMask = arg_2_0._tf:Find("RightTop/Mask")

	setActive(arg_2_0.hideuiMask, false)

	arg_2_0.btnFilm = arg_2_0._tf:Find("RightTop/Film/Film")
	arg_2_0.filmTime = arg_2_0._tf:Find("RightTop/FilmTime")

	setActive(arg_2_0.filmTime, false)

	arg_2_0.shareUI = arg_2_0._tf:Find("ShareUI")

	setActive(arg_2_0.shareUI, false)

	arg_2_0.ysScreenShoter = arg_2_0._tf:Find("Shoter"):GetComponent(typeof(YSTool.YSScreenShoter))
	arg_2_0.ysScreenRecorder = arg_2_0._tf:Find("Shoter"):GetComponent(typeof(YSTool.YSScreenRecorder))
	arg_2_0.skinSelectPanel = arg_2_0._tf:Find("SkinSelectPanel")

	setActive(arg_2_0.skinSelectPanel, false)

	arg_2_0.btnMenuSmall = arg_2_0._tf:Find("Center/MenuSmall")
	arg_2_0.btnMenu = arg_2_0._tf:Find("Center/Menu")

	local var_2_0 = arg_2_0.panelAction:Find("Layout/Regular/Index")

	setActive(var_2_0, false)
	setText(arg_2_0.panelCamera:Find("Layout/DepthOfField/Title/Text"), i18n("dorm3d_photo_len"))
	setText(arg_2_0.panelCamera:Find("Layout/DepthOfField/Switch/Title"), i18n("dorm3d_photo_depthoffield"))
	setText(arg_2_0.panelCamera:Find("Layout/DepthOfField/DepthOfField/FocusDistance/Title"), i18n("dorm3d_photo_focusdistance"))
	setText(arg_2_0.panelCamera:Find("Layout/DepthOfField/DepthOfField/BlurRadius/Title"), i18n("dorm3d_photo_focusstrength"))
	setText(arg_2_0.panelCamera:Find("Layout/Paramaters/Title/Text"), i18n("dorm3d_photo_paramaters"))
	setText(arg_2_0.panelCamera:Find("Layout/Paramaters/PostExposure/PostExposure/Title"), i18n("dorm3d_photo_postexposure"))
	setText(arg_2_0.panelCamera:Find("Layout/Paramaters/Saturation/Saturation/Title"), i18n("dorm3d_photo_saturation"))
	setText(arg_2_0.panelCamera:Find("Layout/Paramaters/Contrast/Contrast/Title"), i18n("dorm3d_photo_contrast"))
	setText(arg_2_0.panelCamera:Find("Layout/Other/Title/Text"), i18n("dorm3d_photo_Others"))
	setText(arg_2_0.panelCamera:Find("Layout/Other/HideCharacter/Title"), i18n("dorm3d_photo_hidecharacter"))
	setText(arg_2_0.panelCamera:Find("Layout/Other/FaceCamera/Title"), i18n("dorm3d_photo_facecamera"))
	setText(arg_2_0.panelLightning:Find("Layout/Title/Filter/Name"), i18n("dorm3d_photo_filter"))
	setText(arg_2_0.panelLightning:Find("Layout/Title/Filter/Selected"), i18n("dorm3d_photo_filter"))
	setText(arg_2_0.panelAction:Find("Layout/Title/Regular/Name"), i18n("dorm3d_photo_regular_anim"))
	setText(arg_2_0.panelAction:Find("Layout/Title/Regular/Selected"), i18n("dorm3d_photo_regular_anim"))
	setText(arg_2_0.panelAction:Find("Layout/Title/Special/Name"), i18n("dorm3d_photo_special_anim"))
	setText(arg_2_0.panelAction:Find("Layout/Title/Special/Selected"), i18n("dorm3d_photo_special_anim"))
	setText(arg_2_0.skinSelectPanel:Find("BG/Scroll/Content/Unlock/Title/Text"), i18n("word_unlock"))
	setText(arg_2_0.skinSelectPanel:Find("BG/Scroll/Content/Lock/Title/Text"), i18n("word_lock"))

	arg_2_0.mainCamera = GameObject.Find("BackYardMainCamera"):GetComponent(typeof(Camera))
	arg_2_0.stopRecBtn = arg_2_0:findTF("stopRec")
	arg_2_0.videoTipPanel = arg_2_0:findTF("videoTipPanel")

	setActive(arg_2_0.videoTipPanel, false)

	arg_2_0.loader = AutoLoader.New()
end

function var_0_0.SetSceneRoot(arg_3_0, arg_3_1)
	arg_3_0.scene = arg_3_1
end

function var_0_0.SetRoom(arg_4_0, arg_4_1)
	arg_4_0.room = arg_4_1
end

function var_0_0.SetGroupId(arg_5_0, arg_5_1)
	arg_5_0.groupId = arg_5_1
end

function var_0_0.onBackPressed(arg_6_0)
	if arg_6_0.recordState then
		triggerButton(arg_6_0.btnFilm)

		return
	end

	if arg_6_0.activeSetting then
		triggerButton(arg_6_0._tf:Find("Center/Settings/Back"))

		return
	end

	arg_6_0:closeView()
end

function var_0_0.didEnter(arg_7_0)
	onButton(arg_7_0, arg_7_0._tf:Find("Center/Normal/Back"), function()
		arg_7_0:onBackPressed()
	end, SFX_CANCEL)

	local var_7_0 = arg_7_0.normalPanel:Find("Zoom/Slider")

	setSlider(var_7_0, 0, 1, 0)
	onSlider(arg_7_0, var_7_0, function(arg_9_0)
		arg_7_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetPhotoCameraHeight", arg_9_0)
	end)
	setActive(var_7_0, false)

	local var_7_1 = arg_7_0._tf:Find("Center/Stick")

	setActive(var_7_1, false)

	arg_7_0.activeSetting = false

	onButton(arg_7_0, arg_7_0._tf:Find("Center/Normal/Settings"), function()
		arg_7_0.activeSetting = true

		quickPlayAnimation(arg_7_0._tf:Find("Center"), "anim_dorm3d_photo_normal_out")
		arg_7_0:UpdateActionPanel()
		arg_7_0:UpdateCameraPanel()
		arg_7_0:UpdateLightingPanel()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0._tf:Find("Center/Settings/Back"), function()
		arg_7_0.activeSetting = false

		quickPlayAnimation(arg_7_0._tf:Find("Center"), "anim_dorm3d_photo_normal_in")
	end, SFX_CANCEL)

	arg_7_0.hideUI = false

	onButton(arg_7_0, arg_7_0.btnHideUI, function()
		if arg_7_0.hideUI then
			return
		end

		setActive(arg_7_0.hideuiMask, true)
		setActive(arg_7_0.centerPanel, false)

		arg_7_0.hideUI = true
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.hideuiMask, function()
		if not arg_7_0.hideUI then
			return
		end

		setActive(arg_7_0.centerPanel, true)
		setActive(arg_7_0.hideuiMask, false)

		arg_7_0.hideUI = false
	end)
	onButton(arg_7_0, arg_7_0.btnReset, function()
		arg_7_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetPhotoCameraPosition")
	end, SFX_PANEL)

	arg_7_0.recordState = false

	onButton(arg_7_0, arg_7_0.btnFilm, function()
		local function var_15_0(arg_16_0)
			setActive(arg_7_0.centerPanel, arg_16_0)

			arg_7_0:findTF("RightTop"):GetComponent("CanvasGroup").alpha = arg_16_0 and 1 or 0
		end

		if not arg_7_0.recordState then
			local function var_15_1(arg_17_0)
				if arg_17_0 ~= -1 then
					var_15_0(true)

					arg_7_0.recordState = false

					LeanTween.moveX(arg_7_0.stopRecBtn, arg_7_0.stopRecBtn.rect.width, 0.15)
				end
			end

			local function var_15_2(arg_18_0)
				warning("开始录屏结果：" .. tostring(arg_18_0))
			end

			local function var_15_3()
				setActive(arg_7_0.stopRecBtn, true)
				LeanTween.moveX(arg_7_0.stopRecBtn, 0, 0.15):setOnComplete(System.Action(function()
					var_0_0.SetMute(true)
					arg_7_0.ysScreenRecorder:BeforeStart()
					arg_7_0.ysScreenRecorder:StartRecord(var_15_2, var_15_1)
				end))

				if PLATFORM_CODE == PLATFORM_JP and pg.SdkMgr.GetInstance():GetChannelUID() == "2" then
					print("start recording : play sound")
					NotificationMgr.Inst:PlayStartRecordSound()
				end
			end

			seriesAsync({
				function(arg_21_0)
					CameraHelper.Request3DDorm(arg_21_0, nil)
				end,
				function(arg_22_0)
					arg_7_0.recordState = true

					var_15_0(false)

					local var_22_0 = PlayerPrefs.GetInt("hadShowForVideoTipDorm", 0)

					if not var_22_0 or var_22_0 <= 0 then
						PlayerPrefs.SetInt("hadShowForVideoTipDorm", 1)

						arg_7_0:findTF("Text", arg_7_0.videoTipPanel):GetComponent("Text").text = i18n("word_take_video_tip")

						onButton(arg_7_0, arg_7_0.videoTipPanel, function()
							setActive(arg_7_0.videoTipPanel, false)
							var_15_3()
						end)
						setActive(arg_7_0.videoTipPanel, true)
					else
						var_15_3()
					end
				end
			})
		end
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.stopRecBtn, function()
		arg_7_0.recordState = false

		local function var_24_0(arg_25_0)
			warning("结束录屏结果：" .. tostring(arg_25_0))
		end

		local function var_24_1(arg_26_0)
			setActive(arg_7_0.centerPanel, arg_26_0)

			arg_7_0:findTF("RightTop"):GetComponent("CanvasGroup").alpha = arg_26_0 and 1 or 0
		end

		if not LeanTween.isTweening(go(arg_7_0.stopRecBtn)) then
			LeanTween.moveX(arg_7_0.stopRecBtn, arg_7_0.stopRecBtn.rect.width, 0.15):setOnComplete(System.Action(function()
				setActive(arg_7_0.stopRecBtn, false)
				seriesAsync({
					function(arg_28_0)
						arg_7_0.ysScreenRecorder:StopRecord(var_24_0)

						if PLATFORM == PLATFORM_ANDROID then
							pg.MsgboxMgr.GetInstance():ShowMsgBox({
								content = i18n("word_save_video"),
								onNo = function()
									arg_7_0.ysScreenRecorder:DiscardVideo()
								end,
								onYes = function()
									local var_30_0 = arg_7_0.ysScreenRecorder:GetVideoFilePath()

									MediaSaver.SaveVideoWithPath(var_30_0)
								end
							})
						end

						var_24_1(true)
						var_0_0.SetMute(false)

						local var_28_0 = arg_7_0.room:GetCameraZones()[arg_7_0.zoneIndex]
						local var_28_1 = Dorm3dCameraAnim.New({
							configId = arg_7_0.animID
						})

						pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCamera(arg_7_0.scene.apartment:GetConfigID(), 2, arg_7_0.room:GetConfigID(), Dorm3dTrackCommand.BuildCameraMsg(var_28_0:GetName(), var_28_1:GetStateName(), arg_7_0.cameraSettings.depthOfField.focusDistance.value, arg_7_0.cameraSettings.depthOfField.blurRadius.value, arg_7_0.cameraSettings.postExposure.value, arg_7_0.cameraSettings.contrast.value, arg_7_0.cameraSettings.saturate.value)))
					end
				})
			end))
		end
	end)
	setActive(arg_7_0.stopRecBtn, false)
	onButton(arg_7_0, arg_7_0._tf:Find("RightTop/Film/Switch"), function()
		GetOrAddComponent(arg_7_0._tf:Find("RightTop/Film"), typeof(CanvasGroup)).blocksRaycasts = false

		quickPlayAnimation(arg_7_0._tf:Find("RightTop"), "anim_dorm3d_photo_FtoS")
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0._tf:Find("RightTop/Shot/Shot"), function()
		local function var_32_0(arg_33_0)
			setActive(arg_7_0.centerPanel, arg_33_0)
			setActive(arg_7_0._tf:Find("RightTop"), arg_33_0)

			if PlayerPrefs.GetInt(SHOW_TOUCH_EFFECT, 1) > 0 then
				setActive(pg.UIMgr.GetInstance().OverlayEffect, arg_33_0)
			end
		end

		local function var_32_1(arg_34_0)
			warning("截图结果：" .. tostring(arg_34_0))
		end

		local function var_32_2(arg_35_0, arg_35_1)
			arg_7_0:emit(Dorm3dPhotoMediator.SHARE_PANEL, arg_35_1, arg_35_0)

			if PLATFORM_CODE == PLATFORM_JP and pg.SdkMgr.GetInstance():GetChannelUID() == "2" then
				print("start photo : play sound")
				NotificationMgr.Inst:PlayShutterSound()
			end

			local var_35_0 = arg_7_0.room:GetCameraZones()[arg_7_0.zoneIndex]
			local var_35_1 = Dorm3dCameraAnim.New({
				configId = arg_7_0.animID
			})

			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCamera(arg_7_0.scene.apartment:GetConfigID(), 1, arg_7_0.room:GetConfigID(), Dorm3dTrackCommand.BuildCameraMsg(var_35_0:GetName(), var_35_1:GetStateName(), arg_7_0.cameraSettings.depthOfField.focusDistance.value, arg_7_0.cameraSettings.depthOfField.blurRadius.value, arg_7_0.cameraSettings.postExposure.value, arg_7_0.cameraSettings.contrast.value, arg_7_0.cameraSettings.saturate.value)))
		end

		local var_32_3 = ScreenShooter.New(Screen.width, Screen.height, TextureFormat.ARGB32):TakePhoto(arg_7_0.mainCamera)
		local var_32_4 = Tex2DExtension.EncodeToJPG(var_32_3)

		var_32_1(true)
		var_32_2(var_32_4, var_32_3)
	end, "ui-dorm_photograph")

	GetOrAddComponent(arg_7_0._tf:Find("RightTop/Film"), typeof(CanvasGroup)).blocksRaycasts = false

	onButton(arg_7_0, arg_7_0._tf:Find("RightTop/Shot/Switch"), function()
		GetOrAddComponent(arg_7_0._tf:Find("RightTop/Film"), typeof(CanvasGroup)).blocksRaycasts = true

		quickPlayAnimation(arg_7_0._tf:Find("RightTop"), "anim_dorm3d_photo_StoF")
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.btnAnimSpeed, function()
		setActive(arg_7_0.listAnimSpeed, not isActive(arg_7_0.listAnimSpeed))
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.btnZone, function()
		local var_38_0 = isActive(arg_7_0.listZones)

		setActive(arg_7_0.listZones, not var_38_0)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.zoneMask, function()
		setActive(arg_7_0.listZones, false)
	end)
	onButton(arg_7_0, arg_7_0.btnAr, function()
		arg_7_0.ARchecker:StartCheck(function(arg_41_0)
			if PLATFORM == PLATFORM_WINDOWSEDITOR then
				arg_41_0 = -1
			end

			originalPrint("AR CODE: " .. arg_41_0)
			arg_7_0:emit(Dorm3dPhotoMediator.GO_AR, arg_41_0)
		end)
	end)
	onButton(arg_7_0, arg_7_0.btnMove, function()
		arg_7_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SwitchPhotoCamera")

		arg_7_0.freeMode = not arg_7_0.freeMode

		setActive(var_7_0, arg_7_0.freeMode)
		setActive(var_7_1, arg_7_0.freeMode)
		setActive(arg_7_0.btnMove:Find("Selected"), arg_7_0.freeMode)
	end)
	onButton(arg_7_0, arg_7_0.btnMenuSmall, function()
		setActive(arg_7_0.btnMenuSmall, false)
		setActive(arg_7_0.btnMenu, true)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.btnMenu:Find("Collapse"), function()
		setActive(arg_7_0.btnMenu, false)
		setActive(arg_7_0.btnMenuSmall, true)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.btnMenu, function()
		setActive(arg_7_0.skinSelectPanel, true)
		arg_7_0:UpdateSkinList()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.skinSelectPanel:Find("BG/Close"), function()
		setActive(arg_7_0.skinSelectPanel, false)
	end, SFX_PANEL)

	arg_7_0.activePanel = 1

	local var_7_2 = {
		{
			btn = arg_7_0.btnAction,
			On = function()
				arg_7_0:UpdateActionPanel()
			end,
			Off = function()
				return
			end
		},
		{
			btn = arg_7_0.btnCamera,
			On = function()
				arg_7_0:UpdateCameraPanel()
			end,
			Off = function()
				return
			end
		},
		{
			btn = arg_7_0.btnLighting,
			On = function()
				arg_7_0:UpdateLightingPanel()
			end,
			Off = function()
				return
			end
		}
	}

	table.Ipairs(var_7_2, function(arg_53_0, arg_53_1)
		onToggle(arg_7_0, arg_53_1.btn, function(arg_54_0)
			if not arg_54_0 then
				return
			end

			table.Ipairs(var_7_2, function(arg_55_0, arg_55_1)
				if arg_55_0 == arg_53_0 then
					return
				end

				arg_55_1.Off()
			end)

			arg_7_0.activePanel = arg_53_0

			arg_53_1.On()
		end, SFX_PANEL)
	end)
	;(function()
		local var_56_0 = {
			arg_7_0.panelAction:Find("Layout/Title/Regular"),
			arg_7_0.panelAction:Find("Layout/Title/Special")
		}

		triggerToggle(var_56_0[1], true)
	end)()
	;(function()
		local var_57_0 = {
			arg_7_0.panelLightning:Find("Layout/Title/Filter")
		}

		triggerToggle(var_57_0[1], true)
	end)()

	arg_7_0.zoneIndex = 1

	arg_7_0:InitData()
	arg_7_0:FirstEnterZone()
	triggerToggle(var_7_2[arg_7_0.activePanel].btn, true)
	arg_7_0:UpdateZoneList()
end

function var_0_0.InitData(arg_58_0)
	arg_58_0.cameraSettings = Clone(arg_58_0.scene:GetCameraSettings())
	arg_58_0.settingHideCharacter = false
	arg_58_0.settingFaceCamera = true
	arg_58_0.settingFilterIndex = nil
	arg_58_0.settingFilterStrength = 1

	arg_58_0:RefreshData()
end

function var_0_0.RefreshData(arg_59_0)
	local var_59_0 = arg_59_0.room:GetCameraZones()[arg_59_0.zoneIndex]

	arg_59_0.animID = var_59_0:GetRegularAnimsByShipId(arg_59_0.groupId)[1]:GetConfigID()

	local function var_59_1(arg_60_0, arg_60_1)
		arg_60_0.min = arg_60_1[1]
		arg_60_0.max = arg_60_1[2]
		arg_60_0.value = math.clamp(arg_60_0.value, arg_60_1[1], arg_60_1[2])
	end

	var_59_1(arg_59_0.cameraSettings.depthOfField.focusDistance, var_59_0:GetFocusDistanceRange())
	var_59_1(arg_59_0.cameraSettings.depthOfField.blurRadius, var_59_0:GetDepthOfFieldBlurRange())
	var_59_1(arg_59_0.cameraSettings.postExposure, var_59_0:GetExposureRange())
	var_59_1(arg_59_0.cameraSettings.contrast, var_59_0:GetContrastRange())
	var_59_1(arg_59_0.cameraSettings.saturate, var_59_0:GetSaturationRange())

	arg_59_0.animSpeeds = var_59_0:GetAnimSpeeds()
	arg_59_0.animSpeed = 1
end

function var_0_0.FirstEnterZone(arg_61_0)
	local var_61_0 = arg_61_0.room:GetCameraZones()[arg_61_0.zoneIndex]
	local var_61_1 = Dorm3dCameraAnim.New({
		configId = arg_61_0.animID
	})

	arg_61_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "EnterPhotoMode", var_61_0, var_61_1:GetStateName())
	arg_61_0:UpdateAnimSpeedPanel()
end

function var_0_0.SwitchZone(arg_62_0)
	local var_62_0 = arg_62_0.room:GetCameraZones()[arg_62_0.zoneIndex]
	local var_62_1 = Dorm3dCameraAnim.New({
		configId = arg_62_0.animID
	})

	arg_62_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SwitchCameraZone", var_62_0, var_62_1:GetStateName())

	if arg_62_0.timerAnim then
		arg_62_0.timerAnim:Stop()

		arg_62_0.timerAnim = nil
	end

	arg_62_0.animPlaying = nil

	arg_62_0:UpdateActionPanel()
	arg_62_0:UpdateCameraPanel()
	arg_62_0:UpdateLightingPanel()
	arg_62_0:UpdateAnimSpeedPanel()
	arg_62_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetCharacterAnimSpeed", arg_62_0.animSpeed)
end

function var_0_0.UpdateZoneList(arg_63_0)
	local var_63_0 = arg_63_0.room:GetCameraZones()

	local function var_63_1()
		setText(arg_63_0.btnZone:Find("Text"), var_63_0[arg_63_0.zoneIndex]:GetName())
		UIItemList.StaticAlign(arg_63_0.listZones:Find("List"), arg_63_0.listZones:Find("List"):GetChild(0), #var_63_0, function(arg_65_0, arg_65_1, arg_65_2)
			if arg_65_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_65_1 = arg_65_1 + 1

			local var_65_0 = var_63_0[arg_65_1]

			setText(arg_65_2:Find("Name"), var_65_0:GetName())

			local var_65_1 = arg_63_0.zoneIndex == arg_65_1 and Color.NewHex("5CCAFF") or Color.NewHex("FFFFFF99")

			setTextColor(arg_65_2:Find("Name"), var_65_1)
			setActive(arg_65_2:Find("Line"), arg_65_1 < #var_63_0)
		end)
	end

	var_63_1()
	UIItemList.StaticAlign(arg_63_0.listZones:Find("List"), arg_63_0.listZones:Find("List"):GetChild(0), #var_63_0, function(arg_66_0, arg_66_1, arg_66_2)
		if arg_66_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_66_1 = arg_66_1 + 1

		onButton(arg_63_0, arg_66_2, function()
			if arg_63_0.zoneIndex == arg_66_1 then
				return
			end

			arg_63_0.zoneIndex = arg_66_1

			arg_63_0:RefreshData()
			arg_63_0:SwitchZone()
			setActive(arg_63_0.listZones, false)
			var_63_1()
		end, SFX_PANEL)
	end)
end

local var_0_2 = 0.2

function var_0_0.UpdateActionPanel(arg_68_0)
	if not arg_68_0.activeSetting then
		return
	end

	if arg_68_0.activePanel ~= var_0_0.PANEL.ACTION then
		return
	end

	local var_68_0 = arg_68_0.room:GetCameraZones()[arg_68_0.zoneIndex]
	local var_68_1 = var_68_0:GetRegularAnimsByShipId(arg_68_0.groupId)
	local var_68_2 = arg_68_0.panelAction:Find("Layout/Regular/Scroll/Viewport/Content")
	local var_68_3 = var_68_0:GetAllSpecialList(arg_68_0.room.id)
	local var_68_4 = arg_68_0.panelAction:Find("Layout/Special/Scroll/Viewport/Content")
	local var_68_5 = #var_68_3 > 0

	setActive(arg_68_0.panelAction:Find("Layout/Title/Special"), var_68_5)

	local function var_68_6()
		UIItemList.StaticAlign(var_68_2, var_68_2:GetChild(0), #var_68_1, function(arg_70_0, arg_70_1, arg_70_2)
			if arg_70_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_70_1 = arg_70_1 + 1

			local var_70_0 = var_68_1[arg_70_1]

			setActive(arg_70_2:Find("Selected"), var_70_0:GetConfigID() == arg_68_0.animID)
			setActive(arg_70_2:Find("Slider"), var_70_0:GetConfigID() == arg_68_0.animID and tobool(arg_68_0.timerAnim))
		end)
		UIItemList.StaticAlign(var_68_4, var_68_4:GetChild(0), #var_68_3, function(arg_71_0, arg_71_1, arg_71_2)
			if arg_71_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_71_1 = arg_71_1 + 1

			local var_71_0 = var_68_3[arg_71_1].anims
			local var_71_1 = arg_71_2:Find("Actions")

			UIItemList.StaticAlign(var_71_1, var_71_1:GetChild(0), #var_71_0, function(arg_72_0, arg_72_1, arg_72_2)
				if arg_72_0 ~= UIItemList.EventUpdate then
					return
				end

				arg_72_1 = arg_72_1 + 1

				local var_72_0 = var_71_0[arg_72_1]

				setActive(arg_72_2:Find("Selected"), var_72_0:GetConfigID() == arg_68_0.animID)
				setActive(arg_72_2:Find("Slider"), var_72_0:GetConfigID() == arg_68_0.animID and tobool(arg_68_0.timerAnim))
			end)
		end)
	end

	local function var_68_7(arg_73_0, arg_73_1)
		if arg_68_0.animPlaying then
			return
		end

		local var_73_0 = arg_73_0:GetConfigID()

		if arg_68_0.animID == var_73_0 then
			return
		end

		local var_73_1 = arg_68_0:GetAnimPlayList(var_73_0)
		local var_73_2 = Dorm3dCameraAnim.New({
			configId = arg_68_0.animID
		}):GetFinishAnimID()

		arg_68_0.animID = var_73_0

		var_68_6()
		arg_68_0:BlockActionPanel(true)

		arg_68_0.animPlaying = true

		local var_73_3 = (table.indexof(var_73_1, _.detect(var_73_1, function(arg_74_0)
			return arg_74_0:GetConfigID() == var_73_2
		end)) or 0) + 1
		local var_73_4 = _.rest(var_73_1, var_73_3)
		local var_73_5 = arg_73_1:Find("Slider"):GetComponent(typeof(Slider))

		setActive(arg_73_1:Find("Slider"), true)

		local function var_73_6()
			setActive(arg_73_1:Find("Selected"), true)
			setActive(arg_73_1:Find("Slider"), false)
			arg_68_0:BlockActionPanel(false)

			arg_68_0.animPlaying = nil
		end

		if #var_73_4 == 0 then
			var_73_6()

			return
		end

		local var_73_7 = _.reduce(var_73_4, 0, function(arg_76_0, arg_76_1)
			return arg_76_0 + math.max(var_0_2, arg_76_1:GetAnimTime())
		end)

		if arg_68_0.timerAnim then
			arg_68_0.timerAnim:Stop()
		end

		arg_68_0.animInfo = {
			index = 1,
			passedTime = 0,
			ratio = 0,
			animPlayList = var_73_4,
			totalTime = var_73_7,
			startStamp = Time.time
		}
		arg_68_0.timerAnim = FrameTimer.New(function()
			local var_77_0 = arg_68_0.animInfo
			local var_77_1 = var_77_0.animPlayList[var_77_0.index]
			local var_77_2 = math.max(var_0_2, var_77_1:GetAnimTime())
			local var_77_3 = var_77_0.startStamp
			local var_77_4 = Time.time
			local var_77_5 = math.min(1, var_77_0.ratio + (var_77_4 - var_77_3) * arg_68_0.animSpeed / var_77_2)
			local var_77_6 = var_77_0.passedTime + var_77_2 * var_77_5

			var_73_5.value = var_77_6 / var_73_7

			if var_77_5 < 1 then
				return
			end

			var_77_0.index = var_77_0.index + 1
			var_77_0.ratio = 0
			var_77_0.passedTime = var_77_0.passedTime + var_77_2
			var_77_0.startStamp = var_77_4

			local var_77_7 = var_77_1:GetStartPoint()

			if #var_77_7 > 0 then
				arg_68_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetCurrentCharPoint", var_77_7)
			end

			arg_68_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SyncCurrentInterestTransform")

			if var_77_0.index > #var_77_0.animPlayList then
				var_73_6()
				arg_68_0.timerAnim:Stop()

				arg_68_0.timerAnim = nil
				arg_68_0.animInfo = nil

				return
			end

			local var_77_8 = var_77_0.animPlayList[var_77_0.index]

			arg_68_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "PlayCurrentSingleAction", var_77_8:GetStateName())
		end, 1, -1)

		local var_73_8 = arg_68_0.animInfo.animPlayList[1]

		if var_73_3 == 1 then
			arg_68_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SwitchCurrentAnim", var_73_8:GetStateName())
			onNextTick(function()
				local var_78_0 = var_73_8:GetStartPoint()

				if #var_78_0 == 0 then
					var_78_0 = var_68_0:GetWatchCameraName()
				end

				arg_68_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetCurrentCharPoint", var_78_0)
				arg_68_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SyncCurrentInterestTransform")

				if arg_68_0.freeMode then
					local var_78_1 = arg_68_0.scene.cameras[arg_68_0.scene.CAMERA.PHOTO_FREE]
					local var_78_2 = var_78_1:GetComponent(typeof(UnityEngine.CharacterController))
					local var_78_3 = var_78_1.transform.forward

					var_78_3.y = 0

					var_78_3:Normalize()

					local var_78_4 = var_78_3 * -0.01

					var_78_2:Move(var_78_4)
					var_78_2:Move(-var_78_4)
				end
			end)
		else
			arg_68_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "PlayCurrentSingleAction", var_73_8:GetStateName())
		end

		arg_68_0.timerAnim:Start()
	end

	UIItemList.StaticAlign(var_68_2, var_68_2:GetChild(0), #var_68_1, function(arg_79_0, arg_79_1, arg_79_2)
		if arg_79_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_79_1 = arg_79_1 + 1

		local var_79_0 = var_68_1[arg_79_1]

		setText(arg_79_2:Find("Name"), var_79_0:GetName())
		GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_79_0:GetZoneIcon()), "", arg_79_2:Find("Icon"))
		setActive(arg_79_2:Find("Slider"), false)
		setActive(arg_79_2:Find("Selected"), false)
		onButton(arg_68_0, arg_79_2, function()
			var_68_7(var_79_0, arg_79_2)
		end)
	end)

	local function var_68_8()
		UIItemList.StaticAlign(var_68_4, var_68_4:GetChild(0), #var_68_3, function(arg_82_0, arg_82_1, arg_82_2)
			if arg_82_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_82_1 = arg_82_1 + 1

			local var_82_0 = var_68_3[arg_82_1].anims
			local var_82_1 = arg_82_2:Find("Actions")

			UIItemList.StaticAlign(var_82_1, var_82_1:GetChild(0), #var_82_0, function(arg_83_0, arg_83_1, arg_83_2)
				if arg_83_0 ~= UIItemList.EventUpdate then
					return
				end

				arg_83_1 = arg_83_1 + 1

				local var_83_0 = var_82_0[arg_83_1]

				setActive(arg_83_2:Find("Selected"), var_83_0:GetConfigID() == arg_68_0.animID)
				setActive(arg_83_2:Find("Slider"), var_83_0:GetConfigID() == arg_68_0.animID and tobool(arg_68_0.timerAnim))
			end)
		end)
	end

	local function var_68_9()
		UIItemList.StaticAlign(var_68_4, var_68_4:GetChild(0), #var_68_3, function(arg_85_0, arg_85_1, arg_85_2)
			if arg_85_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_85_1 = arg_85_1 + 1

			setActive(arg_85_2:Find("Button/Active"), arg_68_0.settingSpecialFurnitureIndex == arg_85_1)
			setActive(arg_85_2:Find("Actions"), arg_68_0.settingSpecialFurnitureIndex == arg_85_1)
		end)
		var_68_8()
	end

	local var_68_10 = arg_68_0.room:GetCameraZones()[arg_68_0.zoneIndex]

	local function var_68_11(arg_86_0, arg_86_1)
		local var_86_0 = arg_86_1:Find("Actions")
		local var_86_1 = arg_86_0.anims

		UIItemList.StaticAlign(var_86_0, var_86_0:GetChild(0), #var_86_1, function(arg_87_0, arg_87_1, arg_87_2)
			if arg_87_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_87_1 = arg_87_1 + 1

			local var_87_0 = var_86_1[arg_87_1]
			local var_87_1 = var_68_10:CheckFurnitureIdInZone(arg_86_0.furnitureId)
			local var_87_2 = arg_68_0.room:IsFurnitureSetIn(arg_86_0.furnitureId)
			local var_87_3 = var_87_1 and var_87_2

			SetActive(arg_87_2:Find("Other"), not var_87_3)
			SetActive(arg_87_2:Find("Name"), var_87_3)

			if var_87_3 then
				onButton(arg_68_0, arg_87_2, function()
					arg_68_0.room:ReplaceFurniture(arg_86_0.slotId, arg_86_0.furnitureId)
					arg_68_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RefreshSlots", arg_68_0.room)
					var_68_7(var_87_0, arg_87_2)
				end)
				setText(arg_87_2:Find("Name"), var_87_0:GetName())
			else
				removeOnButton(arg_87_2)

				if not var_87_1 then
					local var_87_4 = var_87_0:GetZoneName()

					warnText = i18n("dorm3d_photo_active_zone", var_87_4)
				else
					warnText = i18n("dorm3d_furniture_replace_tip")
				end

				setText(arg_87_2:Find("Other/Content"), warnText)
			end

			GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_87_0:GetZoneIcon()), "", arg_87_2:Find("Icon"))
			setActive(arg_87_2:Find("Slider"), false)
			setActive(arg_87_2:Find("Selected"), false)
		end)
	end

	setActive(var_68_4, #var_68_3 > 0)
	UIItemList.StaticAlign(var_68_4, var_68_4:GetChild(0), #var_68_3, function(arg_89_0, arg_89_1, arg_89_2)
		if arg_89_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_89_1 = arg_89_1 + 1

		local var_89_0 = var_68_3[arg_89_1]
		local var_89_1 = Dorm3dFurniture.New({
			configId = var_89_0.furnitureId
		})
		local var_89_2 = tobool(_.detect(arg_68_0.room:GetFurnitures(), function(arg_90_0)
			return arg_90_0:GetConfigID() == var_89_0.furnitureId
		end))

		setText(arg_89_2:Find("Button/Name"), var_89_1:GetName())
		GetImageSpriteFromAtlasAsync(var_89_1:GetIcon(), "", arg_89_2:Find("Button/Icon"))
		setActive(arg_89_2:Find("Button/Lock"), not var_89_2)
		setActive(arg_89_2:Find("Button/BG"), var_89_2)

		local var_89_3 = var_68_10:CheckFurnitureIdInZone(var_89_0.furnitureId)
		local var_89_4

		if var_89_3 then
			var_89_4 = Color.New(1, 1, 1, 0.8509803921568627)
		else
			var_89_4 = Color.New(0.788235294117647, 0.788235294117647, 0.788235294117647, 0.8509803921568627)
		end

		setImageColor(arg_89_2:Find("Button/BG"), var_89_4)
		onButton(arg_68_0, arg_89_2:Find("Button"), function()
			if not var_89_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_furniture_locked"))

				return
			end

			if arg_68_0.settingSpecialFurnitureIndex == arg_89_1 then
				arg_68_0.settingSpecialFurnitureIndex = nil
			else
				arg_68_0.settingSpecialFurnitureIndex = arg_89_1
			end

			var_68_11(var_89_0, arg_89_2, arg_89_1)
			var_68_9()
		end)
	end)
	var_68_9()
	var_68_6()
end

function var_0_0.BlockActionPanel(arg_92_0, arg_92_1)
	return
end

function var_0_0.GetAnimPlayList(arg_93_0, arg_93_1)
	local var_93_0 = arg_93_1
	local var_93_1 = {}
	local var_93_2 = 10

	while true do
		local var_93_3 = Dorm3dCameraAnim.New({
			configId = var_93_0
		})

		if not var_93_3 then
			return var_93_1
		end

		table.insert(var_93_1, 1, var_93_3)

		var_93_0 = var_93_3:GetPreAnimID()

		if var_93_0 == 0 then
			return var_93_1
		end

		var_93_2 = var_93_2 - 1

		assert(var_93_2 > 0)
	end
end

function var_0_0.UpdateCameraPanel(arg_94_0)
	if not arg_94_0.activeSetting then
		return
	end

	if arg_94_0.activePanel ~= var_0_0.PANEL.CAMERA then
		return
	end

	;(function()
		local var_95_0 = arg_94_0.panelCamera:Find("Layout/DepthOfField/Switch/Toggle")

		triggerToggle(var_95_0, arg_94_0.cameraSettings.depthOfField.enabled)
		onToggle(arg_94_0, var_95_0, function(arg_96_0)
			arg_94_0.cameraSettings.depthOfField.enabled = arg_96_0

			setActive(arg_94_0.panelCamera:Find("Layout/DepthOfField/DepthOfField"), arg_94_0.cameraSettings.depthOfField.enabled)
			arg_94_0:RefreshCamera()
		end, SFX_UI_TAG, SFX_UI_CANCEL)
	end)()
	setActive(arg_94_0.panelCamera:Find("Layout/DepthOfField/DepthOfField"), arg_94_0.cameraSettings.depthOfField.enabled)
	;(function()
		local var_97_0 = arg_94_0.cameraSettings.depthOfField.focusDistance
		local var_97_1 = arg_94_0.panelCamera:Find("Layout/DepthOfField/DepthOfField/FocusDistance/Slider")

		setSlider(var_97_1, var_97_0.min, var_97_0.max, var_97_0.value)
		onSlider(arg_94_0, var_97_1, function(arg_98_0)
			var_97_0.value = arg_98_0

			arg_94_0:RefreshCamera()
		end)
	end)()
	;(function()
		local var_99_0 = arg_94_0.cameraSettings.depthOfField.blurRadius
		local var_99_1 = arg_94_0.panelCamera:Find("Layout/DepthOfField/DepthOfField/BlurRadius/Slider")

		setSlider(var_99_1, var_99_0.min, var_99_0.max, var_99_0.value)
		onSlider(arg_94_0, var_99_1, function(arg_100_0)
			var_99_0.value = arg_100_0

			arg_94_0:RefreshCamera()
		end)
	end)()

	local var_94_0 = {
		"PostExposure",
		"Saturation",
		"Contrast"
	}

	arg_94_0.paramIndex = arg_94_0.paramIndex or 1

	local function var_94_1()
		table.Ipairs(var_94_0, function(arg_102_0, arg_102_1)
			local var_102_0 = arg_94_0.panelCamera:Find("Layout/Paramaters/Icons"):GetChild(arg_102_0 - 1)

			setActive(var_102_0:Find("Selected"), arg_102_0 == arg_94_0.paramIndex)
			setActive(arg_94_0.panelCamera:Find("Layout/Paramaters/" .. arg_102_1), arg_102_0 == arg_94_0.paramIndex)
		end)
	end

	table.Ipairs(var_94_0, function(arg_103_0, arg_103_1)
		local var_103_0 = arg_94_0.panelCamera:Find("Layout/Paramaters/Icons"):GetChild(arg_103_0 - 1)

		onButton(arg_94_0, var_103_0, function()
			arg_94_0.paramIndex = arg_103_0

			var_94_1()
		end, SFX_PANEL)
	end)
	var_94_1()
	;(function()
		local var_105_0 = arg_94_0.cameraSettings.postExposure
		local var_105_1 = arg_94_0.panelCamera:Find("Layout/Paramaters/PostExposure/PostExposure/Slider")
		local var_105_2 = var_105_1:Find("Background/Fill")

		onSlider(arg_94_0, var_105_1, function(arg_106_0)
			var_105_0.value = arg_106_0

			local var_106_0 = (arg_106_0 - var_105_0.min) / (var_105_0.max - var_105_0.min)
			local var_106_1 = math.min(var_106_0, 0.5)
			local var_106_2 = math.max(var_106_0, 0.5)

			var_105_2.anchorMin = Vector2.New(var_106_1, 0)
			var_105_2.anchorMax = Vector2.New(var_106_2, 1)
			var_105_2.offsetMin = Vector2.zero
			var_105_2.offsetMax = Vector2.zero

			arg_94_0:RefreshCamera()
		end)
		setSlider(var_105_1, var_105_0.min, var_105_0.max, var_105_0.value)
	end)()
	;(function()
		local var_107_0 = arg_94_0.cameraSettings.contrast
		local var_107_1 = arg_94_0.panelCamera:Find("Layout/Paramaters/Contrast/Contrast/Slider")
		local var_107_2 = var_107_1:Find("Background/Fill")

		onSlider(arg_94_0, var_107_1, function(arg_108_0)
			var_107_0.value = arg_108_0

			local var_108_0 = (arg_108_0 - var_107_0.min) / (var_107_0.max - var_107_0.min)
			local var_108_1 = math.min(var_108_0, 0.5)
			local var_108_2 = math.max(var_108_0, 0.5)

			var_107_2.anchorMin = Vector2.New(var_108_1, 0)
			var_107_2.anchorMax = Vector2.New(var_108_2, 1)
			var_107_2.offsetMin = Vector2.zero
			var_107_2.offsetMax = Vector2.zero

			arg_94_0:RefreshCamera()
		end)
		setSlider(var_107_1, var_107_0.min, var_107_0.max, var_107_0.value)
	end)()
	;(function()
		local var_109_0 = arg_94_0.cameraSettings.saturate
		local var_109_1 = arg_94_0.panelCamera:Find("Layout/Paramaters/Saturation/Saturation/Slider")
		local var_109_2 = var_109_1:Find("Background/Fill")

		onSlider(arg_94_0, var_109_1, function(arg_110_0)
			var_109_0.value = arg_110_0

			local var_110_0 = (arg_110_0 - var_109_0.min) / (var_109_0.max - var_109_0.min)
			local var_110_1 = math.min(var_110_0, 0.5)
			local var_110_2 = math.max(var_110_0, 0.5)

			var_109_2.anchorMin = Vector2.New(var_110_1, 0)
			var_109_2.anchorMax = Vector2.New(var_110_2, 1)
			var_109_2.offsetMin = Vector2.zero
			var_109_2.offsetMax = Vector2.zero

			arg_94_0:RefreshCamera()
		end)
		setSlider(var_109_1, var_109_0.min, var_109_0.max, var_109_0.value)
	end)()
	;(function()
		local var_111_0 = arg_94_0.panelCamera:Find("Layout/Other/FaceCamera/Toggle")

		triggerToggle(var_111_0, arg_94_0.settingFaceCamera)
		onToggle(arg_94_0, var_111_0, function(arg_112_0)
			arg_94_0.settingFaceCamera = arg_112_0

			arg_94_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "EnableCurrentHeadIK", arg_112_0)
		end, SFX_UI_TAG, SFX_UI_CANCEL)
	end)()
	;(function()
		local var_113_0 = arg_94_0.panelCamera:Find("Layout/Other/HideCharacter/Toggle")

		triggerToggle(var_113_0, arg_94_0.settingHideCharacter)
		onToggle(arg_94_0, var_113_0, function(arg_114_0)
			arg_94_0.settingHideCharacter = arg_114_0

			if arg_114_0 then
				arg_94_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "HideCharacterBylayer")
			else
				arg_94_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCharacterBylayer")
			end
		end, SFX_UI_TAG, SFX_UI_CANCEL)
	end)()
end

function var_0_0.RefreshCamera(arg_115_0)
	arg_115_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SettingCamera", arg_115_0.cameraSettings)
end

function var_0_0.UpdateAnimSpeedPanel(arg_116_0)
	local function var_116_0()
		if not arg_116_0.timerAnim then
			return
		end

		local var_117_0 = arg_116_0.animInfo
		local var_117_1 = var_117_0.animPlayList[var_117_0.index]
		local var_117_2 = math.max(var_0_2, var_117_1:GetAnimTime())
		local var_117_3 = var_117_0.startStamp
		local var_117_4 = Time.time

		var_117_0.ratio = math.min(1, var_117_0.ratio + (var_117_4 - var_117_3) * arg_116_0.animSpeed / var_117_2)
		var_117_0.startStamp = var_117_4
	end

	local var_116_1 = arg_116_0.animSpeeds

	UIItemList.StaticAlign(arg_116_0.listAnimSpeed, arg_116_0.listAnimSpeed:GetChild(0), #var_116_1, function(arg_118_0, arg_118_1, arg_118_2)
		if arg_118_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_118_1 = #var_116_1 - arg_118_1

		local var_118_0 = var_116_1[arg_118_1]

		setText(arg_118_2:Find("Name"), var_118_0)
		setText(arg_118_2:Find("Selected"), var_118_0)
		setActive(arg_118_2:Find("Line"), arg_118_1 ~= #var_116_1)
		onButton(arg_116_0, arg_118_2, function()
			if arg_116_0.animSpeed == var_118_0 then
				return
			end

			var_116_0()

			arg_116_0.animSpeed = var_118_0

			arg_116_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetCharacterAnimSpeed", var_118_0)
			arg_116_0:UpdateAnimSpeedPanel()
		end, SFX_PANEL)
	end)
	onButton(arg_116_0, arg_116_0.btnFreeze, function()
		local var_120_0 = 0

		if arg_116_0.animSpeed ~= 0 then
			arg_116_0.lastAnimSpeed = arg_116_0.animSpeed
		else
			var_120_0 = arg_116_0.lastAnimSpeed or 1
			arg_116_0.lastAnimSpeed = nil
		end

		var_116_0()

		arg_116_0.animSpeed = var_120_0

		arg_116_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetCharacterAnimSpeed", var_120_0)
		arg_116_0:UpdateAnimSpeedPanel()
	end, SFX_PANEL)
	UIItemList.StaticAlign(arg_116_0.listAnimSpeed, arg_116_0.listAnimSpeed:GetChild(0), #var_116_1, function(arg_121_0, arg_121_1, arg_121_2)
		if arg_121_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_121_1 = #var_116_1 - arg_121_1

		local var_121_0 = var_116_1[arg_121_1]

		setActive(arg_121_2:Find("Name"), arg_116_0.animSpeed ~= var_121_0)
		setActive(arg_121_2:Find("Selected"), arg_116_0.animSpeed == var_121_0)
	end)
	setActive(arg_116_0.btnFreeze:Find("Icon"), arg_116_0.animSpeed ~= 0)
	setActive(arg_116_0.btnFreeze:Find("Selected"), arg_116_0.animSpeed == 0)
	setText(arg_116_0.textAnimSpeed, i18n("dorm3d_photo_animspeed", string.format("%.1f", arg_116_0.animSpeed)))
end

function var_0_0.UpdateLightingPanel(arg_122_0)
	if not arg_122_0.activeSetting then
		return
	end

	if arg_122_0.activePanel ~= var_0_0.PANEL.LIGHTING then
		return
	end

	local var_122_0 = {}

	for iter_122_0, iter_122_1 in ipairs(pg.dorm3d_camera_volume_template.all) do
		table.insert(var_122_0, iter_122_1)
	end

	table.sort(var_122_0, function(arg_123_0, arg_123_1)
		return arg_123_0 < arg_123_1
	end)

	local function var_122_1()
		if not arg_122_0.settingFilterIndex then
			arg_122_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertVolumeProfile")

			return
		end

		local var_124_0 = pg.dorm3d_camera_volume_template[var_122_0[arg_122_0.settingFilterIndex]]

		arg_122_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetVolumeProfile", var_124_0.volume, arg_122_0.settingFilterStrength)
	end

	UIItemList.StaticAlign(arg_122_0.panelLightning:Find("Layout/Filter/List"), arg_122_0.panelLightning:Find("Layout/Filter/List"):GetChild(0), #var_122_0, function(arg_125_0, arg_125_1, arg_125_2)
		if arg_125_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_125_1 = arg_125_1 + 1

		local var_125_0 = pg.dorm3d_camera_volume_template[var_122_0[arg_125_1]]

		setText(arg_125_2:Find("Name"), var_125_0.name)

		var_125_0.icon = ""

		if var_125_0.icon ~= "" then
			GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_125_0.icon), "", arg_125_2:Find("BG"))
		end

		if arg_122_0.settingFilterIndex == arg_125_1 then
			setActive(arg_125_2:Find("Selected"), true)
		else
			setActive(arg_125_2:Find("Selected"), false)
		end

		local var_125_1, var_125_2 = ApartmentProxy.CheckUnlockConfig(var_125_0.unlock)

		setActive(arg_125_2:Find("lock"), not var_125_1)

		if not var_125_1 then
			setText(arg_125_2:Find("lock/Image/Text"), var_125_0.unlock_text)
		end

		onButton(arg_122_0, arg_125_2, function()
			if not var_125_1 then
				pg.TipsMgr.GetInstance():ShowTips(var_125_2)

				return
			end

			local var_126_0 = arg_122_0.settingFilterIndex

			if arg_122_0.settingFilterIndex ~= arg_125_1 then
				arg_122_0.settingFilterIndex = arg_125_1
			else
				arg_122_0.settingFilterIndex = nil
			end

			var_122_1()

			if var_126_0 then
				local var_126_1 = arg_122_0.panelLightning:Find("Layout/Filter/List"):GetChild(var_126_0 - 1)

				setActive(var_126_1:Find("Selected"), false)
			end

			if arg_122_0.settingFilterIndex == arg_125_1 then
				setActive(arg_125_2:Find("Selected"), true)
			end
		end, SFX_PANEL)
	end)
	setActive(arg_122_0.panelLightning:Find("Layout/Filter/Slider"), false)
end

function var_0_0.UpdateSkinList(arg_127_0)
	local var_127_0 = arg_127_0.scene.apartment:GetConfigID()
	local var_127_1 = arg_127_0.scene.ladyDict[var_127_0]
	local var_127_2 = var_127_1.skinIdList
	local var_127_3 = var_127_1.skinId
	local var_127_4 = {}
	local var_127_5 = {}

	_.each(var_127_2, function(arg_128_0)
		if ApartmentProxy.CheckUnlockConfig(pg.dorm3d_resource[arg_128_0].unlock) then
			table.insert(var_127_4, arg_128_0)
		else
			table.insert(var_127_5, arg_128_0)
		end
	end)

	local function var_127_6(arg_129_0, arg_129_1)
		local var_129_0 = arg_129_1 and var_127_4 or var_127_5

		UIItemList.StaticAlign(arg_129_0, arg_129_0:GetChild(0), #var_129_0, function(arg_130_0, arg_130_1, arg_130_2)
			if arg_130_0 ~= UIItemList.EventUpdate then
				return
			end

			local var_130_0 = var_129_0[arg_130_1 + 1]

			setActive(arg_130_2:Find("Selected"), var_130_0 == var_127_3)
			setActive(arg_130_2:Find("Lock"), not arg_129_1)

			if not arg_129_1 then
				setText(arg_130_2:Find("Lock/Bar/Text"), pg.dorm3d_resource[var_130_0].unlock_text)
			end

			arg_127_0.loader:GetSpriteQuiet(string.format("dorm3dselect/apartment_skin_%d", var_130_0), "", arg_130_2:Find("Icon"))
			onButton(arg_127_0, arg_130_2, function()
				if not arg_129_1 then
					local var_131_0, var_131_1 = ApartmentProxy.CheckUnlockConfig(pg.dorm3d_resource[var_130_0].unlock)

					pg.TipsMgr.GetInstance():ShowTips(var_131_1)

					return
				end

				if var_130_0 == var_127_3 then
					return
				end

				local var_131_2 = var_130_0

				seriesAsync({
					function(arg_132_0)
						if arg_127_0.settingHideCharacter then
							arg_127_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCharacterBylayer")
						end

						arg_127_0.scene:SwitchCharacterSkin(var_127_1, var_127_0, var_131_2, arg_132_0)
					end,
					function(arg_133_0)
						setActive(var_127_1.ladySafeCollider, true)

						if not arg_127_0.animInfo then
							return arg_133_0()
						end

						local var_133_0 = arg_127_0.animInfo

						for iter_133_0 = #var_133_0.animPlayList, 1, -1 do
							local var_133_1 = var_133_0.animPlayList[iter_133_0]:GetStartPoint()

							if #var_133_1 > 0 then
								arg_127_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetCharPoint", var_133_1)

								break
							end

							if iter_133_0 == 1 then
								local var_133_2 = arg_127_0.room:GetCameraZones()[arg_127_0.zoneIndex]

								arg_127_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetCharPoint", var_133_2:GetWatchCameraName())
							end
						end

						arg_127_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SyncCurrentInterestTransform")

						local var_133_3 = var_133_0.animPlayList[#var_133_0.animPlayList]
						local var_133_4 = var_133_3:GetAnimTime()

						arg_127_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "PlayCurrentSingleAction", var_133_3:GetStateName())
						arg_127_0.scene.ladyDict[var_127_0].ladyAnimator:Update(var_133_4)
						arg_127_0.timerAnim:Stop()

						arg_127_0.timerAnim = nil
						arg_127_0.animInfo = nil
						arg_127_0.animPlaying = nil

						arg_133_0()
					end,
					function()
						arg_127_0:UpdateActionPanel()

						if arg_127_0.settingHideCharacter then
							arg_127_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "HideCharacterBylayer")
						end

						arg_127_0:UpdateSkinList()
					end
				})
			end, SFX_PANEL)
		end)
	end

	var_127_6(arg_127_0.skinSelectPanel:Find("BG/Scroll/Content/Unlock/List"), true)
	var_127_6(arg_127_0.skinSelectPanel:Find("BG/Scroll/Content/Lock/List"), false)
end

function var_0_0.SetMute(arg_135_0)
	if arg_135_0 then
		CriAtom.SetCategoryVolume("Category_CV", 0)
		CriAtom.SetCategoryVolume("Category_BGM", 0)
		CriAtom.SetCategoryVolume("Category_SE", 0)
	else
		CriAtom.SetCategoryVolume("Category_CV", pg.CriMgr.GetInstance():getCVVolume())
		CriAtom.SetCategoryVolume("Category_BGM", pg.CriMgr.GetInstance():getBGMVolume())
		CriAtom.SetCategoryVolume("Category_SE", pg.CriMgr.GetInstance():getSEVolume())
	end
end

function var_0_0.willExit(arg_136_0)
	arg_136_0.loader:Clear()

	if arg_136_0.timerAnim then
		arg_136_0.timerAnim:Stop()

		arg_136_0.timerAnim = nil
	end

	local var_136_0 = arg_136_0.scene.apartment:GetConfigID()
	local var_136_1 = arg_136_0.scene.ladyDict[var_136_0]
	local var_136_2 = var_136_1.skinIdList

	if var_136_1.skinId ~= var_136_2[1] then
		arg_136_0.scene:SwitchCharacterSkin(var_136_1, var_136_0, var_136_2[1])
	end

	if arg_136_0.animSpeed ~= 1 then
		arg_136_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetCharacterAnimSpeed", 1)
	end

	if arg_136_0.settingHideCharacter then
		arg_136_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCharacterBylayer")
	end

	if not arg_136_0.settingFaceCamera then
		arg_136_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "EnableCurrentHeadIK", true)
	end

	arg_136_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCharacterLight")
	arg_136_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertVolumeProfile")
	arg_136_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCameraSettings")
	arg_136_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ExitPhotoMode")
end

function var_0_0.SetPhotoCameraSliderValue(arg_137_0, arg_137_1)
	local var_137_0 = arg_137_0.normalPanel:Find("Zoom/Slider")

	setSlider(var_137_0, 0, 1, arg_137_1)
end

function var_0_0.SetPhotoStickDelta(arg_138_0, arg_138_1)
	arg_138_1 = arg_138_1 * 0.5

	local var_138_0 = arg_138_0._tf:Find("Center/Stick")
	local var_138_1 = var_138_0.rect.height
	local var_138_2 = var_138_0.rect.width
	local var_138_3 = var_138_0:Find("Handler")

	setAnchoredPosition(var_138_3, Vector2.New(var_138_1 * arg_138_1.x, var_138_2 * arg_138_1.y))
end

return var_0_0
