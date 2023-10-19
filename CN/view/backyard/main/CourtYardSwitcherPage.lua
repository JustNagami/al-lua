slot0 = class("CourtYardSwitcherPage", import("...base.BaseSubView"))

slot0.getUIName = function(slot0)
	return "CourtYardSwitcherUI"
end

slot0.OnLoaded = function(slot0)
	slot0.cancelBtn = slot0._tf:Find("floor_panel/cancel_btn")
	slot0.uilist = UIItemList.New(slot0._tf:Find("floor_panel/frame/container"), slot0._tf:Find("floor_panel/frame/itemtpl"))

	setText(slot0._tf:Find("floor_panel/cancel_btn/text"), i18n("word_ok"))
end

slot0.OnInit = function(slot0)
	onButton(slot0, slot0._tf, function ()
		uv0:Hide()
	end, SFX_PANEL)
	onButton(slot0, slot0.cancelBtn, function ()
		uv0:Hide()
	end, SFX_PANEL)

	slot1 = slot0.uilist

	slot1:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			uv0:UpdateSwitcher(slot1 + 1, slot2)
		end
	end)
end

slot0.Flush = function(slot0, slot1)
	slot0.dorm = slot1

	slot0:Show()
	slot0.uilist:align(Dorm.MAX_FLOOR)
end

slot0.UpdateSwitcher = function(slot0, slot1, slot2)
	slot4 = slot2:Find("mask")

	setText(slot2:Find("name"), slot1 .. "F")

	slot5 = not slot0.dorm:isUnlockFloor(slot1)

	setActive(slot4, slot5)
	setText(slot4:Find("tag/Text"), slot5 and i18n("dorm_2f_lock") or "")
	onButton(slot0, slot2, function ()
		if uv0 then
			uv1:UnLockTip()
		else
			uv1:emit(CourtYardMediator.SWITCH, uv2)
			uv1:Hide()
		end
	end, SFX_PANEL)
end

slot0.UnLockTip = function(slot0)
	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("backyard_open_2floor", pg.shop_template[ShopArgs.DORM_FLOOR_ID].resource_num),
		onYes = function ()
			uv0:emit(CourtYardMediator.UN_LOCK_2FLOOR, uv1, 1)
			uv0:Hide()
		end
	})
end

slot0.Show = function(slot0)
	uv0.super.Show(slot0)
	pg.UIMgr:GetInstance():BlurPanel(slot0._tf)
end

slot0.Hide = function(slot0)
	uv0.super.Hide(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0._parentTf)
end

slot0.OnDestroy = function(slot0)
	slot0:Hide()
end

return slot0
