return {
	id = "tb2_9",
	events = {
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "根据指挥官对娜比娅的培养选择，她将迎来不同的成长结局",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "请点击此处查看结局和要求",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 1,
						path = "OverlayCamera/Overlay/UIMain/NewEducateTopPanel(Clone)/toolbar/btns/collect",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/NewEducateTopPanel(Clone)/toolbar/btns/collect",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "点击「结局」",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = -100,
				uiset = {
					{
						lineMode = 1,
						path = "OverlayCamera/Overlay/UIMain/NewEducateCollectEntranceUI(Clone)/anim_root/content/ending_btn/unlock",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/NewEducateCollectEntranceUI(Clone)/anim_root/content/ending_btn/unlock",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "娜比娅共有15种不同的成长结局",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "点击此处查看各结局的解锁条件",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 1,
						path = "OverlayCamera/Overlay/UIMain/NewEducateEndingUI(Clone)/anim_root/window/toggle",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/NewEducateEndingUI(Clone)/anim_root/window/toggle",
				pathIndex = -1,
				triggerType = {
					2,
					true
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "达成相应的数值条件即可解锁结局，若同时满足多个结局条件，则可同时解锁多个结局",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "点击空白处关闭",
				mode = 2,
				dir = -1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/NewEducateEndingUI(Clone)/anim_root/close",
				pathIndex = -1,
				fingerPos = {
					posY = 0,
					posX = -850
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "点击返回主页",
				mode = 2,
				dir = -1,
				char = 1,
				posY = 400,
				posX = 500,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/NewEducateCollectEntranceUI(Clone)",
				pathIndex = -1,
				fingerPos = {
					posY = -400,
					posX = 0
				}
			}
		}
	}
}
