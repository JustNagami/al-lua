slot0 = class("MainLive2dPainting", import(".MainBasePainting"))

slot0.Ctor = function(slot0, slot1, slot2)
	uv0.super.Ctor(slot0, slot1, slot2)

	slot0.live2dContainer = slot1:Find("live2d")
	slot0.cg = slot0.live2dContainer:GetComponent(typeof(CanvasGroup))
	slot0.currentWidth = Screen.width
	slot0.currentHeight = Screen.height
	slot0.isModifyOrder = false
end

slot0.GetHalfBodyOffsetY = function(slot0)
	slot1 = slot0.container.parent

	return slot1.rect.height * -0.5 - (slot0.live2dContainer.rect.height * -0.5 * slot0.live2dContainer.localScale.y + slot1:InverseTransformPoint(slot0.live2dContainer.position).y)
end

slot0.OnLoad = function(slot0, slot1)
	slot0.cg.blocksRaycasts = true
	slot0.live2dChar = Live2D.New(Live2D.GenerateData({
		ship = slot0.ship,
		scale = Vector3(52, 52, 52),
		position = Vector3(0, 0, 100),
		parent = slot0.live2dContainer
	}), function (slot0)
		uv0:AdJustOrderInLayer(slot0)
		uv1()
	end)

	slot0:UpdateContainerPosition()
	slot0:AddScreenChangeTimer()
end

slot0.AdJustOrderInLayer = function(slot0, slot1)
	if slot0.container:GetComponent(typeof(Canvas)) and slot2.overrideSorting and slot2.sortingOrder ~= 0 then
		ReflectionHelp.RefSetProperty(typeof("Live2D.Cubism.Rendering.CubismRenderController"), "SortingOrder", slot1._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController"), slot2.sortingOrder)

		slot0.isModifyOrder = true
	end
end

slot0.ResetOrderInLayer = function(slot0)
	if not slot0.live2dChar then
		return
	end

	ReflectionHelp.RefSetProperty(typeof("Live2D.Cubism.Rendering.CubismRenderController"), "SortingOrder", slot0.live2dChar._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController"), 0)
end

slot0.AddScreenChangeTimer = function(slot0)
	slot0:RemoveScreenChangeTimer()

	if not slot0:IslimitYPos() then
		return
	end

	slot0.screenTimer = Timer.New(function ()
		if uv0.currentWidth ~= Screen.width or uv0.currentHeight ~= Screen.height then
			uv0.currentWidth = Screen.width
			uv0.currentHeight = Screen.height

			uv0:ResetContainerPosition()
			uv0:UpdateContainerPosition()
		end
	end, 0.5, -1)

	slot0.screenTimer:Start()
end

slot0.RemoveScreenChangeTimer = function(slot0)
	if slot0.screenTimer then
		slot0.screenTimer:Stop()

		slot0.screenTimer = nil
	end
end

slot0.UpdateContainerPosition = function(slot0)
	slot2 = slot0.live2dContainer.localPosition
	slot0.live2dContainer.localPosition = Vector3(slot2.x, slot0:IslimitYPos() and slot0:GetHalfBodyOffsetY() or 0, slot2.z)
end

slot0.ResetContainerPosition = function(slot0)
	slot0.live2dContainer.localPosition = Vector3(slot0.live2dContainer.localPosition.x, 0, 0)
end

slot0.OnUnload = function(slot0)
	if slot0.live2dChar then
		slot0:RemoveScreenChangeTimer()
		slot0:ResetContainerPosition()

		if slot0.isModifyOrder then
			slot0.isModifyOrder = false

			slot0:ResetOrderInLayer()
		end

		slot0.cg.blocksRaycasts = false

		slot0.live2dChar:Dispose()

		slot0.live2dChar = nil
	end
end

slot0.OnClick = function(slot0)
	slot1 = nil

	if slot0.live2dChar and slot0.live2dChar.state == Live2D.STATE_INITED and not slot0.live2dChar.ignoreReact then
		if not Input.mousePosition then
			return
		end

		if slot0.live2dChar:GetTouchPart() > 0 then
			slot4 = slot0:GetTouchEvent(slot3)
			slot1 = slot4[math.ceil(math.random(#slot4))]
		else
			slot4 = slot0:GetIdleEvents()
			slot1 = slot4[math.floor(math.Random(0, #slot4)) + 1]
		end
	end

	if slot1 then
		slot0:TriggerEvent(slot1)
	end
end

slot0._TriggerEvent = function(slot0, slot1)
	if not slot1 then
		return
	end

	slot3 = function()
		if uv0.dialog ~= "" then
			uv1:DisplayWord(uv0.dialog)
		else
			uv1:TriggerNextEventAuto()
		end
	end

	slot4, slot5, slot6, slot7, slot8, slot9 = ShipWordHelper.GetCvDataForShip(slot0.ship, slot0:GetEventConfig(slot1).dialog)

	if not slot9 then
		slot0.live2dChar:TriggerAction(slot2.action)
		slot3()
	else
		slot0.live2dChar:TriggerAction(slot2.action, nil, , slot3)
	end
end

slot0.PlayCV = function(slot0, slot1, slot2, slot3, slot4)
	slot0:RemoveSeTimer()

	if slot1 then
		slot0.seTimer = Timer.New(function ()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/ui/" .. uv0[1])
		end, slot1[2], 1)

		slot0.seTimer:Start()
	end

	slot0.cvLoader:Load(slot0.ship, slot3, slot2, slot4)
end

slot0.RemoveSeTimer = function(slot0)
	if slot0.seTimer then
		slot0.seTimer:Stop()

		slot0.seTimer = nil
	end
end

slot0.OnDisplayWorld = function(slot0)
end

slot0.OnPuase = function(slot0)
	slot0:RemoveScreenChangeTimer()
	slot0:ResetContainerPosition()
	slot0.live2dChar:SetVisible(false)
	slot0.live2dChar:Reset()
end

slot0.OnUpdateShip = function(slot0, slot1)
	if slot1 then
		slot0.live2dChar:updateShip(slot1)
	end
end

slot0.OnResume = function(slot0)
	slot0:AddScreenChangeTimer()
	slot0:UpdateContainerPosition()
	slot0.live2dChar:SetVisible(true)
	slot0.live2dChar:Reset()
	slot0.live2dChar:UpdateAtomSource()
end

slot0.Dispose = function(slot0)
	uv0.super.Dispose(slot0)
	slot0:RemoveSeTimer()
	slot0:RemoveScreenChangeTimer()
end

slot0.GetOffset = function(slot0)
	return slot0.live2dContainer.localPosition.x
end

slot0.GetCenterPos = function(slot0)
	return slot0.chatTf.parent:InverseTransformPoint(slot0.live2dContainer.position)
end

slot0.IslimitYPos = function(slot0)
	return slot0.ship:getPainting() == "biaoqiang" or slot1 == "z23" or slot1 == "lafei" or slot1 == "lingbo" or slot1 == "mingshi" or slot1 == "xuefeng"
end

return slot0
