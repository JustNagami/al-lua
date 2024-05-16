local var_0_0 = class("MainLive2dPainting", import(".MainBasePainting"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.live2dContainer = arg_1_1:Find("live2d")
	arg_1_0.cg = arg_1_0.live2dContainer:GetComponent(typeof(CanvasGroup))
	arg_1_0.currentWidth = Screen.width
	arg_1_0.currentHeight = Screen.height
	arg_1_0.isModifyOrder = false
	arg_1_0.actionWaiting = false
	arg_1_0.eventTrigger = GetOrAddComponent(arg_1_0.live2dContainer, typeof(EventTriggerListener))

	arg_1_0.eventTrigger:AddPointClickFunc(function()
		arg_1_0:OnClick()
		arg_1_0:TriggerPersonalTask(arg_1_0.ship.groupId)
	end)
end

function var_0_0.GetHalfBodyOffsetY(arg_3_0)
	local var_3_0 = arg_3_0.container.parent
	local var_3_1 = var_3_0.rect.height * -0.5
	local var_3_2 = var_3_0:InverseTransformPoint(arg_3_0.live2dContainer.position)
	local var_3_3 = arg_3_0.live2dContainer.localScale

	return var_3_1 - (arg_3_0.live2dContainer.rect.height * -0.5 * var_3_3.y + var_3_2.y)
end

function var_0_0.OnLoad(arg_4_0, arg_4_1)
	local var_4_0 = Live2D.GenerateData({
		loadPrefs = true,
		ship = arg_4_0.ship,
		scale = Vector3(52, 52, 52),
		position = Vector3(0, 0, 100),
		parent = arg_4_0.live2dContainer
	})

	arg_4_0.cg.blocksRaycasts = true
	arg_4_0.live2dChar = Live2D.New(var_4_0, function(arg_5_0)
		arg_4_0:AdJustOrderInLayer(arg_5_0)
		arg_4_1()
	end)
	arg_4_0.shipGroup = getProxy(CollectionProxy):getShipGroup(arg_4_0.ship.groupId)

	arg_4_0:UpdateContainerPosition()
	arg_4_0:AddScreenChangeTimer()
end

function var_0_0.AdJustOrderInLayer(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0.container:GetComponent(typeof(Canvas))

	if var_6_0 and var_6_0.overrideSorting and var_6_0.sortingOrder ~= 0 then
		local var_6_1 = arg_6_1._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
		local var_6_2 = var_6_0.sortingOrder
		local var_6_3 = typeof("Live2D.Cubism.Rendering.CubismRenderController")

		ReflectionHelp.RefSetProperty(var_6_3, "SortingOrder", var_6_1, var_6_2)

		arg_6_0.isModifyOrder = true
	end
end

function var_0_0.ResetOrderInLayer(arg_7_0)
	if not arg_7_0.live2dChar then
		return
	end

	local var_7_0 = arg_7_0.live2dChar._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
	local var_7_1 = typeof("Live2D.Cubism.Rendering.CubismRenderController")

	ReflectionHelp.RefSetProperty(var_7_1, "SortingOrder", var_7_0, 0)
end

function var_0_0.AddScreenChangeTimer(arg_8_0)
	arg_8_0:RemoveScreenChangeTimer()

	if not arg_8_0:IslimitYPos() then
		return
	end

	arg_8_0.screenTimer = Timer.New(function()
		if arg_8_0.currentWidth ~= Screen.width or arg_8_0.currentHeight ~= Screen.height then
			arg_8_0.currentWidth = Screen.width
			arg_8_0.currentHeight = Screen.height

			arg_8_0:ResetContainerPosition()
			arg_8_0:UpdateContainerPosition()
		end
	end, 0.5, -1)

	arg_8_0.screenTimer:Start()
end

function var_0_0.RemoveScreenChangeTimer(arg_10_0)
	if arg_10_0.screenTimer then
		arg_10_0.screenTimer:Stop()

		arg_10_0.screenTimer = nil
	end
end

function var_0_0.UpdateContainerPosition(arg_11_0)
	local var_11_0 = arg_11_0:IslimitYPos() and arg_11_0:GetHalfBodyOffsetY() or 0
	local var_11_1 = arg_11_0.live2dContainer.localPosition

	arg_11_0.live2dContainer.localPosition = Vector3(var_11_1.x, var_11_0, var_11_1.z)
end

function var_0_0.ResetContainerPosition(arg_12_0)
	local var_12_0 = arg_12_0.live2dContainer.localPosition

	arg_12_0.live2dContainer.localPosition = Vector3(var_12_0.x, 0, 0)
end

function var_0_0.OnUnload(arg_13_0)
	if arg_13_0.live2dChar then
		arg_13_0:RemoveScreenChangeTimer()
		arg_13_0:ResetContainerPosition()

		if arg_13_0.isModifyOrder then
			arg_13_0.isModifyOrder = false

			arg_13_0:ResetOrderInLayer()
		end

		arg_13_0.cg.blocksRaycasts = false

		arg_13_0.live2dChar:Dispose()

		arg_13_0.live2dChar = nil
	end
end

function var_0_0.OnClick(arg_14_0)
	local var_14_0

	if arg_14_0.live2dChar and arg_14_0.live2dChar.state == Live2D.STATE_INITED and not arg_14_0.live2dChar.ignoreReact then
		if not Input.mousePosition then
			return
		end

		local var_14_1 = arg_14_0.live2dChar:GetTouchPart()

		if var_14_1 > 0 then
			local var_14_2 = arg_14_0:GetTouchEvent(var_14_1)

			var_14_0 = var_14_2[math.ceil(math.random(#var_14_2))]
		else
			local var_14_3 = arg_14_0:GetIdleEvents()

			var_14_0 = var_14_3[math.floor(math.Random(0, #var_14_3)) + 1]
		end
	end

	if var_14_0 then
		arg_14_0:TriggerEvent(var_14_0)
	end
end

function var_0_0._TriggerEvent(arg_15_0, arg_15_1)
	if not arg_15_1 then
		return
	end

	if arg_15_0.actionWaiting then
		return
	end

	local var_15_0 = arg_15_0:GetEventConfig(arg_15_1)

	local function var_15_1(arg_16_0)
		if arg_16_0 then
			if var_15_0.dialog ~= "" then
				arg_15_0:DisplayWord(var_15_0.dialog)
			else
				arg_15_0:TriggerNextEventAuto()
			end
		end

		arg_15_0.actionWaiting = false
	end

	local var_15_2, var_15_3, var_15_4, var_15_5, var_15_6, var_15_7 = ShipWordHelper.GetCvDataForShip(arg_15_0.ship, var_15_0.dialog)
	local var_15_8 = var_15_0.action
	local var_15_9 = var_15_0.dialog
	local var_15_10 = string.gsub(var_15_9, "main_", "main")

	if arg_15_0.ship.propose and pg.character_voice[var_15_10] and arg_15_0.shipGroup and arg_15_0.shipGroup:VoiceReplayCodition(pg.character_voice[var_15_10]) and arg_15_0.live2dChar:checkActionExist(var_15_8 .. "_ex") then
		var_15_8 = var_15_8 .. "_ex"
	end

	if not var_15_7 then
		arg_15_0.actionWaiting = true

		arg_15_0.live2dChar:TriggerAction(var_15_8)
		var_15_1(true)
	else
		arg_15_0.actionWaiting = true

		if not var_15_4 or var_15_4 == nil or var_15_4 == "" or var_15_4 == "nil" then
			arg_15_0.actionWaiting = false

			var_15_1(true)
		end

		arg_15_0.live2dChar:TriggerAction(var_15_8, nil, nil, var_15_1)
	end
end

function var_0_0.PlayCV(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	arg_17_0:RemoveSeTimer()

	if arg_17_1 then
		arg_17_0.seTimer = Timer.New(function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/ui/" .. arg_17_1[1])
		end, arg_17_1[2], 1)

		arg_17_0.seTimer:Start()
	end

	local var_17_0 = ShipWordHelper.RawGetCVKey(arg_17_0.ship.skinId)
	local var_17_1 = pg.CriMgr.GetCVBankName(var_17_0)

	arg_17_0.cvLoader:Load(var_17_1, arg_17_3, arg_17_2, arg_17_4)
end

function var_0_0.RemoveSeTimer(arg_19_0)
	if arg_19_0.seTimer then
		arg_19_0.seTimer:Stop()

		arg_19_0.seTimer = nil
	end
end

function var_0_0.OnDisplayWorld(arg_20_0)
	return
end

function var_0_0.OnPuase(arg_21_0)
	arg_21_0:RemoveScreenChangeTimer()
	arg_21_0:ResetContainerPosition()

	arg_21_0.actionWaiting = false

	arg_21_0.live2dChar:SetVisible(false)
end

function var_0_0.OnUpdateShip(arg_22_0, arg_22_1)
	if arg_22_1 then
		arg_22_0.live2dChar:updateShip(arg_22_1)
	end
end

function var_0_0.OnResume(arg_23_0)
	arg_23_0:AddScreenChangeTimer()
	arg_23_0:UpdateContainerPosition()
	arg_23_0.live2dChar:SetVisible(true)
	arg_23_0.live2dChar:UpdateAtomSource()
end

function var_0_0.Dispose(arg_24_0)
	var_0_0.super.Dispose(arg_24_0)
	arg_24_0:RemoveSeTimer()
	arg_24_0:RemoveScreenChangeTimer()

	if arg_24_0.eventTrigger then
		ClearEventTrigger(arg_24_0.eventTrigger)
	end
end

function var_0_0.GetOffset(arg_25_0)
	return arg_25_0.live2dContainer.localPosition.x
end

function var_0_0.GetCenterPos(arg_26_0)
	local var_26_0 = arg_26_0.live2dContainer

	return (arg_26_0.chatTf.parent:InverseTransformPoint(var_26_0.position))
end

function var_0_0.IslimitYPos(arg_27_0)
	local var_27_0 = arg_27_0.ship:getPainting()

	return var_27_0 == "biaoqiang" or var_27_0 == "z23" or var_27_0 == "lafei" or var_27_0 == "lingbo" or var_27_0 == "mingshi" or var_27_0 == "xuefeng"
end

return var_0_0
