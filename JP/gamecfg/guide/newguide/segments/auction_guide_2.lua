return {
	id = "AUCTION_GUIDE_2",
	events = {
		{
			waitScene = "AuctionGameMainEventGuideLayer",
			hideui = {
				{
					ishide = true,
					path = "UICamera/Canvas/UIMain/AuctionGameMainEventUI(Clone)"
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.381,
			style = {
				text = "マッチングが完了すると、オークション画面に移行します",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -221.6,
				posX = -387.83,
				uiset = {}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.381,
			style = {
				text = "出品物はこちらの枠に置かれます。初期状態では、出品物の詳細を確認することができません",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -257,
				posX = -439.83,
				uiset = {
					{
						lineMode = 2,
						path = "UICamera/Canvas/UIMain/AuctionGameMainUI(Clone)/adapt/leftPanel/storehouseList",
						pathIndex = -1
					}
				}
			}
		},
		{
			delay = 0.5,
			hideui = {
				{
					ishide = false,
					path = "OverlayCamera/Overlay/UIMain/AuctionGameMainEventUI(Clone)"
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.381,
			style = {
				text = "オークション中に発生する「全体イベント」と「個人イベント」で、一部出品物の情報が開示される場合があります",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 103.67,
				posX = 1.43,
				uiset = {
					{
						lineMode = 2,
						path = "UICamera/Canvas/UIMain/AuctionGameMainUI(Clone)/adapt/rigltPanel/eventPanel/infoPanel",
						pathIndex = -1
					},
					{
						lineMode = 2,
						path = "UICamera/Canvas/UIMain/AuctionGameMainUI(Clone)/adapt/rigltPanel/eventPanel/Image",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.381,
			style = {
				text = "一度のオークションでは、「全体イベント」が1回、「個人イベント」が3回発生します。「個人イベント」は指揮官にのみ有効です",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 93.61,
				posX = 0,
				uiset = {
					{
						lineMode = 2,
						path = "UICamera/Canvas/UIMain/AuctionGameMainUI(Clone)/adapt/rigltPanel/eventPanel/Image",
						pathIndex = -1
					},
					{
						lineMode = 2,
						path = "UICamera/Canvas/UIMain/AuctionGameMainUI(Clone)/adapt/rigltPanel/eventPanel/infoPanel",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.381,
			style = {
				text = "こちらで「個人イベント」を確認することができます。「個人イベント」には様々な効果があり、参加者は毎ターン、ランダムで出現するイベント群から一つを選んで適用させることができます",
				mode = 2,
				dir = -1,
				char = 1,
				posY = -103.7,
				posX = -586.89,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/AuctionGameMainEventUI(Clone)/panel/itemList/eventItem",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0.381,
			style = {
				text = "タップして、イベントの効果を確認しましょう",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 77.2,
				posX = 526.07,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/AuctionGameMainEventUI(Clone)/adapt/okBtn",
				pathIndex = -1,
				fingerPos = {
					posY = -29.3,
					posX = 226.4
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.381,
			style = {
				text = "このイベントは1点の出品物の情報を開示する効果があります。これで出品物の詳細が分かります",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -206.28,
				posX = -468.31,
				uiset = {
					{
						lineMode = 1,
						path = "UICamera/Canvas/UIMain/AuctionGameMainUI(Clone)/adapt/rigltPanel/eventPanel/infoPanel/Viewport/Content/item(Clone)",
						pathIndex = -1
					},
					{
						lineMode = 1,
						path = "UICamera/Canvas/UIMain/AuctionGameMainUI(Clone)/adapt/leftPanel/storehouseList/storehouseList/Viewport/Content/3",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.381,
			style = {
				text = "アイコンをタップすると、出品物図鑑を確認することができます。各種情報で出品物の価値を予想し入札金額を決めましょう（B級オークションは予測価値情報が常時表示されます）",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 208.1,
				posX = -460.14,
				uiset = {
					{
						lineMode = 2,
						path = "UICamera/Canvas/UIMain/AuctionGameMainUI(Clone)/adapt/leftPanel/estimateBg",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.381,
			style = {
				text = "次は入札についてです",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 266.04,
				posX = -217.4,
				uiset = {}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.381,
			style = {
				text = "オークションは全部で5ターンあります。ターンの制限時間内に入札しないと、ペナルティを受ける場合があります",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 288.74,
				posX = -233.18,
				uiset = {}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.381,
			style = {
				text = "「ターン入札」をタップし、入札してみましょう",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -235.11,
				posX = 537.24,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/AuctionGameMainUI(Clone)/adapt/rigltPanel/bidBtn",
				pathIndex = -1,
				fingerPos = {
					posY = -34.6,
					posX = 228.7
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.381,
			style = {
				text = "出品物の情報や、ほかの参加者の入札金額を参考にし、自分の入札金額を決めましょう",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 126.52,
				posX = 9.86,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/AuctionGameMainBidUI(Clone)/panel/inputPanel/numPanel",
						pathIndex = -1
					},
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/AuctionGameMainBidUI(Clone)/panel/inputPanel/bidBtn",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.381,
			style = {
				text = "「即決落札倍率」――自分の入札金額が2番目に高い入札金額より一定の倍率で上回った場合、出品物を即時落札することができます",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -157.7,
				posX = -343.6,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/AuctionGameMainBidUI(Clone)/panel/inputPanel/numPanel/mulBtn",
						pathIndex = -1
					}
				}
			}
		}
	}
}
