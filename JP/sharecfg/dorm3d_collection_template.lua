pg = pg or {}
pg.dorm3d_collection_template = setmetatable({
	__name = "dorm3d_collection_template",
	get_id_list_by_room_id = {
		{
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12,
			13,
			14,
			15,
			16,
			17,
			18,
			19,
			20,
			21,
			22,
			23,
			24,
			25,
			26,
			27,
			28,
			29,
			30
		},
		[4] = {
			31,
			32,
			33,
			34,
			35,
			36,
			37,
			38,
			39
		},
		{
			51,
			52,
			53,
			54,
			55,
			56,
			57,
			58,
			59,
			60,
			61,
			62,
			63,
			64,
			65,
			66,
			67,
			68,
			70,
			72,
			71,
			76,
			77,
			78,
			79,
			74,
			75
		}
	},
	all = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		12,
		13,
		14,
		15,
		16,
		17,
		18,
		19,
		20,
		21,
		22,
		23,
		24,
		25,
		26,
		27,
		28,
		29,
		30,
		31,
		32,
		33,
		34,
		35,
		36,
		37,
		38,
		39,
		51,
		52,
		53,
		54,
		55,
		56,
		57,
		58,
		59,
		60,
		61,
		62,
		63,
		64,
		65,
		66,
		67,
		68,
		70,
		72,
		71,
		76,
		77,
		78,
		79,
		74,
		75
	}
}, confHX)
pg.base = pg.base or {}
pg.base.dorm3d_collection_template = {
	{
		text = "dorm3d_sirius_table",
		name = "電子レンジ",
		award = 0,
		time = 0,
		id = 1,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item5",
		desc = "シリアスが自ら用意した電子レンジ。長期間使っているのに、使い古された感じが一切なく、何故か見るたびに、新品同様の状態になっている。",
		model = {
			"fbx/litmap_04/pre_db_electrical01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_04/pre_db_electrical01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_table",
		name = "コーヒーマシン",
		award = 0,
		time = 0,
		id = 2,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item6",
		desc = "シリアスが毎朝のコーヒーを用意するのに使うコーヒーマシン。機械には彼女の指が触れた痕跡が残っている。",
		model = {
			"fbx/litmap_04/pre_db_electrical07"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_04/pre_db_electrical07/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_table",
		name = "メリージェーン靴",
		award = 0,
		time = 1,
		id = 3,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item2",
		desc = "シリアスが普段から愛用しているヒールのメリージェーン。丁寧に手入れされているため、革は柔らかな光を纏っている。",
		model = {
			"fbx/litmap_01/pre_db_shoe01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_shoe01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_table",
		name = "装飾用の壁掛け",
		award = 0,
		time = 0,
		id = 4,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item8",
		desc = "青いネクタイをつけている茶トラ。滲み出る優雅さには、愛嬌のある間抜けさも混じっている。おそらく部屋の主はこのような可愛らしいものが好きなのだろう。",
		model = {
			"fbx/litmap_03/pre_db_billboard06d"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_billboard06d/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_chair",
		name = "トースター",
		award = 0,
		time = 1,
		id = 5,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item9",
		desc = "料理初心者に実用的なブレックファスト・マシン。ポチっと押すだけで、温かくて柔らかいトーストが出来上がり。——もちろん、ちゃんと焼き加減の設定ができるようになってから。",
		model = {
			"no_bake_prop/pre_db_electrical02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_electrical02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_chair",
		name = "ゴミ箱",
		award = 0,
		time = 1,
		id = 6,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item10",
		desc = "どこにでもある、何の変哲もない、ただのゴミ箱。……。…………。やはりどう見ても、それ以上でもそれ以下でもない、普通のゴミ箱だ。",
		model = {
			"no_bake_prop/pre_db_pail01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_pail01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_chair",
		name = "空の額縁",
		award = 0,
		time = 0,
		id = 7,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item17",
		desc = "まだ写真が入っていない空の額縁。シンプルだが一応柄があり、そこまで地味に見えない。",
		model = {
			"fbx/litmap_03/pre_db_billboard02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_billboard02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_chair",
		name = "蝶の標本",
		award = 0,
		time = 0,
		id = 8,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item12",
		desc = "青い翅にある模様は、打ち寄せる波のようでありながら、海を駆け巡るシリアスの、風になびく髪のようでもある。今度暇なときに、シリアスを誘って浜辺の散策に出掛けよう。",
		model = {
			"fbx/litmap_03/pre_db_billboard03 (1)"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_billboard03 (1)/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_chair",
		name = "フロアランプ",
		award = 0,
		time = 0,
		id = 9,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item15",
		desc = "ソファの横に置かれたフロアランプ。シリアスの気配りによって電球は目に優しいタイプに。たまにはここで書類仕事をしてみよう。",
		model = {
			"fbx/litmap_03/pre_db_chandelier06"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_chandelier06/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "パンのセット",
		award = 0,
		time = 1,
		id = 10,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item16",
		desc = "シリアスの手作りと思しきクロワッサンとサンドイッチ。見た目も香りも至って普通だが、シリアスに勧められるまで、こちらからは味見しないでおこう……",
		model = {
			"fbx/litmap_04/pre_db_food01b"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_04/pre_db_food01b/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "カジュアルな読み物",
		award = 0,
		time = 1,
		id = 11,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item25",
		desc = "サイドテーブルの上に開かれた一冊の本。どうやらシリアスの最近の愛読書らしい。ざっと数ページめくってみると、あるメイドとその主人の間の禁断の恋を描いている小説のようだった。",
		model = {
			"no_bake_prop/pre_db_book01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_book01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bath",
		name = "ワイングラス",
		award = 0,
		time = 1,
		id = 12,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item14",
		desc = "ワイングラス、そして飲料水。シリアスのメイドのご奉仕が如実に伝わっている。「ワイングラスで優雅に水を召し上がる」のはさすがに面倒だ。今度はやはり普通のグラスをいくつか用意させよう。",
		model = {
			"no_bake_prop/pre_db_tableware07"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_tableware07/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bath",
		name = "勇者の剣のレプリカ",
		award = 0,
		time = 0,
		id = 13,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item11",
		desc = "母港バーチャルリアリティ大冒険で大ヒットしたコラボグッズ。台座には「台所用」と書いてある。なるほど、道理でシリアスが部屋に置いてあるやつと重さがまるで違うわけだ…",
		model = {
			"no_bake_prop/pre_db_decoration02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_decoration02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bath",
		name = "生け花の習作・I",
		award = 0,
		time = 0,
		id = 14,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item19",
		desc = "シリアスの生け花の習作。花は一色のみだがバランスよく配置されている。後で少し広い場所に移動させよう。",
		model = {
			"fbx/litmap_04/pre_db_ceram05 (1)"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_04/pre_db_ceram05 (1)/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "枕辺の本",
		award = 0,
		time = 1,
		id = 15,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item20",
		desc = "ベッドサイドに置かれている本の山。意外なことに料理本ではなく、戦略と奉仕の技術に関する本だらけだ。中にはシリアスの読書ノートも挟まれており、内容からするとこの2つをうまく組み合わせて、より優秀なメイドになれるよう研究に励んでいるようだ。",
		model = {
			"fbx/litmap_01/pre_db_book08"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_book08/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "ドレッサー",
		award = 0,
		time = 0,
		id = 16,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item22",
		desc = "シリアスがこちらの出迎えに急いでいたせいか、リップのフタを閉めるのを忘れている。閉めておいてあげよう！",
		model = {
			"no_bake_prop/pre_db_dressingtablecomponents01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_dressingtablecomponents01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "ジュエリーボックス",
		award = 0,
		time = 0,
		id = 17,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item18",
		desc = "高価なロイヤルジュエリー。シリアスが身につけたことは一度もなく、ずっと展示ケースに大切に保管している。",
		model = {
			"no_bake_prop/pre_db_jewelrybox01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_jewelrybox01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "生け花の習作・II",
		award = 0,
		time = 0,
		id = 18,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item26",
		desc = "質素な黄色いバラ。テーブルの飾りとして明るい雰囲気を与えてくれている。結局シリアスは、どの花が好きなんだろう。",
		model = {
			"fbx/litmap_02/pre_db_ceram10_01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_ceram10_01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "ミステリー小説",
		award = 0,
		time = 1,
		id = 19,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item28",
		desc = "まだ開封されていないミステリー小説。どうやらシリアスは最近、このジャンルに興味がないようだ。",
		model = {
			"fbx/litmap_02/pre_db_book02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_book02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "柴犬のぬいぐるみ",
		award = 0,
		time = 1,
		id = 20,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item29",
		desc = "ぬいぐるみのお腹の部分に「明石製・匠の技」と書かれている。シリアス自身も普段から明石の店に通っているようだ。",
		model = {
			"fbx/litmap_03/pre_db_toy03"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_toy03/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bath",
		name = "夏の思い出",
		award = 0,
		time = 0,
		id = 21,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item30",
		desc = "先日シリアスと一緒に海で行った時、彼女が使っていた浮き輪。部屋のとても目立った場所に置かれている。メイドだから自ら泳ぎに行きたいと申し出ることも憚られるかもしれないが…今度はこちらから誘ってみよう。",
		model = {
			"no_bake_prop/pre_db_toy02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_toy02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bath",
		name = "予定帳ボックス",
		award = 0,
		time = 0,
		id = 22,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item31",
		desc = "よくある仕事用の書類収納ボックス。シリアスによると、中のスケジュール帳にはメイドの仕事の予定がびっしりと書き込まれているそうだ。カバーに付けられているタグには半分消えかかった筆跡が見える。――「ご主人様としたい■■■■」後半の文字はほぼ完全に消えている。",
		model = {
			"no_bake_prop/pre_db_paperskin01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_paperskin01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bath",
		name = "水やりポット",
		award = 0,
		time = 0,
		id = 23,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item27",
		desc = "部屋の観葉植物や花を元気にするじょうろ。…ではなく、どう見えてもティーポットだ。シリアスは一体どのような経緯でこれで水をやり始めたのだろう？",
		model = {
			"no_bake_prop/pre_db_smalltool02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_smalltool02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "ナイトライト",
		award = 0,
		time = 2,
		id = 24,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item32",
		desc = "可愛らしいデザインのナイトライト。夜中に起きた時にうっかり転ばないよう、シリアスが特別に用意したもの。温かい光は彼女の笑顔を思い浮かべさせる。",
		model = {
			"no_bake_prop/pre_db_desklamp02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_desklamp02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "サングラス",
		award = 0,
		time = 2,
		id = 25,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item33",
		desc = "シリアスと泳ぎに海辺に行った時、彼女がかけていたサングラス。手の届くところに置かれている。",
		model = {
			"no_bake_prop/pre_db_glasses01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_glasses01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bath",
		name = "ボディローション",
		award = 0,
		time = 2,
		id = 26,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item34",
		desc = "シリアスがお風呂上がりに使うボディローション。その淡い香りは時々、部屋の入口にも漂っている。",
		model = {
			"no_bake_prop/pre_db_cosmetic15"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_cosmetic15/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "アロマ",
		award = 0,
		time = 2,
		id = 27,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item35",
		desc = "優しい花の香りを漂わせている、シリアスが丁寧に選んだ室内用アロマディフューザー。精神をリラックスさせ、ストレスを和らげる効果があるそうだ。",
		model = {
			"no_bake_prop/pre_db_cosmetic14"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_cosmetic14/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_chair",
		name = "白いタオル",
		award = 0,
		time = 2,
		id = 28,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item36",
		desc = "まだ少し湿った感じが残っている、無造作に置かれた白いタオル。もしかして…シリアスはバスルームから出たばかり…？",
		model = {
			"no_bake_prop/pre_db_towel10"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_towel10/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "指揮官の心を掴む方法・Ⅱ",
		award = 0,
		time = 2,
		id = 29,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item37",
		desc = "シリアスがベッドサイドに置いている本。…それにしても、なぜここでこの本を見かけるのだろう。…2作目なんてあったの？",
		model = {
			"no_bake_prop/pre_db_book10"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_book10/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_chair",
		name = "飲みかけミルク",
		award = 0,
		time = 2,
		id = 30,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item38",
		desc = "テーブルの上に置かれた、まだ半分ほどミルクが残っているグラス。グラスの縁には薄い唇の跡が付いている。",
		model = {
			"no_bake_prop/pre_db_drink01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_drink01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "華麗な砂のお城",
		award = 0,
		time = 0,
		id = 31,
		room_id = 4,
		icon = "3Ddrom_beach_item1",
		desc = "日光の下で金色に輝く砂の城は、その細部に至るまで作り手の頑張りが表れている。どれほどの心血を注いだかが想像できる。潮が満ちて壊されないことを願うばかりだ。",
		model = {
			"no_bake_prop/pre_dp_toy05_01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_dp_toy05_01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "砂遊びセット",
		award = 0,
		time = 0,
		id = 32,
		room_id = 4,
		icon = "3Ddrom_beach_item2",
		desc = "砂浜に落ちていたシャベルとバケツ。つい先ほどまで誰かがここで砂遊びをしていたようだ。今度誰かを誘って砂の彫刻大会をやってるのも良いかもしれない。",
		model = {
			"no_bake_prop/pre_db_smalltool09_01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_smalltool09_01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "海風を感じるギター",
		award = 0,
		time = 0,
		id = 33,
		room_id = 4,
		icon = "3Ddrom_beach_item3",
		desc = "持ち主に忘れ去られた木製のギター。ギターの胴体に海風の塩気が残っている。弦を弾くとまるで波の音が和音のように聞こえる。",
		model = {
			"no_bake_prop/pre_guitar02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_guitar02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "誰かの飲みかけ",
		award = 0,
		time = 0,
		id = 34,
		room_id = 4,
		icon = "3Ddrom_beach_item4",
		desc = "半分ほど飲み物が残っているグラス。まだ冷たさが残っているようで、外側の水滴がゆっくりと滴り落ちている。誰のものだったにせよ、今はこの砂浜のものになった。",
		model = {
			"no_bake_prop/pre_db_drink06_01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_drink06_01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "サーフボード",
		award = 0,
		time = 0,
		id = 35,
		room_id = 4,
		icon = "3Ddrom_beach_item5",
		desc = "無造作に置かれた数枚のサーフボード。ボードの擦り傷は波とのぶつかりあった過去を物語っている。今度は誰かを誘ってサーフィンを一緒にやってみるのもいいかもしれない。",
		model = {
			"no_bake_prop/pre_db_sportinggoods04a_01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_sportinggoods04a_01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "クーラーボックス",
		award = 0,
		time = 0,
		id = 36,
		room_id = 4,
		icon = "3Ddrom_beach_item6",
		desc = "小さくて可愛らしいクーラーボックス。中には何かのパーティーのためのものなのか、様々な飲み物やおやつがぎっちりと詰め込まれている。それにしても持ち主はどこに行ったのだろう。",
		model = {
			"fbx/litmap06/box/pre_plasticbox01_2"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap06/box/pre_plasticbox01_2/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "浮き輪",
		award = 0,
		time = 0,
		id = 37,
		room_id = 4,
		icon = "3Ddrom_beach_item7",
		desc = "砂浜に静かに横たわっている明るい黄色と青色の浮き輪。少し古びているが、浮き輪としての機能は全く損なわれていない。",
		model = {
			"no_bake_prop/pre_db_sportinggoods02_01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_sportinggoods02_01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "ゴミ箱",
		award = 0,
		time = 0,
		id = 38,
		room_id = 4,
		icon = "3Ddrom_beach_item8",
		desc = "シンプルなデザインのゴミ箱。ビーチでもゴミを適当に捨ててはならない。青い海だけでなく砂浜も大切に守らないと。",
		model = {
			"no_bake_prop/pre_db_trashcan02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_trashcan02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "ランタン",
		award = 0,
		time = 0,
		id = 39,
		room_id = 4,
		icon = "3Ddrom_beach_item9",
		desc = "シンプルなデザインのランタン。夜になると灯りがともされ、夜のビーチに温かな光を添えてくれる。まるで人々を幻想的な夜の散歩に誘っているかのようだ。",
		model = {
			"fbx/litmap04/pre_desklamp01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap04/pre_desklamp01/vfx_wupintishi01"
		}
	},
	[51] = {
		text = "dorm3d_noshiro_chair",
		name = "花見団子",
		award = 0,
		time = 0,
		id = 51,
		room_id = 2,
		icon = "3Ddrom_nengdai_item1",
		desc = "美味しそうなお団子が陶製の小皿に置かれ、\nテーブルクロスの柄と見事に調和している。\n後で彼女と一緒に味わおう。",
		model = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_tableware14"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_tableware14/vfx_wupintishi01"
		}
	},
	[52] = {
		text = "dorm3d_noshiro_chair",
		name = "菱餅",
		award = 0,
		time = 0,
		id = 52,
		room_id = 2,
		icon = "3Ddrom_nengdai_item2",
		desc = "草、雪、桃の花\n 健康、純潔、厄除け\n もっちりとした食感の中に、彼女の想いが込められて……",
		model = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_tableware15"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_tableware15/vfx_wupintishi01"
		}
	},
	[53] = {
		text = "dorm3d_noshiro_bed",
		name = "開かれた本",
		award = 0,
		time = 1,
		id = 53,
		room_id = 2,
		icon = "3Ddrom_nengdai_item3",
		desc = "重桜伝統の茶道作法について書かれた本。\nページの角は少し古びている。\n能代はよくこの本を読み返しているようで、\n後ろのページには几帳面なメモが残されている。",
		model = {
			"fbx/litmap_03/day/pre_db_book01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/day/pre_db_book01/vfx_wupintishi01"
		}
	},
	[54] = {
		text = "dorm3d_noshiro_bed",
		name = "寝具",
		award = 0,
		time = 0,
		id = 54,
		room_id = 2,
		icon = "3Ddrom_nengdai_item4",
		desc = "きちんと畳まれた寝具。\n角の揃え方が持ち主の真面目さをよく表している。",
		model = {
			"fbx/litmap_04/pre_db_quilt01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_04/pre_db_quilt01/vfx_wupintishi01"
		}
	},
	[55] = {
		text = "dorm3d_noshiro_bed",
		name = "制服",
		award = 0,
		time = 0,
		id = 55,
		room_id = 2,
		icon = "3Ddrom_nengdai_item5",
		desc = "壁に飾っている制服。\n普段着ているのと寸分違わず、\n能代にとってお気に入りのようだ。",
		model = {
			"fbx/litmap_03/pre_db_cloth02_01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_cloth02_01/vfx_wupintishi01"
		}
	},
	[56] = {
		text = "dorm3d_noshiro_chair",
		name = "重桜菓子",
		award = 0,
		time = 0,
		id = 56,
		room_id = 2,
		icon = "3Ddrom_nengdai_item6",
		desc = "美しく盛り付けられた重桜菓子の詰め合わせ。\n一つ一つが能代の手作り。\n彼女の想いに応えるよう、後でしっかり頂こう！",
		model = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_tableware13"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_tableware13/vfx_wupintishi01"
		}
	},
	[57] = {
		text = "dorm3d_noshiro_chair",
		name = "風鈴",
		award = 0,
		time = 0,
		id = 57,
		room_id = 2,
		icon = "3Ddrom_nengdai_item7",
		desc = "窓辺に飾られている風鈴。\nそよ風に揺られて涼やかな音色を奏でている。\n能代曰く、夏の暑さを紛らわす最高の方法の一つだそうだ。",
		model = {
			"fbx/litmap_03/pre_db_curtain04"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_curtain04/vfx_wupintishi01"
		}
	},
	[58] = {
		text = "dorm3d_noshiro_table",
		name = "風鈴・II",
		award = 0,
		time = 0,
		id = 58,
		room_id = 2,
		icon = "3Ddrom_nengdai_item8",
		desc = "ガラスの風鈴より深みのある音色を奏でる。\n能代が意図的に別々の場所に飾ったのは、\n二つの音色それぞれの風情を出すため。",
		model = {
			"fbx/litmap_03/pre_db_decoration06"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_decoration06/vfx_wupintishi01"
		}
	},
	[59] = {
		text = "dorm3d_noshiro_table",
		name = "ショッピングバッグ",
		award = 0,
		time = 0,
		id = 59,
		room_id = 2,
		icon = "3Ddrom_nengdai_item9",
		desc = "コーヒーショップのロゴが印刷された紙袋。\nただの買い物袋に過ぎないにしても、\n能代はそれを大切にしているようだ。",
		model = {
			"fbx/litmap_03/pre_db_bag01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_bag01/vfx_wupintishi01"
		}
	},
	[60] = {
		text = "dorm3d_noshiro_bed",
		name = "重桜着物",
		award = 0,
		time = 0,
		id = 60,
		room_id = 2,
		icon = "3Ddrom_nengdai_item10",
		desc = "金糸の刺繍が施された振袖、\n衣桁に飾っているだけでも上品さが伝わってくる。\n能代のお気に入りの衣装のようで、\n着て外出する時はいつも細心の注意を払っている。",
		model = {
			"fbx/litmap_03/pre_db_frame06"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_frame06/vfx_wupintishi01"
		}
	},
	[61] = {
		text = "dorm3d_noshiro_chair",
		name = "プリザーブドフラワー",
		award = 0,
		time = 0,
		id = 61,
		room_id = 2,
		icon = "3Ddrom_nengdai_item11",
		desc = "ガラスドームに保管されているバラ。\n花弁は鮮やかな色合いを保っている。",
		model = {
			"fbx/litmap_03/day/pre_db_decoration07"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/day/pre_db_decoration07/vfx_wupintishi01"
		}
	},
	[62] = {
		text = "dorm3d_noshiro_chair",
		name = "盆栽",
		award = 0,
		time = 0,
		id = 62,
		room_id = 2,
		icon = "3Ddrom_nengdai_item12",
		desc = "小さな松の盆栽。\nシンプルながら趣がある枝ぶり。\n能代は毎日時間をかけて手入れをし、\nこの自然の芸術を最高の状態に保っている。",
		model = {
			"fbx/litmap_03/pre_db_bonsai03_01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_bonsai03_01/vfx_wupintishi01"
		}
	},
	[63] = {
		text = "dorm3d_noshiro_chair",
		name = "水琴窟",
		award = 0,
		time = 0,
		id = 63,
		room_id = 2,
		icon = "3Ddrom_nengdai_item13",
		desc = "竹製のししおどしが部屋の隅に佇んでおり、\n竹筒に水が溜まった時、澄んだ音を奏でる。",
		model = {
			"fbx/litmap_03/pre_db_noshirohostel01_02"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_noshirohostel01_02/vfx_wupintishi01"
		}
	},
	[64] = {
		text = "dorm3d_noshiro_table",
		name = "重桜傘",
		award = 0,
		time = 0,
		id = 64,
		room_id = 2,
		icon = "3Ddrom_nengdai_item14",
		desc = "畳まれた重桜傘が壁に立て掛けられている。\n能代が外出時によく持ち歩く。\nもちろん、雨の日に限るが。",
		model = {
			"fbx/litmap_03/pre_db_decoration05_01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_decoration05_01/vfx_wupintishi01"
		}
	},
	[65] = {
		text = "dorm3d_noshiro_chair",
		name = "座蒲",
		award = 0,
		time = 0,
		id = 65,
		room_id = 2,
		icon = "3Ddrom_nengdai_item15",
		desc = "薄い色の丸い座蒲。\n見た目は硬そうだが、座ると意外と快適。\n執務室にも一つ置いてみようかな……？",
		model = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_chair08"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_chair08/vfx_wupintishi01"
		}
	},
	[66] = {
		text = "dorm3d_noshiro_table",
		name = "寿司盛り合わせ",
		award = 0,
		time = 0,
		id = 66,
		room_id = 2,
		icon = "3Ddrom_nengdai_item16",
		desc = "盛り付けられた寿司…とその他色々。\nバランも繊細に仕上げられており、\n能代の細やかな心遣いが感じ取れる。\nしかしまさか裏巻きまで……\nそこまで伝統に拘っていないのはちょっと意外だ。",
		model = {
			"fbx/no_bake_pay_prop/diningroom/pre_db_tableware12_01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/diningroom/pre_db_tableware12_01/vfx_wupintishi01"
		}
	},
	[67] = {
		text = "dorm3d_noshiro_chair",
		name = "桜の小枝",
		award = 0,
		time = 0,
		id = 67,
		room_id = 2,
		icon = "3Ddrom_nengdai_item17",
		desc = "テーブルに置かれている桜の小枝。\nピンクの花が枝に寄り添い、\n春の趣を出してくれる。",
		model = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_flowers04"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_flowers04/vfx_wupintishi01"
		}
	},
	[68] = {
		text = "dorm3d_noshiro_bed",
		name = "本の山",
		award = 0,
		time = 0,
		id = 68,
		room_id = 2,
		icon = "3Ddrom_nengdai_item18",
		desc = "積み上げられている本。\n茶道以外にも、華道や礼儀作法の本がある。\n挟まれた栞から判断するに、\n能代は新しい生け花の技法を学んでいるようだ。",
		model = {
			"fbx/litmap_03/pre_db_book04_01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_book04_01/vfx_wupintishi01"
		}
	},
	[70] = {
		text = "dorm3d_noshiro_bed",
		name = "やかん",
		award = 0,
		time = 0,
		id = 70,
		room_id = 2,
		icon = "3Ddrom_nengdai_item19",
		desc = "普通のやかん。\n能代がよくお茶を淹れる時に使っているもの。\n長く使われているようだが、いい感じに手入れされている。",
		model = {
			"fbx/litmap_02/pre_db_tableware09"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_tableware09/vfx_wupintishi01"
		}
	},
	[72] = {
		text = "dorm3d_noshiro_bed",
		name = "掛け軸",
		award = 0,
		time = 0,
		id = 72,
		room_id = 2,
		icon = "3Ddrom_nengdai_item20",
		desc = "巻物が書斎の隅に置かれ、\n紐は几帳面に結ばれている。\n広げられてはいないが、\n能代の細やかさが伝わってくる。\n",
		model = {
			"fbx/litmap_03/pre_db_cupboard08_01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_cupboard08_01/vfx_wupintishi01"
		}
	},
	[71] = {
		text = "dorm3d_sirius_chair",
		name = "石灯籠",
		award = 0,
		time = 1,
		id = 71,
		room_id = 2,
		icon = "3Ddrom_nengdai_item21",
		desc = "重桜の伝統的な庭園灯籠をモチーフとした石材調のフロアライト。\n落ち着いた雰囲気を醸し出してくれる。",
		model = {
			"fbx/litmap_03/day/pre_db_noshirohostel01_lamp02"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/day/pre_db_noshirohostel01_lamp02/vfx_wupintishi01"
		}
	},
	[76] = {
		text = "dorm3d_noshiro_bed",
		name = "加湿器",
		award = 0,
		time = 2,
		id = 76,
		room_id = 2,
		icon = "3Ddrom_nengdai_item24",
		desc = "白い加湿器が静かに動いており、\n時折かすかな振動音を立てている。\n能代が部屋の隅に置いたおかげで、湿った空気をゆっくりと広げている。\n彼女曰く、肌にいいのだそうだ。",
		model = {
			"fbx/litmap_03/night/pre_db_electrical08"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/night/pre_db_electrical08/vfx_wupintishi01"
		}
	},
	[77] = {
		text = "dorm3d_noshiro_bed",
		name = "スキンケアオイル",
		award = 0,
		time = 2,
		id = 77,
		room_id = 2,
		icon = "3Ddrom_nengdai_item25",
		desc = "ガラス瓶の中のオイルが淡い香りを漂わせている。\n能代によると、椿から抽出されたものだという。\n彼女のお気に入りの一品でもある。",
		model = {
			"fbx/litmap_03/night/pre_db_cosmetic10"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/night/pre_db_cosmetic10/vfx_wupintishi01"
		}
	},
	[78] = {
		text = "dorm3d_noshiro_bed",
		name = "香水瓶",
		award = 0,
		time = 2,
		id = 78,
		room_id = 2,
		icon = "3Ddrom_nengdai_item26",
		desc = "シンプルなデザインの香水瓶。\nガラスから柔らかな光を反射している。\nよく見ると、以前能代にプレゼントしたものだ。",
		model = {
			"fbx/litmap_03/night/pre_db_cosmetic01_01/pre_db_cosmetic01c"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/night/pre_db_cosmetic01_01/pre_db_cosmetic01c/vfx_wupintishi01"
		}
	},
	[79] = {
		text = "dorm3d_noshiro_bed",
		name = "アロマディフューザー",
		award = 0,
		time = 2,
		id = 79,
		room_id = 2,
		icon = "3Ddrom_nengdai_item27",
		desc = "ふんわりと香りが広がり、\n繊細な芳香が部屋に満ちている。\n能代からいつも感じる香りだ。",
		model = {
			"fbx/litmap_04/night/pre_db_cosmetic02a_01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_04/night/pre_db_cosmetic02a_01/vfx_wupintishi01"
		}
	},
	[74] = {
		text = "dorm3d_noshiro_bed",
		name = "行灯",
		award = 0,
		time = 2,
		id = 74,
		room_id = 2,
		icon = "3Ddrom_nengdai_item23",
		desc = "角に置かれている四角い木製の行灯。\n灯心からの光が障子紙を通して柔らかさを演出する。\n能代が心を込めて選んだ部屋のインテリアの一つ。",
		model = {
			"fbx/litmap_03/night/pre_db_chandelier11_on"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/night/pre_db_chandelier11_on/vfx_wupintishi01"
		}
	},
	[75] = {
		text = "dorm3d_noshiro_chair",
		name = "フロアスタンド",
		award = 0,
		time = 2,
		id = 75,
		room_id = 2,
		icon = "3Ddrom_nengdai_item22",
		desc = "柔らかな光を放つシンプルな重桜風フロアスタンド。\nカバーの下には小さな風鈴の飾りが吊り下げられており、\n能代と一緒にここで静かな時間を過ごしている。",
		model = {
			"fbx/no_bake_pay_prop/livingroom/pre_db_chandelier08_on"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/livingroom/pre_db_chandelier08_on/vfx_wupintishi01"
		}
	}
}
