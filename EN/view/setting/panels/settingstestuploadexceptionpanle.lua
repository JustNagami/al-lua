slot0 = class("SettingsTestUploadExceptionPanle", import(".SettingsBasePanel"))

function slot0.GetUIName(slot0)
	return "SettingsServiceCH"
end

function slot0.GetTitle(slot0)
	return "测试异常上传"
end

function slot0.GetTitleEn(slot0)
	return "/ Service"
end

function slot0.OnInit(slot0)
	slot0.serviceBtn = findTF(slot0._tf, "delete")

	onButton(slot0, slot0.serviceBtn, function ()
		slot0 = ___inexistence____[0]
	end, SFX_PANEL)
end

function slot0.OnUpdate(slot0)
end

return slot0
