pg = pg or {}
pg.dorm3d_gift = rawget(pg, "dorm3d_gift") or setmetatable({
	__name = "dorm3d_gift"
}, confNEO)
pg.dorm3d_gift.all = {
	1021001,
	1021002,
	1021003,
	2022001,
	2022002,
	2022003,
	3022101,
	3022102,
	1990301,
	1990302,
	1051701,
	1051702,
	3070701,
	3070702,
	4990501,
	7990201,
	7990261
}
pg.dorm3d_gift.get_id_list_by_ship_group_id = {
	[0] = {
		1021001,
		1021002,
		1021003
	},
	[10517] = {
		1051701,
		1051702
	},
	[19903] = {
		1990301,
		1990302
	},
	[20220] = {
		2022001,
		2022002,
		2022003
	},
	[30221] = {
		3022101,
		3022102
	},
	[30707] = {
		3070701,
		3070702
	},
	[49905] = {
		4990501
	},
	[79902] = {
		7990201,
		7990261
	}
}
pg.base = pg.base or {}
pg.base.dorm3d_gift = {}

;(function()
	pg.base.dorm3d_gift[1021001] = {
		name = "ウサウサぬいぐるみ",
		display = "ピンク色のウサギのぬいぐるみ。柔らかい素材でふわふわで、抱き心地が最高。",
		time = "always",
		unlock_dialogue_id = 0,
		rarity = 2,
		id = 1021001,
		shop_id = "",
		ship_group_id = 0,
		favor_trigger_id = 1009,
		hide_if_not_owned = 0,
		icon = "dorm3dicon/3Ddrom_everyone_CommonGift3",
		reply_dialogue_id = {
			{
				20220,
				1501
			},
			{
				30221,
				20301
			},
			{
				19903,
				30301
			},
			{
				10517,
				110301
			},
			{
				30707,
				120301
			},
			{
				49905,
				140301
			},
			{
				79902,
				210301
			}
		},
		unlock_tips = {},
		unlock_banners = {
			{
				20220,
				{
					"banner_test"
				}
			},
			{
				30221,
				{
					"banner_nengdaigift"
				}
			},
			{
				19903,
				{
					"banner_ankeleiqigift"
				}
			},
			{
				10517,
				{
					"banner_xinzexigift"
				}
			},
			{
				30707,
				{
					"banner_dafeng"
				}
			},
			{
				49905,
				{
					"banner_aijier"
				}
			},
			{
				79902,
				{
					"banner_naximofu"
				}
			}
		}
	}
	pg.base.dorm3d_gift[1021002] = {
		name = "満点のロマンチック",
		display = "奥ゆかしい魅惑的な香りを放つ花束。バラとその他の赤色を基調とした花々が、情熱とロマンスを際立たせている。",
		time = "always",
		unlock_dialogue_id = 0,
		rarity = 3,
		id = 1021002,
		ship_group_id = 0,
		favor_trigger_id = 1010,
		hide_if_not_owned = 0,
		icon = "dorm3dicon/3Ddrom_everyone_CommonGift2",
		reply_dialogue_id = {
			{
				20220,
				1502
			},
			{
				30221,
				20302
			},
			{
				19903,
				30302
			},
			{
				10517,
				110302
			},
			{
				30707,
				120302
			},
			{
				49905,
				140302
			},
			{
				79902,
				210302
			}
		},
		shop_id = {
			260101,
			260102,
			260103,
			260104,
			260105
		},
		unlock_tips = {},
		unlock_banners = {
			{
				20220,
				{
					"banner_test"
				}
			},
			{
				30221,
				{
					"banner_nengdaigift"
				}
			},
			{
				19903,
				{
					"banner_ankeleiqigift"
				}
			},
			{
				10517,
				{
					"banner_xinzexigift"
				}
			},
			{
				30707,
				{
					"banner_dafeng"
				}
			},
			{
				49905,
				{
					"banner_aijier"
				}
			},
			{
				79902,
				{
					"banner_naximofu"
				}
			}
		}
	}
	pg.base.dorm3d_gift[1021003] = {
		name = "ケーキギフトボックス",
		display = "精緻にラッピングされた箱と美味しいカットケーキの詰め合わせ。自分で食べるのはもちろん、人に贈るプレゼントとしても嬉しいものだ。",
		time = "always",
		unlock_dialogue_id = 0,
		rarity = 4,
		id = 1021003,
		ship_group_id = 0,
		favor_trigger_id = 1019,
		hide_if_not_owned = 0,
		icon = "dorm3dicon/3Ddrom_everyone_CommonGift1",
		reply_dialogue_id = {
			{
				20220,
				1503
			},
			{
				30221,
				20303
			},
			{
				19903,
				30303
			},
			{
				10517,
				110303
			},
			{
				30707,
				120303
			},
			{
				49905,
				140303
			},
			{
				79902,
				210303
			}
		},
		shop_id = {
			260201,
			260202
		},
		unlock_tips = {},
		unlock_banners = {
			{
				20220,
				{
					"banner_test"
				}
			},
			{
				30221,
				{
					"banner_nengdaigift"
				}
			},
			{
				19903,
				{
					"banner_ankeleiqigift"
				}
			},
			{
				10517,
				{
					"banner_xinzexigift"
				}
			},
			{
				30707,
				{
					"banner_dafeng"
				}
			},
			{
				49905,
				{
					"banner_aijier"
				}
			},
			{
				79902,
				{
					"banner_naximofu"
				}
			}
		}
	}
	pg.base.dorm3d_gift[2022001] = {
		name = "清掃ツールボックス",
		display = "家や職場の清掃・整理に欠かせないアイテム。丈夫で耐久性に優れたケースが、中のツールを損傷から守ってくれる。",
		time = "always",
		unlock_dialogue_id = 10060,
		rarity = 4,
		id = 2022001,
		ship_group_id = 20220,
		favor_trigger_id = 1004,
		hide_if_not_owned = 0,
		icon = "dorm3dicon/3Ddrom_tianlangxing_FancyGift2",
		reply_dialogue_id = {
			{
				20220,
				1504
			}
		},
		shop_id = {
			260301
		},
		unlock_tips = {
			4
		},
		unlock_banners = {
			{
				20220,
				{
					"banner_gift2022001"
				}
			}
		}
	}
	pg.base.dorm3d_gift[2022002] = {
		name = "ロイヤルティーセット",
		display = "クラシックでエレガントなロイヤルティーセット。\n ゆったりした気持ちになる爽やかな「ブルー×ホワイト」のデザインで、ティータイムを優雅なひと時にしてくれる。",
		time = "always",
		unlock_dialogue_id = 10070,
		rarity = 4,
		id = 2022002,
		ship_group_id = 20220,
		favor_trigger_id = 1004,
		hide_if_not_owned = 0,
		icon = "dorm3dicon/3Ddrom_tianlangxing_FancyGift1",
		reply_dialogue_id = {
			{
				20220,
				1505
			}
		},
		shop_id = {
			260302
		},
		unlock_tips = {
			4
		},
		unlock_banners = {
			{
				20220,
				{
					"banner_gift2022002"
				}
			}
		}
	}
	pg.base.dorm3d_gift[2022003] = {
		name = "『完璧なメイド心得』",
		display = "踏み込んだ考察と事例で、完璧なメイドになるにはいかなる教養・スキル・心構えが必要かを詳しく説明してくれている。\n日常生活の中でもメイドとしての奉仕精神を十分に発揮すべきだとも訴えている。",
		time = "always",
		unlock_dialogue_id = 10080,
		rarity = 4,
		id = 2022003,
		ship_group_id = 20220,
		favor_trigger_id = 1004,
		hide_if_not_owned = 0,
		icon = "dorm3dicon/3Ddrom_tianlangxing_FancyGift4",
		reply_dialogue_id = {
			{
				20220,
				1506
			}
		},
		shop_id = {
			260303
		},
		unlock_tips = {
			4
		},
		unlock_banners = {
			{
				20220,
				{
					"banner_gift2022003"
				}
			}
		}
	}
	pg.base.dorm3d_gift[3022101] = {
		name = "素直ローファー",
		display = "シンプルなデザイン、シンプルな色。軽やかでいい履き心地。\n足裏にも快適にフィットし、日々に寄り添ってくれる。",
		time = "always",
		unlock_dialogue_id = 29991,
		rarity = 4,
		id = 3022101,
		ship_group_id = 30221,
		favor_trigger_id = 1004,
		hide_if_not_owned = 0,
		icon = "dorm3dicon/3Ddrom_nengdai_FancyGift1",
		reply_dialogue_id = {
			{
				30221,
				20304
			}
		},
		shop_id = {
			260321
		},
		unlock_tips = {
			4
		},
		unlock_banners = {
			{
				30221,
				{
					"banner_gift3022101"
				}
			}
		}
	}
	pg.base.dorm3d_gift[3022102] = {
		name = "フットマッサージャー",
		display = "疲れを癒やし心を癒やす、日々の体にエネルギー充填！",
		time = "always",
		unlock_dialogue_id = 20530,
		rarity = 4,
		id = 3022102,
		ship_group_id = 30221,
		favor_trigger_id = 1004,
		hide_if_not_owned = 0,
		icon = "dorm3dicon/3Ddrom_nengdai_FancyGift2",
		reply_dialogue_id = {
			{
				30221,
				20305
			}
		},
		shop_id = {
			260322
		},
		unlock_tips = {
			4
		},
		unlock_banners = {
			{
				30221,
				{
					"banner_gift3022102"
				}
			}
		}
	}
	pg.base.dorm3d_gift[1990301] = {
		name = "なないろ気持ち",
		display = "世界を凝縮させたような、可愛らしい色使いが見て取れるキャンバス。一筆一筆がアンカレッジの純真さを上手く表現しているようだ",
		time = "always",
		unlock_dialogue_id = 30510,
		rarity = 4,
		id = 1990301,
		ship_group_id = 19903,
		favor_trigger_id = 1004,
		hide_if_not_owned = 0,
		icon = "dorm3dicon/3Ddrom_ankeleiqi_FancyGift1",
		reply_dialogue_id = {
			{
				19903,
				30304
			}
		},
		shop_id = {
			260331
		},
		unlock_tips = {
			4
		},
		unlock_banners = {
			{
				19903,
				{
					"banner_gift1990301"
				}
			}
		}
	}
	pg.base.dorm3d_gift[1990302] = {
		name = "精緻な額縁",
		display = "原木の額縁にウェーブボウ、色彩と閃きがここに邂逅する。彼女だけのクリエイティブは喜びとともに咲き誇る",
		time = "always",
		unlock_dialogue_id = 30550,
		rarity = 4,
		id = 1990302,
		ship_group_id = 19903,
		favor_trigger_id = 1004,
		hide_if_not_owned = 0,
		icon = "dorm3dicon/3Ddrom_ankeleiqi_FancyGift2",
		reply_dialogue_id = {
			{
				19903,
				30305
			}
		},
		shop_id = {
			260332
		},
		unlock_tips = {
			4
		},
		unlock_banners = {
			{
				19903,
				{
					"banner_gift1990302"
				}
			}
		}
	}
	pg.base.dorm3d_gift[1051701] = {
		name = "水晶キャンディ",
		display = "透明なガラスボトルには、キラキラカラフルなキャンディがいっぱい。\n蓋を開けると、幸せな甘ったるい香りが鼻をくすぐってくる――",
		time = "always",
		unlock_dialogue_id = 110541,
		rarity = 4,
		id = 1051701,
		ship_group_id = 10517,
		favor_trigger_id = 1004,
		hide_if_not_owned = 0,
		icon = "dorm3dicon/3Ddrom_xinzexi_CommonFurniture4",
		reply_dialogue_id = {
			{
				10517,
				110304
			}
		},
		shop_id = {
			260401
		},
		unlock_tips = {
			4
		},
		unlock_banners = {
			{
				10517,
				{
					"banner_gift1051701"
				}
			}
		}
	}
	pg.base.dorm3d_gift[1051702] = {
		name = "ゲーミングパッド",
		display = "フィードバックが上々で、ゲーミングライトが鮮やか。カジュアルから手に汗握る対人マッチまでなんでもこなせる！",
		time = "always",
		unlock_dialogue_id = 110551,
		rarity = 4,
		id = 1051702,
		ship_group_id = 10517,
		favor_trigger_id = 1004,
		hide_if_not_owned = 0,
		icon = "dorm3dicon/3Ddrom_xinzexi_PremiumGift2",
		reply_dialogue_id = {
			{
				10517,
				110305
			}
		},
		shop_id = {
			260402
		},
		unlock_tips = {
			4
		},
		unlock_banners = {
			{
				10517,
				{
					"banner_gift1051702"
				}
			}
		}
	}
	pg.base.dorm3d_gift[3070701] = {
		name = "繋げられた愛",
		display = "鍵つき鎖付きのアクセサリー。シンプルながらも含みのあるデザイン。ひんやりとした金属質感の触り心地が、きっちり繋げられた愛を語ってくれる。",
		time = "always",
		unlock_dialogue_id = 120541,
		rarity = 4,
		id = 3070701,
		ship_group_id = 30707,
		favor_trigger_id = 1004,
		hide_if_not_owned = 0,
		icon = "dorm3dicon/3Ddrom_dafeng_FancyGift1",
		reply_dialogue_id = {
			{
				30707,
				120304
			}
		},
		shop_id = {
			260501
		},
		unlock_tips = {
			4
		},
		unlock_banners = {
			{
				30707,
				{
					"banner_gift3070701"
				}
			}
		}
	}
	pg.base.dorm3d_gift[3070702] = {
		name = "緋色の誘い",
		display = "緋色の裾は夕焼けのように広がり、黒いリボンを結ぶのは心の形。触れる指先に待つのは――温もりに隠しきれない想いと愛――",
		time = "always",
		unlock_dialogue_id = 120551,
		rarity = 4,
		id = 3070702,
		ship_group_id = 30707,
		favor_trigger_id = 1004,
		hide_if_not_owned = 0,
		icon = "dorm3dicon/3Ddrom_dafeng_FancyGift2",
		reply_dialogue_id = {
			{
				30707,
				120305
			}
		},
		shop_id = {
			260502
		},
		unlock_tips = {
			4
		},
		unlock_banners = {
			{
				30707,
				{
					"banner_gift3070702"
				}
			}
		}
	}
	pg.base.dorm3d_gift[4990501] = {
		name = "チューリップグラス",
		display = "まるで朝の光に包まれた蕾の如く、優雅で可憐なグラス。\n二人の思い出の全てが優しさとなり、曲線にそっと溶け込む",
		time = "always",
		unlock_dialogue_id = 140541,
		rarity = 4,
		id = 4990501,
		ship_group_id = 49905,
		favor_trigger_id = 1004,
		hide_if_not_owned = 0,
		icon = "dorm3dicon/3Ddrom_aijier_FancyGift1",
		reply_dialogue_id = {
			{
				49905,
				140304
			}
		},
		shop_id = {
			260601
		},
		unlock_tips = {
			4
		},
		unlock_banners = {
			{
				49905,
				{
					"banner_gift4990501"
				}
			}
		}
	}
	pg.base.dorm3d_gift[7990201] = {
		name = "本能トレーナー",
		display = "ぬいぐるみの魚で相手の視線を固定させる、本能トレーナーという名のおもちゃ。\n空中で弧を描くそれは、相手の最も純粋な本能を引き出すべく、誘惑を仕掛けていく。",
		time = "always",
		unlock_dialogue_id = 210541,
		rarity = 4,
		id = 7990201,
		ship_group_id = 79902,
		favor_trigger_id = 1004,
		hide_if_not_owned = 0,
		icon = "dorm3dicon/3Ddrom_naximofu_FancyGift1",
		reply_dialogue_id = {
			{
				79902,
				210304
			}
		},
		shop_id = {
			260701
		},
		unlock_tips = {
			4
		},
		unlock_banners = {
			{
				79902,
				{
					"banner_gift7990201"
				}
			}
		}
	}
	pg.base.dorm3d_gift[7990261] = {
		name = "絶海漁獲抱き枕",
		display = "柔らかい手触りで優しい抱き心地の、絶海の漁獲をテーマにした抱き枕。抱きしめてぼーっとしてもよし、寄りかかって休んでもよし",
		rarity = 4,
		unlock_dialogue_id = 0,
		id = 7990261,
		ship_group_id = 79902,
		favor_trigger_id = 1099,
		hide_if_not_owned = 1,
		icon = "dorm3dicon/3Ddrom_naximofu_FancyGift9",
		reply_dialogue_id = {
			{
				79902,
				210302
			}
		},
		shop_id = {},
		unlock_tips = {},
		unlock_banners = {
			{
				79902,
				{
					"banner_naximofu"
				}
			}
		},
		time = {
			{
				{
					2026,
					6,
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
					7,
					23
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
