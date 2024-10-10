return {
	id = "DORM3D_GUIDE_05",
	events = {
		{
			alpha = 0,
			style = {
				text = "请再次点击天狼星，打开互动面板",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -98,
				posX = 600,
				uiset = {}
			},
			showSign = {
				type = 2,
				signList = {
					{
						signType = 8,
						pos = {
							-23,
							-97,
							0
						}
					}
				},
				clickArea = {
					500,
					880
				}
			}
		},
		{
			alpha = 0,
			notifies = {
				{
					notify = "Dorm3dRoomMediator.GUIDE_CLICK_LADY",
					body = {}
				}
			}
		},
		{
			alpha = 0.4,
			delay = 0.5,
			style = {
				text = "点击赠礼按钮，进入赠礼界面",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -203,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/Dorm3dMainUI(Clone)/UI/watch/Role/Gift",
				pathIndex = -1
			}
		},
		{
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "可在礼物列表中选择需要赠送的礼物",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -36,
				posX = 83,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/gift_panel",
						pathIndex = -1
					}
				}
			}
		},
		{
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "通过赠送礼物，即可增加与天狼星的契合度哦！",
				mode = 4,
				dir = 1,
				char = "char",
				posY = 252,
				posX = 43,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/gift_panel/content/view/container/1021001",
						pathIndex = -1
					}
				}
			}
		}
	}
}
