MediaSaver = {}
slot0 = MediaSaver

function slot0.SaveImageWithBytes(slot0, slot1)
	System.IO.File.WriteAllBytes(slot0, slot1)
	YSTool.YSMediaSaver.Inst:SaveImage(slot0)

	if System.IO.File.Exists(slot0) then
		System.IO.File.Delete(slot0)
		warning("del old file path:" .. slot0)
	end
end

function slot0.SaveVideoWithPath(slot0)
	YSTool.YSMediaSaver.Inst:SaveVideo(slot0)

	if System.IO.File.Exists(slot0) then
		System.IO.File.Delete(slot0)
		warning("del old file path:" .. slot0)
	end
end
