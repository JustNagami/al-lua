return {
	id = "AUCTION_GUIDE_1",
	events = {
		{
			is3dDorm = false,
			alpha = 0.2,
			style = {
				text = "ようこそ「特別オークション」へ。オークションでは他人と競り合ったり、落札価格を釣り上げたりして「オークションコイン」を入手できます",
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
			alpha = 0.2,
			style = {
				text = "オークションは全部で3種類あります。それぞれのオークションで出品物の価値、オークション参加のリスクとリターンが異なります",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 302.6,
				posX = -355.3,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/adapt/locationBtn3",
						pathIndex = -1
					},
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/adapt/locationBtn1",
						pathIndex = -1
					},
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/adapt/locationBtn2",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.2,
			style = {
				text = "オークション情報はこちらです。一部のオークションに参加するにはコインを支払う必要があるほか、最低入札金額が設けられています",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -121.63,
				posX = 404.4,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/adapt/locationInfo",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.2,
			style = {
				text = "毎日一回、「オート入札」でオークションに自動参加・落札することができます。オート入札の収益は翌日受け取ることができます",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -234.49,
				posX = 0,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/adapt/preorderBtn",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			code = 1,
			alpha = 0.2,
			style = {
				text = "「任務」ではオークション任務を確認することができます",
				mode = 2,
				dir = -1,
				char = 1,
				posY = -284.7,
				posX = -452.73,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/adapt/taskBtn",
				pathIndex = -1,
				fingerPos = {
					posY = -28.32,
					posX = 86.2
				}
			}
		},
		{
			is3dDorm = false,
			code = 1,
			alpha = 0.2,
			style = {
				text = "デイリー任務は毎日出現し、「一回限り」任務は1回のみ出現します",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -305.6,
				posX = 203.86,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/AuctionGameTaskUI(Clone)/adapt/getAllBtn",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			code = 1,
			alpha = 0.2,
			ui = {
				path = "OverlayCamera/Overlay/UIMain/AwardInfoUI(Clone)",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			code = 1,
			alpha = 0.2,
			style = {
				text = "タップで前の画面に戻りましょう",
				mode = 2,
				dir = -1,
				char = 1,
				posY = 320.87,
				posX = -529.79,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/AuctionGameTaskUI(Clone)/adapt/closeBtn",
				pathIndex = -1,
				fingerPos = {
					posY = -47.6,
					posX = 56.68
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.2,
			style = {
				text = "オークションを選択し、「マッチング」をタップすると、オークションゲームを遊ぶことができます",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -232.83,
				posX = 500.3,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/adapt/matchBtn",
				pathIndex = -1,
				fingerPos = {
					posY = -28.18,
					posX = 226.64
				}
			}
		}
	}
}
