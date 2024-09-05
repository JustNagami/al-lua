local var_0_0 = class("Dorm3dPhotoLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dPhotoUI"
end

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
	setText(arg_2_0.panelLightning:Find("Layout/Title/Lighting/Name"), i18n("dorm3d_photo_lighting"))
	setText(arg_2_0.panelLightning:Find("Layout/Title/Lighting/Selected"), i18n("dorm3d_photo_lighting"))
	setText(arg_2_0.panelLightning:Find("Layout/Title/Filter/Name"), i18n("dorm3d_photo_filter"))
	setText(arg_2_0.panelLightning:Find("Layout/Title/Filter/Selected"), i18n("dorm3d_photo_filter"))
	setText(arg_2_0.panelLightning:Find("Layout/Lighting/Strength/Name"), i18n("dorm3d_photo_strength"))
	setText(arg_2_0.panelAction:Find("Layout/Title/Regular/Name"), i18n("dorm3d_photo_regular_anim"))
	setText(arg_2_0.panelAction:Find("Layout/Title/Regular/Selected"), i18n("dorm3d_photo_regular_anim"))
	setText(arg_2_0.panelAction:Find("Layout/Title/Special/Name"), i18n("dorm3d_photo_special_anim"))
	setText(arg_2_0.panelAction:Find("Layout/Title/Special/Selected"), i18n("dorm3d_photo_special_anim"))
end

function var_0_0.SetSceneRoot(arg_3_0, arg_3_1)
	arg_3_0.scene = arg_3_1
end

function var_0_0.SetApartment(arg_4_0, arg_4_1)
	arg_4_0.apartment = arg_4_1:clone()
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
		local var_8_0 = (1 - arg_8_0) * 0.5 + 0.5

		arg_6_0.scene:SetPinchValue(var_8_0)
	end)

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
		arg_6_0.scene:ResetPhotoCameraPosition()
	end, SFX_PANEL)

	arg_6_0.recordState = false

	onButton(arg_6_0, arg_6_0.btnFilm, function()
		local function var_14_0(arg_15_0)
			setActive(arg_6_0.centerPanel, arg_15_0)
		end

		if not arg_6_0.recordState then
			local function var_14_1(arg_16_0)
				if arg_16_0 ~= -1 then
					-- block empty
				end
			end

			local function var_14_2(arg_17_0)
				warning("开始录屏结果：" .. tostring(arg_17_0))
			end

			seriesAsync({
				function(arg_18_0)
					CameraHelper.Request3DDorm(arg_18_0, nil)
				end,
				function(arg_19_0)
					arg_6_0.recordState = true

					var_14_0(false)
					setActive(arg_6_0.filmTime, true)
					setActive(arg_6_0._tf:Find("RightTop/Film/Switch"), false)
					var_0_0.SetMute(true)
					arg_6_0.ysScreenRecorder:BeforeStart()
					arg_6_0.ysScreenRecorder:StartRecord(var_14_2, var_14_1)

					if PLATFORM_CODE == PLATFORM_JP and pg.SdkMgr.GetInstance():GetChannelUID() == "2" then
						print("start recording : play sound")
						NotificationMgr.Inst:PlayStartRecordSound()
					end

					local var_19_0 = 0

					setText(arg_6_0.filmTime:Find("Text"), pg.TimeMgr.DescCDTime(nil, var_19_0))

					arg_6_0.filmTimer = Timer.New(function()
						var_19_0 = var_19_0 + 1

						setText(arg_6_0.filmTime:Find("Text"), pg.TimeMgr.DescCDTime(nil, var_19_0))
					end, 1, -1)

					arg_6_0.filmTimer:Start()
				end
			})
		else
			arg_6_0.recordState = false

			local function var_14_3(arg_21_0)
				warning("结束录屏结果：" .. tostring(arg_21_0))
			end

			seriesAsync({
				function(arg_22_0)
					arg_6_0.ysScreenRecorder:StopRecord(var_14_3)

					if PLATFORM == PLATFORM_ANDROID then
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							content = i18n("word_save_video"),
							onNo = function()
								arg_6_0.ysScreenRecorder:DiscardVideo()
							end,
							onYes = function()
								local var_24_0 = arg_6_0.ysScreenRecorder:GetVideoFilePath()

								MediaSaver.SaveVideoWithPath(var_24_0)
							end
						})
					end

					var_14_0(true)
					setActive(arg_6_0.filmTime, false)
					setActive(arg_6_0._tf:Find("RightTop/Film/Switch"), true)
					var_0_0.SetMute(false)

					if arg_6_0.filmTimer then
						arg_6_0.filmTimer:Stop()

						arg_6_0.filmTimer = nil
					end

					local var_22_0 = arg_6_0.apartment:GetCameraZones()[arg_6_0.zoneIndex]
					local var_22_1 = Dorm3dCameraAnim.New({
						configId = arg_6_0.animID
					})

					pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCamera(arg_6_0.apartment:GetConfigID(), 2, Dorm3dTrackCommand.BuildCameraMsg(var_22_0:GetName(), var_22_1:GetStateName(), arg_6_0.cameraSettings.depthOfField.focusDistance.value, arg_6_0.cameraSettings.depthOfField.blurRadius.value, arg_6_0.cameraSettings.postExposure.value, arg_6_0.cameraSettings.contrast.value, arg_6_0.cameraSettings.saturate.value)))
				end
			})
		end
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0._tf:Find("RightTop/Film/Switch"), function()
		GetOrAddComponent(arg_6_0._tf:Find("RightTop/Film"), typeof(CanvasGroup)).blocksRaycasts = false

		quickPlayAnimation(arg_6_0._tf:Find("RightTop"), "anim_dorm3d_photo_FtoS")
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0._tf:Find("RightTop/Shot/Shot"), function()
		local function var_26_0(arg_27_0)
			setActive(arg_6_0.centerPanel, arg_27_0)
			setActive(arg_6_0._tf:Find("RightTop"), arg_27_0)

			if PlayerPrefs.GetInt(SHOW_TOUCH_EFFECT, 1) > 0 then
				setActive(pg.UIMgr.GetInstance().OverlayEffect, arg_27_0)
			end
		end

		var_26_0(false)

		local var_26_1 = arg_6_0.shareUI:Find("deck")

		setActive(var_26_1, true)

		local var_26_2 = pg.share_template[pg.ShareMgr.TypeDorm3dPhoto]
		local var_26_3 = {
			1,
			0,
			1,
			0
		}

		var_26_1.anchorMin = Vector2(var_26_3[1], var_26_3[2])
		var_26_1.anchorMax = Vector2(var_26_3[3], var_26_3[4])
		var_26_1.anchoredPosition3D = Vector3(var_26_2.qrcode_location[1], var_26_2.qrcode_location[2], -100)
		var_26_1.anchoredPosition = Vector2(var_26_2.qrcode_location[1], var_26_2.qrcode_location[2])

		pg.ShareMgr.GetInstance():UpdateDeck(var_26_1)

		local function var_26_4(arg_28_0)
			warning("截图结果：" .. tostring(arg_28_0))
			var_26_0(true)
		end

		local function var_26_5(arg_29_0)
			local var_29_0 = UnityEngine.Texture2D.New(Screen.width, Screen.height)

			Tex2DExtension.LoadImage(var_29_0, arg_29_0)
			arg_6_0:emit(Dorm3dPhotoMediator.SHARE_PANEL, var_29_0, arg_29_0)

			if PLATFORM_CODE == PLATFORM_JP and pg.SdkMgr.GetInstance():GetChannelUID() == "2" then
				print("start photo : play sound")
				NotificationMgr.Inst:PlayShutterSound()
			end

			local var_29_1 = arg_6_0.apartment:GetCameraZones()[arg_6_0.zoneIndex]
			local var_29_2 = Dorm3dCameraAnim.New({
				configId = arg_6_0.animID
			})

			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCamera(arg_6_0.apartment:GetConfigID(), 1, Dorm3dTrackCommand.BuildCameraMsg(var_29_1:GetName(), var_29_2:GetStateName(), arg_6_0.cameraSettings.depthOfField.focusDistance.value, arg_6_0.cameraSettings.depthOfField.blurRadius.value, arg_6_0.cameraSettings.postExposure.value, arg_6_0.cameraSettings.contrast.value, arg_6_0.cameraSettings.saturate.value)))
		end

		arg_6_0.ysScreenShoter:TakeScreenShotData(var_26_4, var_26_5)
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
		local var_32_0 = isActive(arg_6_0.listZones)

		setActive(arg_6_0.listZones, not var_32_0)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.zoneMask, function()
		setActive(arg_6_0.listZones, false)
	end)

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

	table.Ipairs(var_6_1, function(arg_40_0, arg_40_1)
		onToggle(arg_6_0, arg_40_1.btn, function(arg_41_0)
			if not arg_41_0 then
				return
			end

			table.Ipairs(var_6_1, function(arg_42_0, arg_42_1)
				if arg_42_0 == arg_40_0 then
					return
				end

				arg_42_1.Off()
			end)

			arg_6_0.activePanel = arg_40_0

			arg_40_1.On()
		end, SFX_PANEL)
	end)
	;(function()
		local var_43_0 = {
			arg_6_0.panelAction:Find("Layout/Title/Regular"),
			arg_6_0.panelAction:Find("Layout/Title/Special")
		}

		triggerToggle(var_43_0[1], true)
	end)()
	;(function()
		local var_44_0 = {
			arg_6_0.panelLightning:Find("Layout/Title/Lighting"),
			arg_6_0.panelLightning:Find("Layout/Title/Filter")
		}

		triggerToggle(var_44_0[1], true)
	end)()

	arg_6_0.zoneIndex = 1

	arg_6_0:InitData()
	arg_6_0:FirstEnterZone()
	triggerToggle(var_6_1[arg_6_0.activePanel].btn, true)
	arg_6_0:UpdateZoneList()
end

function var_0_0.InitData(arg_45_0)
	arg_45_0.cameraSettings = Clone(arg_45_0.scene:GetCameraSettings())
	arg_45_0.settingHideCharacter = false
	arg_45_0.settingFaceCamera = true
	arg_45_0.settingLightingColorIndex = nil
	arg_45_0.adjustColor = Color.white
	arg_45_0.adjustColorHsv = {
		h = 0,
		s = 0,
		v = 1
	}
	arg_45_0.settingLightingStrength = 1
	arg_45_0.settingLightingAlpha = 1
	arg_45_0.settingFilterIndex = nil
	arg_45_0.settingFilterStrength = 1

	arg_45_0:RefreshData()
end

function var_0_0.RefreshData(arg_46_0)
	local var_46_0 = arg_46_0.apartment:GetCameraZones()[arg_46_0.zoneIndex]

	arg_46_0.animID = var_46_0:GetRegularAnims()[1]:GetConfigID()

	local function var_46_1(arg_47_0, arg_47_1)
		arg_47_0.min = arg_47_1[1]
		arg_47_0.max = arg_47_1[2]
		arg_47_0.value = math.clamp(arg_47_0.value, arg_47_1[1], arg_47_1[2])
	end

	var_46_1(arg_46_0.cameraSettings.depthOfField.focusDistance, var_46_0:GetFocusDistanceRange())
	var_46_1(arg_46_0.cameraSettings.depthOfField.blurRadius, var_46_0:GetDepthOfFieldBlurRange())
	var_46_1(arg_46_0.cameraSettings.postExposure, var_46_0:GetExposureRange())
	var_46_1(arg_46_0.cameraSettings.contrast, var_46_0:GetContrastRange())
	var_46_1(arg_46_0.cameraSettings.saturate, var_46_0:GetSaturationRange())

	arg_46_0.animSpeeds = var_46_0:GetAnimSpeeds()
	arg_46_0.animSpeed = 1
end

function var_0_0.FirstEnterZone(arg_48_0)
	local var_48_0 = arg_48_0.apartment:GetCameraZones()[arg_48_0.zoneIndex]
	local var_48_1 = Dorm3dCameraAnim.New({
		configId = arg_48_0.animID
	})

	arg_48_0.scene:EnterPhotoMode(var_48_0, var_48_1:GetStateName())
	arg_48_0:UpdateAnimSpeedPanel()
end

function var_0_0.SwitchZone(arg_49_0)
	local var_49_0 = arg_49_0.apartment:GetCameraZones()[arg_49_0.zoneIndex]
	local var_49_1 = Dorm3dCameraAnim.New({
		configId = arg_49_0.animID
	})

	arg_49_0.scene:SwitchCameraZone(var_49_0, var_49_1:GetStateName())

	if arg_49_0.timerAnim then
		arg_49_0.timerAnim:Stop()

		arg_49_0.timerAnim = nil
	end

	arg_49_0.animPlaying = nil

	arg_49_0:UpdateActionPanel()
	arg_49_0:UpdateCameraPanel()
	arg_49_0:UpdateLightingPanel()
	arg_49_0:UpdateAnimSpeedPanel()
	arg_49_0.scene:SetCharacterAnimSpeed(arg_49_0.animSpeed)
end

function var_0_0.UpdateZoneList(arg_50_0)
	local var_50_0 = arg_50_0.apartment:GetCameraZones()

	local function var_50_1()
		setText(arg_50_0.btnZone:Find("Text"), var_50_0[arg_50_0.zoneIndex]:GetName())
		UIItemList.StaticAlign(arg_50_0.listZones:Find("List"), arg_50_0.listZones:Find("List"):GetChild(0), #var_50_0, function(arg_52_0, arg_52_1, arg_52_2)
			if arg_52_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_52_1 = arg_52_1 + 1

			local var_52_0 = var_50_0[arg_52_1]

			setText(arg_52_2:Find("Name"), var_52_0:GetName())

			local var_52_1 = arg_50_0.zoneIndex == arg_52_1 and Color.NewHex("5CCAFF") or Color.NewHex("FFFFFF99")

			setTextColor(arg_52_2:Find("Name"), var_52_1)
			setActive(arg_52_2:Find("Line"), arg_52_1 < #var_50_0)
		end)
	end

	var_50_1()
	UIItemList.StaticAlign(arg_50_0.listZones:Find("List"), arg_50_0.listZones:Find("List"):GetChild(0), #var_50_0, function(arg_53_0, arg_53_1, arg_53_2)
		if arg_53_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_53_1 = arg_53_1 + 1

		onButton(arg_50_0, arg_53_2, function()
			if arg_50_0.zoneIndex == arg_53_1 then
				return
			end

			arg_50_0.zoneIndex = arg_53_1

			arg_50_0:RefreshData()
			arg_50_0:SwitchZone()
			setActive(arg_50_0.listZones, false)
			var_50_1()
		end, SFX_PANEL)
	end)
end

local var_0_1 = 0.2

function var_0_0.UpdateActionPanel(arg_55_0)
	if not arg_55_0.activeSetting then
		return
	end

	if arg_55_0.activePanel ~= var_0_0.PANEL.ACTION then
		return
	end

	local var_55_0 = arg_55_0.apartment:GetCameraZones()[arg_55_0.zoneIndex]
	local var_55_1 = var_55_0:GetRegularAnims()
	local var_55_2 = arg_55_0.panelAction:Find("Layout/Regular/Scroll/Viewport/Content")
	local var_55_3 = var_55_0:GetAllSpecialList()
	local var_55_4 = arg_55_0.panelAction:Find("Layout/Special/Scroll/Viewport/Content")

	local function var_55_5()
		UIItemList.StaticAlign(var_55_2, var_55_2:GetChild(0), #var_55_1, function(arg_57_0, arg_57_1, arg_57_2)
			if arg_57_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_57_1 = arg_57_1 + 1

			local var_57_0 = var_55_1[arg_57_1]

			setActive(arg_57_2:Find("Selected"), var_57_0:GetConfigID() == arg_55_0.animID)
			setActive(arg_57_2:Find("Slider"), var_57_0:GetConfigID() == arg_55_0.animID and tobool(arg_55_0.timerAnim))
		end)
		UIItemList.StaticAlign(var_55_4, var_55_4:GetChild(0), #var_55_3, function(arg_58_0, arg_58_1, arg_58_2)
			if arg_58_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_58_1 = arg_58_1 + 1

			local var_58_0 = var_55_3[arg_58_1].anims
			local var_58_1 = arg_58_2:Find("Actions")

			UIItemList.StaticAlign(var_58_1, var_58_1:GetChild(0), #var_58_0, function(arg_59_0, arg_59_1, arg_59_2)
				if arg_59_0 ~= UIItemList.EventUpdate then
					return
				end

				arg_59_1 = arg_59_1 + 1

				local var_59_0 = var_58_0[arg_59_1]

				setActive(arg_59_2:Find("Selected"), var_59_0:GetConfigID() == arg_55_0.animID)
				setActive(arg_59_2:Find("Slider"), var_59_0:GetConfigID() == arg_55_0.animID and tobool(arg_55_0.timerAnim))
			end)
		end)
	end

	local function var_55_6(arg_60_0, arg_60_1)
		if arg_55_0.animPlaying then
			return
		end

		local var_60_0 = arg_60_0:GetConfigID()

		if arg_55_0.animID == var_60_0 then
			return
		end

		local var_60_1 = arg_55_0:GetAnimPlayList(var_60_0)
		local var_60_2 = Dorm3dCameraAnim.New({
			configId = arg_55_0.animID
		}):GetFinishAnimID()

		arg_55_0.animID = var_60_0

		var_55_5()
		arg_55_0:BlockActionPanel(true)

		arg_55_0.animPlaying = true

		local var_60_3 = (table.indexof(var_60_1, _.detect(var_60_1, function(arg_61_0)
			return arg_61_0:GetConfigID() == var_60_2
		end)) or 0) + 1
		local var_60_4 = _.rest(var_60_1, var_60_3)
		local var_60_5 = arg_60_1:Find("Slider"):GetComponent(typeof(Slider))

		setActive(arg_60_1:Find("Slider"), true)

		local function var_60_6()
			setActive(arg_60_1:Find("Selected"), true)
			setActive(arg_60_1:Find("Slider"), false)
			arg_55_0:BlockActionPanel(false)

			arg_55_0.animPlaying = nil
		end

		if #var_60_4 == 0 then
			var_60_6()

			return
		end

		local var_60_7 = _.reduce(var_60_4, 0, function(arg_63_0, arg_63_1)
			return arg_63_0 + math.max(var_0_1, arg_63_1:GetAnimTime())
		end)

		if arg_55_0.timerAnim then
			arg_55_0.timerAnim:Stop()
		end

		arg_55_0.animInfo = {
			index = 1,
			passedTime = 0,
			ratio = 0,
			animPlayList = var_60_4,
			totalTime = var_60_7,
			startStamp = Time.time
		}
		arg_55_0.timerAnim = FrameTimer.New(function()
			local var_64_0 = arg_55_0.animInfo
			local var_64_1 = var_64_0.animPlayList[var_64_0.index]
			local var_64_2 = math.max(var_0_1, var_64_1:GetAnimTime())
			local var_64_3 = var_64_0.startStamp
			local var_64_4 = Time.time
			local var_64_5 = math.min(1, var_64_0.ratio + (var_64_4 - var_64_3) * arg_55_0.animSpeed / var_64_2)
			local var_64_6 = var_64_0.passedTime + var_64_2 * var_64_5

			var_60_5.value = var_64_6 / var_60_7

			if var_64_5 < 1 then
				return
			end

			var_64_0.index = var_64_0.index + 1
			var_64_0.ratio = 0
			var_64_0.passedTime = var_64_0.passedTime + var_64_2
			var_64_0.startStamp = var_64_4

			arg_55_0.scene:SwitchPhotoCamera()
			warning(var_64_0.startStamp)

			if var_64_0.index > #var_64_0.animPlayList then
				var_60_6()
				arg_55_0.timerAnim:Stop()

				arg_55_0.timerAnim = nil
				arg_55_0.animInfo = nil

				return
			end

			local var_64_7 = var_64_0.animPlayList[var_64_0.index]

			arg_55_0.scene:PlaySingleAction(var_64_7:GetStateName())
		end, 1, -1)

		local var_60_8 = arg_55_0.animInfo.animPlayList[1]

		if var_60_3 == 1 then
			arg_55_0.scene:SwitchAnim(var_60_8:GetStateName())
			onNextTick(function()
				arg_55_0.scene:ResetCharPosByZone(var_55_0)
				arg_55_0.scene:SwitchPhotoCamera()
			end)
		else
			arg_55_0.scene:PlaySingleAction(var_60_8:GetStateName())
		end

		arg_55_0.timerAnim:Start()
	end

	UIItemList.StaticAlign(var_55_2, var_55_2:GetChild(0), #var_55_1, function(arg_66_0, arg_66_1, arg_66_2)
		if arg_66_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_66_1 = arg_66_1 + 1

		local var_66_0 = var_55_1[arg_66_1]

		setText(arg_66_2:Find("Name"), var_66_0:GetName())
		GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_66_0:GetZoneIcon()), "", arg_66_2:Find("Icon"))
		setActive(arg_66_2:Find("Slider"), false)
		setActive(arg_66_2:Find("Selected"), false)
		onButton(arg_55_0, arg_66_2, function()
			var_55_6(var_66_0, arg_66_2)
		end)
	end)

	local function var_55_7()
		UIItemList.StaticAlign(var_55_4, var_55_4:GetChild(0), #var_55_3, function(arg_69_0, arg_69_1, arg_69_2)
			if arg_69_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_69_1 = arg_69_1 + 1

			setActive(arg_69_2:Find("Button/Active"), arg_55_0.settingSpecialFurnitureIndex == arg_69_1)
			setActive(arg_69_2:Find("Actions"), arg_55_0.settingSpecialFurnitureIndex == arg_69_1)
		end)
	end

	arg_55_0.settingSpecialFurnitureIndex = nil

	local var_55_8 = arg_55_0.apartment:GetCameraZones()[arg_55_0.zoneIndex]

	local function var_55_9(arg_70_0, arg_70_1)
		local var_70_0 = arg_70_1:Find("Actions")
		local var_70_1 = arg_70_0.anims

		UIItemList.StaticAlign(var_70_0, var_70_0:GetChild(0), #var_70_1, function(arg_71_0, arg_71_1, arg_71_2)
			if arg_71_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_71_1 = arg_71_1 + 1

			local var_71_0 = var_70_1[arg_71_1]
			local var_71_1 = var_55_8:CheckFurnitureIdInZone(arg_70_0.furnitureId)

			SetActive(arg_71_2:Find("Other"), not var_71_1)
			SetActive(arg_71_2:Find("Name"), var_71_1)

			if var_71_1 then
				onButton(arg_55_0, arg_71_2, function()
					arg_55_0.apartment:ReplaceFurniture(arg_70_0.slotId, arg_70_0.furnitureId)
					arg_55_0.scene:RefreshSlots(arg_55_0.apartment)
					var_55_6(var_71_0, arg_71_2)
				end)
				setText(arg_71_2:Find("Name"), var_71_0:GetName())
			else
				removeOnButton(arg_71_2)

				local var_71_2 = var_71_0:GetZoneName()

				setText(arg_71_2:Find("Other/Content"), i18n("dorm3d_photo_active_zone", var_71_2))
			end

			GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_71_0:GetZoneIcon()), "", arg_71_2:Find("Icon"))
			setActive(arg_71_2:Find("Slider"), false)
			setActive(arg_71_2:Find("Selected"), false)
		end)
	end

	setActive(var_55_4, #var_55_3 > 0)
	UIItemList.StaticAlign(var_55_4, var_55_4:GetChild(0), #var_55_3, function(arg_73_0, arg_73_1, arg_73_2)
		if arg_73_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_73_1 = arg_73_1 + 1

		local var_73_0 = var_55_3[arg_73_1]
		local var_73_1 = Dorm3dFurniture.New({
			configId = var_73_0.furnitureId
		})
		local var_73_2 = tobool(_.detect(arg_55_0.apartment:GetFurnitures(), function(arg_74_0)
			return arg_74_0:GetConfigID() == var_73_0.furnitureId
		end))

		setText(arg_73_2:Find("Button/Name"), var_73_1:GetName())
		GetImageSpriteFromAtlasAsync(var_73_1:GetIcon(), "", arg_73_2:Find("Button/Icon"))
		setActive(arg_73_2:Find("Button/Lock"), not var_73_2)
		setActive(arg_73_2:Find("Button/BG"), var_73_2)

		local var_73_3 = var_55_8:CheckFurnitureIdInZone(var_73_0.furnitureId)
		local var_73_4

		if var_73_3 then
			var_73_4 = Color.New(1, 1, 1, 0.8509803921568627)
		else
			var_73_4 = Color.New(0.788235294117647, 0.788235294117647, 0.788235294117647, 0.8509803921568627)
		end

		setImageColor(arg_73_2:Find("Button/BG"), var_73_4)
		onButton(arg_55_0, arg_73_2:Find("Button"), function()
			if not var_73_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_photo_furniture_lock"))

				return
			end

			if arg_55_0.settingSpecialFurnitureIndex == arg_73_1 then
				arg_55_0.settingSpecialFurnitureIndex = nil
			else
				arg_55_0.settingSpecialFurnitureIndex = arg_73_1
			end

			var_55_9(var_73_0, arg_73_2, arg_73_1)
			var_55_7()
		end)
	end)
	var_55_7()
	var_55_5()
end

function var_0_0.BlockActionPanel(arg_76_0, arg_76_1)
	return
end

function var_0_0.GetAnimPlayList(arg_77_0, arg_77_1)
	local var_77_0 = arg_77_1
	local var_77_1 = {}

	while true do
		local var_77_2 = Dorm3dCameraAnim.New({
			configId = var_77_0
		})

		if not var_77_2 then
			return var_77_1
		end

		table.insert(var_77_1, 1, var_77_2)

		var_77_0 = var_77_2:GetPreAnimID()

		if var_77_0 == 0 then
			return var_77_1
		end
	end
end

function var_0_0.UpdateCameraPanel(arg_78_0)
	if not arg_78_0.activeSetting then
		return
	end

	if arg_78_0.activePanel ~= var_0_0.PANEL.CAMERA then
		return
	end

	;(function()
		local var_79_0 = arg_78_0.panelCamera:Find("Layout/DepthOfField/Switch/Toggle")

		triggerToggle(var_79_0, arg_78_0.cameraSettings.depthOfField.enabled)
		onToggle(arg_78_0, var_79_0, function(arg_80_0)
			arg_78_0.cameraSettings.depthOfField.enabled = arg_80_0

			setActive(arg_78_0.panelCamera:Find("Layout/DepthOfField/DepthOfField"), arg_78_0.cameraSettings.depthOfField.enabled)
			arg_78_0:RefreshCamera()
		end, SFX_UI_TAG, SFX_UI_CANCEL)
	end)()
	setActive(arg_78_0.panelCamera:Find("Layout/DepthOfField/DepthOfField"), arg_78_0.cameraSettings.depthOfField.enabled)
	;(function()
		local var_81_0 = arg_78_0.cameraSettings.depthOfField.focusDistance
		local var_81_1 = arg_78_0.panelCamera:Find("Layout/DepthOfField/DepthOfField/FocusDistance/Slider")

		setSlider(var_81_1, var_81_0.min, var_81_0.max, var_81_0.value)
		onSlider(arg_78_0, var_81_1, function(arg_82_0)
			var_81_0.value = arg_82_0

			arg_78_0:RefreshCamera()
		end)
	end)()
	;(function()
		local var_83_0 = arg_78_0.cameraSettings.depthOfField.blurRadius
		local var_83_1 = arg_78_0.panelCamera:Find("Layout/DepthOfField/DepthOfField/BlurRadius/Slider")

		setSlider(var_83_1, var_83_0.min, var_83_0.max, var_83_0.value)
		onSlider(arg_78_0, var_83_1, function(arg_84_0)
			var_83_0.value = arg_84_0

			arg_78_0:RefreshCamera()
		end)
	end)()

	local var_78_0 = {
		"PostExposure",
		"Saturation",
		"Contrast"
	}

	arg_78_0.paramIndex = arg_78_0.paramIndex or 1

	local function var_78_1()
		table.Ipairs(var_78_0, function(arg_86_0, arg_86_1)
			local var_86_0 = arg_78_0.panelCamera:Find("Layout/Paramaters/Icons"):GetChild(arg_86_0 - 1)

			setActive(var_86_0:Find("Selected"), arg_86_0 == arg_78_0.paramIndex)
			setActive(arg_78_0.panelCamera:Find("Layout/Paramaters/" .. arg_86_1), arg_86_0 == arg_78_0.paramIndex)
		end)
	end

	table.Ipairs(var_78_0, function(arg_87_0, arg_87_1)
		local var_87_0 = arg_78_0.panelCamera:Find("Layout/Paramaters/Icons"):GetChild(arg_87_0 - 1)

		onButton(arg_78_0, var_87_0, function()
			arg_78_0.paramIndex = arg_87_0

			var_78_1()
		end, SFX_PANEL)
	end)
	var_78_1()
	;(function()
		local var_89_0 = arg_78_0.cameraSettings.postExposure
		local var_89_1 = arg_78_0.panelCamera:Find("Layout/Paramaters/PostExposure/PostExposure/Slider")
		local var_89_2 = var_89_1:Find("Background/Fill")

		onSlider(arg_78_0, var_89_1, function(arg_90_0)
			var_89_0.value = arg_90_0

			local var_90_0 = (arg_90_0 - var_89_0.min) / (var_89_0.max - var_89_0.min)
			local var_90_1 = math.min(var_90_0, 0.5)
			local var_90_2 = math.max(var_90_0, 0.5)

			var_89_2.anchorMin = Vector2.New(var_90_1, 0)
			var_89_2.anchorMax = Vector2.New(var_90_2, 1)
			var_89_2.offsetMin = Vector2.zero
			var_89_2.offsetMax = Vector2.zero

			arg_78_0:RefreshCamera()
		end)
		setSlider(var_89_1, var_89_0.min, var_89_0.max, var_89_0.value)
	end)()
	;(function()
		local var_91_0 = arg_78_0.cameraSettings.contrast
		local var_91_1 = arg_78_0.panelCamera:Find("Layout/Paramaters/Contrast/Contrast/Slider")
		local var_91_2 = var_91_1:Find("Background/Fill")

		onSlider(arg_78_0, var_91_1, function(arg_92_0)
			var_91_0.value = arg_92_0

			local var_92_0 = (arg_92_0 - var_91_0.min) / (var_91_0.max - var_91_0.min)
			local var_92_1 = math.min(var_92_0, 0.5)
			local var_92_2 = math.max(var_92_0, 0.5)

			var_91_2.anchorMin = Vector2.New(var_92_1, 0)
			var_91_2.anchorMax = Vector2.New(var_92_2, 1)
			var_91_2.offsetMin = Vector2.zero
			var_91_2.offsetMax = Vector2.zero

			arg_78_0:RefreshCamera()
		end)
		setSlider(var_91_1, var_91_0.min, var_91_0.max, var_91_0.value)
	end)()
	;(function()
		local var_93_0 = arg_78_0.cameraSettings.saturate
		local var_93_1 = arg_78_0.panelCamera:Find("Layout/Paramaters/Saturation/Saturation/Slider")
		local var_93_2 = var_93_1:Find("Background/Fill")

		onSlider(arg_78_0, var_93_1, function(arg_94_0)
			var_93_0.value = arg_94_0

			local var_94_0 = (arg_94_0 - var_93_0.min) / (var_93_0.max - var_93_0.min)
			local var_94_1 = math.min(var_94_0, 0.5)
			local var_94_2 = math.max(var_94_0, 0.5)

			var_93_2.anchorMin = Vector2.New(var_94_1, 0)
			var_93_2.anchorMax = Vector2.New(var_94_2, 1)
			var_93_2.offsetMin = Vector2.zero
			var_93_2.offsetMax = Vector2.zero

			arg_78_0:RefreshCamera()
		end)
		setSlider(var_93_1, var_93_0.min, var_93_0.max, var_93_0.value)
	end)()
	;(function()
		local var_95_0 = arg_78_0.panelCamera:Find("Layout/Other/FaceCamera/Toggle")

		triggerToggle(var_95_0, arg_78_0.settingFaceCamera)
		onToggle(arg_78_0, var_95_0, function(arg_96_0)
			arg_78_0.settingFaceCamera = arg_96_0

			arg_78_0.scene:EnableHeadIK(arg_96_0)
		end, SFX_UI_TAG, SFX_UI_CANCEL)
	end)()
	;(function()
		local var_97_0 = arg_78_0.panelCamera:Find("Layout/Other/HideCharacter/Toggle")

		triggerToggle(var_97_0, arg_78_0.settingHideCharacter)
		onToggle(arg_78_0, var_97_0, function(arg_98_0)
			arg_78_0.settingHideCharacter = arg_98_0

			if arg_98_0 then
				arg_78_0.scene:HideCharacterBylayer()
			else
				arg_78_0.scene:RevertCharacterBylayer()
			end
		end, SFX_UI_TAG, SFX_UI_CANCEL)
	end)()
end

function var_0_0.RefreshCamera(arg_99_0)
	arg_99_0.scene:SettingCamera(arg_99_0.cameraSettings)
end

function var_0_0.UpdateAnimSpeedPanel(arg_100_0)
	local function var_100_0()
		if not arg_100_0.timerAnim then
			return
		end

		local var_101_0 = arg_100_0.animInfo
		local var_101_1 = var_101_0.animPlayList[var_101_0.index]
		local var_101_2 = math.max(var_0_1, var_101_1:GetAnimTime())
		local var_101_3 = var_101_0.startStamp
		local var_101_4 = Time.time

		var_101_0.ratio = math.min(1, var_101_0.ratio + (var_101_4 - var_101_3) * arg_100_0.animSpeed / var_101_2)
		var_101_0.startStamp = var_101_4
	end

	local var_100_1 = arg_100_0.animSpeeds

	UIItemList.StaticAlign(arg_100_0.listAnimSpeed, arg_100_0.listAnimSpeed:GetChild(0), #var_100_1, function(arg_102_0, arg_102_1, arg_102_2)
		if arg_102_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_102_1 = #var_100_1 - arg_102_1

		local var_102_0 = var_100_1[arg_102_1]

		setText(arg_102_2:Find("Name"), var_102_0)
		setText(arg_102_2:Find("Selected"), var_102_0)
		setActive(arg_102_2:Find("Line"), arg_102_1 ~= #var_100_1)
		onButton(arg_100_0, arg_102_2, function()
			if arg_100_0.animSpeed == var_102_0 then
				return
			end

			var_100_0()

			arg_100_0.animSpeed = var_102_0

			arg_100_0.scene:SetCharacterAnimSpeed(var_102_0)
			arg_100_0:UpdateAnimSpeedPanel()
		end, SFX_PANEL)
	end)
	onButton(arg_100_0, arg_100_0.btnFreeze, function()
		local var_104_0 = 0

		if arg_100_0.animSpeed ~= 0 then
			arg_100_0.lastAnimSpeed = arg_100_0.animSpeed
		else
			var_104_0 = arg_100_0.lastAnimSpeed or 1
			arg_100_0.lastAnimSpeed = nil
		end

		var_100_0()

		arg_100_0.animSpeed = var_104_0

		arg_100_0.scene:SetCharacterAnimSpeed(var_104_0)
		arg_100_0:UpdateAnimSpeedPanel()
	end, SFX_PANEL)
	UIItemList.StaticAlign(arg_100_0.listAnimSpeed, arg_100_0.listAnimSpeed:GetChild(0), #var_100_1, function(arg_105_0, arg_105_1, arg_105_2)
		if arg_105_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_105_1 = #var_100_1 - arg_105_1

		local var_105_0 = var_100_1[arg_105_1]

		setActive(arg_105_2:Find("Name"), arg_100_0.animSpeed ~= var_105_0)
		setActive(arg_105_2:Find("Selected"), arg_100_0.animSpeed == var_105_0)
	end)
	setActive(arg_100_0.btnFreeze:Find("Icon"), arg_100_0.animSpeed ~= 0)
	setActive(arg_100_0.btnFreeze:Find("Selected"), arg_100_0.animSpeed == 0)
	setText(arg_100_0.textAnimSpeed, i18n("dorm3d_photo_animspeed", string.format("%.1f", arg_100_0.animSpeed)))
end

function var_0_0.UpdateLightingPanel(arg_106_0)
	if not arg_106_0.activeSetting then
		return
	end

	if arg_106_0.activePanel ~= var_0_0.PANEL.LIGHTING then
		return
	end

	local var_106_0 = getDorm3dGameset("drom3d_illumination_color")[2]
	local var_106_1 = {}

	for iter_106_0, iter_106_1 in ipairs(var_106_0) do
		table.insert(var_106_1, {
			color = Color.NewHex(iter_106_1)
		})
	end

	local var_106_2 = arg_106_0.panelLightning:Find("Layout/Lighting/Adjustment/Board/Rect")
	local var_106_3 = var_106_2.rect
	local var_106_4 = var_106_2:Find("Handler")

	local function var_106_5()
		if not arg_106_0.settingLightingColorIndex then
			arg_106_0.scene:RevertCharacterLight()

			return
		end

		arg_106_0.scene:SetCharacterLight(arg_106_0.adjustColor, arg_106_0.settingLightingAlpha, arg_106_0.settingLightingStrength)
	end

	local function var_106_6()
		local var_108_0 = arg_106_0.panelLightning:Find("Layout/Lighting/Strength")
		local var_108_1 = getDorm3dGameset("drom3d_illumination_intensity")[2]

		setSlider(var_108_0, var_108_1[1], var_108_1[2], arg_106_0.settingLightingAlpha)
		setText(var_108_0:Find("Value"), math.round(100 * arg_106_0.settingLightingAlpha) .. "%")
		onSlider(arg_106_0, var_108_0, function(arg_109_0)
			arg_106_0.settingLightingAlpha = arg_109_0

			setText(var_108_0:Find("Value"), math.round(100 * arg_109_0) .. "%")
			var_106_5()
		end)
	end

	var_106_6()
	UIItemList.StaticAlign(arg_106_0.panelLightning:Find("Layout/Lighting/Colors"), arg_106_0.panelLightning:Find("Layout/Lighting/Colors"):GetChild(0), #var_106_1, function(arg_110_0, arg_110_1, arg_110_2)
		if arg_110_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_110_1 = arg_110_1 + 1

		local var_110_0 = var_106_1[arg_110_1].color

		setImageColor(arg_110_2:Find("BG"), var_110_0)
		setImageColor(arg_110_2:Find("Selected"), var_110_0)
		setImageColor(arg_110_2:Find("Selected/Frame"), var_110_0)
		onToggle(arg_106_0, arg_110_2, function(arg_111_0)
			if arg_111_0 then
				arg_106_0.settingLightingColorIndex = arg_110_1
				arg_106_0.adjustColor = var_110_0

				setImageColor(arg_106_0.panelLightning:Find("Layout/Lighting/Adjustment/Board"), var_110_0)

				local var_111_0, var_111_1, var_111_2 = Color.RGBToHSV(var_110_0)

				var_106_4.anchoredPosition = Vector2.New(var_106_3.width, var_106_3.height)
				arg_106_0.adjustColorHsv = {
					h = var_111_0,
					s = var_111_1,
					v = var_111_2
				}
			elseif arg_106_0.settingLightingColorIndex == arg_110_1 then
				arg_106_0.settingLightingColorIndex = nil
			end

			arg_106_0.settingLightingAlpha = 1

			var_106_6()
			var_106_5()
		end, SFX_PANEL)
	end)

	local var_106_7 = pg.UIMgr.GetInstance().uiCamera:GetComponent(typeof(Camera))

	GetOrAddComponent(var_106_2, typeof(EventTriggerListener)):AddDragFunc(function(arg_112_0, arg_112_1)
		local var_112_0 = LuaHelper.ScreenToLocal(var_106_2, arg_112_1.position, var_106_7)

		var_112_0.x = math.clamp(var_112_0.x, 0, var_106_3.width)
		var_112_0.y = math.clamp(var_112_0.y, 0, var_106_3.height)
		var_106_4.anchoredPosition = var_112_0

		local var_112_1 = var_112_0.x / var_106_3.width
		local var_112_2 = var_112_0.y / var_106_3.height * 0.25 + 0.75

		arg_106_0.adjustColor = Color.HSVToRGB(arg_106_0.adjustColorHsv.h, arg_106_0.adjustColorHsv.s * var_112_1, arg_106_0.adjustColorHsv.v * var_112_2)

		var_106_5()
	end)

	local var_106_8 = {}

	for iter_106_2, iter_106_3 in ipairs(pg.dorm3d_camera_volume_template.all) do
		table.insert(var_106_8, iter_106_3)
	end

	table.sort(var_106_8, function(arg_113_0, arg_113_1)
		return arg_113_0 < arg_113_1
	end)

	local function var_106_9()
		if not arg_106_0.settingFilterIndex then
			arg_106_0.scene:RevertVolumeProfile()

			return
		end

		local var_114_0 = pg.dorm3d_camera_volume_template[var_106_8[arg_106_0.settingFilterIndex]]

		arg_106_0.scene:SetVolumeProfile(var_114_0.volume, arg_106_0.settingFilterStrength)
	end

	UIItemList.StaticAlign(arg_106_0.panelLightning:Find("Layout/Filter/List"), arg_106_0.panelLightning:Find("Layout/Filter/List"):GetChild(0), #var_106_8, function(arg_115_0, arg_115_1, arg_115_2)
		if arg_115_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_115_1 = arg_115_1 + 1

		local var_115_0 = pg.dorm3d_camera_volume_template[var_106_8[arg_115_1]]

		setText(arg_115_2:Find("Name"), var_115_0.name)

		if var_115_0.icon ~= "" then
			GetImageSpriteFromAtlasAsync(string.format("Dorm3DPhoto/%s", var_115_0.icon), "", arg_115_2:Find("BG"))
		end

		if arg_106_0.settingFilterIndex == arg_115_1 then
			setActive(arg_115_2:Find("Selected"), true)
		else
			setActive(arg_115_2:Find("Selected"), false)
		end

		onButton(arg_106_0, arg_115_2, function()
			local var_116_0 = arg_106_0.settingFilterIndex

			if arg_106_0.settingFilterIndex ~= arg_115_1 then
				arg_106_0.settingFilterIndex = arg_115_1
			else
				arg_106_0.settingFilterIndex = nil
			end

			var_106_9()

			if var_116_0 then
				local var_116_1 = arg_106_0.panelLightning:Find("Layout/Filter/List"):GetChild(var_116_0 - 1)

				setActive(var_116_1:Find("Selected"), false)
			end

			if arg_106_0.settingFilterIndex == arg_115_1 then
				setActive(arg_115_2:Find("Selected"), true)
			end
		end, SFX_PANEL)
	end)
	;(function()
		local var_117_0 = arg_106_0.panelLightning:Find("Layout/Filter/Slider")

		setSlider(var_117_0, 0, 1, arg_106_0.settingFilterStrength)
		onSlider(arg_106_0, var_117_0, function(arg_118_0)
			arg_106_0.settingFilterStrength = arg_118_0

			var_106_9()
		end)
	end)()
end

function var_0_0.SetMute(arg_119_0)
	if arg_119_0 then
		CriAtom.SetCategoryVolume("Category_CV", 0)
		CriAtom.SetCategoryVolume("Category_BGM", 0)
		CriAtom.SetCategoryVolume("Category_SE", 0)
	else
		CriAtom.SetCategoryVolume("Category_CV", pg.CriMgr.GetInstance():getCVVolume())
		CriAtom.SetCategoryVolume("Category_BGM", pg.CriMgr.GetInstance():getBGMVolume())
		CriAtom.SetCategoryVolume("Category_SE", pg.CriMgr.GetInstance():getSEVolume())
	end
end

function var_0_0.willExit(arg_120_0)
	if arg_120_0.timerAnim then
		arg_120_0.timerAnim:Stop()

		arg_120_0.timerAnim = nil
	end

	if arg_120_0.filmTimer then
		arg_120_0.filmTimer:Stop()

		arg_120_0.filmTimer = nil
	end

	if arg_120_0.animSpeed ~= 1 then
		arg_120_0.scene:SetCharacterAnimSpeed(1)
	end

	if arg_120_0.settingHideCharacter then
		arg_120_0.scene:RevertCharacter()
	end

	if not arg_120_0.settingFaceCamera then
		arg_120_0.scene:EnableHeadIK(true)
	end

	arg_120_0.scene:RevertCharacterLight()
	arg_120_0.scene:RevertVolumeProfile()
	arg_120_0.scene:RevertCameraSettings()
	arg_120_0.scene:ExitPhotoMode()
end

function var_0_0.SetCamaraPinchSliderValue(arg_121_0, arg_121_1)
	local var_121_0 = arg_121_0.normalPanel:Find("Zoom/Slider")

	setSlider(var_121_0, 0, 1, 1 - (arg_121_1 - 0.5) / 0.5)
end

return var_0_0
