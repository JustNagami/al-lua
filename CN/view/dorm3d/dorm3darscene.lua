slot0 = class("Dorm3dARScene", import("view.base.BaseUI"))
slot1 = "dorm3d/scenesres/scenes/arscene/arscene_scene"

function slot0.getUIName(slot0)
	return "Dorm3DARUI"
end

function slot0.preload(slot0, slot1)
	slot0.sceneName = "ARScene"

	seriesAsync({
		function (slot0)
			pg.UIMgr.GetInstance():LoadingOn(false)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower(uv0), uv1.sceneName, LoadSceneMode.Additive, function (slot0, slot1)
				uv0()
			end)
		end,
		function (slot0)
			pg.UIMgr.GetInstance():LoadingOff()
			slot0()
		end,
		slot1
	})
end

function slot0.init(slot0)
	slot0:findUI()
	slot0:addListener()
end

function slot0.didEnter(slot0)
end

function slot0.willExit(slot0)
	SceneOpMgr.Inst:UnloadSceneAsync(string.lower(uv0), slot0.sceneName)
end

function slot0.findUI(slot0)
	slot0.backBtn = slot0:findTF("BackBtn")
	slot1 = slot0:findTF("MenuList")
	slot0.resetBtn = slot0:findTF("ResetBtn", slot1)
	slot0.showPlaneBtn = slot0:findTF("ShowPlaneBtn", slot1)
	slot0.hidePlaneBtn = slot0:findTF("HidePlaneBtn", slot1)
	slot2 = slot0:findTF("TipText")
	slot0.tipCheckPlane = slot0:findTF("CheckPlaneText", slot2)
	slot0.tipInsPrefab = slot0:findTF("InsPrefabText", slot2)
	slot0.tipDistance = slot0:findTF("DistanceText", slot2)

	setText(slot0.tipCheckPlane, "请检测一个平面")
	setText(slot0.tipInsPrefab, "长按平面呼出角色")
	setText(slot0.tipDistance, "距离太近隐藏角色")
	setActive(slot0.tipCheckPlane, false)
	setActive(slot0.tipInsPrefab, false)
	setActive(slot0.tipDistance, false)

	slot0.aiHelperSC = GetComponent(GameObject.Find("ScriptHander"), "ARHelper")
end

function slot0.addListener(slot0)
	onButton(slot0, slot0.backBtn, function ()
		uv0:closeView()
	end, SFX_PANEL)
	onButton(slot0, slot0.resetBtn, function ()
		uv0.aiHelperSC:ResetAll()
	end, SFX_PANEL)
	onButton(slot0, slot0.showPlaneBtn, function ()
		uv0.aiHelperSC:ShowAllPlane(true)
	end, SFX_PANEL)
	onButton(slot0, slot0.hidePlaneBtn, function ()
		uv0.aiHelperSC:ShowAllPlane(false)
	end, SFX_PANEL)

	function slot0.aiHelperSC.planeCountCB(slot0, slot1)
		slot2 = slot0 > 0

		setActive(uv0.tipCheckPlane, not slot2)
		setActive(uv0.tipInsPrefab, slot2 and not slot1)
	end

	function slot0.aiHelperSC.distanceCB(slot0)
		pg.TipsMgr.GetInstance():ShowTips("距离过近，以后会隐藏")
	end

	function slot0.aiHelperSC.insPrefabFailCB()
		pg.TipsMgr.GetInstance():ShowTips("距离过近，呼出角色失败")
	end

	function slot0.aiHelperSC.insPrefabSuccCB()
		pg.TipsMgr.GetInstance():ShowTips("呼出角色成功")
		uv0.aiHelperSC:StopPlaneCheck()
	end
end

return slot0
