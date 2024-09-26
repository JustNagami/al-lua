return {
	id = "DORM3D_GUIDE_06",
	events = {
		{
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "点击此处，可选择一起前往沙滩的角色",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -300,
				posX = 177,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/invite_panel/window/container",
				pathIndex = 0
			}
		},
		{
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "目前尚未解锁该角色的邀约，请点击角色",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -40,
				posX = 296,
				uiset = {
					{
						lineMode = 1,
						path = "OverlayCamera/Overlay/UIMain/select_panel/window/character/container/20220/base/mask",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/select_panel/window/character/container/20220/base/mask",
				pathIndex = -1
			}
		},
		{
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "点击此处，即可解锁该角色的邀约",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -435,
				posX = 207,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/Dorm3dRoomUnlockWindow(Clone)/Window/Confirm",
				pathIndex = -1
			}
		},
		{
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "现在，请点击天狼星，与她共同前往沙滩吧！",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -100,
				posX = 0,
				uiset = {
					{
						lineMode = 1,
						path = "OverlayCamera/Overlay/UIMain/select_panel/window/character/container/20220",
						pathIndex = -1
					}
				}
			}
		}
	}
}
