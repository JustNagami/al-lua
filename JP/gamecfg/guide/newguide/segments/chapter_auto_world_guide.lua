return {
	id = "CHAPTER_AUTO_WORLD_GUIDE",
	events = {
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "作戦委任機能が開放されました\n\n（未確保の探索エリアにのみ適用できます）",
				mode = 1,
				dir = 1,
				char = "char",
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/top/adapt/right_chapter/line/display_panel/btns/delegate_btn",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/top/adapt/right_chapter/line/display_panel/btns/delegate_btn",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "条件を設定して、自動で探索エリアの攻略を進められます",
				mode = 1,
				dir = 1,
				char = "char",
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/ChapterAutoPanelTypeWorld(Clone)/top/btnBack",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/ChapterAutoPanelTypeWorld(Clone)/top/btnBack",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "各エリアをタップして、別々で作戦を委任することもできます",
				mode = 1,
				dir = 1,
				char = "char",
				posY = 0,
				posX = 0,
				uiset = {}
			}
		}
	}
}
