pg = pg or {}
pg.gametip = setmetatable({
	__name = "gametip"
}, confMT)
pg.base = pg.base or {}
pg.base.gametip = pg.base.gametip or {}
cs = cs or {}
cs.gametip = {
	["new_airi_error_code_-1"] = {
		0,
		99,
		true
	},
	new_airi_error_code_0 = {
		99,
		92,
		true
	},
	new_airi_error_code_100100 = {
		191,
		109,
		true
	},
	new_airi_error_code_100110 = {
		300,
		109,
		true
	},
	new_airi_error_code_100111 = {
		409,
		113,
		true
	},
	new_airi_error_code_100112 = {
		522,
		139,
		true
	},
	new_airi_error_code_100113 = {
		661,
		135,
		true
	},
	new_airi_error_code_100114 = {
		796,
		128,
		true
	},
	new_airi_error_code_100115 = {
		924,
		132,
		true
	},
	new_airi_error_code_100116 = {
		1056,
		125,
		true
	},
	new_airi_error_code_100117 = {
		1181,
		108,
		true
	},
	new_airi_error_code_100120 = {
		1289,
		120,
		true
	},
	new_airi_error_code_100130 = {
		1409,
		117,
		true
	},
	new_airi_error_code_100140 = {
		1526,
		122,
		true
	},
	new_airi_error_code_100150 = {
		1648,
		123,
		true
	},
	new_airi_error_code_100160 = {
		1771,
		126,
		true
	},
	new_airi_error_code_100170 = {
		1897,
		113,
		true
	},
	new_airi_error_code_100180 = {
		2010,
		149,
		true
	},
	new_airi_error_code_100190 = {
		2159,
		133,
		true
	},
	new_airi_error_code_100200 = {
		2292,
		148,
		true
	},
	new_airi_error_code_100210 = {
		2440,
		164,
		true
	},
	new_airi_error_code_100211 = {
		2604,
		112,
		true
	},
	new_airi_error_code_100212 = {
		2716,
		114,
		true
	},
	new_airi_error_code_100213 = {
		2830,
		118,
		true
	},
	new_airi_error_code_100220 = {
		2948,
		112,
		true
	},
	new_airi_error_code_100221 = {
		3060,
		113,
		true
	},
	new_airi_error_code_100222 = {
		3173,
		113,
		true
	},
	new_airi_error_code_100223 = {
		3286,
		117,
		true
	},
	new_airi_error_code_100224 = {
		3403,
		118,
		true
	},
	new_airi_error_code_100225 = {
		3521,
		132,
		true
	},
	new_airi_error_code_100226 = {
		3653,
		135,
		true
	},
	new_airi_error_code_100227 = {
		3788,
		131,
		true
	},
	new_airi_error_code_100228 = {
		3919,
		130,
		true
	},
	new_airi_error_code_100229 = {
		4049,
		138,
		true
	},
	new_airi_error_code_100231 = {
		4187,
		144,
		true
	},
	new_airi_error_code_100232 = {
		4331,
		144,
		true
	},
	new_airi_error_code_100233 = {
		4475,
		131,
		true
	},
	new_airi_error_code_100234 = {
		4606,
		128,
		true
	},
	new_airi_error_code_100230 = {
		4734,
		111,
		true
	},
	new_airi_error_code_100240 = {
		4845,
		137,
		true
	},
	new_airi_error_code_100241 = {
		4982,
		133,
		true
	},
	new_airi_error_code_100242 = {
		5115,
		124,
		true
	},
	new_airi_error_code_100243 = {
		5239,
		140,
		true
	},
	new_airi_error_code_100244 = {
		5379,
		136,
		true
	},
	new_airi_error_code_100245 = {
		5515,
		144,
		true
	},
	new_airi_error_code_100246 = {
		5659,
		142,
		true
	},
	new_airi_error_code_100300 = {
		5801,
		118,
		true
	},
	new_airi_error_code_100301 = {
		5919,
		118,
		true
	},
	new_airi_error_code_100302 = {
		6037,
		132,
		true
	},
	new_airi_error_code_100303 = {
		6169,
		109,
		true
	},
	new_airi_error_code_100304 = {
		6278,
		124,
		true
	},
	new_airi_error_code_100305 = {
		6402,
		111,
		true
	},
	new_airi_error_code_100306 = {
		6513,
		123,
		true
	},
	new_airi_error_code_100404 = {
		6636,
		103,
		true
	},
	new_airi_error_code_200100 = {
		6739,
		115,
		true
	},
	new_airi_error_code_200110 = {
		6854,
		121,
		true
	},
	new_airi_error_code_200120 = {
		6975,
		131,
		true
	},
	new_airi_error_code_200130 = {
		7106,
		119,
		true
	},
	new_airi_error_code_200140 = {
		7225,
		114,
		true
	},
	new_airi_error_code_200150 = {
		7339,
		125,
		true
	},
	new_airi_error_code_200160 = {
		7464,
		114,
		true
	},
	new_airi_error_code_200170 = {
		7578,
		128,
		true
	},
	new_airi_error_code_200180 = {
		7706,
		145,
		true
	},
	new_airi_error_code_200190 = {
		7851,
		113,
		true
	},
	new_airi_error_code_200200 = {
		7964,
		121,
		true
	},
	new_airi_error_code_200210 = {
		8085,
		134,
		true
	},
	new_airi_error_code_200220 = {
		8219,
		132,
		true
	},
	new_airi_error_code_200230 = {
		8351,
		134,
		true
	},
	new_airi_error_code_200240 = {
		8485,
		139,
		true
	},
	new_airi_error_code_200250 = {
		8624,
		124,
		true
	},
	new_airi_error_code_200260 = {
		8748,
		122,
		true
	},
	new_airi_error_code_200270 = {
		8870,
		155,
		true
	},
	new_airi_error_code_200280 = {
		9025,
		140,
		true
	},
	new_airi_error_code_200290 = {
		9165,
		141,
		true
	},
	new_airi_error_code_200300 = {
		9306,
		127,
		true
	},
	new_airi_error_code_200310 = {
		9433,
		131,
		true
	},
	new_airi_error_code_200320 = {
		9564,
		169,
		true
	},
	new_airi_error_code_200330 = {
		9733,
		122,
		true
	},
	new_airi_error_code_200340 = {
		9855,
		114,
		true
	},
	new_airi_error_code_200350 = {
		9969,
		111,
		true
	},
	new_airi_error_code_200360 = {
		10080,
		124,
		true
	},
	new_airi_error_code_300100 = {
		10204,
		111,
		true
	},
	new_airi_error_code_100121 = {
		10315,
		132,
		true
	},
	new_airi_error_code_100201 = {
		10447,
		241,
		true
	},
	new_airi_error_code_100202 = {
		10688,
		254,
		true
	},
	new_airi_error_code_100203 = {
		10942,
		263,
		true
	},
	new_airi_error_code_100204 = {
		11205,
		347,
		true
	},
	new_airi_error_code_100205 = {
		11552,
		174,
		true
	},
	new_airi_error_code_100206 = {
		11726,
		241,
		true
	},
	new_airi_error_code_100207 = {
		11967,
		91,
		true
	},
	new_airi_error_code_100214 = {
		12058,
		301,
		true
	},
	new_airi_error_code_100218 = {
		12359,
		142,
		true
	},
	new_airi_error_code_100235 = {
		12501,
		131,
		true
	},
	new_airi_error_code_100307 = {
		12632,
		91,
		true
	},
	new_airi_error_code_100310 = {
		12723,
		137,
		true
	},
	new_airi_error_code_100311 = {
		12860,
		144,
		true
	},
	new_airi_error_code_100401 = {
		13004,
		116,
		true
	},
	new_airi_error_code_100600 = {
		13120,
		131,
		true
	},
	new_airi_error_code_100802 = {
		13251,
		91,
		true
	},
	new_airi_error_code_100803 = {
		13342,
		134,
		true
	},
	new_airi_error_code_200141 = {
		13476,
		148,
		true
	},
	new_airi_error_code_200145 = {
		13624,
		145,
		true
	},
	new_airi_error_code_200231 = {
		13769,
		91,
		true
	},
	new_airi_error_code_200232 = {
		13860,
		132,
		true
	},
	new_airi_error_code_200235 = {
		13992,
		115,
		true
	},
	new_airi_error_code_200236 = {
		14107,
		107,
		true
	},
	new_airi_error_code_200370 = {
		14214,
		91,
		true
	},
	new_airi_error_code_200380 = {
		14305,
		91,
		true
	},
	new_airi_error_code_200390 = {
		14396,
		91,
		true
	},
	new_airi_error_code_200400 = {
		14487,
		91,
		true
	},
	new_airi_error_code_200410 = {
		14578,
		124,
		true
	},
	new_airi_error_code_200420 = {
		14702,
		108,
		true
	},
	new_airi_error_code_200430 = {
		14810,
		120,
		true
	},
	new_airi_error_code_300101 = {
		14930,
		91,
		true
	},
	new_airi_error_code_300102 = {
		15021,
		91,
		true
	},
	new_airi_error_code_300200 = {
		15112,
		91,
		true
	},
	new_airi_error_code_300210 = {
		15203,
		117,
		true
	},
	new_airi_error_code_300220 = {
		15320,
		115,
		true
	},
	new_airi_error_code_300300 = {
		15435,
		119,
		true
	},
	new_airi_error_code_400010 = {
		15554,
		113,
		true
	},
	new_airi_error_code_400020 = {
		15667,
		119,
		true
	},
	new_airi_error_code_400030 = {
		15786,
		121,
		true
	},
	new_airi_error_code_400040 = {
		15907,
		118,
		true
	},
	new_airi_error_code_400050 = {
		16025,
		150,
		true
	},
	new_airi_error_code_400060 = {
		16175,
		125,
		true
	},
	new_airi_error_code_400070 = {
		16300,
		123,
		true
	},
	new_airi_error_code_400080 = {
		16423,
		150,
		true
	},
	new_airi_error_code_400090 = {
		16573,
		150,
		true
	},
	new_airi_error_code_400100 = {
		16723,
		150,
		true
	},
	new_airi_error_code_400460 = {
		16873,
		133,
		true
	},
	ad_0 = {
		17006,
		68,
		true
	},
	ad_1 = {
		17074,
		304,
		true
	},
	ad_2 = {
		17378,
		298,
		true
	},
	ad_3 = {
		17676,
		298,
		true
	},
	word_back = {
		17974,
		77,
		true
	},
	word_backyardMoney = {
		18051,
		94,
		true
	},
	word_cancel = {
		18145,
		81,
		true
	},
	word_cmdClose = {
		18226,
		89,
		true
	},
	word_delete = {
		18315,
		81,
		true
	},
	word_dockyard = {
		18396,
		81,
		true
	},
	word_dockyardUpgrade = {
		18477,
		95,
		true
	},
	word_dockyardDestroy = {
		18572,
		90,
		true
	},
	word_shipInfoScene_equip = {
		18662,
		97,
		true
	},
	word_shipInfoScene_reinfomation = {
		18759,
		106,
		true
	},
	word_shipInfoScene_infomation = {
		18865,
		105,
		true
	},
	word_editFleet = {
		18970,
		92,
		true
	},
	word_exp = {
		19062,
		75,
		true
	},
	word_expAdd = {
		19137,
		82,
		true
	},
	word_exp_chinese = {
		19219,
		83,
		true
	},
	word_exist = {
		19302,
		78,
		true
	},
	word_equip = {
		19380,
		78,
		true
	},
	word_equipDestory = {
		19458,
		88,
		true
	},
	word_food = {
		19546,
		79,
		true
	},
	word_get = {
		19625,
		79,
		true
	},
	word_got = {
		19704,
		79,
		true
	},
	word_not_get = {
		19783,
		86,
		true
	},
	word_next_level = {
		19869,
		89,
		true
	},
	word_intimacy = {
		19958,
		85,
		true
	},
	word_is = {
		20043,
		74,
		true
	},
	word_date = {
		20117,
		74,
		true
	},
	word_hour = {
		20191,
		74,
		true
	},
	word_minute = {
		20265,
		76,
		true
	},
	word_second = {
		20341,
		76,
		true
	},
	word_lv = {
		20417,
		74,
		true
	},
	word_proficiency = {
		20491,
		91,
		true
	},
	word_material = {
		20582,
		82,
		true
	},
	word_notExist = {
		20664,
		91,
		true
	},
	word_ok = {
		20755,
		78,
		true
	},
	word_preview = {
		20833,
		83,
		true
	},
	word_rarity = {
		20916,
		81,
		true
	},
	word_speedUp = {
		20997,
		85,
		true
	},
	word_succeed = {
		21082,
		83,
		true
	},
	word_start = {
		21165,
		79,
		true
	},
	word_kiss = {
		21244,
		80,
		true
	},
	word_take = {
		21324,
		80,
		true
	},
	word_takeOk = {
		21404,
		84,
		true
	},
	word_many = {
		21488,
		77,
		true
	},
	word_normal_2 = {
		21565,
		82,
		true
	},
	word_simple = {
		21647,
		79,
		true
	},
	word_save = {
		21726,
		77,
		true
	},
	word_levelup = {
		21803,
		84,
		true
	},
	word_serverLoadVindicate = {
		21887,
		122,
		true
	},
	word_serverLoadNormal = {
		22009,
		167,
		true
	},
	word_serverLoadFull = {
		22176,
		112,
		true
	},
	word_registerFull = {
		22288,
		114,
		true
	},
	word_synthesize = {
		22402,
		84,
		true
	},
	word_synthesize_power = {
		22486,
		96,
		true
	},
	word_achieved_item = {
		22582,
		93,
		true
	},
	word_formation = {
		22675,
		84,
		true
	},
	word_teach = {
		22759,
		79,
		true
	},
	word_study = {
		22838,
		79,
		true
	},
	word_destroy = {
		22917,
		82,
		true
	},
	word_upgrade = {
		22999,
		87,
		true
	},
	word_train = {
		23086,
		78,
		true
	},
	word_rest = {
		23164,
		77,
		true
	},
	word_capacity = {
		23241,
		88,
		true
	},
	word_operation = {
		23329,
		88,
		true
	},
	word_intensify_phase = {
		23417,
		97,
		true
	},
	word_systemClose = {
		23514,
		130,
		true
	},
	word_attr_antisub = {
		23644,
		85,
		true
	},
	word_attr_cannon = {
		23729,
		83,
		true
	},
	word_attr_torpedo = {
		23812,
		85,
		true
	},
	word_attr_antiaircraft = {
		23897,
		89,
		true
	},
	word_attr_air = {
		23986,
		81,
		true
	},
	word_attr_durability = {
		24067,
		86,
		true
	},
	word_attr_armor = {
		24153,
		84,
		true
	},
	word_attr_reload = {
		24237,
		84,
		true
	},
	word_attr_speed = {
		24321,
		84,
		true
	},
	word_attr_luck = {
		24405,
		82,
		true
	},
	word_attr_range = {
		24487,
		84,
		true
	},
	word_attr_range_view = {
		24571,
		89,
		true
	},
	word_attr_hit = {
		24660,
		80,
		true
	},
	word_attr_dodge = {
		24740,
		83,
		true
	},
	word_attr_luck1 = {
		24823,
		83,
		true
	},
	word_attr_damage = {
		24906,
		83,
		true
	},
	word_attr_healthy = {
		24989,
		88,
		true
	},
	word_attr_cd = {
		25077,
		78,
		true
	},
	word_attr_speciality = {
		25155,
		91,
		true
	},
	word_attr_level = {
		25246,
		88,
		true
	},
	word_shipState_npc = {
		25334,
		120,
		true
	},
	word_shipState_fight = {
		25454,
		110,
		true
	},
	word_shipState_world = {
		25564,
		137,
		true
	},
	word_shipState_rest = {
		25701,
		109,
		true
	},
	word_shipState_study = {
		25810,
		109,
		true
	},
	word_shipState_tactics = {
		25919,
		111,
		true
	},
	word_shipState_collect = {
		26030,
		116,
		true
	},
	word_shipState_event = {
		26146,
		121,
		true
	},
	word_shipState_activity = {
		26267,
		138,
		true
	},
	word_shipState_sham = {
		26405,
		119,
		true
	},
	word_shipState_support = {
		26524,
		130,
		true
	},
	word_shipType_quZhu = {
		26654,
		92,
		true
	},
	word_shipType_qinXun = {
		26746,
		97,
		true
	},
	word_shipType_zhongXun = {
		26843,
		99,
		true
	},
	word_shipType_zhanLie = {
		26942,
		95,
		true
	},
	word_shipType_hangMu = {
		27037,
		91,
		true
	},
	word_shipType_weiXiu = {
		27128,
		90,
		true
	},
	word_shipType_other = {
		27218,
		87,
		true
	},
	word_shipType_all = {
		27305,
		90,
		true
	},
	word_gem = {
		27395,
		76,
		true
	},
	word_freeGem = {
		27471,
		80,
		true
	},
	word_gem_icon = {
		27551,
		109,
		true
	},
	word_freeGem_icon = {
		27660,
		113,
		true
	},
	word_exploit = {
		27773,
		81,
		true
	},
	word_rankScore = {
		27854,
		84,
		true
	},
	word_battery = {
		27938,
		91,
		true
	},
	word_oil = {
		28029,
		75,
		true
	},
	word_gold = {
		28104,
		78,
		true
	},
	word_oilField = {
		28182,
		85,
		true
	},
	word_goldField = {
		28267,
		88,
		true
	},
	word_ema = {
		28355,
		76,
		true
	},
	word_ema1 = {
		28431,
		77,
		true
	},
	word_pt = {
		28508,
		77,
		true
	},
	word_omamori = {
		28585,
		89,
		true
	},
	word_yisegefuke_pt = {
		28674,
		88,
		true
	},
	word_faxipt = {
		28762,
		84,
		true
	},
	word_count_2 = {
		28846,
		99,
		true
	},
	word_clear = {
		28945,
		78,
		true
	},
	word_buy = {
		29023,
		75,
		true
	},
	word_happy = {
		29098,
		102,
		true
	},
	word_normal = {
		29200,
		104,
		true
	},
	word_tired = {
		29304,
		102,
		true
	},
	word_angry = {
		29406,
		102,
		true
	},
	word_max_page = {
		29508,
		80,
		true
	},
	word_least_page = {
		29588,
		82,
		true
	},
	word_week = {
		29670,
		74,
		true
	},
	word_day = {
		29744,
		73,
		true
	},
	word_use = {
		29817,
		75,
		true
	},
	word_use_batch = {
		29892,
		84,
		true
	},
	word_discount = {
		29976,
		85,
		true
	},
	word_threaten_exclude = {
		30061,
		101,
		true
	},
	word_threaten = {
		30162,
		83,
		true
	},
	word_comingSoon = {
		30245,
		90,
		true
	},
	word_lightArmor = {
		30335,
		84,
		true
	},
	word_mediumArmor = {
		30419,
		86,
		true
	},
	word_heavyarmor = {
		30505,
		84,
		true
	},
	word_level_upperLimit = {
		30589,
		94,
		true
	},
	word_level_require = {
		30683,
		92,
		true
	},
	word_materal_no_enough = {
		30775,
		118,
		true
	},
	word_default = {
		30893,
		83,
		true
	},
	word_count = {
		30976,
		80,
		true
	},
	word_kind = {
		31056,
		77,
		true
	},
	word_piece = {
		31133,
		75,
		true
	},
	word_main_fleet = {
		31208,
		89,
		true
	},
	word_vanguard_fleet = {
		31297,
		91,
		true
	},
	word_theme = {
		31388,
		79,
		true
	},
	word_recommend = {
		31467,
		82,
		true
	},
	word_wallpaper = {
		31549,
		88,
		true
	},
	word_furniture = {
		31637,
		83,
		true
	},
	word_decorate = {
		31720,
		83,
		true
	},
	word_special = {
		31803,
		83,
		true
	},
	word_expand = {
		31886,
		81,
		true
	},
	word_wall = {
		31967,
		77,
		true
	},
	word_floorpaper = {
		32044,
		84,
		true
	},
	word_collection = {
		32128,
		89,
		true
	},
	word_mat = {
		32217,
		78,
		true
	},
	word_comfort_level = {
		32295,
		89,
		true
	},
	word_room = {
		32384,
		80,
		true
	},
	word_equipment_all = {
		32464,
		85,
		true
	},
	word_equipment_cannon = {
		32549,
		94,
		true
	},
	word_equipment_torpedo = {
		32643,
		93,
		true
	},
	word_equipment_aircraft = {
		32736,
		95,
		true
	},
	word_equipment_small_cannon = {
		32831,
		102,
		true
	},
	word_equipment_medium_cannon = {
		32933,
		103,
		true
	},
	word_equipment_big_cannon = {
		33036,
		100,
		true
	},
	word_equipment_warship_torpedo = {
		33136,
		109,
		true
	},
	word_equipment_submarine_torpedo = {
		33245,
		107,
		true
	},
	word_equipment_antiaircraft = {
		33352,
		99,
		true
	},
	word_equipment_fighter = {
		33451,
		93,
		true
	},
	word_equipment_bomber = {
		33544,
		96,
		true
	},
	word_equipment_torpedo_bomber = {
		33640,
		104,
		true
	},
	word_equipment_equip = {
		33744,
		93,
		true
	},
	word_equipment_type = {
		33837,
		87,
		true
	},
	word_equipment_rarity = {
		33924,
		91,
		true
	},
	word_equipment_intensify = {
		34015,
		95,
		true
	},
	word_equipment_special = {
		34110,
		90,
		true
	},
	word_primary_weapons = {
		34200,
		95,
		true
	},
	word_main_cannons = {
		34295,
		89,
		true
	},
	word_shipboard_aircraft = {
		34384,
		95,
		true
	},
	word_sub_cannons = {
		34479,
		94,
		true
	},
	word_sub_weapons = {
		34573,
		96,
		true
	},
	word_torpedo = {
		34669,
		83,
		true
	},
	["word_ air_defense_artillery"] = {
		34752,
		99,
		true
	},
	word_air_defense_artillery = {
		34851,
		98,
		true
	},
	word_device = {
		34949,
		84,
		true
	},
	word_cannon = {
		35033,
		84,
		true
	},
	word_fighter = {
		35117,
		83,
		true
	},
	word_bomber = {
		35200,
		86,
		true
	},
	word_attacker = {
		35286,
		91,
		true
	},
	word_seaplane = {
		35377,
		91,
		true
	},
	word_submarine_torpedo = {
		35468,
		103,
		true
	},
	word_missile = {
		35571,
		83,
		true
	},
	word_online = {
		35654,
		81,
		true
	},
	word_apply = {
		35735,
		79,
		true
	},
	word_star = {
		35814,
		78,
		true
	},
	word_level = {
		35892,
		77,
		true
	},
	word_mod_value = {
		35969,
		89,
		true
	},
	word_wait = {
		36058,
		73,
		true
	},
	word_consume = {
		36131,
		80,
		true
	},
	word_sell_out = {
		36211,
		85,
		true
	},
	word_sell_lock = {
		36296,
		82,
		true
	},
	word_diamond_tip = {
		36378,
		493,
		true
	},
	word_contribution = {
		36871,
		87,
		true
	},
	word_guild_res = {
		36958,
		90,
		true
	},
	word_fit = {
		37048,
		80,
		true
	},
	word_equipment_skin = {
		37128,
		89,
		true
	},
	word_activity = {
		37217,
		83,
		true
	},
	word_urgency_event = {
		37300,
		94,
		true
	},
	word_shop = {
		37394,
		77,
		true
	},
	word_facility = {
		37471,
		83,
		true
	},
	word_cv_key_main = {
		37554,
		92,
		true
	},
	channel_name_1 = {
		37646,
		81,
		true
	},
	channel_name_2 = {
		37727,
		83,
		true
	},
	channel_name_3 = {
		37810,
		84,
		true
	},
	channel_name_4 = {
		37894,
		85,
		true
	},
	channel_name_5 = {
		37979,
		83,
		true
	},
	common_wait = {
		38062,
		107,
		true
	},
	common_ship_type = {
		38169,
		89,
		true
	},
	common_dont_remind_dur_login = {
		38258,
		108,
		true
	},
	common_activity_end = {
		38366,
		135,
		true
	},
	common_activity_notStartOrEnd = {
		38501,
		191,
		true
	},
	common_activity_not_start = {
		38692,
		143,
		true
	},
	common_error = {
		38835,
		90,
		true
	},
	common_no_gold = {
		38925,
		130,
		true
	},
	common_no_oil = {
		39055,
		126,
		true
	},
	common_no_rmb = {
		39181,
		127,
		true
	},
	common_count_noenough = {
		39308,
		101,
		true
	},
	common_no_dorm_gold = {
		39409,
		142,
		true
	},
	common_no_resource = {
		39551,
		114,
		true
	},
	common_no_item = {
		39665,
		128,
		true
	},
	common_no_item_1 = {
		39793,
		96,
		true
	},
	common_no_x = {
		39889,
		123,
		true
	},
	common_limit_cmd = {
		40012,
		134,
		true
	},
	common_limit_type = {
		40146,
		159,
		true
	},
	common_limit_equip = {
		40305,
		97,
		true
	},
	common_buy_success = {
		40402,
		92,
		true
	},
	common_limit_level = {
		40494,
		134,
		true
	},
	common_shopId_noFound = {
		40628,
		102,
		true
	},
	common_today_buy_limit = {
		40730,
		106,
		true
	},
	common_not_enter_room = {
		40836,
		96,
		true
	},
	common_test_ship = {
		40932,
		108,
		true
	},
	common_entry_inhibited = {
		41040,
		101,
		true
	},
	common_refresh_count_insufficient = {
		41141,
		113,
		true
	},
	common_get_player_info_erro = {
		41254,
		121,
		true
	},
	common_no_open = {
		41375,
		90,
		true
	},
	["common_already owned"] = {
		41465,
		88,
		true
	},
	common_not_get_ship = {
		41553,
		101,
		true
	},
	common_sale_out = {
		41654,
		87,
		true
	},
	common_skin_out_of_stock = {
		41741,
		99,
		true
	},
	common_go_home = {
		41840,
		121,
		true
	},
	dont_remind_today = {
		41961,
		89,
		true
	},
	dont_remind_session = {
		42050,
		91,
		true
	},
	battle_no_oil = {
		42141,
		144,
		true
	},
	battle_emptyBlock = {
		42285,
		116,
		true
	},
	battle_duel_main_rage = {
		42401,
		171,
		true
	},
	battle_main_emergent = {
		42572,
		163,
		true
	},
	battle_battleMediator_goOnFight = {
		42735,
		103,
		true
	},
	battle_battleMediator_existFight = {
		42838,
		101,
		true
	},
	battle_battleMediator_clear_warning = {
		42939,
		251,
		true
	},
	battle_battleMediator_quest_exist = {
		43190,
		233,
		true
	},
	battle_levelMediator_ok_takeResource = {
		43423,
		119,
		true
	},
	battle_result_time_limit = {
		43542,
		125,
		true
	},
	battle_result_sink_limit = {
		43667,
		111,
		true
	},
	battle_result_undefeated = {
		43778,
		101,
		true
	},
	battle_result_victory = {
		43879,
		98,
		true
	},
	battle_result_defeat_all_enemys = {
		43977,
		117,
		true
	},
	battle_result_base_score = {
		44094,
		102,
		true
	},
	battle_result_dead_score = {
		44196,
		104,
		true
	},
	battle_result_score = {
		44300,
		105,
		true
	},
	battle_result_score_total = {
		44405,
		95,
		true
	},
	battle_result_total_damage = {
		44500,
		103,
		true
	},
	battle_result_contribution = {
		44603,
		111,
		true
	},
	battle_result_total_score = {
		44714,
		101,
		true
	},
	battle_result_max_combo = {
		44815,
		97,
		true
	},
	battle_levelScene_0Oil = {
		44912,
		105,
		true
	},
	battle_levelScene_0Gold = {
		45017,
		108,
		true
	},
	battle_levelScene_noRaderCount = {
		45125,
		106,
		true
	},
	battle_levelScene_lock = {
		45231,
		185,
		true
	},
	battle_levelScene_hard_lock = {
		45416,
		245,
		true
	},
	battle_levelScene_close = {
		45661,
		130,
		true
	},
	battle_levelScene_chapter_lock = {
		45791,
		193,
		true
	},
	battle_preCombatLayer_changeFormationError = {
		45984,
		160,
		true
	},
	battle_preCombatLayer_changeFormationNumberError = {
		46144,
		197,
		true
	},
	battle_preCombatLayer_ready = {
		46341,
		141,
		true
	},
	battle_preCombatLayer_quest_leaveFleet = {
		46482,
		151,
		true
	},
	battle_preCombatLayer_clear_confirm = {
		46633,
		154,
		true
	},
	battle_preCombatLayer_auto_confirm = {
		46787,
		154,
		true
	},
	battle_preCombatLayer_save_confirm = {
		46941,
		124,
		true
	},
	battle_preCombatLayer_save_march = {
		47065,
		126,
		true
	},
	battle_preCombatLayer_save_success = {
		47191,
		114,
		true
	},
	battle_preCombatLayer_time_limit = {
		47305,
		123,
		true
	},
	battle_preCombatLayer_sink_limit = {
		47428,
		119,
		true
	},
	battle_preCombatLayer_undefeated = {
		47547,
		119,
		true
	},
	battle_preCombatLayer_victory = {
		47666,
		111,
		true
	},
	battle_preCombatLayer_time_hold = {
		47777,
		119,
		true
	},
	battle_preCombatLayer_damage_before_end = {
		47896,
		158,
		true
	},
	battle_preCombatLayer_destory_transport_ship = {
		48054,
		138,
		true
	},
	battle_preCombatMediator_leastLimit = {
		48192,
		124,
		true
	},
	battle_preCombatMediator_timeout = {
		48316,
		184,
		true
	},
	battle_preCombatMediator_activity_timeout = {
		48500,
		203,
		true
	},
	battle_resourceSiteLayer_collecTimeDefault = {
		48703,
		155,
		true
	},
	battle_resourceSiteLayer_collecTime = {
		48858,
		142,
		true
	},
	battle_resourceSiteLayer_maxLv = {
		49000,
		139,
		true
	},
	battle_resourceSiteLayer_avgLv = {
		49139,
		139,
		true
	},
	battle_resourceSiteLayer_shipTypeCount = {
		49278,
		108,
		true
	},
	battle_resourceSiteLayer_no_maxLv = {
		49386,
		157,
		true
	},
	battle_resourceSiteLayer_no_avgLv = {
		49543,
		157,
		true
	},
	battle_resourceSiteLayer_no_shipTypeCount = {
		49700,
		151,
		true
	},
	battle_resourceSiteLayer_startError_collecting = {
		49851,
		123,
		true
	},
	battle_resourceSiteLayer_startError_not5Ship = {
		49974,
		162,
		true
	},
	battle_resourceSiteLayer_startError_limit = {
		50136,
		153,
		true
	},
	battle_resourceSiteLayer_endError_notStar = {
		50289,
		131,
		true
	},
	battle_resourceSiteLayer_quest_end = {
		50420,
		182,
		true
	},
	battle_resourceSiteMediator_noSite = {
		50602,
		127,
		true
	},
	battle_resourceSiteMediator_shipState_fight = {
		50729,
		157,
		true
	},
	battle_resourceSiteMediator_shipState_rest = {
		50886,
		133,
		true
	},
	battle_resourceSiteMediator_shipState_study = {
		51019,
		133,
		true
	},
	battle_resourceSiteMediator_shipState_event = {
		51152,
		138,
		true
	},
	battle_resourceSiteMediator_shipState_same = {
		51290,
		140,
		true
	},
	battle_resourceSiteMediator_ok_end = {
		51430,
		112,
		true
	},
	battle_autobot_unlock = {
		51542,
		106,
		true
	},
	tips_confirm_teleport_sub = {
		51648,
		335,
		true
	},
	backyard_addExp_Info = {
		51983,
		280,
		true
	},
	backyard_extendCapacity_error = {
		52263,
		111,
		true
	},
	backyard_extendCapacity_ok = {
		52374,
		174,
		true
	},
	backyard_addShip_error = {
		52548,
		106,
		true
	},
	backyard_buyFurniture_error = {
		52654,
		122,
		true
	},
	backyard_extendBackYard_error = {
		52776,
		122,
		true
	},
	backyard_addFood_error = {
		52898,
		108,
		true
	},
	backyard_addFood_ok = {
		53006,
		141,
		true
	},
	backyard_putFurniture_ok = {
		53147,
		94,
		true
	},
	backyard_backyardGranaryLayer_foodCountLimit = {
		53241,
		138,
		true
	},
	backyard_shipAddInimacy_ok = {
		53379,
		161,
		true
	},
	backyard_shipAddInimacy_error = {
		53540,
		119,
		true
	},
	backyard_shipAddMoney_ok = {
		53659,
		185,
		true
	},
	backyard_shipAddMoney_error = {
		53844,
		116,
		true
	},
	backyard_shipExit_error = {
		53960,
		109,
		true
	},
	backyard_shipSpeedUpEnergy_error = {
		54069,
		112,
		true
	},
	backyard_shipAlreadyExit = {
		54181,
		111,
		true
	},
	backyard_backyardGranaryLayer_full = {
		54292,
		163,
		true
	},
	backyard_backyardGranaryLayer_buyCountLimit = {
		54455,
		152,
		true
	},
	backyard_backyardGranaryLayer_error_noResource = {
		54607,
		181,
		true
	},
	backyard_backyardGranaryLayer_noFood = {
		54788,
		151,
		true
	},
	backyard_backyardGranaryLayer_noTimer = {
		54939,
		188,
		true
	},
	backyard_backyardGranaryLayer_word = {
		55127,
		147,
		true
	},
	backyard_backyardGranaryLayer_noShip = {
		55274,
		168,
		true
	},
	backyard_backyardGranaryLayer_foodTimeNotice_top = {
		55442,
		144,
		true
	},
	backyard_backyardGranaryLayer_foodTimeNotice_bottom = {
		55586,
		133,
		true
	},
	backyard_backyardGranaryLayer_foodMaxIncreaseNotice = {
		55719,
		199,
		true
	},
	backyard_backyardGranaryLayer_error_entendFail = {
		55918,
		190,
		true
	},
	backyard_backyardGranaryLayer_buy_max_count = {
		56108,
		154,
		true
	},
	backyard_backyardScene_comforChatContent1 = {
		56262,
		291,
		true
	},
	backyard_backyardScene_comforChatContent2 = {
		56553,
		275,
		true
	},
	backyard_buyExtendItem_question = {
		56828,
		172,
		true
	},
	backyard_backyardScene_expression_label_1 = {
		57000,
		108,
		true
	},
	backyard_backyardScene_expression_label_2 = {
		57108,
		111,
		true
	},
	backyard_backyardScene_expression_label_3 = {
		57219,
		116,
		true
	},
	backyard_backyardScene_quest_clearButton = {
		57335,
		154,
		true
	},
	backyard_backyardScene_quest_saveFurniture = {
		57489,
		152,
		true
	},
	backyard_backyardScene_restSuccess = {
		57641,
		127,
		true
	},
	backyard_backyardScene_clearSuccess = {
		57768,
		131,
		true
	},
	backyard_backyardScene_name = {
		57899,
		123,
		true
	},
	backyard_backyardScene_exitShipAfterAddEnergy = {
		58022,
		154,
		true
	},
	backyard_backyardScene_showAddExpInfo = {
		58176,
		180,
		true
	},
	backyard_backyardScene_error_noPosPutFurniture = {
		58356,
		137,
		true
	},
	backyard_backyardScene_error_noFurniture = {
		58493,
		146,
		true
	},
	backyard_backyardScene_error_canNotRotate = {
		58639,
		158,
		true
	},
	backyard_backyardShipInfoLayer_quest_openPos = {
		58797,
		160,
		true
	},
	backyard_backyardShipInfoLayer_quest_addShipNoFood = {
		58957,
		182,
		true
	},
	backyard_backyardShipInfoLayer_quest_quickAddEnergy = {
		59139,
		196,
		true
	},
	backyard_backyardShipInfoLayer_error_noQuickItem = {
		59335,
		151,
		true
	},
	backyard_backyardShipInfoMediator_shipState_rest = {
		59486,
		149,
		true
	},
	backyard_backyardShipInfoMediator_shipState_fight = {
		59635,
		150,
		true
	},
	backyard_backyardShipInfoMediator_shipState_study = {
		59785,
		139,
		true
	},
	backyard_backyardShipInfoMediator_shipState_collect = {
		59924,
		146,
		true
	},
	backyard_backyardShipInfoMediator_shipState_event = {
		60070,
		150,
		true
	},
	backyard_backyardShipInfoMediator_quest_moveOutFleet = {
		60220,
		228,
		true
	},
	backyard_backyardShipInfoMediator_error_vanguardFleetOnlyOneShip = {
		60448,
		174,
		true
	},
	backyard_backyardShipInfoMediator_error_mainFleetOnlyOneShip = {
		60622,
		172,
		true
	},
	backyard_backyardShipInfoMediator_ok_addShip = {
		60794,
		119,
		true
	},
	backyard_backyardShipInfoMediator_ok_unlock = {
		60913,
		116,
		true
	},
	backyard_backyardShipInfoMediator_error_noFood = {
		61029,
		140,
		true
	},
	backyard_backyardShipInfoMediator_error_fullEnergy = {
		61169,
		142,
		true
	},
	backyard_backyardShipInfoMediator_error_fleetOnlyOneShip = {
		61311,
		188,
		true
	},
	backyard_open_2floor = {
		61499,
		224,
		true
	},
	backyarad_theme_replace = {
		61723,
		168,
		true
	},
	backyard_extendArea_ok = {
		61891,
		100,
		true
	},
	backyard_extendArea_erro = {
		61991,
		137,
		true
	},
	backyard_extendArea_tip = {
		62128,
		141,
		true
	},
	backyard_notPosition_shipExit = {
		62269,
		131,
		true
	},
	backyard_no_ship_tip = {
		62400,
		104,
		true
	},
	backyard_energy_qiuck_up_tip = {
		62504,
		225,
		true
	},
	backyard_cant_put_tip = {
		62729,
		101,
		true
	},
	backyard_cant_buy_tip = {
		62830,
		104,
		true
	},
	backyard_theme_lock_tip = {
		62934,
		138,
		true
	},
	backyard_theme_open_tip = {
		63072,
		144,
		true
	},
	backyard_theme_furniture_buy_tip = {
		63216,
		272,
		true
	},
	backyard_cannot_repeat_purchase = {
		63488,
		118,
		true
	},
	backyard_theme_bought = {
		63606,
		94,
		true
	},
	backyard_interAction_no_open = {
		63700,
		132,
		true
	},
	backyard_theme_no_exist = {
		63832,
		108,
		true
	},
	backayrd_theme_delete_sucess = {
		63940,
		106,
		true
	},
	backayrd_theme_delete_erro = {
		64046,
		113,
		true
	},
	backyard_ship_on_furnitrue = {
		64159,
		141,
		true
	},
	backyard_save_empty_theme = {
		64300,
		117,
		true
	},
	backyard_theme_name_forbid = {
		64417,
		130,
		true
	},
	backyard_getResource_emptry = {
		64547,
		111,
		true
	},
	backyard_no_pos_for_ship = {
		64658,
		161,
		true
	},
	equipment_destroyEquipments_error_noEquip = {
		64819,
		125,
		true
	},
	equipment_destroyEquipments_error_notEnoughEquip = {
		64944,
		128,
		true
	},
	equipment_equipDevUI_error_noPos = {
		65072,
		122,
		true
	},
	equipment_equipmentInfoLayer_error_canNotEquip = {
		65194,
		153,
		true
	},
	equipment_equipmentScene_selectError_more = {
		65347,
		163,
		true
	},
	equipment_newEquipLayer_getNewEquip = {
		65510,
		140,
		true
	},
	equipment_select_materials_tip = {
		65650,
		95,
		true
	},
	equipment_select_device_tip = {
		65745,
		119,
		true
	},
	equipment_cant_unload = {
		65864,
		159,
		true
	},
	equipment_max_level = {
		66023,
		97,
		true
	},
	equipment_upgrade_costcheck_error = {
		66120,
		164,
		true
	},
	equipment_upgrade_feedback_lack_of_fragment = {
		66284,
		148,
		true
	},
	exercise_count_insufficient = {
		66432,
		147,
		true
	},
	exercise_clear_fleet_tip = {
		66579,
		203,
		true
	},
	exercise_fleet_exit_tip = {
		66782,
		205,
		true
	},
	exercise_replace_rivals_ok_tip = {
		66987,
		112,
		true
	},
	exercise_replace_rivals_question = {
		67099,
		163,
		true
	},
	exercise_count_recover_tip = {
		67262,
		128,
		true
	},
	exercise_shop_refresh_tip = {
		67390,
		152,
		true
	},
	exercise_shop_buy_tip = {
		67542,
		141,
		true
	},
	exercise_formation_title = {
		67683,
		112,
		true
	},
	exercise_time_tip = {
		67795,
		99,
		true
	},
	exercise_rule_tip = {
		67894,
		1371,
		true
	},
	exercise_award_tip = {
		69265,
		190,
		true
	},
	dock_yard_left_tips = {
		69455,
		132,
		true
	},
	fleet_error_no_fleet = {
		69587,
		105,
		true
	},
	fleet_repairShips_error_fullEnergy = {
		69692,
		138,
		true
	},
	fleet_repairShips_error_noResource = {
		69830,
		126,
		true
	},
	fleet_repairShips_quest = {
		69956,
		157,
		true
	},
	fleet_fleetRaname_error = {
		70113,
		105,
		true
	},
	fleet_updateFleet_error = {
		70218,
		111,
		true
	},
	friend_acceptFriendRequest_error = {
		70329,
		130,
		true
	},
	friend_deleteFriend_error = {
		70459,
		114,
		true
	},
	friend_fetchFriendMsg_error = {
		70573,
		119,
		true
	},
	friend_rejectFriendRequest_error = {
		70692,
		130,
		true
	},
	friend_searchFriend_noPlayer = {
		70822,
		120,
		true
	},
	friend_sendFriendMsg_error = {
		70942,
		114,
		true
	},
	friend_sendFriendMsg_error_noFriend = {
		71056,
		137,
		true
	},
	friend_sendFriendRequest_error = {
		71193,
		118,
		true
	},
	friend_addblacklist_error = {
		71311,
		110,
		true
	},
	friend_relieveblacklist_error = {
		71421,
		126,
		true
	},
	friend_sendFriendRequest_success = {
		71547,
		116,
		true
	},
	friend_relieveblacklist_success = {
		71663,
		118,
		true
	},
	friend_addblacklist_success = {
		71781,
		110,
		true
	},
	friend_confirm_add_blacklist = {
		71891,
		199,
		true
	},
	friend_relieve_backlist_tip = {
		72090,
		171,
		true
	},
	friend_player_is_friend_tip = {
		72261,
		133,
		true
	},
	friend_searchFriend_wait_time = {
		72394,
		123,
		true
	},
	lesson_classOver_error = {
		72517,
		113,
		true
	},
	lesson_endToLearn_error = {
		72630,
		101,
		true
	},
	lesson_startToLearn_error = {
		72731,
		112,
		true
	},
	tactics_lesson_cancel = {
		72843,
		227,
		true
	},
	tactics_lesson_system_introduce = {
		73070,
		287,
		true
	},
	tactics_lesson_start_tip = {
		73357,
		243,
		true
	},
	tactics_noskill_erro = {
		73600,
		101,
		true
	},
	tactics_max_level = {
		73701,
		120,
		true
	},
	tactics_end_to_learn = {
		73821,
		206,
		true
	},
	tactics_continue_to_learn = {
		74027,
		127,
		true
	},
	tactics_should_exist_skill = {
		74154,
		107,
		true
	},
	tactics_skill_level_up = {
		74261,
		128,
		true
	},
	tactics_no_lesson = {
		74389,
		100,
		true
	},
	tactics_lesson_full = {
		74489,
		100,
		true
	},
	tactics_lesson_repeated = {
		74589,
		110,
		true
	},
	login_gate_not_ready = {
		74699,
		100,
		true
	},
	login_game_not_ready = {
		74799,
		105,
		true
	},
	login_game_rigister_full = {
		74904,
		128,
		true
	},
	login_game_login_full = {
		75032,
		158,
		true
	},
	login_game_banned = {
		75190,
		130,
		true
	},
	login_game_frequence = {
		75320,
		138,
		true
	},
	login_createNewPlayer_full = {
		75458,
		138,
		true
	},
	login_createNewPlayer_error = {
		75596,
		112,
		true
	},
	login_createNewPlayer_error_nameNull = {
		75708,
		128,
		true
	},
	login_newPlayerScene_word_lingBo = {
		75836,
		179,
		true
	},
	login_newPlayerScene_word_yingHuoChong = {
		76015,
		210,
		true
	},
	login_newPlayerScene_word_laFei = {
		76225,
		200,
		true
	},
	login_newPlayerScene_word_biaoqiang = {
		76425,
		187,
		true
	},
	login_newPlayerScene_word_z23 = {
		76612,
		194,
		true
	},
	login_newPlayerScene_randomName = {
		76806,
		106,
		true
	},
	login_newPlayerScene_error_notChoiseShip = {
		76912,
		125,
		true
	},
	login_newPlayerScene_inputName = {
		77037,
		104,
		true
	},
	login_loginMediator_kickOtherLogin = {
		77141,
		143,
		true
	},
	login_loginMediator_kickServerClose = {
		77284,
		117,
		true
	},
	login_loginMediator_kickIntError = {
		77401,
		109,
		true
	},
	login_loginMediator_kickTimeError = {
		77510,
		118,
		true
	},
	login_loginMediator_vertifyFail = {
		77628,
		118,
		true
	},
	login_loginMediator_dataExpired = {
		77746,
		113,
		true
	},
	login_loginMediator_kickLoginOut = {
		77859,
		112,
		true
	},
	login_loginMediator_serverLoginErro = {
		77971,
		125,
		true
	},
	login_loginMediator_kickUndefined = {
		78096,
		120,
		true
	},
	login_loginMediator_loginSuccess = {
		78216,
		113,
		true
	},
	login_loginMediator_quest_RegisterSuccess = {
		78329,
		151,
		true
	},
	login_loginMediator_registerFail_error = {
		78480,
		123,
		true
	},
	login_loginMediator_userLoginFail_error = {
		78603,
		124,
		true
	},
	login_loginMediator_serverLoginFail_error = {
		78727,
		123,
		true
	},
	login_loginScene_error_noUserName = {
		78850,
		123,
		true
	},
	login_loginScene_error_noPassword = {
		78973,
		123,
		true
	},
	login_loginScene_error_diffPassword = {
		79096,
		122,
		true
	},
	login_loginScene_error_noMailBox = {
		79218,
		119,
		true
	},
	login_loginScene_choiseServer = {
		79337,
		116,
		true
	},
	login_loginScene_server_vindicate = {
		79453,
		125,
		true
	},
	login_loginScene_server_full = {
		79578,
		107,
		true
	},
	login_loginScene_server_disabled = {
		79685,
		108,
		true
	},
	login_register_full = {
		79793,
		111,
		true
	},
	system_database_busy = {
		79904,
		125,
		true
	},
	mail_getMailList_error_noNewMail = {
		80029,
		108,
		true
	},
	mail_takeAttachment_error_noMail = {
		80137,
		119,
		true
	},
	mail_takeAttachment_error_noAttach = {
		80256,
		124,
		true
	},
	mail_takeAttachment_error_noWorld = {
		80380,
		161,
		true
	},
	mail_takeAttachment_error_reWorld = {
		80541,
		205,
		true
	},
	mail_count = {
		80746,
		118,
		true
	},
	mail_takeAttachment_error_magazine_full = {
		80864,
		215,
		true
	},
	mail_takeAttachment_error_dockYrad_full = {
		81079,
		208,
		true
	},
	mail_confirm_set_important_flag = {
		81287,
		112,
		true
	},
	mail_confirm_cancel_important_flag = {
		81399,
		117,
		true
	},
	main_mailLayer_mailBoxClear = {
		81516,
		115,
		true
	},
	main_mailLayer_noNewMail = {
		81631,
		100,
		true
	},
	main_mailLayer_takeAttach = {
		81731,
		104,
		true
	},
	main_mailLayer_noAttach = {
		81835,
		97,
		true
	},
	main_mailLayer_attachTaken = {
		81932,
		107,
		true
	},
	main_mailLayer_quest_clear = {
		82039,
		201,
		true
	},
	main_mailLayer_quest_deleteNotTakeAttach = {
		82240,
		204,
		true
	},
	main_mailLayer_quest_deleteNotRead = {
		82444,
		203,
		true
	},
	main_mailMediator_mailDelete = {
		82647,
		104,
		true
	},
	main_mailMediator_attachTaken = {
		82751,
		110,
		true
	},
	main_mailMediator_notingToTake = {
		82861,
		115,
		true
	},
	main_mailMediator_takeALot = {
		82976,
		101,
		true
	},
	main_navalAcademyScene_systemClose = {
		83077,
		148,
		true
	},
	main_navalAcademyScene_quest_startClass = {
		83225,
		170,
		true
	},
	main_navalAcademyScene_quest_stopClass = {
		83395,
		248,
		true
	},
	main_navalAcademyScene_quest_Classover_long = {
		83643,
		226,
		true
	},
	main_navalAcademyScene_quest_Classover_short = {
		83869,
		196,
		true
	},
	main_navalAcademyScene_upgrade_complete = {
		84065,
		182,
		true
	},
	main_navalAcademyScene_class_upgrade_complete = {
		84247,
		131,
		true
	},
	main_navalAcademyScene_work_done = {
		84378,
		118,
		true
	},
	main_notificationLayer_searchInput = {
		84496,
		130,
		true
	},
	main_notificationLayer_noInput = {
		84626,
		117,
		true
	},
	main_notificationLayer_noFriend = {
		84743,
		122,
		true
	},
	main_notificationLayer_deleteFriend = {
		84865,
		112,
		true
	},
	main_notificationLayer_sendButton = {
		84977,
		122,
		true
	},
	main_notificationLayer_addFriendError_addSelf = {
		85099,
		136,
		true
	},
	main_notificationLayer_addFriendError_friendAlready = {
		85235,
		156,
		true
	},
	main_notificationLayer_quest_deletFriend = {
		85391,
		163,
		true
	},
	main_notificationLayer_quest_request = {
		85554,
		166,
		true
	},
	main_notificationLayer_enter_room = {
		85720,
		137,
		true
	},
	main_notificationLayer_not_roomId = {
		85857,
		121,
		true
	},
	main_notificationLayer_roomId_invaild = {
		85978,
		124,
		true
	},
	main_notificationMediator_sendFriendRequest = {
		86102,
		127,
		true
	},
	main_notificationMediator_beFriend = {
		86229,
		150,
		true
	},
	main_notificationMediator_deleteFriend = {
		86379,
		160,
		true
	},
	main_notificationMediator_room_max_number = {
		86539,
		122,
		true
	},
	main_playerInfoLayer_inputName = {
		86661,
		104,
		true
	},
	main_playerInfoLayer_inputManifesto = {
		86765,
		123,
		true
	},
	main_playerInfoLayer_quest_changeName = {
		86888,
		159,
		true
	},
	main_playerInfoLayer_error_changeNameNoGem = {
		87047,
		134,
		true
	},
	main_settingsScene_quest_exist = {
		87181,
		126,
		true
	},
	coloring_color_missmatch = {
		87307,
		128,
		true
	},
	coloring_color_not_enough = {
		87435,
		117,
		true
	},
	coloring_erase_all_warning = {
		87552,
		200,
		true
	},
	coloring_erase_warning = {
		87752,
		231,
		true
	},
	coloring_lock = {
		87983,
		83,
		true
	},
	coloring_wait_open = {
		88066,
		91,
		true
	},
	coloring_help_tip = {
		88157,
		1297,
		true
	},
	link_link_help_tip = {
		89454,
		1207,
		true
	},
	player_changeManifesto_ok = {
		90661,
		103,
		true
	},
	player_changeManifesto_error = {
		90764,
		116,
		true
	},
	player_changePlayerIcon_ok = {
		90880,
		108,
		true
	},
	player_changePlayerIcon_error = {
		90988,
		121,
		true
	},
	player_changePlayerName_ok = {
		91109,
		103,
		true
	},
	player_changePlayerName_error = {
		91212,
		116,
		true
	},
	player_changePlayerName_error_2015 = {
		91328,
		136,
		true
	},
	player_harvestResource_error = {
		91464,
		121,
		true
	},
	player_harvestResource_error_fullBag = {
		91585,
		145,
		true
	},
	player_change_chat_room_erro = {
		91730,
		123,
		true
	},
	prop_destroyProp_error_noItem = {
		91853,
		118,
		true
	},
	prop_destroyProp_error_canNotSell = {
		91971,
		123,
		true
	},
	prop_destroyProp_error_notEnoughItem = {
		92094,
		151,
		true
	},
	prop_destroyProp_error = {
		92245,
		108,
		true
	},
	resourceSite_error_noSite = {
		92353,
		118,
		true
	},
	resourceSite_beginScanMap_ok = {
		92471,
		108,
		true
	},
	resourceSite_beginScanMap_error = {
		92579,
		114,
		true
	},
	resourceSite_collectResource_error = {
		92693,
		134,
		true
	},
	resourceSite_finishResourceSite_error = {
		92827,
		133,
		true
	},
	resourceSite_startResourceSite_error = {
		92960,
		134,
		true
	},
	ship_error_noShip = {
		93094,
		133,
		true
	},
	ship_addStarExp_error = {
		93227,
		109,
		true
	},
	ship_buildShip_error = {
		93336,
		106,
		true
	},
	ship_buildShip_error_noTemplate = {
		93442,
		150,
		true
	},
	ship_buildShip_error_notEnoughItem = {
		93592,
		131,
		true
	},
	ship_buildShipImmediately_error = {
		93723,
		115,
		true
	},
	ship_buildShipImmediately_error_noSHip = {
		93838,
		119,
		true
	},
	ship_buildShipImmediately_error_finished = {
		93957,
		126,
		true
	},
	ship_buildShipImmediately_error_noItem = {
		94083,
		138,
		true
	},
	ship_buildShip_not_position = {
		94221,
		143,
		true
	},
	ship_buildBatchShip = {
		94364,
		181,
		true
	},
	ship_buildSingleShip = {
		94545,
		181,
		true
	},
	ship_buildShip_succeed = {
		94726,
		100,
		true
	},
	ship_buildShip_list_empty = {
		94826,
		117,
		true
	},
	ship_buildship_tip = {
		94943,
		191,
		true
	},
	ship_destoryShips_error = {
		95134,
		110,
		true
	},
	ship_equipToShip_ok = {
		95244,
		118,
		true
	},
	ship_equipToShip_error = {
		95362,
		103,
		true
	},
	ship_equipToShip_error_noEquip = {
		95465,
		114,
		true
	},
	ship_equip_check = {
		95579,
		138,
		true
	},
	ship_getShip_error = {
		95717,
		105,
		true
	},
	ship_getShip_error_noShip = {
		95822,
		106,
		true
	},
	ship_getShip_error_notFinish = {
		95928,
		122,
		true
	},
	ship_getShip_error_full = {
		96050,
		153,
		true
	},
	ship_modShip_error = {
		96203,
		106,
		true
	},
	ship_modShip_error_notEnoughGold = {
		96309,
		136,
		true
	},
	ship_remouldShip_error = {
		96445,
		106,
		true
	},
	ship_unequipFromShip_ok = {
		96551,
		126,
		true
	},
	ship_unequipFromShip_error = {
		96677,
		114,
		true
	},
	ship_unequipFromShip_error_noEquip = {
		96791,
		119,
		true
	},
	ship_unequip_all_tip = {
		96910,
		126,
		true
	},
	ship_unequip_all_success = {
		97036,
		127,
		true
	},
	ship_updateShipLock_ok_lock = {
		97163,
		124,
		true
	},
	ship_updateShipLock_ok_unlock = {
		97287,
		128,
		true
	},
	ship_updateShipLock_error = {
		97415,
		119,
		true
	},
	ship_upgradeStar_error = {
		97534,
		106,
		true
	},
	ship_upgradeStar_error_4010 = {
		97640,
		152,
		true
	},
	ship_upgradeStar_error_lvLimit = {
		97792,
		155,
		true
	},
	ship_upgradeStar_error_noEnoughMatrail = {
		97947,
		125,
		true
	},
	ship_upgradeStar_notConfig = {
		98072,
		151,
		true
	},
	ship_upgradeStar_maxLevel = {
		98223,
		121,
		true
	},
	ship_upgradeStar_select_material_tip = {
		98344,
		124,
		true
	},
	ship_exchange_question = {
		98468,
		159,
		true
	},
	ship_exchange_medalCount_noEnough = {
		98627,
		126,
		true
	},
	ship_exchange_erro = {
		98753,
		124,
		true
	},
	ship_exchange_confirm = {
		98877,
		111,
		true
	},
	ship_exchange_tip = {
		98988,
		289,
		true
	},
	ship_vo_fighting = {
		99277,
		120,
		true
	},
	ship_vo_event = {
		99397,
		123,
		true
	},
	ship_vo_isCharacter = {
		99520,
		153,
		true
	},
	ship_vo_inBackyardRest = {
		99673,
		126,
		true
	},
	ship_vo_inClass = {
		99799,
		110,
		true
	},
	ship_vo_moveout_backyard = {
		99909,
		103,
		true
	},
	ship_vo_moveout_formation = {
		100012,
		111,
		true
	},
	ship_vo_mainFleet_must_hasShip = {
		100123,
		146,
		true
	},
	ship_vo_vanguardFleet_must_hasShip = {
		100269,
		148,
		true
	},
	ship_vo_getWordsUndefined = {
		100417,
		142,
		true
	},
	ship_vo_locked = {
		100559,
		98,
		true
	},
	ship_vo_mainFleet_exist_same_ship = {
		100657,
		146,
		true
	},
	ship_vo_vanguardFleet_exist_same_ship = {
		100803,
		148,
		true
	},
	ship_buildShipMediator_startBuild = {
		100951,
		108,
		true
	},
	ship_buildShipMediator_finishBuild = {
		101059,
		120,
		true
	},
	ship_buildShipScene_quest_quickFinish = {
		101179,
		235,
		true
	},
	ship_dockyardMediator_destroy = {
		101414,
		106,
		true
	},
	ship_dockyardScene_capacity = {
		101520,
		105,
		true
	},
	ship_dockyardScene_noRole = {
		101625,
		123,
		true
	},
	ship_dockyardScene_error_choiseRoleMore = {
		101748,
		163,
		true
	},
	ship_dockyardScene_error_choiseRoleLess = {
		101911,
		157,
		true
	},
	ship_formationMediator_leastLimit = {
		102068,
		122,
		true
	},
	ship_formationMediator_changeNameSuccess = {
		102190,
		123,
		true
	},
	ship_formationMediator_changeNameError_sameShip = {
		102313,
		173,
		true
	},
	ship_formationMediator_addShipError_overlimit = {
		102486,
		182,
		true
	},
	ship_formationMediator_replaceError_onlyShip = {
		102668,
		212,
		true
	},
	ship_formationMediator_quest_replace = {
		102880,
		188,
		true
	},
	ship_formationMediaror_trash_warning = {
		103068,
		264,
		true
	},
	ship_formationUI_fleetName1 = {
		103332,
		98,
		true
	},
	ship_formationUI_fleetName2 = {
		103430,
		98,
		true
	},
	ship_formationUI_fleetName3 = {
		103528,
		98,
		true
	},
	ship_formationUI_fleetName4 = {
		103626,
		98,
		true
	},
	ship_formationUI_fleetName5 = {
		103724,
		98,
		true
	},
	ship_formationUI_fleetName6 = {
		103822,
		98,
		true
	},
	ship_formationUI_fleetName11 = {
		103920,
		103,
		true
	},
	ship_formationUI_fleetName12 = {
		104023,
		103,
		true
	},
	ship_formationUI_exercise_fleetName = {
		104126,
		113,
		true
	},
	ship_formationUI_fleetName_world = {
		104239,
		117,
		true
	},
	ship_formationUI_changeFormationError_flag = {
		104356,
		160,
		true
	},
	ship_formationUI_changeFormationError_countError = {
		104516,
		139,
		true
	},
	ship_formationUI_removeError_onlyShip = {
		104655,
		190,
		true
	},
	ship_formationUI_quest_remove = {
		104845,
		152,
		true
	},
	ship_newShipLayer_get = {
		104997,
		147,
		true
	},
	ship_newSkinLayer_get = {
		105144,
		152,
		true
	},
	ship_newSkin_name = {
		105296,
		83,
		true
	},
	ship_shipInfoMediator_destory = {
		105379,
		106,
		true
	},
	ship_shipInfoScene_equipUnlockSlostContent = {
		105485,
		166,
		true
	},
	ship_shipInfoScene_equipUnlockSlostYesText = {
		105651,
		118,
		true
	},
	ship_shipInfoScene_effect = {
		105769,
		132,
		true
	},
	ship_shipInfoScene_effect1or2 = {
		105901,
		134,
		true
	},
	ship_shipInfoScene_modLvMax = {
		106035,
		135,
		true
	},
	ship_shipInfoScene_choiseMod = {
		106170,
		132,
		true
	},
	ship_shipModLayer_effect = {
		106302,
		131,
		true
	},
	ship_shipModLayer_effect1or2 = {
		106433,
		133,
		true
	},
	ship_shipModLayer_modSuccess = {
		106566,
		101,
		true
	},
	ship_mod_no_addition_tip = {
		106667,
		145,
		true
	},
	ship_shipModMediator_choiseMaterial = {
		106812,
		150,
		true
	},
	ship_shipModMediator_noticeLvOver1 = {
		106962,
		111,
		true
	},
	ship_shipModMediator_noticeStarOver4 = {
		107073,
		112,
		true
	},
	ship_shipModMediator_noticeSameButLargerStar = {
		107185,
		131,
		true
	},
	ship_shipModMediator_quest = {
		107316,
		168,
		true
	},
	ship_shipUpgradeLayer2_levelError = {
		107484,
		114,
		true
	},
	ship_shipUpgradeLayer2_noMaterail = {
		107598,
		120,
		true
	},
	ship_shipUpgradeLayer2_ok = {
		107718,
		110,
		true
	},
	ship_shipUpgradeLayer2_effect = {
		107828,
		136,
		true
	},
	ship_shipUpgradeLayer2_effect1or2 = {
		107964,
		138,
		true
	},
	ship_shipUpgradeLayer2_mod_uncommon_tip = {
		108102,
		221,
		true
	},
	ship_shipUpgradeLayer2_uncommon_tip = {
		108323,
		217,
		true
	},
	ship_shipUpgradeLayer2_mod_advanced_tip = {
		108540,
		220,
		true
	},
	ship_shipUpgradeLayer2_advanced_tip = {
		108760,
		222,
		true
	},
	ship_mod_exp_to_attr_tip = {
		108982,
		145,
		true
	},
	ship_max_star = {
		109127,
		144,
		true
	},
	ship_skill_unlock_tip = {
		109271,
		106,
		true
	},
	ship_lock_tip = {
		109377,
		131,
		true
	},
	ship_destroy_uncommon_tip = {
		109508,
		186,
		true
	},
	ship_destroy_advanced_tip = {
		109694,
		162,
		true
	},
	ship_energy_mid_desc = {
		109856,
		132,
		true
	},
	ship_energy_low_desc = {
		109988,
		133,
		true
	},
	ship_energy_low_warn = {
		110121,
		169,
		true
	},
	ship_energy_low_warn_no_exp = {
		110290,
		274,
		true
	},
	test_ship_intensify_tip = {
		110564,
		115,
		true
	},
	test_ship_upgrade_tip = {
		110679,
		126,
		true
	},
	shop_buyItem_ok = {
		110805,
		138,
		true
	},
	shop_buyItem_error = {
		110943,
		102,
		true
	},
	shop_extendMagazine_error = {
		111045,
		115,
		true
	},
	shop_entendShipYard_error = {
		111160,
		112,
		true
	},
	spweapon_attr_effect = {
		111272,
		96,
		true
	},
	spweapon_attr_skillupgrade = {
		111368,
		103,
		true
	},
	spweapon_help_storage = {
		111471,
		3345,
		true
	},
	spweapon_tip_upgrade = {
		114816,
		120,
		true
	},
	spweapon_tip_attr_modify = {
		114936,
		148,
		true
	},
	spweapon_tip_materal_no_enough = {
		115084,
		126,
		true
	},
	spweapon_tip_gold_no_enough = {
		115210,
		119,
		true
	},
	spweapon_tip_pt_no_enough = {
		115329,
		143,
		true
	},
	spweapon_tip_creatept_no_enough = {
		115472,
		180,
		true
	},
	spweapon_tip_bag_no_enough = {
		115652,
		148,
		true
	},
	spweapon_tip_create_sussess = {
		115800,
		151,
		true
	},
	spweapon_tip_group_error = {
		115951,
		125,
		true
	},
	spweapon_tip_breakout_overflow = {
		116076,
		172,
		true
	},
	spweapon_tip_breakout_materal_check = {
		116248,
		144,
		true
	},
	spweapon_tip_transform_materal_check = {
		116392,
		146,
		true
	},
	spweapon_tip_transform_attrmax = {
		116538,
		148,
		true
	},
	spweapon_tip_locked = {
		116686,
		180,
		true
	},
	spweapon_tip_unload = {
		116866,
		135,
		true
	},
	spweapon_tip_sail_locked = {
		117001,
		157,
		true
	},
	spweapon_ui_level = {
		117158,
		94,
		true
	},
	spweapon_ui_levelmax = {
		117252,
		93,
		true
	},
	spweapon_ui_levelmax2 = {
		117345,
		126,
		true
	},
	spweapon_ui_need_resource = {
		117471,
		108,
		true
	},
	spweapon_ui_ptitem = {
		117579,
		96,
		true
	},
	spweapon_ui_spweapon = {
		117675,
		98,
		true
	},
	spweapon_ui_transform = {
		117773,
		105,
		true
	},
	spweapon_ui_transform_attr_text = {
		117878,
		197,
		true
	},
	spweapon_ui_keep_attr = {
		118075,
		93,
		true
	},
	spweapon_ui_change_attr = {
		118168,
		94,
		true
	},
	spweapon_ui_autoselect = {
		118262,
		97,
		true
	},
	spweapon_ui_cancelselect = {
		118359,
		94,
		true
	},
	spweapon_ui_index_shipType_quZhu = {
		118453,
		98,
		true
	},
	spweapon_ui_index_shipType_qinXun = {
		118551,
		99,
		true
	},
	spweapon_ui_index_shipType_zhongXun = {
		118650,
		101,
		true
	},
	spweapon_ui_index_shipType_zhanLie = {
		118751,
		100,
		true
	},
	spweapon_ui_index_shipType_hangMu = {
		118851,
		99,
		true
	},
	spweapon_ui_index_shipType_weiXiu = {
		118950,
		99,
		true
	},
	spweapon_ui_index_shipType_qianTing = {
		119049,
		101,
		true
	},
	spweapon_ui_index_shipType_other = {
		119150,
		100,
		true
	},
	spweapon_ui_keep_attr_text1 = {
		119250,
		206,
		true
	},
	spweapon_ui_keep_attr_text2 = {
		119456,
		150,
		true
	},
	spweapon_ui_change_attr_text1 = {
		119606,
		176,
		true
	},
	spweapon_ui_change_attr_text2 = {
		119782,
		214,
		true
	},
	spweapon_ui_create_exp = {
		119996,
		115,
		true
	},
	spweapon_ui_upgrade_exp = {
		120111,
		118,
		true
	},
	spweapon_ui_breakout_exp = {
		120229,
		117,
		true
	},
	spweapon_ui_create = {
		120346,
		87,
		true
	},
	spweapon_ui_storage = {
		120433,
		88,
		true
	},
	spweapon_ui_empty = {
		120521,
		106,
		true
	},
	spweapon_ui_create_button = {
		120627,
		94,
		true
	},
	spweapon_ui_helptext = {
		120721,
		295,
		true
	},
	spweapon_ui_effect_tag = {
		121016,
		98,
		true
	},
	spweapon_ui_skill_tag = {
		121114,
		98,
		true
	},
	spweapon_activity_ui_text1 = {
		121212,
		174,
		true
	},
	spweapon_activity_ui_text2 = {
		121386,
		165,
		true
	},
	spweapon_tip_skill_locked = {
		121551,
		98,
		true
	},
	spweapon_tip_owned = {
		121649,
		91,
		true
	},
	spweapon_tip_view = {
		121740,
		145,
		true
	},
	spweapon_tip_ship = {
		121885,
		93,
		true
	},
	spweapon_tip_type = {
		121978,
		90,
		true
	},
	stage_beginStage_error = {
		122068,
		109,
		true
	},
	stage_beginStage_error_fleetEmpty = {
		122177,
		120,
		true
	},
	stage_beginStage_error_teamEmpty = {
		122297,
		173,
		true
	},
	stage_beginStage_error_noEnergy = {
		122470,
		143,
		true
	},
	stage_beginStage_error_noResource = {
		122613,
		147,
		true
	},
	stage_beginStage_error_noTicket = {
		122760,
		148,
		true
	},
	stage_finishStage_error = {
		122908,
		115,
		true
	},
	levelScene_map_lock = {
		123023,
		157,
		true
	},
	levelScene_chapter_lock = {
		123180,
		146,
		true
	},
	levelScene_chapter_strategying = {
		123326,
		141,
		true
	},
	levelScene_threat_to_rule_out = {
		123467,
		112,
		true
	},
	levelScene_whether_to_retreat = {
		123579,
		168,
		true
	},
	levelScene_who_to_retreat = {
		123747,
		165,
		true
	},
	levelScene_who_to_exchange = {
		123912,
		138,
		true
	},
	levelScene_time_out = {
		124050,
		104,
		true
	},
	levelScene_nothing = {
		124154,
		103,
		true
	},
	levelScene_notCargo = {
		124257,
		107,
		true
	},
	levelScene_openCargo_erro = {
		124364,
		119,
		true
	},
	levelScene_chapter_notInStrategy = {
		124483,
		114,
		true
	},
	levelScene_retreat_erro = {
		124597,
		105,
		true
	},
	levelScene_strategying = {
		124702,
		100,
		true
	},
	levelScene_tracking_erro = {
		124802,
		94,
		true
	},
	levelScene_tracking_error_3001 = {
		124896,
		150,
		true
	},
	levelScene_chapter_unlock_tip = {
		125046,
		163,
		true
	},
	levelScene_chapter_win = {
		125209,
		116,
		true
	},
	levelScene_sham_win = {
		125325,
		110,
		true
	},
	levelScene_escort_win = {
		125435,
		154,
		true
	},
	levelScene_escort_lose = {
		125589,
		155,
		true
	},
	levelScene_escort_help_tip = {
		125744,
		1412,
		true
	},
	levelScene_escort_retreat = {
		127156,
		225,
		true
	},
	levelScene_oni_retreat = {
		127381,
		204,
		true
	},
	levelScene_oni_win = {
		127585,
		115,
		true
	},
	levelScene_oni_lose = {
		127700,
		123,
		true
	},
	levelScene_bomb_retreat = {
		127823,
		97,
		true
	},
	levelScene_sphunt_help_tip = {
		127920,
		493,
		true
	},
	levelScene_bomb_help_tip = {
		128413,
		341,
		true
	},
	levelScene_chapter_timeout = {
		128754,
		142,
		true
	},
	levelScene_chapter_level_limit = {
		128896,
		162,
		true
	},
	levelScene_chapter_count_tip = {
		129058,
		111,
		true
	},
	levelScene_tracking_error_retry = {
		129169,
		139,
		true
	},
	levelScene_destroy_torpedo = {
		129308,
		123,
		true
	},
	levelScene_new_chapter_coming = {
		129431,
		109,
		true
	},
	levelScene_chapter_open_count_down = {
		129540,
		108,
		true
	},
	levelScene_chapter_not_open = {
		129648,
		103,
		true
	},
	levelScene_activate_remaster = {
		129751,
		194,
		true
	},
	levelScene_remaster_tickets_not_enough = {
		129945,
		136,
		true
	},
	levelScene_remaster_do_not_open = {
		130081,
		121,
		true
	},
	levelScene_remaster_help_tip = {
		130202,
		1192,
		true
	},
	levelScene_activate_loop_mode_failed = {
		131394,
		168,
		true
	},
	levelScene_coastalgun_help_tip = {
		131562,
		359,
		true
	},
	levelScene_select_SP_OP = {
		131921,
		98,
		true
	},
	levelScene_unselect_SP_OP = {
		132019,
		96,
		true
	},
	levelScene_select_SP_OP_reminder = {
		132115,
		415,
		true
	},
	tack_tickets_max_warning = {
		132530,
		281,
		true
	},
	world_battle_count = {
		132811,
		112,
		true
	},
	world_fleetName1 = {
		132923,
		89,
		true
	},
	world_fleetName2 = {
		133012,
		89,
		true
	},
	world_fleetName3 = {
		133101,
		89,
		true
	},
	world_fleetName4 = {
		133190,
		89,
		true
	},
	world_fleetName5 = {
		133279,
		89,
		true
	},
	world_ship_repair_1 = {
		133368,
		162,
		true
	},
	world_ship_repair_2 = {
		133530,
		165,
		true
	},
	world_ship_repair_all = {
		133695,
		168,
		true
	},
	world_ship_repair_no_need = {
		133863,
		111,
		true
	},
	world_event_teleport_alter = {
		133974,
		175,
		true
	},
	world_transport_battle_alter = {
		134149,
		152,
		true
	},
	world_transport_locked = {
		134301,
		200,
		true
	},
	world_target_count = {
		134501,
		105,
		true
	},
	world_target_filter_tip1 = {
		134606,
		91,
		true
	},
	world_target_filter_tip2 = {
		134697,
		98,
		true
	},
	world_target_get_all = {
		134795,
		112,
		true
	},
	world_target_goto = {
		134907,
		92,
		true
	},
	world_help_tip = {
		134999,
		90,
		true
	},
	world_dangerbattle_confirm = {
		135089,
		190,
		true
	},
	world_stamina_exchange = {
		135279,
		177,
		true
	},
	world_stamina_not_enough = {
		135456,
		104,
		true
	},
	world_stamina_recover = {
		135560,
		206,
		true
	},
	world_stamina_text = {
		135766,
		216,
		true
	},
	world_stamina_text2 = {
		135982,
		160,
		true
	},
	world_stamina_resetwarning = {
		136142,
		287,
		true
	},
	world_ship_healthy = {
		136429,
		169,
		true
	},
	world_map_dangerous = {
		136598,
		119,
		true
	},
	world_map_not_open = {
		136717,
		102,
		true
	},
	world_map_locked_stage = {
		136819,
		106,
		true
	},
	world_map_locked_border = {
		136925,
		106,
		true
	},
	world_item_allocate_panel_fleet_info_text = {
		137031,
		163,
		true
	},
	world_redeploy_not_change = {
		137194,
		159,
		true
	},
	world_redeploy_warn = {
		137353,
		187,
		true
	},
	world_redeploy_cost_tip = {
		137540,
		270,
		true
	},
	world_redeploy_tip = {
		137810,
		104,
		true
	},
	world_fleet_choose = {
		137914,
		173,
		true
	},
	world_fleet_formation_not_valid = {
		138087,
		133,
		true
	},
	world_fleet_in_vortex = {
		138220,
		156,
		true
	},
	world_stage_help = {
		138376,
		218,
		true
	},
	world_transport_disable = {
		138594,
		131,
		true
	},
	world_ap = {
		138725,
		74,
		true
	},
	world_resource_tip_1 = {
		138799,
		96,
		true
	},
	world_resource_tip_2 = {
		138895,
		96,
		true
	},
	world_instruction_all_1 = {
		138991,
		127,
		true
	},
	world_instruction_help_1 = {
		139118,
		1467,
		true
	},
	world_instruction_redeploy_1 = {
		140585,
		147,
		true
	},
	world_instruction_redeploy_2 = {
		140732,
		159,
		true
	},
	world_instruction_redeploy_3 = {
		140891,
		166,
		true
	},
	world_instruction_morale_1 = {
		141057,
		187,
		true
	},
	world_instruction_morale_2 = {
		141244,
		120,
		true
	},
	world_instruction_morale_3 = {
		141364,
		113,
		true
	},
	world_instruction_morale_4 = {
		141477,
		160,
		true
	},
	world_instruction_submarine_1 = {
		141637,
		137,
		true
	},
	world_instruction_submarine_2 = {
		141774,
		136,
		true
	},
	world_instruction_submarine_3 = {
		141910,
		135,
		true
	},
	world_instruction_submarine_4 = {
		142045,
		163,
		true
	},
	world_instruction_submarine_5 = {
		142208,
		132,
		true
	},
	world_instruction_submarine_6 = {
		142340,
		209,
		true
	},
	world_instruction_submarine_7 = {
		142549,
		155,
		true
	},
	world_instruction_submarine_8 = {
		142704,
		182,
		true
	},
	world_instruction_submarine_9 = {
		142886,
		190,
		true
	},
	world_instruction_submarine_10 = {
		143076,
		106,
		true
	},
	world_instruction_submarine_11 = {
		143182,
		118,
		true
	},
	world_instruction_detect_1 = {
		143300,
		128,
		true
	},
	world_instruction_detect_2 = {
		143428,
		122,
		true
	},
	world_instruction_supply_1 = {
		143550,
		102,
		true
	},
	world_instruction_supply_2 = {
		143652,
		133,
		true
	},
	world_instruction_port_goods_locked = {
		143785,
		120,
		true
	},
	world_port_inbattle = {
		143905,
		141,
		true
	},
	world_item_recycle_1 = {
		144046,
		151,
		true
	},
	world_item_recycle_2 = {
		144197,
		146,
		true
	},
	world_item_origin = {
		144343,
		132,
		true
	},
	world_shop_bag_unactivated = {
		144475,
		170,
		true
	},
	world_shop_preview_tip = {
		144645,
		119,
		true
	},
	world_shop_init_notice = {
		144764,
		147,
		true
	},
	world_map_title_tips_en = {
		144911,
		101,
		true
	},
	world_map_title_tips = {
		145012,
		99,
		true
	},
	world_mapbuff_attrtxt_1 = {
		145111,
		101,
		true
	},
	world_mapbuff_attrtxt_2 = {
		145212,
		102,
		true
	},
	world_mapbuff_attrtxt_3 = {
		145314,
		107,
		true
	},
	world_mapbuff_compare_txt = {
		145421,
		104,
		true
	},
	world_wind_move = {
		145525,
		171,
		true
	},
	world_battle_pause = {
		145696,
		91,
		true
	},
	world_battle_pause2 = {
		145787,
		99,
		true
	},
	world_task_samemap = {
		145886,
		171,
		true
	},
	world_task_maplock = {
		146057,
		215,
		true
	},
	world_task_goto0 = {
		146272,
		115,
		true
	},
	world_task_goto3 = {
		146387,
		136,
		true
	},
	world_task_view1 = {
		146523,
		99,
		true
	},
	world_task_view2 = {
		146622,
		99,
		true
	},
	world_task_view3 = {
		146721,
		88,
		true
	},
	world_task_refuse1 = {
		146809,
		125,
		true
	},
	world_daily_task_lock = {
		146934,
		148,
		true
	},
	world_daily_task_none = {
		147082,
		117,
		true
	},
	world_daily_task_none_2 = {
		147199,
		87,
		true
	},
	world_sairen_title = {
		147286,
		99,
		true
	},
	world_sairen_description1 = {
		147385,
		131,
		true
	},
	world_sairen_description2 = {
		147516,
		131,
		true
	},
	world_sairen_description3 = {
		147647,
		131,
		true
	},
	world_low_morale = {
		147778,
		241,
		true
	},
	world_recycle_notice = {
		148019,
		142,
		true
	},
	world_recycle_item_transform = {
		148161,
		188,
		true
	},
	world_exit_tip = {
		148349,
		105,
		true
	},
	world_consume_carry_tips = {
		148454,
		100,
		true
	},
	world_boss_help_meta = {
		148554,
		3217,
		true
	},
	world_close = {
		151771,
		120,
		true
	},
	world_catsearch_success = {
		151891,
		139,
		true
	},
	world_catsearch_stop = {
		152030,
		236,
		true
	},
	world_catsearch_fleetcheck = {
		152266,
		240,
		true
	},
	world_catsearch_leavemap = {
		152506,
		242,
		true
	},
	world_catsearch_help_1 = {
		152748,
		315,
		true
	},
	world_catsearch_help_2 = {
		153063,
		105,
		true
	},
	world_catsearch_help_3 = {
		153168,
		278,
		true
	},
	world_catsearch_help_4 = {
		153446,
		100,
		true
	},
	world_catsearch_help_5 = {
		153546,
		144,
		true
	},
	world_catsearch_help_6 = {
		153690,
		125,
		true
	},
	world_level_prefix = {
		153815,
		87,
		true
	},
	world_map_level = {
		153902,
		232,
		true
	},
	world_movelimit_event_text = {
		154134,
		158,
		true
	},
	world_mapbuff_tip = {
		154292,
		127,
		true
	},
	world_sametask_tip = {
		154419,
		152,
		true
	},
	world_expedition_reward_display = {
		154571,
		102,
		true
	},
	world_expedition_reward_display2 = {
		154673,
		102,
		true
	},
	world_complete_item_tip = {
		154775,
		167,
		true
	},
	task_notfound_error = {
		154942,
		149,
		true
	},
	task_submitTask_error = {
		155091,
		111,
		true
	},
	task_submitTask_error_client = {
		155202,
		118,
		true
	},
	task_submitTask_error_notFinish = {
		155320,
		136,
		true
	},
	task_taskMediator_getItem = {
		155456,
		158,
		true
	},
	task_taskMediator_getResource = {
		155614,
		166,
		true
	},
	task_taskMediator_getEquip = {
		155780,
		158,
		true
	},
	task_target_chapter_in_progress = {
		155938,
		178,
		true
	},
	task_level_notenough = {
		156116,
		119,
		true
	},
	loading_tip_ShaderMgr = {
		156235,
		105,
		true
	},
	loading_tip_FontMgr = {
		156340,
		100,
		true
	},
	loading_tip_TipsMgr = {
		156440,
		102,
		true
	},
	loading_tip_MsgboxMgr = {
		156542,
		103,
		true
	},
	loading_tip_GuideMgr = {
		156645,
		111,
		true
	},
	loading_tip_PoolMgr = {
		156756,
		98,
		true
	},
	loading_tip_FModMgr = {
		156854,
		98,
		true
	},
	loading_tip_StoryMgr = {
		156952,
		102,
		true
	},
	energy_desc_happy = {
		157054,
		136,
		true
	},
	energy_desc_normal = {
		157190,
		148,
		true
	},
	energy_desc_tired = {
		157338,
		139,
		true
	},
	energy_desc_angry = {
		157477,
		121,
		true
	},
	create_player_success = {
		157598,
		103,
		true
	},
	login_newPlayerScene_invalideName = {
		157701,
		141,
		true
	},
	login_newPlayerScene_name_tooShort = {
		157842,
		116,
		true
	},
	login_newPlayerScene_name_existOtherChar = {
		157958,
		140,
		true
	},
	login_newPlayerScene_name_tooLong = {
		158098,
		114,
		true
	},
	equipment_updateGrade_tip = {
		158212,
		143,
		true
	},
	equipment_upgrade_ok = {
		158355,
		98,
		true
	},
	equipment_cant_upgrade = {
		158453,
		113,
		true
	},
	equipment_upgrade_erro = {
		158566,
		111,
		true
	},
	collection_nostar = {
		158677,
		98,
		true
	},
	collection_getResource_error = {
		158775,
		119,
		true
	},
	collection_hadAward = {
		158894,
		109,
		true
	},
	collection_lock = {
		159003,
		85,
		true
	},
	collection_fetched = {
		159088,
		114,
		true
	},
	buyProp_noResource_error = {
		159202,
		137,
		true
	},
	refresh_shopStreet_ok = {
		159339,
		109,
		true
	},
	refresh_shopStreet_erro = {
		159448,
		114,
		true
	},
	shopStreet_upgrade_done = {
		159562,
		103,
		true
	},
	shopStreet_refresh_max_count = {
		159665,
		122,
		true
	},
	buy_countLimit = {
		159787,
		105,
		true
	},
	buy_item_quest = {
		159892,
		117,
		true
	},
	refresh_shopStreet_question = {
		160009,
		249,
		true
	},
	quota_shop_title = {
		160258,
		96,
		true
	},
	quota_shop_description = {
		160354,
		183,
		true
	},
	quota_shop_owned = {
		160537,
		85,
		true
	},
	quota_shop_good_limit = {
		160622,
		98,
		true
	},
	quota_shop_limit_error = {
		160720,
		145,
		true
	},
	event_start_success = {
		160865,
		104,
		true
	},
	event_start_fail = {
		160969,
		107,
		true
	},
	event_finish_success = {
		161076,
		104,
		true
	},
	event_finish_fail = {
		161180,
		111,
		true
	},
	event_giveup_success = {
		161291,
		114,
		true
	},
	event_giveup_fail = {
		161405,
		110,
		true
	},
	event_flush_success = {
		161515,
		107,
		true
	},
	event_flush_fail = {
		161622,
		107,
		true
	},
	event_flush_not_enough = {
		161729,
		110,
		true
	},
	event_start = {
		161839,
		80,
		true
	},
	event_finish = {
		161919,
		84,
		true
	},
	event_giveup = {
		162003,
		82,
		true
	},
	event_minimus_ship_numbers = {
		162085,
		184,
		true
	},
	event_confirm_giveup = {
		162269,
		131,
		true
	},
	event_confirm_flush = {
		162400,
		172,
		true
	},
	event_fleet_busy = {
		162572,
		146,
		true
	},
	event_same_type_not_allowed = {
		162718,
		127,
		true
	},
	event_condition_ship_level = {
		162845,
		165,
		true
	},
	event_condition_ship_count = {
		163010,
		145,
		true
	},
	event_condition_ship_type = {
		163155,
		119,
		true
	},
	event_level_unreached = {
		163274,
		108,
		true
	},
	event_type_unreached = {
		163382,
		119,
		true
	},
	event_oil_consume = {
		163501,
		168,
		true
	},
	event_type_unlimit = {
		163669,
		90,
		true
	},
	dailyLevel_restCount_notEnough = {
		163759,
		133,
		true
	},
	dailyLevel_unopened = {
		163892,
		91,
		true
	},
	dailyLevel_opened = {
		163983,
		85,
		true
	},
	playerinfo_ship_is_already_flagship = {
		164068,
		128,
		true
	},
	playerinfo_mask_word = {
		164196,
		107,
		true
	},
	just_now = {
		164303,
		80,
		true
	},
	several_minutes_before = {
		164383,
		116,
		true
	},
	several_hours_before = {
		164499,
		115,
		true
	},
	several_days_before = {
		164614,
		113,
		true
	},
	long_time_offline = {
		164727,
		89,
		true
	},
	dont_send_message_frequently = {
		164816,
		114,
		true
	},
	no_activity = {
		164930,
		95,
		true
	},
	which_day = {
		165025,
		102,
		true
	},
	which_day_2 = {
		165127,
		81,
		true
	},
	invalidate_evaluation = {
		165208,
		118,
		true
	},
	chapter_no = {
		165326,
		107,
		true
	},
	reconnect_tip = {
		165433,
		123,
		true
	},
	like_ship_success = {
		165556,
		97,
		true
	},
	eva_ship_success = {
		165653,
		98,
		true
	},
	zan_ship_eva_success = {
		165751,
		100,
		true
	},
	zan_ship_eva_error_7 = {
		165851,
		121,
		true
	},
	eva_count_limit = {
		165972,
		119,
		true
	},
	attribute_durability = {
		166091,
		86,
		true
	},
	attribute_cannon = {
		166177,
		83,
		true
	},
	attribute_torpedo = {
		166260,
		85,
		true
	},
	attribute_antiaircraft = {
		166345,
		89,
		true
	},
	attribute_air = {
		166434,
		81,
		true
	},
	attribute_reload = {
		166515,
		84,
		true
	},
	attribute_cd = {
		166599,
		79,
		true
	},
	attribute_armor_type = {
		166678,
		94,
		true
	},
	attribute_armor = {
		166772,
		84,
		true
	},
	attribute_hit = {
		166856,
		80,
		true
	},
	attribute_speed = {
		166936,
		84,
		true
	},
	attribute_luck = {
		167020,
		82,
		true
	},
	attribute_dodge = {
		167102,
		83,
		true
	},
	attribute_expend = {
		167185,
		84,
		true
	},
	attribute_damage = {
		167269,
		83,
		true
	},
	attribute_healthy = {
		167352,
		88,
		true
	},
	attribute_speciality = {
		167440,
		91,
		true
	},
	attribute_range = {
		167531,
		84,
		true
	},
	attribute_angle = {
		167615,
		91,
		true
	},
	attribute_scatter = {
		167706,
		93,
		true
	},
	attribute_ammo = {
		167799,
		82,
		true
	},
	attribute_antisub = {
		167881,
		85,
		true
	},
	attribute_sonarRange = {
		167966,
		88,
		true
	},
	attribute_sonarInterval = {
		168054,
		92,
		true
	},
	attribute_oxy_max = {
		168146,
		85,
		true
	},
	attribute_dodge_limit = {
		168231,
		99,
		true
	},
	attribute_intimacy = {
		168330,
		90,
		true
	},
	attribute_max_distance_damage = {
		168420,
		111,
		true
	},
	attribute_anti_siren = {
		168531,
		101,
		true
	},
	attribute_add_new = {
		168632,
		85,
		true
	},
	skill = {
		168717,
		75,
		true
	},
	cd_normal = {
		168792,
		75,
		true
	},
	intensify = {
		168867,
		80,
		true
	},
	change = {
		168947,
		76,
		true
	},
	formation_switch_failed = {
		169023,
		111,
		true
	},
	formation_switch_success = {
		169134,
		102,
		true
	},
	formation_switch_tip = {
		169236,
		161,
		true
	},
	formation_reform_tip = {
		169397,
		145,
		true
	},
	formation_invalide = {
		169542,
		120,
		true
	},
	chapter_ap_not_enough = {
		169662,
		110,
		true
	},
	formation_forbid_when_in_chapter = {
		169772,
		159,
		true
	},
	military_forbid_when_in_chapter = {
		169931,
		158,
		true
	},
	confirm_app_exit = {
		170089,
		119,
		true
	},
	friend_info_page_tip = {
		170208,
		109,
		true
	},
	friend_search_page_tip = {
		170317,
		135,
		true
	},
	friend_request_page_tip = {
		170452,
		152,
		true
	},
	friend_id_copy_ok = {
		170604,
		106,
		true
	},
	friend_inpout_key_tip = {
		170710,
		106,
		true
	},
	remove_friend_tip = {
		170816,
		126,
		true
	},
	friend_request_msg_placeholder = {
		170942,
		109,
		true
	},
	friend_request_msg_title = {
		171051,
		105,
		true
	},
	friend_max_count = {
		171156,
		147,
		true
	},
	friend_add_ok = {
		171303,
		90,
		true
	},
	friend_max_count_1 = {
		171393,
		117,
		true
	},
	friend_no_request = {
		171510,
		99,
		true
	},
	reject_all_friend_ok = {
		171609,
		113,
		true
	},
	reject_friend_ok = {
		171722,
		104,
		true
	},
	friend_offline = {
		171826,
		96,
		true
	},
	friend_msg_forbid = {
		171922,
		151,
		true
	},
	dont_add_self = {
		172073,
		114,
		true
	},
	friend_already_add = {
		172187,
		122,
		true
	},
	friend_not_add = {
		172309,
		114,
		true
	},
	friend_send_msg_erro_tip = {
		172423,
		131,
		true
	},
	friend_send_msg_null_tip = {
		172554,
		111,
		true
	},
	friend_search_succeed = {
		172665,
		101,
		true
	},
	friend_request_msg_sent = {
		172766,
		100,
		true
	},
	friend_resume_ship_count = {
		172866,
		100,
		true
	},
	friend_resume_title_metal = {
		172966,
		103,
		true
	},
	friend_resume_collection_rate = {
		173069,
		104,
		true
	},
	friend_resume_attack_count = {
		173173,
		99,
		true
	},
	friend_resume_attack_win_rate = {
		173272,
		100,
		true
	},
	friend_resume_manoeuvre_count = {
		173372,
		104,
		true
	},
	friend_resume_manoeuvre_win_rate = {
		173476,
		104,
		true
	},
	friend_resume_fleet_gs = {
		173580,
		98,
		true
	},
	friend_event_count = {
		173678,
		95,
		true
	},
	firend_relieve_blacklist_ok = {
		173773,
		99,
		true
	},
	firend_relieve_blacklist_tip = {
		173872,
		148,
		true
	},
	word_shipNation_all = {
		174020,
		95,
		true
	},
	word_shipNation_baiYing = {
		174115,
		98,
		true
	},
	word_shipNation_huangJia = {
		174213,
		98,
		true
	},
	word_shipNation_chongYing = {
		174311,
		102,
		true
	},
	word_shipNation_tieXue = {
		174413,
		96,
		true
	},
	word_shipNation_dongHuang = {
		174509,
		102,
		true
	},
	word_shipNation_saDing = {
		174611,
		103,
		true
	},
	word_shipNation_beiLian = {
		174714,
		106,
		true
	},
	word_shipNation_other = {
		174820,
		89,
		true
	},
	word_shipNation_np = {
		174909,
		89,
		true
	},
	word_shipNation_ziyou = {
		174998,
		95,
		true
	},
	word_shipNation_weixi = {
		175093,
		100,
		true
	},
	word_shipNation_yuanwei = {
		175193,
		101,
		true
	},
	word_shipNation_bili = {
		175294,
		96,
		true
	},
	word_shipNation_um = {
		175390,
		96,
		true
	},
	word_shipNation_ai = {
		175486,
		90,
		true
	},
	word_shipNation_holo = {
		175576,
		92,
		true
	},
	word_shipNation_doa = {
		175668,
		98,
		true
	},
	word_shipNation_imas = {
		175766,
		99,
		true
	},
	word_shipNation_link = {
		175865,
		91,
		true
	},
	word_shipNation_ssss = {
		175956,
		88,
		true
	},
	word_shipNation_mot = {
		176044,
		91,
		true
	},
	word_shipNation_ryza = {
		176135,
		96,
		true
	},
	word_shipNation_meta_index = {
		176231,
		94,
		true
	},
	word_shipNation_senran = {
		176325,
		99,
		true
	},
	word_reset = {
		176424,
		79,
		true
	},
	word_asc = {
		176503,
		81,
		true
	},
	word_desc = {
		176584,
		83,
		true
	},
	word_own = {
		176667,
		78,
		true
	},
	word_own1 = {
		176745,
		79,
		true
	},
	oil_buy_limit_tip = {
		176824,
		150,
		true
	},
	friend_resume_title = {
		176974,
		89,
		true
	},
	friend_resume_data_title = {
		177063,
		92,
		true
	},
	batch_destroy = {
		177155,
		90,
		true
	},
	equipment_select_device_destroy_tip = {
		177245,
		123,
		true
	},
	equipment_select_device_destroy_bonus_tip = {
		177368,
		120,
		true
	},
	equipment_select_device_destroy_nobonus_tip = {
		177488,
		119,
		true
	},
	ship_equip_profiiency = {
		177607,
		100,
		true
	},
	no_open_system_tip = {
		177707,
		165,
		true
	},
	open_system_tip = {
		177872,
		98,
		true
	},
	charge_start_tip = {
		177970,
		102,
		true
	},
	charge_double_gem_tip = {
		178072,
		104,
		true
	},
	charge_month_card_lefttime_tip = {
		178176,
		122,
		true
	},
	charge_title = {
		178298,
		98,
		true
	},
	charge_extra_gem_tip = {
		178396,
		103,
		true
	},
	charge_month_card_title = {
		178499,
		143,
		true
	},
	charge_items_title = {
		178642,
		96,
		true
	},
	setting_interface_save_success = {
		178738,
		116,
		true
	},
	setting_interface_revert_check = {
		178854,
		148,
		true
	},
	setting_interface_cancel_check = {
		179002,
		115,
		true
	},
	event_special_update = {
		179117,
		106,
		true
	},
	no_notice_tip = {
		179223,
		116,
		true
	},
	energy_desc_1 = {
		179339,
		165,
		true
	},
	energy_desc_2 = {
		179504,
		134,
		true
	},
	energy_desc_3 = {
		179638,
		115,
		true
	},
	energy_desc_4 = {
		179753,
		148,
		true
	},
	intimacy_desc_1 = {
		179901,
		100,
		true
	},
	intimacy_desc_2 = {
		180001,
		107,
		true
	},
	intimacy_desc_3 = {
		180108,
		120,
		true
	},
	intimacy_desc_4 = {
		180228,
		124,
		true
	},
	intimacy_desc_5 = {
		180352,
		118,
		true
	},
	intimacy_desc_6 = {
		180470,
		120,
		true
	},
	intimacy_desc_7 = {
		180590,
		120,
		true
	},
	intimacy_desc_1_buff = {
		180710,
		102,
		true
	},
	intimacy_desc_2_buff = {
		180812,
		102,
		true
	},
	intimacy_desc_3_buff = {
		180914,
		141,
		true
	},
	intimacy_desc_4_buff = {
		181055,
		141,
		true
	},
	intimacy_desc_5_buff = {
		181196,
		141,
		true
	},
	intimacy_desc_6_buff = {
		181337,
		141,
		true
	},
	intimacy_desc_7_buff = {
		181478,
		142,
		true
	},
	intimacy_desc_propose = {
		181620,
		323,
		true
	},
	intimacy_desc_1_detail = {
		181943,
		157,
		true
	},
	intimacy_desc_2_detail = {
		182100,
		164,
		true
	},
	intimacy_desc_3_detail = {
		182264,
		196,
		true
	},
	intimacy_desc_4_detail = {
		182460,
		200,
		true
	},
	intimacy_desc_5_detail = {
		182660,
		194,
		true
	},
	intimacy_desc_6_detail = {
		182854,
		324,
		true
	},
	intimacy_desc_7_detail = {
		183178,
		324,
		true
	},
	intimacy_desc_ring = {
		183502,
		96,
		true
	},
	intimacy_desc_tiara = {
		183598,
		96,
		true
	},
	intimacy_desc_day = {
		183694,
		81,
		true
	},
	word_propose_cost_tip1 = {
		183775,
		340,
		true
	},
	word_propose_cost_tip2 = {
		184115,
		318,
		true
	},
	word_propose_tiara_tip = {
		184433,
		153,
		true
	},
	charge_title_getitem = {
		184586,
		117,
		true
	},
	charge_title_getitem_soon = {
		184703,
		113,
		true
	},
	charge_title_getitem_month = {
		184816,
		120,
		true
	},
	charge_limit_all = {
		184936,
		96,
		true
	},
	charge_limit_daily = {
		185032,
		101,
		true
	},
	charge_limit_weekly = {
		185133,
		106,
		true
	},
	charge_limit_monthly = {
		185239,
		108,
		true
	},
	charge_error = {
		185347,
		92,
		true
	},
	charge_success = {
		185439,
		89,
		true
	},
	charge_level_limit = {
		185528,
		99,
		true
	},
	ship_drop_desc_default = {
		185627,
		101,
		true
	},
	charge_limit_lv = {
		185728,
		93,
		true
	},
	charge_time_out = {
		185821,
		144,
		true
	},
	help_shipinfo_equip = {
		185965,
		628,
		true
	},
	help_shipinfo_detail = {
		186593,
		679,
		true
	},
	help_shipinfo_intensify = {
		187272,
		632,
		true
	},
	help_shipinfo_upgrate = {
		187904,
		630,
		true
	},
	help_shipinfo_maxlevel = {
		188534,
		631,
		true
	},
	help_shipinfo_actnpc = {
		189165,
		1323,
		true
	},
	help_backyard = {
		190488,
		590,
		true
	},
	help_shipinfo_fashion = {
		191078,
		168,
		true
	},
	help_shipinfo_attr = {
		191246,
		3706,
		true
	},
	help_equipment = {
		194952,
		1884,
		true
	},
	help_equipment_skin = {
		196836,
		912,
		true
	},
	help_daily_task = {
		197748,
		3705,
		true
	},
	help_build = {
		201453,
		281,
		true
	},
	help_build_1 = {
		201734,
		551,
		true
	},
	help_build_2 = {
		202285,
		283,
		true
	},
	help_build_4 = {
		202568,
		573,
		true
	},
	help_build_5 = {
		203141,
		792,
		true
	},
	help_shipinfo_hunting = {
		203933,
		1244,
		true
	},
	shop_extendship_success = {
		205177,
		101,
		true
	},
	shop_extendequip_success = {
		205278,
		110,
		true
	},
	shop_spweapon_success = {
		205388,
		137,
		true
	},
	naval_academy_res_desc_cateen = {
		205525,
		240,
		true
	},
	naval_academy_res_desc_shop = {
		205765,
		211,
		true
	},
	naval_academy_res_desc_class = {
		205976,
		270,
		true
	},
	number_1 = {
		206246,
		73,
		true
	},
	number_2 = {
		206319,
		73,
		true
	},
	number_3 = {
		206392,
		73,
		true
	},
	number_4 = {
		206465,
		73,
		true
	},
	number_5 = {
		206538,
		73,
		true
	},
	number_6 = {
		206611,
		73,
		true
	},
	number_7 = {
		206684,
		73,
		true
	},
	number_8 = {
		206757,
		73,
		true
	},
	number_9 = {
		206830,
		73,
		true
	},
	number_10 = {
		206903,
		75,
		true
	},
	military_shop_no_open_tip = {
		206978,
		188,
		true
	},
	switch_to_shop_tip_1 = {
		207166,
		149,
		true
	},
	switch_to_shop_tip_2 = {
		207315,
		142,
		true
	},
	switch_to_shop_tip_3 = {
		207457,
		127,
		true
	},
	switch_to_shop_tip_noPos = {
		207584,
		123,
		true
	},
	text_noPos_clear = {
		207707,
		84,
		true
	},
	text_noPos_buy = {
		207791,
		84,
		true
	},
	text_noPos_intensify = {
		207875,
		92,
		true
	},
	switch_to_shop_tip_noDockyard = {
		207967,
		125,
		true
	},
	commission_no_open = {
		208092,
		83,
		true
	},
	commission_open_tip = {
		208175,
		107,
		true
	},
	commission_idle = {
		208282,
		86,
		true
	},
	commission_urgency = {
		208368,
		101,
		true
	},
	commission_normal = {
		208469,
		93,
		true
	},
	commission_get_award = {
		208562,
		109,
		true
	},
	activity_build_end_tip = {
		208671,
		127,
		true
	},
	event_over_time_expired = {
		208798,
		106,
		true
	},
	mail_sender_default = {
		208904,
		95,
		true
	},
	exchangecode_title = {
		208999,
		95,
		true
	},
	exchangecode_use_placeholder = {
		209094,
		116,
		true
	},
	exchangecode_use_ok = {
		209210,
		132,
		true
	},
	exchangecode_use_error = {
		209342,
		110,
		true
	},
	exchangecode_use_error_3 = {
		209452,
		105,
		true
	},
	exchangecode_use_error_6 = {
		209557,
		122,
		true
	},
	exchangecode_use_error_7 = {
		209679,
		115,
		true
	},
	exchangecode_use_error_8 = {
		209794,
		108,
		true
	},
	exchangecode_use_error_9 = {
		209902,
		108,
		true
	},
	exchangecode_use_error_16 = {
		210010,
		108,
		true
	},
	exchangecode_use_error_20 = {
		210118,
		109,
		true
	},
	text_noRes_tip = {
		210227,
		92,
		true
	},
	text_noRes_info_tip = {
		210319,
		111,
		true
	},
	text_noRes_info_tip_link = {
		210430,
		93,
		true
	},
	text_noRes_info_tip2 = {
		210523,
		137,
		true
	},
	text_shop_noRes_tip = {
		210660,
		112,
		true
	},
	text_shop_enoughRes_tip = {
		210772,
		128,
		true
	},
	text_buy_fashion_tip = {
		210900,
		108,
		true
	},
	equip_part_title = {
		211008,
		83,
		true
	},
	equip_part_main_title = {
		211091,
		95,
		true
	},
	equip_part_sub_title = {
		211186,
		99,
		true
	},
	equipment_upgrade_overlimit = {
		211285,
		133,
		true
	},
	err_name_existOtherChar = {
		211418,
		117,
		true
	},
	help_battle_rule = {
		211535,
		511,
		true
	},
	help_battle_warspite = {
		212046,
		300,
		true
	},
	help_battle_defense = {
		212346,
		588,
		true
	},
	backyard_theme_set_tip = {
		212934,
		147,
		true
	},
	backyard_theme_save_tip = {
		213081,
		172,
		true
	},
	backyard_theme_defaultname = {
		213253,
		102,
		true
	},
	backyard_rename_success = {
		213355,
		105,
		true
	},
	ship_set_skin_success = {
		213460,
		98,
		true
	},
	ship_set_skin_error = {
		213558,
		107,
		true
	},
	equip_part_tip = {
		213665,
		109,
		true
	},
	help_battle_auto = {
		213774,
		334,
		true
	},
	gold_buy_tip = {
		214108,
		247,
		true
	},
	oil_buy_tip = {
		214355,
		344,
		true
	},
	text_iknow = {
		214699,
		80,
		true
	},
	help_oil_buy_limit = {
		214779,
		299,
		true
	},
	text_nofood_yes = {
		215078,
		88,
		true
	},
	text_nofood_no = {
		215166,
		84,
		true
	},
	tip_add_task = {
		215250,
		91,
		true
	},
	collection_award_ship = {
		215341,
		134,
		true
	},
	guild_create_sucess = {
		215475,
		97,
		true
	},
	guild_create_error = {
		215572,
		105,
		true
	},
	guild_create_error_noname = {
		215677,
		117,
		true
	},
	guild_create_error_nofaction = {
		215794,
		131,
		true
	},
	guild_create_error_nopolicy = {
		215925,
		121,
		true
	},
	guild_create_error_nomanifesto = {
		216046,
		123,
		true
	},
	guild_create_error_nomoney = {
		216169,
		117,
		true
	},
	guild_tip_dissolve = {
		216286,
		347,
		true
	},
	guild_tip_quit = {
		216633,
		119,
		true
	},
	guild_create_confirm = {
		216752,
		144,
		true
	},
	guild_apply_erro = {
		216896,
		113,
		true
	},
	guild_dissolve_erro = {
		217009,
		108,
		true
	},
	guild_fire_erro = {
		217117,
		107,
		true
	},
	guild_impeach_erro = {
		217224,
		114,
		true
	},
	guild_quit_erro = {
		217338,
		101,
		true
	},
	guild_accept_erro = {
		217439,
		110,
		true
	},
	guild_reject_erro = {
		217549,
		110,
		true
	},
	guild_modify_erro = {
		217659,
		103,
		true
	},
	guild_setduty_erro = {
		217762,
		106,
		true
	},
	guild_apply_sucess = {
		217868,
		108,
		true
	},
	guild_no_exist = {
		217976,
		99,
		true
	},
	guild_dissolve_sucess = {
		218075,
		110,
		true
	},
	guild_commder_in_impeach_time = {
		218185,
		126,
		true
	},
	guild_impeach_sucess = {
		218311,
		107,
		true
	},
	guild_quit_sucess = {
		218418,
		105,
		true
	},
	guild_member_max_count = {
		218523,
		104,
		true
	},
	guild_new_member_join = {
		218627,
		119,
		true
	},
	guild_player_in_cd_time = {
		218746,
		185,
		true
	},
	guild_player_already_join = {
		218931,
		123,
		true
	},
	guild_rejecet_apply_sucess = {
		219054,
		111,
		true
	},
	guild_should_input_keyword = {
		219165,
		117,
		true
	},
	guild_search_sucess = {
		219282,
		99,
		true
	},
	guild_list_refresh_sucess = {
		219381,
		123,
		true
	},
	guild_info_update = {
		219504,
		100,
		true
	},
	guild_duty_id_is_null = {
		219604,
		108,
		true
	},
	guild_player_is_null = {
		219712,
		109,
		true
	},
	guild_duty_commder_max_count = {
		219821,
		126,
		true
	},
	guild_set_duty_sucess = {
		219947,
		107,
		true
	},
	guild_policy_power = {
		220054,
		86,
		true
	},
	guild_policy_relax = {
		220140,
		88,
		true
	},
	guild_faction_blhx = {
		220228,
		91,
		true
	},
	guild_faction_cszz = {
		220319,
		94,
		true
	},
	guild_faction_unknown = {
		220413,
		89,
		true
	},
	guild_faction_meta = {
		220502,
		86,
		true
	},
	guild_word_commder = {
		220588,
		89,
		true
	},
	guild_word_deputy_commder = {
		220677,
		101,
		true
	},
	guild_word_picked = {
		220778,
		86,
		true
	},
	guild_word_ordinary = {
		220864,
		89,
		true
	},
	guild_word_home = {
		220953,
		83,
		true
	},
	guild_word_member = {
		221036,
		88,
		true
	},
	guild_word_apply = {
		221124,
		85,
		true
	},
	guild_faction_change_tip = {
		221209,
		197,
		true
	},
	guild_msg_is_null = {
		221406,
		111,
		true
	},
	guild_log_new_guild_join = {
		221517,
		192,
		true
	},
	guild_log_duty_change = {
		221709,
		178,
		true
	},
	guild_log_quit = {
		221887,
		180,
		true
	},
	guild_log_fire = {
		222067,
		187,
		true
	},
	guild_leave_cd_time = {
		222254,
		148,
		true
	},
	guild_sort_time = {
		222402,
		83,
		true
	},
	guild_sort_level = {
		222485,
		83,
		true
	},
	guild_sort_duty = {
		222568,
		83,
		true
	},
	guild_fire_tip = {
		222651,
		120,
		true
	},
	guild_impeach_tip = {
		222771,
		126,
		true
	},
	guild_set_duty_title = {
		222897,
		99,
		true
	},
	guild_search_list_max_count = {
		222996,
		107,
		true
	},
	guild_sort_all = {
		223103,
		81,
		true
	},
	guild_sort_blhx = {
		223184,
		88,
		true
	},
	guild_sort_cszz = {
		223272,
		91,
		true
	},
	guild_sort_power = {
		223363,
		84,
		true
	},
	guild_sort_relax = {
		223447,
		86,
		true
	},
	guild_join_cd = {
		223533,
		142,
		true
	},
	guild_name_invaild = {
		223675,
		110,
		true
	},
	guild_apply_full = {
		223785,
		117,
		true
	},
	guild_member_full = {
		223902,
		101,
		true
	},
	guild_fire_duty_limit = {
		224003,
		142,
		true
	},
	guild_fire_succeed = {
		224145,
		89,
		true
	},
	guild_duty_tip_1 = {
		224234,
		115,
		true
	},
	guild_duty_tip_2 = {
		224349,
		116,
		true
	},
	battle_repair_special_tip = {
		224465,
		168,
		true
	},
	battle_repair_normal_name = {
		224633,
		109,
		true
	},
	battle_repair_special_name = {
		224742,
		111,
		true
	},
	oil_max_tip_title = {
		224853,
		110,
		true
	},
	gold_max_tip_title = {
		224963,
		113,
		true
	},
	expbook_max_tip_title = {
		225076,
		121,
		true
	},
	resource_max_tip_shop = {
		225197,
		108,
		true
	},
	resource_max_tip_event = {
		225305,
		122,
		true
	},
	resource_max_tip_battle = {
		225427,
		162,
		true
	},
	resource_max_tip_collect = {
		225589,
		124,
		true
	},
	resource_max_tip_mail = {
		225713,
		121,
		true
	},
	resource_max_tip_eventstart = {
		225834,
		118,
		true
	},
	resource_max_tip_destroy = {
		225952,
		111,
		true
	},
	resource_max_tip_retire = {
		226063,
		104,
		true
	},
	resource_max_tip_retire_1 = {
		226167,
		163,
		true
	},
	new_version_tip = {
		226330,
		165,
		true
	},
	guild_request_msg_title = {
		226495,
		115,
		true
	},
	guild_request_msg_placeholder = {
		226610,
		147,
		true
	},
	ship_upgrade_unequip_tip = {
		226757,
		223,
		true
	},
	destination_can_not_reach = {
		226980,
		121,
		true
	},
	destination_can_not_reach_safety = {
		227101,
		136,
		true
	},
	destination_not_in_range = {
		227237,
		123,
		true
	},
	level_ammo_enough = {
		227360,
		146,
		true
	},
	level_ammo_supply = {
		227506,
		120,
		true
	},
	level_ammo_empty = {
		227626,
		132,
		true
	},
	level_ammo_supply_p1 = {
		227758,
		108,
		true
	},
	level_flare_supply = {
		227866,
		209,
		true
	},
	chat_level_not_enough = {
		228075,
		136,
		true
	},
	chat_msg_inform = {
		228211,
		143,
		true
	},
	chat_msg_ban = {
		228354,
		182,
		true
	},
	month_card_set_ratio_success = {
		228536,
		115,
		true
	},
	month_card_set_ratio_not_change = {
		228651,
		125,
		true
	},
	charge_ship_bag_max = {
		228776,
		117,
		true
	},
	charge_equip_bag_max = {
		228893,
		121,
		true
	},
	login_wait_tip = {
		229014,
		141,
		true
	},
	ship_equip_exchange_tip = {
		229155,
		189,
		true
	},
	ship_rename_success = {
		229344,
		109,
		true
	},
	formation_chapter_lock = {
		229453,
		122,
		true
	},
	elite_disable_unsatisfied = {
		229575,
		127,
		true
	},
	elite_disable_ship_escort = {
		229702,
		158,
		true
	},
	elite_disable_formation_unsatisfied = {
		229860,
		149,
		true
	},
	elite_disable_no_fleet = {
		230009,
		135,
		true
	},
	elite_disable_property_unsatisfied = {
		230144,
		146,
		true
	},
	elite_disable_unusable = {
		230290,
		131,
		true
	},
	elite_warp_to_latest_map = {
		230421,
		111,
		true
	},
	elite_fleet_confirm = {
		230532,
		213,
		true
	},
	elite_condition_level = {
		230745,
		98,
		true
	},
	elite_condition_durability = {
		230843,
		98,
		true
	},
	elite_condition_cannon = {
		230941,
		94,
		true
	},
	elite_condition_torpedo = {
		231035,
		96,
		true
	},
	elite_condition_antiaircraft = {
		231131,
		100,
		true
	},
	elite_condition_air = {
		231231,
		92,
		true
	},
	elite_condition_antisub = {
		231323,
		96,
		true
	},
	elite_condition_dodge = {
		231419,
		94,
		true
	},
	elite_condition_reload = {
		231513,
		95,
		true
	},
	elite_condition_fleet_totle_level = {
		231608,
		134,
		true
	},
	common_compare_larger = {
		231742,
		86,
		true
	},
	common_compare_equal = {
		231828,
		85,
		true
	},
	common_compare_smaller = {
		231913,
		87,
		true
	},
	common_compare_not_less_than = {
		232000,
		95,
		true
	},
	common_compare_not_more_than = {
		232095,
		95,
		true
	},
	level_scene_formation_active_already = {
		232190,
		133,
		true
	},
	level_scene_not_enough = {
		232323,
		120,
		true
	},
	level_scene_full_hp = {
		232443,
		148,
		true
	},
	level_click_to_move = {
		232591,
		115,
		true
	},
	common_hardmode = {
		232706,
		83,
		true
	},
	common_elite_no_quota = {
		232789,
		135,
		true
	},
	common_food = {
		232924,
		81,
		true
	},
	common_no_limit = {
		233005,
		88,
		true
	},
	common_proficiency = {
		233093,
		92,
		true
	},
	backyard_food_remind = {
		233185,
		178,
		true
	},
	backyard_food_count = {
		233363,
		109,
		true
	},
	sham_ship_level_limit = {
		233472,
		114,
		true
	},
	sham_count_limit = {
		233586,
		115,
		true
	},
	sham_count_reset = {
		233701,
		126,
		true
	},
	sham_team_limit = {
		233827,
		175,
		true
	},
	sham_formation_invalid = {
		234002,
		154,
		true
	},
	sham_my_assist_ship_level_limit = {
		234156,
		132,
		true
	},
	sham_reset_confirm = {
		234288,
		160,
		true
	},
	sham_battle_help_tip = {
		234448,
		84,
		true
	},
	sham_reset_err_limit = {
		234532,
		130,
		true
	},
	sham_ship_equip_forbid_1 = {
		234662,
		207,
		true
	},
	sham_ship_equip_forbid_2 = {
		234869,
		183,
		true
	},
	sham_enter_error_friend_ship_expired = {
		235052,
		156,
		true
	},
	sham_can_not_change_ship = {
		235208,
		140,
		true
	},
	sham_friend_ship_tip = {
		235348,
		213,
		true
	},
	inform_sueecss = {
		235561,
		95,
		true
	},
	inform_failed = {
		235656,
		101,
		true
	},
	inform_player = {
		235757,
		94,
		true
	},
	inform_select_type = {
		235851,
		114,
		true
	},
	inform_chat_msg = {
		235965,
		101,
		true
	},
	inform_sueecss_tip = {
		236066,
		161,
		true
	},
	ship_remould_max_level = {
		236227,
		137,
		true
	},
	ship_remould_material_ship_no_enough = {
		236364,
		139,
		true
	},
	ship_remould_material_ship_on_exist = {
		236503,
		138,
		true
	},
	ship_remould_material_unlock_skill = {
		236641,
		112,
		true
	},
	ship_remould_prev_lock = {
		236753,
		93,
		true
	},
	ship_remould_need_level = {
		236846,
		94,
		true
	},
	ship_remould_need_star = {
		236940,
		94,
		true
	},
	ship_remould_finished = {
		237034,
		94,
		true
	},
	ship_remould_no_item = {
		237128,
		101,
		true
	},
	ship_remould_no_gold = {
		237229,
		112,
		true
	},
	ship_remould_no_material = {
		237341,
		120,
		true
	},
	ship_remould_selecte_exceed = {
		237461,
		124,
		true
	},
	ship_remould_sueecss = {
		237585,
		93,
		true
	},
	ship_remould_warning_102174 = {
		237678,
		200,
		true
	},
	ship_remould_warning_102284 = {
		237878,
		205,
		true
	},
	ship_remould_warning_102304 = {
		238083,
		356,
		true
	},
	ship_remould_warning_105214 = {
		238439,
		222,
		true
	},
	ship_remould_warning_105234 = {
		238661,
		235,
		true
	},
	ship_remould_warning_107984 = {
		238896,
		238,
		true
	},
	ship_remould_warning_201514 = {
		239134,
		249,
		true
	},
	ship_remould_warning_203114 = {
		239383,
		361,
		true
	},
	ship_remould_warning_203124 = {
		239744,
		352,
		true
	},
	ship_remould_warning_205124 = {
		240096,
		204,
		true
	},
	ship_remould_warning_205154 = {
		240300,
		228,
		true
	},
	ship_remould_warning_206134 = {
		240528,
		329,
		true
	},
	ship_remould_warning_301534 = {
		240857,
		183,
		true
	},
	ship_remould_warning_301874 = {
		241040,
		551,
		true
	},
	ship_remould_warning_310014 = {
		241591,
		470,
		true
	},
	ship_remould_warning_310024 = {
		242061,
		470,
		true
	},
	ship_remould_warning_310034 = {
		242531,
		470,
		true
	},
	ship_remould_warning_310044 = {
		243001,
		470,
		true
	},
	ship_remould_warning_303154 = {
		243471,
		604,
		true
	},
	ship_remould_warning_402134 = {
		244075,
		264,
		true
	},
	ship_remould_warning_702124 = {
		244339,
		492,
		true
	},
	ship_remould_warning_520014 = {
		244831,
		280,
		true
	},
	ship_remould_warning_521014 = {
		245111,
		282,
		true
	},
	ship_remould_warning_520034 = {
		245393,
		280,
		true
	},
	ship_remould_warning_521034 = {
		245673,
		282,
		true
	},
	ship_remould_warning_520044 = {
		245955,
		280,
		true
	},
	ship_remould_warning_521044 = {
		246235,
		282,
		true
	},
	ship_remould_warning_502114 = {
		246517,
		186,
		true
	},
	ship_remould_warning_506114 = {
		246703,
		399,
		true
	},
	word_soundfiles_download_title = {
		247102,
		116,
		true
	},
	word_soundfiles_download = {
		247218,
		102,
		true
	},
	word_soundfiles_checking_title = {
		247320,
		105,
		true
	},
	word_soundfiles_checking = {
		247425,
		99,
		true
	},
	word_soundfiles_checkend_title = {
		247524,
		131,
		true
	},
	word_soundfiles_checkend = {
		247655,
		101,
		true
	},
	word_soundfiles_noneedupdate = {
		247756,
		98,
		true
	},
	word_soundfiles_checkfailed = {
		247854,
		122,
		true
	},
	word_soundfiles_retry = {
		247976,
		97,
		true
	},
	word_soundfiles_update = {
		248073,
		97,
		true
	},
	word_soundfiles_update_end_title = {
		248170,
		118,
		true
	},
	word_soundfiles_update_end = {
		248288,
		106,
		true
	},
	word_soundfiles_update_failed = {
		248394,
		124,
		true
	},
	word_soundfiles_update_retry = {
		248518,
		104,
		true
	},
	word_live2dfiles_download_title = {
		248622,
		125,
		true
	},
	word_live2dfiles_download = {
		248747,
		109,
		true
	},
	word_live2dfiles_checking_title = {
		248856,
		107,
		true
	},
	word_live2dfiles_checking = {
		248963,
		98,
		true
	},
	word_live2dfiles_checkend_title = {
		249061,
		140,
		true
	},
	word_live2dfiles_checkend = {
		249201,
		102,
		true
	},
	word_live2dfiles_noneedupdate = {
		249303,
		99,
		true
	},
	word_live2dfiles_checkfailed = {
		249402,
		134,
		true
	},
	word_live2dfiles_retry = {
		249536,
		98,
		true
	},
	word_live2dfiles_update = {
		249634,
		98,
		true
	},
	word_live2dfiles_update_end_title = {
		249732,
		136,
		true
	},
	word_live2dfiles_update_end = {
		249868,
		107,
		true
	},
	word_live2dfiles_update_failed = {
		249975,
		130,
		true
	},
	word_live2dfiles_update_retry = {
		250105,
		105,
		true
	},
	word_live2dfiles_main_update_tip = {
		250210,
		149,
		true
	},
	achieve_propose_tip = {
		250359,
		101,
		true
	},
	mingshi_get_tip = {
		250460,
		105,
		true
	},
	mingshi_task_tip_1 = {
		250565,
		217,
		true
	},
	mingshi_task_tip_2 = {
		250782,
		221,
		true
	},
	mingshi_task_tip_3 = {
		251003,
		220,
		true
	},
	mingshi_task_tip_4 = {
		251223,
		221,
		true
	},
	mingshi_task_tip_5 = {
		251444,
		216,
		true
	},
	mingshi_task_tip_6 = {
		251660,
		215,
		true
	},
	mingshi_task_tip_7 = {
		251875,
		228,
		true
	},
	mingshi_task_tip_8 = {
		252103,
		223,
		true
	},
	mingshi_task_tip_9 = {
		252326,
		221,
		true
	},
	mingshi_task_tip_10 = {
		252547,
		229,
		true
	},
	mingshi_task_tip_11 = {
		252776,
		215,
		true
	},
	word_propose_changename_title = {
		252991,
		163,
		true
	},
	word_propose_changename_tip1 = {
		253154,
		136,
		true
	},
	word_propose_changename_tip2 = {
		253290,
		113,
		true
	},
	word_propose_ring_tip = {
		253403,
		109,
		true
	},
	word_rename_time_tip = {
		253512,
		147,
		true
	},
	word_rename_switch_tip = {
		253659,
		151,
		true
	},
	word_ssr = {
		253810,
		74,
		true
	},
	word_sr = {
		253884,
		76,
		true
	},
	word_r = {
		253960,
		71,
		true
	},
	ship_renameShip_error = {
		254031,
		107,
		true
	},
	ship_renameShip_error_4 = {
		254138,
		125,
		true
	},
	ship_renameShip_error_2011 = {
		254263,
		107,
		true
	},
	ship_proposeShip_error = {
		254370,
		104,
		true
	},
	ship_proposeShip_error_1 = {
		254474,
		106,
		true
	},
	word_rename_time_warning = {
		254580,
		236,
		true
	},
	word_propose_cost_tip = {
		254816,
		453,
		true
	},
	word_propose_switch_tip = {
		255269,
		102,
		true
	},
	evaluate_too_loog = {
		255371,
		101,
		true
	},
	evaluate_ban_word = {
		255472,
		112,
		true
	},
	activity_level_easy_tip = {
		255584,
		181,
		true
	},
	activity_level_difficulty_tip = {
		255765,
		210,
		true
	},
	activity_level_limit_tip = {
		255975,
		174,
		true
	},
	activity_level_inwarime_tip = {
		256149,
		221,
		true
	},
	activity_level_pass_easy_tip = {
		256370,
		187,
		true
	},
	activity_level_is_closed = {
		256557,
		114,
		true
	},
	activity_switch_tip = {
		256671,
		255,
		true
	},
	reduce_sp3_pass_count = {
		256926,
		103,
		true
	},
	qiuqiu_count = {
		257029,
		85,
		true
	},
	qiuqiu_total_count = {
		257114,
		91,
		true
	},
	npcfriendly_count = {
		257205,
		98,
		true
	},
	npcfriendly_total_count = {
		257303,
		97,
		true
	},
	longxiang_count = {
		257400,
		98,
		true
	},
	longxiang_total_count = {
		257498,
		103,
		true
	},
	pt_count = {
		257601,
		82,
		true
	},
	pt_total_count = {
		257683,
		94,
		true
	},
	remould_ship_ok = {
		257777,
		88,
		true
	},
	remould_ship_count_more = {
		257865,
		120,
		true
	},
	word_should_input = {
		257985,
		108,
		true
	},
	simulation_advantage_counting = {
		258093,
		126,
		true
	},
	simulation_disadvantage_counting = {
		258219,
		130,
		true
	},
	simulation_enhancing = {
		258349,
		144,
		true
	},
	simulation_enhanced = {
		258493,
		121,
		true
	},
	word_skill_desc_get = {
		258614,
		94,
		true
	},
	word_skill_desc_learn = {
		258708,
		89,
		true
	},
	chapter_tip_aovid_succeed = {
		258797,
		96,
		true
	},
	chapter_tip_aovid_failed = {
		258893,
		104,
		true
	},
	chapter_tip_change = {
		258997,
		103,
		true
	},
	chapter_tip_use = {
		259100,
		98,
		true
	},
	chapter_tip_with_npc = {
		259198,
		285,
		true
	},
	chapter_tip_bp_ammo = {
		259483,
		137,
		true
	},
	build_ship_tip = {
		259620,
		190,
		true
	},
	auto_battle_limit_tip = {
		259810,
		123,
		true
	},
	build_ship_quickly_buy_stone = {
		259933,
		190,
		true
	},
	build_ship_quickly_buy_tool = {
		260123,
		205,
		true
	},
	ship_profile_voice_locked = {
		260328,
		121,
		true
	},
	ship_profile_skin_locked = {
		260449,
		110,
		true
	},
	ship_profile_words = {
		260559,
		88,
		true
	},
	ship_profile_action_words = {
		260647,
		102,
		true
	},
	ship_profile_label_common = {
		260749,
		96,
		true
	},
	ship_profile_label_diff = {
		260845,
		98,
		true
	},
	level_fleet_lease_one_ship = {
		260943,
		133,
		true
	},
	level_fleet_not_enough = {
		261076,
		131,
		true
	},
	level_fleet_outof_limit = {
		261207,
		125,
		true
	},
	vote_success = {
		261332,
		82,
		true
	},
	vote_not_enough = {
		261414,
		111,
		true
	},
	vote_love_not_enough = {
		261525,
		125,
		true
	},
	vote_love_limit = {
		261650,
		143,
		true
	},
	vote_love_confirm = {
		261793,
		125,
		true
	},
	vote_primary_rule = {
		261918,
		81,
		true
	},
	vote_final_title1 = {
		261999,
		88,
		true
	},
	vote_final_rule1 = {
		262087,
		231,
		true
	},
	vote_final_title2 = {
		262318,
		94,
		true
	},
	vote_final_rule2 = {
		262412,
		240,
		true
	},
	vote_vote_time = {
		262652,
		100,
		true
	},
	vote_vote_count = {
		262752,
		87,
		true
	},
	vote_vote_group = {
		262839,
		87,
		true
	},
	vote_rank_refresh_time = {
		262926,
		120,
		true
	},
	vote_rank_in_current_server = {
		263046,
		128,
		true
	},
	words_auto_battle_label = {
		263174,
		105,
		true
	},
	words_show_ship_name_label = {
		263279,
		106,
		true
	},
	words_rare_ship_vibrate = {
		263385,
		100,
		true
	},
	words_display_ship_get_effect = {
		263485,
		108,
		true
	},
	words_show_touch_effect = {
		263593,
		102,
		true
	},
	words_bg_fit_mode = {
		263695,
		121,
		true
	},
	words_battle_hide_bg = {
		263816,
		116,
		true
	},
	words_battle_expose_line = {
		263932,
		123,
		true
	},
	words_autoFight_battery_savemode = {
		264055,
		121,
		true
	},
	words_autoFight_battery_savemode_des = {
		264176,
		182,
		true
	},
	words_autoFIght_down_frame = {
		264358,
		115,
		true
	},
	words_autoFIght_down_frame_des = {
		264473,
		163,
		true
	},
	words_autoFight_tips = {
		264636,
		131,
		true
	},
	words_autoFight_right = {
		264767,
		175,
		true
	},
	activity_puzzle_get1 = {
		264942,
		132,
		true
	},
	activity_puzzle_get2 = {
		265074,
		143,
		true
	},
	activity_puzzle_get3 = {
		265217,
		143,
		true
	},
	activity_puzzle_get4 = {
		265360,
		143,
		true
	},
	activity_puzzle_get5 = {
		265503,
		143,
		true
	},
	activity_puzzle_get6 = {
		265646,
		143,
		true
	},
	activity_puzzle_get7 = {
		265789,
		143,
		true
	},
	activity_puzzle_get8 = {
		265932,
		143,
		true
	},
	activity_puzzle_get9 = {
		266075,
		143,
		true
	},
	activity_puzzle_get10 = {
		266218,
		133,
		true
	},
	activity_puzzle_get11 = {
		266351,
		133,
		true
	},
	activity_puzzle_get12 = {
		266484,
		133,
		true
	},
	activity_puzzle_get13 = {
		266617,
		133,
		true
	},
	activity_puzzle_get14 = {
		266750,
		133,
		true
	},
	activity_puzzle_get15 = {
		266883,
		133,
		true
	},
	word_stopremain_build = {
		267016,
		102,
		true
	},
	word_stopremain_default = {
		267118,
		104,
		true
	},
	transcode_desc = {
		267222,
		359,
		true
	},
	transcode_empty_tip = {
		267581,
		117,
		true
	},
	set_birth_title = {
		267698,
		91,
		true
	},
	set_birth_confirm_tip = {
		267789,
		110,
		true
	},
	set_birth_empty_tip = {
		267899,
		105,
		true
	},
	set_birth_success = {
		268004,
		107,
		true
	},
	clear_transcode_cache_confirm = {
		268111,
		143,
		true
	},
	clear_transcode_cache_success = {
		268254,
		115,
		true
	},
	exchange_item_success = {
		268369,
		94,
		true
	},
	give_up_cloth_change = {
		268463,
		120,
		true
	},
	err_cloth_change_noship = {
		268583,
		103,
		true
	},
	need_break_tip = {
		268686,
		99,
		true
	},
	max_level_notice = {
		268785,
		152,
		true
	},
	new_skin_no_choose = {
		268937,
		156,
		true
	},
	sure_resume_volume = {
		269093,
		114,
		true
	},
	course_class_not_ready = {
		269207,
		165,
		true
	},
	course_student_max_level = {
		269372,
		152,
		true
	},
	course_stop_confirm = {
		269524,
		103,
		true
	},
	course_class_help = {
		269627,
		1480,
		true
	},
	course_class_name = {
		271107,
		100,
		true
	},
	course_proficiency_not_enough = {
		271207,
		128,
		true
	},
	course_state_rest = {
		271335,
		91,
		true
	},
	course_state_lession = {
		271426,
		97,
		true
	},
	course_energy_not_enough = {
		271523,
		156,
		true
	},
	course_proficiency_tip = {
		271679,
		382,
		true
	},
	course_sunday_tip = {
		272061,
		145,
		true
	},
	course_exit_confirm = {
		272206,
		158,
		true
	},
	course_learning = {
		272364,
		111,
		true
	},
	time_remaining_tip = {
		272475,
		93,
		true
	},
	propose_intimacy_tip = {
		272568,
		119,
		true
	},
	no_found_record_equipment = {
		272687,
		196,
		true
	},
	sec_floor_limit_tip = {
		272883,
		130,
		true
	},
	guild_shop_flash_success = {
		273013,
		98,
		true
	},
	destroy_high_rarity_tip = {
		273111,
		125,
		true
	},
	destroy_high_level_tip = {
		273236,
		133,
		true
	},
	destroy_eliteequipment_tip = {
		273369,
		117,
		true
	},
	destroy_high_intensify_tip = {
		273486,
		124,
		true
	},
	destroy_inHardFormation_tip = {
		273610,
		126,
		true
	},
	destroy_equip_rarity_tip = {
		273736,
		161,
		true
	},
	ship_quick_change_noequip = {
		273897,
		116,
		true
	},
	ship_quick_change_nofreeequip = {
		274013,
		134,
		true
	},
	word_nowenergy = {
		274147,
		84,
		true
	},
	word_energy_recov_speed = {
		274231,
		101,
		true
	},
	destroy_eliteship_tip = {
		274332,
		111,
		true
	},
	err_resloveequip_nochoice = {
		274443,
		120,
		true
	},
	take_nothing = {
		274563,
		103,
		true
	},
	take_all_mail = {
		274666,
		174,
		true
	},
	buy_furniture_overtime = {
		274840,
		135,
		true
	},
	twitter_login_tips = {
		274975,
		166,
		true
	},
	data_erro = {
		275141,
		121,
		true
	},
	login_failed = {
		275262,
		94,
		true
	},
	["not yet completed"] = {
		275356,
		93,
		true
	},
	escort_less_count_to_combat = {
		275449,
		127,
		true
	},
	ten_even_draw = {
		275576,
		94,
		true
	},
	ten_even_draw_confirm = {
		275670,
		111,
		true
	},
	level_risk_level_desc = {
		275781,
		90,
		true
	},
	level_risk_level_mitigation_rate = {
		275871,
		239,
		true
	},
	level_diffcult_chapter_state_safety = {
		276110,
		229,
		true
	},
	level_chapter_state_high_risk = {
		276339,
		137,
		true
	},
	level_chapter_state_risk = {
		276476,
		128,
		true
	},
	level_chapter_state_low_risk = {
		276604,
		133,
		true
	},
	level_chapter_state_safety = {
		276737,
		132,
		true
	},
	open_skill_class_success = {
		276869,
		121,
		true
	},
	backyard_sort_tag_default = {
		276990,
		91,
		true
	},
	backyard_sort_tag_price = {
		277081,
		93,
		true
	},
	backyard_sort_tag_comfortable = {
		277174,
		100,
		true
	},
	backyard_sort_tag_size = {
		277274,
		90,
		true
	},
	backyard_filter_tag_other = {
		277364,
		93,
		true
	},
	word_status_inFight = {
		277457,
		90,
		true
	},
	word_status_inPVP = {
		277547,
		91,
		true
	},
	word_status_inEvent = {
		277638,
		92,
		true
	},
	word_status_inEventFinished = {
		277730,
		100,
		true
	},
	word_status_inTactics = {
		277830,
		93,
		true
	},
	word_status_inClass = {
		277923,
		91,
		true
	},
	word_status_rest = {
		278014,
		87,
		true
	},
	word_status_train = {
		278101,
		89,
		true
	},
	word_status_world = {
		278190,
		97,
		true
	},
	word_status_inHardFormation = {
		278287,
		103,
		true
	},
	word_status_series_enemy = {
		278390,
		103,
		true
	},
	challenge_rule = {
		278493,
		101,
		true
	},
	challenge_exit_warning = {
		278594,
		241,
		true
	},
	challenge_fleet_type_fail = {
		278835,
		141,
		true
	},
	challenge_current_level = {
		278976,
		110,
		true
	},
	challenge_current_score = {
		279086,
		104,
		true
	},
	challenge_total_score = {
		279190,
		99,
		true
	},
	challenge_current_progress = {
		279289,
		113,
		true
	},
	challenge_count_unlimit = {
		279402,
		99,
		true
	},
	challenge_no_fleet = {
		279501,
		118,
		true
	},
	equipment_skin_unload = {
		279619,
		147,
		true
	},
	equipment_skin_no_old_ship = {
		279766,
		119,
		true
	},
	equipment_skin_no_old_skinorequipment = {
		279885,
		162,
		true
	},
	equipment_skin_no_new_ship = {
		280047,
		113,
		true
	},
	equipment_skin_no_new_equipment = {
		280160,
		126,
		true
	},
	equipment_skin_count_noenough = {
		280286,
		115,
		true
	},
	equipment_skin_replace_done = {
		280401,
		120,
		true
	},
	equipment_skin_unload_failed = {
		280521,
		128,
		true
	},
	equipment_skin_unmatch_equipment = {
		280649,
		180,
		true
	},
	equipment_skin_no_equipment_tip = {
		280829,
		156,
		true
	},
	activity_pool_awards_empty = {
		280985,
		119,
		true
	},
	activity_switch_award_pool_failed = {
		281104,
		183,
		true
	},
	shop_street_activity_tip = {
		281287,
		180,
		true
	},
	shop_street_Equipment_skin_box_help = {
		281467,
		166,
		true
	},
	twitter_link_title = {
		281633,
		100,
		true
	},
	commander_material_noenough = {
		281733,
		122,
		true
	},
	battle_result_boss_destruct = {
		281855,
		132,
		true
	},
	battle_preCombatLayer_boss_destruct = {
		281987,
		140,
		true
	},
	destory_important_equipment_tip = {
		282127,
		198,
		true
	},
	destory_important_equipment_input_erro = {
		282325,
		121,
		true
	},
	activity_hit_monster_nocount = {
		282446,
		112,
		true
	},
	activity_hit_monster_death = {
		282558,
		124,
		true
	},
	activity_hit_monster_help = {
		282682,
		119,
		true
	},
	activity_hit_monster_erro = {
		282801,
		103,
		true
	},
	activity_xiaotiane_progress = {
		282904,
		107,
		true
	},
	activity_hit_monster_reset_tip = {
		283011,
		228,
		true
	},
	answer_help_tip = {
		283239,
		182,
		true
	},
	answer_answer_role = {
		283421,
		172,
		true
	},
	answer_exit_tip = {
		283593,
		112,
		true
	},
	equip_skin_detail_tip = {
		283705,
		121,
		true
	},
	emoji_type_0 = {
		283826,
		82,
		true
	},
	emoji_type_1 = {
		283908,
		83,
		true
	},
	emoji_type_2 = {
		283991,
		84,
		true
	},
	emoji_type_3 = {
		284075,
		82,
		true
	},
	emoji_type_4 = {
		284157,
		84,
		true
	},
	card_pairs_help_tip = {
		284241,
		943,
		true
	},
	card_pairs_tips = {
		285184,
		162,
		true
	},
	["card_battle_card details_deck"] = {
		285346,
		105,
		true
	},
	["card_battle_card details_hand"] = {
		285451,
		109,
		true
	},
	["card_battle_card details"] = {
		285560,
		100,
		true
	},
	["card_battle_card details_switchto_deck"] = {
		285660,
		111,
		true
	},
	["card_battle_card details_switchto_hand"] = {
		285771,
		115,
		true
	},
	card_battle_card_empty_en = {
		285886,
		106,
		true
	},
	card_battle_card_empty_ch = {
		285992,
		130,
		true
	},
	card_puzzel_goal_ch = {
		286122,
		93,
		true
	},
	card_puzzel_goal_en = {
		286215,
		89,
		true
	},
	card_puzzle_deck = {
		286304,
		84,
		true
	},
	upgrade_to_next_maxlevel_failed = {
		286388,
		181,
		true
	},
	upgrade_to_next_maxlevel_tip = {
		286569,
		240,
		true
	},
	upgrade_to_next_maxlevel_succeed = {
		286809,
		198,
		true
	},
	extra_chapter_socre_tip = {
		287007,
		173,
		true
	},
	extra_chapter_record_updated = {
		287180,
		102,
		true
	},
	extra_chapter_record_not_updated = {
		287282,
		112,
		true
	},
	extra_chapter_locked_tip = {
		287394,
		120,
		true
	},
	extra_chapter_locked_tip_1 = {
		287514,
		167,
		true
	},
	player_name_change_time_lv_tip = {
		287681,
		172,
		true
	},
	player_name_change_time_limit_tip = {
		287853,
		174,
		true
	},
	player_name_change_windows_tip = {
		288027,
		234,
		true
	},
	player_name_change_warning = {
		288261,
		247,
		true
	},
	player_name_change_success = {
		288508,
		116,
		true
	},
	player_name_change_failed = {
		288624,
		111,
		true
	},
	same_player_name_tip = {
		288735,
		109,
		true
	},
	task_is_not_existence = {
		288844,
		112,
		true
	},
	cannot_build_multiple_printblue = {
		288956,
		366,
		true
	},
	printblue_build_success = {
		289322,
		107,
		true
	},
	printblue_build_erro = {
		289429,
		103,
		true
	},
	blueprint_mod_success = {
		289532,
		107,
		true
	},
	blueprint_mod_erro = {
		289639,
		100,
		true
	},
	technology_refresh_sucess = {
		289739,
		133,
		true
	},
	technology_refresh_erro = {
		289872,
		126,
		true
	},
	change_technology_refresh_sucess = {
		289998,
		136,
		true
	},
	change_technology_refresh_erro = {
		290134,
		130,
		true
	},
	technology_start_up = {
		290264,
		100,
		true
	},
	technology_start_erro = {
		290364,
		101,
		true
	},
	technology_stop_success = {
		290465,
		119,
		true
	},
	technology_stop_erro = {
		290584,
		111,
		true
	},
	technology_finish_success = {
		290695,
		121,
		true
	},
	technology_finish_erro = {
		290816,
		114,
		true
	},
	blueprint_stop_success = {
		290930,
		121,
		true
	},
	blueprint_stop_erro = {
		291051,
		113,
		true
	},
	blueprint_destory_tip = {
		291164,
		119,
		true
	},
	blueprint_task_update_tip = {
		291283,
		172,
		true
	},
	blueprint_mod_addition_lock = {
		291455,
		125,
		true
	},
	blueprint_mod_word_unlock = {
		291580,
		111,
		true
	},
	blueprint_mod_skin_unlock = {
		291691,
		106,
		true
	},
	blueprint_build_consume = {
		291797,
		120,
		true
	},
	blueprint_stop_tip = {
		291917,
		180,
		true
	},
	technology_canot_refresh = {
		292097,
		153,
		true
	},
	technology_refresh_tip = {
		292250,
		138,
		true
	},
	technology_is_actived = {
		292388,
		125,
		true
	},
	technology_stop_tip = {
		292513,
		178,
		true
	},
	technology_help_text = {
		292691,
		2742,
		true
	},
	blueprint_build_time_tip = {
		295433,
		209,
		true
	},
	blueprint_cannot_build_tip = {
		295642,
		147,
		true
	},
	technology_task_none_tip = {
		295789,
		97,
		true
	},
	technology_task_build_tip = {
		295886,
		161,
		true
	},
	blueprint_commit_tip = {
		296047,
		165,
		true
	},
	buleprint_need_level_tip = {
		296212,
		141,
		true
	},
	blueprint_max_level_tip = {
		296353,
		132,
		true
	},
	ship_profile_voice_locked_intimacy = {
		296485,
		133,
		true
	},
	ship_profile_voice_locked_propose = {
		296618,
		115,
		true
	},
	ship_profile_voice_locked_propose_imas = {
		296733,
		120,
		true
	},
	ship_profile_voice_locked_design = {
		296853,
		140,
		true
	},
	ship_profile_voice_locked_meta = {
		296993,
		106,
		true
	},
	help_technolog0 = {
		297099,
		350,
		true
	},
	help_technolog = {
		297449,
		513,
		true
	},
	hide_chat_warning = {
		297962,
		115,
		true
	},
	show_chat_warning = {
		298077,
		117,
		true
	},
	help_shipblueprintui = {
		298194,
		3798,
		true
	},
	help_shipblueprintui_luck = {
		301992,
		734,
		true
	},
	anniversary_task_title_1 = {
		302726,
		175,
		true
	},
	anniversary_task_title_2 = {
		302901,
		206,
		true
	},
	anniversary_task_title_3 = {
		303107,
		177,
		true
	},
	anniversary_task_title_4 = {
		303284,
		210,
		true
	},
	anniversary_task_title_5 = {
		303494,
		184,
		true
	},
	anniversary_task_title_6 = {
		303678,
		204,
		true
	},
	anniversary_task_title_7 = {
		303882,
		202,
		true
	},
	anniversary_task_title_8 = {
		304084,
		169,
		true
	},
	anniversary_task_title_9 = {
		304253,
		193,
		true
	},
	anniversary_task_title_10 = {
		304446,
		176,
		true
	},
	anniversary_task_title_11 = {
		304622,
		160,
		true
	},
	anniversary_task_title_12 = {
		304782,
		178,
		true
	},
	anniversary_task_title_13 = {
		304960,
		195,
		true
	},
	anniversary_task_title_14 = {
		305155,
		179,
		true
	},
	charge_scene_buy_confirm = {
		305334,
		163,
		true
	},
	charge_scene_buy_confirm_gold = {
		305497,
		168,
		true
	},
	charge_scene_batch_buy_tip = {
		305665,
		189,
		true
	},
	help_level_ui = {
		305854,
		968,
		true
	},
	guild_modify_info_tip = {
		306822,
		193,
		true
	},
	ai_change_1 = {
		307015,
		118,
		true
	},
	ai_change_2 = {
		307133,
		117,
		true
	},
	activity_shop_lable = {
		307250,
		127,
		true
	},
	word_bilibili = {
		307377,
		90,
		true
	},
	levelScene_tracking_error_pre = {
		307467,
		143,
		true
	},
	ship_limit_notice = {
		307610,
		157,
		true
	},
	idle = {
		307767,
		73,
		true
	},
	main_1 = {
		307840,
		81,
		true
	},
	main_2 = {
		307921,
		81,
		true
	},
	main_3 = {
		308002,
		81,
		true
	},
	complete = {
		308083,
		84,
		true
	},
	login = {
		308167,
		74,
		true
	},
	home = {
		308241,
		74,
		true
	},
	mail = {
		308315,
		77,
		true
	},
	mission = {
		308392,
		83,
		true
	},
	mission_complete = {
		308475,
		96,
		true
	},
	wedding = {
		308571,
		77,
		true
	},
	touch_head = {
		308648,
		84,
		true
	},
	touch_body = {
		308732,
		79,
		true
	},
	touch_special = {
		308811,
		84,
		true
	},
	gold = {
		308895,
		73,
		true
	},
	oil = {
		308968,
		70,
		true
	},
	diamond = {
		309038,
		75,
		true
	},
	word_photo_mode = {
		309113,
		84,
		true
	},
	word_video_mode = {
		309197,
		82,
		true
	},
	word_save_ok = {
		309279,
		114,
		true
	},
	word_save_video = {
		309393,
		120,
		true
	},
	reflux_help_tip = {
		309513,
		974,
		true
	},
	reflux_pt_not_enough = {
		310487,
		121,
		true
	},
	reflux_word_1 = {
		310608,
		87,
		true
	},
	reflux_word_2 = {
		310695,
		85,
		true
	},
	ship_hunting_level_tips = {
		310780,
		190,
		true
	},
	acquisitionmode_is_not_open = {
		310970,
		123,
		true
	},
	collect_chapter_is_activation = {
		311093,
		140,
		true
	},
	levelScene_chapter_is_activation = {
		311233,
		189,
		true
	},
	resource_verify_warn = {
		311422,
		245,
		true
	},
	resource_verify_fail = {
		311667,
		191,
		true
	},
	resource_verify_success = {
		311858,
		122,
		true
	},
	resource_clear_all = {
		311980,
		178,
		true
	},
	acl_oil_count = {
		312158,
		87,
		true
	},
	acl_oil_total_count = {
		312245,
		99,
		true
	},
	word_take_video_tip = {
		312344,
		141,
		true
	},
	word_snapshot_share_title = {
		312485,
		118,
		true
	},
	word_snapshot_share_agreement = {
		312603,
		540,
		true
	},
	skin_remain_time = {
		313143,
		91,
		true
	},
	word_museum_1 = {
		313234,
		120,
		true
	},
	word_museum_help = {
		313354,
		734,
		true
	},
	goldship_help_tip = {
		314088,
		787,
		true
	},
	metalgearsub_help_tip = {
		314875,
		1847,
		true
	},
	acl_gold_count = {
		316722,
		91,
		true
	},
	acl_gold_total_count = {
		316813,
		102,
		true
	},
	discount_time = {
		316915,
		146,
		true
	},
	commander_talent_not_exist = {
		317061,
		132,
		true
	},
	commander_replace_talent_not_exist = {
		317193,
		154,
		true
	},
	commander_talent_learned = {
		317347,
		121,
		true
	},
	commander_talent_learn_erro = {
		317468,
		133,
		true
	},
	commander_not_exist = {
		317601,
		114,
		true
	},
	commander_fleet_not_exist = {
		317715,
		115,
		true
	},
	commander_fleet_pos_not_exist = {
		317830,
		128,
		true
	},
	commander_equip_to_fleet_erro = {
		317958,
		140,
		true
	},
	commander_acquire_erro = {
		318098,
		138,
		true
	},
	commander_lock_erro = {
		318236,
		121,
		true
	},
	commander_reset_talent_time_no_rearch = {
		318357,
		157,
		true
	},
	commander_reset_talent_is_not_need = {
		318514,
		125,
		true
	},
	commander_reset_talent_success = {
		318639,
		118,
		true
	},
	commander_reset_talent_erro = {
		318757,
		136,
		true
	},
	commander_can_not_be_upgrade = {
		318893,
		133,
		true
	},
	commander_anyone_is_in_fleet = {
		319026,
		139,
		true
	},
	commander_is_in_fleet = {
		319165,
		133,
		true
	},
	commander_play_erro = {
		319298,
		104,
		true
	},
	ship_equip_same_group_equipment = {
		319402,
		136,
		true
	},
	summary_page_un_rearch = {
		319538,
		96,
		true
	},
	player_summary_from = {
		319634,
		97,
		true
	},
	player_summary_data = {
		319731,
		95,
		true
	},
	commander_exp_overflow_tip = {
		319826,
		192,
		true
	},
	commander_reset_talent_tip = {
		320018,
		141,
		true
	},
	commander_reset_talent = {
		320159,
		96,
		true
	},
	commander_select_min_cnt = {
		320255,
		127,
		true
	},
	commander_select_max = {
		320382,
		123,
		true
	},
	commander_lock_done = {
		320505,
		101,
		true
	},
	commander_unlock_done = {
		320606,
		105,
		true
	},
	commander_get_1 = {
		320711,
		127,
		true
	},
	commander_get = {
		320838,
		139,
		true
	},
	commander_build_done = {
		320977,
		114,
		true
	},
	commander_build_erro = {
		321091,
		117,
		true
	},
	commander_get_skills_done = {
		321208,
		132,
		true
	},
	collection_way_is_unopen = {
		321340,
		115,
		true
	},
	commander_can_not_select_same_group = {
		321455,
		162,
		true
	},
	commander_capcity_is_max = {
		321617,
		115,
		true
	},
	commander_reserve_count_is_max = {
		321732,
		128,
		true
	},
	commander_build_pool_tip = {
		321860,
		143,
		true
	},
	commander_select_matiral_erro = {
		322003,
		212,
		true
	},
	commander_material_is_rarity = {
		322215,
		156,
		true
	},
	commander_material_is_maxLevel = {
		322371,
		200,
		true
	},
	charge_commander_bag_max = {
		322571,
		161,
		true
	},
	shop_extendcommander_success = {
		322732,
		148,
		true
	},
	commander_skill_point_noengough = {
		322880,
		144,
		true
	},
	buildship_new_tip = {
		323024,
		160,
		true
	},
	buildship_heavy_tip = {
		323184,
		142,
		true
	},
	buildship_light_tip = {
		323326,
		154,
		true
	},
	buildship_special_tip = {
		323480,
		156,
		true
	},
	Normalbuild_URexchange_help = {
		323636,
		615,
		true
	},
	Normalbuild_URexchange_text1 = {
		324251,
		103,
		true
	},
	Normalbuild_URexchange_text2 = {
		324354,
		97,
		true
	},
	Normalbuild_URexchange_text3 = {
		324451,
		103,
		true
	},
	Normalbuild_URexchange_text4 = {
		324554,
		100,
		true
	},
	Normalbuild_URexchange_warning1 = {
		324654,
		128,
		true
	},
	Normalbuild_URexchange_warning3 = {
		324782,
		207,
		true
	},
	Normalbuild_URexchange_confirm = {
		324989,
		121,
		true
	},
	open_skill_pos = {
		325110,
		209,
		true
	},
	open_skill_pos_discount = {
		325319,
		239,
		true
	},
	event_recommend_fail = {
		325558,
		124,
		true
	},
	newplayer_help_tip = {
		325682,
		988,
		true
	},
	newplayer_notice_1 = {
		326670,
		125,
		true
	},
	newplayer_notice_2 = {
		326795,
		125,
		true
	},
	newplayer_notice_3 = {
		326920,
		117,
		true
	},
	newplayer_notice_4 = {
		327037,
		121,
		true
	},
	newplayer_notice_5 = {
		327158,
		119,
		true
	},
	newplayer_notice_6 = {
		327277,
		171,
		true
	},
	newplayer_notice_7 = {
		327448,
		124,
		true
	},
	newplayer_notice_8 = {
		327572,
		149,
		true
	},
	tec_catchup_1 = {
		327721,
		85,
		true
	},
	tec_catchup_2 = {
		327806,
		85,
		true
	},
	tec_catchup_3 = {
		327891,
		85,
		true
	},
	tec_catchup_4 = {
		327976,
		85,
		true
	},
	tec_catchup_5 = {
		328061,
		85,
		true
	},
	tec_notice = {
		328146,
		124,
		true
	},
	tec_notice_not_open_tip = {
		328270,
		141,
		true
	},
	apply_permission_camera_tip1 = {
		328411,
		181,
		true
	},
	apply_permission_camera_tip2 = {
		328592,
		187,
		true
	},
	apply_permission_camera_tip3 = {
		328779,
		177,
		true
	},
	apply_permission_record_audio_tip1 = {
		328956,
		163,
		true
	},
	apply_permission_record_audio_tip2 = {
		329119,
		197,
		true
	},
	apply_permission_record_audio_tip3 = {
		329316,
		183,
		true
	},
	nine_choose_one = {
		329499,
		269,
		true
	},
	help_commander_info = {
		329768,
		810,
		true
	},
	help_commander_play = {
		330578,
		810,
		true
	},
	help_commander_ability = {
		331388,
		813,
		true
	},
	story_skip_confirm = {
		332201,
		215,
		true
	},
	commander_ability_replace_warning = {
		332416,
		205,
		true
	},
	help_command_room = {
		332621,
		808,
		true
	},
	commander_build_rate_tip = {
		333429,
		154,
		true
	},
	help_activity_bossbattle = {
		333583,
		1040,
		true
	},
	commander_is_in_fleet_already = {
		334623,
		141,
		true
	},
	commander_material_is_in_fleet_tip = {
		334764,
		167,
		true
	},
	commander_main_pos = {
		334931,
		93,
		true
	},
	commander_assistant_pos = {
		335024,
		96,
		true
	},
	comander_repalce_tip = {
		335120,
		200,
		true
	},
	commander_lock_tip = {
		335320,
		121,
		true
	},
	commander_is_in_battle = {
		335441,
		125,
		true
	},
	commander_rename_warning = {
		335566,
		143,
		true
	},
	commander_rename_coldtime_tip = {
		335709,
		154,
		true
	},
	commander_rename_success_tip = {
		335863,
		115,
		true
	},
	amercian_notice_1 = {
		335978,
		170,
		true
	},
	amercian_notice_2 = {
		336148,
		131,
		true
	},
	amercian_notice_3 = {
		336279,
		104,
		true
	},
	amercian_notice_4 = {
		336383,
		92,
		true
	},
	amercian_notice_5 = {
		336475,
		112,
		true
	},
	amercian_notice_6 = {
		336587,
		222,
		true
	},
	ranking_word_1 = {
		336809,
		89,
		true
	},
	ranking_word_2 = {
		336898,
		93,
		true
	},
	ranking_word_3 = {
		336991,
		91,
		true
	},
	ranking_word_4 = {
		337082,
		93,
		true
	},
	ranking_word_5 = {
		337175,
		82,
		true
	},
	ranking_word_6 = {
		337257,
		91,
		true
	},
	ranking_word_7 = {
		337348,
		90,
		true
	},
	ranking_word_8 = {
		337438,
		82,
		true
	},
	ranking_word_9 = {
		337520,
		83,
		true
	},
	ranking_word_10 = {
		337603,
		94,
		true
	},
	spece_illegal_tip = {
		337697,
		99,
		true
	},
	utaware_warmup_notice = {
		337796,
		902,
		true
	},
	utaware_formal_notice = {
		338698,
		648,
		true
	},
	npc_learn_skill_tip = {
		339346,
		250,
		true
	},
	npc_upgrade_max_level = {
		339596,
		147,
		true
	},
	npc_propse_tip = {
		339743,
		113,
		true
	},
	npc_strength_tip = {
		339856,
		209,
		true
	},
	npc_breakout_tip = {
		340065,
		210,
		true
	},
	word_chuansong = {
		340275,
		95,
		true
	},
	npc_evaluation_tip = {
		340370,
		145,
		true
	},
	map_event_skip = {
		340515,
		90,
		true
	},
	map_event_stop_tip = {
		340605,
		163,
		true
	},
	map_event_stop_battle_tip = {
		340768,
		172,
		true
	},
	map_event_stop_battle_tip_2 = {
		340940,
		151,
		true
	},
	map_event_stop_story_tip = {
		341091,
		167,
		true
	},
	map_event_save_nekone = {
		341258,
		136,
		true
	},
	map_event_save_rurutie = {
		341394,
		139,
		true
	},
	map_event_memory_collected = {
		341533,
		152,
		true
	},
	map_event_save_kizuna = {
		341685,
		140,
		true
	},
	five_choose_one = {
		341825,
		201,
		true
	},
	ship_preference_common = {
		342026,
		107,
		true
	},
	draw_big_luck_1 = {
		342133,
		116,
		true
	},
	draw_big_luck_2 = {
		342249,
		127,
		true
	},
	draw_big_luck_3 = {
		342376,
		131,
		true
	},
	draw_medium_luck_1 = {
		342507,
		124,
		true
	},
	draw_medium_luck_2 = {
		342631,
		122,
		true
	},
	draw_medium_luck_3 = {
		342753,
		133,
		true
	},
	draw_little_luck_1 = {
		342886,
		128,
		true
	},
	draw_little_luck_2 = {
		343014,
		124,
		true
	},
	draw_little_luck_3 = {
		343138,
		134,
		true
	},
	ship_preference_non = {
		343272,
		106,
		true
	},
	school_title_dajiangtang = {
		343378,
		101,
		true
	},
	school_title_zhihuimiao = {
		343479,
		95,
		true
	},
	school_title_shitang = {
		343574,
		92,
		true
	},
	school_title_xiaomaibu = {
		343666,
		95,
		true
	},
	school_title_shangdian = {
		343761,
		94,
		true
	},
	school_title_xueyuan = {
		343855,
		98,
		true
	},
	school_title_shoucang = {
		343953,
		95,
		true
	},
	school_title_xiaoyouxiting = {
		344048,
		96,
		true
	},
	tag_level_fighting = {
		344144,
		93,
		true
	},
	tag_level_oni = {
		344237,
		89,
		true
	},
	tag_level_bomb = {
		344326,
		90,
		true
	},
	ui_word_levelui2_inevent = {
		344416,
		97,
		true
	},
	exit_backyard_exp_display = {
		344513,
		125,
		true
	},
	help_monopoly = {
		344638,
		1634,
		true
	},
	md5_error = {
		346272,
		120,
		true
	},
	world_boss_help = {
		346392,
		4737,
		true
	},
	world_boss_tip = {
		351129,
		193,
		true
	},
	world_boss_award_limit = {
		351322,
		157,
		true
	},
	backyard_is_loading = {
		351479,
		104,
		true
	},
	levelScene_loop_help_tip = {
		351583,
		2782,
		true
	},
	no_airspace_competition = {
		354365,
		104,
		true
	},
	air_supremacy_value = {
		354469,
		101,
		true
	},
	read_the_user_agreement = {
		354570,
		146,
		true
	},
	award_max_warning = {
		354716,
		175,
		true
	},
	sub_item_warning = {
		354891,
		140,
		true
	},
	select_award_warning = {
		355031,
		126,
		true
	},
	no_item_selected_tip = {
		355157,
		119,
		true
	},
	backyard_traning_tip = {
		355276,
		160,
		true
	},
	backyard_rest_tip = {
		355436,
		122,
		true
	},
	backyard_class_tip = {
		355558,
		122,
		true
	},
	medal_notice_1 = {
		355680,
		95,
		true
	},
	medal_notice_2 = {
		355775,
		86,
		true
	},
	medal_help_tip = {
		355861,
		1522,
		true
	},
	trophy_achieved = {
		357383,
		94,
		true
	},
	text_shop = {
		357477,
		77,
		true
	},
	text_confirm = {
		357554,
		83,
		true
	},
	text_cancel = {
		357637,
		81,
		true
	},
	text_cancel_fight = {
		357718,
		93,
		true
	},
	text_goon_fight = {
		357811,
		87,
		true
	},
	text_exit = {
		357898,
		77,
		true
	},
	text_clear = {
		357975,
		79,
		true
	},
	text_apply = {
		358054,
		83,
		true
	},
	text_buy = {
		358137,
		75,
		true
	},
	text_forward = {
		358212,
		78,
		true
	},
	text_prepage = {
		358290,
		80,
		true
	},
	text_nextpage = {
		358370,
		81,
		true
	},
	text_exchange = {
		358451,
		85,
		true
	},
	text_retreat = {
		358536,
		83,
		true
	},
	text_goto = {
		358619,
		80,
		true
	},
	level_scene_title_word_1 = {
		358699,
		100,
		true
	},
	level_scene_title_word_2 = {
		358799,
		108,
		true
	},
	level_scene_title_word_3 = {
		358907,
		100,
		true
	},
	level_scene_title_word_4 = {
		359007,
		97,
		true
	},
	level_scene_title_word_5 = {
		359104,
		97,
		true
	},
	ambush_display_0 = {
		359201,
		89,
		true
	},
	ambush_display_1 = {
		359290,
		84,
		true
	},
	ambush_display_2 = {
		359374,
		85,
		true
	},
	ambush_display_3 = {
		359459,
		83,
		true
	},
	ambush_display_4 = {
		359542,
		86,
		true
	},
	ambush_display_5 = {
		359628,
		84,
		true
	},
	ambush_display_6 = {
		359712,
		86,
		true
	},
	black_white_grid_notice = {
		359798,
		1416,
		true
	},
	black_white_grid_reset = {
		361214,
		104,
		true
	},
	black_white_grid_switch_tip = {
		361318,
		122,
		true
	},
	no_way_to_escape = {
		361440,
		93,
		true
	},
	word_attr_ac = {
		361533,
		92,
		true
	},
	help_battle_ac = {
		361625,
		2193,
		true
	},
	help_attribute_dodge_limit = {
		363818,
		388,
		true
	},
	refuse_friend = {
		364206,
		105,
		true
	},
	refuse_and_add_into_bl = {
		364311,
		108,
		true
	},
	tech_simulate_closed = {
		364419,
		141,
		true
	},
	tech_simulate_quit = {
		364560,
		126,
		true
	},
	technology_uplevel_error_no_res = {
		364686,
		244,
		true
	},
	help_technologytree = {
		364930,
		2458,
		true
	},
	tech_change_version_mark = {
		367388,
		108,
		true
	},
	technology_uplevel_error_studying = {
		367496,
		196,
		true
	},
	fate_attr_word = {
		367692,
		105,
		true
	},
	fate_phase_word = {
		367797,
		98,
		true
	},
	blueprint_simulation_confirm = {
		367895,
		245,
		true
	},
	blueprint_simulation_confirm_19901 = {
		368140,
		416,
		true
	},
	blueprint_simulation_confirm_19902 = {
		368556,
		397,
		true
	},
	blueprint_simulation_confirm_39903 = {
		368953,
		398,
		true
	},
	blueprint_simulation_confirm_39904 = {
		369351,
		415,
		true
	},
	blueprint_simulation_confirm_49902 = {
		369766,
		413,
		true
	},
	blueprint_simulation_confirm_99901 = {
		370179,
		412,
		true
	},
	blueprint_simulation_confirm_29903 = {
		370591,
		374,
		true
	},
	blueprint_simulation_confirm_29904 = {
		370965,
		381,
		true
	},
	blueprint_simulation_confirm_49903 = {
		371346,
		374,
		true
	},
	blueprint_simulation_confirm_49904 = {
		371720,
		384,
		true
	},
	blueprint_simulation_confirm_89902 = {
		372104,
		380,
		true
	},
	blueprint_simulation_confirm_19903 = {
		372484,
		406,
		true
	},
	blueprint_simulation_confirm_39905 = {
		372890,
		349,
		true
	},
	blueprint_simulation_confirm_49905 = {
		373239,
		409,
		true
	},
	blueprint_simulation_confirm_49906 = {
		373648,
		339,
		true
	},
	blueprint_simulation_confirm_69901 = {
		373987,
		421,
		true
	},
	blueprint_simulation_confirm_29905 = {
		374408,
		398,
		true
	},
	blueprint_simulation_confirm_49907 = {
		374806,
		406,
		true
	},
	blueprint_simulation_confirm_59901 = {
		375212,
		396,
		true
	},
	blueprint_simulation_confirm_79901 = {
		375608,
		347,
		true
	},
	blueprint_simulation_confirm_89903 = {
		375955,
		416,
		true
	},
	blueprint_simulation_confirm_19904 = {
		376371,
		423,
		true
	},
	blueprint_simulation_confirm_39906 = {
		376794,
		430,
		true
	},
	blueprint_simulation_confirm_49908 = {
		377224,
		441,
		true
	},
	blueprint_simulation_confirm_49909 = {
		377665,
		440,
		true
	},
	blueprint_simulation_confirm_99902 = {
		378105,
		431,
		true
	},
	electrotherapy_wanning = {
		378536,
		125,
		true
	},
	siren_chase_warning = {
		378661,
		104,
		true
	},
	memorybook_get_award_tip = {
		378765,
		173,
		true
	},
	memorybook_notice = {
		378938,
		548,
		true
	},
	word_votes = {
		379486,
		79,
		true
	},
	number_0 = {
		379565,
		73,
		true
	},
	intimacy_desc_propose_vertical = {
		379638,
		340,
		true
	},
	without_selected_ship = {
		379978,
		101,
		true
	},
	index_all = {
		380079,
		76,
		true
	},
	index_fleetfront = {
		380155,
		89,
		true
	},
	index_fleetrear = {
		380244,
		84,
		true
	},
	index_shipType_quZhu = {
		380328,
		86,
		true
	},
	index_shipType_qinXun = {
		380414,
		87,
		true
	},
	index_shipType_zhongXun = {
		380501,
		89,
		true
	},
	index_shipType_zhanLie = {
		380590,
		88,
		true
	},
	index_shipType_hangMu = {
		380678,
		87,
		true
	},
	index_shipType_weiXiu = {
		380765,
		87,
		true
	},
	index_shipType_qianTing = {
		380852,
		89,
		true
	},
	index_other = {
		380941,
		79,
		true
	},
	index_rare2 = {
		381020,
		81,
		true
	},
	index_rare3 = {
		381101,
		79,
		true
	},
	index_rare4 = {
		381180,
		80,
		true
	},
	index_rare5 = {
		381260,
		85,
		true
	},
	index_rare6 = {
		381345,
		80,
		true
	},
	warning_mail_max_1 = {
		381425,
		189,
		true
	},
	warning_mail_max_2 = {
		381614,
		103,
		true
	},
	return_award_bind_success = {
		381717,
		110,
		true
	},
	return_award_bind_erro = {
		381827,
		106,
		true
	},
	rename_commander_erro = {
		381933,
		111,
		true
	},
	change_display_medal_success = {
		382044,
		123,
		true
	},
	limit_skin_time_day = {
		382167,
		103,
		true
	},
	limit_skin_time_day_min = {
		382270,
		108,
		true
	},
	limit_skin_time_min = {
		382378,
		106,
		true
	},
	limit_skin_time_overtime = {
		382484,
		136,
		true
	},
	limit_skin_time_before_maintenance = {
		382620,
		110,
		true
	},
	award_window_pt_title = {
		382730,
		101,
		true
	},
	return_have_participated_in_act = {
		382831,
		140,
		true
	},
	input_returner_code = {
		382971,
		92,
		true
	},
	dress_up_success = {
		383063,
		115,
		true
	},
	already_have_the_skin = {
		383178,
		111,
		true
	},
	exchange_limit_skin_tip = {
		383289,
		188,
		true
	},
	returner_help = {
		383477,
		1939,
		true
	},
	attire_time_stamp = {
		385416,
		90,
		true
	},
	pray_build_select_ship_instruction = {
		385506,
		117,
		true
	},
	warning_pray_build_pool = {
		385623,
		212,
		true
	},
	error_pray_select_ship_max = {
		385835,
		113,
		true
	},
	tip_pray_build_pool_success = {
		385948,
		118,
		true
	},
	tip_pray_build_pool_fail = {
		386066,
		116,
		true
	},
	pray_build_help = {
		386182,
		2286,
		true
	},
	pray_build_UR_warning = {
		388468,
		130,
		true
	},
	bismarck_award_tip = {
		388598,
		118,
		true
	},
	bismarck_chapter_desc = {
		388716,
		171,
		true
	},
	returner_push_success = {
		388887,
		115,
		true
	},
	returner_max_count = {
		389002,
		126,
		true
	},
	returner_push_tip = {
		389128,
		240,
		true
	},
	returner_match_tip = {
		389368,
		232,
		true
	},
	return_lock_tip = {
		389600,
		134,
		true
	},
	challenge_help = {
		389734,
		1901,
		true
	},
	challenge_casual_reset = {
		391635,
		138,
		true
	},
	challenge_infinite_reset = {
		391773,
		153,
		true
	},
	challenge_normal_reset = {
		391926,
		132,
		true
	},
	challenge_casual_click_switch = {
		392058,
		184,
		true
	},
	challenge_infinite_click_switch = {
		392242,
		189,
		true
	},
	challenge_season_update = {
		392431,
		126,
		true
	},
	challenge_season_update_casual_clear = {
		392557,
		240,
		true
	},
	challenge_season_update_infinite_clear = {
		392797,
		245,
		true
	},
	challenge_season_update_casual_switch = {
		393042,
		274,
		true
	},
	challenge_season_update_infinite_switch = {
		393316,
		286,
		true
	},
	challenge_combat_score = {
		393602,
		101,
		true
	},
	challenge_share_progress = {
		393703,
		107,
		true
	},
	challenge_share = {
		393810,
		85,
		true
	},
	challenge_expire_warn = {
		393895,
		170,
		true
	},
	challenge_normal_tip = {
		394065,
		146,
		true
	},
	challenge_unlimited_tip = {
		394211,
		151,
		true
	},
	commander_prefab_rename_success = {
		394362,
		118,
		true
	},
	commander_prefab_name = {
		394480,
		92,
		true
	},
	commander_prefab_rename_time = {
		394572,
		145,
		true
	},
	commander_build_solt_deficiency = {
		394717,
		159,
		true
	},
	commander_select_box_tip = {
		394876,
		172,
		true
	},
	challenge_end_tip = {
		395048,
		107,
		true
	},
	pass_times = {
		395155,
		87,
		true
	},
	list_empty_tip_billboardui = {
		395242,
		116,
		true
	},
	list_empty_tip_equipmentdesignui = {
		395358,
		126,
		true
	},
	list_empty_tip_storehouseui_equip = {
		395484,
		121,
		true
	},
	list_empty_tip_storehouseui_item = {
		395605,
		125,
		true
	},
	list_empty_tip_eventui = {
		395730,
		118,
		true
	},
	list_empty_tip_guildrequestui = {
		395848,
		123,
		true
	},
	list_empty_tip_joinguildui = {
		395971,
		137,
		true
	},
	list_empty_tip_friendui = {
		396108,
		114,
		true
	},
	list_empty_tip_friendui_search = {
		396222,
		145,
		true
	},
	list_empty_tip_friendui_request = {
		396367,
		132,
		true
	},
	list_empty_tip_friendui_black = {
		396499,
		136,
		true
	},
	list_empty_tip_dockyardui = {
		396635,
		135,
		true
	},
	list_empty_tip_taskscene = {
		396770,
		120,
		true
	},
	empty_tip_mailboxui = {
		396890,
		107,
		true
	},
	words_settings_unlock_ship = {
		396997,
		105,
		true
	},
	words_settings_resolve_equip = {
		397102,
		107,
		true
	},
	words_settings_unlock_commander = {
		397209,
		116,
		true
	},
	words_settings_create_inherit = {
		397325,
		109,
		true
	},
	tips_fail_secondarypwd_much_times = {
		397434,
		185,
		true
	},
	words_desc_unlock = {
		397619,
		131,
		true
	},
	words_desc_resolve_equip = {
		397750,
		138,
		true
	},
	words_desc_create_inherit = {
		397888,
		105,
		true
	},
	words_desc_close_password = {
		397993,
		123,
		true
	},
	words_desc_change_settings = {
		398116,
		137,
		true
	},
	words_set_password = {
		398253,
		107,
		true
	},
	words_information = {
		398360,
		85,
		true
	},
	Word_Ship_Exp_Buff = {
		398445,
		92,
		true
	},
	secondarypassword_incorrectpwd_error = {
		398537,
		193,
		true
	},
	secondary_password_help = {
		398730,
		1501,
		true
	},
	comic_help = {
		400231,
		365,
		true
	},
	secondarypassword_illegal_tip = {
		400596,
		135,
		true
	},
	pt_cosume = {
		400731,
		80,
		true
	},
	secondarypassword_confirm_tips = {
		400811,
		178,
		true
	},
	help_tempesteve = {
		400989,
		800,
		true
	},
	word_rest_times = {
		401789,
		118,
		true
	},
	common_buy_gold_success = {
		401907,
		144,
		true
	},
	harbour_bomb_tip = {
		402051,
		110,
		true
	},
	submarine_approach = {
		402161,
		101,
		true
	},
	submarine_approach_desc = {
		402262,
		130,
		true
	},
	desc_quick_play = {
		402392,
		91,
		true
	},
	text_win_condition = {
		402483,
		97,
		true
	},
	text_lose_condition = {
		402580,
		99,
		true
	},
	text_rest_HP = {
		402679,
		93,
		true
	},
	desc_defense_reward = {
		402772,
		152,
		true
	},
	desc_base_hp = {
		402924,
		99,
		true
	},
	map_event_open = {
		403023,
		105,
		true
	},
	word_reward = {
		403128,
		82,
		true
	},
	tips_dispense_completed = {
		403210,
		103,
		true
	},
	tips_firework_completed = {
		403313,
		116,
		true
	},
	help_summer_feast = {
		403429,
		1164,
		true
	},
	help_firework_produce = {
		404593,
		668,
		true
	},
	help_firework = {
		405261,
		1685,
		true
	},
	help_summer_shrine = {
		406946,
		1066,
		true
	},
	help_summer_food = {
		408012,
		1622,
		true
	},
	help_summer_shooting = {
		409634,
		1075,
		true
	},
	help_summer_stamp = {
		410709,
		341,
		true
	},
	tips_summergame_exit = {
		411050,
		198,
		true
	},
	tips_shrine_buff = {
		411248,
		121,
		true
	},
	tips_shrine_nobuff = {
		411369,
		175,
		true
	},
	paint_hide_other_obj_tip = {
		411544,
		111,
		true
	},
	help_vote = {
		411655,
		6103,
		true
	},
	tips_firework_exit = {
		417758,
		157,
		true
	},
	result_firework_produce = {
		417915,
		148,
		true
	},
	tag_level_narrative = {
		418063,
		88,
		true
	},
	vote_get_book = {
		418151,
		115,
		true
	},
	vote_book_is_over = {
		418266,
		115,
		true
	},
	vote_fame_tip = {
		418381,
		167,
		true
	},
	word_maintain = {
		418548,
		94,
		true
	},
	name_zhanliejahe = {
		418642,
		97,
		true
	},
	change_skin_secretary_ship_success = {
		418739,
		124,
		true
	},
	change_skin_secretary_ship = {
		418863,
		103,
		true
	},
	word_billboard = {
		418966,
		86,
		true
	},
	word_easy = {
		419052,
		77,
		true
	},
	word_normal_junhe = {
		419129,
		87,
		true
	},
	word_hard = {
		419216,
		77,
		true
	},
	word_special_challenge_ticket = {
		419293,
		105,
		true
	},
	tip_exchange_ticket = {
		419398,
		177,
		true
	},
	dont_remind = {
		419575,
		89,
		true
	},
	worldbossex_help = {
		419664,
		909,
		true
	},
	ship_formationUI_fleetName_easy = {
		420573,
		99,
		true
	},
	ship_formationUI_fleetName_normal = {
		420672,
		103,
		true
	},
	ship_formationUI_fleetName_hard = {
		420775,
		99,
		true
	},
	ship_formationUI_fleetName_extra = {
		420874,
		98,
		true
	},
	ship_formationUI_fleetName_easy_ss = {
		420972,
		114,
		true
	},
	ship_formationUI_fleetName_normal_ss = {
		421086,
		118,
		true
	},
	ship_formationUI_fleetName_hard_ss = {
		421204,
		114,
		true
	},
	ship_formationUI_fleetName_extra_ss = {
		421318,
		113,
		true
	},
	text_consume = {
		421431,
		80,
		true
	},
	text_inconsume = {
		421511,
		80,
		true
	},
	pt_ship_now = {
		421591,
		93,
		true
	},
	pt_ship_goal = {
		421684,
		81,
		true
	},
	option_desc1 = {
		421765,
		165,
		true
	},
	option_desc2 = {
		421930,
		158,
		true
	},
	option_desc3 = {
		422088,
		167,
		true
	},
	option_desc4 = {
		422255,
		202,
		true
	},
	option_desc5 = {
		422457,
		140,
		true
	},
	option_desc6 = {
		422597,
		155,
		true
	},
	option_desc10 = {
		422752,
		143,
		true
	},
	option_desc11 = {
		422895,
		1748,
		true
	},
	music_collection = {
		424643,
		859,
		true
	},
	music_main = {
		425502,
		1073,
		true
	},
	music_juus = {
		426575,
		574,
		true
	},
	doa_collection = {
		427149,
		846,
		true
	},
	ins_word_day = {
		427995,
		88,
		true
	},
	ins_word_hour = {
		428083,
		89,
		true
	},
	ins_word_minu = {
		428172,
		91,
		true
	},
	ins_word_like = {
		428263,
		85,
		true
	},
	ins_click_like_success = {
		428348,
		106,
		true
	},
	ins_push_comment_success = {
		428454,
		120,
		true
	},
	skinshop_live2d_fliter_failed = {
		428574,
		146,
		true
	},
	help_music_game = {
		428720,
		1355,
		true
	},
	restart_music_game = {
		430075,
		130,
		true
	},
	reselect_music_game = {
		430205,
		144,
		true
	},
	hololive_goodmorning = {
		430349,
		852,
		true
	},
	hololive_lianliankan = {
		431201,
		1410,
		true
	},
	hololive_dalaozhang = {
		432611,
		764,
		true
	},
	hololive_dashenling = {
		433375,
		1927,
		true
	},
	pocky_jiujiu = {
		435302,
		94,
		true
	},
	pocky_jiujiu_desc = {
		435396,
		118,
		true
	},
	pocky_help = {
		435514,
		697,
		true
	},
	secretary_help = {
		436211,
		2209,
		true
	},
	secretary_unlock2 = {
		438420,
		108,
		true
	},
	secretary_unlock3 = {
		438528,
		108,
		true
	},
	secretary_unlock4 = {
		438636,
		108,
		true
	},
	secretary_unlock5 = {
		438744,
		109,
		true
	},
	secretary_closed = {
		438853,
		88,
		true
	},
	confirm_unlock = {
		438941,
		113,
		true
	},
	secretary_pos_save = {
		439054,
		143,
		true
	},
	secretary_pos_save_success = {
		439197,
		105,
		true
	},
	collection_help = {
		439302,
		346,
		true
	},
	juese_tiyan = {
		439648,
		239,
		true
	},
	resolve_amount_prefix = {
		439887,
		104,
		true
	},
	compose_amount_prefix = {
		439991,
		100,
		true
	},
	help_sub_limits = {
		440091,
		92,
		true
	},
	help_sub_display = {
		440183,
		104,
		true
	},
	confirm_unlock_ship_main = {
		440287,
		151,
		true
	},
	msgbox_text_confirm = {
		440438,
		90,
		true
	},
	msgbox_text_shop = {
		440528,
		85,
		true
	},
	msgbox_text_cancel = {
		440613,
		88,
		true
	},
	msgbox_text_cancel_g = {
		440701,
		90,
		true
	},
	msgbox_text_cancel_fight = {
		440791,
		100,
		true
	},
	msgbox_text_goon_fight = {
		440891,
		94,
		true
	},
	msgbox_text_exit = {
		440985,
		84,
		true
	},
	msgbox_text_clear = {
		441069,
		86,
		true
	},
	msgbox_text_apply = {
		441155,
		85,
		true
	},
	msgbox_text_buy = {
		441240,
		87,
		true
	},
	msgbox_text_noPos_buy = {
		441327,
		91,
		true
	},
	msgbox_text_noPos_clear = {
		441418,
		91,
		true
	},
	msgbox_text_noPos_intensify = {
		441509,
		98,
		true
	},
	msgbox_text_forward = {
		441607,
		85,
		true
	},
	msgbox_text_iknow = {
		441692,
		87,
		true
	},
	msgbox_text_prepage = {
		441779,
		87,
		true
	},
	msgbox_text_nextpage = {
		441866,
		88,
		true
	},
	msgbox_text_exchange = {
		441954,
		92,
		true
	},
	msgbox_text_retreat = {
		442046,
		90,
		true
	},
	msgbox_text_go = {
		442136,
		80,
		true
	},
	msgbox_text_consume = {
		442216,
		87,
		true
	},
	msgbox_text_inconsume = {
		442303,
		87,
		true
	},
	msgbox_text_unlock = {
		442390,
		88,
		true
	},
	msgbox_text_save = {
		442478,
		85,
		true
	},
	msgbox_text_replace = {
		442563,
		88,
		true
	},
	msgbox_text_unload = {
		442651,
		89,
		true
	},
	msgbox_text_modify = {
		442740,
		89,
		true
	},
	msgbox_text_breakthrough = {
		442829,
		93,
		true
	},
	msgbox_text_equipdetail = {
		442922,
		94,
		true
	},
	msgbox_text_use = {
		443016,
		82,
		true
	},
	common_flag_ship = {
		443098,
		89,
		true
	},
	fenjie_lantu_tip = {
		443187,
		188,
		true
	},
	msgbox_text_analyse = {
		443375,
		90,
		true
	},
	fragresolve_empty_tip = {
		443465,
		151,
		true
	},
	confirm_unlock_lv = {
		443616,
		121,
		true
	},
	shops_rest_day = {
		443737,
		98,
		true
	},
	title_limit_time = {
		443835,
		91,
		true
	},
	seven_choose_one = {
		443926,
		224,
		true
	},
	help_newyear_feast = {
		444150,
		1386,
		true
	},
	help_newyear_shrine = {
		445536,
		1243,
		true
	},
	help_newyear_stamp = {
		446779,
		238,
		true
	},
	pt_reconfirm = {
		447017,
		124,
		true
	},
	qte_game_help = {
		447141,
		340,
		true
	},
	word_equipskin_type = {
		447481,
		88,
		true
	},
	word_equipskin_all = {
		447569,
		86,
		true
	},
	word_equipskin_cannon = {
		447655,
		95,
		true
	},
	word_equipskin_tarpedo = {
		447750,
		96,
		true
	},
	word_equipskin_aircraft = {
		447846,
		96,
		true
	},
	word_equipskin_aux = {
		447942,
		86,
		true
	},
	msgbox_repair = {
		448028,
		91,
		true
	},
	msgbox_repair_l2d = {
		448119,
		95,
		true
	},
	msgbox_repair_painting = {
		448214,
		105,
		true
	},
	word_no_cache = {
		448319,
		107,
		true
	},
	pile_game_notice = {
		448426,
		993,
		true
	},
	help_chunjie_stamp = {
		449419,
		677,
		true
	},
	help_chunjie_feast = {
		450096,
		670,
		true
	},
	help_chunjie_jiulou = {
		450766,
		848,
		true
	},
	special_animal1 = {
		451614,
		227,
		true
	},
	special_animal2 = {
		451841,
		287,
		true
	},
	special_animal3 = {
		452128,
		236,
		true
	},
	special_animal4 = {
		452364,
		256,
		true
	},
	special_animal5 = {
		452620,
		251,
		true
	},
	special_animal6 = {
		452871,
		272,
		true
	},
	special_animal7 = {
		453143,
		275,
		true
	},
	bulin_help = {
		453418,
		403,
		true
	},
	super_bulin = {
		453821,
		120,
		true
	},
	super_bulin_tip = {
		453941,
		110,
		true
	},
	bulin_tip1 = {
		454051,
		101,
		true
	},
	bulin_tip2 = {
		454152,
		117,
		true
	},
	bulin_tip3 = {
		454269,
		101,
		true
	},
	bulin_tip4 = {
		454370,
		108,
		true
	},
	bulin_tip5 = {
		454478,
		101,
		true
	},
	bulin_tip6 = {
		454579,
		108,
		true
	},
	bulin_tip7 = {
		454687,
		101,
		true
	},
	bulin_tip8 = {
		454788,
		126,
		true
	},
	bulin_tip9 = {
		454914,
		122,
		true
	},
	bulin_tip_other1 = {
		455036,
		192,
		true
	},
	bulin_tip_other2 = {
		455228,
		109,
		true
	},
	bulin_tip_other3 = {
		455337,
		122,
		true
	},
	monopoly_left_count = {
		455459,
		89,
		true
	},
	help_chunjie_monopoly = {
		455548,
		1083,
		true
	},
	monoply_drop_ship_step = {
		456631,
		157,
		true
	},
	lanternRiddles_wait_for_reanswer = {
		456788,
		144,
		true
	},
	lanternRiddles_answer_is_wrong = {
		456932,
		118,
		true
	},
	lanternRiddles_answer_is_right = {
		457050,
		110,
		true
	},
	lanternRiddles_gametip = {
		457160,
		607,
		true
	},
	LanternRiddle_wait_time_tip = {
		457767,
		105,
		true
	},
	LinkLinkGame_BestTime = {
		457872,
		92,
		true
	},
	LinkLinkGame_CurTime = {
		457964,
		89,
		true
	},
	sort_attribute = {
		458053,
		82,
		true
	},
	sort_intimacy = {
		458135,
		85,
		true
	},
	index_skin = {
		458220,
		82,
		true
	},
	index_reform = {
		458302,
		94,
		true
	},
	index_reform_cw = {
		458396,
		97,
		true
	},
	index_strengthen = {
		458493,
		91,
		true
	},
	index_special = {
		458584,
		84,
		true
	},
	index_propose_skin = {
		458668,
		96,
		true
	},
	index_not_obtained = {
		458764,
		94,
		true
	},
	index_no_limit = {
		458858,
		86,
		true
	},
	index_awakening = {
		458944,
		91,
		true
	},
	index_not_lvmax = {
		459035,
		90,
		true
	},
	index_spweapon = {
		459125,
		91,
		true
	},
	index_marry = {
		459216,
		81,
		true
	},
	decodegame_gametip = {
		459297,
		2081,
		true
	},
	indexsort_sort = {
		461378,
		82,
		true
	},
	indexsort_index = {
		461460,
		84,
		true
	},
	indexsort_camp = {
		461544,
		85,
		true
	},
	indexsort_type = {
		461629,
		82,
		true
	},
	indexsort_rarity = {
		461711,
		86,
		true
	},
	indexsort_extraindex = {
		461797,
		89,
		true
	},
	indexsort_label = {
		461886,
		83,
		true
	},
	indexsort_sorteng = {
		461969,
		85,
		true
	},
	indexsort_indexeng = {
		462054,
		87,
		true
	},
	indexsort_campeng = {
		462141,
		88,
		true
	},
	indexsort_rarityeng = {
		462229,
		89,
		true
	},
	indexsort_typeeng = {
		462318,
		85,
		true
	},
	indexsort_labeleng = {
		462403,
		86,
		true
	},
	fightfail_up = {
		462489,
		139,
		true
	},
	fightfail_equip = {
		462628,
		141,
		true
	},
	fight_strengthen = {
		462769,
		158,
		true
	},
	fightfail_noequip = {
		462927,
		107,
		true
	},
	fightfail_choiceequip = {
		463034,
		136,
		true
	},
	fightfail_choicestrengthen = {
		463170,
		151,
		true
	},
	sofmap_attention = {
		463321,
		258,
		true
	},
	sofmapsd_1 = {
		463579,
		153,
		true
	},
	sofmapsd_2 = {
		463732,
		132,
		true
	},
	sofmapsd_3 = {
		463864,
		110,
		true
	},
	sofmapsd_4 = {
		463974,
		133,
		true
	},
	inform_level_limit = {
		464107,
		138,
		true
	},
	["3match_tip"] = {
		464245,
		381,
		true
	},
	retire_selectzero = {
		464626,
		138,
		true
	},
	retire_marry_skin = {
		464764,
		106,
		true
	},
	undermist_tip = {
		464870,
		143,
		true
	},
	retire_1 = {
		465013,
		254,
		true
	},
	retire_2 = {
		465267,
		256,
		true
	},
	retire_3 = {
		465523,
		96,
		true
	},
	retire_rarity = {
		465619,
		97,
		true
	},
	retire_title = {
		465716,
		96,
		true
	},
	res_unlock_tip = {
		465812,
		120,
		true
	},
	res_wifi_tip = {
		465932,
		206,
		true
	},
	res_downloading = {
		466138,
		90,
		true
	},
	res_pic_new_tip = {
		466228,
		145,
		true
	},
	res_music_no_pre_tip = {
		466373,
		95,
		true
	},
	res_music_no_next_tip = {
		466468,
		95,
		true
	},
	res_music_new_tip = {
		466563,
		106,
		true
	},
	apple_link_title = {
		466669,
		101,
		true
	},
	retire_setting_help = {
		466770,
		863,
		true
	},
	activity_shop_exchange_count = {
		467633,
		98,
		true
	},
	shops_msgbox_exchange_count = {
		467731,
		107,
		true
	},
	shops_msgbox_output = {
		467838,
		92,
		true
	},
	shop_word_exchange = {
		467930,
		89,
		true
	},
	shop_word_cancel = {
		468019,
		86,
		true
	},
	title_item_ways = {
		468105,
		152,
		true
	},
	item_lack_title = {
		468257,
		152,
		true
	},
	oil_buy_tip_2 = {
		468409,
		386,
		true
	},
	target_chapter_is_lock = {
		468795,
		126,
		true
	},
	ship_book = {
		468921,
		104,
		true
	},
	month_sign_resign = {
		469025,
		87,
		true
	},
	collect_tip = {
		469112,
		139,
		true
	},
	collect_tip2 = {
		469251,
		140,
		true
	},
	word_weakness = {
		469391,
		88,
		true
	},
	special_operation_tip1 = {
		469479,
		111,
		true
	},
	special_operation_tip2 = {
		469590,
		111,
		true
	},
	area_lock = {
		469701,
		106,
		true
	},
	equipment_upgrade_equipped_tag = {
		469807,
		105,
		true
	},
	equipment_upgrade_spare_tag = {
		469912,
		102,
		true
	},
	equipment_upgrade_help = {
		470014,
		1285,
		true
	},
	equipment_upgrade_title = {
		471299,
		97,
		true
	},
	equipment_upgrade_coin_consume = {
		471396,
		98,
		true
	},
	equipment_upgrade_quick_interface_source_chosen = {
		471494,
		123,
		true
	},
	equipment_upgrade_quick_interface_materials_consume = {
		471617,
		121,
		true
	},
	equipment_upgrade_feedback_lack_of_materials = {
		471738,
		141,
		true
	},
	equipment_upgrade_feedback_equipment_consume = {
		471879,
		211,
		true
	},
	equipment_upgrade_feedback_equipment_can_be_produced = {
		472090,
		168,
		true
	},
	equipment_upgrade_quick_interface_feedback_source_chosen = {
		472258,
		133,
		true
	},
	equipment_upgrade_feedback_lack_of_equipment = {
		472391,
		127,
		true
	},
	equipment_upgrade_equipped_unavailable = {
		472518,
		211,
		true
	},
	equipment_upgrade_initial_node = {
		472729,
		134,
		true
	},
	equipment_upgrade_feedback_compose_tip = {
		472863,
		192,
		true
	},
	discount_coupon_tip = {
		473055,
		193,
		true
	},
	pizzahut_help = {
		473248,
		738,
		true
	},
	towerclimbing_gametip = {
		473986,
		645,
		true
	},
	qingdianguangchang_help = {
		474631,
		660,
		true
	},
	building_tip = {
		475291,
		177,
		true
	},
	building_upgrade_tip = {
		475468,
		155,
		true
	},
	msgbox_text_upgrade = {
		475623,
		90,
		true
	},
	towerclimbing_sign_help = {
		475713,
		793,
		true
	},
	building_complete_tip = {
		476506,
		102,
		true
	},
	backyard_theme_refresh_time_tip = {
		476608,
		124,
		true
	},
	backyard_theme_total_print = {
		476732,
		95,
		true
	},
	backyard_theme_shop_title = {
		476827,
		105,
		true
	},
	backyard_theme_mine_title = {
		476932,
		99,
		true
	},
	backyard_theme_collection_title = {
		477031,
		107,
		true
	},
	backyard_theme_ban_upload_tip = {
		477138,
		214,
		true
	},
	backyard_theme_upload_over_maxcnt = {
		477352,
		194,
		true
	},
	backyard_theme_apply_tip1 = {
		477546,
		208,
		true
	},
	backyard_theme_word_buy = {
		477754,
		90,
		true
	},
	backyard_theme_word_apply = {
		477844,
		94,
		true
	},
	backyard_theme_apply_success = {
		477938,
		105,
		true
	},
	backyard_theme_unload_success = {
		478043,
		109,
		true
	},
	backyard_theme_upload_success = {
		478152,
		101,
		true
	},
	backyard_theme_delete_success = {
		478253,
		100,
		true
	},
	backyard_theme_apply_tip2 = {
		478353,
		138,
		true
	},
	backyard_theme_upload_cnt = {
		478491,
		113,
		true
	},
	backyard_theme_upload_time = {
		478604,
		102,
		true
	},
	backyard_theme_word_like = {
		478706,
		93,
		true
	},
	backyard_theme_word_collection = {
		478799,
		103,
		true
	},
	backyard_theme_cancel_collection = {
		478902,
		138,
		true
	},
	backyard_theme_inform_them = {
		479040,
		105,
		true
	},
	open_backyard_theme_template_tip = {
		479145,
		143,
		true
	},
	backyard_theme_cancel_template_upload_tip = {
		479288,
		249,
		true
	},
	backyard_theme_delete_themplate_tip = {
		479537,
		228,
		true
	},
	backyard_theme_template_be_delete_tip = {
		479765,
		140,
		true
	},
	backyard_theme_template_collection_cnt_max = {
		479905,
		143,
		true
	},
	backyard_theme_template_collection_cnt = {
		480048,
		120,
		true
	},
	words_visit_backyard_toggle = {
		480168,
		124,
		true
	},
	words_show_friend_backyardship_toggle = {
		480292,
		154,
		true
	},
	words_show_my_backyardship_toggle = {
		480446,
		154,
		true
	},
	option_desc7 = {
		480600,
		133,
		true
	},
	option_desc8 = {
		480733,
		147,
		true
	},
	option_desc9 = {
		480880,
		174,
		true
	},
	backyard_unopen = {
		481054,
		108,
		true
	},
	backyard_shop_refresh_frequently = {
		481162,
		157,
		true
	},
	word_random = {
		481319,
		81,
		true
	},
	word_hot = {
		481400,
		75,
		true
	},
	word_new = {
		481475,
		75,
		true
	},
	backyard_decoration_theme_template_delete_tip = {
		481550,
		210,
		true
	},
	backyard_not_found_theme_template = {
		481760,
		128,
		true
	},
	backyard_apply_theme_template_erro = {
		481888,
		122,
		true
	},
	backyard_theme_template_list_is_empty = {
		482010,
		121,
		true
	},
	BackYard_collection_be_delete_tip = {
		482131,
		181,
		true
	},
	help_monopoly_car = {
		482312,
		1056,
		true
	},
	help_monopoly_car_2 = {
		483368,
		1125,
		true
	},
	help_monopoly_3th = {
		484493,
		795,
		true
	},
	backYard_missing_furnitrue_tip = {
		485288,
		114,
		true
	},
	win_condition_display_qijian = {
		485402,
		120,
		true
	},
	win_condition_display_qijian_tip = {
		485522,
		126,
		true
	},
	win_condition_display_shangchuan = {
		485648,
		151,
		true
	},
	win_condition_display_shangchuan_tip = {
		485799,
		170,
		true
	},
	win_condition_display_judian = {
		485969,
		116,
		true
	},
	win_condition_display_tuoli = {
		486085,
		126,
		true
	},
	win_condition_display_tuoli_tip = {
		486211,
		130,
		true
	},
	lose_condition_display_quanmie = {
		486341,
		123,
		true
	},
	lose_condition_display_gangqu = {
		486464,
		155,
		true
	},
	re_battle = {
		486619,
		79,
		true
	},
	keep_fate_tip = {
		486698,
		148,
		true
	},
	equip_info_1 = {
		486846,
		79,
		true
	},
	equip_info_2 = {
		486925,
		84,
		true
	},
	equip_info_3 = {
		487009,
		89,
		true
	},
	equip_info_4 = {
		487098,
		81,
		true
	},
	equip_info_5 = {
		487179,
		85,
		true
	},
	equip_info_6 = {
		487264,
		90,
		true
	},
	equip_info_7 = {
		487354,
		86,
		true
	},
	equip_info_8 = {
		487440,
		86,
		true
	},
	equip_info_9 = {
		487526,
		90,
		true
	},
	equip_info_10 = {
		487616,
		85,
		true
	},
	equip_info_11 = {
		487701,
		85,
		true
	},
	equip_info_12 = {
		487786,
		89,
		true
	},
	equip_info_13 = {
		487875,
		86,
		true
	},
	equip_info_14 = {
		487961,
		92,
		true
	},
	equip_info_15 = {
		488053,
		87,
		true
	},
	equip_info_16 = {
		488140,
		89,
		true
	},
	equip_info_17 = {
		488229,
		88,
		true
	},
	equip_info_18 = {
		488317,
		89,
		true
	},
	equip_info_19 = {
		488406,
		84,
		true
	},
	equip_info_20 = {
		488490,
		88,
		true
	},
	equip_info_21 = {
		488578,
		85,
		true
	},
	equip_info_22 = {
		488663,
		91,
		true
	},
	equip_info_23 = {
		488754,
		90,
		true
	},
	equip_info_24 = {
		488844,
		86,
		true
	},
	equip_info_25 = {
		488930,
		77,
		true
	},
	equip_info_26 = {
		489007,
		90,
		true
	},
	equip_info_27 = {
		489097,
		77,
		true
	},
	equip_info_28 = {
		489174,
		93,
		true
	},
	equip_info_29 = {
		489267,
		80,
		true
	},
	equip_info_30 = {
		489347,
		80,
		true
	},
	equip_info_31 = {
		489427,
		80,
		true
	},
	equip_info_32 = {
		489507,
		91,
		true
	},
	equip_info_33 = {
		489598,
		89,
		true
	},
	equip_info_34 = {
		489687,
		90,
		true
	},
	equip_info_extralevel_0 = {
		489777,
		94,
		true
	},
	equip_info_extralevel_1 = {
		489871,
		94,
		true
	},
	equip_info_extralevel_2 = {
		489965,
		94,
		true
	},
	equip_info_extralevel_3 = {
		490059,
		94,
		true
	},
	tec_settings_btn_word = {
		490153,
		99,
		true
	},
	tec_tendency_x = {
		490252,
		86,
		true
	},
	tec_tendency_0 = {
		490338,
		86,
		true
	},
	tec_tendency_1 = {
		490424,
		87,
		true
	},
	tec_tendency_2 = {
		490511,
		87,
		true
	},
	tec_tendency_3 = {
		490598,
		87,
		true
	},
	tec_tendency_4 = {
		490685,
		87,
		true
	},
	tec_tendency_cur_x = {
		490772,
		101,
		true
	},
	tec_tendency_cur_0 = {
		490873,
		108,
		true
	},
	tec_tendency_cur_1 = {
		490981,
		107,
		true
	},
	tec_tendency_cur_2 = {
		491088,
		107,
		true
	},
	tec_tendency_cur_3 = {
		491195,
		107,
		true
	},
	tec_target_catchup_none = {
		491302,
		117,
		true
	},
	tec_target_catchup_selected = {
		491419,
		105,
		true
	},
	tec_tendency_cur_4 = {
		491524,
		107,
		true
	},
	tec_target_catchup_none_x = {
		491631,
		108,
		true
	},
	tec_target_catchup_none_1 = {
		491739,
		107,
		true
	},
	tec_target_catchup_none_2 = {
		491846,
		107,
		true
	},
	tec_target_catchup_none_3 = {
		491953,
		107,
		true
	},
	tec_target_catchup_selected_x = {
		492060,
		108,
		true
	},
	tec_target_catchup_selected_1 = {
		492168,
		107,
		true
	},
	tec_target_catchup_selected_2 = {
		492275,
		107,
		true
	},
	tec_target_catchup_selected_3 = {
		492382,
		107,
		true
	},
	tec_target_catchup_finish_x = {
		492489,
		106,
		true
	},
	tec_target_catchup_finish_1 = {
		492595,
		105,
		true
	},
	tec_target_catchup_finish_2 = {
		492700,
		105,
		true
	},
	tec_target_catchup_finish_3 = {
		492805,
		105,
		true
	},
	tec_target_catchup_finish_4 = {
		492910,
		105,
		true
	},
	tec_target_catchup_dr_finish_tip = {
		493015,
		113,
		true
	},
	tec_target_catchup_all_finish_tip = {
		493128,
		114,
		true
	},
	tec_target_catchup_show_the_finished_version = {
		493242,
		133,
		true
	},
	tec_target_catchup_pry_char = {
		493375,
		99,
		true
	},
	tec_target_catchup_dr_char = {
		493474,
		98,
		true
	},
	tec_target_need_print = {
		493572,
		98,
		true
	},
	tec_target_catchup_progress = {
		493670,
		99,
		true
	},
	tec_target_catchup_select_tip = {
		493769,
		135,
		true
	},
	tec_target_catchup_help_tip = {
		493904,
		824,
		true
	},
	tec_speedup_title = {
		494728,
		102,
		true
	},
	tec_speedup_progress = {
		494830,
		94,
		true
	},
	tec_speedup_overflow = {
		494924,
		186,
		true
	},
	tec_speedup_help_tip = {
		495110,
		274,
		true
	},
	click_back_tip = {
		495384,
		92,
		true
	},
	tech_catchup_sentence_pauses = {
		495476,
		95,
		true
	},
	tec_act_catchup_btn_word = {
		495571,
		103,
		true
	},
	tec_catchup_errorfix = {
		495674,
		226,
		true
	},
	guild_duty_is_too_low = {
		495900,
		149,
		true
	},
	guild_trainee_duty_change_tip = {
		496049,
		144,
		true
	},
	guild_not_exist_donate_task = {
		496193,
		121,
		true
	},
	guild_week_task_state_is_wrong = {
		496314,
		131,
		true
	},
	guild_get_week_done = {
		496445,
		127,
		true
	},
	guild_public_awards = {
		496572,
		97,
		true
	},
	guild_private_awards = {
		496669,
		99,
		true
	},
	guild_task_selecte_tip = {
		496768,
		276,
		true
	},
	guild_task_accept = {
		497044,
		374,
		true
	},
	guild_commander_and_sub_op = {
		497418,
		152,
		true
	},
	["guild_donate_times_not enough"] = {
		497570,
		144,
		true
	},
	guild_donate_success = {
		497714,
		108,
		true
	},
	guild_left_donate_cnt = {
		497822,
		118,
		true
	},
	guild_donate_tip = {
		497940,
		228,
		true
	},
	guild_donate_addition_capital_tip = {
		498168,
		125,
		true
	},
	guild_donate_addition_techpoint_tip = {
		498293,
		141,
		true
	},
	guild_donate_capital_toplimit = {
		498434,
		151,
		true
	},
	guild_donate_techpoint_toplimit = {
		498585,
		153,
		true
	},
	guild_supply_no_open = {
		498738,
		121,
		true
	},
	guild_supply_award_got = {
		498859,
		119,
		true
	},
	guild_new_member_get_award_tip = {
		498978,
		181,
		true
	},
	guild_start_supply_consume_tip = {
		499159,
		143,
		true
	},
	guild_left_supply_day = {
		499302,
		99,
		true
	},
	guild_supply_help_tip = {
		499401,
		731,
		true
	},
	guild_op_only_administrator = {
		500132,
		153,
		true
	},
	guild_shop_refresh_done = {
		500285,
		102,
		true
	},
	guild_shop_cnt_no_enough = {
		500387,
		113,
		true
	},
	guild_shop_refresh_all_tip = {
		500500,
		205,
		true
	},
	guild_shop_exchange_tip = {
		500705,
		128,
		true
	},
	guild_shop_label_1 = {
		500833,
		115,
		true
	},
	guild_shop_label_2 = {
		500948,
		87,
		true
	},
	guild_shop_label_3 = {
		501035,
		89,
		true
	},
	guild_shop_label_4 = {
		501124,
		86,
		true
	},
	guild_shop_label_5 = {
		501210,
		119,
		true
	},
	guild_shop_must_select_goods = {
		501329,
		125,
		true
	},
	guild_not_exist_activation_tech = {
		501454,
		143,
		true
	},
	guild_not_exist_tech = {
		501597,
		119,
		true
	},
	guild_cancel_only_once_pre_day = {
		501716,
		144,
		true
	},
	guild_tech_is_max_level = {
		501860,
		132,
		true
	},
	guild_tech_gold_no_enough = {
		501992,
		141,
		true
	},
	guild_tech_guildgold_no_enough = {
		502133,
		153,
		true
	},
	guild_tech_upgrade_done = {
		502286,
		118,
		true
	},
	guild_exist_activation_tech = {
		502404,
		136,
		true
	},
	guild_tech_gold_desc = {
		502540,
		105,
		true
	},
	guild_tech_oil_desc = {
		502645,
		102,
		true
	},
	guild_tech_shipbag_desc = {
		502747,
		101,
		true
	},
	guild_tech_equipbag_desc = {
		502848,
		107,
		true
	},
	guild_box_gold_desc = {
		502955,
		99,
		true
	},
	guidl_r_box_time_desc = {
		503054,
		115,
		true
	},
	guidl_sr_box_time_desc = {
		503169,
		117,
		true
	},
	guidl_ssr_box_time_desc = {
		503286,
		123,
		true
	},
	guild_member_max_cnt_desc = {
		503409,
		110,
		true
	},
	guild_tech_livness_no_enough = {
		503519,
		271,
		true
	},
	guild_tech_livness_no_enough_label = {
		503790,
		126,
		true
	},
	guild_ship_attr_desc = {
		503916,
		133,
		true
	},
	guild_start_tech_group_tip = {
		504049,
		164,
		true
	},
	guild_cancel_tech_tip = {
		504213,
		182,
		true
	},
	guild_tech_consume_tip = {
		504395,
		219,
		true
	},
	guild_tech_non_admin = {
		504614,
		146,
		true
	},
	guild_tech_label_max_level = {
		504760,
		100,
		true
	},
	guild_tech_label_dev_progress = {
		504860,
		102,
		true
	},
	guild_tech_label_condition = {
		504962,
		131,
		true
	},
	guild_tech_donate_target = {
		505093,
		122,
		true
	},
	guild_not_exist = {
		505215,
		105,
		true
	},
	guild_not_exist_battle = {
		505320,
		126,
		true
	},
	guild_battle_is_end = {
		505446,
		121,
		true
	},
	guild_battle_is_exist = {
		505567,
		126,
		true
	},
	guild_guildgold_no_enough_for_battle = {
		505693,
		164,
		true
	},
	guild_event_start_tip1 = {
		505857,
		167,
		true
	},
	guild_event_start_tip2 = {
		506024,
		168,
		true
	},
	guild_word_may_happen_event = {
		506192,
		106,
		true
	},
	guild_battle_award = {
		506298,
		90,
		true
	},
	guild_word_consume = {
		506388,
		87,
		true
	},
	guild_start_event_consume_tip = {
		506475,
		149,
		true
	},
	guild_start_event_consume_tip_extra = {
		506624,
		222,
		true
	},
	guild_word_consume_for_battle = {
		506846,
		99,
		true
	},
	guild_level_no_enough = {
		506945,
		159,
		true
	},
	guild_open_event_info_when_exist_active = {
		507104,
		170,
		true
	},
	guild_join_event_cnt_label = {
		507274,
		117,
		true
	},
	guild_join_event_max_cnt_tip = {
		507391,
		124,
		true
	},
	guild_join_event_progress_label = {
		507515,
		104,
		true
	},
	guild_join_event_exist_finished_mission_tip = {
		507619,
		277,
		true
	},
	guild_event_not_exist = {
		507896,
		119,
		true
	},
	guild_fleet_can_not_edit = {
		508015,
		131,
		true
	},
	guild_fleet_exist_same_kind_ship = {
		508146,
		151,
		true
	},
	guild_event_exist_same_kind_ship = {
		508297,
		171,
		true
	},
	guidl_event_ship_in_event = {
		508468,
		150,
		true
	},
	guild_event_start_done = {
		508618,
		110,
		true
	},
	guild_fleet_update_done = {
		508728,
		122,
		true
	},
	guild_event_is_lock = {
		508850,
		115,
		true
	},
	guild_event_is_finish = {
		508965,
		161,
		true
	},
	guild_fleet_not_save_tip = {
		509126,
		161,
		true
	},
	guild_word_battle_area = {
		509287,
		91,
		true
	},
	guild_word_battle_type = {
		509378,
		91,
		true
	},
	guild_wrod_battle_target = {
		509469,
		99,
		true
	},
	guild_event_recomm_ship_failed = {
		509568,
		139,
		true
	},
	guild_event_start_event_tip = {
		509707,
		208,
		true
	},
	guild_word_sea = {
		509915,
		83,
		true
	},
	guild_word_score_addition = {
		509998,
		106,
		true
	},
	guild_word_effect_addition = {
		510104,
		111,
		true
	},
	guild_curr_fleet_can_not_edit = {
		510215,
		127,
		true
	},
	guild_next_edit_fleet_time = {
		510342,
		125,
		true
	},
	guild_event_info_desc1 = {
		510467,
		197,
		true
	},
	guild_event_info_desc2 = {
		510664,
		128,
		true
	},
	guild_join_member_cnt = {
		510792,
		98,
		true
	},
	guild_total_effect = {
		510890,
		99,
		true
	},
	guild_word_people = {
		510989,
		81,
		true
	},
	guild_event_info_desc3 = {
		511070,
		104,
		true
	},
	guild_not_exist_boss = {
		511174,
		112,
		true
	},
	guild_ship_from = {
		511286,
		84,
		true
	},
	guild_boss_formation_1 = {
		511370,
		160,
		true
	},
	guild_boss_formation_2 = {
		511530,
		146,
		true
	},
	guild_boss_formation_3 = {
		511676,
		123,
		true
	},
	guild_boss_cnt_no_enough = {
		511799,
		131,
		true
	},
	guild_boss_fleet_cnt_invaild = {
		511930,
		137,
		true
	},
	guild_boss_formation_not_exist_self_ship = {
		512067,
		190,
		true
	},
	guild_boss_formation_exist_event_ship = {
		512257,
		161,
		true
	},
	guild_fleet_is_legal = {
		512418,
		157,
		true
	},
	guild_battle_result_boss_is_death = {
		512575,
		134,
		true
	},
	guild_must_edit_fleet = {
		512709,
		112,
		true
	},
	guild_ship_in_battle = {
		512821,
		163,
		true
	},
	guild_ship_in_assult_fleet = {
		512984,
		134,
		true
	},
	guild_event_exist_assult_ship = {
		513118,
		157,
		true
	},
	guild_formation_erro_in_boss_battle = {
		513275,
		168,
		true
	},
	guild_get_report_failed = {
		513443,
		121,
		true
	},
	guild_report_get_all = {
		513564,
		95,
		true
	},
	guild_can_not_get_tip = {
		513659,
		158,
		true
	},
	guild_not_exist_notifycation = {
		513817,
		146,
		true
	},
	guild_exist_report_award_when_exit = {
		513963,
		172,
		true
	},
	guild_report_tooltip = {
		514135,
		243,
		true
	},
	word_guildgold = {
		514378,
		90,
		true
	},
	guild_member_rank_title_donate = {
		514468,
		107,
		true
	},
	guild_member_rank_title_finish_cnt = {
		514575,
		109,
		true
	},
	guild_member_rank_title_join_cnt = {
		514684,
		110,
		true
	},
	guild_donate_log = {
		514794,
		165,
		true
	},
	guild_supply_log = {
		514959,
		148,
		true
	},
	guild_weektask_log = {
		515107,
		148,
		true
	},
	guild_battle_log = {
		515255,
		137,
		true
	},
	guild_tech_change_log = {
		515392,
		136,
		true
	},
	guild_log_title = {
		515528,
		88,
		true
	},
	guild_use_donateitem_success = {
		515616,
		131,
		true
	},
	guild_use_battleitem_success = {
		515747,
		140,
		true
	},
	not_exist_guild_use_item = {
		515887,
		141,
		true
	},
	guild_member_tip = {
		516028,
		2773,
		true
	},
	guild_tech_tip = {
		518801,
		2740,
		true
	},
	guild_office_tip = {
		521541,
		2650,
		true
	},
	guild_event_help_tip = {
		524191,
		2687,
		true
	},
	guild_mission_info_tip = {
		526878,
		1109,
		true
	},
	guild_public_tech_tip = {
		527987,
		660,
		true
	},
	guild_public_office_tip = {
		528647,
		325,
		true
	},
	guild_tech_price_inc_tip = {
		528972,
		258,
		true
	},
	guild_boss_fleet_desc = {
		529230,
		523,
		true
	},
	guild_boss_formation_exist_invaild_ship = {
		529753,
		197,
		true
	},
	guild_exist_unreceived_supply_award = {
		529950,
		127,
		true
	},
	word_shipState_guild_event = {
		530077,
		159,
		true
	},
	word_shipState_guild_boss = {
		530236,
		193,
		true
	},
	commander_is_in_guild = {
		530429,
		195,
		true
	},
	guild_assult_ship_recommend = {
		530624,
		134,
		true
	},
	guild_cancel_assult_ship_recommend = {
		530758,
		132,
		true
	},
	guild_assult_ship_recommend_conflict = {
		530890,
		147,
		true
	},
	guild_recommend_limit = {
		531037,
		143,
		true
	},
	guild_cancel_assult_ship_recommend_conflict = {
		531180,
		169,
		true
	},
	guild_mission_complate = {
		531349,
		110,
		true
	},
	guild_operation_event_occurrence = {
		531459,
		172,
		true
	},
	guild_transfer_president_confirm = {
		531631,
		236,
		true
	},
	guild_damage_ranking = {
		531867,
		88,
		true
	},
	guild_total_damage = {
		531955,
		88,
		true
	},
	guild_donate_list_updated = {
		532043,
		142,
		true
	},
	guild_donate_list_update_failed = {
		532185,
		146,
		true
	},
	guild_tip_quit_operation = {
		532331,
		239,
		true
	},
	guild_tip_grand_fleet_is_frozen = {
		532570,
		144,
		true
	},
	guild_tip_operation_time_is_not_ample = {
		532714,
		355,
		true
	},
	guild_time_remaining_tip = {
		533069,
		104,
		true
	},
	multiple_ship_energy_low_desc = {
		533173,
		142,
		true
	},
	multiple_ship_energy_low_warn = {
		533315,
		142,
		true
	},
	multiple_ship_energy_low_warn_no_exp = {
		533457,
		282,
		true
	},
	us_error_download_painting = {
		533739,
		243,
		true
	},
	help_rollingBallGame = {
		533982,
		1116,
		true
	},
	rolling_ball_help = {
		535098,
		896,
		true
	},
	help_jiujiu_expedition_game = {
		535994,
		723,
		true
	},
	jiujiu_expedition_game_stg_desc = {
		536717,
		125,
		true
	},
	build_ship_accumulative = {
		536842,
		94,
		true
	},
	destory_ship_before_tip = {
		536936,
		96,
		true
	},
	destory_ship_input_erro = {
		537032,
		127,
		true
	},
	destroy_ur_rarity_tip = {
		537159,
		223,
		true
	},
	destory_ur_pt_overflowa = {
		537382,
		283,
		true
	},
	jiujiu_expedition_help = {
		537665,
		514,
		true
	},
	shop_label_unlimt_cnt = {
		538179,
		94,
		true
	},
	jiujiu_expedition_book_tip = {
		538273,
		142,
		true
	},
	jiujiu_expedition_reward_tip = {
		538415,
		140,
		true
	},
	jiujiu_expedition_amount_tip = {
		538555,
		172,
		true
	},
	jiujiu_expedition_stg_tip = {
		538727,
		133,
		true
	},
	trade_card_tips1 = {
		538860,
		85,
		true
	},
	trade_card_tips2 = {
		538945,
		273,
		true
	},
	trade_card_tips3 = {
		539218,
		278,
		true
	},
	trade_card_tips4 = {
		539496,
		93,
		true
	},
	ur_exchange_help_tip = {
		539589,
		965,
		true
	},
	fleet_antisub_range = {
		540554,
		95,
		true
	},
	fleet_antisub_range_tip = {
		540649,
		1085,
		true
	},
	practise_idol_tip = {
		541734,
		120,
		true
	},
	practise_idol_help = {
		541854,
		937,
		true
	},
	upgrade_idol_tip = {
		542791,
		153,
		true
	},
	upgrade_complete_tip = {
		542944,
		104,
		true
	},
	upgrade_introduce_tip = {
		543048,
		135,
		true
	},
	collect_idol_tip = {
		543183,
		158,
		true
	},
	hand_account_tip = {
		543341,
		125,
		true
	},
	hand_account_resetting_tip = {
		543466,
		133,
		true
	},
	help_candymagic = {
		543599,
		1060,
		true
	},
	award_overflow_tip = {
		544659,
		172,
		true
	},
	hunter_npc = {
		544831,
		1368,
		true
	},
	venusvolleyball_help = {
		546199,
		1402,
		true
	},
	venusvolleyball_rule_tip = {
		547601,
		109,
		true
	},
	venusvolleyball_return_tip = {
		547710,
		125,
		true
	},
	venusvolleyball_suspend_tip = {
		547835,
		109,
		true
	},
	doa_main = {
		547944,
		1461,
		true
	},
	doa_pt_help = {
		549405,
		841,
		true
	},
	doa_pt_complete = {
		550246,
		96,
		true
	},
	doa_pt_up = {
		550342,
		110,
		true
	},
	doa_liliang = {
		550452,
		78,
		true
	},
	doa_jiqiao = {
		550530,
		77,
		true
	},
	doa_tili = {
		550607,
		75,
		true
	},
	doa_meili = {
		550682,
		76,
		true
	},
	snowball_help = {
		550758,
		1745,
		true
	},
	help_xinnian2021_feast = {
		552503,
		533,
		true
	},
	help_xinnian2021__qiaozhong = {
		553036,
		1318,
		true
	},
	help_xinnian2021__meishiyemian = {
		554354,
		703,
		true
	},
	help_xinnian2021__meishi = {
		555057,
		1290,
		true
	},
	help_act_event = {
		556347,
		286,
		true
	},
	autofight = {
		556633,
		84,
		true
	},
	autofight_errors_tip = {
		556717,
		142,
		true
	},
	autofight_special_operation_tip = {
		556859,
		322,
		true
	},
	autofight_formation = {
		557181,
		92,
		true
	},
	autofight_cat = {
		557273,
		87,
		true
	},
	autofight_function = {
		557360,
		86,
		true
	},
	autofight_function1 = {
		557446,
		90,
		true
	},
	autofight_function2 = {
		557536,
		92,
		true
	},
	autofight_function3 = {
		557628,
		94,
		true
	},
	autofight_function4 = {
		557722,
		90,
		true
	},
	autofight_function5 = {
		557812,
		98,
		true
	},
	autofight_rewards = {
		557910,
		94,
		true
	},
	autofight_rewards_none = {
		558004,
		104,
		true
	},
	autofight_leave = {
		558108,
		83,
		true
	},
	autofight_onceagain = {
		558191,
		91,
		true
	},
	autofight_entrust = {
		558282,
		109,
		true
	},
	autofight_task = {
		558391,
		99,
		true
	},
	autofight_effect = {
		558490,
		146,
		true
	},
	autofight_file = {
		558636,
		97,
		true
	},
	autofight_discovery = {
		558733,
		112,
		true
	},
	autofight_tip_bigworld_dead = {
		558845,
		155,
		true
	},
	autofight_tip_bigworld_begin = {
		559000,
		137,
		true
	},
	autofight_tip_bigworld_stop = {
		559137,
		137,
		true
	},
	autofight_tip_bigworld_suspend = {
		559274,
		179,
		true
	},
	autofight_tip_bigworld_loop = {
		559453,
		151,
		true
	},
	autofight_farm = {
		559604,
		91,
		true
	},
	autofight_story = {
		559695,
		117,
		true
	},
	fushun_adventure_help = {
		559812,
		1320,
		true
	},
	autofight_change_tip = {
		561132,
		175,
		true
	},
	autofight_selectprops_tip = {
		561307,
		97,
		true
	},
	help_chunjie2021_feast = {
		561404,
		748,
		true
	},
	valentinesday__txt1_tip = {
		562152,
		174,
		true
	},
	valentinesday__txt2_tip = {
		562326,
		136,
		true
	},
	valentinesday__txt3_tip = {
		562462,
		141,
		true
	},
	valentinesday__txt4_tip = {
		562603,
		148,
		true
	},
	valentinesday__txt5_tip = {
		562751,
		140,
		true
	},
	valentinesday__txt6_tip = {
		562891,
		146,
		true
	},
	valentinesday__shop_tip = {
		563037,
		128,
		true
	},
	wwf_bamboo_tip1 = {
		563165,
		104,
		true
	},
	wwf_bamboo_tip2 = {
		563269,
		103,
		true
	},
	wwf_bamboo_tip3 = {
		563372,
		135,
		true
	},
	wwf_bamboo_help = {
		563507,
		1066,
		true
	},
	wwf_guide_tip = {
		564573,
		113,
		true
	},
	securitycake_help = {
		564686,
		2143,
		true
	},
	icecream_help = {
		566829,
		737,
		true
	},
	icecream_make_tip = {
		567566,
		98,
		true
	},
	query_role = {
		567664,
		86,
		true
	},
	query_role_none = {
		567750,
		87,
		true
	},
	query_role_button = {
		567837,
		94,
		true
	},
	query_role_fail = {
		567931,
		93,
		true
	},
	cumulative_victory_target_tip = {
		568024,
		109,
		true
	},
	cumulative_victory_now_tip = {
		568133,
		108,
		true
	},
	word_files_repair = {
		568241,
		95,
		true
	},
	repair_setting_label = {
		568336,
		98,
		true
	},
	voice_control = {
		568434,
		83,
		true
	},
	index_equip = {
		568517,
		84,
		true
	},
	index_without_limit = {
		568601,
		91,
		true
	},
	meta_learn_skill = {
		568692,
		92,
		true
	},
	world_joint_boss_not_found = {
		568784,
		148,
		true
	},
	world_joint_boss_is_death = {
		568932,
		143,
		true
	},
	world_joint_whitout_guild = {
		569075,
		123,
		true
	},
	world_joint_whitout_friend = {
		569198,
		126,
		true
	},
	world_joint_call_support_failed = {
		569324,
		126,
		true
	},
	world_joint_call_support_success = {
		569450,
		131,
		true
	},
	world_joint_call_friend_support_txt = {
		569581,
		111,
		true
	},
	world_joint_call_guild_support_txt = {
		569692,
		110,
		true
	},
	world_joint_call_world_support_txt = {
		569802,
		110,
		true
	},
	ad_4 = {
		569912,
		228,
		true
	},
	world_word_expired = {
		570140,
		94,
		true
	},
	world_word_guild_member = {
		570234,
		99,
		true
	},
	world_word_guild_player = {
		570333,
		93,
		true
	},
	world_joint_boss_award_expired = {
		570426,
		106,
		true
	},
	world_joint_not_refresh_frequently = {
		570532,
		122,
		true
	},
	world_joint_exit_battle_tip = {
		570654,
		151,
		true
	},
	world_boss_get_item = {
		570805,
		215,
		true
	},
	world_boss_ask_help = {
		571020,
		134,
		true
	},
	world_joint_count_no_enough = {
		571154,
		135,
		true
	},
	world_boss_none = {
		571289,
		133,
		true
	},
	world_boss_fleet = {
		571422,
		100,
		true
	},
	world_max_challenge_cnt = {
		571522,
		144,
		true
	},
	world_reset_success = {
		571666,
		124,
		true
	},
	world_map_dangerous_confirm = {
		571790,
		230,
		true
	},
	world_map_version = {
		572020,
		140,
		true
	},
	world_resource_fill = {
		572160,
		130,
		true
	},
	meta_sys_lock_tip = {
		572290,
		93,
		true
	},
	meta_story_lock = {
		572383,
		91,
		true
	},
	meta_acttime_limit = {
		572474,
		90,
		true
	},
	meta_pt_left = {
		572564,
		88,
		true
	},
	meta_syn_rate = {
		572652,
		86,
		true
	},
	meta_repair_rate = {
		572738,
		99,
		true
	},
	meta_story_tip_1 = {
		572837,
		92,
		true
	},
	meta_story_tip_2 = {
		572929,
		92,
		true
	},
	meta_pt_get_way = {
		573021,
		91,
		true
	},
	meta_pt_point = {
		573112,
		84,
		true
	},
	meta_award_get = {
		573196,
		85,
		true
	},
	meta_award_got = {
		573281,
		87,
		true
	},
	meta_repair = {
		573368,
		89,
		true
	},
	meta_repair_success = {
		573457,
		117,
		true
	},
	meta_repair_effect_unlock = {
		573574,
		125,
		true
	},
	meta_repair_effect_special = {
		573699,
		122,
		true
	},
	meta_energy_ship_level_need = {
		573821,
		115,
		true
	},
	meta_energy_ship_repairrate_need = {
		573936,
		125,
		true
	},
	meta_energy_active_box_tip = {
		574061,
		192,
		true
	},
	meta_break = {
		574253,
		127,
		true
	},
	meta_energy_preview_title = {
		574380,
		123,
		true
	},
	meta_energy_preview_tip = {
		574503,
		138,
		true
	},
	meta_exp_per_day = {
		574641,
		90,
		true
	},
	meta_skill_unlock = {
		574731,
		108,
		true
	},
	meta_unlock_skill_tip = {
		574839,
		160,
		true
	},
	meta_unlock_skill_select = {
		574999,
		100,
		true
	},
	meta_switch_skill_disable = {
		575099,
		138,
		true
	},
	meta_switch_skill_box_title = {
		575237,
		128,
		true
	},
	meta_cur_pt = {
		575365,
		87,
		true
	},
	meta_toast_fullexp = {
		575452,
		115,
		true
	},
	meta_toast_tactics = {
		575567,
		95,
		true
	},
	meta_skillbtn_tactics = {
		575662,
		93,
		true
	},
	meta_destroy_tip = {
		575755,
		110,
		true
	},
	meta_voice_name_feeling1 = {
		575865,
		96,
		true
	},
	meta_voice_name_feeling2 = {
		575961,
		96,
		true
	},
	meta_voice_name_feeling3 = {
		576057,
		94,
		true
	},
	meta_voice_name_feeling4 = {
		576151,
		94,
		true
	},
	meta_voice_name_feeling5 = {
		576245,
		92,
		true
	},
	meta_voice_name_propose = {
		576337,
		91,
		true
	},
	world_boss_ad = {
		576428,
		89,
		true
	},
	world_boss_drop_title = {
		576517,
		97,
		true
	},
	world_boss_pt_recove_desc = {
		576614,
		151,
		true
	},
	world_boss_progress_item_desc = {
		576765,
		462,
		true
	},
	world_joint_max_challenge_people_cnt = {
		577227,
		130,
		true
	},
	equip_ammo_type_1 = {
		577357,
		83,
		true
	},
	equip_ammo_type_2 = {
		577440,
		83,
		true
	},
	equip_ammo_type_3 = {
		577523,
		88,
		true
	},
	equip_ammo_type_4 = {
		577611,
		90,
		true
	},
	equip_ammo_type_5 = {
		577701,
		88,
		true
	},
	equip_ammo_type_6 = {
		577789,
		88,
		true
	},
	equip_ammo_type_7 = {
		577877,
		84,
		true
	},
	equip_ammo_type_8 = {
		577961,
		92,
		true
	},
	equip_ammo_type_9 = {
		578053,
		88,
		true
	},
	equip_ammo_type_10 = {
		578141,
		87,
		true
	},
	equip_ammo_type_11 = {
		578228,
		89,
		true
	},
	common_daily_limit = {
		578317,
		94,
		true
	},
	meta_help = {
		578411,
		2141,
		true
	},
	world_boss_daily_limit = {
		580552,
		118,
		true
	},
	common_go_to_analyze = {
		580670,
		92,
		true
	},
	world_boss_not_reach_target = {
		580762,
		122,
		true
	},
	special_transform_limit_reach = {
		580884,
		145,
		true
	},
	meta_pt_notenough = {
		581029,
		175,
		true
	},
	meta_boss_unlock = {
		581204,
		210,
		true
	},
	word_take_effect = {
		581414,
		91,
		true
	},
	world_boss_challenge_cnt = {
		581505,
		100,
		true
	},
	word_shipNation_meta = {
		581605,
		87,
		true
	},
	world_word_friend = {
		581692,
		89,
		true
	},
	world_word_world = {
		581781,
		86,
		true
	},
	world_word_guild = {
		581867,
		85,
		true
	},
	world_collection_1 = {
		581952,
		91,
		true
	},
	world_collection_2 = {
		582043,
		91,
		true
	},
	world_collection_3 = {
		582134,
		91,
		true
	},
	zero_hour_command_error = {
		582225,
		150,
		true
	},
	commander_is_in_bigworld = {
		582375,
		142,
		true
	},
	world_collection_back = {
		582517,
		99,
		true
	},
	archives_whether_to_retreat = {
		582616,
		199,
		true
	},
	world_fleet_stop = {
		582815,
		111,
		true
	},
	world_setting_title = {
		582926,
		108,
		true
	},
	world_setting_quickmode = {
		583034,
		106,
		true
	},
	world_setting_quickmodetip = {
		583140,
		134,
		true
	},
	world_setting_submititem = {
		583274,
		121,
		true
	},
	world_setting_submititemtip = {
		583395,
		332,
		true
	},
	world_setting_mapauto = {
		583727,
		122,
		true
	},
	world_setting_mapautotip = {
		583849,
		171,
		true
	},
	world_boss_maintenance = {
		584020,
		167,
		true
	},
	world_boss_inbattle = {
		584187,
		147,
		true
	},
	world_automode_title_1 = {
		584334,
		103,
		true
	},
	world_automode_title_2 = {
		584437,
		86,
		true
	},
	world_automode_treasure_1 = {
		584523,
		137,
		true
	},
	world_automode_treasure_2 = {
		584660,
		132,
		true
	},
	world_automode_treasure_3 = {
		584792,
		136,
		true
	},
	world_automode_cancel = {
		584928,
		91,
		true
	},
	world_automode_confirm = {
		585019,
		93,
		true
	},
	world_automode_start_tip1 = {
		585112,
		122,
		true
	},
	world_automode_start_tip2 = {
		585234,
		105,
		true
	},
	world_automode_start_tip3 = {
		585339,
		124,
		true
	},
	world_automode_start_tip4 = {
		585463,
		115,
		true
	},
	world_automode_start_tip5 = {
		585578,
		164,
		true
	},
	world_automode_setting_1 = {
		585742,
		119,
		true
	},
	world_automode_setting_1_1 = {
		585861,
		101,
		true
	},
	world_automode_setting_1_2 = {
		585962,
		91,
		true
	},
	world_automode_setting_1_3 = {
		586053,
		91,
		true
	},
	world_automode_setting_1_4 = {
		586144,
		99,
		true
	},
	world_automode_setting_2 = {
		586243,
		137,
		true
	},
	world_automode_setting_2_1 = {
		586380,
		106,
		true
	},
	world_automode_setting_2_2 = {
		586486,
		109,
		true
	},
	world_automode_setting_all_1 = {
		586595,
		135,
		true
	},
	world_automode_setting_all_1_1 = {
		586730,
		115,
		true
	},
	world_automode_setting_all_1_2 = {
		586845,
		119,
		true
	},
	world_automode_setting_all_2 = {
		586964,
		139,
		true
	},
	world_automode_setting_all_2_1 = {
		587103,
		99,
		true
	},
	world_automode_setting_all_2_2 = {
		587202,
		115,
		true
	},
	world_automode_setting_all_2_3 = {
		587317,
		115,
		true
	},
	world_automode_setting_all_3 = {
		587432,
		121,
		true
	},
	world_automode_setting_all_3_1 = {
		587553,
		96,
		true
	},
	world_automode_setting_all_3_2 = {
		587649,
		97,
		true
	},
	world_automode_setting_all_4 = {
		587746,
		135,
		true
	},
	world_automode_setting_all_4_1 = {
		587881,
		97,
		true
	},
	world_automode_setting_all_4_2 = {
		587978,
		96,
		true
	},
	world_automode_setting_new_1 = {
		588074,
		122,
		true
	},
	world_automode_setting_new_1_1 = {
		588196,
		105,
		true
	},
	world_automode_setting_new_1_2 = {
		588301,
		95,
		true
	},
	world_automode_setting_new_1_3 = {
		588396,
		95,
		true
	},
	world_automode_setting_new_1_4 = {
		588491,
		95,
		true
	},
	world_automode_setting_new_1_5 = {
		588586,
		97,
		true
	},
	world_collection_task_tip_1 = {
		588683,
		147,
		true
	},
	area_putong = {
		588830,
		85,
		true
	},
	area_anquan = {
		588915,
		82,
		true
	},
	area_yaosai = {
		588997,
		85,
		true
	},
	area_yaosai_2 = {
		589082,
		96,
		true
	},
	area_shenyuan = {
		589178,
		84,
		true
	},
	area_yinmi = {
		589262,
		80,
		true
	},
	area_renwu = {
		589342,
		81,
		true
	},
	area_zhuxian = {
		589423,
		84,
		true
	},
	area_dangan = {
		589507,
		85,
		true
	},
	charge_trade_no_error = {
		589592,
		122,
		true
	},
	world_reset_1 = {
		589714,
		136,
		true
	},
	world_reset_2 = {
		589850,
		138,
		true
	},
	world_reset_3 = {
		589988,
		111,
		true
	},
	guild_is_frozen_when_start_tech = {
		590099,
		126,
		true
	},
	world_boss_unactivated = {
		590225,
		155,
		true
	},
	world_reset_tip = {
		590380,
		2719,
		true
	},
	spring_invited_2021 = {
		593099,
		231,
		true
	},
	charge_error_count_limit = {
		593330,
		128,
		true
	},
	charge_error_disable = {
		593458,
		144,
		true
	},
	levelScene_select_sp = {
		593602,
		138,
		true
	},
	word_adjustFleet = {
		593740,
		86,
		true
	},
	levelScene_select_noitem = {
		593826,
		112,
		true
	},
	story_setting_label = {
		593938,
		105,
		true
	},
	login_arrears_tips = {
		594043,
		208,
		true
	},
	Supplement_pay1 = {
		594251,
		211,
		true
	},
	Supplement_pay2 = {
		594462,
		231,
		true
	},
	Supplement_pay3 = {
		594693,
		209,
		true
	},
	Supplement_pay4 = {
		594902,
		86,
		true
	},
	world_ship_repair = {
		594988,
		102,
		true
	},
	Supplement_pay5 = {
		595090,
		185,
		true
	},
	area_unkown = {
		595275,
		89,
		true
	},
	Supplement_pay6 = {
		595364,
		89,
		true
	},
	Supplement_pay7 = {
		595453,
		88,
		true
	},
	Supplement_pay8 = {
		595541,
		86,
		true
	},
	world_battle_damage = {
		595627,
		217,
		true
	},
	setting_story_speed_1 = {
		595844,
		89,
		true
	},
	setting_story_speed_2 = {
		595933,
		91,
		true
	},
	setting_story_speed_3 = {
		596024,
		89,
		true
	},
	setting_story_speed_4 = {
		596113,
		94,
		true
	},
	story_autoplay_setting_label = {
		596207,
		106,
		true
	},
	story_autoplay_setting_1 = {
		596313,
		96,
		true
	},
	story_autoplay_setting_2 = {
		596409,
		95,
		true
	},
	meta_shop_exchange_limit = {
		596504,
		98,
		true
	},
	meta_shop_unexchange_label = {
		596602,
		90,
		true
	},
	daily_level_quick_battle_label2 = {
		596692,
		101,
		true
	},
	daily_level_quick_battle_label1 = {
		596793,
		109,
		true
	},
	dailyLevel_quickfinish = {
		596902,
		329,
		true
	},
	daily_level_quick_battle_label3 = {
		597231,
		108,
		true
	},
	backyard_longpress_ship_tip = {
		597339,
		160,
		true
	},
	common_npc_formation_tip = {
		597499,
		126,
		true
	},
	gametip_xiaotiancheng = {
		597625,
		1319,
		true
	},
	guild_task_autoaccept_1 = {
		598944,
		128,
		true
	},
	guild_task_autoaccept_2 = {
		599072,
		135,
		true
	},
	task_lock = {
		599207,
		93,
		true
	},
	week_task_pt_name = {
		599300,
		96,
		true
	},
	week_task_award_preview_label = {
		599396,
		100,
		true
	},
	week_task_title_label = {
		599496,
		108,
		true
	},
	cattery_op_clean_success = {
		599604,
		122,
		true
	},
	cattery_op_feed_success = {
		599726,
		114,
		true
	},
	cattery_op_play_success = {
		599840,
		122,
		true
	},
	cattery_style_change_success = {
		599962,
		130,
		true
	},
	cattery_add_commander_success = {
		600092,
		110,
		true
	},
	cattery_remove_commander_success = {
		600202,
		115,
		true
	},
	commander_box_quickly_tool_tip_1 = {
		600317,
		152,
		true
	},
	commander_box_quickly_tool_tip_2 = {
		600469,
		147,
		true
	},
	commander_box_quickly_tool_tip_3 = {
		600616,
		123,
		true
	},
	commander_box_was_finished = {
		600739,
		119,
		true
	},
	comander_tool_cnt_is_reclac = {
		600858,
		151,
		true
	},
	comander_tool_max_cnt = {
		601009,
		93,
		true
	},
	commander_op_play_level = {
		601102,
		101,
		true
	},
	commander_op_feed_level = {
		601203,
		101,
		true
	},
	cat_home_help = {
		601304,
		1398,
		true
	},
	cat_accelfrate_notenough = {
		602702,
		136,
		true
	},
	cat_home_unlock = {
		602838,
		131,
		true
	},
	cat_sleep_notplay = {
		602969,
		140,
		true
	},
	cathome_style_unlock = {
		603109,
		142,
		true
	},
	commander_is_in_cattery = {
		603251,
		122,
		true
	},
	cat_home_interaction = {
		603373,
		133,
		true
	},
	cat_accelerate_left = {
		603506,
		96,
		true
	},
	common_clean = {
		603602,
		81,
		true
	},
	common_feed = {
		603683,
		79,
		true
	},
	common_play = {
		603762,
		79,
		true
	},
	game_stopwords = {
		603841,
		107,
		true
	},
	game_openwords = {
		603948,
		110,
		true
	},
	amusementpark_shop_enter = {
		604058,
		143,
		true
	},
	amusementpark_shop_exchange = {
		604201,
		189,
		true
	},
	amusementpark_shop_success = {
		604390,
		107,
		true
	},
	amusementpark_shop_special = {
		604497,
		149,
		true
	},
	amusementpark_shop_end = {
		604646,
		116,
		true
	},
	amusementpark_shop_0 = {
		604762,
		176,
		true
	},
	amusementpark_shop_carousel1 = {
		604938,
		152,
		true
	},
	amusementpark_shop_carousel2 = {
		605090,
		151,
		true
	},
	amusementpark_shop_carousel3 = {
		605241,
		153,
		true
	},
	amusementpark_shop_exchange2 = {
		605394,
		196,
		true
	},
	amusementpark_help = {
		605590,
		1927,
		true
	},
	amusementpark_shop_help = {
		607517,
		465,
		true
	},
	handshake_game_help = {
		607982,
		915,
		true
	},
	MeixiV4_help = {
		608897,
		908,
		true
	},
	activity_permanent_total = {
		609805,
		107,
		true
	},
	word_investigate = {
		609912,
		86,
		true
	},
	ambush_display_none = {
		609998,
		88,
		true
	},
	activity_permanent_help = {
		610086,
		502,
		true
	},
	activity_permanent_tips1 = {
		610588,
		171,
		true
	},
	activity_permanent_tips2 = {
		610759,
		175,
		true
	},
	activity_permanent_tips3 = {
		610934,
		155,
		true
	},
	activity_permanent_tips4 = {
		611089,
		199,
		true
	},
	activity_permanent_finished = {
		611288,
		100,
		true
	},
	idolmaster_main = {
		611388,
		1190,
		true
	},
	idolmaster_game_tip1 = {
		612578,
		118,
		true
	},
	idolmaster_game_tip2 = {
		612696,
		116,
		true
	},
	idolmaster_game_tip3 = {
		612812,
		97,
		true
	},
	idolmaster_game_tip4 = {
		612909,
		94,
		true
	},
	idolmaster_game_tip5 = {
		613003,
		89,
		true
	},
	idolmaster_collection = {
		613092,
		631,
		true
	},
	idolmaster_voice_name_feeling1 = {
		613723,
		107,
		true
	},
	idolmaster_voice_name_feeling2 = {
		613830,
		102,
		true
	},
	idolmaster_voice_name_feeling3 = {
		613932,
		101,
		true
	},
	idolmaster_voice_name_feeling4 = {
		614033,
		104,
		true
	},
	idolmaster_voice_name_feeling5 = {
		614137,
		102,
		true
	},
	idolmaster_voice_name_propose = {
		614239,
		98,
		true
	},
	cartoon_all = {
		614337,
		78,
		true
	},
	cartoon_notall = {
		614415,
		84,
		true
	},
	cartoon_haveno = {
		614499,
		111,
		true
	},
	res_cartoon_new_tip = {
		614610,
		108,
		true
	},
	memory_actiivty_ex = {
		614718,
		87,
		true
	},
	memory_activity_sp = {
		614805,
		89,
		true
	},
	memory_activity_daily = {
		614894,
		89,
		true
	},
	memory_activity_others = {
		614983,
		90,
		true
	},
	battle_end_title = {
		615073,
		94,
		true
	},
	battle_end_subtitle1 = {
		615167,
		91,
		true
	},
	battle_end_subtitle2 = {
		615258,
		101,
		true
	},
	meta_skill_dailyexp = {
		615359,
		92,
		true
	},
	meta_skill_learn = {
		615451,
		127,
		true
	},
	meta_skill_maxtip = {
		615578,
		203,
		true
	},
	meta_tactics_detail = {
		615781,
		90,
		true
	},
	meta_tactics_unlock = {
		615871,
		91,
		true
	},
	meta_tactics_switch = {
		615962,
		91,
		true
	},
	meta_skill_maxtip2 = {
		616053,
		91,
		true
	},
	activity_permanent_progress = {
		616144,
		100,
		true
	},
	cattery_settlement_dialogue_1 = {
		616244,
		116,
		true
	},
	cattery_settlement_dialogue_2 = {
		616360,
		131,
		true
	},
	cattery_settlement_dialogue_3 = {
		616491,
		115,
		true
	},
	cattery_settlement_dialogue_4 = {
		616606,
		102,
		true
	},
	blueprint_catchup_by_gold_confirm = {
		616708,
		153,
		true
	},
	blueprint_catchup_by_gold_help = {
		616861,
		318,
		true
	},
	tec_tip_no_consumption = {
		617179,
		90,
		true
	},
	tec_tip_material_stock = {
		617269,
		91,
		true
	},
	tec_tip_to_consumption = {
		617360,
		91,
		true
	},
	onebutton_max_tip = {
		617451,
		96,
		true
	},
	target_get_tip = {
		617547,
		89,
		true
	},
	fleet_select_title = {
		617636,
		94,
		true
	},
	backyard_rename_title = {
		617730,
		96,
		true
	},
	backyard_rename_tip = {
		617826,
		105,
		true
	},
	equip_add = {
		617931,
		99,
		true
	},
	equipskin_add = {
		618030,
		108,
		true
	},
	equipskin_none = {
		618138,
		109,
		true
	},
	equipskin_typewrong = {
		618247,
		117,
		true
	},
	equipskin_typewrong_en = {
		618364,
		108,
		true
	},
	user_is_banned = {
		618472,
		134,
		true
	},
	user_is_forever_banned = {
		618606,
		116,
		true
	},
	old_class_is_close = {
		618722,
		144,
		true
	},
	activity_event_building = {
		618866,
		1210,
		true
	},
	salvage_tips = {
		620076,
		1124,
		true
	},
	tips_shakebeads = {
		621200,
		1036,
		true
	},
	gem_shop_xinzhi_tip = {
		622236,
		113,
		true
	},
	cowboy_tips = {
		622349,
		708,
		true
	},
	backyard_backyardScene_Disable_Rotation = {
		623057,
		137,
		true
	},
	chazi_tips = {
		623194,
		886,
		true
	},
	catchteasure_help = {
		624080,
		453,
		true
	},
	unlock_tips = {
		624533,
		93,
		true
	},
	class_label_tran = {
		624626,
		87,
		true
	},
	class_label_gen = {
		624713,
		88,
		true
	},
	class_attr_store = {
		624801,
		89,
		true
	},
	class_attr_proficiency = {
		624890,
		103,
		true
	},
	class_attr_getproficiency = {
		624993,
		105,
		true
	},
	class_attr_costproficiency = {
		625098,
		104,
		true
	},
	class_label_upgrading = {
		625202,
		94,
		true
	},
	class_label_upgradetime = {
		625296,
		99,
		true
	},
	class_label_oilfield = {
		625395,
		98,
		true
	},
	class_label_goldfield = {
		625493,
		100,
		true
	},
	class_res_maxlevel_tip = {
		625593,
		95,
		true
	},
	ship_exp_item_title = {
		625688,
		93,
		true
	},
	ship_exp_item_label_clear = {
		625781,
		94,
		true
	},
	ship_exp_item_label_recom = {
		625875,
		93,
		true
	},
	ship_exp_item_label_confirm = {
		625968,
		98,
		true
	},
	player_expResource_mail_fullBag = {
		626066,
		200,
		true
	},
	tec_nation_award_finish = {
		626266,
		98,
		true
	},
	coures_exp_overflow_tip = {
		626364,
		202,
		true
	},
	coures_exp_npc_tip = {
		626566,
		221,
		true
	},
	coures_level_tip = {
		626787,
		162,
		true
	},
	coures_tip_material_stock = {
		626949,
		94,
		true
	},
	coures_tip_exceeded_lv = {
		627043,
		123,
		true
	},
	eatgame_tips = {
		627166,
		844,
		true
	},
	breakout_tip_ultimatebonus_gunner = {
		628010,
		145,
		true
	},
	breakout_tip_ultimatebonus_torpedo = {
		628155,
		130,
		true
	},
	breakout_tip_ultimatebonus_aux = {
		628285,
		133,
		true
	},
	map_event_lighthouse_tip_1 = {
		628418,
		161,
		true
	},
	battlepass_main_tip_2110 = {
		628579,
		202,
		true
	},
	battlepass_main_time = {
		628781,
		94,
		true
	},
	battlepass_main_help_2110 = {
		628875,
		2880,
		true
	},
	cruise_task_help_2110 = {
		631755,
		1094,
		true
	},
	cruise_task_phase = {
		632849,
		106,
		true
	},
	cruise_task_tips = {
		632955,
		89,
		true
	},
	battlepass_task_quickfinish1 = {
		633044,
		231,
		true
	},
	battlepass_task_quickfinish2 = {
		633275,
		224,
		true
	},
	battlepass_task_quickfinish3 = {
		633499,
		102,
		true
	},
	cruise_task_unlock = {
		633601,
		107,
		true
	},
	cruise_task_week = {
		633708,
		87,
		true
	},
	battlepass_pay_timelimit = {
		633795,
		101,
		true
	},
	battlepass_pay_acquire = {
		633896,
		101,
		true
	},
	battlepass_pay_attention = {
		633997,
		159,
		true
	},
	battlepass_acquire_attention = {
		634156,
		189,
		true
	},
	battlepass_pay_tip = {
		634345,
		121,
		true
	},
	battlepass_main_tip1 = {
		634466,
		226,
		true
	},
	battlepass_main_tip2 = {
		634692,
		209,
		true
	},
	battlepass_main_tip3 = {
		634901,
		215,
		true
	},
	battlepass_complete = {
		635116,
		121,
		true
	},
	shop_free_tag = {
		635237,
		81,
		true
	},
	quick_equip_tip1 = {
		635318,
		86,
		true
	},
	quick_equip_tip2 = {
		635404,
		86,
		true
	},
	quick_equip_tip3 = {
		635490,
		85,
		true
	},
	quick_equip_tip4 = {
		635575,
		97,
		true
	},
	quick_equip_tip5 = {
		635672,
		127,
		true
	},
	quick_equip_tip6 = {
		635799,
		184,
		true
	},
	retire_importantequipment_tips = {
		635983,
		179,
		true
	},
	settle_rewards_title = {
		636162,
		109,
		true
	},
	settle_rewards_subtitle = {
		636271,
		101,
		true
	},
	total_rewards_subtitle = {
		636372,
		99,
		true
	},
	settle_rewards_text = {
		636471,
		99,
		true
	},
	use_oil_limit_help = {
		636570,
		243,
		true
	},
	formationScene_use_oil_limit_tip = {
		636813,
		107,
		true
	},
	index_awakening2 = {
		636920,
		93,
		true
	},
	index_upgrade = {
		637013,
		91,
		true
	},
	formationScene_use_oil_limit_enemy = {
		637104,
		104,
		true
	},
	formationScene_use_oil_limit_flagship = {
		637208,
		109,
		true
	},
	formationScene_use_oil_limit_submarine = {
		637317,
		104,
		true
	},
	formationScene_use_oil_limit_surface = {
		637421,
		107,
		true
	},
	formationScene_use_oil_limit_tip_worldboss = {
		637528,
		117,
		true
	},
	attr_durability = {
		637645,
		81,
		true
	},
	attr_armor = {
		637726,
		79,
		true
	},
	attr_reload = {
		637805,
		78,
		true
	},
	attr_cannon = {
		637883,
		77,
		true
	},
	attr_torpedo = {
		637960,
		79,
		true
	},
	attr_motion = {
		638039,
		78,
		true
	},
	attr_antiaircraft = {
		638117,
		83,
		true
	},
	attr_air = {
		638200,
		75,
		true
	},
	attr_hit = {
		638275,
		75,
		true
	},
	attr_antisub = {
		638350,
		79,
		true
	},
	attr_oxy_max = {
		638429,
		79,
		true
	},
	attr_ammo = {
		638508,
		76,
		true
	},
	attr_hunting_range = {
		638584,
		85,
		true
	},
	attr_luck = {
		638669,
		76,
		true
	},
	attr_consume = {
		638745,
		80,
		true
	},
	attr_speed = {
		638825,
		77,
		true
	},
	monthly_card_tip = {
		638902,
		80,
		true
	},
	shopping_error_time_limit = {
		638982,
		138,
		true
	},
	world_total_power = {
		639120,
		86,
		true
	},
	world_mileage = {
		639206,
		91,
		true
	},
	world_pressing = {
		639297,
		91,
		true
	},
	Settings_title_FPS = {
		639388,
		101,
		true
	},
	Settings_title_Notification = {
		639489,
		109,
		true
	},
	Settings_title_Other = {
		639598,
		97,
		true
	},
	Settings_title_LoginJP = {
		639695,
		99,
		true
	},
	Settings_title_Redeem = {
		639794,
		94,
		true
	},
	Settings_title_AdjustScr = {
		639888,
		101,
		true
	},
	Settings_title_Secpw = {
		639989,
		98,
		true
	},
	Settings_title_Secpwlimop = {
		640087,
		110,
		true
	},
	Settings_title_agreement = {
		640197,
		100,
		true
	},
	Settings_title_sound = {
		640297,
		98,
		true
	},
	Settings_title_resUpdate = {
		640395,
		103,
		true
	},
	equipment_info_change_tip = {
		640498,
		138,
		true
	},
	equipment_info_change_name_a = {
		640636,
		126,
		true
	},
	equipment_info_change_name_b = {
		640762,
		126,
		true
	},
	equipment_info_change_text_before = {
		640888,
		103,
		true
	},
	equipment_info_change_text_after = {
		640991,
		101,
		true
	},
	equipment_info_change_strengthen = {
		641092,
		277,
		true
	},
	world_boss_progress_tip_title = {
		641369,
		122,
		true
	},
	world_boss_progress_tip_desc = {
		641491,
		354,
		true
	},
	ssss_main_help = {
		641845,
		1932,
		true
	},
	mini_game_time = {
		643777,
		88,
		true
	},
	mini_game_score = {
		643865,
		85,
		true
	},
	mini_game_leave = {
		643950,
		93,
		true
	},
	mini_game_pause = {
		644043,
		96,
		true
	},
	mini_game_cur_score = {
		644139,
		97,
		true
	},
	mini_game_high_score = {
		644236,
		95,
		true
	},
	monopoly_world_tip1 = {
		644331,
		96,
		true
	},
	monopoly_world_tip2 = {
		644427,
		237,
		true
	},
	monopoly_world_tip3 = {
		644664,
		212,
		true
	},
	help_monopoly_world = {
		644876,
		1414,
		true
	},
	ssssmedal_tip = {
		646290,
		142,
		true
	},
	ssssmedal_name = {
		646432,
		107,
		true
	},
	ssssmedal_belonging = {
		646539,
		112,
		true
	},
	ssssmedal_name1 = {
		646651,
		108,
		true
	},
	ssssmedal_name2 = {
		646759,
		105,
		true
	},
	ssssmedal_name3 = {
		646864,
		107,
		true
	},
	ssssmedal_name4 = {
		646971,
		109,
		true
	},
	ssssmedal_name5 = {
		647080,
		109,
		true
	},
	ssssmedal_name6 = {
		647189,
		85,
		true
	},
	ssssmedal_belonging1 = {
		647274,
		92,
		true
	},
	ssssmedal_belonging2 = {
		647366,
		99,
		true
	},
	ssssmedal_desc1 = {
		647465,
		168,
		true
	},
	ssssmedal_desc2 = {
		647633,
		158,
		true
	},
	ssssmedal_desc3 = {
		647791,
		168,
		true
	},
	ssssmedal_desc4 = {
		647959,
		155,
		true
	},
	ssssmedal_desc5 = {
		648114,
		180,
		true
	},
	ssssmedal_desc6 = {
		648294,
		131,
		true
	},
	show_fate_demand_count = {
		648425,
		154,
		true
	},
	show_design_demand_count = {
		648579,
		151,
		true
	},
	blueprint_select_overflow = {
		648730,
		124,
		true
	},
	blueprint_select_overflow_tip = {
		648854,
		188,
		true
	},
	blueprint_exchange_empty_tip = {
		649042,
		131,
		true
	},
	blueprint_exchange_select_display = {
		649173,
		128,
		true
	},
	build_rate_title = {
		649301,
		91,
		true
	},
	build_pools_intro = {
		649392,
		116,
		true
	},
	build_detail_intro = {
		649508,
		106,
		true
	},
	ssss_game_tip = {
		649614,
		1498,
		true
	},
	ssss_medal_tip = {
		651112,
		401,
		true
	},
	battlepass_main_tip_2112 = {
		651513,
		233,
		true
	},
	battlepass_main_help_2112 = {
		651746,
		2887,
		true
	},
	cruise_task_help_2112 = {
		654633,
		1085,
		true
	},
	littleSanDiego_npc = {
		655718,
		1223,
		true
	},
	tag_ship_unlocked = {
		656941,
		95,
		true
	},
	tag_ship_locked = {
		657036,
		91,
		true
	},
	acceleration_tips_1 = {
		657127,
		203,
		true
	},
	acceleration_tips_2 = {
		657330,
		228,
		true
	},
	noacceleration_tips = {
		657558,
		119,
		true
	},
	word_shipskin = {
		657677,
		82,
		true
	},
	settings_sound_title_bgm = {
		657759,
		99,
		true
	},
	settings_sound_title_effct = {
		657858,
		101,
		true
	},
	settings_sound_title_cv = {
		657959,
		100,
		true
	},
	setting_resdownload_title_gallery = {
		658059,
		111,
		true
	},
	setting_resdownload_title_live2d = {
		658170,
		109,
		true
	},
	setting_resdownload_title_music = {
		658279,
		105,
		true
	},
	setting_resdownload_title_sound = {
		658384,
		108,
		true
	},
	setting_resdownload_title_manga = {
		658492,
		108,
		true
	},
	setting_resdownload_title_dorm = {
		658600,
		115,
		true
	},
	setting_resdownload_title_main_group = {
		658715,
		117,
		true
	},
	settings_battle_title = {
		658832,
		103,
		true
	},
	settings_battle_tip = {
		658935,
		144,
		true
	},
	settings_battle_Btn_edit = {
		659079,
		92,
		true
	},
	settings_battle_Btn_reset = {
		659171,
		96,
		true
	},
	settings_battle_Btn_save = {
		659267,
		92,
		true
	},
	settings_battle_Btn_cancel = {
		659359,
		96,
		true
	},
	settings_pwd_label_close = {
		659455,
		96,
		true
	},
	settings_pwd_label_open = {
		659551,
		94,
		true
	},
	word_frame = {
		659645,
		78,
		true
	},
	Settings_title_Redeem_input_label = {
		659723,
		109,
		true
	},
	Settings_title_Redeem_input_submit = {
		659832,
		104,
		true
	},
	Settings_title_Redeem_input_placeholder = {
		659936,
		140,
		true
	},
	CurlingGame_tips1 = {
		660076,
		1153,
		true
	},
	maid_task_tips1 = {
		661229,
		1030,
		true
	},
	shop_diamond_title = {
		662259,
		86,
		true
	},
	shop_gift_title = {
		662345,
		84,
		true
	},
	shop_item_title = {
		662429,
		84,
		true
	},
	shop_charge_level_limit = {
		662513,
		102,
		true
	},
	backhill_cantupbuilding = {
		662615,
		135,
		true
	},
	pray_cant_tips = {
		662750,
		133,
		true
	},
	help_xinnian2022_feast = {
		662883,
		2200,
		true
	},
	Pray_activity_tips1 = {
		665083,
		1560,
		true
	},
	backhill_notenoughbuilding = {
		666643,
		184,
		true
	},
	help_xinnian2022_z28 = {
		666827,
		766,
		true
	},
	help_xinnian2022_firework = {
		667593,
		1156,
		true
	},
	settings_title_account_del = {
		668749,
		97,
		true
	},
	settings_text_account_del = {
		668846,
		105,
		true
	},
	settings_text_account_del_desc = {
		668951,
		290,
		true
	},
	settings_text_account_del_confirm = {
		669241,
		150,
		true
	},
	settings_text_account_del_btn = {
		669391,
		99,
		true
	},
	box_account_del_input = {
		669490,
		142,
		true
	},
	box_account_del_target = {
		669632,
		92,
		true
	},
	box_account_del_click = {
		669724,
		100,
		true
	},
	box_account_del_success_content = {
		669824,
		131,
		true
	},
	box_account_reborn_content = {
		669955,
		211,
		true
	},
	tip_account_del_dismatch = {
		670166,
		120,
		true
	},
	tip_account_del_reborn = {
		670286,
		135,
		true
	},
	player_manifesto_placeholder = {
		670421,
		110,
		true
	},
	box_ship_del_click = {
		670531,
		95,
		true
	},
	box_equipment_del_click = {
		670626,
		100,
		true
	},
	change_player_name_title = {
		670726,
		103,
		true
	},
	change_player_name_subtitle = {
		670829,
		111,
		true
	},
	change_player_name_input_tip = {
		670940,
		112,
		true
	},
	change_player_name_illegal = {
		671052,
		241,
		true
	},
	nodisplay_player_home_name = {
		671293,
		94,
		true
	},
	nodisplay_player_home_share = {
		671387,
		97,
		true
	},
	tactics_class_start = {
		671484,
		88,
		true
	},
	tactics_class_cancel = {
		671572,
		90,
		true
	},
	tactics_class_get_exp = {
		671662,
		94,
		true
	},
	tactics_class_spend_time = {
		671756,
		99,
		true
	},
	build_ticket_description = {
		671855,
		118,
		true
	},
	build_ticket_expire_warning = {
		671973,
		103,
		true
	},
	tip_build_ticket_expired = {
		672076,
		135,
		true
	},
	tip_build_ticket_exchange_expired = {
		672211,
		174,
		true
	},
	tip_build_ticket_not_enough = {
		672385,
		107,
		true
	},
	build_ship_tip_use_ticket = {
		672492,
		195,
		true
	},
	springfes_tips1 = {
		672687,
		907,
		true
	},
	worldinpicture_tavel_point_tip = {
		673594,
		126,
		true
	},
	worldinpicture_draw_point_tip = {
		673720,
		122,
		true
	},
	worldinpicture_help = {
		673842,
		1037,
		true
	},
	worldinpicture_task_help = {
		674879,
		1042,
		true
	},
	worldinpicture_not_area_can_draw = {
		675921,
		135,
		true
	},
	missile_attack_area_confirm = {
		676056,
		104,
		true
	},
	missile_attack_area_cancel = {
		676160,
		103,
		true
	},
	shipchange_alert_infleet = {
		676263,
		157,
		true
	},
	shipchange_alert_inpvp = {
		676420,
		168,
		true
	},
	shipchange_alert_inexercise = {
		676588,
		174,
		true
	},
	shipchange_alert_inworld = {
		676762,
		168,
		true
	},
	shipchange_alert_inguildbossevent = {
		676930,
		177,
		true
	},
	shipchange_alert_indiff = {
		677107,
		156,
		true
	},
	shipmodechange_reject_1stfleet_only = {
		677263,
		210,
		true
	},
	shipmodechange_reject_worldfleet_only = {
		677473,
		215,
		true
	},
	monopoly3thre_tip = {
		677688,
		151,
		true
	},
	fushun_game3_tip = {
		677839,
		1291,
		true
	},
	battlepass_main_tip_2202 = {
		679130,
		197,
		true
	},
	battlepass_main_help_2202 = {
		679327,
		2890,
		true
	},
	cruise_task_help_2202 = {
		682217,
		1092,
		true
	},
	battlepass_main_tip_2204 = {
		683309,
		200,
		true
	},
	battlepass_main_help_2204 = {
		683509,
		2881,
		true
	},
	cruise_task_help_2204 = {
		686390,
		1092,
		true
	},
	battlepass_main_tip_2206 = {
		687482,
		200,
		true
	},
	battlepass_main_help_2206 = {
		687682,
		2889,
		true
	},
	cruise_task_help_2206 = {
		690571,
		1092,
		true
	},
	battlepass_main_tip_2208 = {
		691663,
		199,
		true
	},
	battlepass_main_help_2208 = {
		691862,
		2893,
		true
	},
	cruise_task_help_2208 = {
		694755,
		1092,
		true
	},
	battlepass_main_tip_2210 = {
		695847,
		201,
		true
	},
	battlepass_main_help_2210 = {
		696048,
		2893,
		true
	},
	cruise_task_help_2210 = {
		698941,
		1092,
		true
	},
	battlepass_main_tip_2212 = {
		700033,
		224,
		true
	},
	battlepass_main_help_2212 = {
		700257,
		2900,
		true
	},
	cruise_task_help_2212 = {
		703157,
		1092,
		true
	},
	battlepass_main_tip_2302 = {
		704249,
		225,
		true
	},
	battlepass_main_help_2302 = {
		704474,
		2895,
		true
	},
	cruise_task_help_2302 = {
		707369,
		1092,
		true
	},
	battlepass_main_tip_2304 = {
		708461,
		233,
		true
	},
	battlepass_main_help_2304 = {
		708694,
		2913,
		true
	},
	cruise_task_help_2304 = {
		711607,
		1092,
		true
	},
	battlepass_main_tip_2306 = {
		712699,
		195,
		true
	},
	battlepass_main_help_2306 = {
		712894,
		2883,
		true
	},
	cruise_task_help_2306 = {
		715777,
		1092,
		true
	},
	battlepass_main_tip_2308 = {
		716869,
		197,
		true
	},
	battlepass_main_help_2308 = {
		717066,
		2885,
		true
	},
	cruise_task_help_2308 = {
		719951,
		1092,
		true
	},
	battlepass_main_tip_2310 = {
		721043,
		200,
		true
	},
	battlepass_main_help_2310 = {
		721243,
		2893,
		true
	},
	cruise_task_help_2310 = {
		724136,
		1092,
		true
	},
	battlepass_main_tip_2312 = {
		725228,
		196,
		true
	},
	battlepass_main_help_2312 = {
		725424,
		2898,
		true
	},
	cruise_task_help_2312 = {
		728322,
		1092,
		true
	},
	battlepass_main_tip_2402 = {
		729414,
		197,
		true
	},
	battlepass_main_help_2402 = {
		729611,
		2891,
		true
	},
	cruise_task_help_2402 = {
		732502,
		1092,
		true
	},
	battlepass_main_tip_2404 = {
		733594,
		223,
		true
	},
	battlepass_main_help_2404 = {
		733817,
		2901,
		true
	},
	cruise_task_help_2404 = {
		736718,
		1096,
		true
	},
	attrset_reset = {
		737814,
		82,
		true
	},
	attrset_save = {
		737896,
		80,
		true
	},
	attrset_ask_save = {
		737976,
		133,
		true
	},
	attrset_save_success = {
		738109,
		103,
		true
	},
	attrset_disable = {
		738212,
		147,
		true
	},
	attrset_input_ill = {
		738359,
		93,
		true
	},
	blackfriday_help = {
		738452,
		805,
		true
	},
	eventshop_time_hint = {
		739257,
		100,
		true
	},
	purchase_backyard_theme_desc_for_onekey = {
		739357,
		142,
		true
	},
	purchase_backyard_theme_desc_for_all = {
		739499,
		127,
		true
	},
	sp_no_quota = {
		739626,
		108,
		true
	},
	fur_all_buy = {
		739734,
		82,
		true
	},
	fur_onekey_buy = {
		739816,
		85,
		true
	},
	littleRenown_npc = {
		739901,
		1402,
		true
	},
	tech_package_tip = {
		741303,
		241,
		true
	},
	backyard_food_shop_tip = {
		741544,
		96,
		true
	},
	dorm_2f_lock = {
		741640,
		82,
		true
	},
	word_get_way = {
		741722,
		90,
		true
	},
	word_get_date = {
		741812,
		94,
		true
	},
	enter_theme_name = {
		741906,
		113,
		true
	},
	enter_extend_food_label = {
		742019,
		93,
		true
	},
	backyard_extend_tip_1 = {
		742112,
		90,
		true
	},
	backyard_extend_tip_2 = {
		742202,
		103,
		true
	},
	backyard_extend_tip_3 = {
		742305,
		94,
		true
	},
	backyard_extend_tip_4 = {
		742399,
		85,
		true
	},
	email_text = {
		742484,
		79,
		true
	},
	emailhold_text = {
		742563,
		127,
		true
	},
	code_text = {
		742690,
		90,
		true
	},
	codehold_text = {
		742780,
		102,
		true
	},
	genBtn_text = {
		742882,
		83,
		true
	},
	desc_text = {
		742965,
		156,
		true
	},
	loginBtn_text = {
		743121,
		84,
		true
	},
	verification_code_req_tip1 = {
		743205,
		126,
		true
	},
	verification_code_req_tip2 = {
		743331,
		175,
		true
	},
	verification_code_req_tip3 = {
		743506,
		134,
		true
	},
	levelScene_remaster_story_tip = {
		743640,
		176,
		true
	},
	levelScene_remaster_unlock_tip = {
		743816,
		188,
		true
	},
	linkBtn_text = {
		744004,
		83,
		true
	},
	yostar_link_title = {
		744087,
		98,
		true
	},
	level_remaster_tip1 = {
		744185,
		95,
		true
	},
	level_remaster_tip2 = {
		744280,
		89,
		true
	},
	level_remaster_tip3 = {
		744369,
		90,
		true
	},
	level_remaster_tip4 = {
		744459,
		102,
		true
	},
	pay_cancel = {
		744561,
		88,
		true
	},
	order_error = {
		744649,
		101,
		true
	},
	pay_fail = {
		744750,
		86,
		true
	},
	user_cancel = {
		744836,
		94,
		true
	},
	system_error = {
		744930,
		88,
		true
	},
	time_out = {
		745018,
		109,
		true
	},
	server_error = {
		745127,
		102,
		true
	},
	data_error = {
		745229,
		98,
		true
	},
	share_success = {
		745327,
		97,
		true
	},
	shoot_screen_fail = {
		745424,
		98,
		true
	},
	server_name = {
		745522,
		87,
		true
	},
	non_support_share = {
		745609,
		134,
		true
	},
	save_success = {
		745743,
		99,
		true
	},
	word_guild_join_err1 = {
		745842,
		115,
		true
	},
	task_empty_tip_1 = {
		745957,
		104,
		true
	},
	task_empty_tip_2 = {
		746061,
		160,
		true
	},
	["airi_error_code_ 100210"] = {
		746221,
		126,
		true
	},
	["airi_error_code_ 100211"] = {
		746347,
		138,
		true
	},
	["airi_error_code_ 100212"] = {
		746485,
		116,
		true
	},
	["airi_error_code_ 100610"] = {
		746601,
		125,
		true
	},
	["airi_error_code_ 100611"] = {
		746726,
		120,
		true
	},
	["airi_error_code_ 100612"] = {
		746846,
		132,
		true
	},
	["airi_error_code_ 100710"] = {
		746978,
		127,
		true
	},
	["airi_error_code_ 100711"] = {
		747105,
		127,
		true
	},
	["airi_error_code_ 100712"] = {
		747232,
		135,
		true
	},
	["airi_error_code_ 100810"] = {
		747367,
		126,
		true
	},
	["airi_error_code_ 100811"] = {
		747493,
		138,
		true
	},
	["airi_error_code_ 100812"] = {
		747631,
		133,
		true
	},
	["airi_error_code_ 100813"] = {
		747764,
		125,
		true
	},
	["airi_error_code_ 100814"] = {
		747889,
		120,
		true
	},
	["airi_error_code_ 100815"] = {
		748009,
		132,
		true
	},
	["airi_error_code_ 100816"] = {
		748141,
		127,
		true
	},
	["airi_error_code_ 100817"] = {
		748268,
		127,
		true
	},
	["airi_error_code_ 100818"] = {
		748395,
		134,
		true
	},
	facebook_link_title = {
		748529,
		102,
		true
	},
	newserver_time = {
		748631,
		98,
		true
	},
	newserver_soldout = {
		748729,
		103,
		true
	},
	skill_learn_tip = {
		748832,
		133,
		true
	},
	newserver_build_tip = {
		748965,
		150,
		true
	},
	build_count_tip = {
		749115,
		85,
		true
	},
	help_research_package = {
		749200,
		299,
		true
	},
	lv70_package_tip = {
		749499,
		228,
		true
	},
	tech_select_tip1 = {
		749727,
		97,
		true
	},
	tech_select_tip2 = {
		749824,
		107,
		true
	},
	tech_select_tip3 = {
		749931,
		88,
		true
	},
	tech_select_tip4 = {
		750019,
		96,
		true
	},
	tech_select_tip5 = {
		750115,
		117,
		true
	},
	techpackage_item_use = {
		750232,
		203,
		true
	},
	techpackage_item_use_1 = {
		750435,
		238,
		true
	},
	techpackage_item_use_2 = {
		750673,
		200,
		true
	},
	techpackage_item_use_confirm = {
		750873,
		138,
		true
	},
	new_server_shop_sel_goods_tip = {
		751011,
		130,
		true
	},
	new_server_shop_unopen_tip = {
		751141,
		101,
		true
	},
	newserver_activity_tip = {
		751242,
		1685,
		true
	},
	newserver_shop_timelimit = {
		752927,
		106,
		true
	},
	tech_character_get = {
		753033,
		89,
		true
	},
	package_detail_tip = {
		753122,
		88,
		true
	},
	event_ui_consume = {
		753210,
		84,
		true
	},
	event_ui_recommend = {
		753294,
		91,
		true
	},
	event_ui_start = {
		753385,
		83,
		true
	},
	event_ui_giveup = {
		753468,
		85,
		true
	},
	event_ui_finish = {
		753553,
		87,
		true
	},
	nav_tactics_sel_skill_title = {
		753640,
		103,
		true
	},
	battle_result_confirm = {
		753743,
		92,
		true
	},
	battle_result_targets = {
		753835,
		92,
		true
	},
	battle_result_continue = {
		753927,
		103,
		true
	},
	index_L2D = {
		754030,
		76,
		true
	},
	index_DBG = {
		754106,
		84,
		true
	},
	index_BG = {
		754190,
		82,
		true
	},
	index_CANTUSE = {
		754272,
		91,
		true
	},
	index_UNUSE = {
		754363,
		81,
		true
	},
	index_BGM = {
		754444,
		84,
		true
	},
	without_ship_to_wear = {
		754528,
		124,
		true
	},
	choose_ship_to_wear_this_skin = {
		754652,
		136,
		true
	},
	skinatlas_search_holder = {
		754788,
		113,
		true
	},
	skinatlas_search_result_is_empty = {
		754901,
		143,
		true
	},
	chang_ship_skin_window_title = {
		755044,
		96,
		true
	},
	world_boss_item_info = {
		755140,
		350,
		true
	},
	world_past_boss_item_info = {
		755490,
		480,
		true
	},
	world_boss_lefttime = {
		755970,
		92,
		true
	},
	world_boss_item_count_noenough = {
		756062,
		145,
		true
	},
	world_boss_item_usage_tip = {
		756207,
		173,
		true
	},
	world_boss_no_select_archives = {
		756380,
		161,
		true
	},
	world_boss_archives_item_count_noenough = {
		756541,
		157,
		true
	},
	world_boss_archives_are_clear = {
		756698,
		156,
		true
	},
	world_boss_switch_archives = {
		756854,
		248,
		true
	},
	world_boss_switch_archives_success = {
		757102,
		146,
		true
	},
	world_boss_archives_auto_battle_unopen = {
		757248,
		169,
		true
	},
	world_boss_archives_need_stop_auto_battle = {
		757417,
		164,
		true
	},
	world_boss_archives_stop_auto_battle = {
		757581,
		137,
		true
	},
	world_boss_archives_continue_auto_battle = {
		757718,
		140,
		true
	},
	world_boss_archives_auto_battle_reusle_title = {
		757858,
		145,
		true
	},
	world_boss_archives_stop_auto_battle_title = {
		758003,
		146,
		true
	},
	world_boss_archives_stop_auto_battle_tip = {
		758149,
		119,
		true
	},
	world_boss_archives_stop_auto_battle_tip1 = {
		758268,
		241,
		true
	},
	world_archives_boss_help = {
		758509,
		3343,
		true
	},
	world_archives_boss_list_help = {
		761852,
		570,
		true
	},
	archives_boss_was_opened = {
		762422,
		163,
		true
	},
	current_boss_was_opened = {
		762585,
		162,
		true
	},
	world_boss_title_auto_battle = {
		762747,
		103,
		true
	},
	world_boss_title_highest_damge = {
		762850,
		105,
		true
	},
	world_boss_title_estimation = {
		762955,
		113,
		true
	},
	world_boss_title_battle_cnt = {
		763068,
		99,
		true
	},
	world_boss_title_consume_oil_cnt = {
		763167,
		104,
		true
	},
	world_boss_title_spend_time = {
		763271,
		104,
		true
	},
	world_boss_title_total_damage = {
		763375,
		102,
		true
	},
	world_no_time_to_auto_battle = {
		763477,
		143,
		true
	},
	world_boss_current_boss_label = {
		763620,
		104,
		true
	},
	world_boss_current_boss_label1 = {
		763724,
		107,
		true
	},
	world_boss_archives_boss_tip = {
		763831,
		158,
		true
	},
	world_boss_progress_no_enough = {
		763989,
		127,
		true
	},
	world_boss_auto_battle_no_oil = {
		764116,
		119,
		true
	},
	meta_syn_value_label = {
		764235,
		108,
		true
	},
	meta_syn_finish = {
		764343,
		103,
		true
	},
	index_meta_repair = {
		764446,
		104,
		true
	},
	index_meta_tactics = {
		764550,
		103,
		true
	},
	index_meta_energy = {
		764653,
		104,
		true
	},
	tactics_continue_to_learn_other_skill = {
		764757,
		162,
		true
	},
	tactics_continue_to_learn_other_ship_skill = {
		764919,
		161,
		true
	},
	tactics_no_recent_ships = {
		765080,
		113,
		true
	},
	activity_kill = {
		765193,
		95,
		true
	},
	battle_result_dmg = {
		765288,
		87,
		true
	},
	battle_result_kill_count = {
		765375,
		100,
		true
	},
	battle_result_toggle_on = {
		765475,
		96,
		true
	},
	battle_result_toggle_off = {
		765571,
		101,
		true
	},
	battle_result_continue_battle = {
		765672,
		101,
		true
	},
	battle_result_quit_battle = {
		765773,
		96,
		true
	},
	battle_result_share_battle = {
		765869,
		95,
		true
	},
	pre_combat_team = {
		765964,
		91,
		true
	},
	pre_combat_vanguard = {
		766055,
		91,
		true
	},
	pre_combat_main = {
		766146,
		83,
		true
	},
	pre_combat_submarine = {
		766229,
		93,
		true
	},
	pre_combat_targets = {
		766322,
		89,
		true
	},
	pre_combat_atlasloot = {
		766411,
		88,
		true
	},
	destroy_confirm_access = {
		766499,
		93,
		true
	},
	destroy_confirm_cancel = {
		766592,
		92,
		true
	},
	pt_count_tip = {
		766684,
		81,
		true
	},
	dockyard_data_loss_detected = {
		766765,
		167,
		true
	},
	littleEugen_npc = {
		766932,
		1374,
		true
	},
	five_shujuhuigu = {
		768306,
		121,
		true
	},
	five_shujuhuigu1 = {
		768427,
		89,
		true
	},
	littleChaijun_npc = {
		768516,
		1290,
		true
	},
	five_qingdian = {
		769806,
		622,
		true
	},
	friend_resume_title_detail = {
		770428,
		94,
		true
	},
	item_type13_tip1 = {
		770522,
		88,
		true
	},
	item_type13_tip2 = {
		770610,
		88,
		true
	},
	item_type16_tip1 = {
		770698,
		88,
		true
	},
	item_type16_tip2 = {
		770786,
		88,
		true
	},
	item_type17_tip1 = {
		770874,
		87,
		true
	},
	item_type17_tip2 = {
		770961,
		87,
		true
	},
	five_duomaomao = {
		771048,
		788,
		true
	},
	main_4 = {
		771836,
		75,
		true
	},
	main_5 = {
		771911,
		75,
		true
	},
	honor_medal_support_tips_display = {
		771986,
		460,
		true
	},
	honor_medal_support_tips_confirm = {
		772446,
		207,
		true
	},
	support_rate_title = {
		772653,
		87,
		true
	},
	support_times_limited = {
		772740,
		128,
		true
	},
	support_times_tip = {
		772868,
		95,
		true
	},
	build_times_tip = {
		772963,
		90,
		true
	},
	tactics_recent_ship_label = {
		773053,
		105,
		true
	},
	title_info = {
		773158,
		78,
		true
	},
	eventshop_unlock_info = {
		773236,
		93,
		true
	},
	eventshop_unlock_hint = {
		773329,
		142,
		true
	},
	commission_event_tip = {
		773471,
		818,
		true
	},
	decoration_medal_placeholder = {
		774289,
		122,
		true
	},
	technology_filter_placeholder = {
		774411,
		119,
		true
	},
	eva_comment_send_null = {
		774530,
		101,
		true
	},
	report_sent_thank = {
		774631,
		156,
		true
	},
	report_ship_cannot_comment = {
		774787,
		127,
		true
	},
	report_cannot_comment = {
		774914,
		137,
		true
	},
	report_sent_title = {
		775051,
		87,
		true
	},
	report_sent_desc = {
		775138,
		130,
		true
	},
	report_type_1 = {
		775268,
		98,
		true
	},
	report_type_1_1 = {
		775366,
		146,
		true
	},
	report_type_2 = {
		775512,
		94,
		true
	},
	report_type_2_1 = {
		775606,
		146,
		true
	},
	report_type_3 = {
		775752,
		88,
		true
	},
	report_type_3_1 = {
		775840,
		177,
		true
	},
	report_type_other = {
		776017,
		85,
		true
	},
	report_type_other_1 = {
		776102,
		145,
		true
	},
	report_type_other_2 = {
		776247,
		115,
		true
	},
	report_sent_help = {
		776362,
		440,
		true
	},
	rename_input = {
		776802,
		93,
		true
	},
	avatar_task_level = {
		776895,
		169,
		true
	},
	avatar_upgrad_1 = {
		777064,
		92,
		true
	},
	avatar_upgrad_2 = {
		777156,
		92,
		true
	},
	avatar_upgrad_3 = {
		777248,
		94,
		true
	},
	avatar_task_ship_1 = {
		777342,
		92,
		true
	},
	avatar_task_ship_2 = {
		777434,
		103,
		true
	},
	technology_queue_complete = {
		777537,
		97,
		true
	},
	technology_queue_processing = {
		777634,
		102,
		true
	},
	technology_queue_waiting = {
		777736,
		94,
		true
	},
	technology_queue_getaward = {
		777830,
		94,
		true
	},
	technology_daily_refresh = {
		777924,
		119,
		true
	},
	technology_queue_full = {
		778043,
		113,
		true
	},
	technology_queue_in_mission_incomplete = {
		778156,
		177,
		true
	},
	technology_consume = {
		778333,
		95,
		true
	},
	technology_request = {
		778428,
		103,
		true
	},
	technology_queue_in_doublecheck = {
		778531,
		242,
		true
	},
	playervtae_setting_btn_label = {
		778773,
		100,
		true
	},
	technology_queue_in_success = {
		778873,
		130,
		true
	},
	star_require_enemy_text = {
		779003,
		116,
		true
	},
	star_require_enemy_title = {
		779119,
		107,
		true
	},
	star_require_enemy_check = {
		779226,
		95,
		true
	},
	worldboss_rank_timer_label = {
		779321,
		116,
		true
	},
	technology_detail = {
		779437,
		88,
		true
	},
	technology_mission_unfinish = {
		779525,
		127,
		true
	},
	word_chinese = {
		779652,
		82,
		true
	},
	word_japanese_2 = {
		779734,
		80,
		true
	},
	word_japanese = {
		779814,
		78,
		true
	},
	avatarframe_got = {
		779892,
		84,
		true
	},
	item_is_max_cnt = {
		779976,
		110,
		true
	},
	level_fleet_ship_desc = {
		780086,
		103,
		true
	},
	level_fleet_sub_desc = {
		780189,
		95,
		true
	},
	summerland_tip = {
		780284,
		560,
		true
	},
	icecreamgame_tip = {
		780844,
		1578,
		true
	},
	unlock_date_tip = {
		782422,
		118,
		true
	},
	guild_duty_shoule_be_deputy_commander = {
		782540,
		164,
		true
	},
	guild_deputy_commander_cnt_is_full = {
		782704,
		154,
		true
	},
	guild_deputy_commander_cnt = {
		782858,
		153,
		true
	},
	mail_filter_placeholder = {
		783011,
		107,
		true
	},
	recently_sticker_placeholder = {
		783118,
		111,
		true
	},
	backhill_campusfestival_tip = {
		783229,
		1219,
		true
	},
	mini_cookgametip = {
		784448,
		1297,
		true
	},
	cook_game_Albacore = {
		785745,
		115,
		true
	},
	cook_game_august = {
		785860,
		109,
		true
	},
	cook_game_elbe = {
		785969,
		107,
		true
	},
	cook_game_hakuryu = {
		786076,
		125,
		true
	},
	cook_game_howe = {
		786201,
		140,
		true
	},
	cook_game_marcopolo = {
		786341,
		114,
		true
	},
	cook_game_noshiro = {
		786455,
		126,
		true
	},
	cook_game_pnelope = {
		786581,
		130,
		true
	},
	cook_game_laffey = {
		786711,
		171,
		true
	},
	cook_game_janus = {
		786882,
		150,
		true
	},
	cook_game_flandre = {
		787032,
		100,
		true
	},
	cook_game_constellation = {
		787132,
		187,
		true
	},
	cook_game_constellation_skill_name = {
		787319,
		134,
		true
	},
	cook_game_constellation_skill_desc = {
		787453,
		206,
		true
	},
	random_ship_on = {
		787659,
		127,
		true
	},
	random_ship_off_0 = {
		787786,
		181,
		true
	},
	random_ship_off = {
		787967,
		190,
		true
	},
	random_ship_forbidden = {
		788157,
		174,
		true
	},
	random_ship_now = {
		788331,
		97,
		true
	},
	random_ship_label = {
		788428,
		97,
		true
	},
	player_vitae_skin_setting = {
		788525,
		102,
		true
	},
	random_ship_tips1 = {
		788627,
		167,
		true
	},
	random_ship_tips2 = {
		788794,
		145,
		true
	},
	random_ship_before = {
		788939,
		113,
		true
	},
	random_ship_and_skin_title = {
		789052,
		101,
		true
	},
	random_ship_frequse_mode = {
		789153,
		102,
		true
	},
	random_ship_locked_mode = {
		789255,
		99,
		true
	},
	littleSpee_npc = {
		789354,
		1583,
		true
	},
	random_flag_ship = {
		790937,
		96,
		true
	},
	random_flag_ship_changskinBtn_label = {
		791033,
		111,
		true
	},
	expedition_drop_use_out = {
		791144,
		152,
		true
	},
	expedition_extra_drop_tip = {
		791296,
		104,
		true
	},
	ex_pass_use = {
		791400,
		79,
		true
	},
	defense_formation_tip_npc = {
		791479,
		203,
		true
	},
	pgs_login_tip = {
		791682,
		250,
		true
	},
	pgs_login_binding_exist1 = {
		791932,
		204,
		true
	},
	pgs_login_binding_exist2 = {
		792136,
		205,
		true
	},
	pgs_login_binding_exist3 = {
		792341,
		271,
		true
	},
	pgs_binding_account = {
		792612,
		108,
		true
	},
	pgs_unbind = {
		792720,
		92,
		true
	},
	pgs_unbind_tip1 = {
		792812,
		152,
		true
	},
	pgs_unbind_tip2 = {
		792964,
		214,
		true
	},
	word_item = {
		793178,
		77,
		true
	},
	word_tool = {
		793255,
		77,
		true
	},
	word_other = {
		793332,
		78,
		true
	},
	ryza_word_equip = {
		793410,
		83,
		true
	},
	ryza_rest_produce_count = {
		793493,
		109,
		true
	},
	ryza_composite_confirm = {
		793602,
		119,
		true
	},
	ryza_composite_confirm_single = {
		793721,
		122,
		true
	},
	ryza_composite_count = {
		793843,
		93,
		true
	},
	ryza_toggle_only_composite = {
		793936,
		112,
		true
	},
	ryza_tip_select_recipe = {
		794048,
		113,
		true
	},
	ryza_tip_put_materials = {
		794161,
		139,
		true
	},
	ryza_tip_composite_unlock = {
		794300,
		158,
		true
	},
	ryza_tip_unlock_all_tools = {
		794458,
		151,
		true
	},
	ryza_material_not_enough = {
		794609,
		168,
		true
	},
	ryza_tip_composite_invalid = {
		794777,
		132,
		true
	},
	ryza_tip_max_composite_count = {
		794909,
		136,
		true
	},
	ryza_tip_no_item = {
		795045,
		119,
		true
	},
	ryza_ui_show_acess = {
		795164,
		92,
		true
	},
	ryza_tip_no_recipe = {
		795256,
		103,
		true
	},
	ryza_tip_item_access = {
		795359,
		136,
		true
	},
	ryza_tip_control_buff_not_obtain_tip = {
		795495,
		143,
		true
	},
	ryza_tip_control_buff_upgrade = {
		795638,
		100,
		true
	},
	ryza_tip_control_buff_replace = {
		795738,
		100,
		true
	},
	ryza_tip_control_buff_limit = {
		795838,
		96,
		true
	},
	ryza_tip_control_buff_already_active_tip = {
		795934,
		111,
		true
	},
	ryza_tip_control_buff = {
		796045,
		163,
		true
	},
	ryza_tip_control_buff_not_obtain = {
		796208,
		103,
		true
	},
	ryza_tip_control = {
		796311,
		142,
		true
	},
	ryza_tip_main = {
		796453,
		1454,
		true
	},
	battle_levelScene_ryza_lock = {
		797907,
		186,
		true
	},
	ryza_tip_toast_item_got = {
		798093,
		96,
		true
	},
	ryza_composite_help_tip = {
		798189,
		476,
		true
	},
	ryza_control_help_tip = {
		798665,
		296,
		true
	},
	ryza_mini_game = {
		798961,
		351,
		true
	},
	ryza_task_level_desc = {
		799312,
		89,
		true
	},
	ryza_task_tag_explore = {
		799401,
		90,
		true
	},
	ryza_task_tag_battle = {
		799491,
		88,
		true
	},
	ryza_task_tag_dalegate = {
		799579,
		91,
		true
	},
	ryza_task_tag_develop = {
		799670,
		89,
		true
	},
	ryza_task_tag_adventure = {
		799759,
		97,
		true
	},
	ryza_task_tag_build = {
		799856,
		93,
		true
	},
	ryza_task_tag_create = {
		799949,
		92,
		true
	},
	ryza_task_tag_daily = {
		800041,
		90,
		true
	},
	ryza_task_detail_content = {
		800131,
		99,
		true
	},
	ryza_task_detail_award = {
		800230,
		93,
		true
	},
	ryza_task_go = {
		800323,
		83,
		true
	},
	ryza_task_get = {
		800406,
		84,
		true
	},
	ryza_task_get_all = {
		800490,
		92,
		true
	},
	ryza_task_confirm = {
		800582,
		88,
		true
	},
	ryza_task_cancel = {
		800670,
		86,
		true
	},
	ryza_task_level_num = {
		800756,
		93,
		true
	},
	ryza_task_level_add = {
		800849,
		95,
		true
	},
	ryza_task_submit = {
		800944,
		86,
		true
	},
	ryza_task_detail = {
		801030,
		85,
		true
	},
	ryza_composite_words = {
		801115,
		704,
		true
	},
	ryza_task_help_tip = {
		801819,
		345,
		true
	},
	hotspring_buff = {
		802164,
		140,
		true
	},
	random_ship_custom_mode_empty = {
		802304,
		148,
		true
	},
	random_ship_custom_mode_main_button_add = {
		802452,
		106,
		true
	},
	random_ship_custom_mode_main_button_remove = {
		802558,
		112,
		true
	},
	random_ship_custom_mode_main_tip1 = {
		802670,
		151,
		true
	},
	random_ship_custom_mode_main_tip2 = {
		802821,
		107,
		true
	},
	random_ship_custom_mode_main_empty = {
		802928,
		137,
		true
	},
	random_ship_custom_mode_select_all = {
		803065,
		108,
		true
	},
	random_ship_custom_mode_add_tip1 = {
		803173,
		158,
		true
	},
	random_ship_custom_mode_select_number = {
		803331,
		110,
		true
	},
	random_ship_custom_mode_add_complete = {
		803441,
		130,
		true
	},
	random_ship_custom_mode_add_tip2 = {
		803571,
		159,
		true
	},
	random_ship_custom_mode_remove_tip1 = {
		803730,
		166,
		true
	},
	random_ship_custom_mode_remove_complete = {
		803896,
		135,
		true
	},
	random_ship_custom_mode_remove_tip2 = {
		804031,
		166,
		true
	},
	index_dressed = {
		804197,
		89,
		true
	},
	random_ship_custom_mode = {
		804286,
		110,
		true
	},
	random_ship_custom_mode_add_title = {
		804396,
		110,
		true
	},
	random_ship_custom_mode_remove_title = {
		804506,
		116,
		true
	},
	hotspring_shop_enter1 = {
		804622,
		150,
		true
	},
	hotspring_shop_enter2 = {
		804772,
		143,
		true
	},
	hotspring_shop_insufficient = {
		804915,
		189,
		true
	},
	hotspring_shop_success1 = {
		805104,
		117,
		true
	},
	hotspring_shop_success2 = {
		805221,
		103,
		true
	},
	hotspring_shop_finish = {
		805324,
		173,
		true
	},
	hotspring_shop_end = {
		805497,
		155,
		true
	},
	hotspring_shop_touch1 = {
		805652,
		107,
		true
	},
	hotspring_shop_touch2 = {
		805759,
		128,
		true
	},
	hotspring_shop_touch3 = {
		805887,
		115,
		true
	},
	hotspring_shop_exchanged = {
		806002,
		154,
		true
	},
	hotspring_shop_exchange = {
		806156,
		184,
		true
	},
	hotspring_tip1 = {
		806340,
		130,
		true
	},
	hotspring_tip2 = {
		806470,
		104,
		true
	},
	hotspring_help = {
		806574,
		631,
		true
	},
	hotspring_expand = {
		807205,
		147,
		true
	},
	hotspring_shop_help = {
		807352,
		571,
		true
	},
	resorts_help = {
		807923,
		819,
		true
	},
	pvzminigame_help = {
		808742,
		1187,
		true
	},
	tips_yuandanhuoyue2023 = {
		809929,
		745,
		true
	},
	beach_guard_chaijun = {
		810674,
		159,
		true
	},
	beach_guard_jianye = {
		810833,
		164,
		true
	},
	beach_guard_lituoliao = {
		810997,
		279,
		true
	},
	beach_guard_bominghan = {
		811276,
		237,
		true
	},
	beach_guard_nengdai = {
		811513,
		269,
		true
	},
	beach_guard_m_craft = {
		811782,
		121,
		true
	},
	beach_guard_m_atk = {
		811903,
		111,
		true
	},
	beach_guard_m_guard = {
		812014,
		107,
		true
	},
	beach_guard_m_craft_name = {
		812121,
		98,
		true
	},
	beach_guard_m_atk_name = {
		812219,
		94,
		true
	},
	beach_guard_m_guard_name = {
		812313,
		97,
		true
	},
	beach_guard_e1 = {
		812410,
		87,
		true
	},
	beach_guard_e2 = {
		812497,
		84,
		true
	},
	beach_guard_e3 = {
		812581,
		87,
		true
	},
	beach_guard_e4 = {
		812668,
		85,
		true
	},
	beach_guard_e5 = {
		812753,
		87,
		true
	},
	beach_guard_e6 = {
		812840,
		84,
		true
	},
	beach_guard_e7 = {
		812924,
		86,
		true
	},
	beach_guard_e1_desc = {
		813010,
		135,
		true
	},
	beach_guard_e2_desc = {
		813145,
		142,
		true
	},
	beach_guard_e3_desc = {
		813287,
		140,
		true
	},
	beach_guard_e4_desc = {
		813427,
		137,
		true
	},
	beach_guard_e5_desc = {
		813564,
		130,
		true
	},
	beach_guard_e6_desc = {
		813694,
		235,
		true
	},
	beach_guard_e7_desc = {
		813929,
		166,
		true
	},
	ninghai_nianye = {
		814095,
		142,
		true
	},
	yingrui_nianye = {
		814237,
		142,
		true
	},
	zhaohe_nianye = {
		814379,
		135,
		true
	},
	zhenhai_nianye = {
		814514,
		143,
		true
	},
	haitian_nianye = {
		814657,
		153,
		true
	},
	taiyuan_nianye = {
		814810,
		148,
		true
	},
	yixian_nianye = {
		814958,
		166,
		true
	},
	activity_yanhua_tip1 = {
		815124,
		93,
		true
	},
	activity_yanhua_tip2 = {
		815217,
		103,
		true
	},
	activity_yanhua_tip3 = {
		815320,
		103,
		true
	},
	activity_yanhua_tip4 = {
		815423,
		139,
		true
	},
	activity_yanhua_tip5 = {
		815562,
		120,
		true
	},
	activity_yanhua_tip6 = {
		815682,
		124,
		true
	},
	activity_yanhua_tip7 = {
		815806,
		158,
		true
	},
	activity_yanhua_tip8 = {
		815964,
		103,
		true
	},
	help_chunjie2023 = {
		816067,
		1441,
		true
	},
	sevenday_nianye = {
		817508,
		406,
		true
	},
	tip_nianye = {
		817914,
		122,
		true
	},
	couplete_activty_desc = {
		818036,
		351,
		true
	},
	couplete_click_desc = {
		818387,
		131,
		true
	},
	couplet_index_desc = {
		818518,
		89,
		true
	},
	couplete_help = {
		818607,
		770,
		true
	},
	couplete_drag_tip = {
		819377,
		133,
		true
	},
	couplete_remind = {
		819510,
		114,
		true
	},
	couplete_complete = {
		819624,
		132,
		true
	},
	couplete_enter = {
		819756,
		114,
		true
	},
	couplete_stay = {
		819870,
		107,
		true
	},
	couplete_task = {
		819977,
		135,
		true
	},
	couplete_pass_1 = {
		820112,
		96,
		true
	},
	couplete_pass_2 = {
		820208,
		100,
		true
	},
	couplete_fail_1 = {
		820308,
		119,
		true
	},
	couplete_fail_2 = {
		820427,
		117,
		true
	},
	couplete_pair_1 = {
		820544,
		123,
		true
	},
	couplete_pair_2 = {
		820667,
		113,
		true
	},
	couplete_pair_3 = {
		820780,
		119,
		true
	},
	couplete_pair_4 = {
		820899,
		113,
		true
	},
	couplete_pair_5 = {
		821012,
		126,
		true
	},
	couplete_pair_6 = {
		821138,
		119,
		true
	},
	couplete_pair_7 = {
		821257,
		113,
		true
	},
	["2023spring_minigame_item_lantern"] = {
		821370,
		183,
		true
	},
	["2023spring_minigame_item_firecracker"] = {
		821553,
		188,
		true
	},
	["2023spring_minigame_skill_icewall"] = {
		821741,
		149,
		true
	},
	["2023spring_minigame_skill_icewall_up"] = {
		821890,
		223,
		true
	},
	["2023spring_minigame_skill_sprint"] = {
		822113,
		151,
		true
	},
	["2023spring_minigame_skill_sprint_up"] = {
		822264,
		227,
		true
	},
	["2023spring_minigame_skill_flash"] = {
		822491,
		180,
		true
	},
	["2023spring_minigame_skill_flash_up"] = {
		822671,
		200,
		true
	},
	["2023spring_minigame_bless_speed"] = {
		822871,
		136,
		true
	},
	["2023spring_minigame_bless_speed_up"] = {
		823007,
		211,
		true
	},
	["2023spring_minigame_bless_substitute"] = {
		823218,
		204,
		true
	},
	["2023spring_minigame_bless_substitute_up"] = {
		823422,
		127,
		true
	},
	["2023spring_minigame_nenjuu_skill1"] = {
		823549,
		199,
		true
	},
	["2023spring_minigame_nenjuu_skill2"] = {
		823748,
		146,
		true
	},
	["2023spring_minigame_nenjuu_skill3"] = {
		823894,
		158,
		true
	},
	["2023spring_minigame_nenjuu_skill4"] = {
		824052,
		139,
		true
	},
	["2023spring_minigame_nenjuu_skill5"] = {
		824191,
		214,
		true
	},
	["2023spring_minigame_nenjuu_skill6"] = {
		824405,
		158,
		true
	},
	["2023spring_minigame_nenjuu_skill7"] = {
		824563,
		234,
		true
	},
	["2023spring_minigame_nenjuu_skill8"] = {
		824797,
		219,
		true
	},
	["2023spring_minigame_tip1"] = {
		825016,
		93,
		true
	},
	["2023spring_minigame_tip2"] = {
		825109,
		96,
		true
	},
	["2023spring_minigame_tip3"] = {
		825205,
		93,
		true
	},
	["2023spring_minigame_tip5"] = {
		825298,
		136,
		true
	},
	["2023spring_minigame_tip6"] = {
		825434,
		100,
		true
	},
	["2023spring_minigame_tip7"] = {
		825534,
		100,
		true
	},
	["2023spring_minigame_help"] = {
		825634,
		1226,
		true
	},
	multiple_sorties_title = {
		826860,
		97,
		true
	},
	multiple_sorties_title_eng = {
		826957,
		106,
		true
	},
	multiple_sorties_locked_tip = {
		827063,
		180,
		true
	},
	multiple_sorties_times = {
		827243,
		93,
		true
	},
	multiple_sorties_tip = {
		827336,
		206,
		true
	},
	multiple_sorties_challenge_ticket_use = {
		827542,
		118,
		true
	},
	multiple_sorties_cost1 = {
		827660,
		150,
		true
	},
	multiple_sorties_cost2 = {
		827810,
		159,
		true
	},
	multiple_sorties_cost3 = {
		827969,
		184,
		true
	},
	multiple_sorties_stopped = {
		828153,
		95,
		true
	},
	multiple_sorties_stop_tip = {
		828248,
		186,
		true
	},
	multiple_sorties_resume_tip = {
		828434,
		138,
		true
	},
	multiple_sorties_auto_on = {
		828572,
		132,
		true
	},
	multiple_sorties_finish = {
		828704,
		108,
		true
	},
	multiple_sorties_stop = {
		828812,
		105,
		true
	},
	multiple_sorties_stop_end = {
		828917,
		118,
		true
	},
	multiple_sorties_end_status = {
		829035,
		181,
		true
	},
	multiple_sorties_finish_tip = {
		829216,
		140,
		true
	},
	multiple_sorties_stop_tip_end = {
		829356,
		146,
		true
	},
	multiple_sorties_stop_reason1 = {
		829502,
		118,
		true
	},
	multiple_sorties_stop_reason2 = {
		829620,
		147,
		true
	},
	multiple_sorties_stop_reason3 = {
		829767,
		125,
		true
	},
	multiple_sorties_stop_reason4 = {
		829892,
		131,
		true
	},
	multiple_sorties_main_tip = {
		830023,
		253,
		true
	},
	multiple_sorties_main_end = {
		830276,
		204,
		true
	},
	multiple_sorties_rest_time = {
		830480,
		105,
		true
	},
	multiple_sorties_retry_desc = {
		830585,
		108,
		true
	},
	msgbox_text_battle = {
		830693,
		88,
		true
	},
	pre_combat_start = {
		830781,
		86,
		true
	},
	pre_combat_start_en = {
		830867,
		95,
		true
	},
	["2023Valentine_minigame_s"] = {
		830962,
		181,
		true
	},
	["2023Valentine_minigame_a"] = {
		831143,
		165,
		true
	},
	["2023Valentine_minigame_b"] = {
		831308,
		179,
		true
	},
	["2023Valentine_minigame_c"] = {
		831487,
		176,
		true
	},
	["2023Valentine_minigame_label1"] = {
		831663,
		99,
		true
	},
	["2023Valentine_minigame_label2"] = {
		831762,
		110,
		true
	},
	["2023Valentine_minigame_label3"] = {
		831872,
		104,
		true
	},
	sort_energy = {
		831976,
		81,
		true
	},
	dockyard_search_holder = {
		832057,
		100,
		true
	},
	loveletter_exchange_tip1 = {
		832157,
		154,
		true
	},
	loveletter_exchange_tip2 = {
		832311,
		140,
		true
	},
	loveletter_exchange_confirm = {
		832451,
		312,
		true
	},
	loveletter_exchange_button = {
		832763,
		97,
		true
	},
	loveletter_exchange_tip3 = {
		832860,
		163,
		true
	},
	battle_text_common_1 = {
		833023,
		179,
		true
	},
	battle_text_common_2 = {
		833202,
		235,
		true
	},
	battle_text_common_3 = {
		833437,
		192,
		true
	},
	battle_text_yingxiv4_1 = {
		833629,
		140,
		true
	},
	battle_text_yingxiv4_2 = {
		833769,
		143,
		true
	},
	battle_text_yingxiv4_3 = {
		833912,
		141,
		true
	},
	battle_text_yingxiv4_4 = {
		834053,
		146,
		true
	},
	battle_text_yingxiv4_5 = {
		834199,
		138,
		true
	},
	battle_text_yingxiv4_6 = {
		834337,
		146,
		true
	},
	battle_text_yingxiv4_7 = {
		834483,
		150,
		true
	},
	battle_text_yingxiv4_8 = {
		834633,
		152,
		true
	},
	battle_text_yingxiv4_9 = {
		834785,
		152,
		true
	},
	battle_text_yingxiv4_10 = {
		834937,
		148,
		true
	},
	battle_text_bisimaiz_1 = {
		835085,
		136,
		true
	},
	battle_text_bisimaiz_2 = {
		835221,
		136,
		true
	},
	battle_text_bisimaiz_3 = {
		835357,
		136,
		true
	},
	battle_text_bisimaiz_4 = {
		835493,
		136,
		true
	},
	battle_text_bisimaiz_5 = {
		835629,
		136,
		true
	},
	battle_text_bisimaiz_6 = {
		835765,
		136,
		true
	},
	battle_text_bisimaiz_7 = {
		835901,
		167,
		true
	},
	battle_text_bisimaiz_8 = {
		836068,
		239,
		true
	},
	battle_text_bisimaiz_9 = {
		836307,
		250,
		true
	},
	battle_text_bisimaiz_10 = {
		836557,
		207,
		true
	},
	battle_text_yunxian_1 = {
		836764,
		172,
		true
	},
	battle_text_yunxian_2 = {
		836936,
		175,
		true
	},
	battle_text_yunxian_3 = {
		837111,
		155,
		true
	},
	battle_text_haidao_1 = {
		837266,
		151,
		true
	},
	battle_text_haidao_2 = {
		837417,
		174,
		true
	},
	battle_text_tongmeng_1 = {
		837591,
		134,
		true
	},
	battle_text_luodeni_1 = {
		837725,
		173,
		true
	},
	battle_text_luodeni_2 = {
		837898,
		202,
		true
	},
	battle_text_luodeni_3 = {
		838100,
		187,
		true
	},
	series_enemy_mood = {
		838287,
		91,
		true
	},
	series_enemy_mood_error = {
		838378,
		169,
		true
	},
	series_enemy_reward_tip1 = {
		838547,
		100,
		true
	},
	series_enemy_reward_tip2 = {
		838647,
		112,
		true
	},
	series_enemy_reward_tip3 = {
		838759,
		101,
		true
	},
	series_enemy_reward_tip4 = {
		838860,
		98,
		true
	},
	series_enemy_cost = {
		838958,
		92,
		true
	},
	series_enemy_SP_count = {
		839050,
		104,
		true
	},
	series_enemy_SP_error = {
		839154,
		118,
		true
	},
	series_enemy_unlock = {
		839272,
		126,
		true
	},
	series_enemy_storyunlock = {
		839398,
		119,
		true
	},
	series_enemy_storyreward = {
		839517,
		97,
		true
	},
	series_enemy_help = {
		839614,
		2106,
		true
	},
	series_enemy_score = {
		841720,
		87,
		true
	},
	series_enemy_total_score = {
		841807,
		99,
		true
	},
	setting_label_private = {
		841906,
		85,
		true
	},
	setting_label_licence = {
		841991,
		85,
		true
	},
	series_enemy_reward = {
		842076,
		104,
		true
	},
	series_enemy_mode_1 = {
		842180,
		97,
		true
	},
	series_enemy_mode_2 = {
		842277,
		99,
		true
	},
	series_enemy_fleet_prefix = {
		842376,
		97,
		true
	},
	series_enemy_team_notenough = {
		842473,
		232,
		true
	},
	series_enemy_empty_commander_main = {
		842705,
		108,
		true
	},
	series_enemy_empty_commander_assistant = {
		842813,
		111,
		true
	},
	limit_team_character_tips = {
		842924,
		154,
		true
	},
	game_room_help = {
		843078,
		1337,
		true
	},
	game_cannot_go = {
		844415,
		113,
		true
	},
	game_ticket_notenough = {
		844528,
		143,
		true
	},
	game_ticket_max_all = {
		844671,
		204,
		true
	},
	game_ticket_max_month = {
		844875,
		206,
		true
	},
	game_icon_notenough = {
		845081,
		135,
		true
	},
	game_goldbyicon = {
		845216,
		131,
		true
	},
	game_icon_max = {
		845347,
		189,
		true
	},
	caibulin_tip1 = {
		845536,
		141,
		true
	},
	caibulin_tip2 = {
		845677,
		163,
		true
	},
	caibulin_tip3 = {
		845840,
		141,
		true
	},
	caibulin_tip4 = {
		845981,
		162,
		true
	},
	caibulin_tip5 = {
		846143,
		141,
		true
	},
	caibulin_tip6 = {
		846284,
		163,
		true
	},
	caibulin_tip7 = {
		846447,
		141,
		true
	},
	caibulin_tip8 = {
		846588,
		165,
		true
	},
	caibulin_tip9 = {
		846753,
		162,
		true
	},
	caibulin_tip10 = {
		846915,
		177,
		true
	},
	caibulin_help = {
		847092,
		510,
		true
	},
	caibulin_tip11 = {
		847602,
		167,
		true
	},
	caibulin_lock_tip = {
		847769,
		123,
		true
	},
	gametip_xiaoqiye = {
		847892,
		1526,
		true
	},
	event_recommend_level1 = {
		849418,
		176,
		true
	},
	doa_minigame_Luna = {
		849594,
		85,
		true
	},
	doa_minigame_Misaki = {
		849679,
		89,
		true
	},
	doa_minigame_Marie = {
		849768,
		92,
		true
	},
	doa_minigame_Tamaki = {
		849860,
		89,
		true
	},
	doa_minigame_help = {
		849949,
		294,
		true
	},
	gametip_xiaokewei = {
		850243,
		1526,
		true
	},
	doa_character_select_confirm = {
		851769,
		239,
		true
	},
	blueprint_combatperformance = {
		852008,
		102,
		true
	},
	blueprint_shipperformance = {
		852110,
		94,
		true
	},
	blueprint_researching = {
		852204,
		98,
		true
	},
	sculpture_drawline_tip = {
		852302,
		130,
		true
	},
	sculpture_drawline_done = {
		852432,
		151,
		true
	},
	sculpture_drawline_exit = {
		852583,
		181,
		true
	},
	sculpture_puzzle_tip = {
		852764,
		162,
		true
	},
	sculpture_gratitude_tip = {
		852926,
		131,
		true
	},
	sculpture_close_tip = {
		853057,
		97,
		true
	},
	gift_act_help = {
		853154,
		713,
		true
	},
	gift_act_drawline_help = {
		853867,
		722,
		true
	},
	gift_act_tips = {
		854589,
		92,
		true
	},
	expedition_award_tip = {
		854681,
		150,
		true
	},
	island_act_tips1 = {
		854831,
		94,
		true
	},
	haidaojudian_help = {
		854925,
		2479,
		true
	},
	haidaojudian_building_tip = {
		857404,
		139,
		true
	},
	workbench_help = {
		857543,
		653,
		true
	},
	workbench_need_materials = {
		858196,
		104,
		true
	},
	workbench_tips1 = {
		858300,
		103,
		true
	},
	workbench_tips2 = {
		858403,
		110,
		true
	},
	workbench_tips3 = {
		858513,
		117,
		true
	},
	workbench_tips4 = {
		858630,
		114,
		true
	},
	workbench_tips5 = {
		858744,
		114,
		true
	},
	workbench_tips6 = {
		858858,
		88,
		true
	},
	workbench_tips7 = {
		858946,
		88,
		true
	},
	workbench_tips8 = {
		859034,
		87,
		true
	},
	workbench_tips9 = {
		859121,
		95,
		true
	},
	workbench_tips10 = {
		859216,
		102,
		true
	},
	island_help = {
		859318,
		610,
		true
	},
	islandnode_tips1 = {
		859928,
		92,
		true
	},
	islandnode_tips2 = {
		860020,
		84,
		true
	},
	islandnode_tips3 = {
		860104,
		105,
		true
	},
	islandnode_tips4 = {
		860209,
		105,
		true
	},
	islandnode_tips5 = {
		860314,
		113,
		true
	},
	islandnode_tips6 = {
		860427,
		116,
		true
	},
	islandnode_tips7 = {
		860543,
		125,
		true
	},
	islandnode_tips8 = {
		860668,
		151,
		true
	},
	islandnode_tips9 = {
		860819,
		142,
		true
	},
	islandshop_tips1 = {
		860961,
		98,
		true
	},
	islandshop_tips2 = {
		861059,
		87,
		true
	},
	islandshop_tips3 = {
		861146,
		84,
		true
	},
	islandshop_tips4 = {
		861230,
		95,
		true
	},
	island_shop_limit_error = {
		861325,
		146,
		true
	},
	haidaojudian_upgrade_limit = {
		861471,
		154,
		true
	},
	chargetip_monthcard_1 = {
		861625,
		145,
		true
	},
	chargetip_monthcard_2 = {
		861770,
		145,
		true
	},
	chargetip_crusing = {
		861915,
		102,
		true
	},
	chargetip_giftpackage = {
		862017,
		141,
		true
	},
	package_view_1 = {
		862158,
		131,
		true
	},
	package_view_2 = {
		862289,
		143,
		true
	},
	package_view_3 = {
		862432,
		99,
		true
	},
	package_view_4 = {
		862531,
		87,
		true
	},
	probabilityskinshop_tip = {
		862618,
		175,
		true
	},
	skin_gift_desc = {
		862793,
		258,
		true
	},
	springtask_tip = {
		863051,
		307,
		true
	},
	island_build_desc = {
		863358,
		132,
		true
	},
	island_history_desc = {
		863490,
		146,
		true
	},
	island_build_level = {
		863636,
		91,
		true
	},
	island_game_limit_help = {
		863727,
		143,
		true
	},
	island_game_limit_num = {
		863870,
		94,
		true
	},
	ore_minigame_help = {
		863964,
		954,
		true
	},
	meta_shop_exchange_limit_2 = {
		864918,
		96,
		true
	},
	meta_shop_tip = {
		865014,
		138,
		true
	},
	pt_shop_tran_tip = {
		865152,
		275,
		true
	},
	urdraw_tip = {
		865427,
		125,
		true
	},
	urdraw_complement = {
		865552,
		170,
		true
	},
	meta_class_t_level_1 = {
		865722,
		95,
		true
	},
	meta_class_t_level_2 = {
		865817,
		102,
		true
	},
	meta_class_t_level_3 = {
		865919,
		99,
		true
	},
	meta_class_t_level_4 = {
		866018,
		100,
		true
	},
	meta_class_t_level_5 = {
		866118,
		99,
		true
	},
	meta_shop_exchange_limit_tip = {
		866217,
		121,
		true
	},
	meta_shop_exchange_limit_2_tip = {
		866338,
		143,
		true
	},
	charge_tip_crusing_label = {
		866481,
		101,
		true
	},
	mktea_1 = {
		866582,
		144,
		true
	},
	mktea_2 = {
		866726,
		155,
		true
	},
	mktea_3 = {
		866881,
		159,
		true
	},
	mktea_4 = {
		867040,
		233,
		true
	},
	mktea_5 = {
		867273,
		222,
		true
	},
	random_skin_list_item_desc_label = {
		867495,
		99,
		true
	},
	notice_input_desc = {
		867594,
		99,
		true
	},
	notice_label_send = {
		867693,
		85,
		true
	},
	notice_label_room = {
		867778,
		88,
		true
	},
	notice_label_recv = {
		867866,
		90,
		true
	},
	notice_label_tip = {
		867956,
		123,
		true
	},
	littleTaihou_npc = {
		868079,
		1771,
		true
	},
	disassemble_selected = {
		869850,
		92,
		true
	},
	disassemble_available = {
		869942,
		95,
		true
	},
	ship_formationUI_fleetName_challenge = {
		870037,
		115,
		true
	},
	ship_formationUI_fleetName_challenge_sub = {
		870152,
		119,
		true
	},
	word_status_activity = {
		870271,
		92,
		true
	},
	word_status_challenge = {
		870363,
		97,
		true
	},
	shipmodechange_reject_inactivity = {
		870460,
		188,
		true
	},
	shipmodechange_reject_inchallenge = {
		870648,
		192,
		true
	},
	battle_result_total_time = {
		870840,
		99,
		true
	},
	charge_game_room_coin_tip = {
		870939,
		193,
		true
	},
	game_room_shooting_tip = {
		871132,
		100,
		true
	},
	mini_game_shop_ticked_not_enough = {
		871232,
		154,
		true
	},
	game_ticket_current_month = {
		871386,
		103,
		true
	},
	game_icon_max_full = {
		871489,
		138,
		true
	},
	pre_combat_consume = {
		871627,
		87,
		true
	},
	file_down_msgbox = {
		871714,
		191,
		true
	},
	file_down_mgr_title = {
		871905,
		114,
		true
	},
	file_down_mgr_progress = {
		872019,
		91,
		true
	},
	file_down_mgr_error = {
		872110,
		157,
		true
	},
	last_building_not_shown = {
		872267,
		119,
		true
	},
	setting_group_prefs_tip = {
		872386,
		122,
		true
	},
	group_prefs_switch_tip = {
		872508,
		159,
		true
	},
	main_group_msgbox_content = {
		872667,
		184,
		true
	},
	word_maingroup_checking = {
		872851,
		98,
		true
	},
	word_maingroup_checktoupdate = {
		872949,
		107,
		true
	},
	word_maingroup_checkfailure = {
		873056,
		122,
		true
	},
	word_maingroup_updating = {
		873178,
		98,
		true
	},
	word_maingroup_updatesuccess = {
		873276,
		108,
		true
	},
	word_maingroup_updatefailure = {
		873384,
		125,
		true
	},
	group_download_tip = {
		873509,
		156,
		true
	},
	word_manga_checking = {
		873665,
		94,
		true
	},
	word_manga_checktoupdate = {
		873759,
		103,
		true
	},
	word_manga_checkfailure = {
		873862,
		118,
		true
	},
	word_manga_updating = {
		873980,
		98,
		true
	},
	word_manga_updatesuccess = {
		874078,
		104,
		true
	},
	word_manga_updatefailure = {
		874182,
		121,
		true
	},
	cryptolalia_lock_res = {
		874303,
		102,
		true
	},
	cryptolalia_not_download_res = {
		874405,
		113,
		true
	},
	cryptolalia_timelimie = {
		874518,
		92,
		true
	},
	cryptolalia_label_downloading = {
		874610,
		114,
		true
	},
	cryptolalia_delete_res = {
		874724,
		104,
		true
	},
	cryptolalia_delete_res_tip = {
		874828,
		133,
		true
	},
	cryptolalia_delete_res_title = {
		874961,
		107,
		true
	},
	cryptolalia_use_gem_title = {
		875068,
		105,
		true
	},
	cryptolalia_use_ticket_title = {
		875173,
		111,
		true
	},
	cryptolalia_exchange = {
		875284,
		94,
		true
	},
	cryptolalia_exchange_success = {
		875378,
		107,
		true
	},
	cryptolalia_list_title = {
		875485,
		93,
		true
	},
	cryptolalia_list_subtitle = {
		875578,
		100,
		true
	},
	cryptolalia_download_done = {
		875678,
		106,
		true
	},
	cryptolalia_coming_soom = {
		875784,
		101,
		true
	},
	cryptolalia_unopen = {
		875885,
		88,
		true
	},
	cryptolalia_no_ticket = {
		875973,
		164,
		true
	},
	cryptolalia_entrance_coming_soom = {
		876137,
		118,
		true
	},
	ship_formationUI_fleetName_sp = {
		876255,
		111,
		true
	},
	ship_formationUI_fleetName_sp_ss = {
		876366,
		118,
		true
	},
	activityboss_sp_all_buff = {
		876484,
		98,
		true
	},
	activityboss_sp_best_score = {
		876582,
		101,
		true
	},
	activityboss_sp_display_reward = {
		876683,
		106,
		true
	},
	activityboss_sp_score_bonus = {
		876789,
		103,
		true
	},
	activityboss_sp_active_buff = {
		876892,
		99,
		true
	},
	activityboss_sp_window_best_score = {
		876991,
		114,
		true
	},
	activityboss_sp_score_target = {
		877105,
		105,
		true
	},
	activityboss_sp_score = {
		877210,
		95,
		true
	},
	activityboss_sp_score_update = {
		877305,
		106,
		true
	},
	activityboss_sp_score_not_update = {
		877411,
		118,
		true
	},
	collect_page_got = {
		877529,
		89,
		true
	},
	charge_menu_month_tip = {
		877618,
		178,
		true
	},
	activity_shop_title = {
		877796,
		88,
		true
	},
	street_shop_title = {
		877884,
		85,
		true
	},
	military_shop_title = {
		877969,
		88,
		true
	},
	quota_shop_title1 = {
		878057,
		92,
		true
	},
	sham_shop_title = {
		878149,
		89,
		true
	},
	fragment_shop_title = {
		878238,
		88,
		true
	},
	guild_shop_title = {
		878326,
		85,
		true
	},
	medal_shop_title = {
		878411,
		85,
		true
	},
	meta_shop_title = {
		878496,
		83,
		true
	},
	mini_game_shop_title = {
		878579,
		89,
		true
	},
	metaskill_up = {
		878668,
		187,
		true
	},
	metaskill_overflow_tip = {
		878855,
		163,
		true
	},
	msgbox_repair_cipher = {
		879018,
		103,
		true
	},
	msgbox_repair_title = {
		879121,
		89,
		true
	},
	equip_skin_detail_count = {
		879210,
		93,
		true
	},
	faest_nothing_to_get = {
		879303,
		105,
		true
	},
	feast_click_to_close = {
		879408,
		98,
		true
	},
	feast_invitation_btn_label = {
		879506,
		108,
		true
	},
	feast_task_btn_label = {
		879614,
		96,
		true
	},
	feast_task_pt_label = {
		879710,
		91,
		true
	},
	feast_task_pt_level = {
		879801,
		89,
		true
	},
	feast_task_pt_get = {
		879890,
		91,
		true
	},
	feast_task_pt_got = {
		879981,
		89,
		true
	},
	feast_task_tag_daily = {
		880070,
		89,
		true
	},
	feast_task_tag_activity = {
		880159,
		94,
		true
	},
	feast_label_make_invitation = {
		880253,
		106,
		true
	},
	feast_no_invitation = {
		880359,
		108,
		true
	},
	feast_no_gift = {
		880467,
		96,
		true
	},
	feast_label_give_invitation = {
		880563,
		106,
		true
	},
	feast_label_give_invitation_finish = {
		880669,
		113,
		true
	},
	feast_label_give_gift = {
		880782,
		94,
		true
	},
	feast_label_give_gift_finish = {
		880876,
		101,
		true
	},
	feast_label_make_ticket_tip = {
		880977,
		151,
		true
	},
	feast_label_make_ticket_click_tip = {
		881128,
		118,
		true
	},
	feast_label_make_ticket_failed_tip = {
		881246,
		153,
		true
	},
	feast_res_window_title = {
		881399,
		93,
		true
	},
	feast_res_window_go_label = {
		881492,
		91,
		true
	},
	feast_tip = {
		881583,
		422,
		true
	},
	feast_invitation_part1 = {
		882005,
		134,
		true
	},
	feast_invitation_part2 = {
		882139,
		260,
		true
	},
	feast_invitation_part3 = {
		882399,
		278,
		true
	},
	feast_invitation_part4 = {
		882677,
		218,
		true
	},
	uscastle2023_help = {
		882895,
		1519,
		true
	},
	feast_cant_give_gift_tip = {
		884414,
		154,
		true
	},
	uscastle2023_minigame_help = {
		884568,
		367,
		true
	},
	feast_drag_invitation_tip = {
		884935,
		143,
		true
	},
	feast_drag_gift_tip = {
		885078,
		131,
		true
	},
	shoot_preview = {
		885209,
		91,
		true
	},
	hit_preview = {
		885300,
		90,
		true
	},
	story_label_skip = {
		885390,
		84,
		true
	},
	story_label_auto = {
		885474,
		84,
		true
	},
	launch_ball_skill_desc = {
		885558,
		93,
		true
	},
	launch_ball_hatsuduki_skill_1 = {
		885651,
		114,
		true
	},
	launch_ball_hatsuduki_skill_1_desc = {
		885765,
		172,
		true
	},
	launch_ball_hatsuduki_skill_2 = {
		885937,
		127,
		true
	},
	launch_ball_hatsuduki_skill_2_desc = {
		886064,
		334,
		true
	},
	launch_ball_shinano_skill_1 = {
		886398,
		113,
		true
	},
	launch_ball_shinano_skill_1_desc = {
		886511,
		193,
		true
	},
	launch_ball_shinano_skill_2 = {
		886704,
		121,
		true
	},
	launch_ball_shinano_skill_2_desc = {
		886825,
		257,
		true
	},
	launch_ball_yura_skill_1 = {
		887082,
		111,
		true
	},
	launch_ball_yura_skill_1_desc = {
		887193,
		169,
		true
	},
	launch_ball_yura_skill_2 = {
		887362,
		120,
		true
	},
	launch_ball_yura_skill_2_desc = {
		887482,
		206,
		true
	},
	launch_ball_shimakaze_skill_1 = {
		887688,
		124,
		true
	},
	launch_ball_shimakaze_skill_1_desc = {
		887812,
		225,
		true
	},
	launch_ball_shimakaze_skill_2 = {
		888037,
		121,
		true
	},
	launch_ball_shimakaze_skill_2_desc = {
		888158,
		202,
		true
	},
	jp6th_spring_tip1 = {
		888360,
		172,
		true
	},
	jp6th_spring_tip2 = {
		888532,
		104,
		true
	},
	jp6th_biaohoushan_help = {
		888636,
		1312,
		true
	},
	jp6th_lihoushan_help = {
		889948,
		2540,
		true
	},
	jp6th_lihoushan_time = {
		892488,
		125,
		true
	},
	jp6th_lihoushan_order = {
		892613,
		138,
		true
	},
	jp6th_lihoushan_pt1 = {
		892751,
		98,
		true
	},
	launchball_minigame_help = {
		892849,
		357,
		true
	},
	launchball_minigame_select = {
		893206,
		106,
		true
	},
	launchball_minigame_un_select = {
		893312,
		122,
		true
	},
	launchball_minigame_shop = {
		893434,
		106,
		true
	},
	launchball_lock_Shinano = {
		893540,
		172,
		true
	},
	launchball_lock_Yura = {
		893712,
		166,
		true
	},
	launchball_lock_Shimakaze = {
		893878,
		176,
		true
	},
	launchball_spilt_series = {
		894054,
		162,
		true
	},
	launchball_spilt_mix = {
		894216,
		311,
		true
	},
	launchball_spilt_over = {
		894527,
		224,
		true
	},
	launchball_spilt_many = {
		894751,
		152,
		true
	},
	luckybag_skin_isani = {
		894903,
		90,
		true
	},
	luckybag_skin_islive2d = {
		894993,
		93,
		true
	},
	SkinMagazinePage2_tip = {
		895086,
		92,
		true
	},
	racing_cost = {
		895178,
		86,
		true
	},
	racing_rank_top_text = {
		895264,
		98,
		true
	},
	racing_rank_half_h = {
		895362,
		102,
		true
	},
	racing_rank_no_data = {
		895464,
		101,
		true
	},
	racing_minigame_help = {
		895565,
		357,
		true
	},
	child_msg_title_detail = {
		895922,
		93,
		true
	},
	child_msg_title_tip = {
		896015,
		87,
		true
	},
	child_msg_owned = {
		896102,
		88,
		true
	},
	child_polaroid_get_tip = {
		896190,
		135,
		true
	},
	child_close_tip = {
		896325,
		101,
		true
	},
	word_month = {
		896426,
		79,
		true
	},
	word_which_month = {
		896505,
		88,
		true
	},
	word_which_week = {
		896593,
		86,
		true
	},
	word_in_one_week = {
		896679,
		89,
		true
	},
	word_week_title = {
		896768,
		82,
		true
	},
	word_harbour = {
		896850,
		80,
		true
	},
	child_btn_target = {
		896930,
		85,
		true
	},
	child_btn_collect = {
		897015,
		89,
		true
	},
	child_btn_mind = {
		897104,
		86,
		true
	},
	child_btn_bag = {
		897190,
		82,
		true
	},
	child_btn_news = {
		897272,
		90,
		true
	},
	child_main_help = {
		897362,
		526,
		true
	},
	child_archive_name = {
		897888,
		86,
		true
	},
	child_news_import_title = {
		897974,
		99,
		true
	},
	child_news_other_title = {
		898073,
		101,
		true
	},
	child_favor_progress = {
		898174,
		96,
		true
	},
	child_favor_lock1 = {
		898270,
		96,
		true
	},
	child_favor_lock2 = {
		898366,
		96,
		true
	},
	child_target_lock_tip = {
		898462,
		136,
		true
	},
	child_target_progress = {
		898598,
		96,
		true
	},
	child_target_finish_tip = {
		898694,
		117,
		true
	},
	child_target_time_title = {
		898811,
		97,
		true
	},
	child_target_title1 = {
		898908,
		92,
		true
	},
	child_target_title2 = {
		899000,
		94,
		true
	},
	child_item_type0 = {
		899094,
		83,
		true
	},
	child_item_type1 = {
		899177,
		85,
		true
	},
	child_item_type2 = {
		899262,
		91,
		true
	},
	child_item_type3 = {
		899353,
		85,
		true
	},
	child_item_type4 = {
		899438,
		85,
		true
	},
	child_mind_empty_tip = {
		899523,
		124,
		true
	},
	child_mind_finish_title = {
		899647,
		96,
		true
	},
	child_mind_processing_title = {
		899743,
		102,
		true
	},
	child_mind_time_title = {
		899845,
		95,
		true
	},
	child_collect_lock = {
		899940,
		88,
		true
	},
	child_nature_title = {
		900028,
		94,
		true
	},
	child_btn_review = {
		900122,
		87,
		true
	},
	child_schedule_empty_tip = {
		900209,
		132,
		true
	},
	child_schedule_event_tip = {
		900341,
		136,
		true
	},
	child_schedule_sure_tip = {
		900477,
		189,
		true
	},
	child_schedule_sure_tip2 = {
		900666,
		146,
		true
	},
	child_plan_check_tip1 = {
		900812,
		152,
		true
	},
	child_plan_check_tip2 = {
		900964,
		141,
		true
	},
	child_plan_check_tip3 = {
		901105,
		166,
		true
	},
	child_plan_check_tip4 = {
		901271,
		132,
		true
	},
	child_plan_check_tip5 = {
		901403,
		133,
		true
	},
	child_plan_event = {
		901536,
		96,
		true
	},
	child_btn_home = {
		901632,
		85,
		true
	},
	child_option_limit = {
		901717,
		89,
		true
	},
	child_shop_tip1 = {
		901806,
		117,
		true
	},
	child_shop_tip2 = {
		901923,
		112,
		true
	},
	child_filter_title = {
		902035,
		88,
		true
	},
	child_filter_type1 = {
		902123,
		95,
		true
	},
	child_filter_type2 = {
		902218,
		93,
		true
	},
	child_filter_type3 = {
		902311,
		91,
		true
	},
	child_plan_type1 = {
		902402,
		86,
		true
	},
	child_plan_type2 = {
		902488,
		87,
		true
	},
	child_plan_type3 = {
		902575,
		95,
		true
	},
	child_plan_type4 = {
		902670,
		89,
		true
	},
	child_filter_award_res = {
		902759,
		91,
		true
	},
	child_filter_award_nature = {
		902850,
		100,
		true
	},
	child_filter_award_attr1 = {
		902950,
		93,
		true
	},
	child_filter_award_attr2 = {
		903043,
		97,
		true
	},
	child_mood_desc1 = {
		903140,
		149,
		true
	},
	child_mood_desc2 = {
		903289,
		143,
		true
	},
	child_mood_desc3 = {
		903432,
		145,
		true
	},
	child_mood_desc4 = {
		903577,
		145,
		true
	},
	child_mood_desc5 = {
		903722,
		145,
		true
	},
	child_stage_desc1 = {
		903867,
		95,
		true
	},
	child_stage_desc2 = {
		903962,
		95,
		true
	},
	child_stage_desc3 = {
		904057,
		95,
		true
	},
	child_default_callname = {
		904152,
		95,
		true
	},
	flagship_display_mode_1 = {
		904247,
		118,
		true
	},
	flagship_display_mode_2 = {
		904365,
		117,
		true
	},
	flagship_display_mode_3 = {
		904482,
		95,
		true
	},
	flagship_educate_slot_lock_tip = {
		904577,
		199,
		true
	},
	child_story_name = {
		904776,
		89,
		true
	},
	secretary_special_name = {
		904865,
		88,
		true
	},
	secretary_special_lock_tip = {
		904953,
		101,
		true
	},
	secretary_special_title_age = {
		905054,
		109,
		true
	},
	secretary_special_title_physiognomy = {
		905163,
		117,
		true
	},
	child_plan_skip = {
		905280,
		93,
		true
	},
	child_attr_name1 = {
		905373,
		85,
		true
	},
	child_attr_name2 = {
		905458,
		89,
		true
	},
	child_task_system_type2 = {
		905547,
		93,
		true
	},
	child_task_system_type3 = {
		905640,
		91,
		true
	},
	child_plan_perform_title = {
		905731,
		104,
		true
	},
	child_date_text1 = {
		905835,
		93,
		true
	},
	child_date_text2 = {
		905928,
		96,
		true
	},
	child_date_text3 = {
		906024,
		94,
		true
	},
	child_date_text4 = {
		906118,
		93,
		true
	},
	child_upgrade_sure_tip = {
		906211,
		231,
		true
	},
	child_school_sure_tip = {
		906442,
		212,
		true
	},
	child_extraAttr_sure_tip = {
		906654,
		140,
		true
	},
	child_reset_sure_tip = {
		906794,
		172,
		true
	},
	child_end_sure_tip = {
		906966,
		104,
		true
	},
	child_buff_name = {
		907070,
		85,
		true
	},
	child_unlock_tip = {
		907155,
		86,
		true
	},
	child_unlock_out = {
		907241,
		90,
		true
	},
	child_unlock_memory = {
		907331,
		91,
		true
	},
	child_unlock_polaroid = {
		907422,
		92,
		true
	},
	child_unlock_ending = {
		907514,
		90,
		true
	},
	child_unlock_intimacy = {
		907604,
		94,
		true
	},
	child_unlock_buff = {
		907698,
		87,
		true
	},
	child_unlock_attr2 = {
		907785,
		93,
		true
	},
	child_unlock_attr3 = {
		907878,
		91,
		true
	},
	child_unlock_bag = {
		907969,
		85,
		true
	},
	child_shop_empty_tip = {
		908054,
		101,
		true
	},
	child_bag_empty_tip = {
		908155,
		101,
		true
	},
	levelscene_deploy_submarine = {
		908256,
		105,
		true
	},
	levelscene_deploy_submarine_cancel = {
		908361,
		104,
		true
	},
	levelscene_airexpel_cancel = {
		908465,
		96,
		true
	},
	levelscene_airexpel_select_enemy = {
		908561,
		131,
		true
	},
	levelscene_airexpel_outrange = {
		908692,
		137,
		true
	},
	levelscene_airexpel_select_boss = {
		908829,
		141,
		true
	},
	levelscene_airexpel_select_battle = {
		908970,
		154,
		true
	},
	levelscene_airexpel_select_confirm_left = {
		909124,
		204,
		true
	},
	levelscene_airexpel_select_confirm_right = {
		909328,
		206,
		true
	},
	levelscene_airexpel_select_confirm_up = {
		909534,
		193,
		true
	},
	levelscene_airexpel_select_confirm_down = {
		909727,
		197,
		true
	},
	shipyard_phase_1 = {
		909924,
		971,
		true
	},
	shipyard_phase_2 = {
		910895,
		86,
		true
	},
	shipyard_button_1 = {
		910981,
		91,
		true
	},
	shipyard_button_2 = {
		911072,
		153,
		true
	},
	shipyard_introduce = {
		911225,
		212,
		true
	},
	help_supportfleet = {
		911437,
		358,
		true
	},
	word_status_inSupportFleet = {
		911795,
		106,
		true
	},
	ship_formationMediator_request_replace_support = {
		911901,
		203,
		true
	},
	courtyard_label_train = {
		912104,
		90,
		true
	},
	courtyard_label_rest = {
		912194,
		88,
		true
	},
	courtyard_label_capacity = {
		912282,
		96,
		true
	},
	courtyard_label_share = {
		912378,
		90,
		true
	},
	courtyard_label_shop = {
		912468,
		88,
		true
	},
	courtyard_label_decoration = {
		912556,
		94,
		true
	},
	courtyard_label_template = {
		912650,
		94,
		true
	},
	courtyard_label_floor = {
		912744,
		91,
		true
	},
	courtyard_label_exp_addition = {
		912835,
		101,
		true
	},
	courtyard_label_total_exp_addition = {
		912936,
		114,
		true
	},
	courtyard_label_comfortable_addition = {
		913050,
		116,
		true
	},
	courtyard_label_placed_furniture = {
		913166,
		112,
		true
	},
	courtyard_label_shop_1 = {
		913278,
		90,
		true
	},
	courtyard_label_clear = {
		913368,
		90,
		true
	},
	courtyard_label_save = {
		913458,
		88,
		true
	},
	courtyard_label_save_theme = {
		913546,
		100,
		true
	},
	courtyard_label_using = {
		913646,
		103,
		true
	},
	courtyard_label_search_holder = {
		913749,
		105,
		true
	},
	courtyard_label_filter = {
		913854,
		92,
		true
	},
	courtyard_label_time = {
		913946,
		88,
		true
	},
	courtyard_label_week = {
		914034,
		93,
		true
	},
	courtyard_label_month = {
		914127,
		94,
		true
	},
	courtyard_label_year = {
		914221,
		93,
		true
	},
	courtyard_label_putlist_title = {
		914314,
		114,
		true
	},
	courtyard_label_custom_theme = {
		914428,
		102,
		true
	},
	courtyard_label_system_theme = {
		914530,
		99,
		true
	},
	courtyard_tip_furniture_not_in_layer = {
		914629,
		142,
		true
	},
	courtyard_label_detail = {
		914771,
		93,
		true
	},
	courtyard_label_place_pnekey = {
		914864,
		103,
		true
	},
	courtyard_label_delete = {
		914967,
		92,
		true
	},
	courtyard_label_cancel_share = {
		915059,
		104,
		true
	},
	courtyard_label_empty_template_list = {
		915163,
		139,
		true
	},
	courtyard_label_empty_custom_template_list = {
		915302,
		195,
		true
	},
	courtyard_label_empty_collection_list = {
		915497,
		135,
		true
	},
	courtyard_label_go = {
		915632,
		89,
		true
	},
	mot_class_t_level_1 = {
		915721,
		97,
		true
	},
	mot_class_t_level_2 = {
		915818,
		98,
		true
	},
	equip_share_label_1 = {
		915916,
		99,
		true
	},
	equip_share_label_2 = {
		916015,
		100,
		true
	},
	equip_share_label_3 = {
		916115,
		99,
		true
	},
	equip_share_label_4 = {
		916214,
		96,
		true
	},
	equip_share_label_5 = {
		916310,
		95,
		true
	},
	equip_share_label_6 = {
		916405,
		99,
		true
	},
	equip_share_label_7 = {
		916504,
		87,
		true
	},
	equip_share_label_8 = {
		916591,
		90,
		true
	},
	equip_share_label_9 = {
		916681,
		87,
		true
	},
	equipcode_input = {
		916768,
		104,
		true
	},
	equipcode_slot_unmatch = {
		916872,
		153,
		true
	},
	equipcode_share_nolabel = {
		917025,
		132,
		true
	},
	equipcode_share_exceedlimit = {
		917157,
		124,
		true
	},
	equipcode_illegal = {
		917281,
		116,
		true
	},
	equipcode_confirm_doublecheck = {
		917397,
		137,
		true
	},
	equipcode_import_success = {
		917534,
		132,
		true
	},
	equipcode_share_success = {
		917666,
		128,
		true
	},
	equipcode_like_limited = {
		917794,
		138,
		true
	},
	equipcode_like_success = {
		917932,
		102,
		true
	},
	equipcode_dislike_success = {
		918034,
		115,
		true
	},
	equipcode_report_type_1 = {
		918149,
		118,
		true
	},
	equipcode_report_type_2 = {
		918267,
		110,
		true
	},
	equipcode_report_warning = {
		918377,
		150,
		true
	},
	equipcode_level_unmatched = {
		918527,
		100,
		true
	},
	equipcode_equipment_unowned = {
		918627,
		103,
		true
	},
	equipcode_diff_selected = {
		918730,
		101,
		true
	},
	equipcode_export_success = {
		918831,
		105,
		true
	},
	equipcode_unsaved_tips = {
		918936,
		154,
		true
	},
	equipcode_share_ruletips = {
		919090,
		139,
		true
	},
	equipcode_share_errorcode7 = {
		919229,
		146,
		true
	},
	equipcode_share_errorcode44 = {
		919375,
		137,
		true
	},
	equipcode_share_title = {
		919512,
		93,
		true
	},
	equipcode_share_titleeng = {
		919605,
		96,
		true
	},
	equipcode_share_listempty = {
		919701,
		115,
		true
	},
	equipcode_equip_occupied = {
		919816,
		94,
		true
	},
	sail_boat_equip_tip_1 = {
		919910,
		206,
		true
	},
	sail_boat_equip_tip_2 = {
		920116,
		215,
		true
	},
	sail_boat_equip_tip_3 = {
		920331,
		218,
		true
	},
	sail_boat_equip_tip_4 = {
		920549,
		210,
		true
	},
	sail_boat_equip_tip_5 = {
		920759,
		191,
		true
	},
	sail_boat_minigame_help = {
		920950,
		356,
		true
	},
	pirate_wanted_help = {
		921306,
		448,
		true
	},
	harbor_backhill_help = {
		921754,
		1172,
		true
	},
	cryptolalia_download_task_already_exists = {
		922926,
		135,
		true
	},
	charge_scene_buy_confirm_backyard = {
		923061,
		168,
		true
	},
	roll_room1 = {
		923229,
		88,
		true
	},
	roll_room2 = {
		923317,
		88,
		true
	},
	roll_room3 = {
		923405,
		84,
		true
	},
	roll_room4 = {
		923489,
		83,
		true
	},
	roll_room5 = {
		923572,
		85,
		true
	},
	roll_room6 = {
		923657,
		92,
		true
	},
	roll_room7 = {
		923749,
		85,
		true
	},
	roll_room8 = {
		923834,
		81,
		true
	},
	roll_room9 = {
		923915,
		86,
		true
	},
	roll_room10 = {
		924001,
		91,
		true
	},
	roll_room11 = {
		924092,
		89,
		true
	},
	roll_room12 = {
		924181,
		90,
		true
	},
	roll_room13 = {
		924271,
		89,
		true
	},
	roll_room14 = {
		924360,
		87,
		true
	},
	roll_room15 = {
		924447,
		80,
		true
	},
	roll_room16 = {
		924527,
		86,
		true
	},
	roll_room17 = {
		924613,
		81,
		true
	},
	roll_attr_list = {
		924694,
		693,
		true
	},
	roll_notimes = {
		925387,
		142,
		true
	},
	roll_tip2 = {
		925529,
		137,
		true
	},
	roll_reward_word1 = {
		925666,
		89,
		true
	},
	roll_reward_word2 = {
		925755,
		90,
		true
	},
	roll_reward_word3 = {
		925845,
		90,
		true
	},
	roll_reward_word4 = {
		925935,
		90,
		true
	},
	roll_reward_word5 = {
		926025,
		90,
		true
	},
	roll_reward_word6 = {
		926115,
		90,
		true
	},
	roll_reward_word7 = {
		926205,
		90,
		true
	},
	roll_reward_word8 = {
		926295,
		87,
		true
	},
	roll_reward_tip = {
		926382,
		94,
		true
	},
	roll_unlock = {
		926476,
		126,
		true
	},
	roll_noname = {
		926602,
		116,
		true
	},
	roll_card_info = {
		926718,
		85,
		true
	},
	roll_card_attr = {
		926803,
		83,
		true
	},
	roll_card_skill = {
		926886,
		85,
		true
	},
	roll_times_left = {
		926971,
		93,
		true
	},
	roll_room_unexplored = {
		927064,
		87,
		true
	},
	roll_reward_got = {
		927151,
		86,
		true
	},
	roll_gametip = {
		927237,
		1639,
		true
	},
	roll_ending_tip1 = {
		928876,
		157,
		true
	},
	roll_ending_tip2 = {
		929033,
		141,
		true
	},
	commandercat_label_raw_name = {
		929174,
		104,
		true
	},
	commandercat_label_custom_name = {
		929278,
		105,
		true
	},
	commandercat_label_display_name = {
		929383,
		106,
		true
	},
	commander_selected_max = {
		929489,
		127,
		true
	},
	word_talent = {
		929616,
		81,
		true
	},
	word_click_to_close = {
		929697,
		95,
		true
	},
	commander_subtile_ablity = {
		929792,
		104,
		true
	},
	commander_subtile_talent = {
		929896,
		102,
		true
	},
	commander_confirm_tip = {
		929998,
		130,
		true
	},
	commander_level_up_tip = {
		930128,
		122,
		true
	},
	commander_skill_effect = {
		930250,
		99,
		true
	},
	commander_choice_talent_1 = {
		930349,
		127,
		true
	},
	commander_choice_talent_2 = {
		930476,
		106,
		true
	},
	commander_choice_talent_3 = {
		930582,
		132,
		true
	},
	commander_get_box_tip_1 = {
		930714,
		102,
		true
	},
	commander_get_box_tip = {
		930816,
		113,
		true
	},
	commander_total_gold = {
		930929,
		95,
		true
	},
	commander_use_box_tip = {
		931024,
		101,
		true
	},
	commander_use_box_queue = {
		931125,
		95,
		true
	},
	commander_command_ability = {
		931220,
		99,
		true
	},
	commander_logistics_ability = {
		931319,
		100,
		true
	},
	commander_tactical_ability = {
		931419,
		97,
		true
	},
	commander_choice_talent_4 = {
		931516,
		147,
		true
	},
	commander_rename_tip = {
		931663,
		145,
		true
	},
	commander_home_level_label = {
		931808,
		103,
		true
	},
	commander_get_commander_coptyright = {
		931911,
		117,
		true
	},
	commander_choice_talent_reset = {
		932028,
		236,
		true
	},
	commander_lock_setting_title = {
		932264,
		180,
		true
	},
	skin_exchange_confirm = {
		932444,
		162,
		true
	},
	skin_purchase_confirm = {
		932606,
		238,
		true
	},
	blackfriday_pack_lock = {
		932844,
		126,
		true
	},
	skin_exchange_title = {
		932970,
		99,
		true
	},
	blackfriday_pack_select_skinall = {
		933069,
		257,
		true
	},
	skin_discount_desc = {
		933326,
		137,
		true
	},
	skin_exchange_timelimit = {
		933463,
		198,
		true
	},
	blackfriday_pack_purchased = {
		933661,
		99,
		true
	},
	commander_unsel_lock_flag_tip = {
		933760,
		200,
		true
	},
	skin_discount_timelimit = {
		933960,
		175,
		true
	},
	shan_luan_task_progress_tip = {
		934135,
		104,
		true
	},
	shan_luan_task_level_tip = {
		934239,
		104,
		true
	},
	shan_luan_task_help = {
		934343,
		876,
		true
	},
	shan_luan_task_buff_default = {
		935219,
		94,
		true
	},
	senran_pt_consume_tip = {
		935313,
		228,
		true
	},
	senran_pt_not_enough = {
		935541,
		139,
		true
	},
	senran_pt_help = {
		935680,
		595,
		true
	},
	senran_pt_rank = {
		936275,
		101,
		true
	},
	senran_pt_words_feiniao = {
		936376,
		420,
		true
	},
	senran_pt_words_banjiu = {
		936796,
		524,
		true
	},
	senran_pt_words_yan = {
		937320,
		419,
		true
	},
	senran_pt_words_xuequan = {
		937739,
		453,
		true
	},
	senran_pt_words_xuebugui = {
		938192,
		433,
		true
	},
	senran_pt_words_zi = {
		938625,
		394,
		true
	},
	senran_pt_words_xishao = {
		939019,
		392,
		true
	},
	senrankagura_backhill_help = {
		939411,
		1252,
		true
	},
	vote_lable_not_start = {
		940663,
		90,
		true
	},
	vote_lable_voting = {
		940753,
		92,
		true
	},
	vote_lable_title = {
		940845,
		173,
		true
	},
	vote_lable_acc_title_1 = {
		941018,
		97,
		true
	},
	vote_lable_acc_title_2 = {
		941115,
		98,
		true
	},
	vote_lable_curr_title_1 = {
		941213,
		103,
		true
	},
	vote_lable_curr_title_2 = {
		941316,
		104,
		true
	},
	vote_lable_window_title = {
		941420,
		94,
		true
	},
	vote_lable_rearch = {
		941514,
		90,
		true
	},
	vote_lable_daily_task_title = {
		941604,
		98,
		true
	},
	vote_lable_daily_task_tip = {
		941702,
		138,
		true
	},
	vote_lable_task_title = {
		941840,
		96,
		true
	},
	vote_lable_task_list_is_empty = {
		941936,
		124,
		true
	},
	vote_lable_ship_votes = {
		942060,
		95,
		true
	},
	vote_help_2023 = {
		942155,
		5208,
		true
	},
	vote_tip_level_limit = {
		947363,
		139,
		true
	},
	vote_label_rank = {
		947502,
		83,
		true
	},
	vote_label_rank_fresh_time_tip = {
		947585,
		135,
		true
	},
	vote_tip_area_closed = {
		947720,
		102,
		true
	},
	commander_skill_ui_info = {
		947822,
		91,
		true
	},
	commander_skill_ui_confirm = {
		947913,
		97,
		true
	},
	commander_formation_prefab_fleet = {
		948010,
		102,
		true
	},
	rect_ship_card_tpl_add = {
		948112,
		96,
		true
	},
	newyear2024_backhill_help = {
		948208,
		1024,
		true
	},
	last_times_sign = {
		949232,
		100,
		true
	},
	skin_page_sign = {
		949332,
		83,
		true
	},
	skin_page_desc = {
		949415,
		178,
		true
	},
	live2d_reset_desc = {
		949593,
		110,
		true
	},
	skin_exchange_usetip = {
		949703,
		138,
		true
	},
	blackfriday_pack_select_skinall_dialog = {
		949841,
		211,
		true
	},
	not_use_ticket_to_buy_skin = {
		950052,
		113,
		true
	},
	skin_purchase_over_price = {
		950165,
		337,
		true
	},
	help_chunjie2024 = {
		950502,
		1357,
		true
	},
	child_random_polaroid_drop = {
		951859,
		97,
		true
	},
	child_random_ops_drop = {
		951956,
		99,
		true
	},
	child_refresh_sure_tip = {
		952055,
		118,
		true
	},
	child_target_set_sure_tip = {
		952173,
		225,
		true
	},
	child_polaroid_lock_tip = {
		952398,
		128,
		true
	},
	child_task_finish_all = {
		952526,
		115,
		true
	},
	child_unlock_new_secretary = {
		952641,
		197,
		true
	},
	child_no_resource = {
		952838,
		103,
		true
	},
	child_target_set_empty = {
		952941,
		110,
		true
	},
	child_target_set_skip = {
		953051,
		132,
		true
	},
	child_news_import_empty = {
		953183,
		130,
		true
	},
	child_news_other_empty = {
		953313,
		116,
		true
	},
	word_week_day1 = {
		953429,
		84,
		true
	},
	word_week_day2 = {
		953513,
		85,
		true
	},
	word_week_day3 = {
		953598,
		87,
		true
	},
	word_week_day4 = {
		953685,
		86,
		true
	},
	word_week_day5 = {
		953771,
		84,
		true
	},
	word_week_day6 = {
		953855,
		86,
		true
	},
	word_week_day7 = {
		953941,
		84,
		true
	},
	child_shop_price_title = {
		954025,
		92,
		true
	},
	child_callname_tip = {
		954117,
		104,
		true
	},
	child_plan_no_cost = {
		954221,
		93,
		true
	},
	word_emoji_unlock = {
		954314,
		102,
		true
	},
	word_get_emoji = {
		954416,
		86,
		true
	},
	word_show_extra_reward_at_fudai_dialog = {
		954502,
		136,
		true
	},
	skin_shop_buy_confirm = {
		954638,
		166,
		true
	},
	activity_victory = {
		954804,
		106,
		true
	},
	other_world_temple_toggle_1 = {
		954910,
		106,
		true
	},
	other_world_temple_toggle_2 = {
		955016,
		108,
		true
	},
	other_world_temple_toggle_3 = {
		955124,
		107,
		true
	},
	other_world_temple_char = {
		955231,
		96,
		true
	},
	other_world_temple_award = {
		955327,
		101,
		true
	},
	other_world_temple_got = {
		955428,
		93,
		true
	},
	other_world_temple_progress = {
		955521,
		136,
		true
	},
	other_world_temple_char_title = {
		955657,
		102,
		true
	},
	other_world_temple_award_last = {
		955759,
		108,
		true
	},
	other_world_temple_award_title_1 = {
		955867,
		122,
		true
	},
	other_world_temple_award_title_2 = {
		955989,
		124,
		true
	},
	other_world_temple_award_title_3 = {
		956113,
		123,
		true
	},
	other_world_temple_lottery_all = {
		956236,
		123,
		true
	},
	other_world_temple_award_desc = {
		956359,
		163,
		true
	},
	temple_consume_not_enough = {
		956522,
		111,
		true
	},
	other_world_temple_pay = {
		956633,
		101,
		true
	},
	other_world_task_type_daily = {
		956734,
		96,
		true
	},
	other_world_task_type_main = {
		956830,
		94,
		true
	},
	other_world_task_type_repeat = {
		956924,
		106,
		true
	},
	other_world_task_title = {
		957030,
		100,
		true
	},
	other_world_task_get_all = {
		957130,
		97,
		true
	},
	other_world_task_go = {
		957227,
		90,
		true
	},
	other_world_task_got = {
		957317,
		91,
		true
	},
	other_world_task_get = {
		957408,
		89,
		true
	},
	other_world_task_tag_main = {
		957497,
		93,
		true
	},
	other_world_task_tag_daily = {
		957590,
		95,
		true
	},
	other_world_task_tag_all = {
		957685,
		91,
		true
	},
	terminal_personal_title = {
		957776,
		101,
		true
	},
	terminal_adventure_title = {
		957877,
		102,
		true
	},
	terminal_guardian_title = {
		957979,
		96,
		true
	},
	personal_info_title = {
		958075,
		93,
		true
	},
	personal_property_title = {
		958168,
		92,
		true
	},
	personal_ability_title = {
		958260,
		92,
		true
	},
	adventure_award_title = {
		958352,
		108,
		true
	},
	adventure_progress_title = {
		958460,
		102,
		true
	},
	adventure_lv_title = {
		958562,
		99,
		true
	},
	adventure_record_title = {
		958661,
		99,
		true
	},
	adventure_record_grade_title = {
		958760,
		108,
		true
	},
	adventure_award_end_tip = {
		958868,
		125,
		true
	},
	guardian_select_title = {
		958993,
		100,
		true
	},
	guardian_sure_btn = {
		959093,
		85,
		true
	},
	guardian_cancel_btn = {
		959178,
		89,
		true
	},
	guardian_active_tip = {
		959267,
		89,
		true
	},
	personal_random = {
		959356,
		94,
		true
	},
	adventure_get_all = {
		959450,
		90,
		true
	},
	Announcements_Event_Notice = {
		959540,
		95,
		true
	},
	Announcements_System_Notice = {
		959635,
		97,
		true
	},
	Announcements_News = {
		959732,
		86,
		true
	},
	Announcements_Donotshow = {
		959818,
		109,
		true
	},
	adventure_unlock_tip = {
		959927,
		170,
		true
	},
	personal_random_tip = {
		960097,
		139,
		true
	},
	guardian_sure_limit_tip = {
		960236,
		123,
		true
	},
	other_world_temple_tip = {
		960359,
		533,
		true
	},
	otherworld_map_help = {
		960892,
		530,
		true
	},
	otherworld_backhill_help = {
		961422,
		535,
		true
	},
	otherworld_terminal_help = {
		961957,
		535,
		true
	},
	vote_2023_reward_word_1 = {
		962492,
		207,
		true
	},
	vote_2023_reward_word_2 = {
		962699,
		357,
		true
	},
	vote_2023_reward_word_3 = {
		963056,
		354,
		true
	},
	voting_page_reward = {
		963410,
		87,
		true
	},
	backyard_shipAddInimacy_ships_ok = {
		963497,
		177,
		true
	},
	backyard_shipAddMoney_ships_ok = {
		963674,
		201,
		true
	},
	idol3rd_houshan = {
		963875,
		1145,
		true
	},
	idol3rd_collection = {
		965020,
		800,
		true
	},
	idol3rd_practice = {
		965820,
		944,
		true
	},
	main_silent_tip_1 = {
		966764,
		122,
		true
	},
	main_silent_tip_2 = {
		966886,
		125,
		true
	},
	main_silent_tip_3 = {
		967011,
		121,
		true
	},
	main_silent_tip_4 = {
		967132,
		113,
		true
	},
	commission_label_go = {
		967245,
		90,
		true
	},
	commission_label_finish = {
		967335,
		95,
		true
	},
	commission_label_go_mellow = {
		967430,
		97,
		true
	},
	commission_label_finish_mellow = {
		967527,
		102,
		true
	},
	commission_label_unlock_event_tip = {
		967629,
		126,
		true
	},
	commission_label_unlock_tech_tip = {
		967755,
		125,
		true
	},
	specialshipyard_tip = {
		967880,
		165,
		true
	},
	specialshipyard_name = {
		968045,
		97,
		true
	},
	liner_sign_cnt_tip = {
		968142,
		103,
		true
	},
	liner_sign_unlock_tip = {
		968245,
		100,
		true
	},
	liner_target_type1 = {
		968345,
		93,
		true
	},
	liner_target_type2 = {
		968438,
		91,
		true
	},
	liner_target_type3 = {
		968529,
		98,
		true
	},
	liner_target_type4 = {
		968627,
		97,
		true
	},
	liner_target_type5 = {
		968724,
		112,
		true
	},
	liner_log_schedule_title = {
		968836,
		103,
		true
	},
	liner_log_room_title = {
		968939,
		109,
		true
	},
	liner_log_event_title = {
		969048,
		101,
		true
	},
	liner_schedule_award_tip1 = {
		969149,
		115,
		true
	},
	liner_schedule_award_tip2 = {
		969264,
		115,
		true
	},
	liner_room_award_tip = {
		969379,
		109,
		true
	},
	liner_event_award_tip1 = {
		969488,
		152,
		true
	},
	liner_log_event_group_title1 = {
		969640,
		102,
		true
	},
	liner_log_event_group_title2 = {
		969742,
		102,
		true
	},
	liner_log_event_group_title3 = {
		969844,
		102,
		true
	},
	liner_log_event_group_title4 = {
		969946,
		102,
		true
	},
	liner_event_award_tip2 = {
		970048,
		115,
		true
	},
	liner_event_reasoning_title = {
		970163,
		107,
		true
	},
	["7th_main_tip"] = {
		970270,
		850,
		true
	},
	pipe_minigame_help = {
		971120,
		294,
		true
	},
	pipe_minigame_rank = {
		971414,
		114,
		true
	},
	liner_event_award_tip3 = {
		971528,
		128,
		true
	},
	liner_room_get_tip = {
		971656,
		110,
		true
	},
	liner_event_get_tip = {
		971766,
		101,
		true
	},
	liner_event_lock = {
		971867,
		132,
		true
	},
	liner_event_title1 = {
		971999,
		88,
		true
	},
	liner_event_title2 = {
		972087,
		88,
		true
	},
	liner_event_title3 = {
		972175,
		88,
		true
	},
	liner_help = {
		972263,
		74,
		true
	},
	liner_activity_lock = {
		972337,
		135,
		true
	},
	liner_name_modify = {
		972472,
		122,
		true
	},
	UrExchange_Pt_NotEnough = {
		972594,
		125,
		true
	},
	UrExchange_Pt_charges = {
		972719,
		105,
		true
	},
	UrExchange_Pt_help = {
		972824,
		335,
		true
	}
}
