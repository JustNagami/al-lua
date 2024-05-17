slot0 = class("Dorm3dCollectAwardLayer", import("view.base.BaseUI"))

function slot0.getUIName(slot0)
	return "Dorm3dCollectAwardUI"
end

function slot0.preload(slot0, slot1)
	GetSpriteFromAtlasAsync("dorm3dcollection/" .. pg.dorm3d_collection_template[slot0.contextData.itemId].model, "", function (slot0)
		uv0.iconSprite = slot0

		uv1()
	end)
end

function slot0.init(slot0)
	onButton(slot0, slot0._tf:Find("bg"), function ()
		uv0:closeView()
	end, SFX_CANCEL)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
		weight = LayerWeightConst.THIRD_LAYER
	})
end

function slot0.didEnter(slot0)
	slot1 = pg.dorm3d_collection_template[slot0.contextData.itemId]

	setText(slot0._tf:Find("panel/name/Text"), slot1.name)
	setText(slot0._tf:Find("panel/desc"), slot1.desc)
	setText(slot0._tf:Find("panel/favor/Image/Text"), string.format("favor plus:%d", pg.dorm3d_favor_trigger[slot1.award].num))
	setImageSprite(slot0._tf:Find("panel/icon"), slot0.iconSprite, true)
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
end

return slot0
