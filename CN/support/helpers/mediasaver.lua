MediaSaver = {}

local var_0_0 = MediaSaver

function var_0_0.SaveImageWithBytes(arg_1_0, arg_1_1)
	System.IO.File.WriteAllBytes(arg_1_0, arg_1_1)

	if CameraHelper.IsIOS() then
		local var_1_0 = pg.TimeMgr.GetInstance():STimeDescS(pg.TimeMgr.GetInstance():GetServerTime(), "*t")
		local var_1_1 = "azur" .. var_1_0.year .. var_1_0.month .. var_1_0.day .. var_1_0.hour .. var_1_0.min .. var_1_0.sec .. ".png"

		YARecorder.Inst:WritePictureToAlbum(var_1_1, arg_1_1)
	else
		YSTool.YSMediaSaver.Inst:SaveImage(arg_1_0)
	end

	if System.IO.File.Exists(arg_1_0) then
		System.IO.File.Delete(arg_1_0)
		warning("del old file path:" .. arg_1_0)
	end
end

function var_0_0.SaveVideoWithPath(arg_2_0)
	YSTool.YSMediaSaver.Inst:SaveVideo(arg_2_0)

	if System.IO.File.Exists(arg_2_0) then
		System.IO.File.Delete(arg_2_0)
		warning("del old file path:" .. arg_2_0)
	end
end
