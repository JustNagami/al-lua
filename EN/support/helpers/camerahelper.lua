CameraHelper = {}
slot0 = CameraHelper
slot1 = YSTool.YSPermissionTool.Inst

function slot0.IsAndroid()
	return getProxy(UserProxy):GetCacheGatewayInServerLogined() == PLATFORM_ANDROID
end

function slot0.IsIOS()
	return getProxy(UserProxy):GetCacheGatewayInServerLogined() == PLATFORM_IPHONEPLAYER
end

function slot0.RequestCamera(slot0, slot1)
	if uv0.IsAndroid() then
		slot2 = {
			"android.permission.CAMERA",
			"android.permission.RECORD_AUDIO"
		}

		if PathMgr.getOSVersionNum() < 10 then
			table.insert(slot2, "android.permission.WRITE_EXTERNAL_STORAGE")
		end

		uv1:RequestMulti(slot2, function (slot0, slot1)
			slot2 = true

			for slot7 = 0, slot1.Length - 1 do
				if not slot1[slot7] then
					slot2 = false

					break
				end
			end

			if slot2 then
				if uv0 then
					uv0()
				end
			elseif uv1 then
				uv1()
			end
		end)
	elseif uv0.IsIOS() then
		uv1:RequestSingle("camera", function (slot0, slot1)
			if slot1 then
				if uv0 then
					uv0()
				end
			elseif uv1 then
				uv1()
			end
		end)
	elseif slot0 then
		slot0()
	end
end
