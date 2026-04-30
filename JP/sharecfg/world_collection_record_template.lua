pg = pg or {}
pg.world_collection_record_template = rawget(pg, "world_collection_record_template") or setmetatable({
	__name = "world_collection_record_template"
}, confNEO)
pg.world_collection_record_template.all = {
	100001,
	100002,
	100003,
	100004,
	100005,
	100006,
	100007,
	100008,
	100009,
	100010,
	100011,
	100012,
	100013,
	100014,
	100015,
	100016,
	100017,
	100018,
	100019,
	100020,
	100021,
	100022,
	100023,
	100024,
	100025,
	100026,
	100027,
	100028,
	100029,
	100030,
	100031,
	100032,
	100033,
	100034,
	100035,
	100036,
	100037,
	100038,
	100039,
	100040,
	100041,
	100042,
	100043,
	100044,
	100045,
	100046,
	100047,
	100048,
	100049,
	100050,
	100051,
	100052,
	100053,
	100054,
	100055,
	100056,
	100057,
	100058,
	100059,
	100060,
	100061,
	100062,
	100063,
	100064,
	100065,
	100066,
	100071,
	100076,
	100077,
	100078,
	100079,
	100080,
	100081,
	100082,
	100083,
	100084,
	100085,
	100086,
	100087,
	100088,
	100089,
	100090,
	100091,
	100092,
	100093,
	100094,
	100095,
	100096,
	100097
}
pg.base = pg.base or {}
pg.base.world_collection_record_template = {}

;(function()
	pg.base.world_collection_record_template[100001] = {
		type = 1,
		name = "ブリーフィング",
		id = 100001,
		mask = "bg/bg_memory",
		group_ID = 1,
		icon = "memory_dashijie",
		condition = "セイレーン作戦開始",
		story = "WORLD100A"
	}
	pg.base.world_collection_record_template[100002] = {
		type = 1,
		name = "序章・Ⅰ",
		id = 100002,
		mask = "bg/bg_memory",
		group_ID = 2,
		icon = "memory_dashijie",
		condition = "1章・1節開始",
		story = "GWORLD101A"
	}
	pg.base.world_collection_record_template[100003] = {
		type = 1,
		name = "序章・Ⅱ",
		id = 100003,
		mask = "bg/bg_memory",
		group_ID = 3,
		icon = "memory_dashijie",
		condition = "ホーネットと会話",
		story = "GWORLD101B"
	}
	pg.base.world_collection_record_template[100004] = {
		type = 1,
		name = "序章・Ⅲ",
		id = 100004,
		mask = "bg/bg_memory",
		group_ID = 4,
		icon = "memory_dashijie",
		condition = "ホーネットと演習",
		story = "GWORLD101C"
	}
	pg.base.world_collection_record_template[100005] = {
		type = 1,
		name = "序章・Ⅳ",
		id = 100005,
		mask = "bg/bg_memory",
		group_ID = 5,
		icon = "memory_dashijie",
		condition = "戦闘撤退終了後",
		story = "GWORLD101D"
	}
	pg.base.world_collection_record_template[100006] = {
		type = 1,
		name = "出陣の角笛",
		id = 100006,
		mask = "bg/bg_memory",
		group_ID = 6,
		icon = "memory_dashijie",
		condition = "演習海域のNY港訪問",
		story = "WORLD102A"
	}
	pg.base.world_collection_record_template[100007] = {
		type = 1,
		name = "もう一度戦場へ",
		id = 100007,
		mask = "bg/bg_memory",
		group_ID = 7,
		icon = "memory_dashijie",
		condition = "1章・2節開始",
		story = "WORLD105A"
	}
	pg.base.world_collection_record_template[100008] = {
		type = 1,
		name = "レーダーモジュール",
		id = 100008,
		mask = "bg/bg_memory",
		group_ID = 8,
		icon = "memory_dashijie",
		condition = "1章・2節探索ポイント訪問",
		story = "WORLD105B"
	}
	pg.base.world_collection_record_template[100009] = {
		type = 1,
		name = "記憶ログ",
		id = 100009,
		mask = "bg/bg_memory",
		group_ID = 9,
		icon = "memory_dashijie",
		condition = "エリア①の敵を全て撃破",
		story = "WORLD105C"
	}
	pg.base.world_collection_record_template[100010] = {
		type = 1,
		name = "痕跡",
		id = 100010,
		mask = "bg/bg_memory",
		group_ID = 10,
		icon = "memory_dashijie",
		condition = "エリア②の敵を全て撃破",
		story = "WORLD105D"
	}
	pg.base.world_collection_record_template[100011] = {
		type = 1,
		name = "謎の艦船",
		id = 100011,
		mask = "bg/bg_memory",
		group_ID = 11,
		icon = "memory_dashijie",
		condition = "1章・2節探索ポイント訪問",
		story = "WORLD105E"
	}
	pg.base.world_collection_record_template[100012] = {
		type = 1,
		name = "敵の敵",
		id = 100012,
		mask = "bg/bg_memory",
		group_ID = 12,
		icon = "memory_dashijie",
		condition = "1章・3節開始",
		story = "WORLD106A"
	}
	pg.base.world_collection_record_template[100013] = {
		type = 1,
		name = "探索・1",
		id = 100013,
		mask = "bg/bg_memory",
		group_ID = 13,
		icon = "memory_dashijie",
		condition = "1章・3節探索ポイント訪問",
		story = "WORLD106B"
	}
	pg.base.world_collection_record_template[100014] = {
		type = 1,
		name = "探索・2",
		id = 100014,
		mask = "bg/bg_memory",
		group_ID = 14,
		icon = "memory_dashijie",
		condition = "1章・3節探索ポイント訪問",
		story = "WORLD106C"
	}
	pg.base.world_collection_record_template[100015] = {
		type = 1,
		name = "探索・3",
		id = 100015,
		mask = "bg/bg_memory",
		group_ID = 15,
		icon = "memory_dashijie",
		condition = "1章・3節探索ポイント訪問",
		story = "WORLD106D"
	}
	pg.base.world_collection_record_template[100016] = {
		type = 1,
		name = "エリア確保",
		id = 100016,
		mask = "bg/bg_memory",
		group_ID = 16,
		icon = "memory_dashijie",
		condition = "全ての敵を撃破",
		story = "WORLD106E"
	}
	pg.base.world_collection_record_template[100017] = {
		type = 1,
		name = "作戦進捗",
		id = 100017,
		mask = "bg/bg_memory",
		group_ID = 17,
		icon = "memory_dashijie",
		condition = "1章・4節開始",
		story = "WORLD107A"
	}
	pg.base.world_collection_record_template[100018] = {
		type = 1,
		name = "レッドアクシズ",
		id = 100018,
		mask = "bg/bg_memory",
		group_ID = 18,
		icon = "memory_dashijie",
		condition = "敵艦隊を5つ撃破する",
		story = "WORLD107B"
	}
	pg.base.world_collection_record_template[100019] = {
		type = 1,
		name = "通信",
		id = 100019,
		mask = "bg/bg_memory",
		group_ID = 19,
		icon = "memory_dashijie",
		condition = "1章・5節探索ポイント訪問",
		story = "WORLD108A"
	}
	pg.base.world_collection_record_template[100020] = {
		type = 1,
		name = "対空戦",
		id = 100020,
		mask = "bg/bg_memory",
		group_ID = 20,
		icon = "memory_dashijie",
		condition = "1章・5節探索ポイント訪問",
		story = "WORLD108B"
	}
	pg.base.world_collection_record_template[100021] = {
		type = 1,
		name = "停戦…？",
		id = 100021,
		mask = "bg/bg_memory",
		group_ID = 21,
		icon = "memory_dashijie",
		condition = "鉄血主力艦隊を撃退",
		story = "WORLD108C"
	}
	pg.base.world_collection_record_template[100022] = {
		type = 1,
		name = "準備",
		id = 100022,
		mask = "bg/bg_memory",
		group_ID = 22,
		icon = "memory_dashijie",
		condition = "1章・6節探索ポイント訪問",
		story = "WORLD109A"
	}
	pg.base.world_collection_record_template[100023] = {
		type = 1,
		name = "準備完了",
		id = 100023,
		mask = "bg/bg_memory",
		group_ID = 23,
		icon = "memory_dashijie",
		condition = "1章・6節探索ポイント訪問",
		story = "WORLD109B"
	}
	pg.base.world_collection_record_template[100024] = {
		type = 1,
		name = "META戦",
		id = 100024,
		mask = "bg/bg_memory",
		group_ID = 24,
		icon = "memory_dashijie",
		condition = "META戦開放",
		story = "GWORLD109A"
	}
	pg.base.world_collection_record_template[100025] = {
		type = 1,
		name = "女王の責任",
		id = 100025,
		mask = "bg/bg_memory",
		group_ID = 1,
		icon = "memory_dashijie",
		condition = "2章・1節の港に入港",
		story = "WORLD200A"
	}
	pg.base.world_collection_record_template[100026] = {
		type = 1,
		name = "集結",
		id = 100026,
		mask = "bg/bg_memory",
		group_ID = 2,
		icon = "memory_dashijie",
		condition = "2章・1節探索ポイント訪問",
		story = "WORLD200B"
	}
	pg.base.world_collection_record_template[100027] = {
		type = 1,
		name = "共同作戦",
		id = 100027,
		mask = "bg/bg_memory",
		group_ID = 3,
		icon = "memory_dashijie",
		condition = "2章・2節探索ポイント訪問",
		story = "WORLD201A"
	}
	pg.base.world_collection_record_template[100028] = {
		type = 1,
		name = "掃討",
		id = 100028,
		mask = "bg/bg_memory",
		group_ID = 4,
		icon = "memory_dashijie",
		condition = "2章・3節開始",
		story = "WORLD202A"
	}
	pg.base.world_collection_record_template[100029] = {
		type = 1,
		name = "救援信号",
		id = 100029,
		mask = "bg/bg_memory",
		group_ID = 5,
		icon = "memory_dashijie",
		condition = "全ての敵を撃破",
		story = "WORLD202B"
	}
	pg.base.world_collection_record_template[100030] = {
		type = 1,
		name = "遭難地点",
		id = 100030,
		mask = "bg/bg_memory",
		group_ID = 6,
		icon = "memory_dashijie",
		condition = "2章・4節開始",
		story = "WORLD203A"
	}
	pg.base.world_collection_record_template[100031] = {
		type = 1,
		name = "残骸",
		id = 100031,
		mask = "bg/bg_memory",
		group_ID = 7,
		icon = "memory_dashijie",
		condition = "2章・4節探索ポイント訪問",
		story = "WORLD203B"
	}
	pg.base.world_collection_record_template[100032] = {
		type = 1,
		name = "残影",
		id = 100032,
		mask = "bg/bg_memory",
		group_ID = 8,
		icon = "memory_dashijie",
		condition = "2章・4節探索ポイント訪問",
		story = "WORLD203C"
	}
	pg.base.world_collection_record_template[100033] = {
		type = 1,
		name = "特別任務",
		id = 100033,
		mask = "bg/bg_memory",
		group_ID = 9,
		icon = "memory_dashijie",
		condition = "2章・4節探索ポイント訪問",
		story = "WORLD203D"
	}
	pg.base.world_collection_record_template[100034] = {
		type = 1,
		name = "女王陛下の連絡",
		id = 100034,
		mask = "bg/bg_memory",
		group_ID = 10,
		icon = "memory_dashijie",
		condition = "2章・5節探索ポイント訪問",
		story = "WORLD204A"
	}
	pg.base.world_collection_record_template[100035] = {
		type = 1,
		name = "重力異常",
		id = 100035,
		mask = "bg/bg_memory",
		group_ID = 11,
		icon = "memory_dashijie",
		condition = "2章・6節開始",
		story = "WORLD205A"
	}
	pg.base.world_collection_record_template[100036] = {
		type = 1,
		name = "慣れの話題",
		id = 100036,
		mask = "bg/bg_memory",
		group_ID = 12,
		icon = "memory_dashijie",
		condition = "全ての敵を撃破",
		story = "WORLD205B"
	}
	pg.base.world_collection_record_template[100037] = {
		type = 1,
		name = "強敵",
		id = 100037,
		mask = "bg/bg_memory",
		group_ID = 13,
		icon = "memory_dashijie",
		condition = "2章・6節敵特殊ユニット撃破",
		story = "WORLD205C"
	}
	pg.base.world_collection_record_template[100038] = {
		type = 1,
		name = "解決",
		id = 100038,
		mask = "bg/bg_memory",
		group_ID = 14,
		icon = "memory_dashijie",
		condition = "敵特殊ユニット撃破",
		story = "WORLD205D"
	}
	pg.base.world_collection_record_template[100039] = {
		type = 1,
		name = "別働隊",
		id = 100039,
		mask = "bg/bg_memory",
		group_ID = 1,
		icon = "memory_dashijie",
		condition = "3章・1節の港に入港",
		story = "WORLD300A"
	}
	pg.base.world_collection_record_template[100040] = {
		type = 1,
		name = "システムチェック",
		id = 100040,
		mask = "bg/bg_memory",
		group_ID = 2,
		icon = "memory_dashijie",
		condition = "3章・1節探索ポイント訪問",
		story = "WORLD300B"
	}
	pg.base.world_collection_record_template[100041] = {
		type = 1,
		name = "鉄血の動向",
		id = 100041,
		mask = "bg/bg_memory",
		group_ID = 3,
		icon = "memory_dashijie",
		condition = "3章・2節探索ポイント訪問",
		story = "WORLD301A"
	}
	pg.base.world_collection_record_template[100042] = {
		type = 1,
		name = "味方の痕跡？",
		id = 100042,
		mask = "bg/bg_memory",
		group_ID = 4,
		icon = "memory_dashijie",
		condition = "3章・3節探索ポイント訪問",
		story = "WORLD302A"
	}
	pg.base.world_collection_record_template[100043] = {
		type = 1,
		name = "ジャミング",
		id = 100043,
		mask = "bg/bg_memory",
		group_ID = 5,
		icon = "memory_dashijie",
		condition = "3章・3節探索ポイント訪問",
		story = "WORLD302B"
	}
	pg.base.world_collection_record_template[100044] = {
		type = 1,
		name = "救援",
		id = 100044,
		mask = "bg/bg_memory",
		group_ID = 6,
		icon = "memory_dashijie",
		condition = "3章・4節探索ポイント訪問",
		story = "WORLD303A"
	}
	pg.base.world_collection_record_template[100045] = {
		type = 1,
		name = "疑惑",
		id = 100045,
		mask = "bg/bg_memory",
		group_ID = 7,
		icon = "memory_dashijie",
		condition = "3章・4節探索ポイント訪問",
		story = "WORLD303B"
	}
	pg.base.world_collection_record_template[100046] = {
		type = 1,
		name = "調査任務",
		id = 100046,
		mask = "bg/bg_memory",
		group_ID = 8,
		icon = "memory_dashijie",
		condition = "3章・5節探索ポイント訪問",
		story = "WORLD304A"
	}
	pg.base.world_collection_record_template[100047] = {
		type = 1,
		name = "残影",
		id = 100047,
		mask = "bg/bg_memory",
		group_ID = 9,
		icon = "memory_dashijie",
		condition = "3章・5節探索ポイント訪問",
		story = "WORLD304B"
	}
	pg.base.world_collection_record_template[100048] = {
		type = 1,
		name = "アビータ",
		id = 100048,
		mask = "bg/bg_memory",
		group_ID = 10,
		icon = "memory_dashijie",
		condition = "3章・5節探索ポイント訪問",
		story = "WORLD304C"
	}
	pg.base.world_collection_record_template[100049] = {
		type = 1,
		name = "増援",
		id = 100049,
		mask = "bg/bg_memory",
		group_ID = 11,
		icon = "memory_dashijie",
		condition = "全ての敵を撃破",
		story = "WORLD304D"
	}
	pg.base.world_collection_record_template[100050] = {
		type = 1,
		name = "寸分違わず",
		id = 100050,
		mask = "bg/bg_memory",
		group_ID = 12,
		icon = "memory_dashijie",
		condition = "敵特殊ユニット撃破",
		story = "WORLD304E"
	}
	pg.base.world_collection_record_template[100051] = {
		type = 1,
		name = "集中攻勢",
		id = 100051,
		mask = "bg/bg_memory",
		group_ID = 13,
		icon = "memory_dashijie",
		condition = "3章・6節開始",
		story = "WORLD305A"
	}
	pg.base.world_collection_record_template[100052] = {
		type = 1,
		name = "休憩",
		id = 100052,
		mask = "bg/bg_memory",
		group_ID = 14,
		icon = "memory_dashijie",
		condition = "3章・6節探索ポイント訪問",
		story = "WORLD305B"
	}
	pg.base.world_collection_record_template[100053] = {
		type = 1,
		name = "遠洋の旅",
		id = 100053,
		mask = "bg/bg_memory",
		group_ID = 1,
		icon = "memory_dashijie",
		condition = "4章・1節探索ポイント訪問",
		story = "WORLD400A"
	}
	pg.base.world_collection_record_template[100054] = {
		type = 1,
		name = "サディア",
		id = 100054,
		mask = "bg/bg_memory",
		group_ID = 2,
		icon = "memory_dashijie",
		condition = "4章・1節探索ポイント訪問",
		story = "WORLD400B"
	}
	pg.base.world_collection_record_template[100055] = {
		type = 1,
		name = "タラント",
		id = 100055,
		mask = "bg/bg_memory",
		group_ID = 3,
		icon = "memory_dashijie",
		condition = "4章・2節開始",
		story = "WORLD401A"
	}
	pg.base.world_collection_record_template[100056] = {
		type = 1,
		name = "途中離席",
		id = 100056,
		mask = "bg/bg_memory",
		group_ID = 4,
		icon = "memory_dashijie",
		condition = "4章・2節探索ポイント訪問",
		story = "WORLD401B"
	}
	pg.base.world_collection_record_template[100057] = {
		type = 1,
		name = "ダカール",
		id = 100057,
		mask = "bg/bg_memory",
		group_ID = 5,
		icon = "memory_dashijie",
		condition = "4章・3節開始",
		story = "WORLD402A"
	}
	pg.base.world_collection_record_template[100058] = {
		type = 1,
		name = "単独行動",
		id = 100058,
		mask = "bg/bg_memory",
		group_ID = 6,
		icon = "memory_dashijie",
		condition = "4章・3節探索ポイント訪問",
		story = "WORLD402B"
	}
	pg.base.world_collection_record_template[100059] = {
		type = 1,
		name = "疑惑",
		id = 100059,
		mask = "bg/bg_memory",
		group_ID = 7,
		icon = "memory_dashijie",
		condition = "全ての敵を撃破",
		story = "WORLD403A"
	}
	pg.base.world_collection_record_template[100060] = {
		type = 1,
		name = "深入り",
		id = 100060,
		mask = "bg/bg_memory",
		group_ID = 8,
		icon = "memory_dashijie",
		condition = "4章・5節開始",
		story = "WORLD404A"
	}
	pg.base.world_collection_record_template[100061] = {
		type = 1,
		name = "異様",
		id = 100061,
		mask = "bg/bg_memory",
		group_ID = 9,
		icon = "memory_dashijie",
		condition = "4章・5節探索ポイント訪問",
		story = "WORLD404B"
	}
	pg.base.world_collection_record_template[100062] = {
		type = 1,
		name = "幻影",
		id = 100062,
		mask = "bg/bg_memory",
		group_ID = 10,
		icon = "memory_dashijie",
		condition = "4章・5節探索ポイント訪問",
		story = "WORLD404C"
	}
	pg.base.world_collection_record_template[100063] = {
		type = 1,
		name = "代替品",
		id = 100063,
		mask = "bg/bg_memory",
		group_ID = 11,
		icon = "memory_dashijie",
		condition = "4章・5節探索ポイント訪問",
		story = "WORLD404D"
	}
	pg.base.world_collection_record_template[100064] = {
		type = 1,
		name = "軍師の覚醒",
		id = 100064,
		mask = "bg/bg_memory",
		group_ID = 12,
		icon = "memory_dashijie",
		condition = "4章・6節開始",
		story = "WORLD405A"
	}
	pg.base.world_collection_record_template[100065] = {
		type = 1,
		name = "仲裁する賢者",
		id = 100065,
		mask = "bg/bg_memory",
		group_ID = 13,
		icon = "memory_dashijie",
		condition = "全ての敵を撃破",
		story = "WORLD405B"
	}
	pg.base.world_collection_record_template[100066] = {
		type = 1,
		name = "脱出",
		id = 100066,
		mask = "bg/bg_memory",
		group_ID = 14,
		icon = "memory_dashijie",
		condition = "敵特殊ユニット撃破",
		story = "WORLD405C"
	}
	pg.base.world_collection_record_template[100071] = {
		type = 1,
		name = "DMRECX074：META",
		id = 100071,
		mask = "bg/bg_memory",
		group_ID = 1,
		icon = "memory_dashijie",
		condition = "1章・6節探索ポイント訪問",
		story = "WORLD9901A"
	}
	pg.base.world_collection_record_template[100076] = {
		type = 1,
		name = "泥沼",
		id = 100076,
		mask = "bg/bg_memory",
		group_ID = 1,
		icon = "memory_dashijie",
		condition = "5-1の前哨基地に入る",
		story = "WORLD500A"
	}
	pg.base.world_collection_record_template[100077] = {
		type = 1,
		name = "分岐",
		id = 100077,
		mask = "bg/bg_memory",
		group_ID = 2,
		icon = "memory_dashijie",
		condition = "次の調査ポイントを調査する",
		story = "WORLD500B"
	}
	pg.base.world_collection_record_template[100078] = {
		type = 1,
		name = "雷霆",
		id = 100078,
		mask = "bg/bg_memory",
		group_ID = 3,
		icon = "memory_dashijie",
		condition = "5-1の前哨基地に入る",
		story = "WORLD500C"
	}
	pg.base.world_collection_record_template[100079] = {
		type = 1,
		name = "ヒーロー",
		id = 100079,
		mask = "bg/bg_memory",
		group_ID = 4,
		icon = "memory_dashijie",
		condition = "5-2を開始する",
		story = "WORLD501A"
	}
	pg.base.world_collection_record_template[100080] = {
		type = 1,
		name = "座標",
		id = 100080,
		mask = "bg/bg_memory",
		group_ID = 5,
		icon = "memory_dashijie",
		condition = "次の調査ポイントを調査する",
		story = "WORLD501B"
	}
	pg.base.world_collection_record_template[100081] = {
		type = 1,
		name = "懐かしさ",
		id = 100081,
		mask = "bg/bg_memory",
		group_ID = 6,
		icon = "memory_dashijie",
		condition = "飛龍(META)と出会う",
		story = "WORLD501C"
	}
	pg.base.world_collection_record_template[100082] = {
		type = 1,
		name = "幻影",
		id = 100082,
		mask = "bg/bg_memory",
		group_ID = 7,
		icon = "memory_dashijie",
		condition = "5-3を開始する",
		story = "WORLD502A"
	}
	pg.base.world_collection_record_template[100083] = {
		type = 1,
		name = "決心",
		id = 100083,
		mask = "bg/bg_memory",
		group_ID = 8,
		icon = "memory_dashijie",
		condition = "5-4の調査ポイントを調査する",
		story = "WORLD503A"
	}
	pg.base.world_collection_record_template[100084] = {
		type = 1,
		name = "お茶会",
		id = 100084,
		mask = "bg/bg_memory",
		group_ID = 9,
		icon = "memory_dashijie",
		condition = "5-4の前哨基地に入る",
		story = "WORLD503B"
	}
	pg.base.world_collection_record_template[100085] = {
		type = 1,
		name = "総力戦開始",
		id = 100085,
		mask = "bg/bg_memory",
		group_ID = 10,
		icon = "memory_dashijie",
		condition = "5-5を開始する",
		story = "WORLD504A"
	}
	pg.base.world_collection_record_template[100086] = {
		type = 1,
		name = "砲撃支援群",
		id = 100086,
		mask = "bg/bg_memory",
		group_ID = 11,
		icon = "memory_dashijie",
		condition = "次の調査ポイントを調査する",
		story = "WORLD504B"
	}
	pg.base.world_collection_record_template[100087] = {
		type = 1,
		name = "遊撃支援隊",
		id = 100087,
		mask = "bg/bg_memory",
		group_ID = 12,
		icon = "memory_dashijie",
		condition = "次の調査ポイントを調査する",
		story = "WORLD504C"
	}
	pg.base.world_collection_record_template[100088] = {
		type = 1,
		name = "航空支援群",
		id = 100088,
		mask = "bg/bg_memory",
		group_ID = 13,
		icon = "memory_dashijie",
		condition = "次の調査ポイントを調査する",
		story = "WORLD504D"
	}
	pg.base.world_collection_record_template[100089] = {
		type = 1,
		name = "量産型ボディ",
		id = 100089,
		mask = "bg/bg_memory",
		group_ID = 14,
		icon = "memory_dashijie",
		condition = "次の調査ポイントを調査する",
		story = "WORLD504E"
	}
	pg.base.world_collection_record_template[100090] = {
		type = 1,
		name = "円環",
		id = 100090,
		mask = "bg/bg_memory",
		group_ID = 15,
		icon = "memory_dashijie",
		condition = "5-6を開始する",
		story = "WORLD505A"
	}
	pg.base.world_collection_record_template[100091] = {
		type = 1,
		name = "もう一つの特異点",
		id = 100091,
		mask = "bg/bg_memory",
		group_ID = 16,
		icon = "memory_dashijie",
		condition = "次の調査ポイントを調査する",
		story = "WORLD505B"
	}
	pg.base.world_collection_record_template[100092] = {
		type = 1,
		name = "いざない",
		id = 100092,
		mask = "bg/bg_memory",
		group_ID = 17,
		icon = "memory_dashijie",
		condition = "5-7を開始する",
		story = "WORLD506A"
	}
	pg.base.world_collection_record_template[100093] = {
		type = 1,
		name = "戦場工作艦",
		id = 100093,
		mask = "bg/bg_memory",
		group_ID = 18,
		icon = "memory_dashijie",
		condition = "次の調査ポイントを調査する",
		story = "WORLD506B"
	}
	pg.base.world_collection_record_template[100094] = {
		type = 1,
		name = "リジェクション",
		id = 100094,
		mask = "bg/bg_memory",
		group_ID = 19,
		icon = "memory_dashijie",
		condition = "5-8を開始する",
		story = "WORLD507A"
	}
	pg.base.world_collection_record_template[100095] = {
		type = 1,
		name = "交差する場所",
		id = 100095,
		mask = "bg/bg_memory",
		group_ID = 20,
		icon = "memory_dashijie",
		condition = "次の調査ポイントを調査する",
		story = "WORLD507E"
	}
	pg.base.world_collection_record_template[100096] = {
		type = 2,
		name = "BAD-漠然",
		id = 100096,
		mask = "bg/bg_memory",
		group_ID = 21,
		icon = "memory_dashijie",
		condition = "次の調査ポイントを調査する",
		story = "312671"
	}
	pg.base.world_collection_record_template[100097] = {
		type = 2,
		name = "TRUE-後日の発端",
		id = 100097,
		mask = "bg/bg_memory",
		group_ID = 22,
		icon = "memory_dashijie",
		condition = "次の調査ポイントを調査する",
		story = "312672"
	}
end)()
