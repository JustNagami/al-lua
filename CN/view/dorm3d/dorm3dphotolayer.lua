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

function var_0_0.onBackPressed(arg_5_0)
	if arg_5_0.recordState then
		triggerButton(arg_5_0.btnFilm)

		return
	end

	if arg_5_0.activeSetting then
		triggerButton(arg_5_0._tf:Find("Center/Settings/Back"))

		return
	end

	arg_5_0:closeView()
end

function var_0_0.didEnter(arg_6_0)
	onButton(arg_6_0, arg_6_0._tf:Find("Center/Normal/Back"), function()
		arg_6_0:onBackPressed()
	end, SFX_CANCEL)

	local var_6_0 = arg_6_0.normalPanel:Find("Zoom/Slider")

	setSlider(var_6_0, 0, 1, 0)
	onSlider(arg_6_0, var_6_0, function(arg_8_0)
		arg_6_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetPhotoCameraHeight", arg_8_0)
	end)
	setActive(var_6_0, false)

	arg_6_0.activeSetting = false

	onButton(arg_6_0, arg_6_0._tf:Find("Center/Normal/Settings"), function()
		arg_6_0.activeSetting = true

		quickPlayAnimation(arg_6_0._tf:Find("Center"), "anim_dorm3d_photo_normal_out")
		arg_6_0:UpdateActionPanel()
		arg_6_0:UpdateCameraPanel()
		arg_6_0:UpdateLightingPanel()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0._tf:Find("Center/Settings/Back"), function()
		arg_6_0.activeSetting = false

		quickPlayAnimation(arg_6_0._tf:Find("Center"), "anim_dorm3d_photo_normal_in")
	end, SFX_CANCEL)

	arg_6_0.hideUI = false

	onButton(arg_6_0, arg_6_0.btnHideUI, function()
		if arg_6_0.hideUI then
			return
		end

		setActive(arg_6_0.hideuiMask, true)
		setActive(arg_6_0.centerPanel, false)

		arg_6_0.hideUI = true
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.hideuiMask, function()
		if not arg_6_0.hideUI then
			return
		end

		setActive(arg_6_0.centerPanel, true)
		setActive(arg_6_0.hideuiMask, false)

		arg_6_0.hideUI = false
	end)
	onButton(arg_6_0, arg_6_0.btnReset, function()
		arg_6_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetPhotoCameraPosition")
	end, SFX_PANEL)

	arg_6_0.recordState = false

	onButton(arg_6_0, arg_6_0.btnFilm, function()
		local function var_14_0(arg_15_0)
			setActive(arg_6_0.centerPanel, arg_15_0)

			arg_6_0:findTF("RightTop"):GetComponent("CanvasGroup").alpha = arg_15_0 and 1 or 0
		end

		if not arg_6_0.recordState then
			local function var_14_1(arg_16_0)
				if arg_16_0 ~= -1 then
					var_14_0(true)

					arg_6_0.recordState = false

					LeanTween.moveX(arg_6_0.stopRecBtn, arg_6_0.stopRecBtn.rect.width, 0.15)
				end
			end

			local function var_14_2(arg_17_0)
				warning("开始录屏结果：" .. tostring(arg_17_0))
			end

			local function var_14_3()
				setActive(arg_6_0.stopRecBtn, true)
				LeanTween.moveX(arg_6_0.stopRecBtn, 0, 0.15):setOnComplete(System.Action(function()
					var_0_0.SetMute(true)
					arg_6_0.ysScreenRecorder:BeforeStart()
					arg_6_0.ysScreenRecorder:StartRecord(var_14_2, var_14_1)
				end))

				if PLATFORM_CODE == PLATFORM_JP and pg.SdkMgr.GetInstance():GetChannelUID() == "2" then
					print("start recording : play sound")
					NotificationMgr.Inst:PlayStartRecordSound()
				end
			end

			seriesAsync({
				function(arg_20_0)
					CameraHelper.Request3DDorm(arg_20_0, nil)
				end,
				function(arg_21_0)
					arg_6_0.recordState = true

					var_14_0(false)

					local var_21_0 = PlayerPrefs.GetInt("hadShowForVideoTipDorm", 0)

					if not var_21_0 or var_21_0 <= 0 then
						PlayerPrefs.SetInt("hadShowForVideoTipDorm", 1)

						arg_6_0:findTF("Text", arg_6_0.videoTipPanel):GetComponent("Text").text = i18n("word_take_video_tip")

						onButton(arg_6_0, arg_6_0.videoTipPanel, function()
							setActive(arg_6_0.videoTipPanel, false)
							var_14_3()
						end)
						setActive(arg_6_0.videoTipPanel, true)
					else
						var_14_3()
					end
				end
			})
		end
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.stopRecBtn, function()
		arg_6_0.recordState = false

		local function var_23_0(arg_24_0)
			warning("结束录屏结果：" .. tostring(arg_24_0))
		end

		local function var_23_1(arg_25_0)
			setActive(arg_6_0.centerPanel, arg_25_0)

			arg_6_0:findTF("RightTop"):GetComponent("CanvasGroup").alpha = arg_25_0 and 1 or 0
		end

		if not LeanTween.isTweening(go(arg_6_0.stopRecBtn)) then
			LeanTween.moveX(arg_6_0.stopRecBtn, arg_6_0.stopRecBtn.rect.width, 0.15):setOnComplete(System.Action(function()
				setActive(arg_6_0.stopRecBtn, false)
				seriesAsync({
					function(arg_27_0)
						arg_6_0.ysScreenRecorder:StopRecord(var_23_0)

						if PLATFORM == PLATFORM_ANDROID then
							pg.MsgboxMgr.GetInstance():ShowMsgBox({
								content = i18n("word_save_video"),
								onNo = function()
									arg_6_0.ysScreenRecorder:DiscardVideo()
								end,
								onYes = function()
									local var_29_0 = arg_6_0.ysScreenRecorder:GetVideoFilePath()

									MediaSaver.SaveVideoWithPath(var_29_0)
								end
							})
						end

						var_23_1(true)
						var_0_0.SetMute(false)

						local var_27_0 = arg_6_0.room:GetCameraZones()[arg_6_0.zoneIndex]
						local var_27_1 = Dorm3dCameraAnim.New({
							configId = arg_6_0.animID
						})

						pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCamera(arg_6_0.scene.apartment:GetConfigID(), 2, arg_6_0.room:GetConfigID(), Dorm3dTrackCommand.BuildCameraMsg(var_27_0:GetName(), var_27_1:GetStateName(), arg_6_0.cameraSettings.depthOfField.focusDistance.value, arg_6_0.cameraSettings.depthOfField.blurRadius.value, arg_6_0.cameraSettings.postExposure.value, arg_6_0.cameraSettings.contrast.value, arg_6_0.cameraSettings.saturate.value)))
					end
				})
			end))
		end
	end)
	setActive(arg_6_0.stopRecBtn, false)
	onButton(arg_6_0, arg_6_0._tf:Find("RightTop/Film/Switch"), function()
		GetOrAddComponent(arg_6_0._tf:Find("RightTop/Film"), typeof(CanvasGroup)).blocksRaycasts = false

		quickPlayAnimation(arg_6_0._tf:Find("RightTop"), "anim_dorm3d_photo_FtoS")
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0._tf:Find("RightTop/Shot/Shot"), function()
		local function var_31_0(arg_32_0)
			setActive(arg_6_0.centerPanel, arg_32_0)
			setActive(arg_6_0._tf:Find("RightTop"), arg_32_0)

			if PlayerPrefs.GetInt(SHOW_TOUCH_EFFECT, 1) > 0 then
				setActive(pg.UIMgr.GetInstance().OverlayEffect, arg_32_0)
			end
		end

		local function var_31_1(arg_33_0)
			warning("截图结果：" .. tostring(arg_33_0))
		end

		local function var_31_2(arg_34_0, arg_34_1)
			arg_6_0:emit(Dorm3dPhotoMediator.SHARE_PANEL, arg_34_1, arg_34_0)

			if PLATFORM_CODE == PLATFORM_JP and pg.SdkMgr.GetInstance():GetChannelUID() == "2" then
				print("start photo : play sound")
				NotificationMgr.Inst:PlayShutterSound()
			end

			local var_34_0 = arg_6_0.room:GetCameraZones()[arg_6_0.zoneIndex]
			local var_34_1 = Dorm3dCameraAnim.New({
				configId = arg_6_0.animID
			})

			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCamera(arg_6_0.scene.apartment:GetConfigID(), 1, arg_6_0.room:GetConfigID(), Dorm3dTrackCommand.BuildCameraMsg(var_34_0:GetName(), var_34_1:GetStateName(), arg_6_0.cameraSettings.depthOfField.focusDistance.value, arg_6_0.cameraSettings.depthOfField.blurRadius.value, arg_6_0.cameraSettings.postExposure.value, arg_6_0.cameraSettings.contrast.value, arg_6_0.cameraSettings.saturate.value)))
		end

		local var_31_3 = ScreenShooter.New(Screen.width, Screen.height, TextureFormat.ARGB32):TakePhoto(arg_6_0.mainCamera)
		local var_31_4 = Tex2DExtension.EncodeToJPG(var_31_3)

		var_31_1(true)
		var_31_2(var_31_4, var_31_3)
	end, "ui-dorm_photograph")

	GetOrAddComponent(arg_6_0._tf:Find("RightTop/Film"), typeof(CanvasGroup)).blocksRaycasts = false

	onButton(arg_6_0, arg_6_0._tf:Find("RightTop/Shot/Switch"), function()
		GetOrAddComponent(arg_6_0._tf:Find("RightTop/Film"), typeof(CanvasGroup)).blocksRaycasts = true

		quickPlayAnimation(arg_6_0._tf:Find("RightTop"), "anim_dorm3d_photo_StoF")
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.btnAnimSpeed, function()
		setActive(arg_6_0.listAnimSpeed, not isActive(arg_6_0.listAnimSpeed))
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.btnZone, function()
		local var_37_0 = isActive(arg_6_0.listZones)

		setActive(arg_6_0.listZones, not var_37_0)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.zoneMask, function()
		setActive(arg_6_0.listZones, false)
	end)
	onButton(arg_6_0, arg_6_0.btnAr, function()
		arg_6_0.ARchecker:StartCheck(function(arg_40_0)
			if PLATFORM == PLATFORM_WINDOWSEDITOR then
				arg_40_0 = -1
			end

			originalPrint("AR CODE: " .. arg_40_0)
			arg_6_0:emit(Dorm3dPhotoMediator.GO_AR, arg_40_0)
		end)
	end)
	onButton(arg_6_0, arg_6_0.btnMove, function()
		arg_6_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SwitchPhotoCamera")

		arg_6_0.freeMode = not arg_6_0.freeMode

		setActive(var_6_0, arg_6_0.freeMode)
		setActive(arg_6_0.btnMove:Find("Selected"), arg_6_0.freeMode)
	end)
	onButton(arg_6_0, arg_6_0.btnMenuSmall, function()
		setActive(arg_6_0.btnMenuSmall, false)
		setActive(arg_6_0.btnMenu, true)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.btnMenu:Find("Collapse"), function()
		setActive(arg_6_0.btnMenu, false)
		setActive(arg_6_0.btnMenuSmall, true)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.btnMenu, function()
		setActive(arg_6_0.skinSelectPanel, true)
		arg_6_0:UpdateSkinList()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.skinSelectPanel:Find("BG/Close"), function()
		setActive(arg_6_0.skinSelectPanel, false)
	end, SFX_PANEL)

	arg_6_0.activePanel = 1

	local var_6_1 = {
		{
			btn = arg_6_0.btnAction,
			On = function()
				arg_6_0:UpdateActionPanel()
			end,
			Off = function()
				return
			end
		},
		{
			btn = arg_6_0.btnCamera,
			On = function()
				arg_6_0:UpdateCameraPanel()
			end,
			Off = function()
				return
			end
		},
		{
			btn = arg_6_0.btnLighting,
			On = function()
				arg_6_0:UpdateLightingPanel()
			end,
			Off = function()
				return
			end
		}
	}

	table.Ipairs(var_6_1, function(arg_52_0, arg_52_1)
		onToggle(arg_6_0, arg_52_1.btn, function(arg_53_0)
			if not arg_53_0 then
				return
			end

			table.Ipairs(var_6_1, function(arg_54_0, arg_54_1)
				if arg_54_0 == arg_52_0 then
					return
				end

				arg_54_1.Off()
			end)

			arg_6_0.activePanel = arg_52_0

			arg_52_1.On()
		end, SFX_PANEL)
	end)
	;(function()
		local var_55_0 = {
			arg_6_0.panelAction:Find("Layout/Title/Regular"),
			arg_6_0.panelAction:Find("Layout/Title/Special")
		}

		triggerToggle(var_55_0[1], true)
	end)()
	;(function()
		local var_56_0 = {
			arg_6_0.panelLightning:Find("Layout/Title/Filter")
		}

		triggerToggle(var_56_0[1], true)
	end)()

	arg_6_0.zoneIndex = 1

	arg_6_0:InitData()
	arg_6_0:FirstEnterZone()
	triggerToggle(var_6_1[arg_6_0.activePanel].btn, true)
	arg_6_0:UpdateZoneList()
end

function var_0_0.InitData(arg_57_0)
	arg_57_0.cameraSettings = Clone(arg_57_0.scene:GetCameraSettings())
	arg_57_0.settingHideCharacter = false
	arg_57_0.settingFaceCamera = true
	arg_57_0.settingFilterIndex = nil
	arg_57_0.settingFilterStrength = 1

	arg_57_0:RefreshData()
end

function var_0_0.RefreshData(arg_58_0)
	local var_58_0 = arg_58_0.room:GetCameraZones()[arg_58_0.zoneIndex]

	arg_58_0.animID = var_58_0:GetRegularAnims()[1]:GetConfigID()

	local function var_58_1(arg_59_0, arg_59_1)
		arg_59_0.min = arg_59_1[1]
		arg_59_0.max = arg_59_1[2]
		arg_59_0.value = math.clamp(arg_59_0.value, arg_59_1[1], arg_59_1[2])
	end

	var_58_1(arg_58_0.cameraSettings.depthOfField.focusDistance, var_58_0:GetFocusDistanceRange())
	var_58_1(arg_58_0.cameraSettings.depthOfField.blurRadius, var_58_0:GetDepthOfFieldBlurRange())
	var_58_1(arg_58_0.cameraSettings.postExposure, var_58_0:GetExposureRange())
	var_58_1(arg_58_0.cameraSettings.contrast, var_58_0:GetContrastRange())
	var_58_1(arg_58_0.cameraSettings.saturate, var_58_0:GetSaturationRange())

	arg_58_0.animSpeeds = var_58_0:GetAnimSpeeds()
	arg_58_0.animSpeed = 1
end

function var_0_0.FirstEnterZone(arg_60_0)
	local var_60_0 = arg_60_0.room:GetCameraZones()[arg_60_0.zoneIndex]
	local var_60_1 = Dorm3dCameraAnim.New({
		configId = arg_60_0.animID
	})

	arg_60_0.scene:HideCharacter(arg_60_0.scene.apartment:GetConfigID())
	arg_60_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "EnterPhotoMode", var_60_0, var_60_1:GetStateName())
	arg_60_0:UpdateAnimSpeedPanel()
end

function var_0_0.SwitchZone(arg_61_0)
	local var_61_0 = arg_61_0.room:GetCameraZones()[arg_61_0.zoneIndex]
	local var_61_1 = Dorm3dCameraAnim.New({
		configId = arg_61_0.animID
	})

	arg_61_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SwitchCameraZone", var_61_0, var_61_1:GetStateName())

	if arg_61_0.timerAnim then
		arg_61_0.timerAnim:Stop()

		arg_61_0.timerAnim = nil
	end

	arg_61_0.animPlaying = nil

	arg_61_0:UpdateActionPanel()
	arg_61_0:UpdateCameraPanel()
	arg_61_0:UpdateLightingPanel()
	arg_61_0:UpdateAnimSpeedPanel()
	arg_61_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetCharacterAnimSpeed", arg_61_0.animSpeed)
end

function var_0_0.UpdateZoneList(arg_62_0)
	local var_62_0 = arg_62_0.room:GetCameraZones()

	local function var_62_1()
		setText(arg_62_0.btnZone:Find("Text"), var_62_0[arg_62_0.zoneIndex]:GetName())
		UIItemList.StaticAlign(arg_62_0.listZones:Find("List"), arg_62_0.listZones:Find("List"):GetChild(0), #var_62_0, function(arg_64_0, arg_64_1, arg_64_2)
			if arg_64_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_64_1 = arg_64_1 + 1

			local var_64_0 = var_62_0[arg_64_1]

			setText(arg_64_2:Find("Name"), var_64_0:GetName())

			local var_64_1 = arg_62_0.zoneIndex == arg_64_1 and Color.NewHex("5CCAFF") or Color.NewHex("FFFFFF99")

			setTextColor(arg_64_2:Find("Name"), var_64_1)
			setActive(arg_64_2:Find("Line"), arg_64_1 < #var_62_0)
		end)
	end

	var_62_1()
	UIItemList.StaticAlign(arg_62_0.listZones:Find("List"), arg_62_0.listZones:Find("List"):GetChild(0), #var_62_0, function(arg_65_0, arg_65_1, arg_65_2)
		if arg_65_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_65_1 = arg_65_1 + 1

		onButton(arg_62_0, arg_65_2, function()
			if arg_62_0.zoneIndex == arg_65_1 then
				return
			end

			arg_62_0.zoneIndex = arg_65_1

			arg_62_0:RefreshData()
			arg_62_0:SwitchZone()
			setActive(arg_62_0.listZones, false)
			var_62_1()
		end, SFX_PANEL)
	end)
end

local var_0_2 = 0.2

function var_0_0.UpdateActionPanel(arg_67_0)
	if not arg_67_0.activeSetting then
		return
	end

	if arg_67_0.activePanel ~= var_0_0.PANEL.ACTION then
		return
	end

	local var_67_0 = arg_67_0.room:GetCameraZones()[arg_67_0.zoneIndex]
	local var_67_1 = var_67_0:GetRegularAnims()
	local var_67_2 = arg_67_0.panelAction:Find("Layout/Regular/Scroll/Viewport/Content")
	local var_67_3 = var_67_0:GetAllSpecialList(arg_67_0.room.id)
	local var_67_4 = arg_67_0.panelAction:Find("Layout/Special/Scroll/Viewport/Content")
	local var_67_5 = #var_67_3 > 0

	setActive(arg_67_0.panelAction:Find("Layout/Title/Special"), var_67_5)

	local function var_67_6()
		UIItemList.StaticAlign(var_67_2, var_67_2:GetChild(0), #var_67_1, function(arg_69_0, arg_69_1, arg_69_2)
			if arg_69_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_69_1 = arg_69_1 + 1

			local var_69_0 = var_67_1[arg_69_1]

			setActive(arg_69_2:Find("Selected"), var_69_0:GetConfigID() == arg_67_0.animID)
			setActive(arg_69_2:Find("Slider"), var_69_0:GetConfigID() == arg_67_0.animID and tobool(arg_67_0.timerAnim))
		end)
		UIItemList.StaticAlign(var_67_4, var_67_4:GetChild(0), #var_67_3, function(arg_70_0, arg_70_1, arg_70_2)
			if arg_70_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_70_1 = arg_70_1 + 1

			local var_70_0 = var_67_3[arg_70_1].anims
			local var_70_1 = arg_70_2:Find("Actions")

			UIItemList.StaticAlign(var_70_1, var_70_1:GetChild(0), #var_70_0, function(arg_71_0, arg_71_1, arg_71_2)
				if arg_71_0 ~= UIItemList.EventUpdate then
					return
				end

				arg_71_1 = arg_71_1 + 1

				local var_71_0 = var_70_0[arg_71_1]

				setActive(arg_71_2:Find("Selected"), var_71_0:GetConfigID() == arg_67_0.animID)
				setActive(arg_71_2:Find("Slider"), var_71_0:GetConfigID() == arg_67_0.animID and tobool(arg_67_0.timerAnim))
			end)
		end)
	end

	local function var_67_7(arg_72_0, arg_72_1)
		if arg_67_0.animPlaying then
			return
		end

		local var_72_0 = arg_72_0:GetConfigID()

		if arg_67_0.animID == var_72_0 then
			return
		end

		local var_72_1 = arg_67_0:GetAnimPlayList(var_72_0)
		local var_72_2 = Dorm3dCameraAnim.New({
			configId = arg_67_0.animID
		}):GetFinishAnimID()

		arg_67_0.animID = var_72_0

		var_67_6()
		arg_67_0:BlockActionPanel(true)

		arg_67_0.animPlaying = true

		local var_72_3 = (table.indexof(var_72_1, _.detect(var_72_1, function(arg_73_0)
			return arg_73_0:GetConfigID() == var_72_2
		end)) or 0) + 1
		local var_72_4 = _.rest(var_72_1, var_72_3)
		local var_72_5 = arg_72_1:Find("Slider"):GetComponent(typeof(Slider))

		setActive(arg_72_1:Find("Slider"), true)

		local function var_72_6()
			setActive(arg_72_1:Find("Selected"), true)
			setActive(arg_72_1:Find("Slider"), false)
			arg_67_0:BlockActionPanel(false)

			arg_67_0.animPlaying = nil
		end

		if #var_72_4 == 0 then
			var_72_6()

			return
		end

		local var_72_7 = _.reduce(var_72_4, 0, function(arg_75_0, arg_75_1)
			return arg_75_0 + math.max(var_0_2, arg_75_1:GetAnimTime())
		end)

		if arg_67_0.timerAnim then
			arg_67_0.timerAnim:Stop()
		end

		arg_67_0.animInfo = {
			index = 1,
			passedTime = 0,
			ratio = 0,
			animPlayList = var_72_4,
			totalTime = var_72_7,
			startStamp = Time.time
		}
		arg_67_0.timerAnim = FrameTimer.New(function()
			local var_76_0 = arg_67_0.animInfo
			local var_76_1 = var_76_0.animPlayList[var_76_0.index]
			local var_76_2 = math.max(var_0_2, var_76_1:GetAnimTime())
			local var_76_3 = var_76_0.startStamp
			local var_76_4 = Time.time
			local var_76_5 = math.min(1, var_76_0.ratio + (var_76_4 - var_76_3) * arg_67_0.animSpeed / var_76_2)
			local var_76_6 = var_76_0.passedTime + var_76_2 * var_76_5

			var_72_5.value = var_76_6 / var_72_7

			if var_76_5 < 1 then
				return
			end

			var_76_0.index = var_76_0.index + 1
			var_76_0.ratio = 0
			var_76_0.passedTime = var_76_0.passedTime + var_76_2
			var_76_0.startStamp = var_76_4

			local var_76_7 = var_76_1:GetStartPoint()

			if #var_76_7 > 0 then
				arg_67_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetCharPoint", var_76_7)
			end

			arg_67_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SyncCurrentInterestTransform")

			if var_76_0.index > #var_76_0.animPlayList then
				var_72_6()
				arg_67_0.timerAnim:Stop()

				arg_67_0.timerAnim = nil
				arg_67_0.animInfo = nil

				return
			end

			local var_76_8 = var_76_0.animPlayList[var_76_0.index]

			arg_67_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "PlaySingleAction", var_76_8:GetStateName())
		end, 1, -1)

		local var_72_8 = arg_67_0.animInfo.animPlayList[1]

		if var_72_3 == 1 then
			arg_67_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SwitchAnim", var_72_8:GetStateName())
			onNextTick(function()
				local var_77_0 = var_72_8:GetStartPoint()

				if #var_77_0 == 0 then
					var_77_0 = var_67_0:GetWatchCameraName()
				end

				arg_67_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetCharPoint", var_77_0)
				arg_67_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SyncCurrentInterestTransform")

				if arg_67_0.freeMode then
					local var_77_1 = arg_67_0.scene.cameras[arg_67_0.scene.CAMERA.PHOTO_FREE]
					local var_77_2 = var_77_1:GetComponent(typeof(UnityEngine.CharacterController))
					local var_77_3 = var_77_1.transform.forward

					var_77_3.y = 0

					var_77_3:Normalize()

					local var_77_4 = var_77_3 * -0.01

					var_77_2:Move(var_77_4)
					var_77_2:Move(-var_77_4)
				end
			end)
		else
			arg_67_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "PlaySingleAction", var_72_8:GetStateName())
		end

		arg_67_0.timerAnim:Start()
	end

	UIItemList.StaticAlign(var_67_2, var_67_2:GetChild(0), #var_67_1, function(arg_78_0, arg_78_1, arg_78_2)
		if arg_78_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_78_1 = arg_78_1 + 1

		local var_78_0 = var_67_1[arg_78_1]

		setText(arg_78_2:Find("Name"), var_78_0:GetName())
		GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_78_0:GetZoneIcon()), "", arg_78_2:Find("Icon"))
		setActive(arg_78_2:Find("Slider"), false)
		setActive(arg_78_2:Find("Selected"), false)
		onButton(arg_67_0, arg_78_2, function()
			var_67_7(var_78_0, arg_78_2)
		end)
	end)

	local function var_67_8()
		UIItemList.StaticAlign(var_67_4, var_67_4:GetChild(0), #var_67_3, function(arg_81_0, arg_81_1, arg_81_2)
			if arg_81_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_81_1 = arg_81_1 + 1

			local var_81_0 = var_67_3[arg_81_1].anims
			local var_81_1 = arg_81_2:Find("Actions")

			UIItemList.StaticAlign(var_81_1, var_81_1:GetChild(0), #var_81_0, function(arg_82_0, arg_82_1, arg_82_2)
				if arg_82_0 ~= UIItemList.EventUpdate then
					return
				end

				arg_82_1 = arg_82_1 + 1

				local var_82_0 = var_81_0[arg_82_1]

				setActive(arg_82_2:Find("Selected"), var_82_0:GetConfigID() == arg_67_0.animID)
				setActive(arg_82_2:Find("Slider"), var_82_0:GetConfigID() == arg_67_0.animID and tobool(arg_67_0.timerAnim))
			end)
		end)
	end

	local function var_67_9()
		UIItemList.StaticAlign(var_67_4, var_67_4:GetChild(0), #var_67_3, function(arg_84_0, arg_84_1, arg_84_2)
			if arg_84_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_84_1 = arg_84_1 + 1

			setActive(arg_84_2:Find("Button/Active"), arg_67_0.settingSpecialFurnitureIndex == arg_84_1)
			setActive(arg_84_2:Find("Actions"), arg_67_0.settingSpecialFurnitureIndex == arg_84_1)
		end)
		var_67_8()
	end

	local var_67_10 = arg_67_0.room:GetCameraZones()[arg_67_0.zoneIndex]

	local function var_67_11(arg_85_0, arg_85_1)
		local var_85_0 = arg_85_1:Find("Actions")
		local var_85_1 = arg_85_0.anims

		UIItemList.StaticAlign(var_85_0, var_85_0:GetChild(0), #var_85_1, function(arg_86_0, arg_86_1, arg_86_2)
			if arg_86_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_86_1 = arg_86_1 + 1

			local var_86_0 = var_85_1[arg_86_1]
			local var_86_1 = var_67_10:CheckFurnitureIdInZone(arg_85_0.furnitureId)
			local var_86_2 = arg_67_0.room:IsFurnitureSetIn(arg_85_0.furnitureId)
			local var_86_3 = var_86_1 and var_86_2

			SetActive(arg_86_2:Find("Other"), not var_86_3)
			SetActive(arg_86_2:Find("Name"), var_86_3)

			if var_86_3 then
				onButton(arg_67_0, arg_86_2, function()
					arg_67_0.room:ReplaceFurniture(arg_85_0.slotId, arg_85_0.furnitureId)
					arg_67_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RefreshSlots", arg_67_0.room)
					var_67_7(var_86_0, arg_86_2)
				end)
				setText(arg_86_2:Find("Name"), var_86_0:GetName())
			else
				removeOnButton(arg_86_2)

				if not var_86_1 then
					local var_86_4 = var_86_0:GetZoneName()

					warnText = i18n("dorm3d_photo_active_zone", var_86_4)
				else
					warnText = i18n("dorm3d_furniture_replace_tip")
				end

				setText(arg_86_2:Find("Other/Content"), warnText)
			end

			GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_86_0:GetZoneIcon()), "", arg_86_2:Find("Icon"))
			setActive(arg_86_2:Find("Slider"), false)
			setActive(arg_86_2:Find("Selected"), false)
		end)
	end

	setActive(var_67_4, #var_67_3 > 0)
	UIItemList.StaticAlign(var_67_4, var_67_4:GetChild(0), #var_67_3, function(arg_88_0, arg_88_1, arg_88_2)
		if arg_88_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_88_1 = arg_88_1 + 1

		local var_88_0 = var_67_3[arg_88_1]
		local var_88_1 = Dorm3dFurniture.New({
			configId = var_88_0.furnitureId
		})
		local var_88_2 = tobool(_.detect(arg_67_0.room:GetFurnitures(), function(arg_89_0)
			return arg_89_0:GetConfigID() == var_88_0.furnitureId
		end))

		setText(arg_88_2:Find("Button/Name"), var_88_1:GetName())
		GetImageSpriteFromAtlasAsync(var_88_1:GetIcon(), "", arg_88_2:Find("Button/Icon"))
		setActive(arg_88_2:Find("Button/Lock"), not var_88_2)
		setActive(arg_88_2:Find("Button/BG"), var_88_2)

		local var_88_3 = var_67_10:CheckFurnitureIdInZone(var_88_0.furnitureId)
		local var_88_4

		if var_88_3 then
			var_88_4 = Color.New(1, 1, 1, 0.8509803921568627)
		else
			var_88_4 = Color.New(0.788235294117647, 0.788235294117647, 0.788235294117647, 0.8509803921568627)
		end

		setImageColor(arg_88_2:Find("Button/BG"), var_88_4)
		onButton(arg_67_0, arg_88_2:Find("Button"), function()
			if not var_88_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_furniture_locked"))

				return
			end

			if arg_67_0.settingSpecialFurnitureIndex == arg_88_1 then
				arg_67_0.settingSpecialFurnitureIndex = nil
			else
				arg_67_0.settingSpecialFurnitureIndex = arg_88_1
			end

			var_67_11(var_88_0, arg_88_2, arg_88_1)
			var_67_9()
		end)
	end)
	var_67_9()
	var_67_6()
end

function var_0_0.BlockActionPanel(arg_91_0, arg_91_1)
	return
end

function var_0_0.GetAnimPlayList(arg_92_0, arg_92_1)
	local var_92_0 = arg_92_1
	local var_92_1 = {}

	while true do
		local var_92_2 = Dorm3dCameraAnim.New({
			configId = var_92_0
		})

		if not var_92_2 then
			return var_92_1
		end

		table.insert(var_92_1, 1, var_92_2)

		var_92_0 = var_92_2:GetPreAnimID()

		if var_92_0 == 0 then
			return var_92_1
		end
	end
end

function var_0_0.UpdateCameraPanel(arg_93_0)
	if not arg_93_0.activeSetting then
		return
	end

	if arg_93_0.activePanel ~= var_0_0.PANEL.CAMERA then
		return
	end

	;(function()
		local var_94_0 = arg_93_0.panelCamera:Find("Layout/DepthOfField/Switch/Toggle")

		triggerToggle(var_94_0, arg_93_0.cameraSettings.depthOfField.enabled)
		onToggle(arg_93_0, var_94_0, function(arg_95_0)
			arg_93_0.cameraSettings.depthOfField.enabled = arg_95_0

			setActive(arg_93_0.panelCamera:Find("Layout/DepthOfField/DepthOfField"), arg_93_0.cameraSettings.depthOfField.enabled)
			arg_93_0:RefreshCamera()
		end, SFX_UI_TAG, SFX_UI_CANCEL)
	end)()
	setActive(arg_93_0.panelCamera:Find("Layout/DepthOfField/DepthOfField"), arg_93_0.cameraSettings.depthOfField.enabled)
	;(function()
		local var_96_0 = arg_93_0.cameraSettings.depthOfField.focusDistance
		local var_96_1 = arg_93_0.panelCamera:Find("Layout/DepthOfField/DepthOfField/FocusDistance/Slider")

		setSlider(var_96_1, var_96_0.min, var_96_0.max, var_96_0.value)
		onSlider(arg_93_0, var_96_1, function(arg_97_0)
			var_96_0.value = arg_97_0

			arg_93_0:RefreshCamera()
		end)
	end)()
	;(function()
		local var_98_0 = arg_93_0.cameraSettings.depthOfField.blurRadius
		local var_98_1 = arg_93_0.panelCamera:Find("Layout/DepthOfField/DepthOfField/BlurRadius/Slider")

		setSlider(var_98_1, var_98_0.min, var_98_0.max, var_98_0.value)
		onSlider(arg_93_0, var_98_1, function(arg_99_0)
			var_98_0.value = arg_99_0

			arg_93_0:RefreshCamera()
		end)
	end)()

	local var_93_0 = {
		"PostExposure",
		"Saturation",
		"Contrast"
	}

	arg_93_0.paramIndex = arg_93_0.paramIndex or 1

	local function var_93_1()
		table.Ipairs(var_93_0, function(arg_101_0, arg_101_1)
			local var_101_0 = arg_93_0.panelCamera:Find("Layout/Paramaters/Icons"):GetChild(arg_101_0 - 1)

			setActive(var_101_0:Find("Selected"), arg_101_0 == arg_93_0.paramIndex)
			setActive(arg_93_0.panelCamera:Find("Layout/Paramaters/" .. arg_101_1), arg_101_0 == arg_93_0.paramIndex)
		end)
	end

	table.Ipairs(var_93_0, function(arg_102_0, arg_102_1)
		local var_102_0 = arg_93_0.panelCamera:Find("Layout/Paramaters/Icons"):GetChild(arg_102_0 - 1)

		onButton(arg_93_0, var_102_0, function()
			arg_93_0.paramIndex = arg_102_0

			var_93_1()
		end, SFX_PANEL)
	end)
	var_93_1()
	;(function()
		local var_104_0 = arg_93_0.cameraSettings.postExposure
		local var_104_1 = arg_93_0.panelCamera:Find("Layout/Paramaters/PostExposure/PostExposure/Slider")
		local var_104_2 = var_104_1:Find("Background/Fill")

		onSlider(arg_93_0, var_104_1, function(arg_105_0)
			var_104_0.value = arg_105_0

			local var_105_0 = (arg_105_0 - var_104_0.min) / (var_104_0.max - var_104_0.min)
			local var_105_1 = math.min(var_105_0, 0.5)
			local var_105_2 = math.max(var_105_0, 0.5)

			var_104_2.anchorMin = Vector2.New(var_105_1, 0)
			var_104_2.anchorMax = Vector2.New(var_105_2, 1)
			var_104_2.offsetMin = Vector2.zero
			var_104_2.offsetMax = Vector2.zero

			arg_93_0:RefreshCamera()
		end)
		setSlider(var_104_1, var_104_0.min, var_104_0.max, var_104_0.value)
	end)()
	;(function()
		local var_106_0 = arg_93_0.cameraSettings.contrast
		local var_106_1 = arg_93_0.panelCamera:Find("Layout/Paramaters/Contrast/Contrast/Slider")
		local var_106_2 = var_106_1:Find("Background/Fill")

		onSlider(arg_93_0, var_106_1, function(arg_107_0)
			var_106_0.value = arg_107_0

			local var_107_0 = (arg_107_0 - var_106_0.min) / (var_106_0.max - var_106_0.min)
			local var_107_1 = math.min(var_107_0, 0.5)
			local var_107_2 = math.max(var_107_0, 0.5)

			var_106_2.anchorMin = Vector2.New(var_107_1, 0)
			var_106_2.anchorMax = Vector2.New(var_107_2, 1)
			var_106_2.offsetMin = Vector2.zero
			var_106_2.offsetMax = Vector2.zero

			arg_93_0:RefreshCamera()
		end)
		setSlider(var_106_1, var_106_0.min, var_106_0.max, var_106_0.value)
	end)()
	;(function()
		local var_108_0 = arg_93_0.cameraSettings.saturate
		local var_108_1 = arg_93_0.panelCamera:Find("Layout/Paramaters/Saturation/Saturation/Slider")
		local var_108_2 = var_108_1:Find("Background/Fill")

		onSlider(arg_93_0, var_108_1, function(arg_109_0)
			var_108_0.value = arg_109_0

			local var_109_0 = (arg_109_0 - var_108_0.min) / (var_108_0.max - var_108_0.min)
			local var_109_1 = math.min(var_109_0, 0.5)
			local var_109_2 = math.max(var_109_0, 0.5)

			var_108_2.anchorMin = Vector2.New(var_109_1, 0)
			var_108_2.anchorMax = Vector2.New(var_109_2, 1)
			var_108_2.offsetMin = Vector2.zero
			var_108_2.offsetMax = Vector2.zero

			arg_93_0:RefreshCamera()
		end)
		setSlider(var_108_1, var_108_0.min, var_108_0.max, var_108_0.value)
	end)()
	;(function()
		local var_110_0 = arg_93_0.panelCamera:Find("Layout/Other/FaceCamera/Toggle")

		triggerToggle(var_110_0, arg_93_0.settingFaceCamera)
		onToggle(arg_93_0, var_110_0, function(arg_111_0)
			arg_93_0.settingFaceCamera = arg_111_0

			arg_93_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "EnableHeadIK", arg_111_0)
		end, SFX_UI_TAG, SFX_UI_CANCEL)
	end)()
	;(function()
		local var_112_0 = arg_93_0.panelCamera:Find("Layout/Other/HideCharacter/Toggle")

		triggerToggle(var_112_0, arg_93_0.settingHideCharacter)
		onToggle(arg_93_0, var_112_0, function(arg_113_0)
			arg_93_0.settingHideCharacter = arg_113_0

			if arg_113_0 then
				arg_93_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "HideCharacterBylayer")
			else
				arg_93_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCharacterBylayer")
			end
		end, SFX_UI_TAG, SFX_UI_CANCEL)
	end)()
end

function var_0_0.RefreshCamera(arg_114_0)
	arg_114_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SettingCamera", arg_114_0.cameraSettings)
end

function var_0_0.UpdateAnimSpeedPanel(arg_115_0)
	local function var_115_0()
		if not arg_115_0.timerAnim then
			return
		end

		local var_116_0 = arg_115_0.animInfo
		local var_116_1 = var_116_0.animPlayList[var_116_0.index]
		local var_116_2 = math.max(var_0_2, var_116_1:GetAnimTime())
		local var_116_3 = var_116_0.startStamp
		local var_116_4 = Time.time

		var_116_0.ratio = math.min(1, var_116_0.ratio + (var_116_4 - var_116_3) * arg_115_0.animSpeed / var_116_2)
		var_116_0.startStamp = var_116_4
	end

	local var_115_1 = arg_115_0.animSpeeds

	UIItemList.StaticAlign(arg_115_0.listAnimSpeed, arg_115_0.listAnimSpeed:GetChild(0), #var_115_1, function(arg_117_0, arg_117_1, arg_117_2)
		if arg_117_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_117_1 = #var_115_1 - arg_117_1

		local var_117_0 = var_115_1[arg_117_1]

		setText(arg_117_2:Find("Name"), var_117_0)
		setText(arg_117_2:Find("Selected"), var_117_0)
		setActive(arg_117_2:Find("Line"), arg_117_1 ~= #var_115_1)
		onButton(arg_115_0, arg_117_2, function()
			if arg_115_0.animSpeed == var_117_0 then
				return
			end

			var_115_0()

			arg_115_0.animSpeed = var_117_0

			arg_115_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetCharacterAnimSpeed", var_117_0)
			arg_115_0:UpdateAnimSpeedPanel()
		end, SFX_PANEL)
	end)
	onButton(arg_115_0, arg_115_0.btnFreeze, function()
		local var_119_0 = 0

		if arg_115_0.animSpeed ~= 0 then
			arg_115_0.lastAnimSpeed = arg_115_0.animSpeed
		else
			var_119_0 = arg_115_0.lastAnimSpeed or 1
			arg_115_0.lastAnimSpeed = nil
		end

		var_115_0()

		arg_115_0.animSpeed = var_119_0

		arg_115_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetCharacterAnimSpeed", var_119_0)
		arg_115_0:UpdateAnimSpeedPanel()
	end, SFX_PANEL)
	UIItemList.StaticAlign(arg_115_0.listAnimSpeed, arg_115_0.listAnimSpeed:GetChild(0), #var_115_1, function(arg_120_0, arg_120_1, arg_120_2)
		if arg_120_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_120_1 = #var_115_1 - arg_120_1

		local var_120_0 = var_115_1[arg_120_1]

		setActive(arg_120_2:Find("Name"), arg_115_0.animSpeed ~= var_120_0)
		setActive(arg_120_2:Find("Selected"), arg_115_0.animSpeed == var_120_0)
	end)
	setActive(arg_115_0.btnFreeze:Find("Icon"), arg_115_0.animSpeed ~= 0)
	setActive(arg_115_0.btnFreeze:Find("Selected"), arg_115_0.animSpeed == 0)
	setText(arg_115_0.textAnimSpeed, i18n("dorm3d_photo_animspeed", string.format("%.1f", arg_115_0.animSpeed)))
end

function var_0_0.UpdateLightingPanel(arg_121_0)
	if not arg_121_0.activeSetting then
		return
	end

	if arg_121_0.activePanel ~= var_0_0.PANEL.LIGHTING then
		return
	end

	local var_121_0 = {}

	for iter_121_0, iter_121_1 in ipairs(pg.dorm3d_camera_volume_template.all) do
		table.insert(var_121_0, iter_121_1)
	end

	table.sort(var_121_0, function(arg_122_0, arg_122_1)
		return arg_122_0 < arg_122_1
	end)

	local function var_121_1()
		if not arg_121_0.settingFilterIndex then
			arg_121_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertVolumeProfile")

			return
		end

		local var_123_0 = pg.dorm3d_camera_volume_template[var_121_0[arg_121_0.settingFilterIndex]]

		arg_121_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetVolumeProfile", var_123_0.volume, arg_121_0.settingFilterStrength)
	end

	UIItemList.StaticAlign(arg_121_0.panelLightning:Find("Layout/Filter/List"), arg_121_0.panelLightning:Find("Layout/Filter/List"):GetChild(0), #var_121_0, function(arg_124_0, arg_124_1, arg_124_2)
		if arg_124_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_124_1 = arg_124_1 + 1

		local var_124_0 = pg.dorm3d_camera_volume_template[var_121_0[arg_124_1]]

		setText(arg_124_2:Find("Name"), var_124_0.name)

		var_124_0.icon = ""

		if var_124_0.icon ~= "" then
			GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_124_0.icon), "", arg_124_2:Find("BG"))
		end

		if arg_121_0.settingFilterIndex == arg_124_1 then
			setActive(arg_124_2:Find("Selected"), true)
		else
			setActive(arg_124_2:Find("Selected"), false)
		end

		local var_124_1, var_124_2 = ApartmentProxy.CheckUnlockConfig(var_124_0.unlock)

		setActive(arg_124_2:Find("lock"), not var_124_1)

		if not var_124_1 then
			setText(arg_124_2:Find("lock/Image/Text"), var_124_0.unlock_text)
		end

		onButton(arg_121_0, arg_124_2, function()
			if not var_124_1 then
				pg.TipsMgr.GetInstance():ShowTips(var_124_2)

				return
			end

			local var_125_0 = arg_121_0.settingFilterIndex

			if arg_121_0.settingFilterIndex ~= arg_124_1 then
				arg_121_0.settingFilterIndex = arg_124_1
			else
				arg_121_0.settingFilterIndex = nil
			end

			var_121_1()

			if var_125_0 then
				local var_125_1 = arg_121_0.panelLightning:Find("Layout/Filter/List"):GetChild(var_125_0 - 1)

				setActive(var_125_1:Find("Selected"), false)
			end

			if arg_121_0.settingFilterIndex == arg_124_1 then
				setActive(arg_124_2:Find("Selected"), true)
			end
		end, SFX_PANEL)
	end)
	setActive(arg_121_0.panelLightning:Find("Layout/Filter/Slider"), false)
end

function var_0_0.UpdateSkinList(arg_126_0)
	local var_126_0 = arg_126_0.scene.apartment:GetConfigID()
	local var_126_1 = arg_126_0.scene.ladyDict[var_126_0]
	local var_126_2 = var_126_1.skinIdList
	local var_126_3 = var_126_1.skinId
	local var_126_4 = {}
	local var_126_5 = {}

	_.each(var_126_2, function(arg_127_0)
		if ApartmentProxy.CheckUnlockConfig(pg.dorm3d_resource[arg_127_0].unlock) then
			table.insert(var_126_4, arg_127_0)
		else
			table.insert(var_126_5, arg_127_0)
		end
	end)

	local function var_126_6(arg_128_0, arg_128_1)
		local var_128_0 = arg_128_1 and var_126_4 or var_126_5

		UIItemList.StaticAlign(arg_128_0, arg_128_0:GetChild(0), #var_128_0, function(arg_129_0, arg_129_1, arg_129_2)
			if arg_129_0 ~= UIItemList.EventUpdate then
				return
			end

			local var_129_0 = var_128_0[arg_129_1 + 1]

			setActive(arg_129_2:Find("Selected"), var_129_0 == var_126_3)
			setActive(arg_129_2:Find("Lock"), not arg_128_1)

			if not arg_128_1 then
				setText(arg_129_2:Find("Lock/Bar/Text"), pg.dorm3d_resource[var_129_0].unlock_text)
			end

			arg_126_0.loader:GetSpriteQuiet(string.format("dorm3dselect/apartment_skin_%d", var_129_0), "", arg_129_2:Find("Icon"))
			onButton(arg_126_0, arg_129_2, function()
				if not arg_128_1 then
					local var_130_0, var_130_1 = ApartmentProxy.CheckUnlockConfig(pg.dorm3d_resource[var_129_0].unlock)

					pg.TipsMgr.GetInstance():ShowTips(var_130_1)

					return
				end

				if var_129_0 == var_126_3 then
					return
				end

				local var_130_2 = var_129_0

				seriesAsync({
					function(arg_131_0)
						if arg_126_0.settingHideCharacter then
							arg_126_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCharacterBylayer")
						end

						arg_126_0.scene.SwitchCharacterSkin(var_126_1, var_126_0, var_130_2, arg_131_0)
					end,
					function(arg_132_0)
						if not arg_126_0.animInfo then
							return arg_132_0()
						end

						local var_132_0 = arg_126_0.animInfo

						for iter_132_0 = #var_132_0.animPlayList, 1, -1 do
							local var_132_1 = var_132_0.animPlayList[iter_132_0]:GetStartPoint()

							if #var_132_1 > 0 then
								arg_126_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetCharPoint", var_132_1)

								break
							end

							if iter_132_0 == 1 then
								local var_132_2 = arg_126_0.room:GetCameraZones()[arg_126_0.zoneIndex]

								arg_126_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetCharPoint", var_132_2:GetWatchCameraName())
							end
						end

						arg_126_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SyncCurrentInterestTransform")

						local var_132_3 = var_132_0.animPlayList[#var_132_0.animPlayList]
						local var_132_4 = var_132_3:GetAnimTime()

						arg_126_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "PlaySingleAction", var_132_3:GetStateName())

						local var_132_5 = arg_126_0.scene.apartment:GetConfigID()

						arg_126_0.scene.ladyDict[var_132_5].ladyAnimator:Update(var_132_4)
						arg_126_0.timerAnim:Stop()

						arg_126_0.timerAnim = nil
						arg_126_0.animInfo = nil
						arg_126_0.animPlaying = nil

						arg_132_0()
					end,
					function()
						arg_126_0:UpdateActionPanel()

						if arg_126_0.settingHideCharacter then
							arg_126_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "HideCharacterBylayer")
						end

						arg_126_0:UpdateSkinList()
					end
				})
			end, SFX_PANEL)
		end)
	end

	var_126_6(arg_126_0.skinSelectPanel:Find("BG/Scroll/Content/Unlock/List"), true)
	var_126_6(arg_126_0.skinSelectPanel:Find("BG/Scroll/Content/Lock/List"), false)
end

function var_0_0.SetMute(arg_134_0)
	if arg_134_0 then
		CriAtom.SetCategoryVolume("Category_CV", 0)
		CriAtom.SetCategoryVolume("Category_BGM", 0)
		CriAtom.SetCategoryVolume("Category_SE", 0)
	else
		CriAtom.SetCategoryVolume("Category_CV", pg.CriMgr.GetInstance():getCVVolume())
		CriAtom.SetCategoryVolume("Category_BGM", pg.CriMgr.GetInstance():getBGMVolume())
		CriAtom.SetCategoryVolume("Category_SE", pg.CriMgr.GetInstance():getSEVolume())
	end
end

function var_0_0.willExit(arg_135_0)
	arg_135_0.loader:Clear()

	if arg_135_0.timerAnim then
		arg_135_0.timerAnim:Stop()

		arg_135_0.timerAnim = nil
	end

	if arg_135_0.animSpeed ~= 1 then
		arg_135_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetCharacterAnimSpeed", 1)
	end

	if arg_135_0.settingHideCharacter then
		arg_135_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCharacterBylayer")
	end

	if not arg_135_0.settingFaceCamera then
		arg_135_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "EnableHeadIK", true)
	end

	arg_135_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCharacterLight")
	arg_135_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertVolumeProfile")
	arg_135_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCameraSettings")
	arg_135_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ExitPhotoMode")
	arg_135_0.scene:RevertCharacter(arg_135_0.scene.apartment:GetConfigID())
end

function var_0_0.SetPhotoCameraSliderValue(arg_136_0, arg_136_1)
	local var_136_0 = arg_136_0.normalPanel:Find("Zoom/Slider")

	setSlider(var_136_0, 0, 1, arg_136_1)
end

return var_0_0
