pg = pg or {}
pg.activity_mall_story = rawget(pg, "activity_mall_story") or setmetatable({
	__name = "activity_mall_story"
}, confNEO)
pg.activity_mall_story.all = {
	101,
	102,
	103,
	104,
	105,
	106,
	107,
	108,
	109,
	110,
	111,
	112,
	113,
	114,
	115,
	201,
	202,
	203,
	204,
	205,
	206,
	207,
	208,
	301,
	302,
	303,
	304,
	305,
	306,
	401,
	402,
	403,
	404,
	405,
	406,
	407,
	408,
	409,
	410
}
pg.base = pg.base or {}
pg.base.activity_mall_story = {}

;(function()
	pg.base.activity_mall_story[101] = {
		lua = "",
		name = "黄金の浜",
		type = 1,
		id = 101,
		icon = "huangjinhaian",
		desc = "水に映る心",
		posion = {
			653,
			-269,
			0
		}
	}
	pg.base.activity_mall_story[102] = {
		lua = "",
		name = "埠頭",
		type = 1,
		id = 102,
		icon = "gangkou",
		desc = "水辺のカンツォーナ",
		posion = {
			1019,
			168,
			0
		}
	}
	pg.base.activity_mall_story[103] = {
		lua = "",
		name = "人工群島",
		type = 1,
		id = 103,
		icon = "rengongqundao",
		desc = "紅月が幻夢を想い耽る",
		posion = {
			1005,
			-78,
			0
		}
	}
	pg.base.activity_mall_story[104] = {
		lua = "",
		name = "天穹ホテル",
		type = 1,
		id = 104,
		icon = "qiongdingjiudian",
		desc = "青凪の人魚",
		posion = {
			-341,
			-20,
			0
		}
	}
	pg.base.activity_mall_story[105] = {
		lua = "",
		name = "黄金ビル",
		type = 1,
		id = 105,
		icon = "fujindasha",
		desc = "ランプ魔人の願いゲーム",
		posion = {
			-40,
			62,
			0
		}
	}
	pg.base.activity_mall_story[106] = {
		lua = "",
		name = "宴会ホール",
		type = 1,
		id = 106,
		icon = "tianfangyanhuiting",
		desc = "ウイッチ・スター・ランデヴー",
		posion = {
			155,
			35,
			0
		}
	}
	pg.base.activity_mall_story[107] = {
		lua = "",
		name = "潮風ホテル",
		type = 1,
		id = 107,
		icon = "haifengjiudian",
		desc = "バルーン・ダンス",
		posion = {
			172,
			-331,
			0
		}
	}
	pg.base.activity_mall_story[108] = {
		lua = "",
		name = "展示場",
		type = 1,
		id = 108,
		icon = "kejiguan",
		desc = "空想と現実を融合させた科学技術展示場。仮想と現実の境界を越える不思議な体験ができる。",
		posion = {
			-252,
			-242,
			0
		}
	}
	pg.base.activity_mall_story[109] = {
		lua = "",
		name = "遊園地",
		type = 1,
		id = 109,
		icon = "youleyuan",
		desc = "歓声と絶叫が響く夢のテーマパーク。純粋な楽しさに浸れる場所。",
		posion = {
			-546,
			-224,
			0
		}
	}
	pg.base.activity_mall_story[110] = {
		lua = "",
		name = "スパイス市場",
		type = 1,
		id = 110,
		icon = "xiangliaoshichang",
		desc = "豊かな香りが漂うスパイス市場。世界中のスパイスが並ぶ活気あるマーケット。",
		posion = {
			-700,
			476,
			0
		}
	}
	pg.base.activity_mall_story[111] = {
		lua = "",
		name = "観光街",
		type = 1,
		id = 111,
		icon = "fengqingjie",
		desc = "店がひしめく観光街。精巧な工芸品からローカルグルメまで何でも揃う。",
		posion = {
			-478,
			408,
			0
		}
	}
	pg.base.activity_mall_story[112] = {
		lua = "",
		name = "水族館",
		type = 1,
		id = 112,
		icon = "shuizuguan",
		desc = "巨大なアクアリウム。多彩な海の生物を間近で観察できる。",
		posion = {
			-680,
			254,
			0
		}
	}
	pg.base.activity_mall_story[113] = {
		lua = "",
		name = "砂地",
		type = 1,
		id = 113,
		icon = "qiansha",
		desc = "広大な砂漠エリア。砂漠ツアーや体験キャンプイベントに最適。",
		posion = {
			140,
			531,
			0
		}
	}
	pg.base.activity_mall_story[114] = {
		lua = "",
		name = "奇跡の園",
		type = 1,
		id = 114,
		icon = "qijihuayuan",
		desc = "左右対称の花壇が中央の東屋を囲み、花の香りとともに鮮やかな景色が広がる。",
		posion = {
			-164,
			401,
			0
		}
	}
	pg.base.activity_mall_story[115] = {
		lua = "",
		name = "人造湖",
		type = 1,
		id = 115,
		icon = "rengonghu",
		desc = "砂漠と都会の間にひっそりと佇む水の空間。一点の緑すらもゴールデン・ベイの富の象徴である。",
		posion = {
			472,
			517,
			0
		}
	}
	pg.base.activity_mall_story[201] = {
		lua = "SHEHUAXIANGMENGFUJINWAN1",
		name = "指揮官閣下、お目覚めの時間ですよ",
		type = 2,
		id = 201,
		icon = "icon_1",
		desc = "指揮官閣下、お目覚めの時間ですよ",
		posion = {
			327,
			198,
			0
		}
	}
	pg.base.activity_mall_story[202] = {
		lua = "SHEHUAXIANGMENGFUJINWAN19",
		name = "現れては消える宝石",
		type = 2,
		id = 202,
		icon = "icon_1",
		desc = "現れては消える宝石",
		posion = {
			-341,
			-20,
			0
		}
	}
	pg.base.activity_mall_story[203] = {
		lua = "SHEHUAXIANGMENGFUJINWAN20",
		name = "カモメの行方",
		type = 2,
		id = 203,
		icon = "icon_1",
		desc = "カモメの行方",
		posion = {
			1019,
			168,
			0
		}
	}
	pg.base.activity_mall_story[204] = {
		lua = "SHEHUAXIANGMENGFUJINWAN21",
		name = "屋上の「海賊」",
		type = 2,
		id = 204,
		icon = "icon_1",
		desc = "屋上の「海賊」",
		posion = {
			172,
			-331,
			0
		}
	}
	pg.base.activity_mall_story[205] = {
		lua = "SHEHUAXIANGMENGFUJINWAN22",
		name = "ランプの願い",
		type = 2,
		id = 205,
		icon = "icon_1",
		desc = "ランプの願い",
		posion = {
			-478,
			408,
			0
		}
	}
	pg.base.activity_mall_story[206] = {
		lua = "SHEHUAXIANGMENGFUJINWAN23",
		name = "魔法？ガーデンの宴",
		type = 2,
		id = 206,
		icon = "icon_1",
		desc = "魔法？ガーデンの宴",
		posion = {
			140,
			531,
			0
		}
	}
	pg.base.activity_mall_story[207] = {
		lua = "SHEHUAXIANGMENGFUJINWAN24",
		name = "奇跡の光",
		type = 2,
		id = 207,
		icon = "icon_1",
		desc = "奇跡の光",
		posion = {
			-164,
			401,
			0
		}
	}
	pg.base.activity_mall_story[208] = {
		lua = "SHEHUAXIANGMENGFUJINWAN2",
		name = "指揮官閣下、お目覚めの時間ですよ",
		type = 2,
		id = 208,
		icon = "icon_1",
		desc = "指揮官閣下、お目覚めの時間ですよ",
		posion = {
			653,
			-269,
			0
		}
	}
	pg.base.activity_mall_story[301] = {
		lua = "SHEHUAXIANGMENGFUJINWAN13",
		name = "現れては消える宝石",
		type = 3,
		id = 301,
		icon = "gangkou",
		desc = "",
		posion = {
			1019,
			168,
			0
		}
	}
	pg.base.activity_mall_story[302] = {
		lua = "SHEHUAXIANGMENGFUJINWAN14",
		name = "カモメの行方",
		type = 3,
		id = 302,
		icon = "rengongqundao",
		desc = "",
		posion = {
			1005,
			-78,
			0
		}
	}
	pg.base.activity_mall_story[303] = {
		lua = "SHEHUAXIANGMENGFUJINWAN15",
		name = "屋上の「海賊」",
		type = 3,
		id = 303,
		icon = "youleyuan",
		desc = "",
		posion = {
			-546,
			-224,
			0
		}
	}
	pg.base.activity_mall_story[304] = {
		lua = "SHEHUAXIANGMENGFUJINWAN16",
		name = "ランプの願い",
		type = 3,
		id = 304,
		icon = "xiangliaoshichang",
		desc = "",
		posion = {
			-700,
			476,
			0
		}
	}
	pg.base.activity_mall_story[305] = {
		lua = "SHEHUAXIANGMENGFUJINWAN17",
		name = "魔法？ガーデンの宴",
		type = 3,
		id = 305,
		icon = "fengqingjie",
		desc = "",
		posion = {
			-478,
			408,
			0
		}
	}
	pg.base.activity_mall_story[306] = {
		lua = "SHEHUAXIANGMENGFUJINWAN18",
		name = "奇跡の光",
		type = 3,
		id = 306,
		icon = "qiansha",
		desc = "",
		posion = {
			140,
			531,
			0
		}
	}
	pg.base.activity_mall_story[401] = {
		lua = "SHEHUAXIANGMENGFUJINWAN3",
		name = "貴方に捧げる贈り物",
		type = 4,
		id = 401,
		icon = "yanusi",
		desc = "1",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[402] = {
		lua = "SHEHUAXIANGMENGFUJINWAN4",
		name = "ハプニング付きの鬼ごっこ",
		type = 4,
		id = 402,
		icon = "mojiaduoer",
		desc = "2",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[403] = {
		lua = "SHEHUAXIANGMENGFUJINWAN5",
		name = "砂像大会進行中！",
		type = 4,
		id = 403,
		icon = "luyijiushi",
		desc = "3",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[404] = {
		lua = "SHEHUAXIANGMENGFUJINWAN6",
		name = "お相手はどの子？",
		type = 4,
		id = 404,
		icon = "u2501",
		desc = "4",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[405] = {
		lua = "SHEHUAXIANGMENGFUJINWAN7",
		name = "特番撮影始動",
		type = 4,
		id = 405,
		icon = "aimudeng",
		desc = "5",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[406] = {
		lua = "SHEHUAXIANGMENGFUJINWAN8",
		name = "湯気に煙る",
		type = 4,
		id = 406,
		icon = "gezi",
		desc = "6",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[407] = {
		lua = "SHEHUAXIANGMENGFUJINWAN9",
		name = "クロスカントリー競走",
		type = 4,
		id = 407,
		icon = "tianchengcv",
		desc = "7",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[408] = {
		lua = "SHEHUAXIANGMENGFUJINWAN10",
		name = "雲の上の波しぶき",
		type = 4,
		id = 408,
		icon = "moliciqinwang",
		desc = "8",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[409] = {
		lua = "SHEHUAXIANGMENGFUJINWAN11",
		name = "溶け合う鼓動",
		type = 4,
		id = 409,
		icon = "aogusite",
		desc = "9",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[410] = {
		lua = "SHEHUAXIANGMENGFUJINWAN12",
		name = "蜜漬けの余韻",
		type = 4,
		id = 410,
		icon = "z15",
		desc = "10",
		posion = {
			960,
			540,
			0
		}
	}
end)()
