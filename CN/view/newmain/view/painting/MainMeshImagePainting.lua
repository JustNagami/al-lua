slot0 = class("MainMeshImagePainting", import(".MainBasePainting"))
slot0.DEFAULT_HEIGHT = -10
slot0.TOUCH_HEIGHT = 20
slot0.TOUCH_LOOP = 1
slot0.TOUCH_DURATION = 0.1
slot0.CHAT_HEIGHT = 15
slot0.CHAT_DURATION = 0.3
slot0.BREATH_HEIGHT = -20
slot0.BREATH_DURATION = 2.3

slot0.OnLoad = function(slot0, slot1)
	setPaintingPrefabAsync(slot0.container, slot0.paintingName, "mainNormal", function ()
		if uv0:IsExited() then
			uv0:UnLoad()

			return
		end

		uv0:InitSpecialTouch()
		uv1()
	end)
	slot0:Breath()
end

slot0.GetCenterPos = function(slot0)
	if slot0:IsLoaded() then
		slot1 = slot0.container:Find("fitter"):GetChild(0)

		return slot0.chatTf.parent:InverseTransformPoint(slot1:TransformPoint(slot1.localPosition + Vector3((0.5 - slot1.pivot.x) * slot1.sizeDelta.x, 0, 0)))
	else
		return uv0.super.GetCenterPos(slot0)
	end
end

slot0.InitSpecialTouch = function(slot0)
	if not findTF(findTF(slot0.container, "fitter"):GetChild(0), "Touch") then
		return
	end

	setActive(slot1, true)
	eachChild(slot1, function (slot0)
		onButton(uv0, slot0, function ()
			uv0:TriggerEvent(uv0:GetSpecialTouchEvent(uv1.name))
			uv0:TriggerPersonalTask(uv0.ship.groupId)
		end)
	end)
end

slot0.OnClick = function(slot0)
	slot1 = slot0:CollectTouchEvents()

	slot0:TriggerEvent(slot1[math.ceil(math.random(#slot1))])
end

slot0.OnLongPress = function(slot0)
	if slot0.isFoldState then
		return
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
		shipId = slot0.ship.id
	})
end

slot0.OnDisplayWorld = function(slot0, slot1)
	ShipExpressionHelper.SetExpression(findTF(slot0.container, "fitter"):GetChild(0), slot0.paintingName, slot1, slot0.ship:getCVIntimacy(), slot0.ship.skinId)
end

slot0.OnTriggerEvent = function(slot0)
	slot0:Shake(uv0.TOUCH_HEIGHT, uv0.TOUCH_DURATION, uv0.TOUCH_LOOP)
end

slot0.OnTriggerEventAuto = function(slot0)
	slot0:Shake(uv0.CHAT_HEIGHT, uv0.CHAT_DURATION)
end

slot0.Shake = function(slot0, slot1, slot2, slot3)
	slot4, slot5, slot6 = getProxy(SettingsProxy):getSkinPosSetting(slot0.ship.skinId)
	slot7 = slot1

	if slot5 then
		slot7 = slot1 - uv0.DEFAULT_HEIGHT + slot5
	end

	if (slot3 or math.random(3) - 1) == 0 then
		return
	end

	LeanTween.cancel(go(slot0.container))

	slot8 = LeanTween.moveY(rtf(slot0.container), slot7, 0.1)
	slot8 = slot8:setLoopPingPong(slot3)

	slot8:setOnComplete(System.Action(function ()
		uv0:Breath()
	end))
end

slot0.Breath = function(slot0)
	slot1, slot2, slot3 = getProxy(SettingsProxy):getSkinPosSetting(slot0.ship.skinId)

	LeanTween.cancel(go(slot0.container))
	LeanTween.moveY(rtf(slot0.container), slot2 and slot2 - 10 or uv0.DEFAULT_HEIGHT, uv0.BREATH_DURATION):setLoopPingPong():setEase(LeanTweenType.easeInOutCubic):setFrom(slot2 or uv0.BREATH_HEIGHT)
end

slot0.StopBreath = function(slot0)
	LeanTween.cancel(go(slot0.container))
end

slot0.OnEnableOrDisableDragAndZoom = function(slot0, slot1)
	if slot1 then
		slot0:StopBreath()
	else
		slot0:Breath()
	end
end

slot0.OnFold = function(slot0, slot1)
	if not slot1 then
		slot0:Breath()
	end
end

slot0.OnPuase = function(slot0)
	slot0:StopBreath()
end

slot0.OnResume = function(slot0)
	checkCullResume(slot0.container:Find("fitter"):GetChild(0))
	slot0:Breath()
end

slot0.OnUnload = function(slot0)
	if LeanTween.isTweening(go(slot0.container)) then
		LeanTween.cancel(go(slot0.container))
	end

	retPaintingPrefab(slot0.container, slot0.paintingName)
end

return slot0
