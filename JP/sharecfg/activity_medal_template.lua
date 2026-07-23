pg = pg or {}
pg.activity_medal_template = rawget(pg, "activity_medal_template") or setmetatable({
	__name = "activity_medal_template"
}, confNEO)
pg.activity_medal_template.all = {
	571101,
	571102,
	571103,
	571104,
	571105,
	571106,
	571107,
	571108,
	576901,
	576902,
	576903,
	576904,
	576905,
	576906,
	576907,
	576908,
	581201,
	581202,
	581203,
	581204,
	581205,
	581206,
	581207,
	581208,
	587501,
	587502,
	587503,
	587504,
	587505,
	587506,
	587507,
	587508,
	591301,
	591302,
	591303,
	591304,
	591305,
	591306,
	591307,
	591308,
	597001,
	597002,
	597003,
	597004,
	597005,
	597006,
	597007,
	597008,
	597101,
	597102,
	597103,
	597104,
	597105,
	597106,
	597107,
	5002101,
	5002102,
	5002103,
	5002104,
	5002105,
	5002106,
	5002107,
	5002108,
	5008701,
	5008702,
	5008703,
	5008704,
	5008705,
	5008706,
	5008707,
	5008708,
	5013601,
	5013602,
	5013603,
	5013604,
	5013605,
	5013606,
	5013607,
	5013608,
	5020901,
	5020902,
	5020903,
	5020904,
	5020905,
	5020906,
	5020907,
	5020908,
	5029501,
	5029502,
	5029503,
	5029504,
	5029505,
	5029506,
	5029507,
	5029508,
	5035901,
	5035902,
	5035903,
	5035904,
	5035905,
	5035906,
	5035907,
	5035908,
	5040501,
	5040502,
	5040503,
	5040504,
	5040505,
	5040506,
	5040507,
	5040508,
	5044101,
	5044102,
	5044103,
	5044104,
	5044105,
	5044106,
	5044107,
	5044108,
	5048201,
	5048202,
	5048203,
	5048204,
	5048205,
	5048206,
	5048207,
	5048208,
	5060701,
	5060702,
	5060703,
	5060704,
	5060705,
	5060706,
	5060707,
	5060708,
	5061601,
	5061602,
	5061603,
	5061604,
	5061605,
	5061606,
	5061607,
	5065901,
	5065902,
	5065903,
	5065904,
	5065905,
	5065906,
	5065907,
	5065908,
	5107801,
	5107802,
	5107803,
	5107804,
	5107805,
	5107806,
	5107807,
	5107808
}
pg.activity_medal_template.get_id_list_by_group = {
	[5711] = {
		571101,
		571102,
		571103,
		571104,
		571105,
		571106,
		571107,
		571108
	},
	[5769] = {
		576901,
		576902,
		576903,
		576904,
		576905,
		576906,
		576907,
		576908
	},
	[5812] = {
		581201,
		581202,
		581203,
		581204,
		581205,
		581206,
		581207,
		581208
	},
	[5875] = {
		587501,
		587502,
		587503,
		587504,
		587505,
		587506,
		587507,
		587508
	},
	[5913] = {
		591301,
		591302,
		591303,
		591304,
		591305,
		591306,
		591307,
		591308
	},
	[5970] = {
		597001,
		597002,
		597003,
		597004,
		597005,
		597006,
		597007,
		597008
	},
	[5971] = {
		597101,
		597102,
		597103,
		597104,
		597105,
		597106,
		597107
	},
	[50021] = {
		5002101,
		5002102,
		5002103,
		5002104,
		5002105,
		5002106,
		5002107,
		5002108
	},
	[50087] = {
		5008701,
		5008702,
		5008703,
		5008704,
		5008705,
		5008706,
		5008707,
		5008708
	},
	[50136] = {
		5013601,
		5013602,
		5013603,
		5013604,
		5013605,
		5013606,
		5013607,
		5013608
	},
	[50209] = {
		5020901,
		5020902,
		5020903,
		5020904,
		5020905,
		5020906,
		5020907,
		5020908
	},
	[50295] = {
		5029501,
		5029502,
		5029503,
		5029504,
		5029505,
		5029506,
		5029507,
		5029508
	},
	[50359] = {
		5035901,
		5035902,
		5035903,
		5035904,
		5035905,
		5035906,
		5035907,
		5035908
	},
	[50405] = {
		5040501,
		5040502,
		5040503,
		5040504,
		5040505,
		5040506,
		5040507,
		5040508
	},
	[50441] = {
		5044101,
		5044102,
		5044103,
		5044104,
		5044105,
		5044106,
		5044107,
		5044108
	},
	[50482] = {
		5048201,
		5048202,
		5048203,
		5048204,
		5048205,
		5048206,
		5048207,
		5048208
	},
	[50607] = {
		5060701,
		5060702,
		5060703,
		5060704,
		5060705,
		5060706,
		5060707,
		5060708
	},
	[50616] = {
		5061601,
		5061602,
		5061603,
		5061604,
		5061605,
		5061606,
		5061607
	},
	[50659] = {
		5065901,
		5065902,
		5065903,
		5065904,
		5065905,
		5065906,
		5065907,
		5065908
	},
	[51078] = {
		5107801,
		5107802,
		5107803,
		5107804,
		5107805,
		5107806,
		5107807,
		5107808
	}
}
pg.base = pg.base or {}
pg.base.activity_medal_template = {}

;(function()
	pg.base.activity_medal_template[571101] = {
		prefab_node = "1",
		next_medal = 0,
		item = 65501,
		remake_task_id = 0,
		group = 5711,
		task_id = 21035,
		medal_asset = "ActivityMedal/571101",
		activity_medal_name = "ステッカー：ルメイ",
		id = 571101,
		activity_medal_desc = "几帳面な性格の鉄血レジスタンスのリーダー。「我は常に貴殿を見ているとも」"
	}
	pg.base.activity_medal_template[571102] = {
		prefab_node = "2",
		next_medal = 0,
		item = 65502,
		remake_task_id = 0,
		group = 5711,
		task_id = 21036,
		medal_asset = "ActivityMedal/571102",
		activity_medal_name = "ステッカー：星の獣",
		id = 571102,
		activity_medal_desc = "遥かな星空より出でしもの。その正体は謎に包まれている。"
	}
	pg.base.activity_medal_template[571103] = {
		prefab_node = "3",
		next_medal = 0,
		item = 65503,
		remake_task_id = 0,
		group = 5711,
		task_id = 21037,
		medal_asset = "ActivityMedal/571103",
		activity_medal_name = "ステッカー：星空",
		id = 571103,
		activity_medal_desc = "星の獣が現れし夜、仄かな夜空はいつもよりも輝かしく見えた。"
	}
	pg.base.activity_medal_template[571104] = {
		prefab_node = "4",
		next_medal = 0,
		item = 65504,
		remake_task_id = 0,
		group = 5711,
		task_id = 21038,
		medal_asset = "ActivityMedal/571104",
		activity_medal_name = "ステッカー：サンプル",
		id = 571104,
		activity_medal_desc = "外なる獣の残骸から収集したサンプル。化学原料として扱われるため、食用にはならない。"
	}
	pg.base.activity_medal_template[571105] = {
		prefab_node = "5",
		next_medal = 0,
		item = 65505,
		remake_task_id = 0,
		group = 5711,
		task_id = 21039,
		medal_asset = "ActivityMedal/571105",
		activity_medal_name = "ステッカー：夕日の基地",
		id = 571105,
		activity_medal_desc = "鏡面海域と「エターナル・スター」によって守られているレジスタンス基地。居住性がいいとは言えないが守りが堅い。"
	}
	pg.base.activity_medal_template[571106] = {
		prefab_node = "6",
		next_medal = 0,
		item = 65506,
		remake_task_id = 0,
		group = 5711,
		task_id = 21040,
		medal_asset = "ActivityMedal/571106",
		activity_medal_name = "ステッカー：乱戦の夜",
		id = 571106,
		activity_medal_desc = "外なる獣の勢力は強大だが、こっちも十分準備した。乱戦の夜さえ乗り切れば、希望の曙光が見えてくるはずだ。"
	}
	pg.base.activity_medal_template[571107] = {
		prefab_node = "7",
		next_medal = 0,
		item = 65507,
		remake_task_id = 0,
		group = 5711,
		task_id = 21041,
		medal_asset = "ActivityMedal/571107",
		activity_medal_name = "ステッカー：星よりもたらされしもの",
		id = 571107,
		activity_medal_desc = "「私は星の獣。星を導きて現れ、星を携え去り行く。私にひれ伏せ、私の名を讃え、私の命に従え」"
	}
	pg.base.activity_medal_template[571108] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65508,
		remake_task_id = 0,
		group = 5711,
		task_id = 21042,
		medal_asset = "ActivityMedal/571108",
		activity_medal_name = "ステッカー：饅頭カーリング",
		id = 571108,
		activity_medal_desc = "こっちはハウスだピョ！ストーンはハウスを狙うピョ！"
	}
	pg.base.activity_medal_template[576901] = {
		prefab_node = "1",
		next_medal = 0,
		item = 65511,
		remake_task_id = 0,
		group = 5769,
		task_id = 21118,
		medal_asset = "ActivityMedal/576901",
		activity_medal_name = "ステッカー；風華霓裳",
		id = 576901,
		activity_medal_desc = "「刺繍羅裳晩春を照らし、輝かせば金孔雀に銀麒麟」"
	}
	pg.base.activity_medal_template[576902] = {
		prefab_node = "2",
		next_medal = 0,
		item = 65512,
		remake_task_id = 0,
		group = 5769,
		task_id = 21119,
		medal_asset = "ActivityMedal/576902",
		activity_medal_name = "ステッカー：旭日東天",
		id = 576902,
		activity_medal_desc = "「空ゆく雁は鳴きわたり、朝の日は初めて昇る。士もし妻をめとらば、氷のいまだとけぬまに」"
	}
	pg.base.activity_medal_template[576903] = {
		prefab_node = "3",
		next_medal = 0,
		item = 65513,
		remake_task_id = 0,
		group = 5769,
		task_id = 21120,
		medal_asset = "ActivityMedal/576903",
		activity_medal_name = "ステッカー：掛け軸",
		id = 576903,
		activity_medal_desc = "「詩を推敲すは雪月風花の夜、絵をしたためるは江湖煙雨の空」"
	}
	pg.base.activity_medal_template[576904] = {
		prefab_node = "4",
		next_medal = 0,
		item = 65514,
		remake_task_id = 0,
		group = 5769,
		task_id = 21121,
		medal_asset = "ActivityMedal/576904",
		activity_medal_name = "ステッカー：雪中観梅",
		id = 576904,
		activity_medal_desc = "「梅は須く雪に三分の白を遜るべく、雪は却って梅に一段の香を輸す」"
	}
	pg.base.activity_medal_template[576905] = {
		prefab_node = "5",
		next_medal = 0,
		item = 65515,
		remake_task_id = 0,
		group = 5769,
		task_id = 21122,
		medal_asset = "ActivityMedal/576905",
		activity_medal_name = "ステッカー：朱雀乗風",
		id = 576905,
		activity_medal_desc = "大冒険はもっと派手に！もっと熱く！"
	}
	pg.base.activity_medal_template[576906] = {
		prefab_node = "6",
		next_medal = 0,
		item = 65516,
		remake_task_id = 0,
		group = 5769,
		task_id = 21123,
		medal_asset = "ActivityMedal/576906",
		activity_medal_name = "ステッカー：捲き雲",
		id = 576906,
		activity_medal_desc = "「行いては到る、水の窮まるところ。 坐しては看る、雲の起こるとき」"
	}
	pg.base.activity_medal_template[576907] = {
		prefab_node = "7",
		next_medal = 0,
		item = 65517,
		remake_task_id = 0,
		group = 5769,
		task_id = 21124,
		medal_asset = "ActivityMedal/576907",
		activity_medal_name = "ステッカー：縁糸",
		id = 576907,
		activity_medal_desc = "「折に穫る同心の蓮、繋ぐ縁糸はいと長し」"
	}
	pg.base.activity_medal_template[576908] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65518,
		remake_task_id = 0,
		group = 5769,
		task_id = 21125,
		medal_asset = "ActivityMedal/576908",
		activity_medal_name = "ステッカー：秘密計画書",
		id = 576908,
		activity_medal_desc = "建武大魔王を打倒し（削除線が引かれている）、新春大冒険を祝う計画書！"
	}
	pg.base.activity_medal_template[581201] = {
		prefab_node = "1",
		next_medal = 0,
		item = 65541,
		remake_task_id = 0,
		group = 5812,
		task_id = 21278,
		medal_asset = "ActivityMedal/581201",
		activity_medal_name = "ステッカー：聖翼の心象",
		id = 581201,
		activity_medal_desc = "「永久なりし大地、サルデーニャ。神の光が輝く限り、かの繁栄は永久に続くものなり」"
	}
	pg.base.activity_medal_template[581202] = {
		prefab_node = "2",
		next_medal = 0,
		item = 65542,
		remake_task_id = 0,
		group = 5812,
		task_id = 21279,
		medal_asset = "ActivityMedal/581202",
		activity_medal_name = "ステッカー：神光の織網",
		id = 581202,
		activity_medal_desc = "「信仰の心象こそ私たちをつなげているから」"
	}
	pg.base.activity_medal_template[581203] = {
		prefab_node = "3",
		next_medal = 0,
		item = 65543,
		remake_task_id = 0,
		group = 5812,
		task_id = 21280,
		medal_asset = "ActivityMedal/581203",
		activity_medal_name = "ステッカー：偽神機の凝視",
		id = 581203,
		activity_medal_desc = "「あれが偽神機ドロイドよ。いまあなたのことを見つめているから」"
	}
	pg.base.activity_medal_template[581204] = {
		prefab_node = "4",
		next_medal = 0,
		item = 65544,
		remake_task_id = 0,
		group = 5812,
		task_id = 21281,
		medal_asset = "ActivityMedal/581204",
		activity_medal_name = "ステッカー：お絵かきラフ",
		id = 581204,
		activity_medal_desc = "「あたし絵を書くのが大好きだよぉん☆」"
	}
	pg.base.activity_medal_template[581205] = {
		prefab_node = "5",
		next_medal = 0,
		item = 65545,
		remake_task_id = 0,
		group = 5812,
		task_id = 21282,
		medal_asset = "ActivityMedal/581205",
		activity_medal_name = "ステッカー：カウントダウン",
		id = 581205,
		activity_medal_desc = "「時間が刻一刻と過ぎているわ。一体いつになったら籠檻から抜け出せるのかしら」"
	}
	pg.base.activity_medal_template[581206] = {
		prefab_node = "6",
		next_medal = 0,
		item = 65546,
		remake_task_id = 0,
		group = 5812,
		task_id = 21283,
		medal_asset = "ActivityMedal/581206",
		activity_medal_name = "ステッカー：戦車の審判機",
		id = 581206,
		activity_medal_desc = "「力と圧迫感。そいつがメカアービトレイター・戦車だ」"
	}
	pg.base.activity_medal_template[581207] = {
		prefab_node = "7",
		next_medal = 0,
		item = 65547,
		remake_task_id = 0,
		group = 5812,
		task_id = 21284,
		medal_asset = "ActivityMedal/581207",
		activity_medal_name = "ステッカー：永夜の冠",
		id = 581207,
		activity_medal_desc = "「冠を戴く者はその重さを覚悟せねばならない」"
	}
	pg.base.activity_medal_template[581208] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65548,
		remake_task_id = 0,
		group = 5812,
		task_id = 21285,
		medal_asset = "ActivityMedal/581208",
		activity_medal_name = "ステッカー：偽神機の触腕",
		id = 581208,
		activity_medal_desc = "「広くて長い、ノリのような触感。食用禁止」"
	}
	pg.base.activity_medal_template[587501] = {
		prefab_node = "1",
		next_medal = 0,
		item = 65571,
		remake_task_id = 0,
		group = 5875,
		task_id = 21651,
		medal_asset = "ActivityMedal/587501",
		activity_medal_name = "ステッカー：バレー病院",
		id = 587501,
		activity_medal_desc = "バレー病院とは……（略）"
	}
	pg.base.activity_medal_template[587502] = {
		prefab_node = "2",
		next_medal = 0,
		item = 65572,
		remake_task_id = 0,
		group = 5875,
		task_id = 21652,
		medal_asset = "ActivityMedal/587502",
		activity_medal_name = "ステッカー：猫パンチ！",
		id = 587502,
		activity_medal_desc = "世界で最も鋭いパンチよ。一撃を受けきれる？"
	}
	pg.base.activity_medal_template[587503] = {
		prefab_node = "3",
		next_medal = 0,
		item = 65573,
		remake_task_id = 0,
		group = 5875,
		task_id = 21653,
		medal_asset = "ActivityMedal/587503",
		activity_medal_name = "ステッカー：怪しい錠剤",
		id = 587503,
		activity_medal_desc = "怪しい錠剤。病気にかかってない人のみ使用可能。"
	}
	pg.base.activity_medal_template[587504] = {
		prefab_node = "4",
		next_medal = 0,
		item = 65574,
		remake_task_id = 0,
		group = 5875,
		task_id = 21654,
		medal_asset = "ActivityMedal/587504",
		activity_medal_name = "ステッカー：病院の秘密",
		id = 587504,
		activity_medal_desc = "バレー病院の秘密を知りたい？"
	}
	pg.base.activity_medal_template[587505] = {
		prefab_node = "5",
		next_medal = 0,
		item = 65575,
		remake_task_id = 0,
		group = 5875,
		task_id = 21655,
		medal_asset = "ActivityMedal/587505",
		activity_medal_name = "ステッカー：天狐の髪飾り",
		id = 587505,
		activity_medal_desc = "髪飾りの「重さ」を背負えるかしら？"
	}
	pg.base.activity_medal_template[587506] = {
		prefab_node = "6",
		next_medal = 0,
		item = 65576,
		remake_task_id = 0,
		group = 5875,
		task_id = 21656,
		medal_asset = "ActivityMedal/587506",
		activity_medal_name = "ステッカー：手がかり",
		id = 587506,
		activity_medal_desc = "絡み合った情報から事件の真実を突き止められるか？"
	}
	pg.base.activity_medal_template[587507] = {
		prefab_node = "7",
		next_medal = 0,
		item = 65577,
		remake_task_id = 0,
		group = 5875,
		task_id = 21657,
		medal_asset = "ActivityMedal/587507",
		activity_medal_name = "ステッカー：お注射の時間",
		id = 587507,
		activity_medal_desc = "もう一丁、チクッとしますわ"
	}
	pg.base.activity_medal_template[587508] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65578,
		remake_task_id = 0,
		group = 5875,
		task_id = 21658,
		medal_asset = "ActivityMedal/587508",
		activity_medal_name = "ステッカー：ファミリーぬい",
		id = 587508,
		activity_medal_desc = "頑張らないとファミリーのぬいぐるみにされるらしい。怖い。"
	}
	pg.base.activity_medal_template[591301] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65594,
		remake_task_id = 0,
		group = 5913,
		task_id = 21944,
		medal_asset = "ActivityMedal/591301",
		activity_medal_name = "ステッカー：新緑の杖",
		id = 591301,
		activity_medal_desc = "緑の力を杖で循環させましょう。古い葉を摘み取れば、新芽は自ら生まれます"
	}
	pg.base.activity_medal_template[591302] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65595,
		remake_task_id = 0,
		group = 5913,
		task_id = 21945,
		medal_asset = "ActivityMedal/591302",
		activity_medal_name = "ステッカー：未来への花束",
		id = 591302,
		activity_medal_desc = "チュリッパ王国の新たな未来は、ここから始まる"
	}
	pg.base.activity_medal_template[591303] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65596,
		remake_task_id = 0,
		group = 5913,
		task_id = 21946,
		medal_asset = "ActivityMedal/591303",
		activity_medal_name = "ステッカー：熊の守り",
		id = 591303,
		activity_medal_desc = "恐れることはないわ。鋭い牙も爪も、我が子を守るためにあるんだから"
	}
	pg.base.activity_medal_template[591304] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65597,
		remake_task_id = 0,
		group = 5913,
		task_id = 21947,
		medal_asset = "ActivityMedal/591304",
		activity_medal_name = "ステッカー：蔦魔法",
		id = 591304,
		activity_medal_desc = "蔦は自然を編み、命は棲み家を再建する"
	}
	pg.base.activity_medal_template[591305] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65598,
		remake_task_id = 0,
		group = 5913,
		task_id = 21948,
		medal_asset = "ActivityMedal/591305",
		activity_medal_name = "ステッカー：全領域強襲コーシカゴーグル",
		id = 591305,
		activity_medal_desc = "ただの飾りではなく、暗視に無線通信に光フィルターに爆弾発射まで備えた天才的発明ですよぉ！"
	}
	pg.base.activity_medal_template[591306] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65599,
		remake_task_id = 0,
		group = 5913,
		task_id = 21949,
		medal_asset = "ActivityMedal/591306",
		activity_medal_name = "ステッカー：葉脈共生",
		id = 591306,
		activity_medal_desc = "芽生えたばかりの新芽でも、岩にも劣らぬ強靭な力を秘めている"
	}
	pg.base.activity_medal_template[591307] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65600,
		remake_task_id = 0,
		group = 5913,
		task_id = 21950,
		medal_asset = "ActivityMedal/591307",
		activity_medal_name = "ステッカー：新型戦闘兵器「スフィルニダエ」",
		id = 591307,
		activity_medal_desc = "凶悪極まりなく、雑魚…いや、サメに似た超・弩級根絶武装「スフィルニダエ」だぜ！"
	}
	pg.base.activity_medal_template[591308] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65601,
		remake_task_id = 0,
		group = 5913,
		task_id = 21951,
		medal_asset = "ActivityMedal/591308",
		activity_medal_name = "ステッカー：チューリップの栞",
		id = 591308,
		activity_medal_desc = "チューリップの香りがする精巧な栞。魔法で永久に鮮やかに保たれる"
	}
	pg.base.activity_medal_template[597001] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65603,
		remake_task_id = 0,
		group = 5970,
		task_id = 21715,
		medal_asset = "ActivityMedal/597001",
		activity_medal_name = "ステッカー：薔薇の塔",
		id = 597001,
		activity_medal_desc = "薔薇を纏うその塔は、ロイヤルの最後の栄光を背負っている。"
	}
	pg.base.activity_medal_template[597002] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65604,
		remake_task_id = 0,
		group = 5970,
		task_id = 21716,
		medal_asset = "ActivityMedal/597002",
		activity_medal_name = "ステッカー：光翼の獅子",
		id = 597002,
		activity_medal_desc = "「硬いしおしりが痛くなるし！」ーーミスDより"
	}
	pg.base.activity_medal_template[597003] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65605,
		remake_task_id = 0,
		group = 5970,
		task_id = 21717,
		medal_asset = "ActivityMedal/597003",
		activity_medal_name = "ステッカー：メセケテット",
		id = 597003,
		activity_medal_desc = "これで特異点をくぐり抜け、未知なる世界へと旅立とう！"
	}
	pg.base.activity_medal_template[597004] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65606,
		remake_task_id = 0,
		group = 5970,
		task_id = 21718,
		medal_asset = "ActivityMedal/597004",
		activity_medal_name = "ステッカー：航路ビーコン",
		id = 597004,
		activity_medal_desc = "「奇跡再現―アレキサンドリア大灯台」が搭載している航路ビーコン。ちなみに図柄はクレオパトラの特注らしい。"
	}
	pg.base.activity_medal_template[597005] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65607,
		remake_task_id = 0,
		group = 5970,
		task_id = 21719,
		medal_asset = "ActivityMedal/597005",
		activity_medal_name = "ステッカー：見敵必戦",
		id = 597005,
		activity_medal_desc = "ロイヤルネイビー、会敵必戦！"
	}
	pg.base.activity_medal_template[597006] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65608,
		remake_task_id = 0,
		group = 5970,
		task_id = 21720,
		medal_asset = "ActivityMedal/597006",
		activity_medal_name = "ステッカー：満月の蕾",
		id = 597006,
		activity_medal_desc = "一体誰が作り出したのか？なぜ？"
	}
	pg.base.activity_medal_template[597007] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65609,
		remake_task_id = 0,
		group = 5970,
		task_id = 21721,
		medal_asset = "ActivityMedal/597007",
		activity_medal_name = "ステッカー：薔薇の要塞",
		id = 597007,
		activity_medal_desc = "薔薇の塔、城壁、そしてそれをつなぐ通路ーーこれぞ薔薇の要塞のすべてだ。"
	}
	pg.base.activity_medal_template[597008] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65610,
		remake_task_id = 0,
		group = 5970,
		task_id = 21722,
		medal_asset = "ActivityMedal/597008",
		activity_medal_name = "ステッカー：二色の薔薇",
		id = 597008,
		activity_medal_desc = "赤い薔薇でありながら、白い薔薇でもある。"
	}
	pg.base.activity_medal_template[597101] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65612,
		remake_task_id = 0,
		group = 5971,
		task_id = 21724,
		medal_asset = "ActivityMedal/597101",
		activity_medal_name = "ステッカー：充実な一日",
		id = 597101,
		activity_medal_desc = "充実した一日が終わった……明日も明後日も明明後日も待っている！"
	}
	pg.base.activity_medal_template[597102] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65613,
		remake_task_id = 0,
		group = 5971,
		task_id = 21725,
		medal_asset = "ActivityMedal/597102",
		activity_medal_name = "ステッカー：リトルハンマー",
		id = 597102,
		activity_medal_desc = "ハンマー……チャンス！"
	}
	pg.base.activity_medal_template[597103] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65614,
		remake_task_id = 0,
		group = 5971,
		task_id = 21726,
		medal_asset = "ActivityMedal/597103",
		activity_medal_name = "ステッカー：釣り上げ",
		id = 597103,
		activity_medal_desc = "どうして大きいのを釣れたことが分かるんだい？"
	}
	pg.base.activity_medal_template[597104] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65615,
		remake_task_id = 0,
		group = 5971,
		task_id = 21727,
		medal_asset = "ActivityMedal/597104",
		activity_medal_name = "ステッカー：水中の浮き輪",
		id = 597104,
		activity_medal_desc = "しまった！浮き輪が海に落ちた！溺れる前に浮き輪を…あれ？"
	}
	pg.base.activity_medal_template[597105] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65616,
		remake_task_id = 0,
		group = 5971,
		task_id = 21728,
		medal_asset = "ActivityMedal/597105",
		activity_medal_name = "ステッカー：プレイヤーワン",
		id = 597105,
		activity_medal_desc = "トップ達成おめでとう！IDを送って報酬を手に入れよう！"
	}
	pg.base.activity_medal_template[597106] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65617,
		remake_task_id = 0,
		group = 5971,
		task_id = 21729,
		medal_asset = "ActivityMedal/597106",
		activity_medal_name = "ステッカー：収穫の瞬間",
		id = 597106,
		activity_medal_desc = "野生のキャッチャーが野生の宝箱を捕獲した大事な瞬間。"
	}
	pg.base.activity_medal_template[597107] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65618,
		remake_task_id = 0,
		group = 5971,
		task_id = 21730,
		medal_asset = "ActivityMedal/597107",
		activity_medal_name = "ステッカー：もう一隻",
		id = 597107,
		activity_medal_desc = "もう一隻分を…あと一隻分物資をくれぇ……"
	}
	pg.base.activity_medal_template[5002101] = {
		prefab_node = "1",
		next_medal = 0,
		item = 65632,
		remake_task_id = 0,
		group = 50021,
		task_id = 21777,
		medal_asset = "ActivityMedal/5002101",
		activity_medal_name = "ステッカー：シティの探索者",
		id = 5002101,
		activity_medal_desc = "もしかして君が潜入者？"
	}
	pg.base.activity_medal_template[5002102] = {
		prefab_node = "2",
		next_medal = 0,
		item = 65633,
		remake_task_id = 0,
		group = 50021,
		task_id = 21778,
		medal_asset = "ActivityMedal/5002102",
		activity_medal_name = "ステッカー：手錠",
		id = 5002102,
		activity_medal_desc = "はいはい、分かったらこれ以上は署で聞くよ。"
	}
	pg.base.activity_medal_template[5002103] = {
		prefab_node = "3",
		next_medal = 0,
		item = 65634,
		remake_task_id = 0,
		group = 50021,
		task_id = 21779,
		medal_asset = "ActivityMedal/5002103",
		activity_medal_name = "ステッカー：手旗",
		id = 5002103,
		activity_medal_desc = "年間ノークレームの最優秀ツアーガイド……ってツアー数もゼロ！？"
	}
	pg.base.activity_medal_template[5002104] = {
		prefab_node = "4",
		next_medal = 0,
		item = 65635,
		remake_task_id = 0,
		group = 50021,
		task_id = 21780,
		medal_asset = "ActivityMedal/5002104",
		activity_medal_name = "ステッカー：巡回の相棒",
		id = 5002104,
		activity_medal_desc = "小型で軽い分、計り知れないスピードが出せる。まさに最高の相棒だ。"
	}
	pg.base.activity_medal_template[5002105] = {
		prefab_node = "5",
		next_medal = 0,
		item = 65636,
		remake_task_id = 0,
		group = 50021,
		task_id = 21781,
		medal_asset = "ActivityMedal/5002105",
		activity_medal_name = "ステッカー：ウサウサ警官",
		id = 5002105,
		activity_medal_desc = "ウサウサセキュリティが捜査中よ！"
	}
	pg.base.activity_medal_template[5002106] = {
		prefab_node = "6",
		next_medal = 0,
		item = 65637,
		remake_task_id = 0,
		group = 50021,
		task_id = 21782,
		medal_asset = "ActivityMedal/5002106",
		activity_medal_name = "ステッカー：秩序の帽子",
		id = 5002106,
		activity_medal_desc = "守ってこその秩序だ！"
	}
	pg.base.activity_medal_template[5002107] = {
		prefab_node = "7",
		next_medal = 0,
		item = 65638,
		remake_task_id = 0,
		group = 50021,
		task_id = 21783,
		medal_asset = "ActivityMedal/5002107",
		activity_medal_name = "ステッカー：注視",
		id = 5002107,
		activity_medal_desc = "……ずっとあなたのことを見ているよ……"
	}
	pg.base.activity_medal_template[5002108] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65639,
		remake_task_id = 0,
		group = 50021,
		task_id = 21784,
		medal_asset = "ActivityMedal/5002108",
		activity_medal_name = "ステッカー：メタ視点",
		id = 5002108,
		activity_medal_desc = "悪くはないが、やっぱりもう一回撮ろう！"
	}
	pg.base.activity_medal_template[5008701] = {
		prefab_node = "1",
		next_medal = 0,
		item = 65666,
		remake_task_id = 0,
		group = 50087,
		task_id = 21803,
		medal_asset = "ActivityMedal/5008701",
		activity_medal_name = "ステッカー：淵層より",
		id = 5008701,
		activity_medal_desc = "流星落ちて淵層が形作られ、災い来たりし時に聖典現る"
	}
	pg.base.activity_medal_template[5008702] = {
		prefab_node = "2",
		next_medal = 0,
		item = 65667,
		remake_task_id = 0,
		group = 50087,
		task_id = 21804,
		medal_asset = "ActivityMedal/5008702",
		activity_medal_name = "ステッカー：アズィル城",
		id = 5008702,
		activity_medal_desc = "ウロボロス魔法学院がある街。ありとあらゆる営みがかの淵層と関わっている"
	}
	pg.base.activity_medal_template[5008703] = {
		prefab_node = "3",
		next_medal = 0,
		item = 65668,
		remake_task_id = 0,
		group = 50087,
		task_id = 21805,
		medal_asset = "ActivityMedal/5008703",
		activity_medal_name = "ステッカー：武装制御ファクタ",
		id = 5008703,
		activity_medal_desc = "これぐらいプルーズに任せればいいわよ♪"
	}
	pg.base.activity_medal_template[5008704] = {
		prefab_node = "4",
		next_medal = 0,
		item = 65669,
		remake_task_id = 0,
		group = 50087,
		task_id = 21806,
		medal_asset = "ActivityMedal/5008704",
		activity_medal_name = "ステッカー：古代ゴーレム",
		id = 5008704,
		activity_medal_desc = "敵を屈服させる最善の方法は、大火力でねじ伏せることだ！"
	}
	pg.base.activity_medal_template[5008705] = {
		prefab_node = "5",
		next_medal = 0,
		item = 65670,
		remake_task_id = 0,
		group = 50087,
		task_id = 21807,
		medal_asset = "ActivityMedal/5008705",
		activity_medal_name = "ステッカー：母なる精霊の木",
		id = 5008705,
		activity_medal_desc = "枯れ枝を必死に空に伸ばすそれは神々の色褪せた王冠の如く、凋落していく定めの中で最後のエルフの血筋を必死に守ろうとしている"
	}
	pg.base.activity_medal_template[5008706] = {
		prefab_node = "6",
		next_medal = 0,
		item = 65671,
		remake_task_id = 0,
		group = 50087,
		task_id = 21808,
		medal_asset = "ActivityMedal/5008706",
		activity_medal_name = "ステッカー：悪魔の目",
		id = 5008706,
		activity_medal_desc = "魔姫はあんたのことを見ているわ――"
	}
	pg.base.activity_medal_template[5008707] = {
		prefab_node = "7",
		next_medal = 0,
		item = 65672,
		remake_task_id = 0,
		group = 50087,
		task_id = 21809,
		medal_asset = "ActivityMedal/5008707",
		activity_medal_name = "ステッカー：腐朽の木",
		id = 5008707,
		activity_medal_desc = "天を衝く古の巨木は、今や忘れ去られし切り株だけが残った。"
	}
	pg.base.activity_medal_template[5008708] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65673,
		remake_task_id = 0,
		group = 50087,
		task_id = 21810,
		medal_asset = "ActivityMedal/5008708",
		activity_medal_name = "ステッカー：氷雪の王冠",
		id = 5008708,
		activity_medal_desc = "寒冬要塞よ、あなたたちの冬将軍が戻ってきた！"
	}
	pg.base.activity_medal_template[5013601] = {
		prefab_node = "1",
		next_medal = 0,
		item = 65686,
		remake_task_id = 0,
		group = 50136,
		task_id = 21836,
		medal_asset = "ActivityMedal/5013601",
		activity_medal_name = "ステッカー：天域アマハラ",
		id = 5013601,
		activity_medal_desc = "「天域は外域の屏なり。アマハラは天域に因りて定まる。たとえ地崩れ山潰え、浩劫来たるとも――天域アマハラ、永存を要す」"
	}
	pg.base.activity_medal_template[5013602] = {
		prefab_node = "2",
		next_medal = 0,
		item = 65687,
		remake_task_id = 0,
		group = 50136,
		task_id = 21837,
		medal_asset = "ActivityMedal/5013602",
		activity_medal_name = "ステッカー：鳳の影",
		id = 5013602,
		activity_medal_desc = "鳳の舞う影は麗しく、鳳の鳴き声がアマハラに響き渡る"
	}
	pg.base.activity_medal_template[5013603] = {
		prefab_node = "3",
		next_medal = 0,
		item = 65688,
		remake_task_id = 0,
		group = 50136,
		task_id = 21838,
		medal_asset = "ActivityMedal/5013603",
		activity_medal_name = "ステッカー：アマハラの舞",
		id = 5013603,
		activity_medal_desc = "雲に乗り、アマハラに舞い奉れ"
	}
	pg.base.activity_medal_template[5013604] = {
		prefab_node = "4",
		next_medal = 0,
		item = 65689,
		remake_task_id = 0,
		group = 50136,
		task_id = 21839,
		medal_asset = "ActivityMedal/5013604",
		activity_medal_name = "ステッカー：アマハラ絵巻",
		id = 5013604,
		activity_medal_desc = "絵巻に描かれしは、アマハラの景なり"
	}
	pg.base.activity_medal_template[5013605] = {
		prefab_node = "5",
		next_medal = 0,
		item = 65690,
		remake_task_id = 0,
		group = 50136,
		task_id = 21840,
		medal_asset = "ActivityMedal/5013605",
		activity_medal_name = "ステッカー：雲海の佳醸",
		id = 5013605,
		activity_medal_desc = "訪れし客人よ、佳醸を召し上がれ"
	}
	pg.base.activity_medal_template[5013606] = {
		prefab_node = "6",
		next_medal = 0,
		item = 65691,
		remake_task_id = 0,
		group = 50136,
		task_id = 21841,
		medal_asset = "ActivityMedal/5013606",
		activity_medal_name = "ステッカー：魘魔の息吹",
		id = 5013606,
		activity_medal_desc = "▂▃▆▂▃▆▇▂▃▇█▆▆▇▇▆▇"
	}
	pg.base.activity_medal_template[5013607] = {
		prefab_node = "7",
		next_medal = 0,
		item = 65692,
		remake_task_id = 0,
		group = 50136,
		task_id = 21842,
		medal_asset = "ActivityMedal/5013607",
		activity_medal_name = "ステッカー：霊狐",
		id = 5013607,
		activity_medal_desc = "ふわふわもこもこ、でも触れられない……"
	}
	pg.base.activity_medal_template[5013608] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65693,
		remake_task_id = 0,
		group = 50136,
		task_id = 21843,
		medal_asset = "ActivityMedal/5013608",
		activity_medal_name = "ステッカー：幻夢石",
		id = 5013608,
		activity_medal_desc = "額に当てれば、幻夢が具現化する"
	}
	pg.base.activity_medal_template[5020901] = {
		prefab_node = "1",
		next_medal = 0,
		item = 65723,
		remake_task_id = 0,
		group = 50209,
		task_id = 21850,
		medal_asset = "ActivityMedal/5020901",
		activity_medal_name = "ステッカー：自由群島",
		id = 5020901,
		activity_medal_desc = "自由群島。自由を求める人々の群島。"
	}
	pg.base.activity_medal_template[5020902] = {
		prefab_node = "2",
		next_medal = 0,
		item = 65724,
		remake_task_id = 0,
		group = 50209,
		task_id = 21851,
		medal_asset = "ActivityMedal/5020902",
		activity_medal_name = "ステッカー：復讐の女王船団",
		id = 5020902,
		activity_medal_desc = "復讐の女王船団のステッカー！"
	}
	pg.base.activity_medal_template[5020903] = {
		prefab_node = "3",
		next_medal = 0,
		item = 65725,
		remake_task_id = 0,
		group = 50209,
		task_id = 21852,
		medal_asset = "ActivityMedal/5020903",
		activity_medal_name = "ステッカー：テンペスタ船団",
		id = 5020903,
		activity_medal_desc = "テンペスタ船団のステッカー！"
	}
	pg.base.activity_medal_template[5020904] = {
		prefab_node = "4",
		next_medal = 0,
		item = 65726,
		remake_task_id = 0,
		group = 50209,
		task_id = 21853,
		medal_asset = "ActivityMedal/5020904",
		activity_medal_name = "ステッカー：壁雲の守り手",
		id = 5020904,
		activity_medal_desc = "壁雲の守り手のステッカー！"
	}
	pg.base.activity_medal_template[5020905] = {
		prefab_node = "5",
		next_medal = 0,
		item = 65727,
		remake_task_id = 0,
		group = 50209,
		task_id = 21854,
		medal_asset = "ActivityMedal/5020905",
		activity_medal_name = "ステッカー：遺跡灯台",
		id = 5020905,
		activity_medal_desc = "自由群島に位置する遺跡灯台。秘密が隠されている。"
	}
	pg.base.activity_medal_template[5020906] = {
		prefab_node = "6",
		next_medal = 0,
		item = 65728,
		remake_task_id = 0,
		group = 50209,
		task_id = 21855,
		medal_asset = "ActivityMedal/5020906",
		activity_medal_name = "ステッカー：女神教会",
		id = 5020906,
		activity_medal_desc = "女神教会のステッカー！"
	}
	pg.base.activity_medal_template[5020907] = {
		prefab_node = "7",
		next_medal = 0,
		item = 65729,
		remake_task_id = 0,
		group = 50209,
		task_id = 21856,
		medal_asset = "ActivityMedal/5020907",
		activity_medal_name = "ステッカー：木のコンパス",
		id = 5020907,
		activity_medal_desc = "ロイヤル・フォーチュン手製の木のコンパス。とてつもなく本物に見える"
	}
	pg.base.activity_medal_template[5020908] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65730,
		remake_task_id = 0,
		group = 50209,
		task_id = 21857,
		medal_asset = "ActivityMedal/5020908",
		activity_medal_name = "ステッカー：トレジャーハンター",
		id = 5020908,
		activity_medal_desc = "トレジャーハンターのステッカー！"
	}
	pg.base.activity_medal_template[5029501] = {
		prefab_node = "1",
		next_medal = 0,
		item = 65786,
		remake_task_id = 0,
		group = 50295,
		task_id = 21874,
		medal_asset = "ActivityMedal/5029501",
		activity_medal_name = "ステッカー：天穹の星",
		id = 5029501,
		activity_medal_desc = "ヴェールの下で、天穹の星々が今もなお輝いている"
	}
	pg.base.activity_medal_template[5029502] = {
		prefab_node = "2",
		next_medal = 0,
		item = 65787,
		remake_task_id = 0,
		group = 50295,
		task_id = 21875,
		medal_asset = "ActivityMedal/5029502",
		activity_medal_name = "ステッカー：ブルーゴースト",
		id = 5029502,
		activity_medal_desc = "長い夢を、見ていたような……"
	}
	pg.base.activity_medal_template[5029503] = {
		prefab_node = "3",
		next_medal = 0,
		item = 65788,
		remake_task_id = 0,
		group = 50295,
		task_id = 21876,
		medal_asset = "ActivityMedal/5029503",
		activity_medal_name = "ステッカー：銀河の星",
		id = 5029503,
		activity_medal_desc = "ここにて星々の声に耳を傾けよう"
	}
	pg.base.activity_medal_template[5029504] = {
		prefab_node = "4",
		next_medal = 0,
		item = 65789,
		remake_task_id = 0,
		group = 50295,
		task_id = 21877,
		medal_asset = "ActivityMedal/5029504",
		activity_medal_name = "ステッカー：死神",
		id = 5029504,
		activity_medal_desc = "死神にして、死神にあらず"
	}
	pg.base.activity_medal_template[5029505] = {
		prefab_node = "5",
		next_medal = 0,
		item = 65790,
		remake_task_id = 0,
		group = 50295,
		task_id = 21878,
		medal_asset = "ActivityMedal/5029505",
		activity_medal_name = "ステッカー：月と玉輪",
		id = 5029505,
		activity_medal_desc = "「今人は見ず　古時の月　今月は曾経て　古人を照らせり」"
	}
	pg.base.activity_medal_template[5029506] = {
		prefab_node = "6",
		next_medal = 0,
		item = 65791,
		remake_task_id = 0,
		group = 50295,
		task_id = 21879,
		medal_asset = "ActivityMedal/5029506",
		activity_medal_name = "ステッカー：ギンギツネ",
		id = 5029506,
		activity_medal_desc = "はじめまして、アズールレーンの指揮官。私のことは「ギンギツネ」と呼んでください"
	}
	pg.base.activity_medal_template[5029507] = {
		prefab_node = "7",
		next_medal = 0,
		item = 65792,
		remake_task_id = 0,
		group = 50295,
		task_id = 21880,
		medal_asset = "ActivityMedal/5029507",
		activity_medal_name = "ステッカー：ヘレナ",
		id = 5029507,
		activity_medal_desc = "いつかまた出会えるから"
	}
	pg.base.activity_medal_template[5029508] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65793,
		remake_task_id = 0,
		group = 50295,
		task_id = 21881,
		medal_asset = "ActivityMedal/5029508",
		activity_medal_name = "ステッカー：理事評議会",
		id = 5029508,
		activity_medal_desc = "ここにミサイルが落ちてきたら……"
	}
	pg.base.activity_medal_template[5035901] = {
		prefab_node = "1",
		next_medal = 0,
		item = 65803,
		remake_task_id = 0,
		group = 50359,
		task_id = 21884,
		medal_asset = "ActivityMedal/5035901",
		activity_medal_name = "ステッカー：撮影進行中！",
		id = 5035901,
		activity_medal_desc = "一番ナウい子は誰だ？そう、私だ！"
	}
	pg.base.activity_medal_template[5035902] = {
		prefab_node = "2",
		next_medal = 0,
		item = 65804,
		remake_task_id = 0,
		group = 50359,
		task_id = 21885,
		medal_asset = "ActivityMedal/5035902",
		activity_medal_name = "ステッカー：カメラ",
		id = 5035902,
		activity_medal_desc = "3、2、1！チーズ——"
	}
	pg.base.activity_medal_template[5035903] = {
		prefab_node = "3",
		next_medal = 0,
		item = 65805,
		remake_task_id = 0,
		group = 50359,
		task_id = 21886,
		medal_asset = "ActivityMedal/5035903",
		activity_medal_name = "ステッカー：ハンガー",
		id = 5035903,
		activity_medal_desc = "ハンガーは、衣装をかけるのに使われるものだ…"
	}
	pg.base.activity_medal_template[5035904] = {
		prefab_node = "4",
		next_medal = 0,
		item = 65806,
		remake_task_id = 0,
		group = 50359,
		task_id = 21887,
		medal_asset = "ActivityMedal/5035904",
		activity_medal_name = "ステッカー：クレーンマシン",
		id = 5035904,
		activity_medal_desc = "あとちょっと……あとちょっとだけ捕まえる……！"
	}
	pg.base.activity_medal_template[5035905] = {
		prefab_node = "5",
		next_medal = 0,
		item = 65807,
		remake_task_id = 0,
		group = 50359,
		task_id = 21888,
		medal_asset = "ActivityMedal/5035905",
		activity_medal_name = "ステッカー：スポットライト",
		id = 5035905,
		activity_medal_desc = "注目の的になる準備はできていて？"
	}
end)()
;(function()
	pg.base.activity_medal_template[5035906] = {
		prefab_node = "6",
		next_medal = 0,
		item = 65808,
		remake_task_id = 0,
		group = 50359,
		task_id = 21889,
		medal_asset = "ActivityMedal/5035906",
		activity_medal_name = "ステッカー：ファッション",
		id = 5035906,
		activity_medal_desc = "ここからは――ファッションランジェリー特集撮影の時間！"
	}
	pg.base.activity_medal_template[5035907] = {
		prefab_node = "7",
		next_medal = 0,
		item = 65809,
		remake_task_id = 0,
		group = 50359,
		task_id = 21890,
		medal_asset = "ActivityMedal/5035907",
		activity_medal_name = "ステッカー：フルーツアルバム",
		id = 5035907,
		activity_medal_desc = "同じ果物でも、撮り方は100通りもある？"
	}
	pg.base.activity_medal_template[5035908] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65810,
		remake_task_id = 0,
		group = 50359,
		task_id = 21891,
		medal_asset = "ActivityMedal/5035908",
		activity_medal_name = "ステッカー：フィルム",
		id = 5035908,
		activity_medal_desc = "カメラを見ていない瞬間も含めて、全てを記録するよ！"
	}
	pg.base.activity_medal_template[5040501] = {
		prefab_node = "1",
		next_medal = 0,
		item = 65849,
		remake_task_id = 0,
		group = 50405,
		task_id = 21893,
		medal_asset = "ActivityMedal/5040501",
		activity_medal_name = "ｽﾃｯｶｰ：春の懐玉",
		id = 5040501,
		activity_medal_desc = "君子良佩、その想いは誰に結ばれるのか。"
	}
	pg.base.activity_medal_template[5040502] = {
		prefab_node = "2",
		next_medal = 0,
		item = 65850,
		remake_task_id = 0,
		group = 50405,
		task_id = 21894,
		medal_asset = "ActivityMedal/5040502",
		activity_medal_name = "ｽﾃｯｶｰ：飛ぶ灯籠",
		id = 5040502,
		activity_medal_desc = "さあ、会場の視線はすべて私に――。"
	}
	pg.base.activity_medal_template[5040503] = {
		prefab_node = "3",
		next_medal = 0,
		item = 65851,
		remake_task_id = 0,
		group = 50405,
		task_id = 21895,
		medal_asset = "ActivityMedal/5040503",
		activity_medal_name = "ｽﾃｯｶｰ：月の香り",
		id = 5040503,
		activity_medal_desc = "月色が山あいを包み、漂う香りが心の琴線に触れる。"
	}
	pg.base.activity_medal_template[5040504] = {
		prefab_node = "4",
		next_medal = 0,
		item = 65852,
		remake_task_id = 0,
		group = 50405,
		task_id = 21896,
		medal_asset = "ActivityMedal/5040504",
		activity_medal_name = "ｽﾃｯｶｰ：ｵｰｸｼｮﾝｶﾞﾍﾞﾙ",
		id = 5040504,
		activity_medal_desc = "カン——落札！"
	}
	pg.base.activity_medal_template[5040505] = {
		prefab_node = "5",
		next_medal = 0,
		item = 65853,
		remake_task_id = 0,
		group = 50405,
		task_id = 21897,
		medal_asset = "ActivityMedal/5040505",
		activity_medal_name = "ｽﾃｯｶｰ：香炉",
		id = 5040505,
		activity_medal_desc = "一縷の余香が、そっと答えを語りかける。"
	}
	pg.base.activity_medal_template[5040506] = {
		prefab_node = "6",
		next_medal = 0,
		item = 65854,
		remake_task_id = 0,
		group = 50405,
		task_id = 21898,
		medal_asset = "ActivityMedal/5040506",
		activity_medal_name = "ｽﾃｯｶｰ：ｻﾞ・ﾄﾘｵ",
		id = 5040506,
		activity_medal_desc = "さあ、一緒に大冒険へ！"
	}
	pg.base.activity_medal_template[5040507] = {
		prefab_node = "7",
		next_medal = 0,
		item = 65855,
		remake_task_id = 0,
		group = 50405,
		task_id = 21899,
		medal_asset = "ActivityMedal/5040507",
		activity_medal_name = "ｽﾃｯｶｰ：ﾀﾝﾌｰﾙｰ",
		id = 5040507,
		activity_medal_desc = "甘酸っぱくておいしい、食べ終えてもまた欲しくなる。"
	}
	pg.base.activity_medal_template[5040508] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65856,
		remake_task_id = 0,
		group = 50405,
		task_id = 21900,
		medal_asset = "ActivityMedal/5040508",
		activity_medal_name = "ｽﾃｯｶｰ：玲瓏玉佩",
		id = 5040508,
		activity_medal_desc = "君子懐玉、温潤にして艶やかなり。"
	}
	pg.base.activity_medal_template[5044101] = {
		prefab_node = "1",
		next_medal = 0,
		item = 65861,
		remake_task_id = 0,
		group = 50441,
		task_id = 21902,
		medal_asset = "ActivityMedal/5044101",
		activity_medal_name = "ステッカー：春色旅籠",
		id = 5044101,
		activity_medal_desc = "お客さま、こちらへどうぞ！春の賑わいは全部中にあります！"
	}
	pg.base.activity_medal_template[5044102] = {
		prefab_node = "2",
		next_medal = 0,
		item = 65862,
		remake_task_id = 0,
		group = 50441,
		task_id = 21903,
		medal_asset = "ActivityMedal/5044102",
		activity_medal_name = "ステッカー：ロード中……",
		id = 5044102,
		activity_medal_desc = "マップデータ読み込み中……"
	}
	pg.base.activity_medal_template[5044103] = {
		prefab_node = "3",
		next_medal = 0,
		item = 65863,
		remake_task_id = 0,
		group = 50441,
		task_id = 21904,
		medal_asset = "ActivityMedal/5044103",
		activity_medal_name = "ステッカー：ダーバオとアーバオ",
		id = 5044103,
		activity_medal_desc = "可愛さ担当は働かない！"
	}
	pg.base.activity_medal_template[5044104] = {
		prefab_node = "4",
		next_medal = 0,
		item = 65864,
		remake_task_id = 0,
		group = 50441,
		task_id = 21905,
		medal_asset = "ActivityMedal/5044104",
		activity_medal_name = "ステッカー：品質モニタリング",
		id = 5044104,
		activity_medal_desc = "いつでもどこでもQC開始可能。あなたにこそ必要！"
	}
	pg.base.activity_medal_template[5044105] = {
		prefab_node = "5",
		next_medal = 0,
		item = 65865,
		remake_task_id = 0,
		group = 50441,
		task_id = 21906,
		medal_asset = "ActivityMedal/5044105",
		activity_medal_name = "ステッカー：鎮海のそろばん",
		id = 5044105,
		activity_medal_desc = "じゃらじゃらじゃら～お金が四方八方から流れ込んでくる♪"
	}
	pg.base.activity_medal_template[5044106] = {
		prefab_node = "6",
		next_medal = 0,
		item = 65866,
		remake_task_id = 0,
		group = 50441,
		task_id = 21907,
		medal_asset = "ActivityMedal/5044106",
		activity_medal_name = "ステッカー：看板湯包",
		id = 5044106,
		activity_medal_desc = "熱々だよ～やけどには気をつけて！"
	}
	pg.base.activity_medal_template[5044107] = {
		prefab_node = "7",
		next_medal = 0,
		item = 65867,
		remake_task_id = 0,
		group = 50441,
		task_id = 21908,
		medal_asset = "ActivityMedal/5044107",
		activity_medal_name = "ステッカー：迎春の扇子",
		id = 5044107,
		activity_medal_desc = "ひと度扇子を扇げば、春風が想いを運んでくれる"
	}
	pg.base.activity_medal_template[5044108] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65868,
		remake_task_id = 0,
		group = 50441,
		task_id = 21909,
		medal_asset = "ActivityMedal/5044108",
		activity_medal_name = "ステッカー：如意灯籠",
		id = 5044108,
		activity_medal_desc = "一張り提灯を灯せば、庭に溢れる福が来たれり"
	}
	pg.base.activity_medal_template[5048201] = {
		prefab_node = "1",
		next_medal = 0,
		item = 65876,
		remake_task_id = 0,
		group = 50482,
		task_id = 21915,
		medal_asset = "ActivityMedal/5048201",
		activity_medal_name = "ステッカー：ネオンシティ",
		id = 5048201,
		activity_medal_desc = "ネオンライトシティは眠らない"
	}
	pg.base.activity_medal_template[5048202] = {
		prefab_node = "2",
		next_medal = 0,
		item = 65877,
		remake_task_id = 0,
		group = 50482,
		task_id = 21916,
		medal_asset = "ActivityMedal/5048202",
		activity_medal_name = "ステッカー：エスケープ",
		id = 5048202,
		activity_medal_desc = "Catch 'er By Surprise！"
	}
	pg.base.activity_medal_template[5048203] = {
		prefab_node = "3",
		next_medal = 0,
		item = 65878,
		remake_task_id = 0,
		group = 50482,
		task_id = 21917,
		medal_asset = "ActivityMedal/5048203",
		activity_medal_name = "ステッカー：プロジェクション",
		id = 5048203,
		activity_medal_desc = "膨大なデータをリアルタイムで分析する"
	}
	pg.base.activity_medal_template[5048204] = {
		prefab_node = "4",
		next_medal = 0,
		item = 65879,
		remake_task_id = 0,
		group = 50482,
		task_id = 21918,
		medal_asset = "ActivityMedal/5048204",
		activity_medal_name = "ステッカー：セルフ拘束",
		id = 5048204,
		activity_medal_desc = "捕まっているように装って、それから……あれ？解けない……！？"
	}
	pg.base.activity_medal_template[5048205] = {
		prefab_node = "5",
		next_medal = 0,
		item = 65880,
		remake_task_id = 0,
		group = 50482,
		task_id = 21919,
		medal_asset = "ActivityMedal/5048205",
		activity_medal_name = "ステッカー：全域指名手配",
		id = 5048205,
		activity_medal_desc = "顔はもう割れている。逃げられないぞ"
	}
	pg.base.activity_medal_template[5048206] = {
		prefab_node = "6",
		next_medal = 0,
		item = 65881,
		remake_task_id = 0,
		group = 50482,
		task_id = 21920,
		medal_asset = "ActivityMedal/5048206",
		activity_medal_name = "ステッカー：予告状",
		id = 5048206,
		activity_medal_desc = "捕まえられないなら……お宝は私のものよ"
	}
	pg.base.activity_medal_template[5048207] = {
		prefab_node = "7",
		next_medal = 0,
		item = 65882,
		remake_task_id = 0,
		group = 50482,
		task_id = 21921,
		medal_asset = "ActivityMedal/5048207",
		activity_medal_name = "ステッカー：ディープダイブ",
		id = 5048207,
		activity_medal_desc = "ヘッドホンをつけて、自分の世界にダイブ"
	}
	pg.base.activity_medal_template[5048208] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65883,
		remake_task_id = 0,
		group = 50482,
		task_id = 21922,
		medal_asset = "ActivityMedal/5048208",
		activity_medal_name = "ステッカー：エンブレム",
		id = 5048208,
		activity_medal_desc = "ワンダラー、アセンブル！"
	}
	pg.base.activity_medal_template[5060701] = {
		prefab_node = "1",
		next_medal = 0,
		item = 65921,
		remake_task_id = 0,
		group = 50607,
		task_id = 21925,
		medal_asset = "ActivityMedal/5060701",
		activity_medal_name = "ステッカー：神聖総連帝国",
		id = 5060701,
		activity_medal_desc = "神聖総連帝国。「神聖」にして「総連」の「帝国」"
	}
	pg.base.activity_medal_template[5060702] = {
		prefab_node = "2",
		next_medal = 0,
		item = 65922,
		remake_task_id = 0,
		group = 50607,
		task_id = 21926,
		medal_asset = "ActivityMedal/5060702",
		activity_medal_name = "ステッカー：天を衝く塔",
		id = 5060702,
		activity_medal_desc = "「越境実験NO1：登臨者」――「上昇開始」"
	}
	pg.base.activity_medal_template[5060703] = {
		prefab_node = "3",
		next_medal = 0,
		item = 65923,
		remake_task_id = 0,
		group = 50607,
		task_id = 21927,
		medal_asset = "ActivityMedal/5060703",
		activity_medal_name = "ステッカー：傭兵団指揮官",
		id = 5060703,
		activity_medal_desc = "「外からの来訪者」傭兵団、出撃だ！"
	}
	pg.base.activity_medal_template[5060704] = {
		prefab_node = "4",
		next_medal = 0,
		item = 65924,
		remake_task_id = 0,
		group = 50607,
		task_id = 21928,
		medal_asset = "ActivityMedal/5060704",
		activity_medal_name = "ステッカー：聖座の象徴",
		id = 5060704,
		activity_medal_desc = "神の目が及ぶ場所には、心象が到る"
	}
	pg.base.activity_medal_template[5060705] = {
		prefab_node = "5",
		next_medal = 0,
		item = 65925,
		remake_task_id = 0,
		group = 50607,
		task_id = 21929,
		medal_asset = "ActivityMedal/5060705",
		activity_medal_name = "ステッカー：皇帝の象徴",
		id = 5060705,
		activity_medal_desc = "冠を戴くものにはその重さを背負わねば"
	}
	pg.base.activity_medal_template[5060706] = {
		prefab_node = "6",
		next_medal = 0,
		item = 65926,
		remake_task_id = 0,
		group = 50607,
		task_id = 21930,
		medal_asset = "ActivityMedal/5060706",
		activity_medal_name = "ステッカー：審判の象徴",
		id = 5060706,
		activity_medal_desc = "黒き太陽の光が魍魎をかき消す"
	}
	pg.base.activity_medal_template[5060707] = {
		prefab_node = "7",
		next_medal = 0,
		item = 65927,
		remake_task_id = 0,
		group = 50607,
		task_id = 21931,
		medal_asset = "ActivityMedal/5060707",
		activity_medal_name = "ステッカー：深潜",
		id = 5060707,
		activity_medal_desc = "あなたは深淵を見つけました。そして中で楽しく泳ぎました"
	}
	pg.base.activity_medal_template[5060708] = {
		prefab_node = "8",
		next_medal = 0,
		item = 65928,
		remake_task_id = 0,
		group = 50607,
		task_id = 21932,
		medal_asset = "ActivityMedal/5060708",
		activity_medal_name = "ステッカー：自由騎士",
		id = 5060708,
		activity_medal_desc = "神聖総連帝国の爵位の一つ。本当に…詳しく知りたいですか？"
	}
	pg.base.activity_medal_template[5061601] = {
		prefab_node = "1",
		next_medal = 0,
		item = 65930,
		remake_task_id = 0,
		group = 50616,
		task_id = 21935,
		medal_asset = "ActivityMedal/5061601",
		activity_medal_name = "ステッカー：ゴールデン・ベイ",
		id = 5061601,
		activity_medal_desc = "いざゆけゴールデン・ベイ、フネが戻るまでバカンス・デイ"
	}
	pg.base.activity_medal_template[5061602] = {
		prefab_node = "2",
		next_medal = 0,
		item = 65931,
		remake_task_id = 0,
		group = 50616,
		task_id = 21936,
		medal_asset = "ActivityMedal/5061602",
		activity_medal_name = "ステッカー：黄金の宝たち",
		id = 5061602,
		activity_medal_desc = "願いを語りかければ、本当に叶うって！"
	}
	pg.base.activity_medal_template[5061603] = {
		prefab_node = "3",
		next_medal = 0,
		item = 65932,
		remake_task_id = 0,
		group = 50616,
		task_id = 21937,
		medal_asset = "ActivityMedal/5061603",
		activity_medal_name = "ステッカー：空まで一直線",
		id = 5061603,
		activity_medal_desc = "ぐっと高く飛んでけー！"
	}
	pg.base.activity_medal_template[5061604] = {
		prefab_node = "4",
		next_medal = 0,
		item = 65933,
		remake_task_id = 0,
		group = 50616,
		task_id = 21938,
		medal_asset = "ActivityMedal/5061604",
		activity_medal_name = "ステッカー：アークドーム",
		id = 5061604,
		activity_medal_desc = "360度全方位採光が、明るく快適な室内環境を保証！"
	}
	pg.base.activity_medal_template[5061605] = {
		prefab_node = "5",
		next_medal = 0,
		item = 65934,
		remake_task_id = 0,
		group = 50616,
		task_id = 21939,
		medal_asset = "ActivityMedal/5061605",
		activity_medal_name = "ステッカー：夢求むカモメ",
		id = 5061605,
		activity_medal_desc = "鳥の夢は…埠頭に行ってポテトを"
	}
	pg.base.activity_medal_template[5061606] = {
		prefab_node = "6",
		next_medal = 0,
		item = 65935,
		remake_task_id = 0,
		group = 50616,
		task_id = 21940,
		medal_asset = "ActivityMedal/5061606",
		activity_medal_name = "ステッカー：のんびり饅頭",
		id = 5061606,
		activity_medal_desc = "日向ぼっこしながらうたた寝、最高に快適ピョ～"
	}
	pg.base.activity_medal_template[5061607] = {
		prefab_node = "7",
		next_medal = 0,
		item = 65936,
		remake_task_id = 0,
		group = 50616,
		task_id = 21941,
		medal_asset = "ActivityMedal/5061607",
		activity_medal_name = "ステッカー：黄金ビル",
		id = 5061607,
		activity_medal_desc = "ここまできたからには、手ぶらで帰れるとは思わないこと！"
	}
	pg.base.activity_medal_template[5065901] = {
		prefab_node = "1",
		next_medal = 0,
		item = 65993,
		remake_task_id = 0,
		group = 50659,
		task_id = 21976,
		medal_asset = "ActivityMedal/5065901",
		activity_medal_name = "ステッカー：サーカス",
		id = 5065901,
		activity_medal_desc = "いざ開演！幻夢のカヴァルカード！"
	}
	pg.base.activity_medal_template[5065902] = {
		prefab_node = "2",
		next_medal = 0,
		item = 65994,
		remake_task_id = 0,
		group = 50659,
		task_id = 21977,
		medal_asset = "ActivityMedal/5065902",
		activity_medal_name = "ステッカー：ハットとウサギ",
		id = 5065902,
		activity_medal_desc = "奇跡を見届ける時間だよー！"
	}
	pg.base.activity_medal_template[5065903] = {
		prefab_node = "3",
		next_medal = 0,
		item = 65995,
		remake_task_id = 0,
		group = 50659,
		task_id = 21978,
		medal_asset = "ActivityMedal/5065903",
		activity_medal_name = "ステッカー：鳥と火の輪",
		id = 5065903,
		activity_medal_desc = "スタッフが美味しくいただきました（嘘"
	}
	pg.base.activity_medal_template[5065904] = {
		prefab_node = "4",
		next_medal = 0,
		item = 65996,
		remake_task_id = 0,
		group = 50659,
		task_id = 21979,
		medal_asset = "ActivityMedal/5065904",
		activity_medal_name = "ステッカー：キラーボックス",
		id = 5065904,
		activity_medal_desc = "アマチュアはパフォーマンスに驚き、プロはトリックを見極める"
	}
	pg.base.activity_medal_template[5065905] = {
		prefab_node = "5",
		next_medal = 0,
		item = 65997,
		remake_task_id = 0,
		group = 50659,
		task_id = 21980,
		medal_asset = "ActivityMedal/5065905",
		activity_medal_name = "ステッカー：フライング饅頭",
		id = 5065905,
		activity_medal_desc = "饅頭、アウトォ！"
	}
	pg.base.activity_medal_template[5065906] = {
		prefab_node = "6",
		next_medal = 0,
		item = 65998,
		remake_task_id = 0,
		group = 50659,
		task_id = 21981,
		medal_asset = "ActivityMedal/5065906",
		activity_medal_name = "ステッカー：レッグアーチェリー",
		id = 5065906,
		activity_medal_desc = "足で弓を引いてみる？"
	}
	pg.base.activity_medal_template[5065907] = {
		prefab_node = "7",
		next_medal = 0,
		item = 65999,
		remake_task_id = 0,
		group = 50659,
		task_id = 21982,
		medal_asset = "ActivityMedal/5065907",
		activity_medal_name = "ステッカー：ブラッシングアート",
		id = 5065907,
		activity_medal_desc = "たかがブラシだよ、そんな力なんてないって！"
	}
	pg.base.activity_medal_template[5065908] = {
		prefab_node = "8",
		next_medal = 0,
		item = 66045,
		remake_task_id = 0,
		group = 50659,
		task_id = 21983,
		medal_asset = "ActivityMedal/5065908",
		activity_medal_name = "ステッカー：サーカスチケット",
		id = 5065908,
		activity_medal_desc = "ここまで来たし、中に入ろっか"
	}
	pg.base.activity_medal_template[5107801] = {
		prefab_node = "1",
		next_medal = 0,
		item = 66053,
		remake_task_id = 0,
		group = 51078,
		task_id = 21989,
		medal_asset = "ActivityMedal/5107801",
		activity_medal_name = "ステッカー：白夜ヴィラ",
		id = 5107801,
		activity_medal_desc = "キーヒヒヒ！これぞ時代を越えて語り継がれる怪談スポット！超スリル！超怖い！"
	}
	pg.base.activity_medal_template[5107802] = {
		prefab_node = "2",
		next_medal = 0,
		item = 66054,
		remake_task_id = 0,
		group = 51078,
		task_id = 21990,
		medal_asset = "ActivityMedal/5107802",
		activity_medal_name = "ステッカー：夜回り饅頭",
		id = 5107802,
		activity_medal_desc = "今日巡回する病室の番号はどれピョ…？"
	}
	pg.base.activity_medal_template[5107803] = {
		prefab_node = "3",
		next_medal = 0,
		item = 66055,
		remake_task_id = 0,
		group = 51078,
		task_id = 21991,
		medal_asset = "ActivityMedal/5107803",
		activity_medal_name = "ステッカー：怪談メモ",
		id = 5107803,
		activity_medal_desc = "ここに書いてあるルールの厳守をお願い……"
	}
	pg.base.activity_medal_template[5107804] = {
		prefab_node = "4",
		next_medal = 0,
		item = 66056,
		remake_task_id = 0,
		group = 51078,
		task_id = 21992,
		medal_asset = "ActivityMedal/5107804",
		activity_medal_name = "ステッカー：医療用ポールアックス",
		id = 5107804,
		activity_medal_desc = "病院でよく見かける医療器具……か？"
	}
	pg.base.activity_medal_template[5107805] = {
		prefab_node = "5",
		next_medal = 0,
		item = 66057,
		remake_task_id = 0,
		group = 51078,
		task_id = 21993,
		medal_asset = "ActivityMedal/5107805",
		activity_medal_name = "ステッカー：二倍お注射",
		id = 5107805,
		activity_medal_desc = "一本で長生き、二本で怖いものなし！"
	}
	pg.base.activity_medal_template[5107806] = {
		prefab_node = "6",
		next_medal = 0,
		item = 66058,
		remake_task_id = 0,
		group = 51078,
		task_id = 21994,
		medal_asset = "ActivityMedal/5107806",
		activity_medal_name = "ステッカー：心拍感応",
		id = 5107806,
		activity_medal_desc = "注意！奴らが来る！"
	}
	pg.base.activity_medal_template[5107807] = {
		prefab_node = "7",
		next_medal = 0,
		item = 66059,
		remake_task_id = 0,
		group = 51078,
		task_id = 21995,
		medal_asset = "ActivityMedal/5107807",
		activity_medal_name = "ステッカー：デンタルライト",
		id = 5107807,
		activity_medal_desc = "はーい、あーんしてください。あーん"
	}
	pg.base.activity_medal_template[5107808] = {
		prefab_node = "8",
		next_medal = 0,
		item = 66060,
		remake_task_id = 0,
		group = 51078,
		task_id = 21996,
		medal_asset = "ActivityMedal/5107808",
		activity_medal_name = "ステッカー：封鎖エリア",
		id = 5107808,
		activity_medal_desc = "感染者が出るまであと10、9……"
	}
end)()
