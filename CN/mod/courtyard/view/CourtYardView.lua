slot0 = class("CourtYardBaseView")

slot0.Ctor = function(slot0, slot1, slot2)
	slot0.name = slot1
	slot0.storey = slot2
	slot0.poolMgr = CourtYardPoolMgr.New()

	slot0:Init()
end

slot0.Init = function(slot0)
	slot0.isInit = false

	seriesAsync({
		function (slot0)
			uv0:LoadUI(slot0)
		end,
		function (slot0)
			uv0:InitObjPool(slot0)
		end
	}, function ()
		uv0.isInit = true
	end)
end

slot0.IsInit = function(slot0)
	return slot0.isInit == true
end

slot0.LoadUI = function(slot0, slot1)
	slot0.resName = slot0:GetStoreyModule().__cname
	slot3 = ResourceMgr.Inst

	slot3:getAssetAsync("UI/" .. slot0.resName, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
		slot2 = Object.Instantiate(slot0, pg.UIMgr.GetInstance().UIMain:Find(uv0.name .. "(Clone)"))
		uv0._go = slot2

		slot2.transform:SetSiblingIndex(1)
		setActive(slot2, true)

		uv0.storeyModule = uv1.New(uv0.storey, slot2)
		uv0.poolRoot = slot2.transform:Find("root")

		uv2()
	end), true, true)
end

slot0.GetRect = function(slot0)
	assert(slot0.storeyModule)

	return slot0.storeyModule.rectTF
end

slot0.GetStoreyModule = function(slot0)
	return ({
		[CourtYardConst.STYLE_INNER] = CourtYardStoreyModule,
		[CourtYardConst.STYLE_OUTSIDE] = CourtYardOutStoreyModule,
		[CourtYardConst.STYLE_FEAST] = CourtYardFeastStoreyModule
	})[slot0.storey:GetStyle()]
end

slot0.InitObjPool = function(slot0, slot1)
	slot0.poolMgr:Init(slot1)
end

slot0.GetCurrStorey = function(slot0)
	return slot0.storeyModule
end

slot0.Dispose = function(slot0)
	if slot0.storeyModule then
		slot0.storeyModule:Dispose()

		slot0.storeyModule = nil
	end

	slot0.storey = nil

	slot0.poolMgr:Dispose()

	slot0.poolMgr = nil
end

return slot0
