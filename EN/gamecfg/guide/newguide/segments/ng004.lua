local var_0_0 = {
	"Commander, welcome to Azur Lane! Let’s report to boot camp, now!"
}

return {
	id = "NG004",
	events = {
		{
			alpha = 0.4,
			style = {
				dir = -1,
				mode = 1,
				posY = 172,
				posX = -337,
				text = var_0_0[1]
			}
		},
		{
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/main/frame/link_top/layout/MainUIRecruitBtn(Clone)"
			}
		}
	}
}
