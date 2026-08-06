pg = pg or {}
pg.island_skin_template = rawget(pg, "island_skin_template") or setmetatable({
	__name = "island_skin_template"
}, confNEO)
pg.island_skin_template.all = {
	1011001,
	1011701,
	1020501,
	1051701,
	1070301,
	1990301,
	2012101,
	2021201,
	2060301,
	2990301,
	3031101,
	3031201,
	3040701,
	3120101,
	4030301,
	4990201,
	4990601,
	5010701,
	5010801,
	5020101,
	5060101,
	9010701,
	96000101,
	99000201,
	99000202,
	99000101,
	99000102,
	99000301,
	99000302
}
pg.island_skin_template.get_id_list_by_ship_group = {
	[10110] = {
		1011001
	},
	[10117] = {
		1011701
	},
	[10205] = {
		1020501
	},
	[10517] = {
		1051701
	},
	[10703] = {
		1070301
	},
	[19903] = {
		1990301
	},
	[20121] = {
		2012101
	},
	[20212] = {
		2021201
	},
	[20603] = {
		2060301
	},
	[29903] = {
		2990301
	},
	[30311] = {
		3031101
	},
	[30312] = {
		3031201
	},
	[30407] = {
		3040701
	},
	[31201] = {
		3120101
	},
	[40303] = {
		4030301
	},
	[49902] = {
		4990201
	},
	[49906] = {
		4990601
	},
	[50107] = {
		5010701
	},
	[50108] = {
		5010801
	},
	[50201] = {
		5020101
	},
	[50601] = {
		5060101
	},
	[90107] = {
		9010701
	},
	[960001] = {
		96000101
	},
	[990001] = {
		99000101,
		99000102
	},
	[990002] = {
		99000201,
		99000202
	},
	[990003] = {
		99000301,
		99000302
	}
}
pg.base = pg.base or {}
pg.base.island_skin_template = {}

;(function()
	pg.base.island_skin_template[1011001] = {
		ship_group = 10110,
		name = "元気イッパイ！",
		desc = "たとえ簡単な掃除の仕事でも、200％の元気でやってみせるよ！",
		model = 1011001,
		id = 1011001,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_1011001",
		icon_normal = ""
	}
	pg.base.island_skin_template[1011701] = {
		ship_group = 10117,
		name = "ウサウサのお休み",
		desc = "ふかふかパジャマはぬくもりを包み込み、不揃いの靴下で愛嬌をアピール。ウサウサは今にも夢の世界に飛び込むよ",
		model = 1011701,
		id = 1011701,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_1011701",
		icon_normal = ""
	}
	pg.base.island_skin_template[1020501] = {
		ship_group = 10205,
		name = "碧の心",
		desc = "優しい気品を立たせる、澄み渡った青。行き届いた奉仕と静かな微笑みの奥には、海のように深い気配りが宿っている。",
		model = 1020501,
		id = 1020501,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_1020501",
		icon_normal = ""
	}
	pg.base.island_skin_template[1051701] = {
		ship_group = 10517,
		name = "軽やか日常",
		desc = "普段の生活にピッタリな爽やかな装い。彼女はもうあなたと楽しく遊ぶ準備ができているみたい。",
		id = 1051701,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		model = 1051701,
		tag = "",
		icon = "skin_1051701",
		icon_normal = "props/skin_1051701",
		jump_page = {}
	}
	pg.base.island_skin_template[1070301] = {
		ship_group = 10703,
		name = "純真キャンパス",
		desc = "可愛くて元気いっぱい。小さな秘密がいっぱい詰まったリュックを背中に、無邪気な笑い声を風に伝える。",
		id = 1070301,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		model = 1070301,
		tag = "",
		icon = "skin_1070301",
		icon_normal = "props/skin_1070301",
		jump_page = {}
	}
	pg.base.island_skin_template[1990301] = {
		ship_group = 19903,
		name = "休み時間の約束",
		desc = "赤いリボンタイが歩調に合わせて小さく揺れる。期待に胸をふくらませた少女はもう準備万端――今日の休み時間はずっとあなたと♪",
		model = 1990301,
		id = 1990301,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_1990301",
		icon_normal = ""
	}
	pg.base.island_skin_template[2012101] = {
		ship_group = 20121,
		name = "枕投げ大会",
		desc = "爽やかなノースリーブに可愛らしい紫・白のストライプ。軽やかな身動きで枕投げ大戦で勝利を目指そう！",
		model = 2012101,
		id = 2012101,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_2012101",
		icon_normal = ""
	}
	pg.base.island_skin_template[2021201] = {
		ship_group = 20212,
		name = "午後の一ページ",
		desc = "コートに包まれた優しい本の香り。長い髪を凛と結い上げても、安心する優雅な笑みはそのまま",
		model = 2021201,
		id = 2021201,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_2021201",
		icon_normal = ""
	}
	pg.base.island_skin_template[2060301] = {
		ship_group = 20603,
		name = "憧れの星光",
		desc = "まるで夜空に明るい星が落ちてきたかのよう、細部の全てが希望の光で輝いている。",
		id = 2060301,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		model = 2060301,
		tag = "",
		icon = "skin_2060301",
		icon_normal = "props/skin_2060301",
		jump_page = {}
	}
	pg.base.island_skin_template[2990301] = {
		ship_group = 29903,
		name = "海塩レジャー",
		desc = "清々しい海風が運ぶ甘い香りと楽しいエネルギー。一体誰の心をときめかせたかにゃ？",
		id = 2990301,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		model = 2990301,
		tag = "",
		icon = "skin_2990301",
		icon_normal = "props/skin_2990301",
		jump_page = {}
	}
	pg.base.island_skin_template[3031101] = {
		ship_group = 30311,
		name = "素直な夜会話",
		desc = "初雪のように清らかな印象を与える、純白色の長袖シャツ。シンプルながらもゆったりとした美を湛える",
		model = 3031101,
		id = 3031101,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_3031101",
		icon_normal = ""
	}
	pg.base.island_skin_template[3031201] = {
		ship_group = 30312,
		name = "お茶休憩も甘々",
		desc = "注いだのはお茶だけではないわ。笑顔に隠された挨拶と…甘い思いやりもあるから♪",
		model = 3031201,
		id = 3031201,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_3031201",
		icon_normal = ""
	}
	pg.base.island_skin_template[3040701] = {
		ship_group = 30407,
		name = "おとぎ雛鳥",
		desc = "柔らかな輝きの太陽に照らされた黄色い雛鳥。甘いキャンディと貝殻が歌うおとぎ話",
		id = 3040701,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		model = 3040701,
		tag = "",
		icon = "skin_3040701",
		icon_normal = "props/skin_3040701",
		jump_page = {}
	}
	pg.base.island_skin_template[3120101] = {
		ship_group = 31201,
		name = "夜の鈴音",
		desc = "きちんとしたセーラー襟の下には、いたずらっぽい笑みが隠れている。夜の海のような黒い裾を翻し、「悪徳商人ちゃん」が校園でひそかに営業中…にゃ。",
		id = 3120101,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		model = 3120101,
		tag = "",
		icon = "skin_3120101",
		icon_normal = "props/skin_3120101",
		jump_page = {}
	}
	pg.base.island_skin_template[4030301] = {
		ship_group = 40303,
		name = "気だるいサービス",
		desc = "少し遊び心の元で行われた優雅な「特別なおもてなし」。胸が高鳴る余興とは……？",
		model = 4030301,
		id = 4030301,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_4030301",
		icon_normal = ""
	}
	pg.base.island_skin_template[4990201] = {
		ship_group = 49902,
		name = "優雅な可愛がり",
		desc = "威厳と優しさが完璧に一つとなり、優雅な姿で「ご奉仕」という至高の約束が果たされる。",
		model = 4990201,
		id = 4990201,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_4990201",
		icon_normal = ""
	}
	pg.base.island_skin_template[4990601] = {
		ship_group = 49906,
		name = "雲上の夢遊",
		desc = "アイマスクをして、雲と月に抱きしめられながら夢へと旅立つ。優しい夜の世界が、甘い色に包まれますように",
		model = 4990601,
		id = 4990601,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_4990601",
		icon_normal = ""
	}
	pg.base.island_skin_template[5010701] = {
		ship_group = 50107,
		name = "パンダ団子",
		desc = "白黒のパンダパジャマ。丸っこくて柔らかく、思わず指でツンツンしたくなる可愛らしさ",
		model = 5010701,
		id = 5010701,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_5010701",
		icon_normal = ""
	}
	pg.base.island_skin_template[5010801] = {
		ship_group = 50108,
		name = "ふわふわ下校中",
		desc = "結んだ髪が軽く揺れる。軽やかなステップを踏んでやってくる彼女がいれば、下校時もふわふわな雰囲気になる",
		model = 5010801,
		id = 5010801,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_5010801",
		icon_normal = ""
	}
	pg.base.island_skin_template[5020101] = {
		ship_group = 50201,
		name = "月下の茶香",
		desc = "白のキャミソールと、軽く羽織ったベージュの上着。月の明かりに照らされた茶の花のように、清楚にして雅を感じさせる麗しさ",
		model = 5020101,
		id = 5020101,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_5020101",
		icon_normal = ""
	}
	pg.base.island_skin_template[5060101] = {
		ship_group = 50601,
		name = "謀り事は後ほど",
		desc = "ひととき盤上を離れ、急須を手に取る。立ちのぼる湯気の中で、人の心を見抜く温かな知恵をお届け。",
		model = 5060101,
		id = 5060101,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_5060101",
		icon_normal = ""
	}
	pg.base.island_skin_template[9010701] = {
		ship_group = 90107,
		name = "ときめきのチャイム",
		desc = "ゆるめた襟元にリボンタイが無造作に垂れている。隠しきれないほどの情熱に、ドキドキが速くなるような危うさをひとつまみ",
		model = 9010701,
		id = 9010701,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_9010701",
		icon_normal = ""
	}
	pg.base.island_skin_template[96000101] = {
		ship_group = 960001,
		name = "学園のプロローグ",
		desc = "端正でオシャレな学園の装いが真面目さも気品が備わる。校門をくぐる足取りにも、まるで儀式の一節のような雰囲気を",
		model = 96000101,
		id = 96000101,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_96000101",
		icon_normal = ""
	}
	pg.base.island_skin_template[99000201] = {
		ship_group = 990002,
		name = "幼い時間",
		desc = "純真で、まっすぐ。おぼつかないまま周りを探検し、あらゆるものを触っていく。",
		model = 99000201,
		id = 99000201,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_99000201",
		icon_normal = ""
	}
	pg.base.island_skin_template[99000202] = {
		ship_group = 990002,
		name = "未熟な観察者",
		desc = "きれいに整えたワンピース姿。静かに世界を見つめる、ひたむきなまなざし。",
		model = 99000202,
		id = 99000202,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_99000202",
		icon_normal = ""
	}
	pg.base.island_skin_template[99000101] = {
		ship_group = 990001,
		name = "元気通学路",
		desc = "フル装備でいざ出発！今日は通学路でどんなイタズラを仕掛けようかな～？",
		model = 99000101,
		id = 99000101,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_99000101",
		icon_normal = ""
	}
	pg.base.island_skin_template[99000102] = {
		ship_group = 990001,
		name = "優等生のフリ",
		desc = "きっちり着た学園制服。優等生風でもあざとい小悪魔を隠しきれない。",
		model = 99000102,
		id = 99000102,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_99000102",
		icon_normal = ""
	}
	pg.base.island_skin_template[99000301] = {
		ship_group = 990003,
		name = "純白の囁き",
		desc = "混じりけのない純白は、まるで物静かな性格がそのまま形になったかのよう。",
		model = 99000301,
		id = 99000301,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_99000301",
		icon_normal = ""
	}
	pg.base.island_skin_template[99000302] = {
		ship_group = 990003,
		name = "沈静の礼装",
		desc = "正装のジャンパースカートの礼装。どこかおずおずとした可愛らしさがにじむ。",
		model = 99000302,
		id = 99000302,
		shop_id = 0,
		tech_id = 0,
		shop_goods_id = 0,
		jump_page = "",
		tag = "",
		icon = "skin_99000302",
		icon_normal = ""
	}
end)()
