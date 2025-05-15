local var_0_0 = class("KwxyKrTracker")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	return
end

var_0_0.Map = {
	[TRACKING_TUTORIAL_COMPLETE_1] = "stdhour1",
	[TRACKING_USER_LEVEL_THIRTY] = "stdlevel",
	[TRACKING_USER_LEVEL_FORTY] = "stdlevel",
	[TRACKING_PURCHASE_FIRST] = "stdrecharge"
}

function var_0_0.Tracking(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	local var_2_0 = var_0_0.Map[arg_2_1]

	if var_2_0 then
		pg.SdkMgr.GetInstance():EventTrack(var_2_0)
	end
end

return var_0_0
