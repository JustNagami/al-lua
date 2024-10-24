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

	arg_2_0.mainCamera = GameObject.Find("BackYardMainCamera"):GetComponent(typeof(Camera))
	arg_2_0.stopRecBtn = arg_2_0:findTF("stopRec")
	arg_2_0.videoTipPanel = arg_2_0:findTF("videoTipPanel")

	setActive(arg_2_0.videoTipPanel, false)
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
		local function var_13_0(arg_14_0)
			setActive(arg_6_0.centerPanel, arg_14_0)

			arg_6_0:findTF("RightTop"):GetComponent("CanvasGroup").alpha = arg_14_0 and 1 or 0
		end

		if not arg_6_0.recordState then
			local function var_13_1(arg_15_0)
				if arg_15_0 ~= -1 then
					var_13_0(true)

					arg_6_0.recordState = false

					LeanTween.moveX(arg_6_0.stopRecBtn, arg_6_0.stopRecBtn.rect.width, 0.15)
				end
			end

			local function var_13_2(arg_16_0)
				warning("开始录屏结果：" .. tostring(arg_16_0))
			end

			local function var_13_3()
				setActive(arg_6_0.stopRecBtn, true)
				LeanTween.moveX(arg_6_0.stopRecBtn, 0, 0.15):setOnComplete(System.Action(function()
					var_0_0.SetMute(true)
					arg_6_0.ysScreenRecorder:BeforeStart()
					arg_6_0.ysScreenRecorder:StartRecord(var_13_2, var_13_1)
				end))

				if PLATFORM_CODE == PLATFORM_JP and pg.SdkMgr.GetInstance():GetChannelUID() == "2" then
					print("start recording : play sound")
					NotificationMgr.Inst:PlayStartRecordSound()
				end
			end

			seriesAsync({
				function(arg_19_0)
					CameraHelper.Request3DDorm(arg_19_0, nil)
				end,
				function(arg_20_0)
					arg_6_0.recordState = true

					var_13_0(false)

					local var_20_0 = PlayerPrefs.GetInt("hadShowForVideoTipDorm", 0)

					if not var_20_0 or var_20_0 <= 0 then
						PlayerPrefs.SetInt("hadShowForVideoTipDorm", 1)

						arg_6_0:findTF("Text", arg_6_0.videoTipPanel):GetComponent("Text").text = i18n("word_take_video_tip")

						onButton(arg_6_0, arg_6_0.videoTipPanel, function()
							setActive(arg_6_0.videoTipPanel, false)
							var_13_3()
						end)
						setActive(arg_6_0.videoTipPanel, true)
					else
						var_13_3()
					end
				end
			})
		end
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.stopRecBtn, function()
		arg_6_0.recordState = false

		local function var_22_0(arg_23_0)
			warning("结束录屏结果：" .. tostring(arg_23_0))
		end

		local function var_22_1(arg_24_0)
			setActive(arg_6_0.centerPanel, arg_24_0)

			arg_6_0:findTF("RightTop"):GetComponent("CanvasGroup").alpha = arg_24_0 and 1 or 0
		end

		if not LeanTween.isTweening(go(arg_6_0.stopRecBtn)) then
			LeanTween.moveX(arg_6_0.stopRecBtn, arg_6_0.stopRecBtn.rect.width, 0.15):setOnComplete(System.Action(function()
				setActive(arg_6_0.stopRecBtn, false)
				seriesAsync({
					function(arg_26_0)
						arg_6_0.ysScreenRecorder:StopRecord(var_22_0)

						if PLATFORM == PLATFORM_ANDROID then
							pg.MsgboxMgr.GetInstance():ShowMsgBox({
								content = i18n("word_save_video"),
								onNo = function()
									arg_6_0.ysScreenRecorder:DiscardVideo()
								end,
								onYes = function()
									local var_28_0 = arg_6_0.ysScreenRecorder:GetVideoFilePath()

									MediaSaver.SaveVideoWithPath(var_28_0)
								end
							})
						end

						var_22_1(true)
						var_0_0.SetMute(false)

						local var_26_0 = arg_6_0.room:GetCameraZones()[arg_6_0.zoneIndex]
						local var_26_1 = Dorm3dCameraAnim.New({
							configId = arg_6_0.animID
						})

						pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCamera(arg_6_0.scene.apartment:GetConfigID(), 2, arg_6_0.room:GetConfigID(), Dorm3dTrackCommand.BuildCameraMsg(var_26_0:GetName(), var_26_1:GetStateName(), arg_6_0.cameraSettings.depthOfField.focusDistance.value, arg_6_0.cameraSettings.depthOfField.blurRadius.value, arg_6_0.cameraSettings.postExposure.value, arg_6_0.cameraSettings.contrast.value, arg_6_0.cameraSettings.saturate.value)))
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
		local function var_30_0(arg_31_0)
			setActive(arg_6_0.centerPanel, arg_31_0)
			setActive(arg_6_0._tf:Find("RightTop"), arg_31_0)

			if PlayerPrefs.GetInt(SHOW_TOUCH_EFFECT, 1) > 0 then
				setActive(pg.UIMgr.GetInstance().OverlayEffect, arg_31_0)
			end
		end

		local function var_30_1(arg_32_0)
			warning("截图结果：" .. tostring(arg_32_0))
		end

		local function var_30_2(arg_33_0, arg_33_1)
			arg_6_0:emit(Dorm3dPhotoMediator.SHARE_PANEL, arg_33_1, arg_33_0)

			if PLATFORM_CODE == PLATFORM_JP and pg.SdkMgr.GetInstance():GetChannelUID() == "2" then
				print("start photo : play sound")
				NotificationMgr.Inst:PlayShutterSound()
			end

			local var_33_0 = arg_6_0.room:GetCameraZones()[arg_6_0.zoneIndex]
			local var_33_1 = Dorm3dCameraAnim.New({
				configId = arg_6_0.animID
			})

			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCamera(arg_6_0.scene.apartment:GetConfigID(), 1, arg_6_0.room:GetConfigID(), Dorm3dTrackCommand.BuildCameraMsg(var_33_0:GetName(), var_33_1:GetStateName(), arg_6_0.cameraSettings.depthOfField.focusDistance.value, arg_6_0.cameraSettings.depthOfField.blurRadius.value, arg_6_0.cameraSettings.postExposure.value, arg_6_0.cameraSettings.contrast.value, arg_6_0.cameraSettings.saturate.value)))
		end

		local var_30_3 = ScreenShooter.New(Screen.width, Screen.height, TextureFormat.ARGB32):TakePhoto(arg_6_0.mainCamera)
		local var_30_4 = Tex2DExtension.EncodeToJPG(var_30_3)

		var_30_1(true)
		var_30_2(var_30_4, var_30_3)
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
		local var_36_0 = isActive(arg_6_0.listZones)

		setActive(arg_6_0.listZones, not var_36_0)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.zoneMask, function()
		setActive(arg_6_0.listZones, false)
	end)
	onButton(arg_6_0, arg_6_0.btnAr, function()
		arg_6_0.ARchecker:StartCheck(function(arg_39_0)
			if PLATFORM == PLATFORM_WINDOWSEDITOR then
				arg_39_0 = -1
			end

			originalPrint("AR CODE: " .. arg_39_0)
			arg_6_0:emit(Dorm3dPhotoMediator.GO_AR, arg_39_0)
		end)
	end)

	arg_6_0.activePanel = 1

	local var_6_0 = {
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

	table.Ipairs(var_6_0, function(arg_46_0, arg_46_1)
		onToggle(arg_6_0, arg_46_1.btn, function(arg_47_0)
			if not arg_47_0 then
				return
			end

			table.Ipairs(var_6_0, function(arg_48_0, arg_48_1)
				if arg_48_0 == arg_46_0 then
					return
				end

				arg_48_1.Off()
			end)

			arg_6_0.activePanel = arg_46_0

			arg_46_1.On()
		end, SFX_PANEL)
	end)
	;(function()
		local var_49_0 = {
			arg_6_0.panelAction:Find("Layout/Title/Regular"),
			arg_6_0.panelAction:Find("Layout/Title/Special")
		}

		triggerToggle(var_49_0[1], true)
	end)()
	;(function()
		local var_50_0 = {
			arg_6_0.panelLightning:Find("Layout/Title/Filter")
		}

		triggerToggle(var_50_0[1], true)
	end)()

	arg_6_0.zoneIndex = 1

	arg_6_0:InitData()
	arg_6_0:FirstEnterZone()
	triggerToggle(var_6_0[arg_6_0.activePanel].btn, true)
	arg_6_0:UpdateZoneList()
end

function var_0_0.InitData(arg_51_0)
	arg_51_0.cameraSettings = Clone(arg_51_0.scene:GetCameraSettings())
	arg_51_0.settingHideCharacter = false
	arg_51_0.settingFaceCamera = true
	arg_51_0.settingFilterIndex = nil
	arg_51_0.settingFilterStrength = 1

	arg_51_0:RefreshData()
end

function var_0_0.RefreshData(arg_52_0)
	local var_52_0 = arg_52_0.room:GetCameraZones()[arg_52_0.zoneIndex]

	arg_52_0.animID = var_52_0:GetRegularAnims()[1]:GetConfigID()

	local function var_52_1(arg_53_0, arg_53_1)
		arg_53_0.min = arg_53_1[1]
		arg_53_0.max = arg_53_1[2]
		arg_53_0.value = math.clamp(arg_53_0.value, arg_53_1[1], arg_53_1[2])
	end

	var_52_1(arg_52_0.cameraSettings.depthOfField.focusDistance, var_52_0:GetFocusDistanceRange())
	var_52_1(arg_52_0.cameraSettings.depthOfField.blurRadius, var_52_0:GetDepthOfFieldBlurRange())
	var_52_1(arg_52_0.cameraSettings.postExposure, var_52_0:GetExposureRange())
	var_52_1(arg_52_0.cameraSettings.contrast, var_52_0:GetContrastRange())
	var_52_1(arg_52_0.cameraSettings.saturate, var_52_0:GetSaturationRange())

	arg_52_0.animSpeeds = var_52_0:GetAnimSpeeds()
	arg_52_0.animSpeed = 1
end

function var_0_0.FirstEnterZone(arg_54_0)
	local var_54_0 = arg_54_0.room:GetCameraZones()[arg_54_0.zoneIndex]
	local var_54_1 = Dorm3dCameraAnim.New({
		configId = arg_54_0.animID
	})

	arg_54_0.scene:HideCharacter(arg_54_0.scene.apartment:GetConfigID())
	arg_54_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "EnterPhotoMode", var_54_0, var_54_1:GetStateName())
	arg_54_0:UpdateAnimSpeedPanel()
end

function var_0_0.SwitchZone(arg_55_0)
	local var_55_0 = arg_55_0.room:GetCameraZones()[arg_55_0.zoneIndex]
	local var_55_1 = Dorm3dCameraAnim.New({
		configId = arg_55_0.animID
	})

	arg_55_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SwitchCameraZone", var_55_0, var_55_1:GetStateName())

	if arg_55_0.timerAnim then
		arg_55_0.timerAnim:Stop()

		arg_55_0.timerAnim = nil
	end

	arg_55_0.animPlaying = nil

	arg_55_0:UpdateActionPanel()
	arg_55_0:UpdateCameraPanel()
	arg_55_0:UpdateLightingPanel()
	arg_55_0:UpdateAnimSpeedPanel()
	arg_55_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetCharacterAnimSpeed", arg_55_0.animSpeed)
end

function var_0_0.UpdateZoneList(arg_56_0)
	local var_56_0 = arg_56_0.room:GetCameraZones()

	local function var_56_1()
		setText(arg_56_0.btnZone:Find("Text"), var_56_0[arg_56_0.zoneIndex]:GetName())
		UIItemList.StaticAlign(arg_56_0.listZones:Find("List"), arg_56_0.listZones:Find("List"):GetChild(0), #var_56_0, function(arg_58_0, arg_58_1, arg_58_2)
			if arg_58_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_58_1 = arg_58_1 + 1

			local var_58_0 = var_56_0[arg_58_1]

			setText(arg_58_2:Find("Name"), var_58_0:GetName())

			local var_58_1 = arg_56_0.zoneIndex == arg_58_1 and Color.NewHex("5CCAFF") or Color.NewHex("FFFFFF99")

			setTextColor(arg_58_2:Find("Name"), var_58_1)
			setActive(arg_58_2:Find("Line"), arg_58_1 < #var_56_0)
		end)
	end

	var_56_1()
	UIItemList.StaticAlign(arg_56_0.listZones:Find("List"), arg_56_0.listZones:Find("List"):GetChild(0), #var_56_0, function(arg_59_0, arg_59_1, arg_59_2)
		if arg_59_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_59_1 = arg_59_1 + 1

		onButton(arg_56_0, arg_59_2, function()
			if arg_56_0.zoneIndex == arg_59_1 then
				return
			end

			arg_56_0.zoneIndex = arg_59_1

			arg_56_0:RefreshData()
			arg_56_0:SwitchZone()
			setActive(arg_56_0.listZones, false)
			var_56_1()
		end, SFX_PANEL)
	end)
end

local var_0_2 = 0.2

function var_0_0.UpdateActionPanel(arg_61_0)
	if not arg_61_0.activeSetting then
		return
	end

	if arg_61_0.activePanel ~= var_0_0.PANEL.ACTION then
		return
	end

	local var_61_0 = arg_61_0.room:GetCameraZones()[arg_61_0.zoneIndex]
	local var_61_1 = var_61_0:GetRegularAnims()
	local var_61_2 = arg_61_0.panelAction:Find("Layout/Regular/Scroll/Viewport/Content")
	local var_61_3 = var_61_0:GetAllSpecialList(arg_61_0.room.id)
	local var_61_4 = arg_61_0.panelAction:Find("Layout/Special/Scroll/Viewport/Content")
	local var_61_5 = #var_61_3 > 0

	setActive(arg_61_0.panelAction:Find("Layout/Title/Special"), var_61_5)

	local function var_61_6()
		UIItemList.StaticAlign(var_61_2, var_61_2:GetChild(0), #var_61_1, function(arg_63_0, arg_63_1, arg_63_2)
			if arg_63_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_63_1 = arg_63_1 + 1

			local var_63_0 = var_61_1[arg_63_1]

			setActive(arg_63_2:Find("Selected"), var_63_0:GetConfigID() == arg_61_0.animID)
			setActive(arg_63_2:Find("Slider"), var_63_0:GetConfigID() == arg_61_0.animID and tobool(arg_61_0.timerAnim))
		end)
		UIItemList.StaticAlign(var_61_4, var_61_4:GetChild(0), #var_61_3, function(arg_64_0, arg_64_1, arg_64_2)
			if arg_64_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_64_1 = arg_64_1 + 1

			local var_64_0 = var_61_3[arg_64_1].anims
			local var_64_1 = arg_64_2:Find("Actions")

			UIItemList.StaticAlign(var_64_1, var_64_1:GetChild(0), #var_64_0, function(arg_65_0, arg_65_1, arg_65_2)
				if arg_65_0 ~= UIItemList.EventUpdate then
					return
				end

				arg_65_1 = arg_65_1 + 1

				local var_65_0 = var_64_0[arg_65_1]

				setActive(arg_65_2:Find("Selected"), var_65_0:GetConfigID() == arg_61_0.animID)
				setActive(arg_65_2:Find("Slider"), var_65_0:GetConfigID() == arg_61_0.animID and tobool(arg_61_0.timerAnim))
			end)
		end)
	end

	local function var_61_7(arg_66_0, arg_66_1)
		if arg_61_0.animPlaying then
			return
		end

		local var_66_0 = arg_66_0:GetConfigID()

		if arg_61_0.animID == var_66_0 then
			return
		end

		local var_66_1 = arg_61_0:GetAnimPlayList(var_66_0)
		local var_66_2 = Dorm3dCameraAnim.New({
			configId = arg_61_0.animID
		}):GetFinishAnimID()

		arg_61_0.animID = var_66_0

		var_61_6()
		arg_61_0:BlockActionPanel(true)

		arg_61_0.animPlaying = true

		local var_66_3 = (table.indexof(var_66_1, _.detect(var_66_1, function(arg_67_0)
			return arg_67_0:GetConfigID() == var_66_2
		end)) or 0) + 1
		local var_66_4 = _.rest(var_66_1, var_66_3)
		local var_66_5 = arg_66_1:Find("Slider"):GetComponent(typeof(Slider))

		setActive(arg_66_1:Find("Slider"), true)

		local function var_66_6()
			setActive(arg_66_1:Find("Selected"), true)
			setActive(arg_66_1:Find("Slider"), false)
			arg_61_0:BlockActionPanel(false)

			arg_61_0.animPlaying = nil
		end

		if #var_66_4 == 0 then
			var_66_6()

			return
		end

		local var_66_7 = _.reduce(var_66_4, 0, function(arg_69_0, arg_69_1)
			return arg_69_0 + math.max(var_0_2, arg_69_1:GetAnimTime())
		end)

		if arg_61_0.timerAnim then
			arg_61_0.timerAnim:Stop()
		end

		arg_61_0.animInfo = {
			index = 1,
			passedTime = 0,
			ratio = 0,
			animPlayList = var_66_4,
			totalTime = var_66_7,
			startStamp = Time.time
		}
		arg_61_0.timerAnim = FrameTimer.New(function()
			local var_70_0 = arg_61_0.animInfo
			local var_70_1 = var_70_0.animPlayList[var_70_0.index]
			local var_70_2 = math.max(var_0_2, var_70_1:GetAnimTime())
			local var_70_3 = var_70_0.startStamp
			local var_70_4 = Time.time
			local var_70_5 = math.min(1, var_70_0.ratio + (var_70_4 - var_70_3) * arg_61_0.animSpeed / var_70_2)
			local var_70_6 = var_70_0.passedTime + var_70_2 * var_70_5

			var_66_5.value = var_70_6 / var_66_7

			if var_70_5 < 1 then
				return
			end

			var_70_0.index = var_70_0.index + 1
			var_70_0.ratio = 0
			var_70_0.passedTime = var_70_0.passedTime + var_70_2
			var_70_0.startStamp = var_70_4

			local var_70_7 = var_70_1:GetStartPoint()

			if #var_70_7 > 0 then
				arg_61_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetCharPoint", var_70_7)
			end

			arg_61_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SwitchPhotoCamera")
			warning(var_70_0.startStamp)

			if var_70_0.index > #var_70_0.animPlayList then
				var_66_6()
				arg_61_0.timerAnim:Stop()

				arg_61_0.timerAnim = nil
				arg_61_0.animInfo = nil

				return
			end

			local var_70_8 = var_70_0.animPlayList[var_70_0.index]

			arg_61_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "PlaySingleAction", var_70_8:GetStateName())
		end, 1, -1)

		local var_66_8 = arg_61_0.animInfo.animPlayList[1]

		if var_66_3 == 1 then
			arg_61_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SwitchAnim", var_66_8:GetStateName())
			onNextTick(function()
				local var_71_0 = var_66_8:GetStartPoint()

				if #var_71_0 == 0 then
					var_71_0 = var_61_0:GetWatchCameraName()
				end

				arg_61_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ResetCharPoint", var_71_0)
				arg_61_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SwitchPhotoCamera")
			end)
		else
			arg_61_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "PlaySingleAction", var_66_8:GetStateName())
		end

		arg_61_0.timerAnim:Start()
	end

	UIItemList.StaticAlign(var_61_2, var_61_2:GetChild(0), #var_61_1, function(arg_72_0, arg_72_1, arg_72_2)
		if arg_72_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_72_1 = arg_72_1 + 1

		local var_72_0 = var_61_1[arg_72_1]

		setText(arg_72_2:Find("Name"), var_72_0:GetName())
		GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_72_0:GetZoneIcon()), "", arg_72_2:Find("Icon"))
		setActive(arg_72_2:Find("Slider"), false)
		setActive(arg_72_2:Find("Selected"), false)
		onButton(arg_61_0, arg_72_2, function()
			var_61_7(var_72_0, arg_72_2)
		end)
	end)

	local function var_61_8()
		UIItemList.StaticAlign(var_61_4, var_61_4:GetChild(0), #var_61_3, function(arg_75_0, arg_75_1, arg_75_2)
			if arg_75_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_75_1 = arg_75_1 + 1

			local var_75_0 = var_61_3[arg_75_1].anims
			local var_75_1 = arg_75_2:Find("Actions")

			UIItemList.StaticAlign(var_75_1, var_75_1:GetChild(0), #var_75_0, function(arg_76_0, arg_76_1, arg_76_2)
				if arg_76_0 ~= UIItemList.EventUpdate then
					return
				end

				arg_76_1 = arg_76_1 + 1

				local var_76_0 = var_75_0[arg_76_1]

				setActive(arg_76_2:Find("Selected"), var_76_0:GetConfigID() == arg_61_0.animID)
				setActive(arg_76_2:Find("Slider"), var_76_0:GetConfigID() == arg_61_0.animID and tobool(arg_61_0.timerAnim))
			end)
		end)
	end

	local function var_61_9()
		UIItemList.StaticAlign(var_61_4, var_61_4:GetChild(0), #var_61_3, function(arg_78_0, arg_78_1, arg_78_2)
			if arg_78_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_78_1 = arg_78_1 + 1

			setActive(arg_78_2:Find("Button/Active"), arg_61_0.settingSpecialFurnitureIndex == arg_78_1)
			setActive(arg_78_2:Find("Actions"), arg_61_0.settingSpecialFurnitureIndex == arg_78_1)
		end)
		var_61_8()
	end

	arg_61_0.settingSpecialFurnitureIndex = nil

	local var_61_10 = arg_61_0.room:GetCameraZones()[arg_61_0.zoneIndex]

	local function var_61_11(arg_79_0, arg_79_1)
		local var_79_0 = arg_79_1:Find("Actions")
		local var_79_1 = arg_79_0.anims

		UIItemList.StaticAlign(var_79_0, var_79_0:GetChild(0), #var_79_1, function(arg_80_0, arg_80_1, arg_80_2)
			if arg_80_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_80_1 = arg_80_1 + 1

			local var_80_0 = var_79_1[arg_80_1]
			local var_80_1 = var_61_10:CheckFurnitureIdInZone(arg_79_0.furnitureId)
			local var_80_2 = arg_61_0.room:IsFurnitureSetIn(arg_79_0.furnitureId)
			local var_80_3 = var_80_1 and var_80_2

			SetActive(arg_80_2:Find("Other"), not var_80_3)
			SetActive(arg_80_2:Find("Name"), var_80_3)

			if var_80_3 then
				onButton(arg_61_0, arg_80_2, function()
					arg_61_0.room:ReplaceFurniture(arg_79_0.slotId, arg_79_0.furnitureId)
					arg_61_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RefreshSlots", arg_61_0.room)
					var_61_7(var_80_0, arg_80_2)
				end)
				setText(arg_80_2:Find("Name"), var_80_0:GetName())
			else
				removeOnButton(arg_80_2)

				if not var_80_1 then
					local var_80_4 = var_80_0:GetZoneName()

					warnText = i18n("dorm3d_photo_active_zone", var_80_4)
				else
					warnText = i18n("dorm3d_furniture_replace_tip")
				end

				setText(arg_80_2:Find("Other/Content"), warnText)
			end

			GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_80_0:GetZoneIcon()), "", arg_80_2:Find("Icon"))
			setActive(arg_80_2:Find("Slider"), false)
			setActive(arg_80_2:Find("Selected"), false)
		end)
	end

	setActive(var_61_4, #var_61_3 > 0)
	UIItemList.StaticAlign(var_61_4, var_61_4:GetChild(0), #var_61_3, function(arg_82_0, arg_82_1, arg_82_2)
		if arg_82_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_82_1 = arg_82_1 + 1

		local var_82_0 = var_61_3[arg_82_1]
		local var_82_1 = Dorm3dFurniture.New({
			configId = var_82_0.furnitureId
		})
		local var_82_2 = tobool(_.detect(arg_61_0.room:GetFurnitures(), function(arg_83_0)
			return arg_83_0:GetConfigID() == var_82_0.furnitureId
		end))

		setText(arg_82_2:Find("Button/Name"), var_82_1:GetName())
		GetImageSpriteFromAtlasAsync(var_82_1:GetIcon(), "", arg_82_2:Find("Button/Icon"))
		setActive(arg_82_2:Find("Button/Lock"), not var_82_2)
		setActive(arg_82_2:Find("Button/BG"), var_82_2)

		local var_82_3 = var_61_10:CheckFurnitureIdInZone(var_82_0.furnitureId)
		local var_82_4

		if var_82_3 then
			var_82_4 = Color.New(1, 1, 1, 0.8509803921568627)
		else
			var_82_4 = Color.New(0.788235294117647, 0.788235294117647, 0.788235294117647, 0.8509803921568627)
		end

		setImageColor(arg_82_2:Find("Button/BG"), var_82_4)
		onButton(arg_61_0, arg_82_2:Find("Button"), function()
			if not var_82_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_furniture_locked"))

				return
			end

			if arg_61_0.settingSpecialFurnitureIndex == arg_82_1 then
				arg_61_0.settingSpecialFurnitureIndex = nil
			else
				arg_61_0.settingSpecialFurnitureIndex = arg_82_1
			end

			var_61_11(var_82_0, arg_82_2, arg_82_1)
			var_61_9()
		end)
	end)
	var_61_9()
	var_61_6()
end

function var_0_0.BlockActionPanel(arg_85_0, arg_85_1)
	return
end

function var_0_0.GetAnimPlayList(arg_86_0, arg_86_1)
	local var_86_0 = arg_86_1
	local var_86_1 = {}

	while true do
		local var_86_2 = Dorm3dCameraAnim.New({
			configId = var_86_0
		})

		if not var_86_2 then
			return var_86_1
		end

		table.insert(var_86_1, 1, var_86_2)

		var_86_0 = var_86_2:GetPreAnimID()

		if var_86_0 == 0 then
			return var_86_1
		end
	end
end

function var_0_0.UpdateCameraPanel(arg_87_0)
	if not arg_87_0.activeSetting then
		return
	end

	if arg_87_0.activePanel ~= var_0_0.PANEL.CAMERA then
		return
	end

	;(function()
		local var_88_0 = arg_87_0.panelCamera:Find("Layout/DepthOfField/Switch/Toggle")

		triggerToggle(var_88_0, arg_87_0.cameraSettings.depthOfField.enabled)
		onToggle(arg_87_0, var_88_0, function(arg_89_0)
			arg_87_0.cameraSettings.depthOfField.enabled = arg_89_0

			setActive(arg_87_0.panelCamera:Find("Layout/DepthOfField/DepthOfField"), arg_87_0.cameraSettings.depthOfField.enabled)
			arg_87_0:RefreshCamera()
		end, SFX_UI_TAG, SFX_UI_CANCEL)
	end)()
	setActive(arg_87_0.panelCamera:Find("Layout/DepthOfField/DepthOfField"), arg_87_0.cameraSettings.depthOfField.enabled)
	;(function()
		local var_90_0 = arg_87_0.cameraSettings.depthOfField.focusDistance
		local var_90_1 = arg_87_0.panelCamera:Find("Layout/DepthOfField/DepthOfField/FocusDistance/Slider")

		setSlider(var_90_1, var_90_0.min, var_90_0.max, var_90_0.value)
		onSlider(arg_87_0, var_90_1, function(arg_91_0)
			var_90_0.value = arg_91_0

			arg_87_0:RefreshCamera()
		end)
	end)()
	;(function()
		local var_92_0 = arg_87_0.cameraSettings.depthOfField.blurRadius
		local var_92_1 = arg_87_0.panelCamera:Find("Layout/DepthOfField/DepthOfField/BlurRadius/Slider")

		setSlider(var_92_1, var_92_0.min, var_92_0.max, var_92_0.value)
		onSlider(arg_87_0, var_92_1, function(arg_93_0)
			var_92_0.value = arg_93_0

			arg_87_0:RefreshCamera()
		end)
	end)()

	local var_87_0 = {
		"PostExposure",
		"Saturation",
		"Contrast"
	}

	arg_87_0.paramIndex = arg_87_0.paramIndex or 1

	local function var_87_1()
		table.Ipairs(var_87_0, function(arg_95_0, arg_95_1)
			local var_95_0 = arg_87_0.panelCamera:Find("Layout/Paramaters/Icons"):GetChild(arg_95_0 - 1)

			setActive(var_95_0:Find("Selected"), arg_95_0 == arg_87_0.paramIndex)
			setActive(arg_87_0.panelCamera:Find("Layout/Paramaters/" .. arg_95_1), arg_95_0 == arg_87_0.paramIndex)
		end)
	end

	table.Ipairs(var_87_0, function(arg_96_0, arg_96_1)
		local var_96_0 = arg_87_0.panelCamera:Find("Layout/Paramaters/Icons"):GetChild(arg_96_0 - 1)

		onButton(arg_87_0, var_96_0, function()
			arg_87_0.paramIndex = arg_96_0

			var_87_1()
		end, SFX_PANEL)
	end)
	var_87_1()
	;(function()
		local var_98_0 = arg_87_0.cameraSettings.postExposure
		local var_98_1 = arg_87_0.panelCamera:Find("Layout/Paramaters/PostExposure/PostExposure/Slider")
		local var_98_2 = var_98_1:Find("Background/Fill")

		onSlider(arg_87_0, var_98_1, function(arg_99_0)
			var_98_0.value = arg_99_0

			local var_99_0 = (arg_99_0 - var_98_0.min) / (var_98_0.max - var_98_0.min)
			local var_99_1 = math.min(var_99_0, 0.5)
			local var_99_2 = math.max(var_99_0, 0.5)

			var_98_2.anchorMin = Vector2.New(var_99_1, 0)
			var_98_2.anchorMax = Vector2.New(var_99_2, 1)
			var_98_2.offsetMin = Vector2.zero
			var_98_2.offsetMax = Vector2.zero

			arg_87_0:RefreshCamera()
		end)
		setSlider(var_98_1, var_98_0.min, var_98_0.max, var_98_0.value)
	end)()
	;(function()
		local var_100_0 = arg_87_0.cameraSettings.contrast
		local var_100_1 = arg_87_0.panelCamera:Find("Layout/Paramaters/Contrast/Contrast/Slider")
		local var_100_2 = var_100_1:Find("Background/Fill")

		onSlider(arg_87_0, var_100_1, function(arg_101_0)
			var_100_0.value = arg_101_0

			local var_101_0 = (arg_101_0 - var_100_0.min) / (var_100_0.max - var_100_0.min)
			local var_101_1 = math.min(var_101_0, 0.5)
			local var_101_2 = math.max(var_101_0, 0.5)

			var_100_2.anchorMin = Vector2.New(var_101_1, 0)
			var_100_2.anchorMax = Vector2.New(var_101_2, 1)
			var_100_2.offsetMin = Vector2.zero
			var_100_2.offsetMax = Vector2.zero

			arg_87_0:RefreshCamera()
		end)
		setSlider(var_100_1, var_100_0.min, var_100_0.max, var_100_0.value)
	end)()
	;(function()
		local var_102_0 = arg_87_0.cameraSettings.saturate
		local var_102_1 = arg_87_0.panelCamera:Find("Layout/Paramaters/Saturation/Saturation/Slider")
		local var_102_2 = var_102_1:Find("Background/Fill")

		onSlider(arg_87_0, var_102_1, function(arg_103_0)
			var_102_0.value = arg_103_0

			local var_103_0 = (arg_103_0 - var_102_0.min) / (var_102_0.max - var_102_0.min)
			local var_103_1 = math.min(var_103_0, 0.5)
			local var_103_2 = math.max(var_103_0, 0.5)

			var_102_2.anchorMin = Vector2.New(var_103_1, 0)
			var_102_2.anchorMax = Vector2.New(var_103_2, 1)
			var_102_2.offsetMin = Vector2.zero
			var_102_2.offsetMax = Vector2.zero

			arg_87_0:RefreshCamera()
		end)
		setSlider(var_102_1, var_102_0.min, var_102_0.max, var_102_0.value)
	end)()
	;(function()
		local var_104_0 = arg_87_0.panelCamera:Find("Layout/Other/FaceCamera/Toggle")

		triggerToggle(var_104_0, arg_87_0.settingFaceCamera)
		onToggle(arg_87_0, var_104_0, function(arg_105_0)
			arg_87_0.settingFaceCamera = arg_105_0

			arg_87_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "EnableHeadIK", arg_105_0)
		end, SFX_UI_TAG, SFX_UI_CANCEL)
	end)()
	;(function()
		local var_106_0 = arg_87_0.panelCamera:Find("Layout/Other/HideCharacter/Toggle")

		triggerToggle(var_106_0, arg_87_0.settingHideCharacter)
		onToggle(arg_87_0, var_106_0, function(arg_107_0)
			arg_87_0.settingHideCharacter = arg_107_0

			if arg_107_0 then
				arg_87_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "HideCharacterBylayer")
			else
				arg_87_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCharacterBylayer")
			end
		end, SFX_UI_TAG, SFX_UI_CANCEL)
	end)()
end

function var_0_0.RefreshCamera(arg_108_0)
	arg_108_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SettingCamera", arg_108_0.cameraSettings)
end

function var_0_0.UpdateAnimSpeedPanel(arg_109_0)
	local function var_109_0()
		if not arg_109_0.timerAnim then
			return
		end

		local var_110_0 = arg_109_0.animInfo
		local var_110_1 = var_110_0.animPlayList[var_110_0.index]
		local var_110_2 = math.max(var_0_2, var_110_1:GetAnimTime())
		local var_110_3 = var_110_0.startStamp
		local var_110_4 = Time.time

		var_110_0.ratio = math.min(1, var_110_0.ratio + (var_110_4 - var_110_3) * arg_109_0.animSpeed / var_110_2)
		var_110_0.startStamp = var_110_4
	end

	local var_109_1 = arg_109_0.animSpeeds

	UIItemList.StaticAlign(arg_109_0.listAnimSpeed, arg_109_0.listAnimSpeed:GetChild(0), #var_109_1, function(arg_111_0, arg_111_1, arg_111_2)
		if arg_111_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_111_1 = #var_109_1 - arg_111_1

		local var_111_0 = var_109_1[arg_111_1]

		setText(arg_111_2:Find("Name"), var_111_0)
		setText(arg_111_2:Find("Selected"), var_111_0)
		setActive(arg_111_2:Find("Line"), arg_111_1 ~= #var_109_1)
		onButton(arg_109_0, arg_111_2, function()
			if arg_109_0.animSpeed == var_111_0 then
				return
			end

			var_109_0()

			arg_109_0.animSpeed = var_111_0

			arg_109_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetCharacterAnimSpeed", var_111_0)
			arg_109_0:UpdateAnimSpeedPanel()
		end, SFX_PANEL)
	end)
	onButton(arg_109_0, arg_109_0.btnFreeze, function()
		local var_113_0 = 0

		if arg_109_0.animSpeed ~= 0 then
			arg_109_0.lastAnimSpeed = arg_109_0.animSpeed
		else
			var_113_0 = arg_109_0.lastAnimSpeed or 1
			arg_109_0.lastAnimSpeed = nil
		end

		var_109_0()

		arg_109_0.animSpeed = var_113_0

		arg_109_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetCharacterAnimSpeed", var_113_0)
		arg_109_0:UpdateAnimSpeedPanel()
	end, SFX_PANEL)
	UIItemList.StaticAlign(arg_109_0.listAnimSpeed, arg_109_0.listAnimSpeed:GetChild(0), #var_109_1, function(arg_114_0, arg_114_1, arg_114_2)
		if arg_114_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_114_1 = #var_109_1 - arg_114_1

		local var_114_0 = var_109_1[arg_114_1]

		setActive(arg_114_2:Find("Name"), arg_109_0.animSpeed ~= var_114_0)
		setActive(arg_114_2:Find("Selected"), arg_109_0.animSpeed == var_114_0)
	end)
	setActive(arg_109_0.btnFreeze:Find("Icon"), arg_109_0.animSpeed ~= 0)
	setActive(arg_109_0.btnFreeze:Find("Selected"), arg_109_0.animSpeed == 0)
	setText(arg_109_0.textAnimSpeed, i18n("dorm3d_photo_animspeed", string.format("%.1f", arg_109_0.animSpeed)))
end

function var_0_0.UpdateLightingPanel(arg_115_0)
	if not arg_115_0.activeSetting then
		return
	end

	if arg_115_0.activePanel ~= var_0_0.PANEL.LIGHTING then
		return
	end

	local var_115_0 = {}

	for iter_115_0, iter_115_1 in ipairs(pg.dorm3d_camera_volume_template.all) do
		table.insert(var_115_0, iter_115_1)
	end

	table.sort(var_115_0, function(arg_116_0, arg_116_1)
		return arg_116_0 < arg_116_1
	end)

	local function var_115_1()
		if not arg_115_0.settingFilterIndex then
			arg_115_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertVolumeProfile")

			return
		end

		local var_117_0 = pg.dorm3d_camera_volume_template[var_115_0[arg_115_0.settingFilterIndex]]

		arg_115_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetVolumeProfile", var_117_0.volume, arg_115_0.settingFilterStrength)
	end

	UIItemList.StaticAlign(arg_115_0.panelLightning:Find("Layout/Filter/List"), arg_115_0.panelLightning:Find("Layout/Filter/List"):GetChild(0), #var_115_0, function(arg_118_0, arg_118_1, arg_118_2)
		if arg_118_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_118_1 = arg_118_1 + 1

		local var_118_0 = pg.dorm3d_camera_volume_template[var_115_0[arg_118_1]]

		setText(arg_118_2:Find("Name"), var_118_0.name)

		var_118_0.icon = ""

		if var_118_0.icon ~= "" then
			GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_118_0.icon), "", arg_118_2:Find("BG"))
		end

		if arg_115_0.settingFilterIndex == arg_118_1 then
			setActive(arg_118_2:Find("Selected"), true)
		else
			setActive(arg_118_2:Find("Selected"), false)
		end

		local var_118_1, var_118_2 = ApartmentProxy.CheckUnlockConfig(var_118_0.unlock)

		setActive(arg_118_2:Find("lock"), not var_118_1)

		if not var_118_1 then
			setText(arg_118_2:Find("lock/Image/Text"), var_118_0.unlock_text)
		end

		onButton(arg_115_0, arg_118_2, function()
			if not var_118_1 then
				pg.TipsMgr.GetInstance():ShowTips(var_118_2)

				return
			end

			local var_119_0 = arg_115_0.settingFilterIndex

			if arg_115_0.settingFilterIndex ~= arg_118_1 then
				arg_115_0.settingFilterIndex = arg_118_1
			else
				arg_115_0.settingFilterIndex = nil
			end

			var_115_1()

			if var_119_0 then
				local var_119_1 = arg_115_0.panelLightning:Find("Layout/Filter/List"):GetChild(var_119_0 - 1)

				setActive(var_119_1:Find("Selected"), false)
			end

			if arg_115_0.settingFilterIndex == arg_118_1 then
				setActive(arg_118_2:Find("Selected"), true)
			end
		end, SFX_PANEL)
	end)
	setActive(arg_115_0.panelLightning:Find("Layout/Filter/Slider"), false)
end

function var_0_0.SetMute(arg_120_0)
	if arg_120_0 then
		CriAtom.SetCategoryVolume("Category_CV", 0)
		CriAtom.SetCategoryVolume("Category_BGM", 0)
		CriAtom.SetCategoryVolume("Category_SE", 0)
	else
		CriAtom.SetCategoryVolume("Category_CV", pg.CriMgr.GetInstance():getCVVolume())
		CriAtom.SetCategoryVolume("Category_BGM", pg.CriMgr.GetInstance():getBGMVolume())
		CriAtom.SetCategoryVolume("Category_SE", pg.CriMgr.GetInstance():getSEVolume())
	end
end

function var_0_0.willExit(arg_121_0)
	if arg_121_0.timerAnim then
		arg_121_0.timerAnim:Stop()

		arg_121_0.timerAnim = nil
	end

	if arg_121_0.animSpeed ~= 1 then
		arg_121_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "SetCharacterAnimSpeed", 1)
	end

	if arg_121_0.settingHideCharacter then
		arg_121_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCharacterBylayer")
	end

	if not arg_121_0.settingFaceCamera then
		arg_121_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "EnableHeadIK", true)
	end

	arg_121_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCharacterLight")
	arg_121_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertVolumeProfile")
	arg_121_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "RevertCameraSettings")
	arg_121_0.scene:emit(Dorm3dRoomTemplateScene.PHOTO_CALL, "ExitPhotoMode")
	arg_121_0.scene:RevertCharacter(arg_121_0.scene.apartment:GetConfigID())
end

function var_0_0.SetCamaraPinchSliderValue(arg_122_0, arg_122_1)
	local var_122_0 = arg_122_0.normalPanel:Find("Zoom/Slider")

	setSlider(var_122_0, 0, 1, 1 - (arg_122_1 - 0.5) / 0.5)
end

return var_0_0
