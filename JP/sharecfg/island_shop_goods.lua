pg = pg or {}
pg.island_shop_goods = rawget(pg, "island_shop_goods") or setmetatable({
	__name = "island_shop_goods"
}, confNEO)
pg.island_shop_goods.__namecode__ = true
pg.island_shop_goods.all = {
	10000,
	10001,
	10002,
	10003,
	10004,
	10005,
	10006,
	10007,
	10008,
	10009,
	10010,
	10011,
	10012,
	10013,
	10014,
	10015,
	10016,
	10017,
	10018,
	10019,
	10020,
	10021,
	10022,
	10023,
	10024,
	10025,
	10026,
	10027,
	10028,
	10029,
	10030,
	10031,
	10032,
	10033,
	10034,
	10035,
	10036,
	10037,
	10038,
	10039,
	10040,
	10041,
	10042,
	10043,
	10044,
	10045,
	10046,
	10047,
	10048,
	10049,
	10050,
	10051,
	10052,
	10053,
	10054,
	10055,
	10056,
	10057,
	10058,
	10102,
	10103,
	10104,
	10105,
	10106,
	10107,
	10108,
	10109,
	10110,
	10111,
	10112,
	10113,
	10114,
	10115,
	10116,
	10117,
	10118,
	10119,
	10120,
	10121,
	10122,
	10123,
	10124,
	10125,
	10126,
	10127,
	10128,
	10129,
	10130,
	10131,
	10132,
	10133,
	10134,
	10135,
	10136,
	10137,
	10138,
	10139,
	10140,
	10141,
	10142,
	10143,
	10144,
	10145,
	10146,
	10147,
	10148,
	10149,
	10150,
	10151,
	10152,
	10153,
	10154,
	10155,
	10156,
	10157,
	10158,
	10201,
	10202,
	10203,
	10204,
	10205,
	10206,
	10207,
	10208,
	10209,
	10210,
	10211,
	10212,
	10213,
	10214,
	10215,
	10216,
	10217,
	10218,
	10219,
	10220,
	10221,
	10222,
	10223,
	10224,
	10225,
	10226,
	10227,
	10228,
	10229,
	10230,
	10231,
	10232,
	10233,
	10234,
	10235,
	10236,
	10237,
	10238,
	10239,
	10240,
	10241,
	10242,
	10243,
	10244,
	10245,
	10246,
	10247,
	10248,
	10249,
	10250,
	10251,
	10252,
	10253,
	10254,
	10255,
	10256,
	10257,
	10258,
	10259,
	10260,
	10261,
	10262,
	10263,
	10264,
	10265,
	10266,
	10267,
	10268,
	10269,
	10301,
	10302,
	10303,
	10304,
	10305,
	10306,
	10307,
	10308,
	10309,
	10310,
	10311,
	10312,
	10313,
	10314,
	10315,
	10316,
	10317,
	10318,
	10319,
	10320,
	10321,
	10322,
	10323,
	10324,
	10325,
	10326,
	10327,
	10328,
	10329,
	10330,
	10331,
	10332,
	10333,
	10334,
	10335,
	10336,
	10337,
	10338,
	10339,
	10340,
	10341,
	10342,
	10343,
	10344,
	10345,
	10346,
	10347,
	10348,
	10349,
	10350,
	10351,
	10352,
	10353,
	10354,
	10355,
	10356,
	10357,
	10358,
	10359,
	10360,
	10361,
	10362,
	10363,
	10364,
	10365,
	10366,
	10367,
	10368,
	10369,
	10401,
	10402,
	10403,
	10404,
	10405,
	10406,
	10407,
	10408,
	10409,
	10410,
	10411,
	10412,
	10413,
	10414,
	10415,
	10416,
	10417,
	10418,
	10419,
	10420,
	10421,
	10422,
	10423,
	10424,
	10425,
	10426,
	10427,
	10428,
	10429,
	10430,
	10431,
	10432,
	10433,
	10434,
	10435,
	10436,
	10437,
	10438,
	10439,
	10440,
	10441,
	10442,
	10443,
	10444,
	10445,
	10446,
	10447,
	10448,
	10449,
	10450,
	10451,
	10452,
	10453,
	10454,
	10455,
	10456,
	10457,
	10458,
	10459,
	10460,
	10461,
	10462,
	10463,
	10464,
	10465,
	10466,
	10467,
	10468,
	10469,
	10470,
	10471,
	10472,
	10473,
	10474,
	10475,
	103000,
	103001,
	103002,
	103003,
	103004,
	111500,
	111502,
	111503,
	111101,
	111102,
	111103,
	111104,
	111105,
	111106,
	111107,
	111108,
	111201,
	111202,
	111203,
	111204,
	111205,
	111206,
	111207,
	111208,
	411000,
	411001,
	411002,
	411003,
	411004,
	411005,
	411006,
	411007,
	411008,
	411009,
	411010,
	411011,
	411012,
	411014,
	411015,
	411016,
	411017,
	411018,
	411019,
	411020,
	411021,
	411022,
	411023,
	411024,
	411025,
	411026,
	411027,
	411028,
	412000,
	412001,
	412002,
	412003,
	4600001,
	4600002,
	4600003,
	4620004,
	4630005,
	4610003,
	4620007,
	4630008,
	4610006,
	4620008,
	4630009,
	4610008,
	5010001,
	5020001,
	5030001,
	5010002,
	5020002,
	5030002,
	5010003,
	5020003,
	5030003,
	5010004,
	5020004,
	5030004,
	471070301,
	473120101,
	471051701,
	471011001,
	475060101,
	474030301,
	471011701,
	472012101,
	473031101,
	472021201,
	479600011,
	99000101,
	99000102,
	99000201,
	99000202,
	99000301,
	99000302,
	461060015
}
pg.base = pg.base or {}
pg.base.island_shop_goods = {}

;(function()
	pg.base.island_shop_goods[10000] = {
		desc = "指揮官用浮遊着せ替え「艦船ビット」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "艦船ビット",
		icon = "IslandDressIcon/dress_1020001",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10000,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				1020001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10001] = {
		desc = "友好の握手は、信頼と協力の始まりである",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "握手",
		icon = "IslandActionIcon/handshake",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				2001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10002] = {
		desc = "激動のジャンプは、勝利への最高の雄叫びである",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "元気ジャンプ",
		icon = "IslandActionIcon/vjump",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10003] = {
		desc = "努力によって築かれた偉業。全ての人に展示する価値がある",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "筋肉自慢",
		icon = "IslandActionIcon/muscle",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1011,
				1
			}
		}
	}
	pg.base.island_shop_goods[10004] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	}
	pg.base.island_shop_goods[10005] = {
		desc = "収穫したばかりの新鮮な小麦。小麦粉を作るのに欠かせない原料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "小麦",
		icon = "IslandProps/item_2000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10005,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2000,
				10
			}
		}
	}
	pg.base.island_shop_goods[10006] = {
		desc = "黄金色に実ったとうもろこし。畑に甘い香りが漂う。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "とうもろこし",
		icon = "IslandProps/item_2001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10006,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2001,
				10
			}
		}
	}
	pg.base.island_shop_goods[10007] = {
		desc = "高品質な牧草。牧場に溢れるほどの活気を！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "牧草",
		icon = "IslandProps/item_2008",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10007,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2008,
				10
			}
		}
	}
	pg.base.island_shop_goods[10008] = {
		desc = "白くて上質な米。豊富なでんぷんと穀物たんぱく質を含む。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "米",
		icon = "IslandProps/item_2002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10008,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2002,
				10
			}
		}
	}
	pg.base.island_shop_goods[10009] = {
		desc = "みずみずしくておいしい白菜。採れたて新鮮！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "白菜",
		icon = "IslandProps/item_2003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10009,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2003,
				10
			}
		}
	}
	pg.base.island_shop_goods[10010] = {
		desc = "丸くてふっくら、たんぱく質が豊富。料理だけでなく工業にもいろいろ使われる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大豆",
		icon = "IslandProps/item_2006",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10010,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2006,
				10
			}
		}
	}
	pg.base.island_shop_goods[10011] = {
		desc = "野菜界のでんぷん代表。様々な形に調理できる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "じゃがいも",
		icon = "IslandProps/item_2005",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 40,
		discount = 0,
		groups_detail_type = "",
		id = 10011,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			400
		},
		items = {
			{
				41,
				2005,
				10
			}
		}
	}
	pg.base.island_shop_goods[10012] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10012,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10013] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10013,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10014] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10014,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10015] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10015,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10016] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10016,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10017] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 6,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10017,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10018] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10018,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10019] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10019,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10020] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10020,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10021] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10021,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10022] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10022,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10023] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10023,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10024] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10024,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10025] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10025,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10026] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10026,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10027] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10027,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	}
	pg.base.island_shop_goods[10028] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10028,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10029] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10029,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10030] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10030,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10031] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10031,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10032] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10032,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10033] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 8,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10033,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10034] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10034,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10035] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10035,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10036] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10036,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10037] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10037,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10038] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10038,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10039] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10039,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10040] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10040,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10041] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10041,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10042] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10042,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10043] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10043,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	}
	pg.base.island_shop_goods[10044] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 50,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10044,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10045] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 15,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10045,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10046] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10046,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10047] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10047,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10048] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10048,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10049] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10049,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10050] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10050,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10051] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10051,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10052] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10052,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10053] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10053,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10054] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10054,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10055] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10055,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10056] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10056,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10057] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10057,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10058] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10058,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10102] = {
		desc = "指揮官用浮遊着せ替え「草わらの影」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "草わらの影",
		icon = "IslandDressIcon/dress_1010007",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10102,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				1010007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10103] = {
		desc = "ヒーロー登場！生き生きとした感情と生き方を表現する",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "ヒーロー登場",
		icon = "IslandActionIcon/herocoming",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10103,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1013,
				1
			}
		}
	}
	pg.base.island_shop_goods[10104] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10104,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	}
	pg.base.island_shop_goods[10105] = {
		desc = "収穫したばかりの新鮮な小麦。小麦粉を作るのに欠かせない原料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "小麦",
		icon = "IslandProps/item_2000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10105,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2000,
				10
			}
		}
	}
	pg.base.island_shop_goods[10106] = {
		desc = "黄金色に実ったとうもろこし。畑に甘い香りが漂う。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "とうもろこし",
		icon = "IslandProps/item_2001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10106,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2001,
				10
			}
		}
	}
	pg.base.island_shop_goods[10107] = {
		desc = "高品質な牧草。牧場に溢れるほどの活気を！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "牧草",
		icon = "IslandProps/item_2008",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10107,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2008,
				10
			}
		}
	}
	pg.base.island_shop_goods[10108] = {
		desc = "白くて上質な米。豊富なでんぷんと穀物たんぱく質を含む。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "米",
		icon = "IslandProps/item_2002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10108,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2002,
				10
			}
		}
	}
	pg.base.island_shop_goods[10109] = {
		desc = "みずみずしくておいしい白菜。採れたて新鮮！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "白菜",
		icon = "IslandProps/item_2003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10109,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2003,
				10
			}
		}
	}
	pg.base.island_shop_goods[10110] = {
		desc = "丸くてふっくら、たんぱく質が豊富。料理だけでなく工業にもいろいろ使われる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大豆",
		icon = "IslandProps/item_2006",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10110,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2006,
				10
			}
		}
	}
	pg.base.island_shop_goods[10111] = {
		desc = "野菜界のでんぷん代表。様々な形に調理できる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "じゃがいも",
		icon = "IslandProps/item_2005",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 40,
		discount = 0,
		groups_detail_type = "",
		id = 10111,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			400
		},
		items = {
			{
				41,
				2005,
				10
			}
		}
	}
	pg.base.island_shop_goods[10112] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10112,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10113] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10113,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10114] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10114,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10115] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10115,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10116] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10116,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10117] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 6,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10117,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10118] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10118,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10119] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10119,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10120] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10120,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10121] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10121,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10122] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10122,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10123] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10123,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10124] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10124,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10125] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10125,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10126] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10126,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10127] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10127,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	}
	pg.base.island_shop_goods[10128] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10128,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10129] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10129,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10130] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10130,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10131] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10131,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10132] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10132,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10133] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 8,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10133,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10134] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10134,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10135] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10135,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10136] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10136,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10137] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10137,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10138] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10138,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10139] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10139,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10140] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10140,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10141] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10141,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10142] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10142,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
end)()
;(function()
	pg.base.island_shop_goods[10143] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10143,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	}
	pg.base.island_shop_goods[10144] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 50,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10144,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10145] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 15,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10145,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10146] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10146,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10147] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10147,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10148] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10148,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10149] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10149,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10150] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10150,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10151] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10151,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10152] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10152,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10153] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10153,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10154] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10154,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10155] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10155,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10156] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10156,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10157] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10157,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10158] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10158,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10201] = {
		desc = "キャラ用背中着せ替え「純白リボンウィング」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "純白リボンウィング",
		icon = "IslandDressIcon/dress_2010004",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10201,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2010004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10202] = {
		desc = "キャラ用浮遊着せ替え「拭き拭きはたき」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "拭き拭きはたき",
		icon = "IslandDressIcon/dress_2020005",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10202,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2020005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10203] = {
		desc = "キャラ用足跡着せ替え「メモリアルレース」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "メモリアルレース",
		icon = "IslandDressIcon/dress_2030006",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10203,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2030006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10204] = {
		desc = "インタラクトアクション「伸び」",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "伸び",
		icon = "IslandActionIcon/stretch",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10204,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1014,
				1
			}
		}
	}
	pg.base.island_shop_goods[10205] = {
		desc = "インタラクトアクション「怯える」",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "怯える",
		icon = "IslandActionIcon/fearshake",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10205,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1015,
				1
			}
		}
	}
	pg.base.island_shop_goods[10206] = {
		desc = "インタラクトアクション「抱拳」",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "抱拳",
		icon = "IslandActionIcon/holdfist",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10206,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1016,
				1
			}
		}
	}
	pg.base.island_shop_goods[10207] = {
		desc = "インタラクトアクション「ドヤる」",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "ドヤる",
		icon = "IslandActionIcon/vouch",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10207,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1017,
				1
			}
		}
	}
	pg.base.island_shop_goods[10208] = {
		desc = "ウィリアム・D・ポーターの離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "ウィリアム・D・ポーター-離島権限認証",
		icon = "IslandProps/item_200016",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20000,
		discount = 0,
		groups_detail_type = "",
		id = 10208,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200000
		},
		items = {
			{
				44,
				10110,
				1
			}
		}
	}
	pg.base.island_shop_goods[10209] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10209,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10210] = {
		desc = "収穫したばかりの新鮮な小麦。小麦粉を作るのに欠かせない原料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "小麦",
		icon = "IslandProps/item_2000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10210,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2000,
				10
			}
		}
	}
	pg.base.island_shop_goods[10211] = {
		desc = "黄金色に実ったとうもろこし。畑に甘い香りが漂う。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "とうもろこし",
		icon = "IslandProps/item_2001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10211,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2001,
				10
			}
		}
	}
	pg.base.island_shop_goods[10212] = {
		desc = "高品質な牧草。牧場に溢れるほどの活気を！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "牧草",
		icon = "IslandProps/item_2008",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10212,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2008,
				10
			}
		}
	}
	pg.base.island_shop_goods[10213] = {
		desc = "白くて上質な米。豊富なでんぷんと穀物たんぱく質を含む。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "米",
		icon = "IslandProps/item_2002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10213,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2002,
				10
			}
		}
	}
	pg.base.island_shop_goods[10214] = {
		desc = "みずみずしくておいしい白菜。採れたて新鮮！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "白菜",
		icon = "IslandProps/item_2003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10214,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2003,
				10
			}
		}
	}
	pg.base.island_shop_goods[10215] = {
		desc = "丸くてふっくら、たんぱく質が豊富。料理だけでなく工業にもいろいろ使われる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大豆",
		icon = "IslandProps/item_2006",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10215,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2006,
				10
			}
		}
	}
	pg.base.island_shop_goods[10216] = {
		desc = "野菜界のでんぷん代表。様々な形に調理できる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "じゃがいも",
		icon = "IslandProps/item_2005",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 40,
		discount = 0,
		groups_detail_type = "",
		id = 10216,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			400
		},
		items = {
			{
				41,
				2005,
				10
			}
		}
	}
	pg.base.island_shop_goods[10217] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10217,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10218] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10218,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10219] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10219,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10220] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10220,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10221] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10221,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10222] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 6,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10222,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10223] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10223,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10224] = {
		desc = "経営テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの経営ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "経営教科書 T1",
		icon = "IslandProps/item_100011",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10224,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100011,
				1
			}
		}
	}
	pg.base.island_shop_goods[10225] = {
		desc = "農業テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの農業ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "農業教科書 T1",
		icon = "IslandProps/item_100021",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10225,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100021,
				1
			}
		}
	}
	pg.base.island_shop_goods[10226] = {
		desc = "制作テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの制作ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "制作教科書 T1",
		icon = "IslandProps/item_100031",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10226,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100031,
				1
			}
		}
	}
	pg.base.island_shop_goods[10227] = {
		desc = "採集テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの採集ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "採集教科書 T1",
		icon = "IslandProps/item_100041",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10227,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100041,
				1
			}
		}
	}
	pg.base.island_shop_goods[10228] = {
		desc = "飼養テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの採集ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "飼養教科書 T1",
		icon = "IslandProps/item_100051",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10228,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100051,
				1
			}
		}
	}
	pg.base.island_shop_goods[10229] = {
		desc = "料理テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの料理ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "料理教科書 T1",
		icon = "IslandProps/item_100061",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10229,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100061,
				1
			}
		}
	}
	pg.base.island_shop_goods[10230] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10230,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10231] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10231,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10232] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10232,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10233] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10233,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10234] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10234,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10235] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10235,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10236] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10236,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10237] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10237,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10238] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10238,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10239] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10239,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10240] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10240,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10241] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10241,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10242] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10242,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10243] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 8,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10243,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10244] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10244,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10245] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10245,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10246] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10246,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10247] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10247,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10248] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10248,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10249] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10249,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10250] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10250,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10251] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10251,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10252] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10252,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10253] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10253,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10254] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 50,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10254,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10255] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 15,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10255,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10256] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10256,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10257] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10257,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10258] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10258,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10259] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10259,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10260] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10260,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10261] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10261,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10262] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10262,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10263] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10263,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10264] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10264,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10265] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10265,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10266] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10266,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10267] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10267,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10268] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10268,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10269] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10269,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10301] = {
		desc = "キャラ用浮遊着せ替え「月のナイトライト」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "月のナイトライト",
		icon = "IslandDressIcon/dress_2020006",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10301,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2020006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10302] = {
		desc = "キャラ用足跡着せ替え「スターダストプリント」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "スターダストプリント",
		icon = "IslandDressIcon/dress_2030007",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10302,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2030007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10303] = {
		desc = "キャラ用背中着せ替え「ミスティックネット」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "ミスティックネット",
		icon = "IslandDressIcon/dress_2010005",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10303,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2010005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10304] = {
		desc = "インタラクション「断る」",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "断る",
		icon = "IslandActionIcon/refuse",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10304,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1019,
				1
			}
		}
	}
	pg.base.island_shop_goods[10305] = {
		desc = "インタラクション「あくび」",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "あくび",
		icon = "IslandActionIcon/yawn",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10305,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1020,
				1
			}
		}
	}
	pg.base.island_shop_goods[10306] = {
		desc = "インタラクション「汗を拭く」",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "汗を拭く",
		icon = "IslandActionIcon/wipingsweat",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10306,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1021,
				1
			}
		}
	}
	pg.base.island_shop_goods[10307] = {
		desc = "インタラクション「頭をかく」",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "頭をかく",
		icon = "IslandActionIcon/scratchinghead",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10307,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1022,
				1
			}
		}
	}
	pg.base.island_shop_goods[10308] = {
		desc = "ジャベリンの離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "ジャベリン-離島権限認証",
		icon = "IslandProps/item_200024",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20000,
		discount = 0,
		groups_detail_type = "",
		id = 10308,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200000
		},
		items = {
			{
				44,
				20121,
				1
			}
		}
	}
	pg.base.island_shop_goods[10309] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10309,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10310] = {
		desc = "収穫したばかりの新鮮な小麦。小麦粉を作るのに欠かせない原料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "小麦",
		icon = "IslandProps/item_2000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10310,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2000,
				10
			}
		}
	}
	pg.base.island_shop_goods[10311] = {
		desc = "黄金色に実ったとうもろこし。畑に甘い香りが漂う。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "とうもろこし",
		icon = "IslandProps/item_2001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10311,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2001,
				10
			}
		}
	}
	pg.base.island_shop_goods[10312] = {
		desc = "高品質な牧草。牧場に溢れるほどの活気を！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "牧草",
		icon = "IslandProps/item_2008",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10312,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2008,
				10
			}
		}
	}
	pg.base.island_shop_goods[10313] = {
		desc = "白くて上質な米。豊富なでんぷんと穀物たんぱく質を含む。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "米",
		icon = "IslandProps/item_2002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10313,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2002,
				10
			}
		}
	}
	pg.base.island_shop_goods[10314] = {
		desc = "みずみずしくておいしい白菜。採れたて新鮮！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "白菜",
		icon = "IslandProps/item_2003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10314,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2003,
				10
			}
		}
	}
	pg.base.island_shop_goods[10315] = {
		desc = "丸くてふっくら、たんぱく質が豊富。料理だけでなく工業にもいろいろ使われる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大豆",
		icon = "IslandProps/item_2006",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10315,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2006,
				10
			}
		}
	}
end)()
;(function()
	pg.base.island_shop_goods[10316] = {
		desc = "野菜界のでんぷん代表。様々な形に調理できる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "じゃがいも",
		icon = "IslandProps/item_2005",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 40,
		discount = 0,
		groups_detail_type = "",
		id = 10316,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			400
		},
		items = {
			{
				41,
				2005,
				10
			}
		}
	}
	pg.base.island_shop_goods[10317] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10317,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10318] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10318,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10319] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10319,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10320] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10320,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10321] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10321,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10322] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 6,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10322,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10323] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10323,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10324] = {
		desc = "経営テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの経営ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "経営教科書 T1",
		icon = "IslandProps/item_100011",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10324,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100011,
				1
			}
		}
	}
	pg.base.island_shop_goods[10325] = {
		desc = "農業テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの農業ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "農業教科書 T1",
		icon = "IslandProps/item_100021",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10325,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100021,
				1
			}
		}
	}
	pg.base.island_shop_goods[10326] = {
		desc = "制作テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの制作ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "制作教科書 T1",
		icon = "IslandProps/item_100031",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10326,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100031,
				1
			}
		}
	}
	pg.base.island_shop_goods[10327] = {
		desc = "採集テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの採集ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "採集教科書 T1",
		icon = "IslandProps/item_100041",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10327,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100041,
				1
			}
		}
	}
	pg.base.island_shop_goods[10328] = {
		desc = "飼養テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの採集ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "飼養教科書 T1",
		icon = "IslandProps/item_100051",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10328,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100051,
				1
			}
		}
	}
	pg.base.island_shop_goods[10329] = {
		desc = "料理テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの料理ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "料理教科書 T1",
		icon = "IslandProps/item_100061",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10329,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100061,
				1
			}
		}
	}
	pg.base.island_shop_goods[10330] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10330,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10331] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10331,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10332] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10332,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10333] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10333,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10334] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10334,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10335] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10335,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10336] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10336,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10337] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10337,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10338] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10338,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10339] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10339,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10340] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10340,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10341] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10341,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10342] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10342,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10343] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10343,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10344] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 8,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10344,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10345] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10345,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10346] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10346,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10347] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10347,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10348] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10348,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10349] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10349,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10350] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10350,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10351] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10351,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10352] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10352,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10353] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10353,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10354] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10354,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10355] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 50,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10355,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10356] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 15,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10356,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10357] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10357,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10358] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10358,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10359] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10359,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10360] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10360,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10361] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10361,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10362] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10362,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10363] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10363,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10364] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10364,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10365] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10365,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10366] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10366,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10367] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10367,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10368] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10368,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10369] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10369,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10401] = {
		desc = "キャラ用浮遊着せ替え「にゃんこコンパクトミラー」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "にゃんこコンパクトミラー",
		icon = "IslandDressIcon/dress_2020009",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10401,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2020009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10402] = {
		desc = "キャラ用背中着せ替え「肉球リップ」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "肉球リップ",
		icon = "IslandDressIcon/dress_2010007",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10402,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2010007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10403] = {
		desc = "キャラ用足跡着せ替え「ときめきリップ」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "ときめきリップ",
		icon = "IslandDressIcon/dress_2030010",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10403,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2030010,
				1
			}
		}
	}
	pg.base.island_shop_goods[10404] = {
		desc = "インタラクトアクション「ビシッ」",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "ビシッ",
		icon = "IslandActionIcon/point",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10404,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1025,
				1
			}
		}
	}
	pg.base.island_shop_goods[10405] = {
		desc = "インタラクトアクション「歓迎」",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "歓迎",
		icon = "IslandActionIcon/welcome",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10405,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1026,
				1
			}
		}
	}
	pg.base.island_shop_goods[10406] = {
		desc = "インタラクトアクション「見つめる」",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "見つめる",
		icon = "IslandActionIcon/lookover",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10406,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1027,
				1
			}
		}
	}
	pg.base.island_shop_goods[10407] = {
		desc = "インタラクトアクション「お腹ぽんぽん」",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "お腹ぽんぽん",
		icon = "IslandActionIcon/slapbelly",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10407,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1028,
				1
			}
		}
	}
	pg.base.island_shop_goods[10408] = {
		desc = "ベルファストの離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "ベルファスト-離島権限認証",
		icon = "IslandProps/item_200034",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20000,
		discount = 0,
		groups_detail_type = "",
		id = 10408,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200000
		},
		items = {
			{
				44,
				20212,
				1
			}
		}
	}
	pg.base.island_shop_goods[10409] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10409,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10410] = {
		desc = "収穫したばかりの新鮮な小麦。小麦粉を作るのに欠かせない原料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "小麦",
		icon = "IslandProps/item_2000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10410,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2000,
				10
			}
		}
	}
	pg.base.island_shop_goods[10411] = {
		desc = "黄金色に実ったとうもろこし。畑に甘い香りが漂う。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "とうもろこし",
		icon = "IslandProps/item_2001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10411,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2001,
				10
			}
		}
	}
	pg.base.island_shop_goods[10412] = {
		desc = "高品質な牧草。牧場に溢れるほどの活気を！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "牧草",
		icon = "IslandProps/item_2008",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10412,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2008,
				10
			}
		}
	}
	pg.base.island_shop_goods[10413] = {
		desc = "白くて上質な米。豊富なでんぷんと穀物たんぱく質を含む。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "米",
		icon = "IslandProps/item_2002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10413,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2002,
				10
			}
		}
	}
	pg.base.island_shop_goods[10414] = {
		desc = "みずみずしくておいしい白菜。採れたて新鮮！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "白菜",
		icon = "IslandProps/item_2003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10414,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2003,
				10
			}
		}
	}
	pg.base.island_shop_goods[10415] = {
		desc = "丸くてふっくら、たんぱく質が豊富。料理だけでなく工業にもいろいろ使われる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大豆",
		icon = "IslandProps/item_2006",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10415,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2006,
				10
			}
		}
	}
	pg.base.island_shop_goods[10416] = {
		desc = "野菜界のでんぷん代表。様々な形に調理できる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "じゃがいも",
		icon = "IslandProps/item_2005",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 40,
		discount = 0,
		groups_detail_type = "",
		id = 10416,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			400
		},
		items = {
			{
				41,
				2005,
				10
			}
		}
	}
	pg.base.island_shop_goods[10417] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10417,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10418] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10418,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10419] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10419,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10420] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10420,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10421] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10421,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10422] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 6,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10422,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10423] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10423,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10424] = {
		desc = "経営テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの経営ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "経営教科書 T1",
		icon = "IslandProps/item_100011",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10424,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100011,
				1
			}
		}
	}
	pg.base.island_shop_goods[10425] = {
		desc = "農業テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの農業ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "農業教科書 T1",
		icon = "IslandProps/item_100021",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10425,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100021,
				1
			}
		}
	}
	pg.base.island_shop_goods[10426] = {
		desc = "制作テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの制作ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "制作教科書 T1",
		icon = "IslandProps/item_100031",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10426,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100031,
				1
			}
		}
	}
	pg.base.island_shop_goods[10427] = {
		desc = "採集テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの採集ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "採集教科書 T1",
		icon = "IslandProps/item_100041",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10427,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100041,
				1
			}
		}
	}
	pg.base.island_shop_goods[10428] = {
		desc = "飼養テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの飼養ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "飼養教科書 T1",
		icon = "IslandProps/item_100051",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10428,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100051,
				1
			}
		}
	}
	pg.base.island_shop_goods[10429] = {
		desc = "料理テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの料理ステータスが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "料理教科書 T1",
		icon = "IslandProps/item_100061",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10429,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100061,
				1
			}
		}
	}
	pg.base.island_shop_goods[10430] = {
		desc = "経営テクニックを詳しく解説した指南教科書。使用すると、キャラクターの経営ステータスがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "経営教科書 T2",
		icon = "IslandProps/item_100012",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 4000,
		discount = 0,
		groups_detail_type = "",
		id = 10430,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40000
		},
		items = {
			{
				41,
				100012,
				1
			}
		}
	}
	pg.base.island_shop_goods[10431] = {
		desc = "農業テクニックを詳しく解説した指南教科書。使用すると、キャラクターの農業ステータスがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "農業教科書 T2",
		icon = "IslandProps/item_100022",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 4000,
		discount = 0,
		groups_detail_type = "",
		id = 10431,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40000
		},
		items = {
			{
				41,
				100022,
				1
			}
		}
	}
	pg.base.island_shop_goods[10432] = {
		desc = "制作テクニックを詳しく解説した指南教科書。使用すると、キャラクターの制作ステータスがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "制作教科書 T2",
		icon = "IslandProps/item_100032",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 4000,
		discount = 0,
		groups_detail_type = "",
		id = 10432,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40000
		},
		items = {
			{
				41,
				100032,
				1
			}
		}
	}
	pg.base.island_shop_goods[10433] = {
		desc = "採集テクニックを詳しく解説した指南教科書。使用すると、キャラクターの採集ステータスがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "採集教科書 T2",
		icon = "IslandProps/item_100042",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 4000,
		discount = 0,
		groups_detail_type = "",
		id = 10433,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40000
		},
		items = {
			{
				41,
				100042,
				1
			}
		}
	}
	pg.base.island_shop_goods[10434] = {
		desc = "飼養テクニックを詳しく解説した指南教科書。使用すると、キャラクターの飼養ステータスがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "飼養教科書 T2",
		icon = "IslandProps/item_100052",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 4000,
		discount = 0,
		groups_detail_type = "",
		id = 10434,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40000
		},
		items = {
			{
				41,
				100052,
				1
			}
		}
	}
	pg.base.island_shop_goods[10435] = {
		desc = "料理テクニックを詳しく解説した指南教科書。使用すると、キャラクターの料理ステータスがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "料理教科書 T2",
		icon = "IslandProps/item_100062",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 4000,
		discount = 0,
		groups_detail_type = "",
		id = 10435,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40000
		},
		items = {
			{
				41,
				100062,
				1
			}
		}
	}
	pg.base.island_shop_goods[10436] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10436,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10437] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10437,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10438] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10438,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10439] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10439,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10440] = {
		desc = "時の流れで深みが増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10440,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10441] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10441,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10442] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さと格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10442,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10443] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。手軽に遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10443,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10444] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10444,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10445] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10445,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10446] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10446,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
end)()
;(function()
	pg.base.island_shop_goods[10447] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10447,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10448] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10448,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10449] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10449,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10450] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 8,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10450,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10451] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10451,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10452] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10452,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10453] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10453,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10454] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10454,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10455] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10455,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10456] = {
		desc = "時の流れで深みが増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10456,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10457] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10457,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10458] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さと格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10458,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10459] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。手軽に遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10459,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10460] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10460,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10461] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 50,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10461,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10462] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 15,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10462,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10463] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10463,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10464] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10464,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10465] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10465,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10466] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10466,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10467] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10467,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10468] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10468,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10469] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10469,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10470] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10470,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10471] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10471,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10472] = {
		desc = "時の流れで深みが増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10472,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10473] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10473,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10474] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さと格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10474,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10475] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。手軽に遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10475,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[103000] = {
		desc = "コッコートリ専用の飼料。小麦を加工して作れる",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "コッコートリの餌",
		icon = "IslandProps/item_3000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 103000,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			2000,
			30
		},
		items = {
			{
				41,
				3000,
				10
			}
		}
	}
	pg.base.island_shop_goods[103001] = {
		desc = "ブーブーブタ専用の飼料。とうもろこしを加工して作れる",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "ブーブーブタの餌",
		icon = "IslandProps/item_3001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 103001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			2001,
			30
		},
		items = {
			{
				41,
				3001,
				10
			}
		}
	}
	pg.base.island_shop_goods[103002] = {
		desc = "モーモーウシ専用の飼料。牧草を加工して作れる",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "モーモーウシの餌",
		icon = "IslandProps/item_3002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 103002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			2008,
			30
		},
		items = {
			{
				41,
				3002,
				10
			}
		}
	}
	pg.base.island_shop_goods[103003] = {
		desc = "メェメーヒツジ専用の飼料。牧草を加工して作れる",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "メェメーヒツジの餌",
		icon = "IslandProps/item_3003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 103003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			2008,
			30
		},
		items = {
			{
				41,
				3003,
				10
			}
		}
	}
	pg.base.island_shop_goods[103004] = {
		desc = "小麦を挽いた小麦粉",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "小麦粉",
		icon = "IslandProps/item_3004",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 103004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			2000,
			6
		},
		items = {
			{
				41,
				3004,
				1
			}
		}
	}
	pg.base.island_shop_goods[111500] = {
		desc = "ミミズを模したルアー。リアルな見た目で、魚も食いつきやすい。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "ミミズ",
		icon = "IslandProps/item_1500",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111500,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				1500,
				1
			}
		}
	}
	pg.base.island_shop_goods[111502] = {
		desc = "こだわって作られたむきエビ状のルアー。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "むきエビ",
		icon = "IslandProps/item_1502",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111502,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			25000
		},
		items = {
			{
				41,
				1502,
				1
			}
		}
	}
	pg.base.island_shop_goods[111503] = {
		desc = "独特な形状を持つルアー。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "タコ足",
		icon = "IslandProps/item_1503",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111503,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			25000
		},
		items = {
			{
				41,
				1503,
				1
			}
		}
	}
	pg.base.island_shop_goods[111101] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "二枚貝類の稚貝。安定して成長し、養殖技術も確立されている。",
		goods_name = "稚貝",
		icon = "IslandProps/item_1101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111101,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			100
		},
		items = {
			{
				41,
				1101,
				1
			}
		},
		unlock = {
			3201003
		}
	}
	pg.base.island_shop_goods[111102] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "底生性の淡水魚の稚魚。低酸素環境に強く、泥底のいけすでの高密度養殖に適している。",
		goods_name = "ナマズの稚魚",
		icon = "IslandProps/item_1102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111102,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			100
		},
		items = {
			{
				41,
				1102,
				1
			}
		},
		unlock = {
			3201012
		}
	}
	pg.base.island_shop_goods[111103] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "淡水性の雑食魚の稚魚。環境への適応力が高く、さまざまな水質条件で安定して成長する。",
		goods_name = "コイの稚魚",
		icon = "IslandProps/item_1103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111103,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			150
		},
		items = {
			{
				41,
				1103,
				1
			}
		},
		unlock = {
			3201002
		}
	}
	pg.base.island_shop_goods[111104] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "小型の淡水魚の稚魚。主に藻類や有機物を食べ、生態系の維持に貢献する。",
		goods_name = "フナの稚魚",
		icon = "IslandProps/item_1104",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111104,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			150
		},
		items = {
			{
				41,
				1104,
				1
			}
		},
		unlock = {
			3201013
		}
	}
	pg.base.island_shop_goods[111105] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "淡水エビ類の幼体。残餌や一部の藻類を食べ、水域の清掃役として機能する。",
		goods_name = "稚エビ",
		icon = "IslandProps/item_1105",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111105,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				1105,
				1
			}
		},
		unlock = {
			3201001
		}
	}
	pg.base.island_shop_goods[111106] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "甲殻類の幼体。成長に伴って殻が赤く硬くなり、成体は人気の高い水産物として取引されている。",
		goods_name = "稚ザリ",
		icon = "IslandProps/item_1106",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111106,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				1106,
				1
			}
		},
		unlock = {
			3201004
		}
	}
	pg.base.island_shop_goods[111107] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "肉食性魚類の稚魚。肉質が柔らかく、上質な食用魚とされている。",
		goods_name = "スズキの稚魚",
		icon = "IslandProps/item_1107",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111107,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				1107,
				1
			}
		},
		unlock = {
			3201014
		}
	}
	pg.base.island_shop_goods[111108] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "脱皮を頻繁に行うカニの幼体。清く水質の良い環境での養殖が必要。",
		goods_name = "稚ガニ",
		icon = "IslandProps/item_1108",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111108,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			300
		},
		items = {
			{
				41,
				1108,
				1
			}
		},
		unlock = {
			3201008
		}
	}
	pg.base.island_shop_goods[111201] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "頭足類の稚魚。成長の過程で複数回の形態変化を経て、プリプリな肉質に至る。",
		goods_name = "稚イカ",
		icon = "IslandProps/item_1201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111201,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				1201,
				1
			}
		},
		unlock = {
			3201007
		}
	}
	pg.base.island_shop_goods[111202] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "肉食性魚類の稚魚。中層から表層の水域でよく見かけられ、成長性に優れる。",
		goods_name = "サワラの稚魚",
		icon = "IslandProps/item_1202",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111202,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			180
		},
		items = {
			{
				41,
				1202,
				1
			}
		},
		unlock = {
			3201009
		}
	}
	pg.base.island_shop_goods[111203] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "大型の外洋性魚類の稚魚。成長が早く、十分な酸素供給がある水域での養殖が求められる。",
		goods_name = "マグロの稚魚",
		icon = "IslandProps/item_1203",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111203,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			240
		},
		items = {
			{
				41,
				1203,
				1
			}
		},
		unlock = {
			3201010
		}
	}
	pg.base.island_shop_goods[111204] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "回遊性魚類の稚魚。低めの水温を好み、丁寧に育てることで良質な魚肉が得られる。",
		goods_name = "サーモンの稚魚",
		icon = "IslandProps/item_1204",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111204,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			240
		},
		items = {
			{
				41,
				1204,
				1
			}
		},
		unlock = {
			3201005
		}
	}
	pg.base.island_shop_goods[111205] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "暖水性の海水魚の稚魚。成長後は体色が鮮やかで、観賞価値が高い。",
		goods_name = "マダイの稚魚",
		icon = "IslandProps/item_1205",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111205,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				1205,
				1
			}
		},
		unlock = {
			3201015
		}
	}
	pg.base.island_shop_goods[111206] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "岩礁域に生息する魚類の稚魚。体質が頑健で、養殖の成功率が高い。",
		goods_name = "クロダイの稚魚",
		icon = "IslandProps/item_1206",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111206,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			180
		},
		items = {
			{
				41,
				1206,
				1
			}
		},
		unlock = {
			3201016
		}
	}
	pg.base.island_shop_goods[111207] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "キバタマグロの稚魚。遊泳速度が速く、養殖においては水中の酸素量に高い水準を求める。",
		goods_name = "キハダの稚魚",
		icon = "IslandProps/item_1207",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111207,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			360
		},
		items = {
			{
				41,
				1207,
				1
			}
		},
		unlock = {
			3201011
		}
	}
	pg.base.island_shop_goods[111208] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "底生性の棘皮動物の幼体。堆積した有機物を餌とし、いけすの底層を効率よく浄化してくれる。",
		goods_name = "稚ナマコ",
		icon = "IslandProps/item_1208",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111208,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			360
		},
		items = {
			{
				41,
				1208,
				1
			}
		},
		unlock = {
			3201006
		}
	}
	pg.base.island_shop_goods[411000] = {
		desc = "購入で「小麦の種」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "小麦の種",
		icon = "IslandProps/item_1000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411000,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20
		},
		items = {
			{
				41,
				1000,
				1
			}
		}
	}
	pg.base.island_shop_goods[411001] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「とうもろこしの種」を入手可能",
		goods_name = "とうもろこしの種",
		icon = "IslandProps/item_1001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40
		},
		items = {
			{
				41,
				1001,
				1
			}
		},
		unlock = {
			3101002
		}
	}
	pg.base.island_shop_goods[411002] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「陸稲の種」を入手可能",
		goods_name = "陸稲の種",
		icon = "IslandProps/item_1002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40
		},
		items = {
			{
				41,
				1002,
				1
			}
		},
		unlock = {
			3101005
		}
	}
	pg.base.island_shop_goods[411003] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「白菜の種」を入手可能",
		goods_name = "白菜の種",
		icon = "IslandProps/item_1003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60
		},
		items = {
			{
				41,
				1003,
				1
			}
		},
		unlock = {
			3101006
		}
	}
	pg.base.island_shop_goods[411004] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「ニンジンの種」を入手可能",
		goods_name = "ニンジンの種",
		icon = "IslandProps/item_1004",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			100
		},
		items = {
			{
				41,
				1004,
				1
			}
		},
		unlock = {
			3502006
		}
	}
	pg.base.island_shop_goods[411005] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「じゃがいもの種」を入手可能",
		goods_name = "じゃがいもの種",
		icon = "IslandProps/item_1005",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411005,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20
		},
		items = {
			{
				41,
				1005,
				1
			}
		},
		unlock = {
			3101008
		}
	}
	pg.base.island_shop_goods[411006] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「大豆の種」を入手可能",
		goods_name = "大豆の種",
		icon = "IslandProps/item_1006",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411006,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60
		},
		items = {
			{
				41,
				1006,
				1
			}
		},
		unlock = {
			3101007
		}
	}
	pg.base.island_shop_goods[411007] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「玉ねぎの種」を入手可能",
		goods_name = "玉ねぎの種",
		icon = "IslandProps/item_1007",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411007,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				1007,
				1
			}
		},
		unlock = {
			3502007
		}
	}
	pg.base.island_shop_goods[411008] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「牧草の種」を入手可能",
		goods_name = "牧草の種",
		icon = "IslandProps/item_1008",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411008,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20
		},
		items = {
			{
				41,
				1008,
				1
			}
		},
		unlock = {
			3101003
		}
	}
	pg.base.island_shop_goods[411009] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「コーヒーの木の種」を入手可能",
		goods_name = "コーヒーの木の種",
		icon = "IslandProps/item_1009",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411009,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				1009,
				1
			}
		},
		unlock = {
			3101004
		}
	}
	pg.base.island_shop_goods[411010] = {
		desc = "購入で「亜麻の種」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "亜麻の種",
		icon = "IslandProps/item_1010",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411010,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60
		},
		items = {
			{
				41,
				1010,
				1
			}
		}
	}
	pg.base.island_shop_goods[411011] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「いちごの種」を入手可能",
		goods_name = "いちごの種",
		icon = "IslandProps/item_1011",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411011,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				1011,
				1
			}
		},
		unlock = {
			3502002
		}
	}
	pg.base.island_shop_goods[411012] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「綿の種」を入手可能",
		goods_name = "綿の種",
		icon = "IslandProps/item_1012",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411012,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			80
		},
		items = {
			{
				41,
				1012,
				1
			}
		},
		unlock = {
			3502003
		}
	}
	pg.base.island_shop_goods[411014] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「茶の木の種」を入手可能",
		goods_name = "茶の木の種",
		icon = "IslandProps/item_1014",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411014,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			150
		},
		items = {
			{
				41,
				1014,
				1
			}
		},
		unlock = {
			3502004
		}
	}
	pg.base.island_shop_goods[411015] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「ラベンダーの種」を入手可能",
		goods_name = "ラベンダーの種",
		icon = "IslandProps/item_1015",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411015,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			160
		},
		items = {
			{
				41,
				1015,
				1
			}
		},
		unlock = {
			3502005
		}
	}
	pg.base.island_shop_goods[411016] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「りんごの木の種」を入手可能",
		goods_name = "りんごの木の種",
		icon = "IslandProps/item_1016",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411016,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			100
		},
		items = {
			{
				41,
				1016,
				1
			}
		},
		unlock = {
			3501001
		}
	}
	pg.base.island_shop_goods[411017] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「柑橘類の木の種」を入手可能",
		goods_name = "柑橘類の木の種",
		icon = "IslandProps/item_1017",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411017,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				1017,
				1
			}
		},
		unlock = {
			3501002
		}
	}
	pg.base.island_shop_goods[411018] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「バナナの木の種」を入手可能",
		goods_name = "バナナの木の種",
		icon = "IslandProps/item_1018",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411018,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			140
		},
		items = {
			{
				41,
				1018,
				1
			}
		},
		unlock = {
			3501003
		}
	}
	pg.base.island_shop_goods[411019] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「マンゴーの木の種」を入手可能",
		goods_name = "マンゴーの木の種",
		icon = "IslandProps/item_1019",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411019,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			180
		},
		items = {
			{
				41,
				1019,
				1
			}
		},
		unlock = {
			3501004
		}
	}
	pg.base.island_shop_goods[411020] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「レモンの木の種」を入手可能",
		goods_name = "レモンの木の種",
		icon = "IslandProps/item_1020",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411020,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			80
		},
		items = {
			{
				41,
				1020,
				1
			}
		},
		unlock = {
			3501005
		}
	}
	pg.base.island_shop_goods[411021] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「アボカドの木の種」を入手可能",
		goods_name = "アボカドの木の種",
		icon = "IslandProps/item_1021",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411021,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			240
		},
		items = {
			{
				41,
				1021,
				1
			}
		},
		unlock = {
			3501006
		}
	}
	pg.base.island_shop_goods[411022] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「ゴムの木の種」を入手可能",
		goods_name = "ゴムの木の種",
		icon = "IslandProps/item_1022",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411022,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			280
		},
		items = {
			{
				41,
				1022,
				1
			}
		},
		unlock = {
			3501007
		}
	}
	pg.base.island_shop_goods[411023] = {
		desc = "購入で「宵月梨の種」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "宵月梨の種",
		icon = "IslandProps/item_4006",
		goods_detail_type = 1,
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411023,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				4006,
				1
			}
		},
		time = {
			{
				{
					2026,
					8,
					6
				},
				{
					16,
					0,
					1
				}
			},
			{
				{
					2026,
					11,
					5
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[411024] = {
		desc = "購入で「柿の種」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "柿の種",
		icon = "IslandProps/item_4008",
		goods_detail_type = 1,
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411024,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			180
		},
		items = {
			{
				41,
				4008,
				1
			}
		},
		time = {
			{
				{
					2026,
					8,
					6
				},
				{
					16,
					0,
					1
				}
			},
			{
				{
					2026,
					11,
					5
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[411025] = {
		desc = "購入で「アスパラガスの種」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "アスパラガスの種",
		icon = "IslandProps/item_4020",
		goods_detail_type = 1,
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411025,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				4020,
				1
			}
		},
		time = {
			{
				{
					2026,
					2,
					5
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					5,
					7
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[411026] = {
		desc = "購入で「パイナップルの種」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "パイナップルの種",
		icon = "IslandProps/item_4022",
		goods_detail_type = 1,
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411026,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			180
		},
		items = {
			{
				41,
				4022,
				1
			}
		},
		time = {
			{
				{
					2026,
					2,
					5
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					5,
					7
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[411027] = {
		desc = "購入で「トマトの種」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "トマトの種",
		icon = "IslandProps/item_4034",
		goods_detail_type = 1,
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411027,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				4034,
				1
			}
		},
		time = {
			{
				{
					2026,
					5,
					7
				},
				{
					16,
					0,
					1
				}
			},
			{
				{
					2026,
					8,
					6
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[411028] = {
		desc = "購入で「キュウリの種」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "キュウリの種",
		icon = "IslandProps/item_4036",
		goods_detail_type = 1,
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411028,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			80
		},
		items = {
			{
				41,
				4036,
				1
			}
		},
		time = {
			{
				{
					2026,
					5,
					7
				},
				{
					16,
					0,
					1
				}
			},
			{
				{
					2026,
					8,
					6
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[412000] = {
		desc = "購入で「着せ替えカラー」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "着せ替えカラー",
		icon = "IslandGoodsIcon/3",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 412000,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			100
		},
		items = {
			{
				41,
				3,
				1
			}
		}
	}
	pg.base.island_shop_goods[412001] = {
		desc = "鎮海の離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "鎮海-離島権限認証",
		icon = "IslandProps/item_200017",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 412001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			500000
		},
		items = {
			{
				44,
				50601,
				1
			}
		}
	}
	pg.base.island_shop_goods[412002] = {
		desc = "ラフィーの離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "ラフィー-離島権限認証",
		icon = "IslandProps/item_200025",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 412002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			500000
		},
		items = {
			{
				44,
				10117,
				1
			}
		}
	}
	pg.base.island_shop_goods[412003] = {
		desc = "ロイヤル・フォーチュンの離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "ロイヤル・フォーチュン-離島権限認証",
		icon = "IslandProps/item_200033",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 412003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			500000
		},
		items = {
			{
				44,
				960001,
				1
			}
		}
	}
	pg.base.island_shop_goods[4600001] = {
		desc = "キャラ用浮遊着せ替え「ワタアメ雲」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "ワタアメ雲",
		icon = "IslandDressIcon/dress_2020001",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4600001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2020001,
				1
			}
		}
	}
	pg.base.island_shop_goods[4600002] = {
		desc = "キャラ用足跡着せ替え「舞桜見物」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "舞桜見物",
		icon = "IslandDressIcon/dress_2030004",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4600002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2030004,
				1
			}
		}
	}
	pg.base.island_shop_goods[4600003] = {
		desc = "キャラ用背中着せ替え「ロケットパック」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "ロケットパック",
		icon = "IslandDressIcon/dress_2010001",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4600003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2010001,
				1
			}
		}
	}
	pg.base.island_shop_goods[4620004] = {
		desc = "キャラ用浮遊着せ替え「夢幻泡影」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "夢幻泡影",
		icon = "IslandDressIcon/dress_2020004",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4620004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2020004,
				1
			}
		}
	}
	pg.base.island_shop_goods[4630005] = {
		desc = "キャラ用足跡着せ替え「密影遊魚」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "密影遊魚",
		icon = "IslandDressIcon/dress_2030005",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4630005,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2030005,
				1
			}
		}
	}
	pg.base.island_shop_goods[4610003] = {
		desc = "キャラ用背中着せ替え「釣りの趣」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "釣りの趣",
		icon = "IslandDressIcon/dress_2010003",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4610003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2010003,
				1
			}
		}
	}
	pg.base.island_shop_goods[4620007] = {
		desc = "キャラ用浮遊着せ替え「サマーアイス」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "サマーアイス",
		icon = "IslandDressIcon/dress_2020007",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4620007,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2020007,
				1
			}
		}
	}
	pg.base.island_shop_goods[4630008] = {
		desc = "キャラ用足跡着せ替え「フルーツバブル」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "フルーツバブル",
		icon = "IslandDressIcon/dress_2030008",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4630008,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2030008,
				1
			}
		}
	}
	pg.base.island_shop_goods[4610006] = {
		desc = "キャラ用背中着せ替え「ひんやりかき氷」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "ひんやりかき氷",
		icon = "IslandDressIcon/dress_2010006",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4610006,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2010006,
				1
			}
		}
	}
	pg.base.island_shop_goods[4620008] = {
		desc = "キャラ用浮遊着せ替え「ふわ羽根の猫じゃらし」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "ふわ羽根の猫じゃらし",
		icon = "IslandDressIcon/dress_2020008",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4620008,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2020008,
				1
			}
		}
	}
	pg.base.island_shop_goods[4630009] = {
		desc = "キャラ用足跡着せ替え「もふもふ肉球」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "にゃんこコンパクトミラー",
		icon = "IslandDressIcon/dress_2030009",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4630009,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2030009,
				1
			}
		}
	}
	pg.base.island_shop_goods[4610008] = {
		desc = "キャラ用背中着せ替え「ふわふわ猫しっぽ」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "もふもふ肉球",
		icon = "IslandDressIcon/dress_2010008",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4610008,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2010008,
				1
			}
		}
	}
	pg.base.island_shop_goods[5010001] = {
		desc = "進行中のタスクを1分間短縮できる。開発をもっとスピーディーに！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 100,
		limited_show = 1,
		unlock = "",
		goods_name = "1分加速券（シーズン）",
		icon = "IslandGoodsIcon/item_speedup_ticket1",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5010001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			1000
		},
		items = {
			{
				50,
				10001,
				1
			}
		},
		time = {
			{
				{
					2025,
					9,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					2,
					5
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5020001] = {
		desc = "進行中のタスクを10分間短縮できる。開発をもっとスピーディーに！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 30,
		limited_show = 1,
		unlock = "",
		goods_name = "10分加速券（シーズン）",
		icon = "IslandGoodsIcon/item_speedup_ticket2",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5020001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				50,
				20001,
				1
			}
		},
		time = {
			{
				{
					2025,
					9,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					2,
					5
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5030001] = {
		desc = "進行中のタスクを60分間短縮できる。開発をもっとスピーディーに！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "60分加速券（シーズン）",
		icon = "IslandGoodsIcon/item_speedup_ticket3",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5030001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60000
		},
		items = {
			{
				50,
				30001,
				1
			}
		},
		time = {
			{
				{
					2025,
					9,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					2,
					5
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
end)()
;(function()
	pg.base.island_shop_goods[5010002] = {
		desc = "進行中のタスクを1分短縮できる。開発をもっとスピーディーに！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 100,
		limited_show = 1,
		unlock = "",
		goods_name = "1分加速券（シーズン）",
		icon = "IslandGoodsIcon/item_speedup_ticket1",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5010002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			1000
		},
		items = {
			{
				50,
				10005,
				1
			}
		},
		time = {
			{
				{
					2026,
					2,
					5
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					5,
					7
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5020002] = {
		desc = "進行中のタスクを10分短縮できる。開発をもっとスピーディーに！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 30,
		limited_show = 1,
		unlock = "",
		goods_name = "10分加速券（シーズン）",
		icon = "IslandGoodsIcon/item_speedup_ticket2",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5020002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				50,
				20005,
				1
			}
		},
		time = {
			{
				{
					2026,
					2,
					5
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					5,
					7
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5030002] = {
		desc = "進行中のタスクを60分短縮できる。開発をもっとスピーディーに！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "60分加速券（シーズン）",
		icon = "IslandGoodsIcon/item_speedup_ticket3",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5030002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60000
		},
		items = {
			{
				50,
				30005,
				1
			}
		},
		time = {
			{
				{
					2026,
					2,
					5
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					5,
					7
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5010003] = {
		desc = "進行中のタスクを1分短縮できる。開発をもっとスピーディーに！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 100,
		limited_show = 1,
		unlock = "",
		goods_name = "1分加速券（シーズン）",
		icon = "IslandGoodsIcon/item_speedup_ticket1",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5010003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			1000
		},
		items = {
			{
				50,
				10006,
				1
			}
		},
		time = {
			{
				{
					2026,
					5,
					7
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					8,
					6
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5020003] = {
		desc = "進行中のタスクを10分短縮できる。開発をもっとスピーディーに！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 30,
		limited_show = 1,
		unlock = "",
		goods_name = "10分加速券（シーズン）",
		icon = "IslandGoodsIcon/item_speedup_ticket2",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5020003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				50,
				20006,
				1
			}
		},
		time = {
			{
				{
					2026,
					5,
					7
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					8,
					6
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5030003] = {
		desc = "進行中のタスクを60分短縮できる。開発をもっとスピーディーに！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "60分加速券（シーズン）",
		icon = "IslandGoodsIcon/item_speedup_ticket3",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5030003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60000
		},
		items = {
			{
				50,
				30006,
				1
			}
		},
		time = {
			{
				{
					2026,
					5,
					7
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					8,
					6
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5010004] = {
		desc = "進行中のタスクを1分間短縮できる。開発をもっとスピーディーに！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 100,
		limited_show = 1,
		unlock = "",
		goods_name = "1分加速券（シーズン）",
		icon = "IslandGoodsIcon/item_speedup_ticket1",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5010004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			1000
		},
		items = {
			{
				50,
				10007,
				1
			}
		},
		time = {
			{
				{
					2026,
					8,
					6
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					11,
					5
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5020004] = {
		desc = "進行中のタスクを10分間短縮できる。開発をもっとスピーディーに！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 30,
		limited_show = 1,
		unlock = "",
		goods_name = "10分加速券（シーズン）",
		icon = "IslandGoodsIcon/item_speedup_ticket2",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5020004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				50,
				20007,
				1
			}
		},
		time = {
			{
				{
					2026,
					8,
					6
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					11,
					5
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5030004] = {
		desc = "進行中のタスクを60分間短縮できる。開発をもっとスピーディーに！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "60分加速券（シーズン）",
		icon = "IslandGoodsIcon/item_speedup_ticket3",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5030004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60000
		},
		items = {
			{
				50,
				30007,
				1
			}
		},
		time = {
			{
				{
					2026,
					8,
					6
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					11,
					5
				},
				{
					16,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[471070301] = {
		desc = "サラトガの離島キャラ用衣装着せ替え・「キャンバスデー」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "キャンバスデー",
		icon = "IslandGoodsIcon/skin_1070301",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 471070301,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				1070301,
				1
			}
		}
	}
	pg.base.island_shop_goods[473120101] = {
		desc = "明石の離島キャラ用衣装着せ替え・「空鈴の夜」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "空鈴の夜",
		icon = "IslandGoodsIcon/skin_3120101",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 473120101,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				3120101,
				1
			}
		}
	}
	pg.base.island_shop_goods[471051701] = {
		desc = "ニュージャージーの離島キャラ用衣装着せ替え・「日々ステップ」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "日々ステップ",
		icon = "IslandGoodsIcon/skin_1051701",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 471051701,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				1051701,
				1
			}
		}
	}
	pg.base.island_shop_goods[471011001] = {
		desc = "ウィリアム・D・ポーターの離島キャラ用衣装着せ替え・「元気イッパイ！」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "元気イッパイ！",
		icon = "IslandGoodsIcon/skin_1011001",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 471011001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				1011001,
				1
			}
		}
	}
	pg.base.island_shop_goods[475060101] = {
		desc = "鎮海の離島キャラ用衣装着せ替え・「謀り事は後ほど」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "謀り事は後ほど",
		icon = "IslandGoodsIcon/skin_5060101",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 475060101,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				5060101,
				1
			}
		}
	}
	pg.base.island_shop_goods[474030301] = {
		desc = "プリンツ・オイゲンの離島キャラ用衣装着せ替え・「気だるいサービス」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "気だるいサービス",
		icon = "IslandGoodsIcon/skin_4030301",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 474030301,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				4030301,
				1
			}
		}
	}
	pg.base.island_shop_goods[471011701] = {
		desc = "ラフィーの離島キャラ用衣装着せ替え・「ウサウサのお休み」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "ウサウサのお休み",
		icon = "IslandGoodsIcon/skin_1011701",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 471011701,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				1011701,
				1
			}
		}
	}
	pg.base.island_shop_goods[472012101] = {
		desc = "ジャベリンの離島キャラ用衣装着せ替え・「枕投げ大会」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "枕投げ大会",
		icon = "IslandGoodsIcon/skin_2012101",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 472012101,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				2012101,
				1
			}
		}
	}
	pg.base.island_shop_goods[473031101] = {
		desc = "高雄の離島キャラ用衣装着せ替え・「素直な夜会話」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "素直な夜会話",
		icon = "IslandGoodsIcon/skin_3031101",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 473031101,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				3031101,
				1
			}
		}
	}
	pg.base.island_shop_goods[472021201] = {
		desc = "ベルファスト離島着せ替え「午後の一ページ」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "午後の一ページ",
		icon = "IslandGoodsIcon/skin_2021201",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 472021201,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				2021201,
				1
			}
		}
	}
	pg.base.island_shop_goods[479600011] = {
		desc = "ロイヤル・フォーチュン離島着せ替え「学園のプロローグ」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "学園のプロローグ",
		icon = "IslandGoodsIcon/skin_96000101",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 479600011,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				96000101,
				1
			}
		}
	}
	pg.base.island_shop_goods[99000101] = {
		desc = "ナビゲーターの離島キャラ用衣装着せ替え・「元気通学路」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "元気通学路",
		icon = "IslandGoodsIcon/skin_99000101",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 99000101,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000000
		},
		items = {
			{
				47,
				99000101,
				1
			}
		}
	}
	pg.base.island_shop_goods[99000102] = {
		desc = "ナビゲーターの離島キャラ用衣装着せ替え・「優等生のフリ」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "優等生のフリ",
		icon = "IslandGoodsIcon/skin_99000102",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 99000102,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000000
		},
		items = {
			{
				47,
				99000102,
				1
			}
		}
	}
	pg.base.island_shop_goods[99000201] = {
		desc = "TBの離島キャラ用衣装着せ替え・「幼い時間」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "幼い時間",
		icon = "IslandGoodsIcon/skin_99000201",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 99000201,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000000
		},
		items = {
			{
				47,
				99000201,
				1
			}
		}
	}
	pg.base.island_shop_goods[99000202] = {
		desc = "TBの離島キャラ用衣装着せ替え・「未熟な観察者」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "未熟な観察者",
		icon = "IslandGoodsIcon/skin_99000202",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 99000202,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000000
		},
		items = {
			{
				47,
				99000202,
				1
			}
		}
	}
	pg.base.island_shop_goods[99000301] = {
		desc = "スカベンジャーの離島キャラ用衣装着せ替え・「純真の囁き」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "純白の囁き",
		icon = "IslandGoodsIcon/skin_99000301",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 99000301,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000000
		},
		items = {
			{
				47,
				99000301,
				1
			}
		}
	}
	pg.base.island_shop_goods[99000302] = {
		desc = "スカベンジャーの離島キャラ用衣装着せ替え・「沈静の礼装」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "沈静の礼装",
		icon = "IslandGoodsIcon/skin_99000302",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 99000302,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000000
		},
		items = {
			{
				47,
				99000302,
				1
			}
		}
	}
	pg.base.island_shop_goods[461060015] = {
		desc = "購入すると着せ替え「バトルスーツ」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "バトルスーツ",
		icon = "IslandDressIcon/dress_1060015",
		goods_detail_type = 2,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 461060015,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			1100
		},
		items = {
			{
				46,
				1060015,
				1
			},
			{
				46,
				1060014,
				1
			},
			{
				46,
				1070015,
				1
			}
		},
		time = {
			{
				{
					2026,
					6,
					5
				},
				{
					12,
					0,
					0
				}
			},
			{
				{
					2026,
					6,
					18
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
end)()
