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
		276,
		true
	},
	quota_shop_title = {
		160285,
		96,
		true
	},
	quota_shop_description = {
		160381,
		183,
		true
	},
	quota_shop_owned = {
		160564,
		85,
		true
	},
	quota_shop_good_limit = {
		160649,
		98,
		true
	},
	quota_shop_limit_error = {
		160747,
		145,
		true
	},
	event_start_success = {
		160892,
		104,
		true
	},
	event_start_fail = {
		160996,
		107,
		true
	},
	event_finish_success = {
		161103,
		104,
		true
	},
	event_finish_fail = {
		161207,
		111,
		true
	},
	event_giveup_success = {
		161318,
		114,
		true
	},
	event_giveup_fail = {
		161432,
		110,
		true
	},
	event_flush_success = {
		161542,
		107,
		true
	},
	event_flush_fail = {
		161649,
		107,
		true
	},
	event_flush_not_enough = {
		161756,
		110,
		true
	},
	event_start = {
		161866,
		80,
		true
	},
	event_finish = {
		161946,
		84,
		true
	},
	event_giveup = {
		162030,
		82,
		true
	},
	event_minimus_ship_numbers = {
		162112,
		184,
		true
	},
	event_confirm_giveup = {
		162296,
		131,
		true
	},
	event_confirm_flush = {
		162427,
		172,
		true
	},
	event_fleet_busy = {
		162599,
		146,
		true
	},
	event_same_type_not_allowed = {
		162745,
		127,
		true
	},
	event_condition_ship_level = {
		162872,
		165,
		true
	},
	event_condition_ship_count = {
		163037,
		145,
		true
	},
	event_condition_ship_type = {
		163182,
		119,
		true
	},
	event_level_unreached = {
		163301,
		108,
		true
	},
	event_type_unreached = {
		163409,
		119,
		true
	},
	event_oil_consume = {
		163528,
		168,
		true
	},
	event_type_unlimit = {
		163696,
		90,
		true
	},
	dailyLevel_restCount_notEnough = {
		163786,
		133,
		true
	},
	dailyLevel_unopened = {
		163919,
		91,
		true
	},
	dailyLevel_opened = {
		164010,
		85,
		true
	},
	playerinfo_ship_is_already_flagship = {
		164095,
		128,
		true
	},
	playerinfo_mask_word = {
		164223,
		107,
		true
	},
	just_now = {
		164330,
		80,
		true
	},
	several_minutes_before = {
		164410,
		116,
		true
	},
	several_hours_before = {
		164526,
		115,
		true
	},
	several_days_before = {
		164641,
		113,
		true
	},
	long_time_offline = {
		164754,
		89,
		true
	},
	dont_send_message_frequently = {
		164843,
		114,
		true
	},
	no_activity = {
		164957,
		95,
		true
	},
	which_day = {
		165052,
		102,
		true
	},
	which_day_2 = {
		165154,
		81,
		true
	},
	invalidate_evaluation = {
		165235,
		118,
		true
	},
	chapter_no = {
		165353,
		107,
		true
	},
	reconnect_tip = {
		165460,
		123,
		true
	},
	like_ship_success = {
		165583,
		97,
		true
	},
	eva_ship_success = {
		165680,
		98,
		true
	},
	zan_ship_eva_success = {
		165778,
		100,
		true
	},
	zan_ship_eva_error_7 = {
		165878,
		121,
		true
	},
	eva_count_limit = {
		165999,
		119,
		true
	},
	attribute_durability = {
		166118,
		86,
		true
	},
	attribute_cannon = {
		166204,
		83,
		true
	},
	attribute_torpedo = {
		166287,
		85,
		true
	},
	attribute_antiaircraft = {
		166372,
		89,
		true
	},
	attribute_air = {
		166461,
		81,
		true
	},
	attribute_reload = {
		166542,
		84,
		true
	},
	attribute_cd = {
		166626,
		79,
		true
	},
	attribute_armor_type = {
		166705,
		94,
		true
	},
	attribute_armor = {
		166799,
		84,
		true
	},
	attribute_hit = {
		166883,
		80,
		true
	},
	attribute_speed = {
		166963,
		84,
		true
	},
	attribute_luck = {
		167047,
		82,
		true
	},
	attribute_dodge = {
		167129,
		83,
		true
	},
	attribute_expend = {
		167212,
		84,
		true
	},
	attribute_damage = {
		167296,
		83,
		true
	},
	attribute_healthy = {
		167379,
		88,
		true
	},
	attribute_speciality = {
		167467,
		91,
		true
	},
	attribute_range = {
		167558,
		84,
		true
	},
	attribute_angle = {
		167642,
		91,
		true
	},
	attribute_scatter = {
		167733,
		93,
		true
	},
	attribute_ammo = {
		167826,
		82,
		true
	},
	attribute_antisub = {
		167908,
		85,
		true
	},
	attribute_sonarRange = {
		167993,
		88,
		true
	},
	attribute_sonarInterval = {
		168081,
		92,
		true
	},
	attribute_oxy_max = {
		168173,
		85,
		true
	},
	attribute_dodge_limit = {
		168258,
		99,
		true
	},
	attribute_intimacy = {
		168357,
		90,
		true
	},
	attribute_max_distance_damage = {
		168447,
		111,
		true
	},
	attribute_anti_siren = {
		168558,
		101,
		true
	},
	attribute_add_new = {
		168659,
		85,
		true
	},
	skill = {
		168744,
		75,
		true
	},
	cd_normal = {
		168819,
		75,
		true
	},
	intensify = {
		168894,
		80,
		true
	},
	change = {
		168974,
		76,
		true
	},
	formation_switch_failed = {
		169050,
		111,
		true
	},
	formation_switch_success = {
		169161,
		102,
		true
	},
	formation_switch_tip = {
		169263,
		161,
		true
	},
	formation_reform_tip = {
		169424,
		145,
		true
	},
	formation_invalide = {
		169569,
		120,
		true
	},
	chapter_ap_not_enough = {
		169689,
		110,
		true
	},
	formation_forbid_when_in_chapter = {
		169799,
		159,
		true
	},
	military_forbid_when_in_chapter = {
		169958,
		158,
		true
	},
	confirm_app_exit = {
		170116,
		119,
		true
	},
	friend_info_page_tip = {
		170235,
		109,
		true
	},
	friend_search_page_tip = {
		170344,
		135,
		true
	},
	friend_request_page_tip = {
		170479,
		152,
		true
	},
	friend_id_copy_ok = {
		170631,
		106,
		true
	},
	friend_inpout_key_tip = {
		170737,
		106,
		true
	},
	remove_friend_tip = {
		170843,
		126,
		true
	},
	friend_request_msg_placeholder = {
		170969,
		109,
		true
	},
	friend_request_msg_title = {
		171078,
		105,
		true
	},
	friend_max_count = {
		171183,
		147,
		true
	},
	friend_add_ok = {
		171330,
		90,
		true
	},
	friend_max_count_1 = {
		171420,
		117,
		true
	},
	friend_no_request = {
		171537,
		99,
		true
	},
	reject_all_friend_ok = {
		171636,
		113,
		true
	},
	reject_friend_ok = {
		171749,
		104,
		true
	},
	friend_offline = {
		171853,
		96,
		true
	},
	friend_msg_forbid = {
		171949,
		151,
		true
	},
	dont_add_self = {
		172100,
		114,
		true
	},
	friend_already_add = {
		172214,
		122,
		true
	},
	friend_not_add = {
		172336,
		114,
		true
	},
	friend_send_msg_erro_tip = {
		172450,
		131,
		true
	},
	friend_send_msg_null_tip = {
		172581,
		111,
		true
	},
	friend_search_succeed = {
		172692,
		101,
		true
	},
	friend_request_msg_sent = {
		172793,
		100,
		true
	},
	friend_resume_ship_count = {
		172893,
		100,
		true
	},
	friend_resume_title_metal = {
		172993,
		103,
		true
	},
	friend_resume_collection_rate = {
		173096,
		104,
		true
	},
	friend_resume_attack_count = {
		173200,
		99,
		true
	},
	friend_resume_attack_win_rate = {
		173299,
		100,
		true
	},
	friend_resume_manoeuvre_count = {
		173399,
		104,
		true
	},
	friend_resume_manoeuvre_win_rate = {
		173503,
		104,
		true
	},
	friend_resume_fleet_gs = {
		173607,
		98,
		true
	},
	friend_event_count = {
		173705,
		95,
		true
	},
	firend_relieve_blacklist_ok = {
		173800,
		99,
		true
	},
	firend_relieve_blacklist_tip = {
		173899,
		148,
		true
	},
	word_shipNation_all = {
		174047,
		95,
		true
	},
	word_shipNation_baiYing = {
		174142,
		98,
		true
	},
	word_shipNation_huangJia = {
		174240,
		98,
		true
	},
	word_shipNation_chongYing = {
		174338,
		102,
		true
	},
	word_shipNation_tieXue = {
		174440,
		96,
		true
	},
	word_shipNation_dongHuang = {
		174536,
		102,
		true
	},
	word_shipNation_saDing = {
		174638,
		103,
		true
	},
	word_shipNation_beiLian = {
		174741,
		106,
		true
	},
	word_shipNation_other = {
		174847,
		89,
		true
	},
	word_shipNation_np = {
		174936,
		89,
		true
	},
	word_shipNation_ziyou = {
		175025,
		95,
		true
	},
	word_shipNation_weixi = {
		175120,
		100,
		true
	},
	word_shipNation_yuanwei = {
		175220,
		101,
		true
	},
	word_shipNation_bili = {
		175321,
		96,
		true
	},
	word_shipNation_um = {
		175417,
		96,
		true
	},
	word_shipNation_ai = {
		175513,
		90,
		true
	},
	word_shipNation_holo = {
		175603,
		92,
		true
	},
	word_shipNation_doa = {
		175695,
		98,
		true
	},
	word_shipNation_imas = {
		175793,
		99,
		true
	},
	word_shipNation_link = {
		175892,
		91,
		true
	},
	word_shipNation_ssss = {
		175983,
		88,
		true
	},
	word_shipNation_mot = {
		176071,
		91,
		true
	},
	word_shipNation_ryza = {
		176162,
		96,
		true
	},
	word_shipNation_meta_index = {
		176258,
		94,
		true
	},
	word_shipNation_senran = {
		176352,
		99,
		true
	},
	word_reset = {
		176451,
		79,
		true
	},
	word_asc = {
		176530,
		81,
		true
	},
	word_desc = {
		176611,
		83,
		true
	},
	word_own = {
		176694,
		78,
		true
	},
	word_own1 = {
		176772,
		79,
		true
	},
	oil_buy_limit_tip = {
		176851,
		150,
		true
	},
	friend_resume_title = {
		177001,
		89,
		true
	},
	friend_resume_data_title = {
		177090,
		92,
		true
	},
	batch_destroy = {
		177182,
		90,
		true
	},
	equipment_select_device_destroy_tip = {
		177272,
		123,
		true
	},
	equipment_select_device_destroy_bonus_tip = {
		177395,
		120,
		true
	},
	equipment_select_device_destroy_nobonus_tip = {
		177515,
		119,
		true
	},
	ship_equip_profiiency = {
		177634,
		100,
		true
	},
	no_open_system_tip = {
		177734,
		165,
		true
	},
	open_system_tip = {
		177899,
		98,
		true
	},
	charge_start_tip = {
		177997,
		102,
		true
	},
	charge_double_gem_tip = {
		178099,
		104,
		true
	},
	charge_month_card_lefttime_tip = {
		178203,
		122,
		true
	},
	charge_title = {
		178325,
		98,
		true
	},
	charge_extra_gem_tip = {
		178423,
		103,
		true
	},
	charge_month_card_title = {
		178526,
		143,
		true
	},
	charge_items_title = {
		178669,
		96,
		true
	},
	setting_interface_save_success = {
		178765,
		116,
		true
	},
	setting_interface_revert_check = {
		178881,
		148,
		true
	},
	setting_interface_cancel_check = {
		179029,
		115,
		true
	},
	event_special_update = {
		179144,
		106,
		true
	},
	no_notice_tip = {
		179250,
		116,
		true
	},
	energy_desc_1 = {
		179366,
		165,
		true
	},
	energy_desc_2 = {
		179531,
		134,
		true
	},
	energy_desc_3 = {
		179665,
		115,
		true
	},
	energy_desc_4 = {
		179780,
		148,
		true
	},
	intimacy_desc_1 = {
		179928,
		100,
		true
	},
	intimacy_desc_2 = {
		180028,
		107,
		true
	},
	intimacy_desc_3 = {
		180135,
		120,
		true
	},
	intimacy_desc_4 = {
		180255,
		124,
		true
	},
	intimacy_desc_5 = {
		180379,
		118,
		true
	},
	intimacy_desc_6 = {
		180497,
		120,
		true
	},
	intimacy_desc_7 = {
		180617,
		120,
		true
	},
	intimacy_desc_1_buff = {
		180737,
		102,
		true
	},
	intimacy_desc_2_buff = {
		180839,
		102,
		true
	},
	intimacy_desc_3_buff = {
		180941,
		141,
		true
	},
	intimacy_desc_4_buff = {
		181082,
		141,
		true
	},
	intimacy_desc_5_buff = {
		181223,
		141,
		true
	},
	intimacy_desc_6_buff = {
		181364,
		141,
		true
	},
	intimacy_desc_7_buff = {
		181505,
		142,
		true
	},
	intimacy_desc_propose = {
		181647,
		323,
		true
	},
	intimacy_desc_1_detail = {
		181970,
		157,
		true
	},
	intimacy_desc_2_detail = {
		182127,
		164,
		true
	},
	intimacy_desc_3_detail = {
		182291,
		196,
		true
	},
	intimacy_desc_4_detail = {
		182487,
		200,
		true
	},
	intimacy_desc_5_detail = {
		182687,
		194,
		true
	},
	intimacy_desc_6_detail = {
		182881,
		324,
		true
	},
	intimacy_desc_7_detail = {
		183205,
		324,
		true
	},
	intimacy_desc_ring = {
		183529,
		96,
		true
	},
	intimacy_desc_tiara = {
		183625,
		96,
		true
	},
	intimacy_desc_day = {
		183721,
		81,
		true
	},
	word_propose_cost_tip1 = {
		183802,
		340,
		true
	},
	word_propose_cost_tip2 = {
		184142,
		318,
		true
	},
	word_propose_tiara_tip = {
		184460,
		153,
		true
	},
	charge_title_getitem = {
		184613,
		117,
		true
	},
	charge_title_getitem_soon = {
		184730,
		113,
		true
	},
	charge_title_getitem_month = {
		184843,
		120,
		true
	},
	charge_limit_all = {
		184963,
		96,
		true
	},
	charge_limit_daily = {
		185059,
		101,
		true
	},
	charge_limit_weekly = {
		185160,
		106,
		true
	},
	charge_limit_monthly = {
		185266,
		108,
		true
	},
	charge_error = {
		185374,
		92,
		true
	},
	charge_success = {
		185466,
		89,
		true
	},
	charge_level_limit = {
		185555,
		99,
		true
	},
	ship_drop_desc_default = {
		185654,
		101,
		true
	},
	charge_limit_lv = {
		185755,
		93,
		true
	},
	charge_time_out = {
		185848,
		144,
		true
	},
	help_shipinfo_equip = {
		185992,
		628,
		true
	},
	help_shipinfo_detail = {
		186620,
		679,
		true
	},
	help_shipinfo_intensify = {
		187299,
		632,
		true
	},
	help_shipinfo_upgrate = {
		187931,
		630,
		true
	},
	help_shipinfo_maxlevel = {
		188561,
		631,
		true
	},
	help_shipinfo_actnpc = {
		189192,
		1323,
		true
	},
	help_backyard = {
		190515,
		590,
		true
	},
	help_shipinfo_fashion = {
		191105,
		168,
		true
	},
	help_shipinfo_attr = {
		191273,
		3706,
		true
	},
	help_equipment = {
		194979,
		1884,
		true
	},
	help_equipment_skin = {
		196863,
		912,
		true
	},
	help_daily_task = {
		197775,
		3705,
		true
	},
	help_build = {
		201480,
		281,
		true
	},
	help_build_1 = {
		201761,
		551,
		true
	},
	help_build_2 = {
		202312,
		283,
		true
	},
	help_build_4 = {
		202595,
		573,
		true
	},
	help_build_5 = {
		203168,
		792,
		true
	},
	help_shipinfo_hunting = {
		203960,
		1244,
		true
	},
	shop_extendship_success = {
		205204,
		101,
		true
	},
	shop_extendequip_success = {
		205305,
		110,
		true
	},
	shop_spweapon_success = {
		205415,
		137,
		true
	},
	naval_academy_res_desc_cateen = {
		205552,
		240,
		true
	},
	naval_academy_res_desc_shop = {
		205792,
		211,
		true
	},
	naval_academy_res_desc_class = {
		206003,
		270,
		true
	},
	number_1 = {
		206273,
		73,
		true
	},
	number_2 = {
		206346,
		73,
		true
	},
	number_3 = {
		206419,
		73,
		true
	},
	number_4 = {
		206492,
		73,
		true
	},
	number_5 = {
		206565,
		73,
		true
	},
	number_6 = {
		206638,
		73,
		true
	},
	number_7 = {
		206711,
		73,
		true
	},
	number_8 = {
		206784,
		73,
		true
	},
	number_9 = {
		206857,
		73,
		true
	},
	number_10 = {
		206930,
		75,
		true
	},
	military_shop_no_open_tip = {
		207005,
		188,
		true
	},
	switch_to_shop_tip_1 = {
		207193,
		149,
		true
	},
	switch_to_shop_tip_2 = {
		207342,
		142,
		true
	},
	switch_to_shop_tip_3 = {
		207484,
		127,
		true
	},
	switch_to_shop_tip_noPos = {
		207611,
		123,
		true
	},
	text_noPos_clear = {
		207734,
		84,
		true
	},
	text_noPos_buy = {
		207818,
		84,
		true
	},
	text_noPos_intensify = {
		207902,
		92,
		true
	},
	switch_to_shop_tip_noDockyard = {
		207994,
		125,
		true
	},
	commission_no_open = {
		208119,
		83,
		true
	},
	commission_open_tip = {
		208202,
		107,
		true
	},
	commission_idle = {
		208309,
		86,
		true
	},
	commission_urgency = {
		208395,
		101,
		true
	},
	commission_normal = {
		208496,
		93,
		true
	},
	commission_get_award = {
		208589,
		109,
		true
	},
	activity_build_end_tip = {
		208698,
		127,
		true
	},
	event_over_time_expired = {
		208825,
		106,
		true
	},
	mail_sender_default = {
		208931,
		95,
		true
	},
	exchangecode_title = {
		209026,
		95,
		true
	},
	exchangecode_use_placeholder = {
		209121,
		116,
		true
	},
	exchangecode_use_ok = {
		209237,
		132,
		true
	},
	exchangecode_use_error = {
		209369,
		110,
		true
	},
	exchangecode_use_error_3 = {
		209479,
		105,
		true
	},
	exchangecode_use_error_6 = {
		209584,
		122,
		true
	},
	exchangecode_use_error_7 = {
		209706,
		115,
		true
	},
	exchangecode_use_error_8 = {
		209821,
		108,
		true
	},
	exchangecode_use_error_9 = {
		209929,
		108,
		true
	},
	exchangecode_use_error_16 = {
		210037,
		108,
		true
	},
	exchangecode_use_error_20 = {
		210145,
		109,
		true
	},
	text_noRes_tip = {
		210254,
		92,
		true
	},
	text_noRes_info_tip = {
		210346,
		111,
		true
	},
	text_noRes_info_tip_link = {
		210457,
		93,
		true
	},
	text_noRes_info_tip2 = {
		210550,
		137,
		true
	},
	text_shop_noRes_tip = {
		210687,
		112,
		true
	},
	text_shop_enoughRes_tip = {
		210799,
		128,
		true
	},
	text_buy_fashion_tip = {
		210927,
		108,
		true
	},
	equip_part_title = {
		211035,
		83,
		true
	},
	equip_part_main_title = {
		211118,
		95,
		true
	},
	equip_part_sub_title = {
		211213,
		99,
		true
	},
	equipment_upgrade_overlimit = {
		211312,
		133,
		true
	},
	err_name_existOtherChar = {
		211445,
		117,
		true
	},
	help_battle_rule = {
		211562,
		511,
		true
	},
	help_battle_warspite = {
		212073,
		300,
		true
	},
	help_battle_defense = {
		212373,
		588,
		true
	},
	backyard_theme_set_tip = {
		212961,
		147,
		true
	},
	backyard_theme_save_tip = {
		213108,
		172,
		true
	},
	backyard_theme_defaultname = {
		213280,
		102,
		true
	},
	backyard_rename_success = {
		213382,
		105,
		true
	},
	ship_set_skin_success = {
		213487,
		98,
		true
	},
	ship_set_skin_error = {
		213585,
		107,
		true
	},
	equip_part_tip = {
		213692,
		109,
		true
	},
	help_battle_auto = {
		213801,
		334,
		true
	},
	gold_buy_tip = {
		214135,
		247,
		true
	},
	oil_buy_tip = {
		214382,
		387,
		true
	},
	text_iknow = {
		214769,
		80,
		true
	},
	help_oil_buy_limit = {
		214849,
		299,
		true
	},
	text_nofood_yes = {
		215148,
		88,
		true
	},
	text_nofood_no = {
		215236,
		84,
		true
	},
	tip_add_task = {
		215320,
		91,
		true
	},
	collection_award_ship = {
		215411,
		134,
		true
	},
	guild_create_sucess = {
		215545,
		97,
		true
	},
	guild_create_error = {
		215642,
		105,
		true
	},
	guild_create_error_noname = {
		215747,
		117,
		true
	},
	guild_create_error_nofaction = {
		215864,
		131,
		true
	},
	guild_create_error_nopolicy = {
		215995,
		121,
		true
	},
	guild_create_error_nomanifesto = {
		216116,
		123,
		true
	},
	guild_create_error_nomoney = {
		216239,
		117,
		true
	},
	guild_tip_dissolve = {
		216356,
		347,
		true
	},
	guild_tip_quit = {
		216703,
		119,
		true
	},
	guild_create_confirm = {
		216822,
		144,
		true
	},
	guild_apply_erro = {
		216966,
		113,
		true
	},
	guild_dissolve_erro = {
		217079,
		108,
		true
	},
	guild_fire_erro = {
		217187,
		107,
		true
	},
	guild_impeach_erro = {
		217294,
		114,
		true
	},
	guild_quit_erro = {
		217408,
		101,
		true
	},
	guild_accept_erro = {
		217509,
		110,
		true
	},
	guild_reject_erro = {
		217619,
		110,
		true
	},
	guild_modify_erro = {
		217729,
		103,
		true
	},
	guild_setduty_erro = {
		217832,
		106,
		true
	},
	guild_apply_sucess = {
		217938,
		108,
		true
	},
	guild_no_exist = {
		218046,
		99,
		true
	},
	guild_dissolve_sucess = {
		218145,
		110,
		true
	},
	guild_commder_in_impeach_time = {
		218255,
		126,
		true
	},
	guild_impeach_sucess = {
		218381,
		107,
		true
	},
	guild_quit_sucess = {
		218488,
		105,
		true
	},
	guild_member_max_count = {
		218593,
		104,
		true
	},
	guild_new_member_join = {
		218697,
		119,
		true
	},
	guild_player_in_cd_time = {
		218816,
		185,
		true
	},
	guild_player_already_join = {
		219001,
		123,
		true
	},
	guild_rejecet_apply_sucess = {
		219124,
		111,
		true
	},
	guild_should_input_keyword = {
		219235,
		117,
		true
	},
	guild_search_sucess = {
		219352,
		99,
		true
	},
	guild_list_refresh_sucess = {
		219451,
		123,
		true
	},
	guild_info_update = {
		219574,
		100,
		true
	},
	guild_duty_id_is_null = {
		219674,
		108,
		true
	},
	guild_player_is_null = {
		219782,
		109,
		true
	},
	guild_duty_commder_max_count = {
		219891,
		126,
		true
	},
	guild_set_duty_sucess = {
		220017,
		107,
		true
	},
	guild_policy_power = {
		220124,
		86,
		true
	},
	guild_policy_relax = {
		220210,
		88,
		true
	},
	guild_faction_blhx = {
		220298,
		91,
		true
	},
	guild_faction_cszz = {
		220389,
		94,
		true
	},
	guild_faction_unknown = {
		220483,
		89,
		true
	},
	guild_faction_meta = {
		220572,
		86,
		true
	},
	guild_word_commder = {
		220658,
		89,
		true
	},
	guild_word_deputy_commder = {
		220747,
		101,
		true
	},
	guild_word_picked = {
		220848,
		86,
		true
	},
	guild_word_ordinary = {
		220934,
		89,
		true
	},
	guild_word_home = {
		221023,
		83,
		true
	},
	guild_word_member = {
		221106,
		88,
		true
	},
	guild_word_apply = {
		221194,
		85,
		true
	},
	guild_faction_change_tip = {
		221279,
		197,
		true
	},
	guild_msg_is_null = {
		221476,
		111,
		true
	},
	guild_log_new_guild_join = {
		221587,
		192,
		true
	},
	guild_log_duty_change = {
		221779,
		178,
		true
	},
	guild_log_quit = {
		221957,
		180,
		true
	},
	guild_log_fire = {
		222137,
		187,
		true
	},
	guild_leave_cd_time = {
		222324,
		148,
		true
	},
	guild_sort_time = {
		222472,
		83,
		true
	},
	guild_sort_level = {
		222555,
		83,
		true
	},
	guild_sort_duty = {
		222638,
		83,
		true
	},
	guild_fire_tip = {
		222721,
		120,
		true
	},
	guild_impeach_tip = {
		222841,
		126,
		true
	},
	guild_set_duty_title = {
		222967,
		99,
		true
	},
	guild_search_list_max_count = {
		223066,
		107,
		true
	},
	guild_sort_all = {
		223173,
		81,
		true
	},
	guild_sort_blhx = {
		223254,
		88,
		true
	},
	guild_sort_cszz = {
		223342,
		91,
		true
	},
	guild_sort_power = {
		223433,
		84,
		true
	},
	guild_sort_relax = {
		223517,
		86,
		true
	},
	guild_join_cd = {
		223603,
		142,
		true
	},
	guild_name_invaild = {
		223745,
		110,
		true
	},
	guild_apply_full = {
		223855,
		117,
		true
	},
	guild_member_full = {
		223972,
		101,
		true
	},
	guild_fire_duty_limit = {
		224073,
		142,
		true
	},
	guild_fire_succeed = {
		224215,
		89,
		true
	},
	guild_duty_tip_1 = {
		224304,
		115,
		true
	},
	guild_duty_tip_2 = {
		224419,
		116,
		true
	},
	battle_repair_special_tip = {
		224535,
		168,
		true
	},
	battle_repair_normal_name = {
		224703,
		109,
		true
	},
	battle_repair_special_name = {
		224812,
		111,
		true
	},
	oil_max_tip_title = {
		224923,
		110,
		true
	},
	gold_max_tip_title = {
		225033,
		113,
		true
	},
	expbook_max_tip_title = {
		225146,
		121,
		true
	},
	resource_max_tip_shop = {
		225267,
		108,
		true
	},
	resource_max_tip_event = {
		225375,
		122,
		true
	},
	resource_max_tip_battle = {
		225497,
		162,
		true
	},
	resource_max_tip_collect = {
		225659,
		124,
		true
	},
	resource_max_tip_mail = {
		225783,
		121,
		true
	},
	resource_max_tip_eventstart = {
		225904,
		118,
		true
	},
	resource_max_tip_destroy = {
		226022,
		111,
		true
	},
	resource_max_tip_retire = {
		226133,
		104,
		true
	},
	resource_max_tip_retire_1 = {
		226237,
		163,
		true
	},
	new_version_tip = {
		226400,
		165,
		true
	},
	guild_request_msg_title = {
		226565,
		115,
		true
	},
	guild_request_msg_placeholder = {
		226680,
		147,
		true
	},
	ship_upgrade_unequip_tip = {
		226827,
		223,
		true
	},
	destination_can_not_reach = {
		227050,
		121,
		true
	},
	destination_can_not_reach_safety = {
		227171,
		136,
		true
	},
	destination_not_in_range = {
		227307,
		123,
		true
	},
	level_ammo_enough = {
		227430,
		146,
		true
	},
	level_ammo_supply = {
		227576,
		120,
		true
	},
	level_ammo_empty = {
		227696,
		132,
		true
	},
	level_ammo_supply_p1 = {
		227828,
		108,
		true
	},
	level_flare_supply = {
		227936,
		209,
		true
	},
	chat_level_not_enough = {
		228145,
		136,
		true
	},
	chat_msg_inform = {
		228281,
		143,
		true
	},
	chat_msg_ban = {
		228424,
		182,
		true
	},
	month_card_set_ratio_success = {
		228606,
		115,
		true
	},
	month_card_set_ratio_not_change = {
		228721,
		125,
		true
	},
	charge_ship_bag_max = {
		228846,
		117,
		true
	},
	charge_equip_bag_max = {
		228963,
		121,
		true
	},
	login_wait_tip = {
		229084,
		141,
		true
	},
	ship_equip_exchange_tip = {
		229225,
		189,
		true
	},
	ship_rename_success = {
		229414,
		109,
		true
	},
	formation_chapter_lock = {
		229523,
		122,
		true
	},
	elite_disable_unsatisfied = {
		229645,
		127,
		true
	},
	elite_disable_ship_escort = {
		229772,
		158,
		true
	},
	elite_disable_formation_unsatisfied = {
		229930,
		149,
		true
	},
	elite_disable_no_fleet = {
		230079,
		135,
		true
	},
	elite_disable_property_unsatisfied = {
		230214,
		146,
		true
	},
	elite_disable_unusable = {
		230360,
		131,
		true
	},
	elite_warp_to_latest_map = {
		230491,
		111,
		true
	},
	elite_fleet_confirm = {
		230602,
		213,
		true
	},
	elite_condition_level = {
		230815,
		98,
		true
	},
	elite_condition_durability = {
		230913,
		98,
		true
	},
	elite_condition_cannon = {
		231011,
		94,
		true
	},
	elite_condition_torpedo = {
		231105,
		96,
		true
	},
	elite_condition_antiaircraft = {
		231201,
		100,
		true
	},
	elite_condition_air = {
		231301,
		92,
		true
	},
	elite_condition_antisub = {
		231393,
		96,
		true
	},
	elite_condition_dodge = {
		231489,
		94,
		true
	},
	elite_condition_reload = {
		231583,
		95,
		true
	},
	elite_condition_fleet_totle_level = {
		231678,
		134,
		true
	},
	common_compare_larger = {
		231812,
		86,
		true
	},
	common_compare_equal = {
		231898,
		85,
		true
	},
	common_compare_smaller = {
		231983,
		87,
		true
	},
	common_compare_not_less_than = {
		232070,
		95,
		true
	},
	common_compare_not_more_than = {
		232165,
		95,
		true
	},
	level_scene_formation_active_already = {
		232260,
		133,
		true
	},
	level_scene_not_enough = {
		232393,
		120,
		true
	},
	level_scene_full_hp = {
		232513,
		148,
		true
	},
	level_click_to_move = {
		232661,
		115,
		true
	},
	common_hardmode = {
		232776,
		83,
		true
	},
	common_elite_no_quota = {
		232859,
		135,
		true
	},
	common_food = {
		232994,
		81,
		true
	},
	common_no_limit = {
		233075,
		88,
		true
	},
	common_proficiency = {
		233163,
		92,
		true
	},
	backyard_food_remind = {
		233255,
		178,
		true
	},
	backyard_food_count = {
		233433,
		109,
		true
	},
	sham_ship_level_limit = {
		233542,
		114,
		true
	},
	sham_count_limit = {
		233656,
		115,
		true
	},
	sham_count_reset = {
		233771,
		126,
		true
	},
	sham_team_limit = {
		233897,
		175,
		true
	},
	sham_formation_invalid = {
		234072,
		154,
		true
	},
	sham_my_assist_ship_level_limit = {
		234226,
		132,
		true
	},
	sham_reset_confirm = {
		234358,
		160,
		true
	},
	sham_battle_help_tip = {
		234518,
		84,
		true
	},
	sham_reset_err_limit = {
		234602,
		130,
		true
	},
	sham_ship_equip_forbid_1 = {
		234732,
		207,
		true
	},
	sham_ship_equip_forbid_2 = {
		234939,
		183,
		true
	},
	sham_enter_error_friend_ship_expired = {
		235122,
		156,
		true
	},
	sham_can_not_change_ship = {
		235278,
		140,
		true
	},
	sham_friend_ship_tip = {
		235418,
		213,
		true
	},
	inform_sueecss = {
		235631,
		95,
		true
	},
	inform_failed = {
		235726,
		101,
		true
	},
	inform_player = {
		235827,
		94,
		true
	},
	inform_select_type = {
		235921,
		114,
		true
	},
	inform_chat_msg = {
		236035,
		101,
		true
	},
	inform_sueecss_tip = {
		236136,
		161,
		true
	},
	ship_remould_max_level = {
		236297,
		137,
		true
	},
	ship_remould_material_ship_no_enough = {
		236434,
		139,
		true
	},
	ship_remould_material_ship_on_exist = {
		236573,
		138,
		true
	},
	ship_remould_material_unlock_skill = {
		236711,
		112,
		true
	},
	ship_remould_prev_lock = {
		236823,
		93,
		true
	},
	ship_remould_need_level = {
		236916,
		94,
		true
	},
	ship_remould_need_star = {
		237010,
		94,
		true
	},
	ship_remould_finished = {
		237104,
		94,
		true
	},
	ship_remould_no_item = {
		237198,
		101,
		true
	},
	ship_remould_no_gold = {
		237299,
		112,
		true
	},
	ship_remould_no_material = {
		237411,
		120,
		true
	},
	ship_remould_selecte_exceed = {
		237531,
		124,
		true
	},
	ship_remould_sueecss = {
		237655,
		93,
		true
	},
	ship_remould_warning_102174 = {
		237748,
		200,
		true
	},
	ship_remould_warning_102284 = {
		237948,
		205,
		true
	},
	ship_remould_warning_102304 = {
		238153,
		356,
		true
	},
	ship_remould_warning_105214 = {
		238509,
		222,
		true
	},
	ship_remould_warning_105234 = {
		238731,
		235,
		true
	},
	ship_remould_warning_107984 = {
		238966,
		238,
		true
	},
	ship_remould_warning_201514 = {
		239204,
		249,
		true
	},
	ship_remould_warning_203114 = {
		239453,
		361,
		true
	},
	ship_remould_warning_203124 = {
		239814,
		352,
		true
	},
	ship_remould_warning_205124 = {
		240166,
		204,
		true
	},
	ship_remould_warning_205154 = {
		240370,
		228,
		true
	},
	ship_remould_warning_206134 = {
		240598,
		329,
		true
	},
	ship_remould_warning_301534 = {
		240927,
		183,
		true
	},
	ship_remould_warning_301874 = {
		241110,
		551,
		true
	},
	ship_remould_warning_310014 = {
		241661,
		470,
		true
	},
	ship_remould_warning_310024 = {
		242131,
		470,
		true
	},
	ship_remould_warning_310034 = {
		242601,
		470,
		true
	},
	ship_remould_warning_310044 = {
		243071,
		470,
		true
	},
	ship_remould_warning_303154 = {
		243541,
		604,
		true
	},
	ship_remould_warning_402134 = {
		244145,
		264,
		true
	},
	ship_remould_warning_702124 = {
		244409,
		492,
		true
	},
	ship_remould_warning_520014 = {
		244901,
		280,
		true
	},
	ship_remould_warning_521014 = {
		245181,
		282,
		true
	},
	ship_remould_warning_520034 = {
		245463,
		280,
		true
	},
	ship_remould_warning_521034 = {
		245743,
		282,
		true
	},
	ship_remould_warning_520044 = {
		246025,
		280,
		true
	},
	ship_remould_warning_521044 = {
		246305,
		282,
		true
	},
	ship_remould_warning_502114 = {
		246587,
		186,
		true
	},
	ship_remould_warning_506114 = {
		246773,
		399,
		true
	},
	word_soundfiles_download_title = {
		247172,
		116,
		true
	},
	word_soundfiles_download = {
		247288,
		102,
		true
	},
	word_soundfiles_checking_title = {
		247390,
		105,
		true
	},
	word_soundfiles_checking = {
		247495,
		99,
		true
	},
	word_soundfiles_checkend_title = {
		247594,
		131,
		true
	},
	word_soundfiles_checkend = {
		247725,
		101,
		true
	},
	word_soundfiles_noneedupdate = {
		247826,
		98,
		true
	},
	word_soundfiles_checkfailed = {
		247924,
		122,
		true
	},
	word_soundfiles_retry = {
		248046,
		97,
		true
	},
	word_soundfiles_update = {
		248143,
		97,
		true
	},
	word_soundfiles_update_end_title = {
		248240,
		118,
		true
	},
	word_soundfiles_update_end = {
		248358,
		106,
		true
	},
	word_soundfiles_update_failed = {
		248464,
		124,
		true
	},
	word_soundfiles_update_retry = {
		248588,
		104,
		true
	},
	word_live2dfiles_download_title = {
		248692,
		125,
		true
	},
	word_live2dfiles_download = {
		248817,
		109,
		true
	},
	word_live2dfiles_checking_title = {
		248926,
		107,
		true
	},
	word_live2dfiles_checking = {
		249033,
		98,
		true
	},
	word_live2dfiles_checkend_title = {
		249131,
		140,
		true
	},
	word_live2dfiles_checkend = {
		249271,
		102,
		true
	},
	word_live2dfiles_noneedupdate = {
		249373,
		99,
		true
	},
	word_live2dfiles_checkfailed = {
		249472,
		134,
		true
	},
	word_live2dfiles_retry = {
		249606,
		98,
		true
	},
	word_live2dfiles_update = {
		249704,
		98,
		true
	},
	word_live2dfiles_update_end_title = {
		249802,
		136,
		true
	},
	word_live2dfiles_update_end = {
		249938,
		107,
		true
	},
	word_live2dfiles_update_failed = {
		250045,
		130,
		true
	},
	word_live2dfiles_update_retry = {
		250175,
		105,
		true
	},
	word_live2dfiles_main_update_tip = {
		250280,
		149,
		true
	},
	achieve_propose_tip = {
		250429,
		101,
		true
	},
	mingshi_get_tip = {
		250530,
		105,
		true
	},
	mingshi_task_tip_1 = {
		250635,
		217,
		true
	},
	mingshi_task_tip_2 = {
		250852,
		221,
		true
	},
	mingshi_task_tip_3 = {
		251073,
		220,
		true
	},
	mingshi_task_tip_4 = {
		251293,
		221,
		true
	},
	mingshi_task_tip_5 = {
		251514,
		216,
		true
	},
	mingshi_task_tip_6 = {
		251730,
		215,
		true
	},
	mingshi_task_tip_7 = {
		251945,
		228,
		true
	},
	mingshi_task_tip_8 = {
		252173,
		223,
		true
	},
	mingshi_task_tip_9 = {
		252396,
		221,
		true
	},
	mingshi_task_tip_10 = {
		252617,
		229,
		true
	},
	mingshi_task_tip_11 = {
		252846,
		215,
		true
	},
	word_propose_changename_title = {
		253061,
		163,
		true
	},
	word_propose_changename_tip1 = {
		253224,
		136,
		true
	},
	word_propose_changename_tip2 = {
		253360,
		113,
		true
	},
	word_propose_ring_tip = {
		253473,
		109,
		true
	},
	word_rename_time_tip = {
		253582,
		147,
		true
	},
	word_rename_switch_tip = {
		253729,
		151,
		true
	},
	word_ssr = {
		253880,
		74,
		true
	},
	word_sr = {
		253954,
		76,
		true
	},
	word_r = {
		254030,
		71,
		true
	},
	ship_renameShip_error = {
		254101,
		107,
		true
	},
	ship_renameShip_error_4 = {
		254208,
		125,
		true
	},
	ship_renameShip_error_2011 = {
		254333,
		107,
		true
	},
	ship_proposeShip_error = {
		254440,
		104,
		true
	},
	ship_proposeShip_error_1 = {
		254544,
		106,
		true
	},
	word_rename_time_warning = {
		254650,
		236,
		true
	},
	word_propose_cost_tip = {
		254886,
		453,
		true
	},
	word_propose_switch_tip = {
		255339,
		102,
		true
	},
	evaluate_too_loog = {
		255441,
		101,
		true
	},
	evaluate_ban_word = {
		255542,
		112,
		true
	},
	activity_level_easy_tip = {
		255654,
		181,
		true
	},
	activity_level_difficulty_tip = {
		255835,
		210,
		true
	},
	activity_level_limit_tip = {
		256045,
		174,
		true
	},
	activity_level_inwarime_tip = {
		256219,
		221,
		true
	},
	activity_level_pass_easy_tip = {
		256440,
		187,
		true
	},
	activity_level_is_closed = {
		256627,
		114,
		true
	},
	activity_switch_tip = {
		256741,
		255,
		true
	},
	reduce_sp3_pass_count = {
		256996,
		103,
		true
	},
	qiuqiu_count = {
		257099,
		85,
		true
	},
	qiuqiu_total_count = {
		257184,
		91,
		true
	},
	npcfriendly_count = {
		257275,
		98,
		true
	},
	npcfriendly_total_count = {
		257373,
		97,
		true
	},
	longxiang_count = {
		257470,
		98,
		true
	},
	longxiang_total_count = {
		257568,
		103,
		true
	},
	pt_count = {
		257671,
		82,
		true
	},
	pt_total_count = {
		257753,
		94,
		true
	},
	remould_ship_ok = {
		257847,
		88,
		true
	},
	remould_ship_count_more = {
		257935,
		120,
		true
	},
	word_should_input = {
		258055,
		108,
		true
	},
	simulation_advantage_counting = {
		258163,
		126,
		true
	},
	simulation_disadvantage_counting = {
		258289,
		130,
		true
	},
	simulation_enhancing = {
		258419,
		144,
		true
	},
	simulation_enhanced = {
		258563,
		121,
		true
	},
	word_skill_desc_get = {
		258684,
		94,
		true
	},
	word_skill_desc_learn = {
		258778,
		89,
		true
	},
	chapter_tip_aovid_succeed = {
		258867,
		96,
		true
	},
	chapter_tip_aovid_failed = {
		258963,
		104,
		true
	},
	chapter_tip_change = {
		259067,
		103,
		true
	},
	chapter_tip_use = {
		259170,
		98,
		true
	},
	chapter_tip_with_npc = {
		259268,
		285,
		true
	},
	chapter_tip_bp_ammo = {
		259553,
		137,
		true
	},
	build_ship_tip = {
		259690,
		190,
		true
	},
	auto_battle_limit_tip = {
		259880,
		123,
		true
	},
	build_ship_quickly_buy_stone = {
		260003,
		190,
		true
	},
	build_ship_quickly_buy_tool = {
		260193,
		205,
		true
	},
	ship_profile_voice_locked = {
		260398,
		121,
		true
	},
	ship_profile_skin_locked = {
		260519,
		110,
		true
	},
	ship_profile_words = {
		260629,
		88,
		true
	},
	ship_profile_action_words = {
		260717,
		102,
		true
	},
	ship_profile_label_common = {
		260819,
		96,
		true
	},
	ship_profile_label_diff = {
		260915,
		98,
		true
	},
	level_fleet_lease_one_ship = {
		261013,
		133,
		true
	},
	level_fleet_not_enough = {
		261146,
		131,
		true
	},
	level_fleet_outof_limit = {
		261277,
		125,
		true
	},
	vote_success = {
		261402,
		82,
		true
	},
	vote_not_enough = {
		261484,
		111,
		true
	},
	vote_love_not_enough = {
		261595,
		125,
		true
	},
	vote_love_limit = {
		261720,
		143,
		true
	},
	vote_love_confirm = {
		261863,
		125,
		true
	},
	vote_primary_rule = {
		261988,
		81,
		true
	},
	vote_final_title1 = {
		262069,
		88,
		true
	},
	vote_final_rule1 = {
		262157,
		231,
		true
	},
	vote_final_title2 = {
		262388,
		94,
		true
	},
	vote_final_rule2 = {
		262482,
		240,
		true
	},
	vote_vote_time = {
		262722,
		100,
		true
	},
	vote_vote_count = {
		262822,
		87,
		true
	},
	vote_vote_group = {
		262909,
		87,
		true
	},
	vote_rank_refresh_time = {
		262996,
		120,
		true
	},
	vote_rank_in_current_server = {
		263116,
		128,
		true
	},
	words_auto_battle_label = {
		263244,
		105,
		true
	},
	words_show_ship_name_label = {
		263349,
		106,
		true
	},
	words_rare_ship_vibrate = {
		263455,
		100,
		true
	},
	words_display_ship_get_effect = {
		263555,
		108,
		true
	},
	words_show_touch_effect = {
		263663,
		102,
		true
	},
	words_bg_fit_mode = {
		263765,
		121,
		true
	},
	words_battle_hide_bg = {
		263886,
		116,
		true
	},
	words_battle_expose_line = {
		264002,
		123,
		true
	},
	words_autoFight_battery_savemode = {
		264125,
		121,
		true
	},
	words_autoFight_battery_savemode_des = {
		264246,
		182,
		true
	},
	words_autoFIght_down_frame = {
		264428,
		115,
		true
	},
	words_autoFIght_down_frame_des = {
		264543,
		163,
		true
	},
	words_autoFight_tips = {
		264706,
		131,
		true
	},
	words_autoFight_right = {
		264837,
		175,
		true
	},
	activity_puzzle_get1 = {
		265012,
		132,
		true
	},
	activity_puzzle_get2 = {
		265144,
		143,
		true
	},
	activity_puzzle_get3 = {
		265287,
		143,
		true
	},
	activity_puzzle_get4 = {
		265430,
		143,
		true
	},
	activity_puzzle_get5 = {
		265573,
		143,
		true
	},
	activity_puzzle_get6 = {
		265716,
		143,
		true
	},
	activity_puzzle_get7 = {
		265859,
		143,
		true
	},
	activity_puzzle_get8 = {
		266002,
		143,
		true
	},
	activity_puzzle_get9 = {
		266145,
		143,
		true
	},
	activity_puzzle_get10 = {
		266288,
		133,
		true
	},
	activity_puzzle_get11 = {
		266421,
		133,
		true
	},
	activity_puzzle_get12 = {
		266554,
		133,
		true
	},
	activity_puzzle_get13 = {
		266687,
		133,
		true
	},
	activity_puzzle_get14 = {
		266820,
		133,
		true
	},
	activity_puzzle_get15 = {
		266953,
		133,
		true
	},
	word_stopremain_build = {
		267086,
		102,
		true
	},
	word_stopremain_default = {
		267188,
		104,
		true
	},
	transcode_desc = {
		267292,
		359,
		true
	},
	transcode_empty_tip = {
		267651,
		117,
		true
	},
	set_birth_title = {
		267768,
		91,
		true
	},
	set_birth_confirm_tip = {
		267859,
		110,
		true
	},
	set_birth_empty_tip = {
		267969,
		105,
		true
	},
	set_birth_success = {
		268074,
		107,
		true
	},
	clear_transcode_cache_confirm = {
		268181,
		143,
		true
	},
	clear_transcode_cache_success = {
		268324,
		115,
		true
	},
	exchange_item_success = {
		268439,
		94,
		true
	},
	give_up_cloth_change = {
		268533,
		120,
		true
	},
	err_cloth_change_noship = {
		268653,
		103,
		true
	},
	need_break_tip = {
		268756,
		99,
		true
	},
	max_level_notice = {
		268855,
		152,
		true
	},
	new_skin_no_choose = {
		269007,
		156,
		true
	},
	sure_resume_volume = {
		269163,
		114,
		true
	},
	course_class_not_ready = {
		269277,
		165,
		true
	},
	course_student_max_level = {
		269442,
		152,
		true
	},
	course_stop_confirm = {
		269594,
		103,
		true
	},
	course_class_help = {
		269697,
		1480,
		true
	},
	course_class_name = {
		271177,
		100,
		true
	},
	course_proficiency_not_enough = {
		271277,
		128,
		true
	},
	course_state_rest = {
		271405,
		91,
		true
	},
	course_state_lession = {
		271496,
		97,
		true
	},
	course_energy_not_enough = {
		271593,
		156,
		true
	},
	course_proficiency_tip = {
		271749,
		382,
		true
	},
	course_sunday_tip = {
		272131,
		145,
		true
	},
	course_exit_confirm = {
		272276,
		158,
		true
	},
	course_learning = {
		272434,
		111,
		true
	},
	time_remaining_tip = {
		272545,
		93,
		true
	},
	propose_intimacy_tip = {
		272638,
		119,
		true
	},
	no_found_record_equipment = {
		272757,
		196,
		true
	},
	sec_floor_limit_tip = {
		272953,
		130,
		true
	},
	guild_shop_flash_success = {
		273083,
		98,
		true
	},
	destroy_high_rarity_tip = {
		273181,
		125,
		true
	},
	destroy_high_level_tip = {
		273306,
		133,
		true
	},
	destroy_eliteequipment_tip = {
		273439,
		117,
		true
	},
	destroy_high_intensify_tip = {
		273556,
		124,
		true
	},
	destroy_inHardFormation_tip = {
		273680,
		126,
		true
	},
	destroy_equip_rarity_tip = {
		273806,
		161,
		true
	},
	ship_quick_change_noequip = {
		273967,
		116,
		true
	},
	ship_quick_change_nofreeequip = {
		274083,
		134,
		true
	},
	word_nowenergy = {
		274217,
		84,
		true
	},
	word_energy_recov_speed = {
		274301,
		101,
		true
	},
	destroy_eliteship_tip = {
		274402,
		111,
		true
	},
	err_resloveequip_nochoice = {
		274513,
		120,
		true
	},
	take_nothing = {
		274633,
		103,
		true
	},
	take_all_mail = {
		274736,
		174,
		true
	},
	buy_furniture_overtime = {
		274910,
		135,
		true
	},
	twitter_login_tips = {
		275045,
		166,
		true
	},
	data_erro = {
		275211,
		121,
		true
	},
	login_failed = {
		275332,
		94,
		true
	},
	["not yet completed"] = {
		275426,
		93,
		true
	},
	escort_less_count_to_combat = {
		275519,
		127,
		true
	},
	ten_even_draw = {
		275646,
		94,
		true
	},
	ten_even_draw_confirm = {
		275740,
		111,
		true
	},
	level_risk_level_desc = {
		275851,
		90,
		true
	},
	level_risk_level_mitigation_rate = {
		275941,
		239,
		true
	},
	level_diffcult_chapter_state_safety = {
		276180,
		229,
		true
	},
	level_chapter_state_high_risk = {
		276409,
		137,
		true
	},
	level_chapter_state_risk = {
		276546,
		128,
		true
	},
	level_chapter_state_low_risk = {
		276674,
		133,
		true
	},
	level_chapter_state_safety = {
		276807,
		132,
		true
	},
	open_skill_class_success = {
		276939,
		121,
		true
	},
	backyard_sort_tag_default = {
		277060,
		91,
		true
	},
	backyard_sort_tag_price = {
		277151,
		93,
		true
	},
	backyard_sort_tag_comfortable = {
		277244,
		100,
		true
	},
	backyard_sort_tag_size = {
		277344,
		90,
		true
	},
	backyard_filter_tag_other = {
		277434,
		93,
		true
	},
	word_status_inFight = {
		277527,
		90,
		true
	},
	word_status_inPVP = {
		277617,
		91,
		true
	},
	word_status_inEvent = {
		277708,
		92,
		true
	},
	word_status_inEventFinished = {
		277800,
		100,
		true
	},
	word_status_inTactics = {
		277900,
		93,
		true
	},
	word_status_inClass = {
		277993,
		91,
		true
	},
	word_status_rest = {
		278084,
		87,
		true
	},
	word_status_train = {
		278171,
		89,
		true
	},
	word_status_world = {
		278260,
		97,
		true
	},
	word_status_inHardFormation = {
		278357,
		103,
		true
	},
	word_status_series_enemy = {
		278460,
		103,
		true
	},
	challenge_rule = {
		278563,
		101,
		true
	},
	challenge_exit_warning = {
		278664,
		241,
		true
	},
	challenge_fleet_type_fail = {
		278905,
		141,
		true
	},
	challenge_current_level = {
		279046,
		110,
		true
	},
	challenge_current_score = {
		279156,
		104,
		true
	},
	challenge_total_score = {
		279260,
		99,
		true
	},
	challenge_current_progress = {
		279359,
		113,
		true
	},
	challenge_count_unlimit = {
		279472,
		99,
		true
	},
	challenge_no_fleet = {
		279571,
		118,
		true
	},
	equipment_skin_unload = {
		279689,
		147,
		true
	},
	equipment_skin_no_old_ship = {
		279836,
		119,
		true
	},
	equipment_skin_no_old_skinorequipment = {
		279955,
		162,
		true
	},
	equipment_skin_no_new_ship = {
		280117,
		113,
		true
	},
	equipment_skin_no_new_equipment = {
		280230,
		126,
		true
	},
	equipment_skin_count_noenough = {
		280356,
		115,
		true
	},
	equipment_skin_replace_done = {
		280471,
		120,
		true
	},
	equipment_skin_unload_failed = {
		280591,
		128,
		true
	},
	equipment_skin_unmatch_equipment = {
		280719,
		180,
		true
	},
	equipment_skin_no_equipment_tip = {
		280899,
		156,
		true
	},
	activity_pool_awards_empty = {
		281055,
		119,
		true
	},
	activity_switch_award_pool_failed = {
		281174,
		183,
		true
	},
	shop_street_activity_tip = {
		281357,
		180,
		true
	},
	shop_street_Equipment_skin_box_help = {
		281537,
		166,
		true
	},
	twitter_link_title = {
		281703,
		100,
		true
	},
	commander_material_noenough = {
		281803,
		122,
		true
	},
	battle_result_boss_destruct = {
		281925,
		132,
		true
	},
	battle_preCombatLayer_boss_destruct = {
		282057,
		140,
		true
	},
	destory_important_equipment_tip = {
		282197,
		198,
		true
	},
	destory_important_equipment_input_erro = {
		282395,
		121,
		true
	},
	activity_hit_monster_nocount = {
		282516,
		112,
		true
	},
	activity_hit_monster_death = {
		282628,
		124,
		true
	},
	activity_hit_monster_help = {
		282752,
		119,
		true
	},
	activity_hit_monster_erro = {
		282871,
		103,
		true
	},
	activity_xiaotiane_progress = {
		282974,
		107,
		true
	},
	activity_hit_monster_reset_tip = {
		283081,
		228,
		true
	},
	answer_help_tip = {
		283309,
		182,
		true
	},
	answer_answer_role = {
		283491,
		172,
		true
	},
	answer_exit_tip = {
		283663,
		112,
		true
	},
	equip_skin_detail_tip = {
		283775,
		121,
		true
	},
	emoji_type_0 = {
		283896,
		82,
		true
	},
	emoji_type_1 = {
		283978,
		83,
		true
	},
	emoji_type_2 = {
		284061,
		84,
		true
	},
	emoji_type_3 = {
		284145,
		82,
		true
	},
	emoji_type_4 = {
		284227,
		84,
		true
	},
	card_pairs_help_tip = {
		284311,
		943,
		true
	},
	card_pairs_tips = {
		285254,
		162,
		true
	},
	["card_battle_card details_deck"] = {
		285416,
		105,
		true
	},
	["card_battle_card details_hand"] = {
		285521,
		109,
		true
	},
	["card_battle_card details"] = {
		285630,
		100,
		true
	},
	["card_battle_card details_switchto_deck"] = {
		285730,
		111,
		true
	},
	["card_battle_card details_switchto_hand"] = {
		285841,
		115,
		true
	},
	card_battle_card_empty_en = {
		285956,
		106,
		true
	},
	card_battle_card_empty_ch = {
		286062,
		130,
		true
	},
	card_puzzel_goal_ch = {
		286192,
		93,
		true
	},
	card_puzzel_goal_en = {
		286285,
		89,
		true
	},
	card_puzzle_deck = {
		286374,
		84,
		true
	},
	upgrade_to_next_maxlevel_failed = {
		286458,
		181,
		true
	},
	upgrade_to_next_maxlevel_tip = {
		286639,
		240,
		true
	},
	upgrade_to_next_maxlevel_succeed = {
		286879,
		198,
		true
	},
	extra_chapter_socre_tip = {
		287077,
		173,
		true
	},
	extra_chapter_record_updated = {
		287250,
		102,
		true
	},
	extra_chapter_record_not_updated = {
		287352,
		112,
		true
	},
	extra_chapter_locked_tip = {
		287464,
		120,
		true
	},
	extra_chapter_locked_tip_1 = {
		287584,
		167,
		true
	},
	player_name_change_time_lv_tip = {
		287751,
		172,
		true
	},
	player_name_change_time_limit_tip = {
		287923,
		174,
		true
	},
	player_name_change_windows_tip = {
		288097,
		234,
		true
	},
	player_name_change_warning = {
		288331,
		247,
		true
	},
	player_name_change_success = {
		288578,
		116,
		true
	},
	player_name_change_failed = {
		288694,
		111,
		true
	},
	same_player_name_tip = {
		288805,
		109,
		true
	},
	task_is_not_existence = {
		288914,
		112,
		true
	},
	cannot_build_multiple_printblue = {
		289026,
		366,
		true
	},
	printblue_build_success = {
		289392,
		107,
		true
	},
	printblue_build_erro = {
		289499,
		103,
		true
	},
	blueprint_mod_success = {
		289602,
		107,
		true
	},
	blueprint_mod_erro = {
		289709,
		100,
		true
	},
	technology_refresh_sucess = {
		289809,
		133,
		true
	},
	technology_refresh_erro = {
		289942,
		126,
		true
	},
	change_technology_refresh_sucess = {
		290068,
		136,
		true
	},
	change_technology_refresh_erro = {
		290204,
		130,
		true
	},
	technology_start_up = {
		290334,
		100,
		true
	},
	technology_start_erro = {
		290434,
		101,
		true
	},
	technology_stop_success = {
		290535,
		119,
		true
	},
	technology_stop_erro = {
		290654,
		111,
		true
	},
	technology_finish_success = {
		290765,
		121,
		true
	},
	technology_finish_erro = {
		290886,
		114,
		true
	},
	blueprint_stop_success = {
		291000,
		121,
		true
	},
	blueprint_stop_erro = {
		291121,
		113,
		true
	},
	blueprint_destory_tip = {
		291234,
		119,
		true
	},
	blueprint_task_update_tip = {
		291353,
		172,
		true
	},
	blueprint_mod_addition_lock = {
		291525,
		125,
		true
	},
	blueprint_mod_word_unlock = {
		291650,
		111,
		true
	},
	blueprint_mod_skin_unlock = {
		291761,
		106,
		true
	},
	blueprint_build_consume = {
		291867,
		120,
		true
	},
	blueprint_stop_tip = {
		291987,
		180,
		true
	},
	technology_canot_refresh = {
		292167,
		153,
		true
	},
	technology_refresh_tip = {
		292320,
		138,
		true
	},
	technology_is_actived = {
		292458,
		125,
		true
	},
	technology_stop_tip = {
		292583,
		178,
		true
	},
	technology_help_text = {
		292761,
		2742,
		true
	},
	blueprint_build_time_tip = {
		295503,
		209,
		true
	},
	blueprint_cannot_build_tip = {
		295712,
		147,
		true
	},
	technology_task_none_tip = {
		295859,
		97,
		true
	},
	technology_task_build_tip = {
		295956,
		161,
		true
	},
	blueprint_commit_tip = {
		296117,
		165,
		true
	},
	buleprint_need_level_tip = {
		296282,
		141,
		true
	},
	blueprint_max_level_tip = {
		296423,
		132,
		true
	},
	ship_profile_voice_locked_intimacy = {
		296555,
		133,
		true
	},
	ship_profile_voice_locked_propose = {
		296688,
		115,
		true
	},
	ship_profile_voice_locked_propose_imas = {
		296803,
		120,
		true
	},
	ship_profile_voice_locked_design = {
		296923,
		140,
		true
	},
	ship_profile_voice_locked_meta = {
		297063,
		106,
		true
	},
	help_technolog0 = {
		297169,
		350,
		true
	},
	help_technolog = {
		297519,
		513,
		true
	},
	hide_chat_warning = {
		298032,
		115,
		true
	},
	show_chat_warning = {
		298147,
		117,
		true
	},
	help_shipblueprintui = {
		298264,
		3798,
		true
	},
	help_shipblueprintui_luck = {
		302062,
		734,
		true
	},
	anniversary_task_title_1 = {
		302796,
		175,
		true
	},
	anniversary_task_title_2 = {
		302971,
		206,
		true
	},
	anniversary_task_title_3 = {
		303177,
		177,
		true
	},
	anniversary_task_title_4 = {
		303354,
		210,
		true
	},
	anniversary_task_title_5 = {
		303564,
		184,
		true
	},
	anniversary_task_title_6 = {
		303748,
		204,
		true
	},
	anniversary_task_title_7 = {
		303952,
		202,
		true
	},
	anniversary_task_title_8 = {
		304154,
		169,
		true
	},
	anniversary_task_title_9 = {
		304323,
		193,
		true
	},
	anniversary_task_title_10 = {
		304516,
		176,
		true
	},
	anniversary_task_title_11 = {
		304692,
		160,
		true
	},
	anniversary_task_title_12 = {
		304852,
		178,
		true
	},
	anniversary_task_title_13 = {
		305030,
		195,
		true
	},
	anniversary_task_title_14 = {
		305225,
		179,
		true
	},
	charge_scene_buy_confirm = {
		305404,
		163,
		true
	},
	charge_scene_buy_confirm_gold = {
		305567,
		168,
		true
	},
	charge_scene_batch_buy_tip = {
		305735,
		189,
		true
	},
	help_level_ui = {
		305924,
		968,
		true
	},
	guild_modify_info_tip = {
		306892,
		193,
		true
	},
	ai_change_1 = {
		307085,
		118,
		true
	},
	ai_change_2 = {
		307203,
		117,
		true
	},
	activity_shop_lable = {
		307320,
		127,
		true
	},
	word_bilibili = {
		307447,
		90,
		true
	},
	levelScene_tracking_error_pre = {
		307537,
		143,
		true
	},
	ship_limit_notice = {
		307680,
		157,
		true
	},
	idle = {
		307837,
		73,
		true
	},
	main_1 = {
		307910,
		81,
		true
	},
	main_2 = {
		307991,
		81,
		true
	},
	main_3 = {
		308072,
		81,
		true
	},
	complete = {
		308153,
		84,
		true
	},
	login = {
		308237,
		74,
		true
	},
	home = {
		308311,
		74,
		true
	},
	mail = {
		308385,
		77,
		true
	},
	mission = {
		308462,
		83,
		true
	},
	mission_complete = {
		308545,
		96,
		true
	},
	wedding = {
		308641,
		77,
		true
	},
	touch_head = {
		308718,
		84,
		true
	},
	touch_body = {
		308802,
		79,
		true
	},
	touch_special = {
		308881,
		84,
		true
	},
	gold = {
		308965,
		73,
		true
	},
	oil = {
		309038,
		70,
		true
	},
	diamond = {
		309108,
		75,
		true
	},
	word_photo_mode = {
		309183,
		84,
		true
	},
	word_video_mode = {
		309267,
		82,
		true
	},
	word_save_ok = {
		309349,
		114,
		true
	},
	word_save_video = {
		309463,
		120,
		true
	},
	reflux_help_tip = {
		309583,
		974,
		true
	},
	reflux_pt_not_enough = {
		310557,
		121,
		true
	},
	reflux_word_1 = {
		310678,
		87,
		true
	},
	reflux_word_2 = {
		310765,
		85,
		true
	},
	ship_hunting_level_tips = {
		310850,
		190,
		true
	},
	acquisitionmode_is_not_open = {
		311040,
		123,
		true
	},
	collect_chapter_is_activation = {
		311163,
		140,
		true
	},
	levelScene_chapter_is_activation = {
		311303,
		189,
		true
	},
	resource_verify_warn = {
		311492,
		245,
		true
	},
	resource_verify_fail = {
		311737,
		191,
		true
	},
	resource_verify_success = {
		311928,
		122,
		true
	},
	resource_clear_all = {
		312050,
		178,
		true
	},
	acl_oil_count = {
		312228,
		87,
		true
	},
	acl_oil_total_count = {
		312315,
		99,
		true
	},
	word_take_video_tip = {
		312414,
		141,
		true
	},
	word_snapshot_share_title = {
		312555,
		118,
		true
	},
	word_snapshot_share_agreement = {
		312673,
		540,
		true
	},
	skin_remain_time = {
		313213,
		91,
		true
	},
	word_museum_1 = {
		313304,
		120,
		true
	},
	word_museum_help = {
		313424,
		734,
		true
	},
	goldship_help_tip = {
		314158,
		787,
		true
	},
	metalgearsub_help_tip = {
		314945,
		1847,
		true
	},
	acl_gold_count = {
		316792,
		91,
		true
	},
	acl_gold_total_count = {
		316883,
		102,
		true
	},
	discount_time = {
		316985,
		146,
		true
	},
	commander_talent_not_exist = {
		317131,
		132,
		true
	},
	commander_replace_talent_not_exist = {
		317263,
		154,
		true
	},
	commander_talent_learned = {
		317417,
		121,
		true
	},
	commander_talent_learn_erro = {
		317538,
		133,
		true
	},
	commander_not_exist = {
		317671,
		114,
		true
	},
	commander_fleet_not_exist = {
		317785,
		115,
		true
	},
	commander_fleet_pos_not_exist = {
		317900,
		128,
		true
	},
	commander_equip_to_fleet_erro = {
		318028,
		140,
		true
	},
	commander_acquire_erro = {
		318168,
		138,
		true
	},
	commander_lock_erro = {
		318306,
		121,
		true
	},
	commander_reset_talent_time_no_rearch = {
		318427,
		157,
		true
	},
	commander_reset_talent_is_not_need = {
		318584,
		125,
		true
	},
	commander_reset_talent_success = {
		318709,
		118,
		true
	},
	commander_reset_talent_erro = {
		318827,
		136,
		true
	},
	commander_can_not_be_upgrade = {
		318963,
		133,
		true
	},
	commander_anyone_is_in_fleet = {
		319096,
		139,
		true
	},
	commander_is_in_fleet = {
		319235,
		133,
		true
	},
	commander_play_erro = {
		319368,
		104,
		true
	},
	ship_equip_same_group_equipment = {
		319472,
		136,
		true
	},
	summary_page_un_rearch = {
		319608,
		96,
		true
	},
	player_summary_from = {
		319704,
		97,
		true
	},
	player_summary_data = {
		319801,
		95,
		true
	},
	commander_exp_overflow_tip = {
		319896,
		192,
		true
	},
	commander_reset_talent_tip = {
		320088,
		141,
		true
	},
	commander_reset_talent = {
		320229,
		96,
		true
	},
	commander_select_min_cnt = {
		320325,
		127,
		true
	},
	commander_select_max = {
		320452,
		123,
		true
	},
	commander_lock_done = {
		320575,
		101,
		true
	},
	commander_unlock_done = {
		320676,
		105,
		true
	},
	commander_get_1 = {
		320781,
		127,
		true
	},
	commander_get = {
		320908,
		139,
		true
	},
	commander_build_done = {
		321047,
		114,
		true
	},
	commander_build_erro = {
		321161,
		117,
		true
	},
	commander_get_skills_done = {
		321278,
		132,
		true
	},
	collection_way_is_unopen = {
		321410,
		115,
		true
	},
	commander_can_not_select_same_group = {
		321525,
		162,
		true
	},
	commander_capcity_is_max = {
		321687,
		115,
		true
	},
	commander_reserve_count_is_max = {
		321802,
		128,
		true
	},
	commander_build_pool_tip = {
		321930,
		143,
		true
	},
	commander_select_matiral_erro = {
		322073,
		212,
		true
	},
	commander_material_is_rarity = {
		322285,
		156,
		true
	},
	commander_material_is_maxLevel = {
		322441,
		200,
		true
	},
	charge_commander_bag_max = {
		322641,
		161,
		true
	},
	shop_extendcommander_success = {
		322802,
		148,
		true
	},
	commander_skill_point_noengough = {
		322950,
		144,
		true
	},
	buildship_new_tip = {
		323094,
		160,
		true
	},
	buildship_heavy_tip = {
		323254,
		142,
		true
	},
	buildship_light_tip = {
		323396,
		154,
		true
	},
	buildship_special_tip = {
		323550,
		156,
		true
	},
	Normalbuild_URexchange_help = {
		323706,
		615,
		true
	},
	Normalbuild_URexchange_text1 = {
		324321,
		103,
		true
	},
	Normalbuild_URexchange_text2 = {
		324424,
		97,
		true
	},
	Normalbuild_URexchange_text3 = {
		324521,
		103,
		true
	},
	Normalbuild_URexchange_text4 = {
		324624,
		100,
		true
	},
	Normalbuild_URexchange_warning1 = {
		324724,
		128,
		true
	},
	Normalbuild_URexchange_warning3 = {
		324852,
		207,
		true
	},
	Normalbuild_URexchange_confirm = {
		325059,
		121,
		true
	},
	open_skill_pos = {
		325180,
		236,
		true
	},
	open_skill_pos_discount = {
		325416,
		239,
		true
	},
	event_recommend_fail = {
		325655,
		124,
		true
	},
	newplayer_help_tip = {
		325779,
		988,
		true
	},
	newplayer_notice_1 = {
		326767,
		125,
		true
	},
	newplayer_notice_2 = {
		326892,
		125,
		true
	},
	newplayer_notice_3 = {
		327017,
		117,
		true
	},
	newplayer_notice_4 = {
		327134,
		121,
		true
	},
	newplayer_notice_5 = {
		327255,
		119,
		true
	},
	newplayer_notice_6 = {
		327374,
		171,
		true
	},
	newplayer_notice_7 = {
		327545,
		124,
		true
	},
	newplayer_notice_8 = {
		327669,
		149,
		true
	},
	tec_catchup_1 = {
		327818,
		85,
		true
	},
	tec_catchup_2 = {
		327903,
		85,
		true
	},
	tec_catchup_3 = {
		327988,
		85,
		true
	},
	tec_catchup_4 = {
		328073,
		85,
		true
	},
	tec_catchup_5 = {
		328158,
		85,
		true
	},
	tec_notice = {
		328243,
		124,
		true
	},
	tec_notice_not_open_tip = {
		328367,
		141,
		true
	},
	apply_permission_camera_tip1 = {
		328508,
		181,
		true
	},
	apply_permission_camera_tip2 = {
		328689,
		187,
		true
	},
	apply_permission_camera_tip3 = {
		328876,
		177,
		true
	},
	apply_permission_record_audio_tip1 = {
		329053,
		163,
		true
	},
	apply_permission_record_audio_tip2 = {
		329216,
		197,
		true
	},
	apply_permission_record_audio_tip3 = {
		329413,
		183,
		true
	},
	nine_choose_one = {
		329596,
		269,
		true
	},
	help_commander_info = {
		329865,
		810,
		true
	},
	help_commander_play = {
		330675,
		810,
		true
	},
	help_commander_ability = {
		331485,
		813,
		true
	},
	story_skip_confirm = {
		332298,
		215,
		true
	},
	commander_ability_replace_warning = {
		332513,
		205,
		true
	},
	help_command_room = {
		332718,
		808,
		true
	},
	commander_build_rate_tip = {
		333526,
		154,
		true
	},
	help_activity_bossbattle = {
		333680,
		1040,
		true
	},
	commander_is_in_fleet_already = {
		334720,
		141,
		true
	},
	commander_material_is_in_fleet_tip = {
		334861,
		167,
		true
	},
	commander_main_pos = {
		335028,
		93,
		true
	},
	commander_assistant_pos = {
		335121,
		96,
		true
	},
	comander_repalce_tip = {
		335217,
		200,
		true
	},
	commander_lock_tip = {
		335417,
		121,
		true
	},
	commander_is_in_battle = {
		335538,
		125,
		true
	},
	commander_rename_warning = {
		335663,
		143,
		true
	},
	commander_rename_coldtime_tip = {
		335806,
		154,
		true
	},
	commander_rename_success_tip = {
		335960,
		115,
		true
	},
	amercian_notice_1 = {
		336075,
		170,
		true
	},
	amercian_notice_2 = {
		336245,
		131,
		true
	},
	amercian_notice_3 = {
		336376,
		104,
		true
	},
	amercian_notice_4 = {
		336480,
		92,
		true
	},
	amercian_notice_5 = {
		336572,
		112,
		true
	},
	amercian_notice_6 = {
		336684,
		222,
		true
	},
	ranking_word_1 = {
		336906,
		89,
		true
	},
	ranking_word_2 = {
		336995,
		93,
		true
	},
	ranking_word_3 = {
		337088,
		91,
		true
	},
	ranking_word_4 = {
		337179,
		93,
		true
	},
	ranking_word_5 = {
		337272,
		82,
		true
	},
	ranking_word_6 = {
		337354,
		91,
		true
	},
	ranking_word_7 = {
		337445,
		90,
		true
	},
	ranking_word_8 = {
		337535,
		82,
		true
	},
	ranking_word_9 = {
		337617,
		83,
		true
	},
	ranking_word_10 = {
		337700,
		94,
		true
	},
	spece_illegal_tip = {
		337794,
		99,
		true
	},
	utaware_warmup_notice = {
		337893,
		902,
		true
	},
	utaware_formal_notice = {
		338795,
		648,
		true
	},
	npc_learn_skill_tip = {
		339443,
		250,
		true
	},
	npc_upgrade_max_level = {
		339693,
		147,
		true
	},
	npc_propse_tip = {
		339840,
		113,
		true
	},
	npc_strength_tip = {
		339953,
		209,
		true
	},
	npc_breakout_tip = {
		340162,
		210,
		true
	},
	word_chuansong = {
		340372,
		95,
		true
	},
	npc_evaluation_tip = {
		340467,
		145,
		true
	},
	map_event_skip = {
		340612,
		90,
		true
	},
	map_event_stop_tip = {
		340702,
		163,
		true
	},
	map_event_stop_battle_tip = {
		340865,
		172,
		true
	},
	map_event_stop_battle_tip_2 = {
		341037,
		151,
		true
	},
	map_event_stop_story_tip = {
		341188,
		167,
		true
	},
	map_event_save_nekone = {
		341355,
		136,
		true
	},
	map_event_save_rurutie = {
		341491,
		139,
		true
	},
	map_event_memory_collected = {
		341630,
		152,
		true
	},
	map_event_save_kizuna = {
		341782,
		140,
		true
	},
	five_choose_one = {
		341922,
		201,
		true
	},
	ship_preference_common = {
		342123,
		107,
		true
	},
	draw_big_luck_1 = {
		342230,
		116,
		true
	},
	draw_big_luck_2 = {
		342346,
		127,
		true
	},
	draw_big_luck_3 = {
		342473,
		131,
		true
	},
	draw_medium_luck_1 = {
		342604,
		124,
		true
	},
	draw_medium_luck_2 = {
		342728,
		122,
		true
	},
	draw_medium_luck_3 = {
		342850,
		133,
		true
	},
	draw_little_luck_1 = {
		342983,
		128,
		true
	},
	draw_little_luck_2 = {
		343111,
		124,
		true
	},
	draw_little_luck_3 = {
		343235,
		134,
		true
	},
	ship_preference_non = {
		343369,
		106,
		true
	},
	school_title_dajiangtang = {
		343475,
		101,
		true
	},
	school_title_zhihuimiao = {
		343576,
		95,
		true
	},
	school_title_shitang = {
		343671,
		92,
		true
	},
	school_title_xiaomaibu = {
		343763,
		95,
		true
	},
	school_title_shangdian = {
		343858,
		94,
		true
	},
	school_title_xueyuan = {
		343952,
		98,
		true
	},
	school_title_shoucang = {
		344050,
		95,
		true
	},
	school_title_xiaoyouxiting = {
		344145,
		96,
		true
	},
	tag_level_fighting = {
		344241,
		93,
		true
	},
	tag_level_oni = {
		344334,
		89,
		true
	},
	tag_level_bomb = {
		344423,
		90,
		true
	},
	ui_word_levelui2_inevent = {
		344513,
		97,
		true
	},
	exit_backyard_exp_display = {
		344610,
		125,
		true
	},
	help_monopoly = {
		344735,
		1634,
		true
	},
	md5_error = {
		346369,
		120,
		true
	},
	world_boss_help = {
		346489,
		4737,
		true
	},
	world_boss_tip = {
		351226,
		193,
		true
	},
	world_boss_award_limit = {
		351419,
		157,
		true
	},
	backyard_is_loading = {
		351576,
		104,
		true
	},
	levelScene_loop_help_tip = {
		351680,
		2782,
		true
	},
	no_airspace_competition = {
		354462,
		104,
		true
	},
	air_supremacy_value = {
		354566,
		101,
		true
	},
	read_the_user_agreement = {
		354667,
		146,
		true
	},
	award_max_warning = {
		354813,
		175,
		true
	},
	sub_item_warning = {
		354988,
		140,
		true
	},
	select_award_warning = {
		355128,
		126,
		true
	},
	no_item_selected_tip = {
		355254,
		119,
		true
	},
	backyard_traning_tip = {
		355373,
		160,
		true
	},
	backyard_rest_tip = {
		355533,
		122,
		true
	},
	backyard_class_tip = {
		355655,
		122,
		true
	},
	medal_notice_1 = {
		355777,
		95,
		true
	},
	medal_notice_2 = {
		355872,
		86,
		true
	},
	medal_help_tip = {
		355958,
		1522,
		true
	},
	trophy_achieved = {
		357480,
		94,
		true
	},
	text_shop = {
		357574,
		77,
		true
	},
	text_confirm = {
		357651,
		83,
		true
	},
	text_cancel = {
		357734,
		81,
		true
	},
	text_cancel_fight = {
		357815,
		93,
		true
	},
	text_goon_fight = {
		357908,
		87,
		true
	},
	text_exit = {
		357995,
		77,
		true
	},
	text_clear = {
		358072,
		79,
		true
	},
	text_apply = {
		358151,
		83,
		true
	},
	text_buy = {
		358234,
		75,
		true
	},
	text_forward = {
		358309,
		78,
		true
	},
	text_prepage = {
		358387,
		80,
		true
	},
	text_nextpage = {
		358467,
		81,
		true
	},
	text_exchange = {
		358548,
		85,
		true
	},
	text_retreat = {
		358633,
		83,
		true
	},
	text_goto = {
		358716,
		80,
		true
	},
	level_scene_title_word_1 = {
		358796,
		100,
		true
	},
	level_scene_title_word_2 = {
		358896,
		108,
		true
	},
	level_scene_title_word_3 = {
		359004,
		100,
		true
	},
	level_scene_title_word_4 = {
		359104,
		97,
		true
	},
	level_scene_title_word_5 = {
		359201,
		97,
		true
	},
	ambush_display_0 = {
		359298,
		89,
		true
	},
	ambush_display_1 = {
		359387,
		84,
		true
	},
	ambush_display_2 = {
		359471,
		85,
		true
	},
	ambush_display_3 = {
		359556,
		83,
		true
	},
	ambush_display_4 = {
		359639,
		86,
		true
	},
	ambush_display_5 = {
		359725,
		84,
		true
	},
	ambush_display_6 = {
		359809,
		86,
		true
	},
	black_white_grid_notice = {
		359895,
		1416,
		true
	},
	black_white_grid_reset = {
		361311,
		104,
		true
	},
	black_white_grid_switch_tip = {
		361415,
		122,
		true
	},
	no_way_to_escape = {
		361537,
		93,
		true
	},
	word_attr_ac = {
		361630,
		92,
		true
	},
	help_battle_ac = {
		361722,
		2193,
		true
	},
	help_attribute_dodge_limit = {
		363915,
		388,
		true
	},
	refuse_friend = {
		364303,
		105,
		true
	},
	refuse_and_add_into_bl = {
		364408,
		108,
		true
	},
	tech_simulate_closed = {
		364516,
		141,
		true
	},
	tech_simulate_quit = {
		364657,
		126,
		true
	},
	technology_uplevel_error_no_res = {
		364783,
		244,
		true
	},
	help_technologytree = {
		365027,
		2458,
		true
	},
	tech_change_version_mark = {
		367485,
		108,
		true
	},
	technology_uplevel_error_studying = {
		367593,
		196,
		true
	},
	fate_attr_word = {
		367789,
		105,
		true
	},
	fate_phase_word = {
		367894,
		98,
		true
	},
	blueprint_simulation_confirm = {
		367992,
		245,
		true
	},
	blueprint_simulation_confirm_19901 = {
		368237,
		416,
		true
	},
	blueprint_simulation_confirm_19902 = {
		368653,
		397,
		true
	},
	blueprint_simulation_confirm_39903 = {
		369050,
		398,
		true
	},
	blueprint_simulation_confirm_39904 = {
		369448,
		415,
		true
	},
	blueprint_simulation_confirm_49902 = {
		369863,
		413,
		true
	},
	blueprint_simulation_confirm_99901 = {
		370276,
		412,
		true
	},
	blueprint_simulation_confirm_29903 = {
		370688,
		374,
		true
	},
	blueprint_simulation_confirm_29904 = {
		371062,
		381,
		true
	},
	blueprint_simulation_confirm_49903 = {
		371443,
		374,
		true
	},
	blueprint_simulation_confirm_49904 = {
		371817,
		384,
		true
	},
	blueprint_simulation_confirm_89902 = {
		372201,
		380,
		true
	},
	blueprint_simulation_confirm_19903 = {
		372581,
		406,
		true
	},
	blueprint_simulation_confirm_39905 = {
		372987,
		349,
		true
	},
	blueprint_simulation_confirm_49905 = {
		373336,
		409,
		true
	},
	blueprint_simulation_confirm_49906 = {
		373745,
		339,
		true
	},
	blueprint_simulation_confirm_69901 = {
		374084,
		421,
		true
	},
	blueprint_simulation_confirm_29905 = {
		374505,
		398,
		true
	},
	blueprint_simulation_confirm_49907 = {
		374903,
		406,
		true
	},
	blueprint_simulation_confirm_59901 = {
		375309,
		396,
		true
	},
	blueprint_simulation_confirm_79901 = {
		375705,
		347,
		true
	},
	blueprint_simulation_confirm_89903 = {
		376052,
		416,
		true
	},
	blueprint_simulation_confirm_19904 = {
		376468,
		423,
		true
	},
	blueprint_simulation_confirm_39906 = {
		376891,
		430,
		true
	},
	blueprint_simulation_confirm_49908 = {
		377321,
		441,
		true
	},
	blueprint_simulation_confirm_49909 = {
		377762,
		440,
		true
	},
	blueprint_simulation_confirm_99902 = {
		378202,
		431,
		true
	},
	electrotherapy_wanning = {
		378633,
		125,
		true
	},
	siren_chase_warning = {
		378758,
		104,
		true
	},
	memorybook_get_award_tip = {
		378862,
		173,
		true
	},
	memorybook_notice = {
		379035,
		548,
		true
	},
	word_votes = {
		379583,
		79,
		true
	},
	number_0 = {
		379662,
		73,
		true
	},
	intimacy_desc_propose_vertical = {
		379735,
		340,
		true
	},
	without_selected_ship = {
		380075,
		101,
		true
	},
	index_all = {
		380176,
		76,
		true
	},
	index_fleetfront = {
		380252,
		89,
		true
	},
	index_fleetrear = {
		380341,
		84,
		true
	},
	index_shipType_quZhu = {
		380425,
		86,
		true
	},
	index_shipType_qinXun = {
		380511,
		87,
		true
	},
	index_shipType_zhongXun = {
		380598,
		89,
		true
	},
	index_shipType_zhanLie = {
		380687,
		88,
		true
	},
	index_shipType_hangMu = {
		380775,
		87,
		true
	},
	index_shipType_weiXiu = {
		380862,
		87,
		true
	},
	index_shipType_qianTing = {
		380949,
		89,
		true
	},
	index_other = {
		381038,
		79,
		true
	},
	index_rare2 = {
		381117,
		81,
		true
	},
	index_rare3 = {
		381198,
		79,
		true
	},
	index_rare4 = {
		381277,
		80,
		true
	},
	index_rare5 = {
		381357,
		85,
		true
	},
	index_rare6 = {
		381442,
		80,
		true
	},
	warning_mail_max_1 = {
		381522,
		189,
		true
	},
	warning_mail_max_2 = {
		381711,
		103,
		true
	},
	return_award_bind_success = {
		381814,
		110,
		true
	},
	return_award_bind_erro = {
		381924,
		106,
		true
	},
	rename_commander_erro = {
		382030,
		111,
		true
	},
	change_display_medal_success = {
		382141,
		123,
		true
	},
	limit_skin_time_day = {
		382264,
		103,
		true
	},
	limit_skin_time_day_min = {
		382367,
		108,
		true
	},
	limit_skin_time_min = {
		382475,
		106,
		true
	},
	limit_skin_time_overtime = {
		382581,
		136,
		true
	},
	limit_skin_time_before_maintenance = {
		382717,
		110,
		true
	},
	award_window_pt_title = {
		382827,
		101,
		true
	},
	return_have_participated_in_act = {
		382928,
		140,
		true
	},
	input_returner_code = {
		383068,
		92,
		true
	},
	dress_up_success = {
		383160,
		115,
		true
	},
	already_have_the_skin = {
		383275,
		111,
		true
	},
	exchange_limit_skin_tip = {
		383386,
		188,
		true
	},
	returner_help = {
		383574,
		1939,
		true
	},
	attire_time_stamp = {
		385513,
		90,
		true
	},
	pray_build_select_ship_instruction = {
		385603,
		117,
		true
	},
	warning_pray_build_pool = {
		385720,
		212,
		true
	},
	error_pray_select_ship_max = {
		385932,
		113,
		true
	},
	tip_pray_build_pool_success = {
		386045,
		118,
		true
	},
	tip_pray_build_pool_fail = {
		386163,
		116,
		true
	},
	pray_build_help = {
		386279,
		2290,
		true
	},
	pray_build_UR_warning = {
		388569,
		161,
		true
	},
	bismarck_award_tip = {
		388730,
		118,
		true
	},
	bismarck_chapter_desc = {
		388848,
		171,
		true
	},
	returner_push_success = {
		389019,
		115,
		true
	},
	returner_max_count = {
		389134,
		126,
		true
	},
	returner_push_tip = {
		389260,
		240,
		true
	},
	returner_match_tip = {
		389500,
		232,
		true
	},
	return_lock_tip = {
		389732,
		134,
		true
	},
	challenge_help = {
		389866,
		1901,
		true
	},
	challenge_casual_reset = {
		391767,
		138,
		true
	},
	challenge_infinite_reset = {
		391905,
		153,
		true
	},
	challenge_normal_reset = {
		392058,
		132,
		true
	},
	challenge_casual_click_switch = {
		392190,
		184,
		true
	},
	challenge_infinite_click_switch = {
		392374,
		189,
		true
	},
	challenge_season_update = {
		392563,
		126,
		true
	},
	challenge_season_update_casual_clear = {
		392689,
		240,
		true
	},
	challenge_season_update_infinite_clear = {
		392929,
		245,
		true
	},
	challenge_season_update_casual_switch = {
		393174,
		274,
		true
	},
	challenge_season_update_infinite_switch = {
		393448,
		286,
		true
	},
	challenge_combat_score = {
		393734,
		101,
		true
	},
	challenge_share_progress = {
		393835,
		107,
		true
	},
	challenge_share = {
		393942,
		85,
		true
	},
	challenge_expire_warn = {
		394027,
		170,
		true
	},
	challenge_normal_tip = {
		394197,
		146,
		true
	},
	challenge_unlimited_tip = {
		394343,
		151,
		true
	},
	commander_prefab_rename_success = {
		394494,
		118,
		true
	},
	commander_prefab_name = {
		394612,
		92,
		true
	},
	commander_prefab_rename_time = {
		394704,
		145,
		true
	},
	commander_build_solt_deficiency = {
		394849,
		159,
		true
	},
	commander_select_box_tip = {
		395008,
		172,
		true
	},
	challenge_end_tip = {
		395180,
		107,
		true
	},
	pass_times = {
		395287,
		87,
		true
	},
	list_empty_tip_billboardui = {
		395374,
		116,
		true
	},
	list_empty_tip_equipmentdesignui = {
		395490,
		126,
		true
	},
	list_empty_tip_storehouseui_equip = {
		395616,
		121,
		true
	},
	list_empty_tip_storehouseui_item = {
		395737,
		125,
		true
	},
	list_empty_tip_eventui = {
		395862,
		118,
		true
	},
	list_empty_tip_guildrequestui = {
		395980,
		123,
		true
	},
	list_empty_tip_joinguildui = {
		396103,
		137,
		true
	},
	list_empty_tip_friendui = {
		396240,
		114,
		true
	},
	list_empty_tip_friendui_search = {
		396354,
		145,
		true
	},
	list_empty_tip_friendui_request = {
		396499,
		132,
		true
	},
	list_empty_tip_friendui_black = {
		396631,
		136,
		true
	},
	list_empty_tip_dockyardui = {
		396767,
		135,
		true
	},
	list_empty_tip_taskscene = {
		396902,
		120,
		true
	},
	empty_tip_mailboxui = {
		397022,
		107,
		true
	},
	words_settings_unlock_ship = {
		397129,
		105,
		true
	},
	words_settings_resolve_equip = {
		397234,
		107,
		true
	},
	words_settings_unlock_commander = {
		397341,
		116,
		true
	},
	words_settings_create_inherit = {
		397457,
		109,
		true
	},
	tips_fail_secondarypwd_much_times = {
		397566,
		185,
		true
	},
	words_desc_unlock = {
		397751,
		131,
		true
	},
	words_desc_resolve_equip = {
		397882,
		138,
		true
	},
	words_desc_create_inherit = {
		398020,
		105,
		true
	},
	words_desc_close_password = {
		398125,
		123,
		true
	},
	words_desc_change_settings = {
		398248,
		137,
		true
	},
	words_set_password = {
		398385,
		107,
		true
	},
	words_information = {
		398492,
		85,
		true
	},
	Word_Ship_Exp_Buff = {
		398577,
		92,
		true
	},
	secondarypassword_incorrectpwd_error = {
		398669,
		193,
		true
	},
	secondary_password_help = {
		398862,
		1501,
		true
	},
	comic_help = {
		400363,
		365,
		true
	},
	secondarypassword_illegal_tip = {
		400728,
		135,
		true
	},
	pt_cosume = {
		400863,
		80,
		true
	},
	secondarypassword_confirm_tips = {
		400943,
		178,
		true
	},
	help_tempesteve = {
		401121,
		800,
		true
	},
	word_rest_times = {
		401921,
		118,
		true
	},
	common_buy_gold_success = {
		402039,
		144,
		true
	},
	harbour_bomb_tip = {
		402183,
		110,
		true
	},
	submarine_approach = {
		402293,
		101,
		true
	},
	submarine_approach_desc = {
		402394,
		130,
		true
	},
	desc_quick_play = {
		402524,
		91,
		true
	},
	text_win_condition = {
		402615,
		97,
		true
	},
	text_lose_condition = {
		402712,
		99,
		true
	},
	text_rest_HP = {
		402811,
		93,
		true
	},
	desc_defense_reward = {
		402904,
		152,
		true
	},
	desc_base_hp = {
		403056,
		99,
		true
	},
	map_event_open = {
		403155,
		105,
		true
	},
	word_reward = {
		403260,
		82,
		true
	},
	tips_dispense_completed = {
		403342,
		103,
		true
	},
	tips_firework_completed = {
		403445,
		116,
		true
	},
	help_summer_feast = {
		403561,
		1164,
		true
	},
	help_firework_produce = {
		404725,
		668,
		true
	},
	help_firework = {
		405393,
		1685,
		true
	},
	help_summer_shrine = {
		407078,
		1066,
		true
	},
	help_summer_food = {
		408144,
		1622,
		true
	},
	help_summer_shooting = {
		409766,
		1075,
		true
	},
	help_summer_stamp = {
		410841,
		341,
		true
	},
	tips_summergame_exit = {
		411182,
		198,
		true
	},
	tips_shrine_buff = {
		411380,
		121,
		true
	},
	tips_shrine_nobuff = {
		411501,
		175,
		true
	},
	paint_hide_other_obj_tip = {
		411676,
		111,
		true
	},
	help_vote = {
		411787,
		6103,
		true
	},
	tips_firework_exit = {
		417890,
		157,
		true
	},
	result_firework_produce = {
		418047,
		148,
		true
	},
	tag_level_narrative = {
		418195,
		88,
		true
	},
	vote_get_book = {
		418283,
		115,
		true
	},
	vote_book_is_over = {
		418398,
		115,
		true
	},
	vote_fame_tip = {
		418513,
		167,
		true
	},
	word_maintain = {
		418680,
		94,
		true
	},
	name_zhanliejahe = {
		418774,
		97,
		true
	},
	change_skin_secretary_ship_success = {
		418871,
		124,
		true
	},
	change_skin_secretary_ship = {
		418995,
		103,
		true
	},
	word_billboard = {
		419098,
		86,
		true
	},
	word_easy = {
		419184,
		77,
		true
	},
	word_normal_junhe = {
		419261,
		87,
		true
	},
	word_hard = {
		419348,
		77,
		true
	},
	word_special_challenge_ticket = {
		419425,
		105,
		true
	},
	tip_exchange_ticket = {
		419530,
		177,
		true
	},
	dont_remind = {
		419707,
		89,
		true
	},
	worldbossex_help = {
		419796,
		909,
		true
	},
	ship_formationUI_fleetName_easy = {
		420705,
		99,
		true
	},
	ship_formationUI_fleetName_normal = {
		420804,
		103,
		true
	},
	ship_formationUI_fleetName_hard = {
		420907,
		99,
		true
	},
	ship_formationUI_fleetName_extra = {
		421006,
		98,
		true
	},
	ship_formationUI_fleetName_easy_ss = {
		421104,
		114,
		true
	},
	ship_formationUI_fleetName_normal_ss = {
		421218,
		118,
		true
	},
	ship_formationUI_fleetName_hard_ss = {
		421336,
		114,
		true
	},
	ship_formationUI_fleetName_extra_ss = {
		421450,
		113,
		true
	},
	text_consume = {
		421563,
		80,
		true
	},
	text_inconsume = {
		421643,
		80,
		true
	},
	pt_ship_now = {
		421723,
		93,
		true
	},
	pt_ship_goal = {
		421816,
		81,
		true
	},
	option_desc1 = {
		421897,
		165,
		true
	},
	option_desc2 = {
		422062,
		158,
		true
	},
	option_desc3 = {
		422220,
		167,
		true
	},
	option_desc4 = {
		422387,
		202,
		true
	},
	option_desc5 = {
		422589,
		140,
		true
	},
	option_desc6 = {
		422729,
		155,
		true
	},
	option_desc10 = {
		422884,
		143,
		true
	},
	option_desc11 = {
		423027,
		1748,
		true
	},
	music_collection = {
		424775,
		859,
		true
	},
	music_main = {
		425634,
		1073,
		true
	},
	music_juus = {
		426707,
		574,
		true
	},
	doa_collection = {
		427281,
		846,
		true
	},
	ins_word_day = {
		428127,
		88,
		true
	},
	ins_word_hour = {
		428215,
		89,
		true
	},
	ins_word_minu = {
		428304,
		91,
		true
	},
	ins_word_like = {
		428395,
		85,
		true
	},
	ins_click_like_success = {
		428480,
		106,
		true
	},
	ins_push_comment_success = {
		428586,
		120,
		true
	},
	skinshop_live2d_fliter_failed = {
		428706,
		146,
		true
	},
	help_music_game = {
		428852,
		1355,
		true
	},
	restart_music_game = {
		430207,
		130,
		true
	},
	reselect_music_game = {
		430337,
		144,
		true
	},
	hololive_goodmorning = {
		430481,
		852,
		true
	},
	hololive_lianliankan = {
		431333,
		1410,
		true
	},
	hololive_dalaozhang = {
		432743,
		764,
		true
	},
	hololive_dashenling = {
		433507,
		1927,
		true
	},
	pocky_jiujiu = {
		435434,
		94,
		true
	},
	pocky_jiujiu_desc = {
		435528,
		118,
		true
	},
	pocky_help = {
		435646,
		697,
		true
	},
	secretary_help = {
		436343,
		2209,
		true
	},
	secretary_unlock2 = {
		438552,
		108,
		true
	},
	secretary_unlock3 = {
		438660,
		108,
		true
	},
	secretary_unlock4 = {
		438768,
		108,
		true
	},
	secretary_unlock5 = {
		438876,
		109,
		true
	},
	secretary_closed = {
		438985,
		88,
		true
	},
	confirm_unlock = {
		439073,
		113,
		true
	},
	secretary_pos_save = {
		439186,
		143,
		true
	},
	secretary_pos_save_success = {
		439329,
		105,
		true
	},
	collection_help = {
		439434,
		346,
		true
	},
	juese_tiyan = {
		439780,
		239,
		true
	},
	resolve_amount_prefix = {
		440019,
		104,
		true
	},
	compose_amount_prefix = {
		440123,
		100,
		true
	},
	help_sub_limits = {
		440223,
		92,
		true
	},
	help_sub_display = {
		440315,
		104,
		true
	},
	confirm_unlock_ship_main = {
		440419,
		151,
		true
	},
	msgbox_text_confirm = {
		440570,
		90,
		true
	},
	msgbox_text_shop = {
		440660,
		85,
		true
	},
	msgbox_text_cancel = {
		440745,
		88,
		true
	},
	msgbox_text_cancel_g = {
		440833,
		90,
		true
	},
	msgbox_text_cancel_fight = {
		440923,
		100,
		true
	},
	msgbox_text_goon_fight = {
		441023,
		94,
		true
	},
	msgbox_text_exit = {
		441117,
		84,
		true
	},
	msgbox_text_clear = {
		441201,
		86,
		true
	},
	msgbox_text_apply = {
		441287,
		85,
		true
	},
	msgbox_text_buy = {
		441372,
		87,
		true
	},
	msgbox_text_noPos_buy = {
		441459,
		91,
		true
	},
	msgbox_text_noPos_clear = {
		441550,
		91,
		true
	},
	msgbox_text_noPos_intensify = {
		441641,
		98,
		true
	},
	msgbox_text_forward = {
		441739,
		85,
		true
	},
	msgbox_text_iknow = {
		441824,
		87,
		true
	},
	msgbox_text_prepage = {
		441911,
		87,
		true
	},
	msgbox_text_nextpage = {
		441998,
		88,
		true
	},
	msgbox_text_exchange = {
		442086,
		92,
		true
	},
	msgbox_text_retreat = {
		442178,
		90,
		true
	},
	msgbox_text_go = {
		442268,
		80,
		true
	},
	msgbox_text_consume = {
		442348,
		87,
		true
	},
	msgbox_text_inconsume = {
		442435,
		87,
		true
	},
	msgbox_text_unlock = {
		442522,
		88,
		true
	},
	msgbox_text_save = {
		442610,
		85,
		true
	},
	msgbox_text_replace = {
		442695,
		88,
		true
	},
	msgbox_text_unload = {
		442783,
		89,
		true
	},
	msgbox_text_modify = {
		442872,
		89,
		true
	},
	msgbox_text_breakthrough = {
		442961,
		93,
		true
	},
	msgbox_text_equipdetail = {
		443054,
		94,
		true
	},
	msgbox_text_use = {
		443148,
		82,
		true
	},
	common_flag_ship = {
		443230,
		89,
		true
	},
	fenjie_lantu_tip = {
		443319,
		188,
		true
	},
	msgbox_text_analyse = {
		443507,
		90,
		true
	},
	fragresolve_empty_tip = {
		443597,
		151,
		true
	},
	confirm_unlock_lv = {
		443748,
		121,
		true
	},
	shops_rest_day = {
		443869,
		98,
		true
	},
	title_limit_time = {
		443967,
		91,
		true
	},
	seven_choose_one = {
		444058,
		224,
		true
	},
	help_newyear_feast = {
		444282,
		1386,
		true
	},
	help_newyear_shrine = {
		445668,
		1243,
		true
	},
	help_newyear_stamp = {
		446911,
		238,
		true
	},
	pt_reconfirm = {
		447149,
		124,
		true
	},
	qte_game_help = {
		447273,
		340,
		true
	},
	word_equipskin_type = {
		447613,
		88,
		true
	},
	word_equipskin_all = {
		447701,
		86,
		true
	},
	word_equipskin_cannon = {
		447787,
		95,
		true
	},
	word_equipskin_tarpedo = {
		447882,
		96,
		true
	},
	word_equipskin_aircraft = {
		447978,
		96,
		true
	},
	word_equipskin_aux = {
		448074,
		86,
		true
	},
	msgbox_repair = {
		448160,
		91,
		true
	},
	msgbox_repair_l2d = {
		448251,
		95,
		true
	},
	msgbox_repair_painting = {
		448346,
		105,
		true
	},
	word_no_cache = {
		448451,
		107,
		true
	},
	pile_game_notice = {
		448558,
		993,
		true
	},
	help_chunjie_stamp = {
		449551,
		677,
		true
	},
	help_chunjie_feast = {
		450228,
		670,
		true
	},
	help_chunjie_jiulou = {
		450898,
		848,
		true
	},
	special_animal1 = {
		451746,
		227,
		true
	},
	special_animal2 = {
		451973,
		287,
		true
	},
	special_animal3 = {
		452260,
		236,
		true
	},
	special_animal4 = {
		452496,
		256,
		true
	},
	special_animal5 = {
		452752,
		251,
		true
	},
	special_animal6 = {
		453003,
		272,
		true
	},
	special_animal7 = {
		453275,
		275,
		true
	},
	bulin_help = {
		453550,
		403,
		true
	},
	super_bulin = {
		453953,
		120,
		true
	},
	super_bulin_tip = {
		454073,
		110,
		true
	},
	bulin_tip1 = {
		454183,
		101,
		true
	},
	bulin_tip2 = {
		454284,
		117,
		true
	},
	bulin_tip3 = {
		454401,
		101,
		true
	},
	bulin_tip4 = {
		454502,
		108,
		true
	},
	bulin_tip5 = {
		454610,
		101,
		true
	},
	bulin_tip6 = {
		454711,
		108,
		true
	},
	bulin_tip7 = {
		454819,
		101,
		true
	},
	bulin_tip8 = {
		454920,
		126,
		true
	},
	bulin_tip9 = {
		455046,
		122,
		true
	},
	bulin_tip_other1 = {
		455168,
		192,
		true
	},
	bulin_tip_other2 = {
		455360,
		109,
		true
	},
	bulin_tip_other3 = {
		455469,
		122,
		true
	},
	monopoly_left_count = {
		455591,
		89,
		true
	},
	help_chunjie_monopoly = {
		455680,
		1083,
		true
	},
	monoply_drop_ship_step = {
		456763,
		157,
		true
	},
	lanternRiddles_wait_for_reanswer = {
		456920,
		144,
		true
	},
	lanternRiddles_answer_is_wrong = {
		457064,
		118,
		true
	},
	lanternRiddles_answer_is_right = {
		457182,
		110,
		true
	},
	lanternRiddles_gametip = {
		457292,
		607,
		true
	},
	LanternRiddle_wait_time_tip = {
		457899,
		105,
		true
	},
	LinkLinkGame_BestTime = {
		458004,
		92,
		true
	},
	LinkLinkGame_CurTime = {
		458096,
		89,
		true
	},
	sort_attribute = {
		458185,
		82,
		true
	},
	sort_intimacy = {
		458267,
		85,
		true
	},
	index_skin = {
		458352,
		82,
		true
	},
	index_reform = {
		458434,
		94,
		true
	},
	index_reform_cw = {
		458528,
		97,
		true
	},
	index_strengthen = {
		458625,
		91,
		true
	},
	index_special = {
		458716,
		84,
		true
	},
	index_propose_skin = {
		458800,
		96,
		true
	},
	index_not_obtained = {
		458896,
		94,
		true
	},
	index_no_limit = {
		458990,
		86,
		true
	},
	index_awakening = {
		459076,
		91,
		true
	},
	index_not_lvmax = {
		459167,
		90,
		true
	},
	index_spweapon = {
		459257,
		91,
		true
	},
	index_marry = {
		459348,
		81,
		true
	},
	decodegame_gametip = {
		459429,
		2081,
		true
	},
	indexsort_sort = {
		461510,
		82,
		true
	},
	indexsort_index = {
		461592,
		84,
		true
	},
	indexsort_camp = {
		461676,
		85,
		true
	},
	indexsort_type = {
		461761,
		82,
		true
	},
	indexsort_rarity = {
		461843,
		86,
		true
	},
	indexsort_extraindex = {
		461929,
		89,
		true
	},
	indexsort_label = {
		462018,
		83,
		true
	},
	indexsort_sorteng = {
		462101,
		85,
		true
	},
	indexsort_indexeng = {
		462186,
		87,
		true
	},
	indexsort_campeng = {
		462273,
		88,
		true
	},
	indexsort_rarityeng = {
		462361,
		89,
		true
	},
	indexsort_typeeng = {
		462450,
		85,
		true
	},
	indexsort_labeleng = {
		462535,
		86,
		true
	},
	fightfail_up = {
		462621,
		139,
		true
	},
	fightfail_equip = {
		462760,
		141,
		true
	},
	fight_strengthen = {
		462901,
		158,
		true
	},
	fightfail_noequip = {
		463059,
		107,
		true
	},
	fightfail_choiceequip = {
		463166,
		136,
		true
	},
	fightfail_choicestrengthen = {
		463302,
		151,
		true
	},
	sofmap_attention = {
		463453,
		258,
		true
	},
	sofmapsd_1 = {
		463711,
		153,
		true
	},
	sofmapsd_2 = {
		463864,
		132,
		true
	},
	sofmapsd_3 = {
		463996,
		110,
		true
	},
	sofmapsd_4 = {
		464106,
		133,
		true
	},
	inform_level_limit = {
		464239,
		138,
		true
	},
	["3match_tip"] = {
		464377,
		381,
		true
	},
	retire_selectzero = {
		464758,
		138,
		true
	},
	retire_marry_skin = {
		464896,
		106,
		true
	},
	undermist_tip = {
		465002,
		143,
		true
	},
	retire_1 = {
		465145,
		254,
		true
	},
	retire_2 = {
		465399,
		256,
		true
	},
	retire_3 = {
		465655,
		96,
		true
	},
	retire_rarity = {
		465751,
		97,
		true
	},
	retire_title = {
		465848,
		96,
		true
	},
	res_unlock_tip = {
		465944,
		120,
		true
	},
	res_wifi_tip = {
		466064,
		206,
		true
	},
	res_downloading = {
		466270,
		90,
		true
	},
	res_pic_new_tip = {
		466360,
		145,
		true
	},
	res_music_no_pre_tip = {
		466505,
		95,
		true
	},
	res_music_no_next_tip = {
		466600,
		95,
		true
	},
	res_music_new_tip = {
		466695,
		106,
		true
	},
	apple_link_title = {
		466801,
		101,
		true
	},
	retire_setting_help = {
		466902,
		863,
		true
	},
	activity_shop_exchange_count = {
		467765,
		98,
		true
	},
	shops_msgbox_exchange_count = {
		467863,
		107,
		true
	},
	shops_msgbox_output = {
		467970,
		92,
		true
	},
	shop_word_exchange = {
		468062,
		89,
		true
	},
	shop_word_cancel = {
		468151,
		86,
		true
	},
	title_item_ways = {
		468237,
		152,
		true
	},
	item_lack_title = {
		468389,
		152,
		true
	},
	oil_buy_tip_2 = {
		468541,
		386,
		true
	},
	target_chapter_is_lock = {
		468927,
		126,
		true
	},
	ship_book = {
		469053,
		104,
		true
	},
	month_sign_resign = {
		469157,
		87,
		true
	},
	collect_tip = {
		469244,
		139,
		true
	},
	collect_tip2 = {
		469383,
		140,
		true
	},
	word_weakness = {
		469523,
		88,
		true
	},
	special_operation_tip1 = {
		469611,
		111,
		true
	},
	special_operation_tip2 = {
		469722,
		111,
		true
	},
	area_lock = {
		469833,
		106,
		true
	},
	equipment_upgrade_equipped_tag = {
		469939,
		105,
		true
	},
	equipment_upgrade_spare_tag = {
		470044,
		102,
		true
	},
	equipment_upgrade_help = {
		470146,
		1285,
		true
	},
	equipment_upgrade_title = {
		471431,
		97,
		true
	},
	equipment_upgrade_coin_consume = {
		471528,
		98,
		true
	},
	equipment_upgrade_quick_interface_source_chosen = {
		471626,
		123,
		true
	},
	equipment_upgrade_quick_interface_materials_consume = {
		471749,
		121,
		true
	},
	equipment_upgrade_feedback_lack_of_materials = {
		471870,
		141,
		true
	},
	equipment_upgrade_feedback_equipment_consume = {
		472011,
		211,
		true
	},
	equipment_upgrade_feedback_equipment_can_be_produced = {
		472222,
		168,
		true
	},
	equipment_upgrade_quick_interface_feedback_source_chosen = {
		472390,
		133,
		true
	},
	equipment_upgrade_feedback_lack_of_equipment = {
		472523,
		127,
		true
	},
	equipment_upgrade_equipped_unavailable = {
		472650,
		211,
		true
	},
	equipment_upgrade_initial_node = {
		472861,
		134,
		true
	},
	equipment_upgrade_feedback_compose_tip = {
		472995,
		192,
		true
	},
	discount_coupon_tip = {
		473187,
		193,
		true
	},
	pizzahut_help = {
		473380,
		738,
		true
	},
	towerclimbing_gametip = {
		474118,
		645,
		true
	},
	qingdianguangchang_help = {
		474763,
		660,
		true
	},
	building_tip = {
		475423,
		177,
		true
	},
	building_upgrade_tip = {
		475600,
		155,
		true
	},
	msgbox_text_upgrade = {
		475755,
		90,
		true
	},
	towerclimbing_sign_help = {
		475845,
		793,
		true
	},
	building_complete_tip = {
		476638,
		102,
		true
	},
	backyard_theme_refresh_time_tip = {
		476740,
		124,
		true
	},
	backyard_theme_total_print = {
		476864,
		95,
		true
	},
	backyard_theme_shop_title = {
		476959,
		105,
		true
	},
	backyard_theme_mine_title = {
		477064,
		99,
		true
	},
	backyard_theme_collection_title = {
		477163,
		107,
		true
	},
	backyard_theme_ban_upload_tip = {
		477270,
		214,
		true
	},
	backyard_theme_upload_over_maxcnt = {
		477484,
		194,
		true
	},
	backyard_theme_apply_tip1 = {
		477678,
		208,
		true
	},
	backyard_theme_word_buy = {
		477886,
		90,
		true
	},
	backyard_theme_word_apply = {
		477976,
		94,
		true
	},
	backyard_theme_apply_success = {
		478070,
		105,
		true
	},
	backyard_theme_unload_success = {
		478175,
		109,
		true
	},
	backyard_theme_upload_success = {
		478284,
		101,
		true
	},
	backyard_theme_delete_success = {
		478385,
		100,
		true
	},
	backyard_theme_apply_tip2 = {
		478485,
		138,
		true
	},
	backyard_theme_upload_cnt = {
		478623,
		113,
		true
	},
	backyard_theme_upload_time = {
		478736,
		102,
		true
	},
	backyard_theme_word_like = {
		478838,
		93,
		true
	},
	backyard_theme_word_collection = {
		478931,
		103,
		true
	},
	backyard_theme_cancel_collection = {
		479034,
		138,
		true
	},
	backyard_theme_inform_them = {
		479172,
		105,
		true
	},
	open_backyard_theme_template_tip = {
		479277,
		143,
		true
	},
	backyard_theme_cancel_template_upload_tip = {
		479420,
		249,
		true
	},
	backyard_theme_delete_themplate_tip = {
		479669,
		228,
		true
	},
	backyard_theme_template_be_delete_tip = {
		479897,
		140,
		true
	},
	backyard_theme_template_collection_cnt_max = {
		480037,
		143,
		true
	},
	backyard_theme_template_collection_cnt = {
		480180,
		120,
		true
	},
	words_visit_backyard_toggle = {
		480300,
		124,
		true
	},
	words_show_friend_backyardship_toggle = {
		480424,
		154,
		true
	},
	words_show_my_backyardship_toggle = {
		480578,
		154,
		true
	},
	option_desc7 = {
		480732,
		133,
		true
	},
	option_desc8 = {
		480865,
		147,
		true
	},
	option_desc9 = {
		481012,
		174,
		true
	},
	backyard_unopen = {
		481186,
		108,
		true
	},
	backyard_shop_refresh_frequently = {
		481294,
		157,
		true
	},
	word_random = {
		481451,
		81,
		true
	},
	word_hot = {
		481532,
		75,
		true
	},
	word_new = {
		481607,
		75,
		true
	},
	backyard_decoration_theme_template_delete_tip = {
		481682,
		210,
		true
	},
	backyard_not_found_theme_template = {
		481892,
		128,
		true
	},
	backyard_apply_theme_template_erro = {
		482020,
		122,
		true
	},
	backyard_theme_template_list_is_empty = {
		482142,
		121,
		true
	},
	BackYard_collection_be_delete_tip = {
		482263,
		181,
		true
	},
	help_monopoly_car = {
		482444,
		1056,
		true
	},
	help_monopoly_car_2 = {
		483500,
		1125,
		true
	},
	help_monopoly_3th = {
		484625,
		795,
		true
	},
	backYard_missing_furnitrue_tip = {
		485420,
		114,
		true
	},
	win_condition_display_qijian = {
		485534,
		120,
		true
	},
	win_condition_display_qijian_tip = {
		485654,
		126,
		true
	},
	win_condition_display_shangchuan = {
		485780,
		151,
		true
	},
	win_condition_display_shangchuan_tip = {
		485931,
		170,
		true
	},
	win_condition_display_judian = {
		486101,
		116,
		true
	},
	win_condition_display_tuoli = {
		486217,
		126,
		true
	},
	win_condition_display_tuoli_tip = {
		486343,
		130,
		true
	},
	lose_condition_display_quanmie = {
		486473,
		123,
		true
	},
	lose_condition_display_gangqu = {
		486596,
		155,
		true
	},
	re_battle = {
		486751,
		79,
		true
	},
	keep_fate_tip = {
		486830,
		148,
		true
	},
	equip_info_1 = {
		486978,
		79,
		true
	},
	equip_info_2 = {
		487057,
		84,
		true
	},
	equip_info_3 = {
		487141,
		89,
		true
	},
	equip_info_4 = {
		487230,
		81,
		true
	},
	equip_info_5 = {
		487311,
		85,
		true
	},
	equip_info_6 = {
		487396,
		90,
		true
	},
	equip_info_7 = {
		487486,
		86,
		true
	},
	equip_info_8 = {
		487572,
		86,
		true
	},
	equip_info_9 = {
		487658,
		90,
		true
	},
	equip_info_10 = {
		487748,
		85,
		true
	},
	equip_info_11 = {
		487833,
		85,
		true
	},
	equip_info_12 = {
		487918,
		89,
		true
	},
	equip_info_13 = {
		488007,
		86,
		true
	},
	equip_info_14 = {
		488093,
		92,
		true
	},
	equip_info_15 = {
		488185,
		87,
		true
	},
	equip_info_16 = {
		488272,
		89,
		true
	},
	equip_info_17 = {
		488361,
		88,
		true
	},
	equip_info_18 = {
		488449,
		89,
		true
	},
	equip_info_19 = {
		488538,
		84,
		true
	},
	equip_info_20 = {
		488622,
		88,
		true
	},
	equip_info_21 = {
		488710,
		85,
		true
	},
	equip_info_22 = {
		488795,
		91,
		true
	},
	equip_info_23 = {
		488886,
		90,
		true
	},
	equip_info_24 = {
		488976,
		86,
		true
	},
	equip_info_25 = {
		489062,
		77,
		true
	},
	equip_info_26 = {
		489139,
		90,
		true
	},
	equip_info_27 = {
		489229,
		77,
		true
	},
	equip_info_28 = {
		489306,
		93,
		true
	},
	equip_info_29 = {
		489399,
		80,
		true
	},
	equip_info_30 = {
		489479,
		80,
		true
	},
	equip_info_31 = {
		489559,
		80,
		true
	},
	equip_info_32 = {
		489639,
		91,
		true
	},
	equip_info_33 = {
		489730,
		89,
		true
	},
	equip_info_34 = {
		489819,
		90,
		true
	},
	equip_info_extralevel_0 = {
		489909,
		94,
		true
	},
	equip_info_extralevel_1 = {
		490003,
		94,
		true
	},
	equip_info_extralevel_2 = {
		490097,
		94,
		true
	},
	equip_info_extralevel_3 = {
		490191,
		94,
		true
	},
	tec_settings_btn_word = {
		490285,
		99,
		true
	},
	tec_tendency_x = {
		490384,
		86,
		true
	},
	tec_tendency_0 = {
		490470,
		86,
		true
	},
	tec_tendency_1 = {
		490556,
		87,
		true
	},
	tec_tendency_2 = {
		490643,
		87,
		true
	},
	tec_tendency_3 = {
		490730,
		87,
		true
	},
	tec_tendency_4 = {
		490817,
		87,
		true
	},
	tec_tendency_cur_x = {
		490904,
		101,
		true
	},
	tec_tendency_cur_0 = {
		491005,
		108,
		true
	},
	tec_tendency_cur_1 = {
		491113,
		107,
		true
	},
	tec_tendency_cur_2 = {
		491220,
		107,
		true
	},
	tec_tendency_cur_3 = {
		491327,
		107,
		true
	},
	tec_target_catchup_none = {
		491434,
		117,
		true
	},
	tec_target_catchup_selected = {
		491551,
		105,
		true
	},
	tec_tendency_cur_4 = {
		491656,
		107,
		true
	},
	tec_target_catchup_none_x = {
		491763,
		108,
		true
	},
	tec_target_catchup_none_1 = {
		491871,
		107,
		true
	},
	tec_target_catchup_none_2 = {
		491978,
		107,
		true
	},
	tec_target_catchup_none_3 = {
		492085,
		107,
		true
	},
	tec_target_catchup_selected_x = {
		492192,
		108,
		true
	},
	tec_target_catchup_selected_1 = {
		492300,
		107,
		true
	},
	tec_target_catchup_selected_2 = {
		492407,
		107,
		true
	},
	tec_target_catchup_selected_3 = {
		492514,
		107,
		true
	},
	tec_target_catchup_finish_x = {
		492621,
		106,
		true
	},
	tec_target_catchup_finish_1 = {
		492727,
		105,
		true
	},
	tec_target_catchup_finish_2 = {
		492832,
		105,
		true
	},
	tec_target_catchup_finish_3 = {
		492937,
		105,
		true
	},
	tec_target_catchup_finish_4 = {
		493042,
		105,
		true
	},
	tec_target_catchup_dr_finish_tip = {
		493147,
		113,
		true
	},
	tec_target_catchup_all_finish_tip = {
		493260,
		114,
		true
	},
	tec_target_catchup_show_the_finished_version = {
		493374,
		133,
		true
	},
	tec_target_catchup_pry_char = {
		493507,
		99,
		true
	},
	tec_target_catchup_dr_char = {
		493606,
		98,
		true
	},
	tec_target_need_print = {
		493704,
		98,
		true
	},
	tec_target_catchup_progress = {
		493802,
		99,
		true
	},
	tec_target_catchup_select_tip = {
		493901,
		135,
		true
	},
	tec_target_catchup_help_tip = {
		494036,
		824,
		true
	},
	tec_speedup_title = {
		494860,
		102,
		true
	},
	tec_speedup_progress = {
		494962,
		94,
		true
	},
	tec_speedup_overflow = {
		495056,
		186,
		true
	},
	tec_speedup_help_tip = {
		495242,
		274,
		true
	},
	click_back_tip = {
		495516,
		92,
		true
	},
	tech_catchup_sentence_pauses = {
		495608,
		95,
		true
	},
	tec_act_catchup_btn_word = {
		495703,
		103,
		true
	},
	tec_catchup_errorfix = {
		495806,
		226,
		true
	},
	guild_duty_is_too_low = {
		496032,
		149,
		true
	},
	guild_trainee_duty_change_tip = {
		496181,
		144,
		true
	},
	guild_not_exist_donate_task = {
		496325,
		121,
		true
	},
	guild_week_task_state_is_wrong = {
		496446,
		131,
		true
	},
	guild_get_week_done = {
		496577,
		127,
		true
	},
	guild_public_awards = {
		496704,
		97,
		true
	},
	guild_private_awards = {
		496801,
		99,
		true
	},
	guild_task_selecte_tip = {
		496900,
		276,
		true
	},
	guild_task_accept = {
		497176,
		374,
		true
	},
	guild_commander_and_sub_op = {
		497550,
		152,
		true
	},
	["guild_donate_times_not enough"] = {
		497702,
		144,
		true
	},
	guild_donate_success = {
		497846,
		108,
		true
	},
	guild_left_donate_cnt = {
		497954,
		118,
		true
	},
	guild_donate_tip = {
		498072,
		228,
		true
	},
	guild_donate_addition_capital_tip = {
		498300,
		125,
		true
	},
	guild_donate_addition_techpoint_tip = {
		498425,
		141,
		true
	},
	guild_donate_capital_toplimit = {
		498566,
		151,
		true
	},
	guild_donate_techpoint_toplimit = {
		498717,
		153,
		true
	},
	guild_supply_no_open = {
		498870,
		121,
		true
	},
	guild_supply_award_got = {
		498991,
		119,
		true
	},
	guild_new_member_get_award_tip = {
		499110,
		181,
		true
	},
	guild_start_supply_consume_tip = {
		499291,
		143,
		true
	},
	guild_left_supply_day = {
		499434,
		99,
		true
	},
	guild_supply_help_tip = {
		499533,
		731,
		true
	},
	guild_op_only_administrator = {
		500264,
		153,
		true
	},
	guild_shop_refresh_done = {
		500417,
		102,
		true
	},
	guild_shop_cnt_no_enough = {
		500519,
		113,
		true
	},
	guild_shop_refresh_all_tip = {
		500632,
		205,
		true
	},
	guild_shop_exchange_tip = {
		500837,
		128,
		true
	},
	guild_shop_label_1 = {
		500965,
		115,
		true
	},
	guild_shop_label_2 = {
		501080,
		87,
		true
	},
	guild_shop_label_3 = {
		501167,
		89,
		true
	},
	guild_shop_label_4 = {
		501256,
		86,
		true
	},
	guild_shop_label_5 = {
		501342,
		119,
		true
	},
	guild_shop_must_select_goods = {
		501461,
		125,
		true
	},
	guild_not_exist_activation_tech = {
		501586,
		143,
		true
	},
	guild_not_exist_tech = {
		501729,
		119,
		true
	},
	guild_cancel_only_once_pre_day = {
		501848,
		144,
		true
	},
	guild_tech_is_max_level = {
		501992,
		132,
		true
	},
	guild_tech_gold_no_enough = {
		502124,
		141,
		true
	},
	guild_tech_guildgold_no_enough = {
		502265,
		153,
		true
	},
	guild_tech_upgrade_done = {
		502418,
		118,
		true
	},
	guild_exist_activation_tech = {
		502536,
		136,
		true
	},
	guild_tech_gold_desc = {
		502672,
		105,
		true
	},
	guild_tech_oil_desc = {
		502777,
		102,
		true
	},
	guild_tech_shipbag_desc = {
		502879,
		101,
		true
	},
	guild_tech_equipbag_desc = {
		502980,
		107,
		true
	},
	guild_box_gold_desc = {
		503087,
		99,
		true
	},
	guidl_r_box_time_desc = {
		503186,
		115,
		true
	},
	guidl_sr_box_time_desc = {
		503301,
		117,
		true
	},
	guidl_ssr_box_time_desc = {
		503418,
		123,
		true
	},
	guild_member_max_cnt_desc = {
		503541,
		110,
		true
	},
	guild_tech_livness_no_enough = {
		503651,
		271,
		true
	},
	guild_tech_livness_no_enough_label = {
		503922,
		126,
		true
	},
	guild_ship_attr_desc = {
		504048,
		133,
		true
	},
	guild_start_tech_group_tip = {
		504181,
		164,
		true
	},
	guild_cancel_tech_tip = {
		504345,
		182,
		true
	},
	guild_tech_consume_tip = {
		504527,
		219,
		true
	},
	guild_tech_non_admin = {
		504746,
		146,
		true
	},
	guild_tech_label_max_level = {
		504892,
		100,
		true
	},
	guild_tech_label_dev_progress = {
		504992,
		102,
		true
	},
	guild_tech_label_condition = {
		505094,
		131,
		true
	},
	guild_tech_donate_target = {
		505225,
		122,
		true
	},
	guild_not_exist = {
		505347,
		105,
		true
	},
	guild_not_exist_battle = {
		505452,
		126,
		true
	},
	guild_battle_is_end = {
		505578,
		121,
		true
	},
	guild_battle_is_exist = {
		505699,
		126,
		true
	},
	guild_guildgold_no_enough_for_battle = {
		505825,
		164,
		true
	},
	guild_event_start_tip1 = {
		505989,
		167,
		true
	},
	guild_event_start_tip2 = {
		506156,
		168,
		true
	},
	guild_word_may_happen_event = {
		506324,
		106,
		true
	},
	guild_battle_award = {
		506430,
		90,
		true
	},
	guild_word_consume = {
		506520,
		87,
		true
	},
	guild_start_event_consume_tip = {
		506607,
		149,
		true
	},
	guild_start_event_consume_tip_extra = {
		506756,
		222,
		true
	},
	guild_word_consume_for_battle = {
		506978,
		99,
		true
	},
	guild_level_no_enough = {
		507077,
		159,
		true
	},
	guild_open_event_info_when_exist_active = {
		507236,
		170,
		true
	},
	guild_join_event_cnt_label = {
		507406,
		117,
		true
	},
	guild_join_event_max_cnt_tip = {
		507523,
		124,
		true
	},
	guild_join_event_progress_label = {
		507647,
		104,
		true
	},
	guild_join_event_exist_finished_mission_tip = {
		507751,
		277,
		true
	},
	guild_event_not_exist = {
		508028,
		119,
		true
	},
	guild_fleet_can_not_edit = {
		508147,
		131,
		true
	},
	guild_fleet_exist_same_kind_ship = {
		508278,
		151,
		true
	},
	guild_event_exist_same_kind_ship = {
		508429,
		171,
		true
	},
	guidl_event_ship_in_event = {
		508600,
		150,
		true
	},
	guild_event_start_done = {
		508750,
		110,
		true
	},
	guild_fleet_update_done = {
		508860,
		122,
		true
	},
	guild_event_is_lock = {
		508982,
		115,
		true
	},
	guild_event_is_finish = {
		509097,
		161,
		true
	},
	guild_fleet_not_save_tip = {
		509258,
		161,
		true
	},
	guild_word_battle_area = {
		509419,
		91,
		true
	},
	guild_word_battle_type = {
		509510,
		91,
		true
	},
	guild_wrod_battle_target = {
		509601,
		99,
		true
	},
	guild_event_recomm_ship_failed = {
		509700,
		139,
		true
	},
	guild_event_start_event_tip = {
		509839,
		208,
		true
	},
	guild_word_sea = {
		510047,
		83,
		true
	},
	guild_word_score_addition = {
		510130,
		106,
		true
	},
	guild_word_effect_addition = {
		510236,
		111,
		true
	},
	guild_curr_fleet_can_not_edit = {
		510347,
		127,
		true
	},
	guild_next_edit_fleet_time = {
		510474,
		125,
		true
	},
	guild_event_info_desc1 = {
		510599,
		197,
		true
	},
	guild_event_info_desc2 = {
		510796,
		128,
		true
	},
	guild_join_member_cnt = {
		510924,
		98,
		true
	},
	guild_total_effect = {
		511022,
		99,
		true
	},
	guild_word_people = {
		511121,
		81,
		true
	},
	guild_event_info_desc3 = {
		511202,
		104,
		true
	},
	guild_not_exist_boss = {
		511306,
		112,
		true
	},
	guild_ship_from = {
		511418,
		84,
		true
	},
	guild_boss_formation_1 = {
		511502,
		160,
		true
	},
	guild_boss_formation_2 = {
		511662,
		146,
		true
	},
	guild_boss_formation_3 = {
		511808,
		123,
		true
	},
	guild_boss_cnt_no_enough = {
		511931,
		131,
		true
	},
	guild_boss_fleet_cnt_invaild = {
		512062,
		137,
		true
	},
	guild_boss_formation_not_exist_self_ship = {
		512199,
		190,
		true
	},
	guild_boss_formation_exist_event_ship = {
		512389,
		161,
		true
	},
	guild_fleet_is_legal = {
		512550,
		157,
		true
	},
	guild_battle_result_boss_is_death = {
		512707,
		134,
		true
	},
	guild_must_edit_fleet = {
		512841,
		112,
		true
	},
	guild_ship_in_battle = {
		512953,
		163,
		true
	},
	guild_ship_in_assult_fleet = {
		513116,
		134,
		true
	},
	guild_event_exist_assult_ship = {
		513250,
		157,
		true
	},
	guild_formation_erro_in_boss_battle = {
		513407,
		168,
		true
	},
	guild_get_report_failed = {
		513575,
		121,
		true
	},
	guild_report_get_all = {
		513696,
		95,
		true
	},
	guild_can_not_get_tip = {
		513791,
		158,
		true
	},
	guild_not_exist_notifycation = {
		513949,
		146,
		true
	},
	guild_exist_report_award_when_exit = {
		514095,
		172,
		true
	},
	guild_report_tooltip = {
		514267,
		243,
		true
	},
	word_guildgold = {
		514510,
		90,
		true
	},
	guild_member_rank_title_donate = {
		514600,
		107,
		true
	},
	guild_member_rank_title_finish_cnt = {
		514707,
		109,
		true
	},
	guild_member_rank_title_join_cnt = {
		514816,
		110,
		true
	},
	guild_donate_log = {
		514926,
		165,
		true
	},
	guild_supply_log = {
		515091,
		148,
		true
	},
	guild_weektask_log = {
		515239,
		148,
		true
	},
	guild_battle_log = {
		515387,
		137,
		true
	},
	guild_tech_change_log = {
		515524,
		136,
		true
	},
	guild_log_title = {
		515660,
		88,
		true
	},
	guild_use_donateitem_success = {
		515748,
		131,
		true
	},
	guild_use_battleitem_success = {
		515879,
		140,
		true
	},
	not_exist_guild_use_item = {
		516019,
		141,
		true
	},
	guild_member_tip = {
		516160,
		2773,
		true
	},
	guild_tech_tip = {
		518933,
		2740,
		true
	},
	guild_office_tip = {
		521673,
		2650,
		true
	},
	guild_event_help_tip = {
		524323,
		2687,
		true
	},
	guild_mission_info_tip = {
		527010,
		1109,
		true
	},
	guild_public_tech_tip = {
		528119,
		660,
		true
	},
	guild_public_office_tip = {
		528779,
		325,
		true
	},
	guild_tech_price_inc_tip = {
		529104,
		258,
		true
	},
	guild_boss_fleet_desc = {
		529362,
		523,
		true
	},
	guild_boss_formation_exist_invaild_ship = {
		529885,
		197,
		true
	},
	guild_exist_unreceived_supply_award = {
		530082,
		127,
		true
	},
	word_shipState_guild_event = {
		530209,
		159,
		true
	},
	word_shipState_guild_boss = {
		530368,
		193,
		true
	},
	commander_is_in_guild = {
		530561,
		195,
		true
	},
	guild_assult_ship_recommend = {
		530756,
		134,
		true
	},
	guild_cancel_assult_ship_recommend = {
		530890,
		132,
		true
	},
	guild_assult_ship_recommend_conflict = {
		531022,
		147,
		true
	},
	guild_recommend_limit = {
		531169,
		143,
		true
	},
	guild_cancel_assult_ship_recommend_conflict = {
		531312,
		169,
		true
	},
	guild_mission_complate = {
		531481,
		110,
		true
	},
	guild_operation_event_occurrence = {
		531591,
		172,
		true
	},
	guild_transfer_president_confirm = {
		531763,
		236,
		true
	},
	guild_damage_ranking = {
		531999,
		88,
		true
	},
	guild_total_damage = {
		532087,
		88,
		true
	},
	guild_donate_list_updated = {
		532175,
		142,
		true
	},
	guild_donate_list_update_failed = {
		532317,
		146,
		true
	},
	guild_tip_quit_operation = {
		532463,
		239,
		true
	},
	guild_tip_grand_fleet_is_frozen = {
		532702,
		144,
		true
	},
	guild_tip_operation_time_is_not_ample = {
		532846,
		355,
		true
	},
	guild_time_remaining_tip = {
		533201,
		104,
		true
	},
	multiple_ship_energy_low_desc = {
		533305,
		142,
		true
	},
	multiple_ship_energy_low_warn = {
		533447,
		142,
		true
	},
	multiple_ship_energy_low_warn_no_exp = {
		533589,
		282,
		true
	},
	us_error_download_painting = {
		533871,
		243,
		true
	},
	help_rollingBallGame = {
		534114,
		1116,
		true
	},
	rolling_ball_help = {
		535230,
		896,
		true
	},
	help_jiujiu_expedition_game = {
		536126,
		723,
		true
	},
	jiujiu_expedition_game_stg_desc = {
		536849,
		125,
		true
	},
	build_ship_accumulative = {
		536974,
		94,
		true
	},
	destory_ship_before_tip = {
		537068,
		96,
		true
	},
	destory_ship_input_erro = {
		537164,
		127,
		true
	},
	destroy_ur_rarity_tip = {
		537291,
		223,
		true
	},
	destory_ur_pt_overflowa = {
		537514,
		283,
		true
	},
	jiujiu_expedition_help = {
		537797,
		514,
		true
	},
	shop_label_unlimt_cnt = {
		538311,
		94,
		true
	},
	jiujiu_expedition_book_tip = {
		538405,
		142,
		true
	},
	jiujiu_expedition_reward_tip = {
		538547,
		140,
		true
	},
	jiujiu_expedition_amount_tip = {
		538687,
		172,
		true
	},
	jiujiu_expedition_stg_tip = {
		538859,
		133,
		true
	},
	trade_card_tips1 = {
		538992,
		85,
		true
	},
	trade_card_tips2 = {
		539077,
		273,
		true
	},
	trade_card_tips3 = {
		539350,
		278,
		true
	},
	trade_card_tips4 = {
		539628,
		93,
		true
	},
	ur_exchange_help_tip = {
		539721,
		965,
		true
	},
	fleet_antisub_range = {
		540686,
		95,
		true
	},
	fleet_antisub_range_tip = {
		540781,
		1085,
		true
	},
	practise_idol_tip = {
		541866,
		120,
		true
	},
	practise_idol_help = {
		541986,
		937,
		true
	},
	upgrade_idol_tip = {
		542923,
		153,
		true
	},
	upgrade_complete_tip = {
		543076,
		104,
		true
	},
	upgrade_introduce_tip = {
		543180,
		135,
		true
	},
	collect_idol_tip = {
		543315,
		158,
		true
	},
	hand_account_tip = {
		543473,
		125,
		true
	},
	hand_account_resetting_tip = {
		543598,
		133,
		true
	},
	help_candymagic = {
		543731,
		1060,
		true
	},
	award_overflow_tip = {
		544791,
		172,
		true
	},
	hunter_npc = {
		544963,
		1368,
		true
	},
	venusvolleyball_help = {
		546331,
		1402,
		true
	},
	venusvolleyball_rule_tip = {
		547733,
		109,
		true
	},
	venusvolleyball_return_tip = {
		547842,
		125,
		true
	},
	venusvolleyball_suspend_tip = {
		547967,
		109,
		true
	},
	doa_main = {
		548076,
		1461,
		true
	},
	doa_pt_help = {
		549537,
		841,
		true
	},
	doa_pt_complete = {
		550378,
		96,
		true
	},
	doa_pt_up = {
		550474,
		110,
		true
	},
	doa_liliang = {
		550584,
		78,
		true
	},
	doa_jiqiao = {
		550662,
		77,
		true
	},
	doa_tili = {
		550739,
		75,
		true
	},
	doa_meili = {
		550814,
		76,
		true
	},
	snowball_help = {
		550890,
		1745,
		true
	},
	help_xinnian2021_feast = {
		552635,
		533,
		true
	},
	help_xinnian2021__qiaozhong = {
		553168,
		1318,
		true
	},
	help_xinnian2021__meishiyemian = {
		554486,
		703,
		true
	},
	help_xinnian2021__meishi = {
		555189,
		1290,
		true
	},
	help_act_event = {
		556479,
		286,
		true
	},
	autofight = {
		556765,
		84,
		true
	},
	autofight_errors_tip = {
		556849,
		142,
		true
	},
	autofight_special_operation_tip = {
		556991,
		322,
		true
	},
	autofight_formation = {
		557313,
		92,
		true
	},
	autofight_cat = {
		557405,
		87,
		true
	},
	autofight_function = {
		557492,
		86,
		true
	},
	autofight_function1 = {
		557578,
		90,
		true
	},
	autofight_function2 = {
		557668,
		92,
		true
	},
	autofight_function3 = {
		557760,
		94,
		true
	},
	autofight_function4 = {
		557854,
		90,
		true
	},
	autofight_function5 = {
		557944,
		98,
		true
	},
	autofight_rewards = {
		558042,
		94,
		true
	},
	autofight_rewards_none = {
		558136,
		104,
		true
	},
	autofight_leave = {
		558240,
		83,
		true
	},
	autofight_onceagain = {
		558323,
		91,
		true
	},
	autofight_entrust = {
		558414,
		109,
		true
	},
	autofight_task = {
		558523,
		99,
		true
	},
	autofight_effect = {
		558622,
		146,
		true
	},
	autofight_file = {
		558768,
		97,
		true
	},
	autofight_discovery = {
		558865,
		112,
		true
	},
	autofight_tip_bigworld_dead = {
		558977,
		155,
		true
	},
	autofight_tip_bigworld_begin = {
		559132,
		137,
		true
	},
	autofight_tip_bigworld_stop = {
		559269,
		137,
		true
	},
	autofight_tip_bigworld_suspend = {
		559406,
		179,
		true
	},
	autofight_tip_bigworld_loop = {
		559585,
		151,
		true
	},
	autofight_farm = {
		559736,
		91,
		true
	},
	autofight_story = {
		559827,
		117,
		true
	},
	fushun_adventure_help = {
		559944,
		1320,
		true
	},
	autofight_change_tip = {
		561264,
		175,
		true
	},
	autofight_selectprops_tip = {
		561439,
		97,
		true
	},
	help_chunjie2021_feast = {
		561536,
		748,
		true
	},
	valentinesday__txt1_tip = {
		562284,
		174,
		true
	},
	valentinesday__txt2_tip = {
		562458,
		136,
		true
	},
	valentinesday__txt3_tip = {
		562594,
		141,
		true
	},
	valentinesday__txt4_tip = {
		562735,
		148,
		true
	},
	valentinesday__txt5_tip = {
		562883,
		140,
		true
	},
	valentinesday__txt6_tip = {
		563023,
		146,
		true
	},
	valentinesday__shop_tip = {
		563169,
		128,
		true
	},
	wwf_bamboo_tip1 = {
		563297,
		104,
		true
	},
	wwf_bamboo_tip2 = {
		563401,
		103,
		true
	},
	wwf_bamboo_tip3 = {
		563504,
		135,
		true
	},
	wwf_bamboo_help = {
		563639,
		1066,
		true
	},
	wwf_guide_tip = {
		564705,
		113,
		true
	},
	securitycake_help = {
		564818,
		2143,
		true
	},
	icecream_help = {
		566961,
		737,
		true
	},
	icecream_make_tip = {
		567698,
		98,
		true
	},
	query_role = {
		567796,
		86,
		true
	},
	query_role_none = {
		567882,
		87,
		true
	},
	query_role_button = {
		567969,
		94,
		true
	},
	query_role_fail = {
		568063,
		93,
		true
	},
	cumulative_victory_target_tip = {
		568156,
		109,
		true
	},
	cumulative_victory_now_tip = {
		568265,
		108,
		true
	},
	word_files_repair = {
		568373,
		95,
		true
	},
	repair_setting_label = {
		568468,
		98,
		true
	},
	voice_control = {
		568566,
		83,
		true
	},
	index_equip = {
		568649,
		84,
		true
	},
	index_without_limit = {
		568733,
		91,
		true
	},
	meta_learn_skill = {
		568824,
		92,
		true
	},
	world_joint_boss_not_found = {
		568916,
		148,
		true
	},
	world_joint_boss_is_death = {
		569064,
		143,
		true
	},
	world_joint_whitout_guild = {
		569207,
		123,
		true
	},
	world_joint_whitout_friend = {
		569330,
		126,
		true
	},
	world_joint_call_support_failed = {
		569456,
		126,
		true
	},
	world_joint_call_support_success = {
		569582,
		131,
		true
	},
	world_joint_call_friend_support_txt = {
		569713,
		111,
		true
	},
	world_joint_call_guild_support_txt = {
		569824,
		110,
		true
	},
	world_joint_call_world_support_txt = {
		569934,
		110,
		true
	},
	ad_4 = {
		570044,
		228,
		true
	},
	world_word_expired = {
		570272,
		94,
		true
	},
	world_word_guild_member = {
		570366,
		99,
		true
	},
	world_word_guild_player = {
		570465,
		93,
		true
	},
	world_joint_boss_award_expired = {
		570558,
		106,
		true
	},
	world_joint_not_refresh_frequently = {
		570664,
		122,
		true
	},
	world_joint_exit_battle_tip = {
		570786,
		151,
		true
	},
	world_boss_get_item = {
		570937,
		215,
		true
	},
	world_boss_ask_help = {
		571152,
		134,
		true
	},
	world_joint_count_no_enough = {
		571286,
		135,
		true
	},
	world_boss_none = {
		571421,
		133,
		true
	},
	world_boss_fleet = {
		571554,
		100,
		true
	},
	world_max_challenge_cnt = {
		571654,
		144,
		true
	},
	world_reset_success = {
		571798,
		124,
		true
	},
	world_map_dangerous_confirm = {
		571922,
		230,
		true
	},
	world_map_version = {
		572152,
		140,
		true
	},
	world_resource_fill = {
		572292,
		130,
		true
	},
	meta_sys_lock_tip = {
		572422,
		93,
		true
	},
	meta_story_lock = {
		572515,
		91,
		true
	},
	meta_acttime_limit = {
		572606,
		90,
		true
	},
	meta_pt_left = {
		572696,
		88,
		true
	},
	meta_syn_rate = {
		572784,
		86,
		true
	},
	meta_repair_rate = {
		572870,
		99,
		true
	},
	meta_story_tip_1 = {
		572969,
		92,
		true
	},
	meta_story_tip_2 = {
		573061,
		92,
		true
	},
	meta_pt_get_way = {
		573153,
		91,
		true
	},
	meta_pt_point = {
		573244,
		84,
		true
	},
	meta_award_get = {
		573328,
		85,
		true
	},
	meta_award_got = {
		573413,
		87,
		true
	},
	meta_repair = {
		573500,
		89,
		true
	},
	meta_repair_success = {
		573589,
		117,
		true
	},
	meta_repair_effect_unlock = {
		573706,
		125,
		true
	},
	meta_repair_effect_special = {
		573831,
		122,
		true
	},
	meta_energy_ship_level_need = {
		573953,
		115,
		true
	},
	meta_energy_ship_repairrate_need = {
		574068,
		125,
		true
	},
	meta_energy_active_box_tip = {
		574193,
		192,
		true
	},
	meta_break = {
		574385,
		127,
		true
	},
	meta_energy_preview_title = {
		574512,
		123,
		true
	},
	meta_energy_preview_tip = {
		574635,
		138,
		true
	},
	meta_exp_per_day = {
		574773,
		90,
		true
	},
	meta_skill_unlock = {
		574863,
		108,
		true
	},
	meta_unlock_skill_tip = {
		574971,
		160,
		true
	},
	meta_unlock_skill_select = {
		575131,
		100,
		true
	},
	meta_switch_skill_disable = {
		575231,
		138,
		true
	},
	meta_switch_skill_box_title = {
		575369,
		128,
		true
	},
	meta_cur_pt = {
		575497,
		87,
		true
	},
	meta_toast_fullexp = {
		575584,
		115,
		true
	},
	meta_toast_tactics = {
		575699,
		95,
		true
	},
	meta_skillbtn_tactics = {
		575794,
		93,
		true
	},
	meta_destroy_tip = {
		575887,
		110,
		true
	},
	meta_voice_name_feeling1 = {
		575997,
		96,
		true
	},
	meta_voice_name_feeling2 = {
		576093,
		96,
		true
	},
	meta_voice_name_feeling3 = {
		576189,
		94,
		true
	},
	meta_voice_name_feeling4 = {
		576283,
		94,
		true
	},
	meta_voice_name_feeling5 = {
		576377,
		92,
		true
	},
	meta_voice_name_propose = {
		576469,
		91,
		true
	},
	world_boss_ad = {
		576560,
		89,
		true
	},
	world_boss_drop_title = {
		576649,
		97,
		true
	},
	world_boss_pt_recove_desc = {
		576746,
		151,
		true
	},
	world_boss_progress_item_desc = {
		576897,
		462,
		true
	},
	world_joint_max_challenge_people_cnt = {
		577359,
		130,
		true
	},
	equip_ammo_type_1 = {
		577489,
		83,
		true
	},
	equip_ammo_type_2 = {
		577572,
		83,
		true
	},
	equip_ammo_type_3 = {
		577655,
		88,
		true
	},
	equip_ammo_type_4 = {
		577743,
		90,
		true
	},
	equip_ammo_type_5 = {
		577833,
		88,
		true
	},
	equip_ammo_type_6 = {
		577921,
		88,
		true
	},
	equip_ammo_type_7 = {
		578009,
		84,
		true
	},
	equip_ammo_type_8 = {
		578093,
		92,
		true
	},
	equip_ammo_type_9 = {
		578185,
		88,
		true
	},
	equip_ammo_type_10 = {
		578273,
		87,
		true
	},
	equip_ammo_type_11 = {
		578360,
		89,
		true
	},
	common_daily_limit = {
		578449,
		94,
		true
	},
	meta_help = {
		578543,
		2141,
		true
	},
	world_boss_daily_limit = {
		580684,
		118,
		true
	},
	common_go_to_analyze = {
		580802,
		92,
		true
	},
	world_boss_not_reach_target = {
		580894,
		122,
		true
	},
	special_transform_limit_reach = {
		581016,
		145,
		true
	},
	meta_pt_notenough = {
		581161,
		175,
		true
	},
	meta_boss_unlock = {
		581336,
		210,
		true
	},
	word_take_effect = {
		581546,
		91,
		true
	},
	world_boss_challenge_cnt = {
		581637,
		100,
		true
	},
	word_shipNation_meta = {
		581737,
		87,
		true
	},
	world_word_friend = {
		581824,
		89,
		true
	},
	world_word_world = {
		581913,
		86,
		true
	},
	world_word_guild = {
		581999,
		85,
		true
	},
	world_collection_1 = {
		582084,
		91,
		true
	},
	world_collection_2 = {
		582175,
		91,
		true
	},
	world_collection_3 = {
		582266,
		91,
		true
	},
	zero_hour_command_error = {
		582357,
		150,
		true
	},
	commander_is_in_bigworld = {
		582507,
		142,
		true
	},
	world_collection_back = {
		582649,
		99,
		true
	},
	archives_whether_to_retreat = {
		582748,
		199,
		true
	},
	world_fleet_stop = {
		582947,
		111,
		true
	},
	world_setting_title = {
		583058,
		108,
		true
	},
	world_setting_quickmode = {
		583166,
		106,
		true
	},
	world_setting_quickmodetip = {
		583272,
		134,
		true
	},
	world_setting_submititem = {
		583406,
		121,
		true
	},
	world_setting_submititemtip = {
		583527,
		332,
		true
	},
	world_setting_mapauto = {
		583859,
		122,
		true
	},
	world_setting_mapautotip = {
		583981,
		171,
		true
	},
	world_boss_maintenance = {
		584152,
		167,
		true
	},
	world_boss_inbattle = {
		584319,
		147,
		true
	},
	world_automode_title_1 = {
		584466,
		103,
		true
	},
	world_automode_title_2 = {
		584569,
		86,
		true
	},
	world_automode_treasure_1 = {
		584655,
		137,
		true
	},
	world_automode_treasure_2 = {
		584792,
		132,
		true
	},
	world_automode_treasure_3 = {
		584924,
		136,
		true
	},
	world_automode_cancel = {
		585060,
		91,
		true
	},
	world_automode_confirm = {
		585151,
		93,
		true
	},
	world_automode_start_tip1 = {
		585244,
		122,
		true
	},
	world_automode_start_tip2 = {
		585366,
		105,
		true
	},
	world_automode_start_tip3 = {
		585471,
		124,
		true
	},
	world_automode_start_tip4 = {
		585595,
		115,
		true
	},
	world_automode_start_tip5 = {
		585710,
		164,
		true
	},
	world_automode_setting_1 = {
		585874,
		119,
		true
	},
	world_automode_setting_1_1 = {
		585993,
		101,
		true
	},
	world_automode_setting_1_2 = {
		586094,
		91,
		true
	},
	world_automode_setting_1_3 = {
		586185,
		91,
		true
	},
	world_automode_setting_1_4 = {
		586276,
		99,
		true
	},
	world_automode_setting_2 = {
		586375,
		137,
		true
	},
	world_automode_setting_2_1 = {
		586512,
		106,
		true
	},
	world_automode_setting_2_2 = {
		586618,
		109,
		true
	},
	world_automode_setting_all_1 = {
		586727,
		135,
		true
	},
	world_automode_setting_all_1_1 = {
		586862,
		115,
		true
	},
	world_automode_setting_all_1_2 = {
		586977,
		119,
		true
	},
	world_automode_setting_all_2 = {
		587096,
		139,
		true
	},
	world_automode_setting_all_2_1 = {
		587235,
		99,
		true
	},
	world_automode_setting_all_2_2 = {
		587334,
		115,
		true
	},
	world_automode_setting_all_2_3 = {
		587449,
		115,
		true
	},
	world_automode_setting_all_3 = {
		587564,
		121,
		true
	},
	world_automode_setting_all_3_1 = {
		587685,
		96,
		true
	},
	world_automode_setting_all_3_2 = {
		587781,
		97,
		true
	},
	world_automode_setting_all_4 = {
		587878,
		135,
		true
	},
	world_automode_setting_all_4_1 = {
		588013,
		97,
		true
	},
	world_automode_setting_all_4_2 = {
		588110,
		96,
		true
	},
	world_automode_setting_new_1 = {
		588206,
		122,
		true
	},
	world_automode_setting_new_1_1 = {
		588328,
		105,
		true
	},
	world_automode_setting_new_1_2 = {
		588433,
		95,
		true
	},
	world_automode_setting_new_1_3 = {
		588528,
		95,
		true
	},
	world_automode_setting_new_1_4 = {
		588623,
		95,
		true
	},
	world_automode_setting_new_1_5 = {
		588718,
		97,
		true
	},
	world_collection_task_tip_1 = {
		588815,
		147,
		true
	},
	area_putong = {
		588962,
		85,
		true
	},
	area_anquan = {
		589047,
		82,
		true
	},
	area_yaosai = {
		589129,
		85,
		true
	},
	area_yaosai_2 = {
		589214,
		96,
		true
	},
	area_shenyuan = {
		589310,
		84,
		true
	},
	area_yinmi = {
		589394,
		80,
		true
	},
	area_renwu = {
		589474,
		81,
		true
	},
	area_zhuxian = {
		589555,
		84,
		true
	},
	area_dangan = {
		589639,
		85,
		true
	},
	charge_trade_no_error = {
		589724,
		122,
		true
	},
	world_reset_1 = {
		589846,
		136,
		true
	},
	world_reset_2 = {
		589982,
		138,
		true
	},
	world_reset_3 = {
		590120,
		111,
		true
	},
	guild_is_frozen_when_start_tech = {
		590231,
		126,
		true
	},
	world_boss_unactivated = {
		590357,
		155,
		true
	},
	world_reset_tip = {
		590512,
		2719,
		true
	},
	spring_invited_2021 = {
		593231,
		231,
		true
	},
	charge_error_count_limit = {
		593462,
		128,
		true
	},
	charge_error_disable = {
		593590,
		144,
		true
	},
	levelScene_select_sp = {
		593734,
		138,
		true
	},
	word_adjustFleet = {
		593872,
		86,
		true
	},
	levelScene_select_noitem = {
		593958,
		112,
		true
	},
	story_setting_label = {
		594070,
		105,
		true
	},
	login_arrears_tips = {
		594175,
		208,
		true
	},
	Supplement_pay1 = {
		594383,
		211,
		true
	},
	Supplement_pay2 = {
		594594,
		231,
		true
	},
	Supplement_pay3 = {
		594825,
		209,
		true
	},
	Supplement_pay4 = {
		595034,
		86,
		true
	},
	world_ship_repair = {
		595120,
		102,
		true
	},
	Supplement_pay5 = {
		595222,
		185,
		true
	},
	area_unkown = {
		595407,
		89,
		true
	},
	Supplement_pay6 = {
		595496,
		89,
		true
	},
	Supplement_pay7 = {
		595585,
		88,
		true
	},
	Supplement_pay8 = {
		595673,
		86,
		true
	},
	world_battle_damage = {
		595759,
		217,
		true
	},
	setting_story_speed_1 = {
		595976,
		89,
		true
	},
	setting_story_speed_2 = {
		596065,
		91,
		true
	},
	setting_story_speed_3 = {
		596156,
		89,
		true
	},
	setting_story_speed_4 = {
		596245,
		94,
		true
	},
	story_autoplay_setting_label = {
		596339,
		106,
		true
	},
	story_autoplay_setting_1 = {
		596445,
		96,
		true
	},
	story_autoplay_setting_2 = {
		596541,
		95,
		true
	},
	meta_shop_exchange_limit = {
		596636,
		98,
		true
	},
	meta_shop_unexchange_label = {
		596734,
		90,
		true
	},
	daily_level_quick_battle_label2 = {
		596824,
		101,
		true
	},
	daily_level_quick_battle_label1 = {
		596925,
		109,
		true
	},
	dailyLevel_quickfinish = {
		597034,
		329,
		true
	},
	daily_level_quick_battle_label3 = {
		597363,
		108,
		true
	},
	backyard_longpress_ship_tip = {
		597471,
		160,
		true
	},
	common_npc_formation_tip = {
		597631,
		126,
		true
	},
	gametip_xiaotiancheng = {
		597757,
		1319,
		true
	},
	guild_task_autoaccept_1 = {
		599076,
		128,
		true
	},
	guild_task_autoaccept_2 = {
		599204,
		135,
		true
	},
	task_lock = {
		599339,
		93,
		true
	},
	week_task_pt_name = {
		599432,
		96,
		true
	},
	week_task_award_preview_label = {
		599528,
		100,
		true
	},
	week_task_title_label = {
		599628,
		108,
		true
	},
	cattery_op_clean_success = {
		599736,
		122,
		true
	},
	cattery_op_feed_success = {
		599858,
		114,
		true
	},
	cattery_op_play_success = {
		599972,
		122,
		true
	},
	cattery_style_change_success = {
		600094,
		130,
		true
	},
	cattery_add_commander_success = {
		600224,
		110,
		true
	},
	cattery_remove_commander_success = {
		600334,
		115,
		true
	},
	commander_box_quickly_tool_tip_1 = {
		600449,
		152,
		true
	},
	commander_box_quickly_tool_tip_2 = {
		600601,
		147,
		true
	},
	commander_box_quickly_tool_tip_3 = {
		600748,
		123,
		true
	},
	commander_box_was_finished = {
		600871,
		119,
		true
	},
	comander_tool_cnt_is_reclac = {
		600990,
		151,
		true
	},
	comander_tool_max_cnt = {
		601141,
		93,
		true
	},
	commander_op_play_level = {
		601234,
		101,
		true
	},
	commander_op_feed_level = {
		601335,
		101,
		true
	},
	cat_home_help = {
		601436,
		1398,
		true
	},
	cat_accelfrate_notenough = {
		602834,
		136,
		true
	},
	cat_home_unlock = {
		602970,
		131,
		true
	},
	cat_sleep_notplay = {
		603101,
		140,
		true
	},
	cathome_style_unlock = {
		603241,
		142,
		true
	},
	commander_is_in_cattery = {
		603383,
		122,
		true
	},
	cat_home_interaction = {
		603505,
		133,
		true
	},
	cat_accelerate_left = {
		603638,
		96,
		true
	},
	common_clean = {
		603734,
		81,
		true
	},
	common_feed = {
		603815,
		79,
		true
	},
	common_play = {
		603894,
		79,
		true
	},
	game_stopwords = {
		603973,
		107,
		true
	},
	game_openwords = {
		604080,
		110,
		true
	},
	amusementpark_shop_enter = {
		604190,
		143,
		true
	},
	amusementpark_shop_exchange = {
		604333,
		189,
		true
	},
	amusementpark_shop_success = {
		604522,
		107,
		true
	},
	amusementpark_shop_special = {
		604629,
		149,
		true
	},
	amusementpark_shop_end = {
		604778,
		116,
		true
	},
	amusementpark_shop_0 = {
		604894,
		176,
		true
	},
	amusementpark_shop_carousel1 = {
		605070,
		152,
		true
	},
	amusementpark_shop_carousel2 = {
		605222,
		151,
		true
	},
	amusementpark_shop_carousel3 = {
		605373,
		153,
		true
	},
	amusementpark_shop_exchange2 = {
		605526,
		196,
		true
	},
	amusementpark_help = {
		605722,
		1927,
		true
	},
	amusementpark_shop_help = {
		607649,
		465,
		true
	},
	handshake_game_help = {
		608114,
		915,
		true
	},
	MeixiV4_help = {
		609029,
		908,
		true
	},
	activity_permanent_total = {
		609937,
		107,
		true
	},
	word_investigate = {
		610044,
		86,
		true
	},
	ambush_display_none = {
		610130,
		88,
		true
	},
	activity_permanent_help = {
		610218,
		502,
		true
	},
	activity_permanent_tips1 = {
		610720,
		171,
		true
	},
	activity_permanent_tips2 = {
		610891,
		175,
		true
	},
	activity_permanent_tips3 = {
		611066,
		155,
		true
	},
	activity_permanent_tips4 = {
		611221,
		199,
		true
	},
	activity_permanent_finished = {
		611420,
		100,
		true
	},
	idolmaster_main = {
		611520,
		1190,
		true
	},
	idolmaster_game_tip1 = {
		612710,
		118,
		true
	},
	idolmaster_game_tip2 = {
		612828,
		116,
		true
	},
	idolmaster_game_tip3 = {
		612944,
		97,
		true
	},
	idolmaster_game_tip4 = {
		613041,
		94,
		true
	},
	idolmaster_game_tip5 = {
		613135,
		89,
		true
	},
	idolmaster_collection = {
		613224,
		631,
		true
	},
	idolmaster_voice_name_feeling1 = {
		613855,
		107,
		true
	},
	idolmaster_voice_name_feeling2 = {
		613962,
		102,
		true
	},
	idolmaster_voice_name_feeling3 = {
		614064,
		101,
		true
	},
	idolmaster_voice_name_feeling4 = {
		614165,
		104,
		true
	},
	idolmaster_voice_name_feeling5 = {
		614269,
		102,
		true
	},
	idolmaster_voice_name_propose = {
		614371,
		98,
		true
	},
	cartoon_all = {
		614469,
		78,
		true
	},
	cartoon_notall = {
		614547,
		84,
		true
	},
	cartoon_haveno = {
		614631,
		111,
		true
	},
	res_cartoon_new_tip = {
		614742,
		108,
		true
	},
	memory_actiivty_ex = {
		614850,
		87,
		true
	},
	memory_activity_sp = {
		614937,
		89,
		true
	},
	memory_activity_daily = {
		615026,
		89,
		true
	},
	memory_activity_others = {
		615115,
		90,
		true
	},
	battle_end_title = {
		615205,
		94,
		true
	},
	battle_end_subtitle1 = {
		615299,
		91,
		true
	},
	battle_end_subtitle2 = {
		615390,
		101,
		true
	},
	meta_skill_dailyexp = {
		615491,
		92,
		true
	},
	meta_skill_learn = {
		615583,
		127,
		true
	},
	meta_skill_maxtip = {
		615710,
		203,
		true
	},
	meta_tactics_detail = {
		615913,
		90,
		true
	},
	meta_tactics_unlock = {
		616003,
		91,
		true
	},
	meta_tactics_switch = {
		616094,
		91,
		true
	},
	meta_skill_maxtip2 = {
		616185,
		91,
		true
	},
	activity_permanent_progress = {
		616276,
		100,
		true
	},
	cattery_settlement_dialogue_1 = {
		616376,
		116,
		true
	},
	cattery_settlement_dialogue_2 = {
		616492,
		131,
		true
	},
	cattery_settlement_dialogue_3 = {
		616623,
		115,
		true
	},
	cattery_settlement_dialogue_4 = {
		616738,
		102,
		true
	},
	blueprint_catchup_by_gold_confirm = {
		616840,
		153,
		true
	},
	blueprint_catchup_by_gold_help = {
		616993,
		318,
		true
	},
	tec_tip_no_consumption = {
		617311,
		90,
		true
	},
	tec_tip_material_stock = {
		617401,
		91,
		true
	},
	tec_tip_to_consumption = {
		617492,
		91,
		true
	},
	onebutton_max_tip = {
		617583,
		96,
		true
	},
	target_get_tip = {
		617679,
		89,
		true
	},
	fleet_select_title = {
		617768,
		94,
		true
	},
	backyard_rename_title = {
		617862,
		96,
		true
	},
	backyard_rename_tip = {
		617958,
		105,
		true
	},
	equip_add = {
		618063,
		99,
		true
	},
	equipskin_add = {
		618162,
		108,
		true
	},
	equipskin_none = {
		618270,
		109,
		true
	},
	equipskin_typewrong = {
		618379,
		117,
		true
	},
	equipskin_typewrong_en = {
		618496,
		108,
		true
	},
	user_is_banned = {
		618604,
		134,
		true
	},
	user_is_forever_banned = {
		618738,
		116,
		true
	},
	old_class_is_close = {
		618854,
		144,
		true
	},
	activity_event_building = {
		618998,
		1210,
		true
	},
	salvage_tips = {
		620208,
		1124,
		true
	},
	tips_shakebeads = {
		621332,
		1036,
		true
	},
	gem_shop_xinzhi_tip = {
		622368,
		113,
		true
	},
	cowboy_tips = {
		622481,
		708,
		true
	},
	backyard_backyardScene_Disable_Rotation = {
		623189,
		137,
		true
	},
	chazi_tips = {
		623326,
		886,
		true
	},
	catchteasure_help = {
		624212,
		453,
		true
	},
	unlock_tips = {
		624665,
		93,
		true
	},
	class_label_tran = {
		624758,
		87,
		true
	},
	class_label_gen = {
		624845,
		88,
		true
	},
	class_attr_store = {
		624933,
		89,
		true
	},
	class_attr_proficiency = {
		625022,
		103,
		true
	},
	class_attr_getproficiency = {
		625125,
		105,
		true
	},
	class_attr_costproficiency = {
		625230,
		104,
		true
	},
	class_label_upgrading = {
		625334,
		94,
		true
	},
	class_label_upgradetime = {
		625428,
		99,
		true
	},
	class_label_oilfield = {
		625527,
		98,
		true
	},
	class_label_goldfield = {
		625625,
		100,
		true
	},
	class_res_maxlevel_tip = {
		625725,
		95,
		true
	},
	ship_exp_item_title = {
		625820,
		93,
		true
	},
	ship_exp_item_label_clear = {
		625913,
		94,
		true
	},
	ship_exp_item_label_recom = {
		626007,
		93,
		true
	},
	ship_exp_item_label_confirm = {
		626100,
		98,
		true
	},
	player_expResource_mail_fullBag = {
		626198,
		200,
		true
	},
	tec_nation_award_finish = {
		626398,
		98,
		true
	},
	coures_exp_overflow_tip = {
		626496,
		202,
		true
	},
	coures_exp_npc_tip = {
		626698,
		221,
		true
	},
	coures_level_tip = {
		626919,
		162,
		true
	},
	coures_tip_material_stock = {
		627081,
		94,
		true
	},
	coures_tip_exceeded_lv = {
		627175,
		123,
		true
	},
	eatgame_tips = {
		627298,
		844,
		true
	},
	breakout_tip_ultimatebonus_gunner = {
		628142,
		145,
		true
	},
	breakout_tip_ultimatebonus_torpedo = {
		628287,
		130,
		true
	},
	breakout_tip_ultimatebonus_aux = {
		628417,
		133,
		true
	},
	map_event_lighthouse_tip_1 = {
		628550,
		161,
		true
	},
	battlepass_main_tip_2110 = {
		628711,
		202,
		true
	},
	battlepass_main_time = {
		628913,
		94,
		true
	},
	battlepass_main_help_2110 = {
		629007,
		2880,
		true
	},
	cruise_task_help_2110 = {
		631887,
		1094,
		true
	},
	cruise_task_phase = {
		632981,
		106,
		true
	},
	cruise_task_tips = {
		633087,
		89,
		true
	},
	battlepass_task_quickfinish1 = {
		633176,
		231,
		true
	},
	battlepass_task_quickfinish2 = {
		633407,
		224,
		true
	},
	battlepass_task_quickfinish3 = {
		633631,
		102,
		true
	},
	cruise_task_unlock = {
		633733,
		107,
		true
	},
	cruise_task_week = {
		633840,
		87,
		true
	},
	battlepass_pay_timelimit = {
		633927,
		101,
		true
	},
	battlepass_pay_acquire = {
		634028,
		101,
		true
	},
	battlepass_pay_attention = {
		634129,
		159,
		true
	},
	battlepass_acquire_attention = {
		634288,
		189,
		true
	},
	battlepass_pay_tip = {
		634477,
		121,
		true
	},
	battlepass_main_tip1 = {
		634598,
		226,
		true
	},
	battlepass_main_tip2 = {
		634824,
		209,
		true
	},
	battlepass_main_tip3 = {
		635033,
		215,
		true
	},
	battlepass_complete = {
		635248,
		121,
		true
	},
	shop_free_tag = {
		635369,
		81,
		true
	},
	quick_equip_tip1 = {
		635450,
		86,
		true
	},
	quick_equip_tip2 = {
		635536,
		86,
		true
	},
	quick_equip_tip3 = {
		635622,
		85,
		true
	},
	quick_equip_tip4 = {
		635707,
		97,
		true
	},
	quick_equip_tip5 = {
		635804,
		127,
		true
	},
	quick_equip_tip6 = {
		635931,
		184,
		true
	},
	retire_importantequipment_tips = {
		636115,
		179,
		true
	},
	settle_rewards_title = {
		636294,
		109,
		true
	},
	settle_rewards_subtitle = {
		636403,
		101,
		true
	},
	total_rewards_subtitle = {
		636504,
		99,
		true
	},
	settle_rewards_text = {
		636603,
		99,
		true
	},
	use_oil_limit_help = {
		636702,
		243,
		true
	},
	formationScene_use_oil_limit_tip = {
		636945,
		107,
		true
	},
	index_awakening2 = {
		637052,
		93,
		true
	},
	index_upgrade = {
		637145,
		91,
		true
	},
	formationScene_use_oil_limit_enemy = {
		637236,
		104,
		true
	},
	formationScene_use_oil_limit_flagship = {
		637340,
		109,
		true
	},
	formationScene_use_oil_limit_submarine = {
		637449,
		104,
		true
	},
	formationScene_use_oil_limit_surface = {
		637553,
		107,
		true
	},
	formationScene_use_oil_limit_tip_worldboss = {
		637660,
		117,
		true
	},
	attr_durability = {
		637777,
		81,
		true
	},
	attr_armor = {
		637858,
		79,
		true
	},
	attr_reload = {
		637937,
		78,
		true
	},
	attr_cannon = {
		638015,
		77,
		true
	},
	attr_torpedo = {
		638092,
		79,
		true
	},
	attr_motion = {
		638171,
		78,
		true
	},
	attr_antiaircraft = {
		638249,
		83,
		true
	},
	attr_air = {
		638332,
		75,
		true
	},
	attr_hit = {
		638407,
		75,
		true
	},
	attr_antisub = {
		638482,
		79,
		true
	},
	attr_oxy_max = {
		638561,
		79,
		true
	},
	attr_ammo = {
		638640,
		76,
		true
	},
	attr_hunting_range = {
		638716,
		85,
		true
	},
	attr_luck = {
		638801,
		76,
		true
	},
	attr_consume = {
		638877,
		80,
		true
	},
	attr_speed = {
		638957,
		77,
		true
	},
	monthly_card_tip = {
		639034,
		80,
		true
	},
	shopping_error_time_limit = {
		639114,
		138,
		true
	},
	world_total_power = {
		639252,
		86,
		true
	},
	world_mileage = {
		639338,
		91,
		true
	},
	world_pressing = {
		639429,
		91,
		true
	},
	Settings_title_FPS = {
		639520,
		101,
		true
	},
	Settings_title_Notification = {
		639621,
		109,
		true
	},
	Settings_title_Other = {
		639730,
		97,
		true
	},
	Settings_title_LoginJP = {
		639827,
		99,
		true
	},
	Settings_title_Redeem = {
		639926,
		94,
		true
	},
	Settings_title_AdjustScr = {
		640020,
		101,
		true
	},
	Settings_title_Secpw = {
		640121,
		98,
		true
	},
	Settings_title_Secpwlimop = {
		640219,
		110,
		true
	},
	Settings_title_agreement = {
		640329,
		100,
		true
	},
	Settings_title_sound = {
		640429,
		98,
		true
	},
	Settings_title_resUpdate = {
		640527,
		103,
		true
	},
	equipment_info_change_tip = {
		640630,
		138,
		true
	},
	equipment_info_change_name_a = {
		640768,
		126,
		true
	},
	equipment_info_change_name_b = {
		640894,
		126,
		true
	},
	equipment_info_change_text_before = {
		641020,
		103,
		true
	},
	equipment_info_change_text_after = {
		641123,
		101,
		true
	},
	equipment_info_change_strengthen = {
		641224,
		277,
		true
	},
	world_boss_progress_tip_title = {
		641501,
		122,
		true
	},
	world_boss_progress_tip_desc = {
		641623,
		354,
		true
	},
	ssss_main_help = {
		641977,
		1932,
		true
	},
	mini_game_time = {
		643909,
		88,
		true
	},
	mini_game_score = {
		643997,
		85,
		true
	},
	mini_game_leave = {
		644082,
		93,
		true
	},
	mini_game_pause = {
		644175,
		96,
		true
	},
	mini_game_cur_score = {
		644271,
		97,
		true
	},
	mini_game_high_score = {
		644368,
		95,
		true
	},
	monopoly_world_tip1 = {
		644463,
		96,
		true
	},
	monopoly_world_tip2 = {
		644559,
		237,
		true
	},
	monopoly_world_tip3 = {
		644796,
		212,
		true
	},
	help_monopoly_world = {
		645008,
		1414,
		true
	},
	ssssmedal_tip = {
		646422,
		142,
		true
	},
	ssssmedal_name = {
		646564,
		107,
		true
	},
	ssssmedal_belonging = {
		646671,
		112,
		true
	},
	ssssmedal_name1 = {
		646783,
		108,
		true
	},
	ssssmedal_name2 = {
		646891,
		105,
		true
	},
	ssssmedal_name3 = {
		646996,
		107,
		true
	},
	ssssmedal_name4 = {
		647103,
		109,
		true
	},
	ssssmedal_name5 = {
		647212,
		109,
		true
	},
	ssssmedal_name6 = {
		647321,
		85,
		true
	},
	ssssmedal_belonging1 = {
		647406,
		92,
		true
	},
	ssssmedal_belonging2 = {
		647498,
		99,
		true
	},
	ssssmedal_desc1 = {
		647597,
		168,
		true
	},
	ssssmedal_desc2 = {
		647765,
		158,
		true
	},
	ssssmedal_desc3 = {
		647923,
		168,
		true
	},
	ssssmedal_desc4 = {
		648091,
		155,
		true
	},
	ssssmedal_desc5 = {
		648246,
		180,
		true
	},
	ssssmedal_desc6 = {
		648426,
		131,
		true
	},
	show_fate_demand_count = {
		648557,
		154,
		true
	},
	show_design_demand_count = {
		648711,
		151,
		true
	},
	blueprint_select_overflow = {
		648862,
		124,
		true
	},
	blueprint_select_overflow_tip = {
		648986,
		188,
		true
	},
	blueprint_exchange_empty_tip = {
		649174,
		131,
		true
	},
	blueprint_exchange_select_display = {
		649305,
		128,
		true
	},
	build_rate_title = {
		649433,
		91,
		true
	},
	build_pools_intro = {
		649524,
		116,
		true
	},
	build_detail_intro = {
		649640,
		106,
		true
	},
	ssss_game_tip = {
		649746,
		1498,
		true
	},
	ssss_medal_tip = {
		651244,
		401,
		true
	},
	battlepass_main_tip_2112 = {
		651645,
		233,
		true
	},
	battlepass_main_help_2112 = {
		651878,
		2887,
		true
	},
	cruise_task_help_2112 = {
		654765,
		1085,
		true
	},
	littleSanDiego_npc = {
		655850,
		1223,
		true
	},
	tag_ship_unlocked = {
		657073,
		95,
		true
	},
	tag_ship_locked = {
		657168,
		91,
		true
	},
	acceleration_tips_1 = {
		657259,
		203,
		true
	},
	acceleration_tips_2 = {
		657462,
		228,
		true
	},
	noacceleration_tips = {
		657690,
		119,
		true
	},
	word_shipskin = {
		657809,
		82,
		true
	},
	settings_sound_title_bgm = {
		657891,
		99,
		true
	},
	settings_sound_title_effct = {
		657990,
		101,
		true
	},
	settings_sound_title_cv = {
		658091,
		100,
		true
	},
	setting_resdownload_title_gallery = {
		658191,
		111,
		true
	},
	setting_resdownload_title_live2d = {
		658302,
		109,
		true
	},
	setting_resdownload_title_music = {
		658411,
		105,
		true
	},
	setting_resdownload_title_sound = {
		658516,
		108,
		true
	},
	setting_resdownload_title_manga = {
		658624,
		108,
		true
	},
	setting_resdownload_title_dorm = {
		658732,
		115,
		true
	},
	setting_resdownload_title_main_group = {
		658847,
		117,
		true
	},
	settings_battle_title = {
		658964,
		103,
		true
	},
	settings_battle_tip = {
		659067,
		144,
		true
	},
	settings_battle_Btn_edit = {
		659211,
		92,
		true
	},
	settings_battle_Btn_reset = {
		659303,
		96,
		true
	},
	settings_battle_Btn_save = {
		659399,
		92,
		true
	},
	settings_battle_Btn_cancel = {
		659491,
		96,
		true
	},
	settings_pwd_label_close = {
		659587,
		96,
		true
	},
	settings_pwd_label_open = {
		659683,
		94,
		true
	},
	word_frame = {
		659777,
		78,
		true
	},
	Settings_title_Redeem_input_label = {
		659855,
		109,
		true
	},
	Settings_title_Redeem_input_submit = {
		659964,
		104,
		true
	},
	Settings_title_Redeem_input_placeholder = {
		660068,
		140,
		true
	},
	CurlingGame_tips1 = {
		660208,
		1153,
		true
	},
	maid_task_tips1 = {
		661361,
		1030,
		true
	},
	shop_diamond_title = {
		662391,
		86,
		true
	},
	shop_gift_title = {
		662477,
		84,
		true
	},
	shop_item_title = {
		662561,
		84,
		true
	},
	shop_charge_level_limit = {
		662645,
		102,
		true
	},
	backhill_cantupbuilding = {
		662747,
		135,
		true
	},
	pray_cant_tips = {
		662882,
		133,
		true
	},
	help_xinnian2022_feast = {
		663015,
		2200,
		true
	},
	Pray_activity_tips1 = {
		665215,
		1560,
		true
	},
	backhill_notenoughbuilding = {
		666775,
		184,
		true
	},
	help_xinnian2022_z28 = {
		666959,
		766,
		true
	},
	help_xinnian2022_firework = {
		667725,
		1156,
		true
	},
	settings_title_account_del = {
		668881,
		97,
		true
	},
	settings_text_account_del = {
		668978,
		105,
		true
	},
	settings_text_account_del_desc = {
		669083,
		290,
		true
	},
	settings_text_account_del_confirm = {
		669373,
		150,
		true
	},
	settings_text_account_del_btn = {
		669523,
		99,
		true
	},
	box_account_del_input = {
		669622,
		142,
		true
	},
	box_account_del_target = {
		669764,
		92,
		true
	},
	box_account_del_click = {
		669856,
		100,
		true
	},
	box_account_del_success_content = {
		669956,
		131,
		true
	},
	box_account_reborn_content = {
		670087,
		211,
		true
	},
	tip_account_del_dismatch = {
		670298,
		120,
		true
	},
	tip_account_del_reborn = {
		670418,
		135,
		true
	},
	player_manifesto_placeholder = {
		670553,
		110,
		true
	},
	box_ship_del_click = {
		670663,
		95,
		true
	},
	box_equipment_del_click = {
		670758,
		100,
		true
	},
	change_player_name_title = {
		670858,
		103,
		true
	},
	change_player_name_subtitle = {
		670961,
		111,
		true
	},
	change_player_name_input_tip = {
		671072,
		112,
		true
	},
	change_player_name_illegal = {
		671184,
		241,
		true
	},
	nodisplay_player_home_name = {
		671425,
		94,
		true
	},
	nodisplay_player_home_share = {
		671519,
		97,
		true
	},
	tactics_class_start = {
		671616,
		88,
		true
	},
	tactics_class_cancel = {
		671704,
		90,
		true
	},
	tactics_class_get_exp = {
		671794,
		94,
		true
	},
	tactics_class_spend_time = {
		671888,
		99,
		true
	},
	build_ticket_description = {
		671987,
		118,
		true
	},
	build_ticket_expire_warning = {
		672105,
		103,
		true
	},
	tip_build_ticket_expired = {
		672208,
		135,
		true
	},
	tip_build_ticket_exchange_expired = {
		672343,
		174,
		true
	},
	tip_build_ticket_not_enough = {
		672517,
		107,
		true
	},
	build_ship_tip_use_ticket = {
		672624,
		195,
		true
	},
	springfes_tips1 = {
		672819,
		907,
		true
	},
	worldinpicture_tavel_point_tip = {
		673726,
		126,
		true
	},
	worldinpicture_draw_point_tip = {
		673852,
		122,
		true
	},
	worldinpicture_help = {
		673974,
		1037,
		true
	},
	worldinpicture_task_help = {
		675011,
		1042,
		true
	},
	worldinpicture_not_area_can_draw = {
		676053,
		135,
		true
	},
	missile_attack_area_confirm = {
		676188,
		104,
		true
	},
	missile_attack_area_cancel = {
		676292,
		103,
		true
	},
	shipchange_alert_infleet = {
		676395,
		157,
		true
	},
	shipchange_alert_inpvp = {
		676552,
		168,
		true
	},
	shipchange_alert_inexercise = {
		676720,
		174,
		true
	},
	shipchange_alert_inworld = {
		676894,
		168,
		true
	},
	shipchange_alert_inguildbossevent = {
		677062,
		177,
		true
	},
	shipchange_alert_indiff = {
		677239,
		156,
		true
	},
	shipmodechange_reject_1stfleet_only = {
		677395,
		210,
		true
	},
	shipmodechange_reject_worldfleet_only = {
		677605,
		215,
		true
	},
	monopoly3thre_tip = {
		677820,
		151,
		true
	},
	fushun_game3_tip = {
		677971,
		1291,
		true
	},
	battlepass_main_tip_2202 = {
		679262,
		197,
		true
	},
	battlepass_main_help_2202 = {
		679459,
		2890,
		true
	},
	cruise_task_help_2202 = {
		682349,
		1092,
		true
	},
	battlepass_main_tip_2204 = {
		683441,
		200,
		true
	},
	battlepass_main_help_2204 = {
		683641,
		2881,
		true
	},
	cruise_task_help_2204 = {
		686522,
		1092,
		true
	},
	battlepass_main_tip_2206 = {
		687614,
		200,
		true
	},
	battlepass_main_help_2206 = {
		687814,
		2889,
		true
	},
	cruise_task_help_2206 = {
		690703,
		1092,
		true
	},
	battlepass_main_tip_2208 = {
		691795,
		199,
		true
	},
	battlepass_main_help_2208 = {
		691994,
		2893,
		true
	},
	cruise_task_help_2208 = {
		694887,
		1092,
		true
	},
	battlepass_main_tip_2210 = {
		695979,
		201,
		true
	},
	battlepass_main_help_2210 = {
		696180,
		2893,
		true
	},
	cruise_task_help_2210 = {
		699073,
		1092,
		true
	},
	battlepass_main_tip_2212 = {
		700165,
		224,
		true
	},
	battlepass_main_help_2212 = {
		700389,
		2900,
		true
	},
	cruise_task_help_2212 = {
		703289,
		1092,
		true
	},
	battlepass_main_tip_2302 = {
		704381,
		225,
		true
	},
	battlepass_main_help_2302 = {
		704606,
		2895,
		true
	},
	cruise_task_help_2302 = {
		707501,
		1092,
		true
	},
	battlepass_main_tip_2304 = {
		708593,
		233,
		true
	},
	battlepass_main_help_2304 = {
		708826,
		2913,
		true
	},
	cruise_task_help_2304 = {
		711739,
		1092,
		true
	},
	battlepass_main_tip_2306 = {
		712831,
		195,
		true
	},
	battlepass_main_help_2306 = {
		713026,
		2883,
		true
	},
	cruise_task_help_2306 = {
		715909,
		1092,
		true
	},
	battlepass_main_tip_2308 = {
		717001,
		197,
		true
	},
	battlepass_main_help_2308 = {
		717198,
		2885,
		true
	},
	cruise_task_help_2308 = {
		720083,
		1092,
		true
	},
	battlepass_main_tip_2310 = {
		721175,
		200,
		true
	},
	battlepass_main_help_2310 = {
		721375,
		2893,
		true
	},
	cruise_task_help_2310 = {
		724268,
		1092,
		true
	},
	battlepass_main_tip_2312 = {
		725360,
		196,
		true
	},
	battlepass_main_help_2312 = {
		725556,
		2898,
		true
	},
	cruise_task_help_2312 = {
		728454,
		1092,
		true
	},
	battlepass_main_tip_2402 = {
		729546,
		197,
		true
	},
	battlepass_main_help_2402 = {
		729743,
		2891,
		true
	},
	cruise_task_help_2402 = {
		732634,
		1092,
		true
	},
	battlepass_main_tip_2404 = {
		733726,
		223,
		true
	},
	battlepass_main_help_2404 = {
		733949,
		2901,
		true
	},
	cruise_task_help_2404 = {
		736850,
		1096,
		true
	},
	attrset_reset = {
		737946,
		82,
		true
	},
	attrset_save = {
		738028,
		80,
		true
	},
	attrset_ask_save = {
		738108,
		133,
		true
	},
	attrset_save_success = {
		738241,
		103,
		true
	},
	attrset_disable = {
		738344,
		147,
		true
	},
	attrset_input_ill = {
		738491,
		93,
		true
	},
	blackfriday_help = {
		738584,
		805,
		true
	},
	eventshop_time_hint = {
		739389,
		100,
		true
	},
	purchase_backyard_theme_desc_for_onekey = {
		739489,
		142,
		true
	},
	purchase_backyard_theme_desc_for_all = {
		739631,
		127,
		true
	},
	sp_no_quota = {
		739758,
		108,
		true
	},
	fur_all_buy = {
		739866,
		82,
		true
	},
	fur_onekey_buy = {
		739948,
		85,
		true
	},
	littleRenown_npc = {
		740033,
		1402,
		true
	},
	tech_package_tip = {
		741435,
		241,
		true
	},
	backyard_food_shop_tip = {
		741676,
		96,
		true
	},
	dorm_2f_lock = {
		741772,
		82,
		true
	},
	word_get_way = {
		741854,
		90,
		true
	},
	word_get_date = {
		741944,
		94,
		true
	},
	enter_theme_name = {
		742038,
		113,
		true
	},
	enter_extend_food_label = {
		742151,
		93,
		true
	},
	backyard_extend_tip_1 = {
		742244,
		90,
		true
	},
	backyard_extend_tip_2 = {
		742334,
		103,
		true
	},
	backyard_extend_tip_3 = {
		742437,
		94,
		true
	},
	backyard_extend_tip_4 = {
		742531,
		85,
		true
	},
	email_text = {
		742616,
		79,
		true
	},
	emailhold_text = {
		742695,
		127,
		true
	},
	code_text = {
		742822,
		90,
		true
	},
	codehold_text = {
		742912,
		102,
		true
	},
	genBtn_text = {
		743014,
		83,
		true
	},
	desc_text = {
		743097,
		156,
		true
	},
	loginBtn_text = {
		743253,
		84,
		true
	},
	verification_code_req_tip1 = {
		743337,
		126,
		true
	},
	verification_code_req_tip2 = {
		743463,
		175,
		true
	},
	verification_code_req_tip3 = {
		743638,
		134,
		true
	},
	levelScene_remaster_story_tip = {
		743772,
		176,
		true
	},
	levelScene_remaster_unlock_tip = {
		743948,
		188,
		true
	},
	linkBtn_text = {
		744136,
		83,
		true
	},
	yostar_link_title = {
		744219,
		98,
		true
	},
	level_remaster_tip1 = {
		744317,
		95,
		true
	},
	level_remaster_tip2 = {
		744412,
		89,
		true
	},
	level_remaster_tip3 = {
		744501,
		90,
		true
	},
	level_remaster_tip4 = {
		744591,
		102,
		true
	},
	pay_cancel = {
		744693,
		88,
		true
	},
	order_error = {
		744781,
		101,
		true
	},
	pay_fail = {
		744882,
		86,
		true
	},
	user_cancel = {
		744968,
		94,
		true
	},
	system_error = {
		745062,
		88,
		true
	},
	time_out = {
		745150,
		109,
		true
	},
	server_error = {
		745259,
		102,
		true
	},
	data_error = {
		745361,
		98,
		true
	},
	share_success = {
		745459,
		97,
		true
	},
	shoot_screen_fail = {
		745556,
		98,
		true
	},
	server_name = {
		745654,
		87,
		true
	},
	non_support_share = {
		745741,
		134,
		true
	},
	save_success = {
		745875,
		99,
		true
	},
	word_guild_join_err1 = {
		745974,
		115,
		true
	},
	task_empty_tip_1 = {
		746089,
		104,
		true
	},
	task_empty_tip_2 = {
		746193,
		160,
		true
	},
	["airi_error_code_ 100210"] = {
		746353,
		126,
		true
	},
	["airi_error_code_ 100211"] = {
		746479,
		138,
		true
	},
	["airi_error_code_ 100212"] = {
		746617,
		116,
		true
	},
	["airi_error_code_ 100610"] = {
		746733,
		125,
		true
	},
	["airi_error_code_ 100611"] = {
		746858,
		120,
		true
	},
	["airi_error_code_ 100612"] = {
		746978,
		132,
		true
	},
	["airi_error_code_ 100710"] = {
		747110,
		127,
		true
	},
	["airi_error_code_ 100711"] = {
		747237,
		127,
		true
	},
	["airi_error_code_ 100712"] = {
		747364,
		135,
		true
	},
	["airi_error_code_ 100810"] = {
		747499,
		126,
		true
	},
	["airi_error_code_ 100811"] = {
		747625,
		138,
		true
	},
	["airi_error_code_ 100812"] = {
		747763,
		133,
		true
	},
	["airi_error_code_ 100813"] = {
		747896,
		125,
		true
	},
	["airi_error_code_ 100814"] = {
		748021,
		120,
		true
	},
	["airi_error_code_ 100815"] = {
		748141,
		132,
		true
	},
	["airi_error_code_ 100816"] = {
		748273,
		127,
		true
	},
	["airi_error_code_ 100817"] = {
		748400,
		127,
		true
	},
	["airi_error_code_ 100818"] = {
		748527,
		134,
		true
	},
	facebook_link_title = {
		748661,
		102,
		true
	},
	newserver_time = {
		748763,
		98,
		true
	},
	newserver_soldout = {
		748861,
		103,
		true
	},
	skill_learn_tip = {
		748964,
		133,
		true
	},
	newserver_build_tip = {
		749097,
		150,
		true
	},
	build_count_tip = {
		749247,
		85,
		true
	},
	help_research_package = {
		749332,
		299,
		true
	},
	lv70_package_tip = {
		749631,
		228,
		true
	},
	tech_select_tip1 = {
		749859,
		97,
		true
	},
	tech_select_tip2 = {
		749956,
		107,
		true
	},
	tech_select_tip3 = {
		750063,
		88,
		true
	},
	tech_select_tip4 = {
		750151,
		96,
		true
	},
	tech_select_tip5 = {
		750247,
		117,
		true
	},
	techpackage_item_use = {
		750364,
		203,
		true
	},
	techpackage_item_use_1 = {
		750567,
		238,
		true
	},
	techpackage_item_use_2 = {
		750805,
		200,
		true
	},
	techpackage_item_use_confirm = {
		751005,
		138,
		true
	},
	new_server_shop_sel_goods_tip = {
		751143,
		130,
		true
	},
	new_server_shop_unopen_tip = {
		751273,
		101,
		true
	},
	newserver_activity_tip = {
		751374,
		1685,
		true
	},
	newserver_shop_timelimit = {
		753059,
		106,
		true
	},
	tech_character_get = {
		753165,
		89,
		true
	},
	package_detail_tip = {
		753254,
		88,
		true
	},
	event_ui_consume = {
		753342,
		84,
		true
	},
	event_ui_recommend = {
		753426,
		91,
		true
	},
	event_ui_start = {
		753517,
		83,
		true
	},
	event_ui_giveup = {
		753600,
		85,
		true
	},
	event_ui_finish = {
		753685,
		87,
		true
	},
	nav_tactics_sel_skill_title = {
		753772,
		103,
		true
	},
	battle_result_confirm = {
		753875,
		92,
		true
	},
	battle_result_targets = {
		753967,
		92,
		true
	},
	battle_result_continue = {
		754059,
		103,
		true
	},
	index_L2D = {
		754162,
		76,
		true
	},
	index_DBG = {
		754238,
		84,
		true
	},
	index_BG = {
		754322,
		82,
		true
	},
	index_CANTUSE = {
		754404,
		91,
		true
	},
	index_UNUSE = {
		754495,
		81,
		true
	},
	index_BGM = {
		754576,
		84,
		true
	},
	without_ship_to_wear = {
		754660,
		124,
		true
	},
	choose_ship_to_wear_this_skin = {
		754784,
		136,
		true
	},
	skinatlas_search_holder = {
		754920,
		113,
		true
	},
	skinatlas_search_result_is_empty = {
		755033,
		143,
		true
	},
	chang_ship_skin_window_title = {
		755176,
		96,
		true
	},
	world_boss_item_info = {
		755272,
		350,
		true
	},
	world_past_boss_item_info = {
		755622,
		480,
		true
	},
	world_boss_lefttime = {
		756102,
		92,
		true
	},
	world_boss_item_count_noenough = {
		756194,
		145,
		true
	},
	world_boss_item_usage_tip = {
		756339,
		173,
		true
	},
	world_boss_no_select_archives = {
		756512,
		161,
		true
	},
	world_boss_archives_item_count_noenough = {
		756673,
		157,
		true
	},
	world_boss_archives_are_clear = {
		756830,
		156,
		true
	},
	world_boss_switch_archives = {
		756986,
		248,
		true
	},
	world_boss_switch_archives_success = {
		757234,
		146,
		true
	},
	world_boss_archives_auto_battle_unopen = {
		757380,
		169,
		true
	},
	world_boss_archives_need_stop_auto_battle = {
		757549,
		164,
		true
	},
	world_boss_archives_stop_auto_battle = {
		757713,
		137,
		true
	},
	world_boss_archives_continue_auto_battle = {
		757850,
		140,
		true
	},
	world_boss_archives_auto_battle_reusle_title = {
		757990,
		145,
		true
	},
	world_boss_archives_stop_auto_battle_title = {
		758135,
		146,
		true
	},
	world_boss_archives_stop_auto_battle_tip = {
		758281,
		119,
		true
	},
	world_boss_archives_stop_auto_battle_tip1 = {
		758400,
		241,
		true
	},
	world_archives_boss_help = {
		758641,
		3343,
		true
	},
	world_archives_boss_list_help = {
		761984,
		570,
		true
	},
	archives_boss_was_opened = {
		762554,
		163,
		true
	},
	current_boss_was_opened = {
		762717,
		162,
		true
	},
	world_boss_title_auto_battle = {
		762879,
		103,
		true
	},
	world_boss_title_highest_damge = {
		762982,
		105,
		true
	},
	world_boss_title_estimation = {
		763087,
		113,
		true
	},
	world_boss_title_battle_cnt = {
		763200,
		99,
		true
	},
	world_boss_title_consume_oil_cnt = {
		763299,
		104,
		true
	},
	world_boss_title_spend_time = {
		763403,
		104,
		true
	},
	world_boss_title_total_damage = {
		763507,
		102,
		true
	},
	world_no_time_to_auto_battle = {
		763609,
		143,
		true
	},
	world_boss_current_boss_label = {
		763752,
		104,
		true
	},
	world_boss_current_boss_label1 = {
		763856,
		107,
		true
	},
	world_boss_archives_boss_tip = {
		763963,
		158,
		true
	},
	world_boss_progress_no_enough = {
		764121,
		127,
		true
	},
	world_boss_auto_battle_no_oil = {
		764248,
		119,
		true
	},
	meta_syn_value_label = {
		764367,
		108,
		true
	},
	meta_syn_finish = {
		764475,
		103,
		true
	},
	index_meta_repair = {
		764578,
		104,
		true
	},
	index_meta_tactics = {
		764682,
		103,
		true
	},
	index_meta_energy = {
		764785,
		104,
		true
	},
	tactics_continue_to_learn_other_skill = {
		764889,
		162,
		true
	},
	tactics_continue_to_learn_other_ship_skill = {
		765051,
		161,
		true
	},
	tactics_no_recent_ships = {
		765212,
		113,
		true
	},
	activity_kill = {
		765325,
		95,
		true
	},
	battle_result_dmg = {
		765420,
		87,
		true
	},
	battle_result_kill_count = {
		765507,
		100,
		true
	},
	battle_result_toggle_on = {
		765607,
		96,
		true
	},
	battle_result_toggle_off = {
		765703,
		101,
		true
	},
	battle_result_continue_battle = {
		765804,
		101,
		true
	},
	battle_result_quit_battle = {
		765905,
		96,
		true
	},
	battle_result_share_battle = {
		766001,
		95,
		true
	},
	pre_combat_team = {
		766096,
		91,
		true
	},
	pre_combat_vanguard = {
		766187,
		91,
		true
	},
	pre_combat_main = {
		766278,
		83,
		true
	},
	pre_combat_submarine = {
		766361,
		93,
		true
	},
	pre_combat_targets = {
		766454,
		89,
		true
	},
	pre_combat_atlasloot = {
		766543,
		88,
		true
	},
	destroy_confirm_access = {
		766631,
		93,
		true
	},
	destroy_confirm_cancel = {
		766724,
		92,
		true
	},
	pt_count_tip = {
		766816,
		81,
		true
	},
	dockyard_data_loss_detected = {
		766897,
		167,
		true
	},
	littleEugen_npc = {
		767064,
		1374,
		true
	},
	five_shujuhuigu = {
		768438,
		121,
		true
	},
	five_shujuhuigu1 = {
		768559,
		89,
		true
	},
	littleChaijun_npc = {
		768648,
		1290,
		true
	},
	five_qingdian = {
		769938,
		622,
		true
	},
	friend_resume_title_detail = {
		770560,
		94,
		true
	},
	item_type13_tip1 = {
		770654,
		88,
		true
	},
	item_type13_tip2 = {
		770742,
		88,
		true
	},
	item_type16_tip1 = {
		770830,
		88,
		true
	},
	item_type16_tip2 = {
		770918,
		88,
		true
	},
	item_type17_tip1 = {
		771006,
		87,
		true
	},
	item_type17_tip2 = {
		771093,
		87,
		true
	},
	five_duomaomao = {
		771180,
		788,
		true
	},
	main_4 = {
		771968,
		75,
		true
	},
	main_5 = {
		772043,
		75,
		true
	},
	honor_medal_support_tips_display = {
		772118,
		460,
		true
	},
	honor_medal_support_tips_confirm = {
		772578,
		207,
		true
	},
	support_rate_title = {
		772785,
		87,
		true
	},
	support_times_limited = {
		772872,
		128,
		true
	},
	support_times_tip = {
		773000,
		95,
		true
	},
	build_times_tip = {
		773095,
		90,
		true
	},
	tactics_recent_ship_label = {
		773185,
		105,
		true
	},
	title_info = {
		773290,
		78,
		true
	},
	eventshop_unlock_info = {
		773368,
		93,
		true
	},
	eventshop_unlock_hint = {
		773461,
		142,
		true
	},
	commission_event_tip = {
		773603,
		818,
		true
	},
	decoration_medal_placeholder = {
		774421,
		122,
		true
	},
	technology_filter_placeholder = {
		774543,
		119,
		true
	},
	eva_comment_send_null = {
		774662,
		101,
		true
	},
	report_sent_thank = {
		774763,
		156,
		true
	},
	report_ship_cannot_comment = {
		774919,
		127,
		true
	},
	report_cannot_comment = {
		775046,
		137,
		true
	},
	report_sent_title = {
		775183,
		87,
		true
	},
	report_sent_desc = {
		775270,
		130,
		true
	},
	report_type_1 = {
		775400,
		98,
		true
	},
	report_type_1_1 = {
		775498,
		146,
		true
	},
	report_type_2 = {
		775644,
		94,
		true
	},
	report_type_2_1 = {
		775738,
		146,
		true
	},
	report_type_3 = {
		775884,
		88,
		true
	},
	report_type_3_1 = {
		775972,
		177,
		true
	},
	report_type_other = {
		776149,
		85,
		true
	},
	report_type_other_1 = {
		776234,
		145,
		true
	},
	report_type_other_2 = {
		776379,
		115,
		true
	},
	report_sent_help = {
		776494,
		440,
		true
	},
	rename_input = {
		776934,
		93,
		true
	},
	avatar_task_level = {
		777027,
		169,
		true
	},
	avatar_upgrad_1 = {
		777196,
		92,
		true
	},
	avatar_upgrad_2 = {
		777288,
		92,
		true
	},
	avatar_upgrad_3 = {
		777380,
		94,
		true
	},
	avatar_task_ship_1 = {
		777474,
		92,
		true
	},
	avatar_task_ship_2 = {
		777566,
		103,
		true
	},
	technology_queue_complete = {
		777669,
		97,
		true
	},
	technology_queue_processing = {
		777766,
		102,
		true
	},
	technology_queue_waiting = {
		777868,
		94,
		true
	},
	technology_queue_getaward = {
		777962,
		94,
		true
	},
	technology_daily_refresh = {
		778056,
		119,
		true
	},
	technology_queue_full = {
		778175,
		113,
		true
	},
	technology_queue_in_mission_incomplete = {
		778288,
		177,
		true
	},
	technology_consume = {
		778465,
		95,
		true
	},
	technology_request = {
		778560,
		103,
		true
	},
	technology_queue_in_doublecheck = {
		778663,
		242,
		true
	},
	playervtae_setting_btn_label = {
		778905,
		100,
		true
	},
	technology_queue_in_success = {
		779005,
		130,
		true
	},
	star_require_enemy_text = {
		779135,
		116,
		true
	},
	star_require_enemy_title = {
		779251,
		107,
		true
	},
	star_require_enemy_check = {
		779358,
		95,
		true
	},
	worldboss_rank_timer_label = {
		779453,
		116,
		true
	},
	technology_detail = {
		779569,
		88,
		true
	},
	technology_mission_unfinish = {
		779657,
		127,
		true
	},
	word_chinese = {
		779784,
		82,
		true
	},
	word_japanese_2 = {
		779866,
		80,
		true
	},
	word_japanese = {
		779946,
		78,
		true
	},
	avatarframe_got = {
		780024,
		84,
		true
	},
	item_is_max_cnt = {
		780108,
		110,
		true
	},
	level_fleet_ship_desc = {
		780218,
		103,
		true
	},
	level_fleet_sub_desc = {
		780321,
		95,
		true
	},
	summerland_tip = {
		780416,
		560,
		true
	},
	icecreamgame_tip = {
		780976,
		1578,
		true
	},
	unlock_date_tip = {
		782554,
		118,
		true
	},
	guild_duty_shoule_be_deputy_commander = {
		782672,
		164,
		true
	},
	guild_deputy_commander_cnt_is_full = {
		782836,
		154,
		true
	},
	guild_deputy_commander_cnt = {
		782990,
		153,
		true
	},
	mail_filter_placeholder = {
		783143,
		107,
		true
	},
	recently_sticker_placeholder = {
		783250,
		111,
		true
	},
	backhill_campusfestival_tip = {
		783361,
		1219,
		true
	},
	mini_cookgametip = {
		784580,
		1297,
		true
	},
	cook_game_Albacore = {
		785877,
		115,
		true
	},
	cook_game_august = {
		785992,
		109,
		true
	},
	cook_game_elbe = {
		786101,
		107,
		true
	},
	cook_game_hakuryu = {
		786208,
		125,
		true
	},
	cook_game_howe = {
		786333,
		140,
		true
	},
	cook_game_marcopolo = {
		786473,
		114,
		true
	},
	cook_game_noshiro = {
		786587,
		126,
		true
	},
	cook_game_pnelope = {
		786713,
		130,
		true
	},
	cook_game_laffey = {
		786843,
		171,
		true
	},
	cook_game_janus = {
		787014,
		150,
		true
	},
	cook_game_flandre = {
		787164,
		100,
		true
	},
	cook_game_constellation = {
		787264,
		187,
		true
	},
	cook_game_constellation_skill_name = {
		787451,
		134,
		true
	},
	cook_game_constellation_skill_desc = {
		787585,
		206,
		true
	},
	random_ship_on = {
		787791,
		127,
		true
	},
	random_ship_off_0 = {
		787918,
		181,
		true
	},
	random_ship_off = {
		788099,
		190,
		true
	},
	random_ship_forbidden = {
		788289,
		174,
		true
	},
	random_ship_now = {
		788463,
		97,
		true
	},
	random_ship_label = {
		788560,
		97,
		true
	},
	player_vitae_skin_setting = {
		788657,
		102,
		true
	},
	random_ship_tips1 = {
		788759,
		167,
		true
	},
	random_ship_tips2 = {
		788926,
		145,
		true
	},
	random_ship_before = {
		789071,
		113,
		true
	},
	random_ship_and_skin_title = {
		789184,
		101,
		true
	},
	random_ship_frequse_mode = {
		789285,
		102,
		true
	},
	random_ship_locked_mode = {
		789387,
		99,
		true
	},
	littleSpee_npc = {
		789486,
		1583,
		true
	},
	random_flag_ship = {
		791069,
		96,
		true
	},
	random_flag_ship_changskinBtn_label = {
		791165,
		111,
		true
	},
	expedition_drop_use_out = {
		791276,
		152,
		true
	},
	expedition_extra_drop_tip = {
		791428,
		104,
		true
	},
	ex_pass_use = {
		791532,
		79,
		true
	},
	defense_formation_tip_npc = {
		791611,
		203,
		true
	},
	pgs_login_tip = {
		791814,
		250,
		true
	},
	pgs_login_binding_exist1 = {
		792064,
		204,
		true
	},
	pgs_login_binding_exist2 = {
		792268,
		205,
		true
	},
	pgs_login_binding_exist3 = {
		792473,
		271,
		true
	},
	pgs_binding_account = {
		792744,
		108,
		true
	},
	pgs_unbind = {
		792852,
		92,
		true
	},
	pgs_unbind_tip1 = {
		792944,
		152,
		true
	},
	pgs_unbind_tip2 = {
		793096,
		214,
		true
	},
	word_item = {
		793310,
		77,
		true
	},
	word_tool = {
		793387,
		77,
		true
	},
	word_other = {
		793464,
		78,
		true
	},
	ryza_word_equip = {
		793542,
		83,
		true
	},
	ryza_rest_produce_count = {
		793625,
		109,
		true
	},
	ryza_composite_confirm = {
		793734,
		119,
		true
	},
	ryza_composite_confirm_single = {
		793853,
		122,
		true
	},
	ryza_composite_count = {
		793975,
		93,
		true
	},
	ryza_toggle_only_composite = {
		794068,
		112,
		true
	},
	ryza_tip_select_recipe = {
		794180,
		113,
		true
	},
	ryza_tip_put_materials = {
		794293,
		139,
		true
	},
	ryza_tip_composite_unlock = {
		794432,
		158,
		true
	},
	ryza_tip_unlock_all_tools = {
		794590,
		151,
		true
	},
	ryza_material_not_enough = {
		794741,
		168,
		true
	},
	ryza_tip_composite_invalid = {
		794909,
		132,
		true
	},
	ryza_tip_max_composite_count = {
		795041,
		136,
		true
	},
	ryza_tip_no_item = {
		795177,
		119,
		true
	},
	ryza_ui_show_acess = {
		795296,
		92,
		true
	},
	ryza_tip_no_recipe = {
		795388,
		103,
		true
	},
	ryza_tip_item_access = {
		795491,
		136,
		true
	},
	ryza_tip_control_buff_not_obtain_tip = {
		795627,
		143,
		true
	},
	ryza_tip_control_buff_upgrade = {
		795770,
		100,
		true
	},
	ryza_tip_control_buff_replace = {
		795870,
		100,
		true
	},
	ryza_tip_control_buff_limit = {
		795970,
		96,
		true
	},
	ryza_tip_control_buff_already_active_tip = {
		796066,
		111,
		true
	},
	ryza_tip_control_buff = {
		796177,
		163,
		true
	},
	ryza_tip_control_buff_not_obtain = {
		796340,
		103,
		true
	},
	ryza_tip_control = {
		796443,
		142,
		true
	},
	ryza_tip_main = {
		796585,
		1454,
		true
	},
	battle_levelScene_ryza_lock = {
		798039,
		186,
		true
	},
	ryza_tip_toast_item_got = {
		798225,
		96,
		true
	},
	ryza_composite_help_tip = {
		798321,
		476,
		true
	},
	ryza_control_help_tip = {
		798797,
		296,
		true
	},
	ryza_mini_game = {
		799093,
		351,
		true
	},
	ryza_task_level_desc = {
		799444,
		89,
		true
	},
	ryza_task_tag_explore = {
		799533,
		90,
		true
	},
	ryza_task_tag_battle = {
		799623,
		88,
		true
	},
	ryza_task_tag_dalegate = {
		799711,
		91,
		true
	},
	ryza_task_tag_develop = {
		799802,
		89,
		true
	},
	ryza_task_tag_adventure = {
		799891,
		97,
		true
	},
	ryza_task_tag_build = {
		799988,
		93,
		true
	},
	ryza_task_tag_create = {
		800081,
		92,
		true
	},
	ryza_task_tag_daily = {
		800173,
		90,
		true
	},
	ryza_task_detail_content = {
		800263,
		99,
		true
	},
	ryza_task_detail_award = {
		800362,
		93,
		true
	},
	ryza_task_go = {
		800455,
		83,
		true
	},
	ryza_task_get = {
		800538,
		84,
		true
	},
	ryza_task_get_all = {
		800622,
		92,
		true
	},
	ryza_task_confirm = {
		800714,
		88,
		true
	},
	ryza_task_cancel = {
		800802,
		86,
		true
	},
	ryza_task_level_num = {
		800888,
		93,
		true
	},
	ryza_task_level_add = {
		800981,
		95,
		true
	},
	ryza_task_submit = {
		801076,
		86,
		true
	},
	ryza_task_detail = {
		801162,
		85,
		true
	},
	ryza_composite_words = {
		801247,
		704,
		true
	},
	ryza_task_help_tip = {
		801951,
		345,
		true
	},
	hotspring_buff = {
		802296,
		140,
		true
	},
	random_ship_custom_mode_empty = {
		802436,
		148,
		true
	},
	random_ship_custom_mode_main_button_add = {
		802584,
		106,
		true
	},
	random_ship_custom_mode_main_button_remove = {
		802690,
		112,
		true
	},
	random_ship_custom_mode_main_tip1 = {
		802802,
		151,
		true
	},
	random_ship_custom_mode_main_tip2 = {
		802953,
		107,
		true
	},
	random_ship_custom_mode_main_empty = {
		803060,
		137,
		true
	},
	random_ship_custom_mode_select_all = {
		803197,
		108,
		true
	},
	random_ship_custom_mode_add_tip1 = {
		803305,
		158,
		true
	},
	random_ship_custom_mode_select_number = {
		803463,
		110,
		true
	},
	random_ship_custom_mode_add_complete = {
		803573,
		130,
		true
	},
	random_ship_custom_mode_add_tip2 = {
		803703,
		159,
		true
	},
	random_ship_custom_mode_remove_tip1 = {
		803862,
		166,
		true
	},
	random_ship_custom_mode_remove_complete = {
		804028,
		135,
		true
	},
	random_ship_custom_mode_remove_tip2 = {
		804163,
		166,
		true
	},
	index_dressed = {
		804329,
		89,
		true
	},
	random_ship_custom_mode = {
		804418,
		110,
		true
	},
	random_ship_custom_mode_add_title = {
		804528,
		110,
		true
	},
	random_ship_custom_mode_remove_title = {
		804638,
		116,
		true
	},
	hotspring_shop_enter1 = {
		804754,
		150,
		true
	},
	hotspring_shop_enter2 = {
		804904,
		143,
		true
	},
	hotspring_shop_insufficient = {
		805047,
		189,
		true
	},
	hotspring_shop_success1 = {
		805236,
		117,
		true
	},
	hotspring_shop_success2 = {
		805353,
		103,
		true
	},
	hotspring_shop_finish = {
		805456,
		173,
		true
	},
	hotspring_shop_end = {
		805629,
		155,
		true
	},
	hotspring_shop_touch1 = {
		805784,
		107,
		true
	},
	hotspring_shop_touch2 = {
		805891,
		128,
		true
	},
	hotspring_shop_touch3 = {
		806019,
		115,
		true
	},
	hotspring_shop_exchanged = {
		806134,
		154,
		true
	},
	hotspring_shop_exchange = {
		806288,
		184,
		true
	},
	hotspring_tip1 = {
		806472,
		130,
		true
	},
	hotspring_tip2 = {
		806602,
		104,
		true
	},
	hotspring_help = {
		806706,
		631,
		true
	},
	hotspring_expand = {
		807337,
		147,
		true
	},
	hotspring_shop_help = {
		807484,
		571,
		true
	},
	resorts_help = {
		808055,
		819,
		true
	},
	pvzminigame_help = {
		808874,
		1187,
		true
	},
	tips_yuandanhuoyue2023 = {
		810061,
		745,
		true
	},
	beach_guard_chaijun = {
		810806,
		159,
		true
	},
	beach_guard_jianye = {
		810965,
		164,
		true
	},
	beach_guard_lituoliao = {
		811129,
		279,
		true
	},
	beach_guard_bominghan = {
		811408,
		237,
		true
	},
	beach_guard_nengdai = {
		811645,
		269,
		true
	},
	beach_guard_m_craft = {
		811914,
		121,
		true
	},
	beach_guard_m_atk = {
		812035,
		111,
		true
	},
	beach_guard_m_guard = {
		812146,
		107,
		true
	},
	beach_guard_m_craft_name = {
		812253,
		98,
		true
	},
	beach_guard_m_atk_name = {
		812351,
		94,
		true
	},
	beach_guard_m_guard_name = {
		812445,
		97,
		true
	},
	beach_guard_e1 = {
		812542,
		87,
		true
	},
	beach_guard_e2 = {
		812629,
		84,
		true
	},
	beach_guard_e3 = {
		812713,
		87,
		true
	},
	beach_guard_e4 = {
		812800,
		85,
		true
	},
	beach_guard_e5 = {
		812885,
		87,
		true
	},
	beach_guard_e6 = {
		812972,
		84,
		true
	},
	beach_guard_e7 = {
		813056,
		86,
		true
	},
	beach_guard_e1_desc = {
		813142,
		135,
		true
	},
	beach_guard_e2_desc = {
		813277,
		142,
		true
	},
	beach_guard_e3_desc = {
		813419,
		140,
		true
	},
	beach_guard_e4_desc = {
		813559,
		137,
		true
	},
	beach_guard_e5_desc = {
		813696,
		130,
		true
	},
	beach_guard_e6_desc = {
		813826,
		235,
		true
	},
	beach_guard_e7_desc = {
		814061,
		166,
		true
	},
	ninghai_nianye = {
		814227,
		142,
		true
	},
	yingrui_nianye = {
		814369,
		142,
		true
	},
	zhaohe_nianye = {
		814511,
		135,
		true
	},
	zhenhai_nianye = {
		814646,
		143,
		true
	},
	haitian_nianye = {
		814789,
		153,
		true
	},
	taiyuan_nianye = {
		814942,
		148,
		true
	},
	yixian_nianye = {
		815090,
		166,
		true
	},
	activity_yanhua_tip1 = {
		815256,
		93,
		true
	},
	activity_yanhua_tip2 = {
		815349,
		103,
		true
	},
	activity_yanhua_tip3 = {
		815452,
		103,
		true
	},
	activity_yanhua_tip4 = {
		815555,
		139,
		true
	},
	activity_yanhua_tip5 = {
		815694,
		120,
		true
	},
	activity_yanhua_tip6 = {
		815814,
		124,
		true
	},
	activity_yanhua_tip7 = {
		815938,
		158,
		true
	},
	activity_yanhua_tip8 = {
		816096,
		103,
		true
	},
	help_chunjie2023 = {
		816199,
		1441,
		true
	},
	sevenday_nianye = {
		817640,
		406,
		true
	},
	tip_nianye = {
		818046,
		122,
		true
	},
	couplete_activty_desc = {
		818168,
		351,
		true
	},
	couplete_click_desc = {
		818519,
		131,
		true
	},
	couplet_index_desc = {
		818650,
		89,
		true
	},
	couplete_help = {
		818739,
		770,
		true
	},
	couplete_drag_tip = {
		819509,
		133,
		true
	},
	couplete_remind = {
		819642,
		114,
		true
	},
	couplete_complete = {
		819756,
		132,
		true
	},
	couplete_enter = {
		819888,
		114,
		true
	},
	couplete_stay = {
		820002,
		107,
		true
	},
	couplete_task = {
		820109,
		135,
		true
	},
	couplete_pass_1 = {
		820244,
		96,
		true
	},
	couplete_pass_2 = {
		820340,
		100,
		true
	},
	couplete_fail_1 = {
		820440,
		119,
		true
	},
	couplete_fail_2 = {
		820559,
		117,
		true
	},
	couplete_pair_1 = {
		820676,
		123,
		true
	},
	couplete_pair_2 = {
		820799,
		113,
		true
	},
	couplete_pair_3 = {
		820912,
		119,
		true
	},
	couplete_pair_4 = {
		821031,
		113,
		true
	},
	couplete_pair_5 = {
		821144,
		126,
		true
	},
	couplete_pair_6 = {
		821270,
		119,
		true
	},
	couplete_pair_7 = {
		821389,
		113,
		true
	},
	["2023spring_minigame_item_lantern"] = {
		821502,
		183,
		true
	},
	["2023spring_minigame_item_firecracker"] = {
		821685,
		188,
		true
	},
	["2023spring_minigame_skill_icewall"] = {
		821873,
		149,
		true
	},
	["2023spring_minigame_skill_icewall_up"] = {
		822022,
		223,
		true
	},
	["2023spring_minigame_skill_sprint"] = {
		822245,
		151,
		true
	},
	["2023spring_minigame_skill_sprint_up"] = {
		822396,
		227,
		true
	},
	["2023spring_minigame_skill_flash"] = {
		822623,
		180,
		true
	},
	["2023spring_minigame_skill_flash_up"] = {
		822803,
		200,
		true
	},
	["2023spring_minigame_bless_speed"] = {
		823003,
		136,
		true
	},
	["2023spring_minigame_bless_speed_up"] = {
		823139,
		211,
		true
	},
	["2023spring_minigame_bless_substitute"] = {
		823350,
		204,
		true
	},
	["2023spring_minigame_bless_substitute_up"] = {
		823554,
		127,
		true
	},
	["2023spring_minigame_nenjuu_skill1"] = {
		823681,
		199,
		true
	},
	["2023spring_minigame_nenjuu_skill2"] = {
		823880,
		146,
		true
	},
	["2023spring_minigame_nenjuu_skill3"] = {
		824026,
		158,
		true
	},
	["2023spring_minigame_nenjuu_skill4"] = {
		824184,
		139,
		true
	},
	["2023spring_minigame_nenjuu_skill5"] = {
		824323,
		214,
		true
	},
	["2023spring_minigame_nenjuu_skill6"] = {
		824537,
		158,
		true
	},
	["2023spring_minigame_nenjuu_skill7"] = {
		824695,
		234,
		true
	},
	["2023spring_minigame_nenjuu_skill8"] = {
		824929,
		219,
		true
	},
	["2023spring_minigame_tip1"] = {
		825148,
		93,
		true
	},
	["2023spring_minigame_tip2"] = {
		825241,
		96,
		true
	},
	["2023spring_minigame_tip3"] = {
		825337,
		93,
		true
	},
	["2023spring_minigame_tip5"] = {
		825430,
		136,
		true
	},
	["2023spring_minigame_tip6"] = {
		825566,
		100,
		true
	},
	["2023spring_minigame_tip7"] = {
		825666,
		100,
		true
	},
	["2023spring_minigame_help"] = {
		825766,
		1226,
		true
	},
	multiple_sorties_title = {
		826992,
		97,
		true
	},
	multiple_sorties_title_eng = {
		827089,
		106,
		true
	},
	multiple_sorties_locked_tip = {
		827195,
		180,
		true
	},
	multiple_sorties_times = {
		827375,
		93,
		true
	},
	multiple_sorties_tip = {
		827468,
		206,
		true
	},
	multiple_sorties_challenge_ticket_use = {
		827674,
		118,
		true
	},
	multiple_sorties_cost1 = {
		827792,
		150,
		true
	},
	multiple_sorties_cost2 = {
		827942,
		159,
		true
	},
	multiple_sorties_cost3 = {
		828101,
		184,
		true
	},
	multiple_sorties_stopped = {
		828285,
		95,
		true
	},
	multiple_sorties_stop_tip = {
		828380,
		186,
		true
	},
	multiple_sorties_resume_tip = {
		828566,
		138,
		true
	},
	multiple_sorties_auto_on = {
		828704,
		132,
		true
	},
	multiple_sorties_finish = {
		828836,
		108,
		true
	},
	multiple_sorties_stop = {
		828944,
		105,
		true
	},
	multiple_sorties_stop_end = {
		829049,
		118,
		true
	},
	multiple_sorties_end_status = {
		829167,
		181,
		true
	},
	multiple_sorties_finish_tip = {
		829348,
		140,
		true
	},
	multiple_sorties_stop_tip_end = {
		829488,
		146,
		true
	},
	multiple_sorties_stop_reason1 = {
		829634,
		118,
		true
	},
	multiple_sorties_stop_reason2 = {
		829752,
		147,
		true
	},
	multiple_sorties_stop_reason3 = {
		829899,
		125,
		true
	},
	multiple_sorties_stop_reason4 = {
		830024,
		131,
		true
	},
	multiple_sorties_main_tip = {
		830155,
		253,
		true
	},
	multiple_sorties_main_end = {
		830408,
		204,
		true
	},
	multiple_sorties_rest_time = {
		830612,
		105,
		true
	},
	multiple_sorties_retry_desc = {
		830717,
		108,
		true
	},
	msgbox_text_battle = {
		830825,
		88,
		true
	},
	pre_combat_start = {
		830913,
		86,
		true
	},
	pre_combat_start_en = {
		830999,
		95,
		true
	},
	["2023Valentine_minigame_s"] = {
		831094,
		181,
		true
	},
	["2023Valentine_minigame_a"] = {
		831275,
		165,
		true
	},
	["2023Valentine_minigame_b"] = {
		831440,
		179,
		true
	},
	["2023Valentine_minigame_c"] = {
		831619,
		176,
		true
	},
	["2023Valentine_minigame_label1"] = {
		831795,
		99,
		true
	},
	["2023Valentine_minigame_label2"] = {
		831894,
		110,
		true
	},
	["2023Valentine_minigame_label3"] = {
		832004,
		104,
		true
	},
	sort_energy = {
		832108,
		81,
		true
	},
	dockyard_search_holder = {
		832189,
		100,
		true
	},
	loveletter_exchange_tip1 = {
		832289,
		154,
		true
	},
	loveletter_exchange_tip2 = {
		832443,
		140,
		true
	},
	loveletter_exchange_confirm = {
		832583,
		312,
		true
	},
	loveletter_exchange_button = {
		832895,
		97,
		true
	},
	loveletter_exchange_tip3 = {
		832992,
		163,
		true
	},
	battle_text_common_1 = {
		833155,
		179,
		true
	},
	battle_text_common_2 = {
		833334,
		235,
		true
	},
	battle_text_common_3 = {
		833569,
		192,
		true
	},
	battle_text_yingxiv4_1 = {
		833761,
		140,
		true
	},
	battle_text_yingxiv4_2 = {
		833901,
		143,
		true
	},
	battle_text_yingxiv4_3 = {
		834044,
		141,
		true
	},
	battle_text_yingxiv4_4 = {
		834185,
		146,
		true
	},
	battle_text_yingxiv4_5 = {
		834331,
		138,
		true
	},
	battle_text_yingxiv4_6 = {
		834469,
		146,
		true
	},
	battle_text_yingxiv4_7 = {
		834615,
		150,
		true
	},
	battle_text_yingxiv4_8 = {
		834765,
		152,
		true
	},
	battle_text_yingxiv4_9 = {
		834917,
		152,
		true
	},
	battle_text_yingxiv4_10 = {
		835069,
		148,
		true
	},
	battle_text_bisimaiz_1 = {
		835217,
		136,
		true
	},
	battle_text_bisimaiz_2 = {
		835353,
		136,
		true
	},
	battle_text_bisimaiz_3 = {
		835489,
		136,
		true
	},
	battle_text_bisimaiz_4 = {
		835625,
		136,
		true
	},
	battle_text_bisimaiz_5 = {
		835761,
		136,
		true
	},
	battle_text_bisimaiz_6 = {
		835897,
		136,
		true
	},
	battle_text_bisimaiz_7 = {
		836033,
		167,
		true
	},
	battle_text_bisimaiz_8 = {
		836200,
		239,
		true
	},
	battle_text_bisimaiz_9 = {
		836439,
		250,
		true
	},
	battle_text_bisimaiz_10 = {
		836689,
		207,
		true
	},
	battle_text_yunxian_1 = {
		836896,
		172,
		true
	},
	battle_text_yunxian_2 = {
		837068,
		175,
		true
	},
	battle_text_yunxian_3 = {
		837243,
		155,
		true
	},
	battle_text_haidao_1 = {
		837398,
		151,
		true
	},
	battle_text_haidao_2 = {
		837549,
		174,
		true
	},
	battle_text_tongmeng_1 = {
		837723,
		134,
		true
	},
	battle_text_luodeni_1 = {
		837857,
		173,
		true
	},
	battle_text_luodeni_2 = {
		838030,
		202,
		true
	},
	battle_text_luodeni_3 = {
		838232,
		187,
		true
	},
	series_enemy_mood = {
		838419,
		91,
		true
	},
	series_enemy_mood_error = {
		838510,
		169,
		true
	},
	series_enemy_reward_tip1 = {
		838679,
		100,
		true
	},
	series_enemy_reward_tip2 = {
		838779,
		112,
		true
	},
	series_enemy_reward_tip3 = {
		838891,
		101,
		true
	},
	series_enemy_reward_tip4 = {
		838992,
		98,
		true
	},
	series_enemy_cost = {
		839090,
		92,
		true
	},
	series_enemy_SP_count = {
		839182,
		104,
		true
	},
	series_enemy_SP_error = {
		839286,
		118,
		true
	},
	series_enemy_unlock = {
		839404,
		126,
		true
	},
	series_enemy_storyunlock = {
		839530,
		119,
		true
	},
	series_enemy_storyreward = {
		839649,
		97,
		true
	},
	series_enemy_help = {
		839746,
		2106,
		true
	},
	series_enemy_score = {
		841852,
		87,
		true
	},
	series_enemy_total_score = {
		841939,
		99,
		true
	},
	setting_label_private = {
		842038,
		85,
		true
	},
	setting_label_licence = {
		842123,
		85,
		true
	},
	series_enemy_reward = {
		842208,
		104,
		true
	},
	series_enemy_mode_1 = {
		842312,
		97,
		true
	},
	series_enemy_mode_2 = {
		842409,
		99,
		true
	},
	series_enemy_fleet_prefix = {
		842508,
		97,
		true
	},
	series_enemy_team_notenough = {
		842605,
		232,
		true
	},
	series_enemy_empty_commander_main = {
		842837,
		108,
		true
	},
	series_enemy_empty_commander_assistant = {
		842945,
		111,
		true
	},
	limit_team_character_tips = {
		843056,
		154,
		true
	},
	game_room_help = {
		843210,
		1337,
		true
	},
	game_cannot_go = {
		844547,
		113,
		true
	},
	game_ticket_notenough = {
		844660,
		143,
		true
	},
	game_ticket_max_all = {
		844803,
		204,
		true
	},
	game_ticket_max_month = {
		845007,
		206,
		true
	},
	game_icon_notenough = {
		845213,
		135,
		true
	},
	game_goldbyicon = {
		845348,
		131,
		true
	},
	game_icon_max = {
		845479,
		189,
		true
	},
	caibulin_tip1 = {
		845668,
		141,
		true
	},
	caibulin_tip2 = {
		845809,
		163,
		true
	},
	caibulin_tip3 = {
		845972,
		141,
		true
	},
	caibulin_tip4 = {
		846113,
		162,
		true
	},
	caibulin_tip5 = {
		846275,
		141,
		true
	},
	caibulin_tip6 = {
		846416,
		163,
		true
	},
	caibulin_tip7 = {
		846579,
		141,
		true
	},
	caibulin_tip8 = {
		846720,
		165,
		true
	},
	caibulin_tip9 = {
		846885,
		162,
		true
	},
	caibulin_tip10 = {
		847047,
		177,
		true
	},
	caibulin_help = {
		847224,
		510,
		true
	},
	caibulin_tip11 = {
		847734,
		167,
		true
	},
	caibulin_lock_tip = {
		847901,
		123,
		true
	},
	gametip_xiaoqiye = {
		848024,
		1526,
		true
	},
	event_recommend_level1 = {
		849550,
		176,
		true
	},
	doa_minigame_Luna = {
		849726,
		85,
		true
	},
	doa_minigame_Misaki = {
		849811,
		89,
		true
	},
	doa_minigame_Marie = {
		849900,
		92,
		true
	},
	doa_minigame_Tamaki = {
		849992,
		89,
		true
	},
	doa_minigame_help = {
		850081,
		294,
		true
	},
	gametip_xiaokewei = {
		850375,
		1526,
		true
	},
	doa_character_select_confirm = {
		851901,
		239,
		true
	},
	blueprint_combatperformance = {
		852140,
		102,
		true
	},
	blueprint_shipperformance = {
		852242,
		94,
		true
	},
	blueprint_researching = {
		852336,
		98,
		true
	},
	sculpture_drawline_tip = {
		852434,
		130,
		true
	},
	sculpture_drawline_done = {
		852564,
		151,
		true
	},
	sculpture_drawline_exit = {
		852715,
		181,
		true
	},
	sculpture_puzzle_tip = {
		852896,
		162,
		true
	},
	sculpture_gratitude_tip = {
		853058,
		131,
		true
	},
	sculpture_close_tip = {
		853189,
		97,
		true
	},
	gift_act_help = {
		853286,
		713,
		true
	},
	gift_act_drawline_help = {
		853999,
		722,
		true
	},
	gift_act_tips = {
		854721,
		92,
		true
	},
	expedition_award_tip = {
		854813,
		150,
		true
	},
	island_act_tips1 = {
		854963,
		94,
		true
	},
	haidaojudian_help = {
		855057,
		2479,
		true
	},
	haidaojudian_building_tip = {
		857536,
		139,
		true
	},
	workbench_help = {
		857675,
		653,
		true
	},
	workbench_need_materials = {
		858328,
		104,
		true
	},
	workbench_tips1 = {
		858432,
		103,
		true
	},
	workbench_tips2 = {
		858535,
		110,
		true
	},
	workbench_tips3 = {
		858645,
		117,
		true
	},
	workbench_tips4 = {
		858762,
		114,
		true
	},
	workbench_tips5 = {
		858876,
		114,
		true
	},
	workbench_tips6 = {
		858990,
		88,
		true
	},
	workbench_tips7 = {
		859078,
		88,
		true
	},
	workbench_tips8 = {
		859166,
		87,
		true
	},
	workbench_tips9 = {
		859253,
		95,
		true
	},
	workbench_tips10 = {
		859348,
		102,
		true
	},
	island_help = {
		859450,
		610,
		true
	},
	islandnode_tips1 = {
		860060,
		92,
		true
	},
	islandnode_tips2 = {
		860152,
		84,
		true
	},
	islandnode_tips3 = {
		860236,
		105,
		true
	},
	islandnode_tips4 = {
		860341,
		105,
		true
	},
	islandnode_tips5 = {
		860446,
		113,
		true
	},
	islandnode_tips6 = {
		860559,
		116,
		true
	},
	islandnode_tips7 = {
		860675,
		125,
		true
	},
	islandnode_tips8 = {
		860800,
		151,
		true
	},
	islandnode_tips9 = {
		860951,
		142,
		true
	},
	islandshop_tips1 = {
		861093,
		98,
		true
	},
	islandshop_tips2 = {
		861191,
		87,
		true
	},
	islandshop_tips3 = {
		861278,
		84,
		true
	},
	islandshop_tips4 = {
		861362,
		95,
		true
	},
	island_shop_limit_error = {
		861457,
		146,
		true
	},
	haidaojudian_upgrade_limit = {
		861603,
		154,
		true
	},
	chargetip_monthcard_1 = {
		861757,
		145,
		true
	},
	chargetip_monthcard_2 = {
		861902,
		145,
		true
	},
	chargetip_crusing = {
		862047,
		102,
		true
	},
	chargetip_giftpackage = {
		862149,
		141,
		true
	},
	package_view_1 = {
		862290,
		131,
		true
	},
	package_view_2 = {
		862421,
		143,
		true
	},
	package_view_3 = {
		862564,
		99,
		true
	},
	package_view_4 = {
		862663,
		87,
		true
	},
	probabilityskinshop_tip = {
		862750,
		175,
		true
	},
	skin_gift_desc = {
		862925,
		258,
		true
	},
	springtask_tip = {
		863183,
		307,
		true
	},
	island_build_desc = {
		863490,
		132,
		true
	},
	island_history_desc = {
		863622,
		146,
		true
	},
	island_build_level = {
		863768,
		91,
		true
	},
	island_game_limit_help = {
		863859,
		143,
		true
	},
	island_game_limit_num = {
		864002,
		94,
		true
	},
	ore_minigame_help = {
		864096,
		954,
		true
	},
	meta_shop_exchange_limit_2 = {
		865050,
		96,
		true
	},
	meta_shop_tip = {
		865146,
		138,
		true
	},
	pt_shop_tran_tip = {
		865284,
		275,
		true
	},
	urdraw_tip = {
		865559,
		125,
		true
	},
	urdraw_complement = {
		865684,
		170,
		true
	},
	meta_class_t_level_1 = {
		865854,
		95,
		true
	},
	meta_class_t_level_2 = {
		865949,
		102,
		true
	},
	meta_class_t_level_3 = {
		866051,
		99,
		true
	},
	meta_class_t_level_4 = {
		866150,
		100,
		true
	},
	meta_class_t_level_5 = {
		866250,
		99,
		true
	},
	meta_shop_exchange_limit_tip = {
		866349,
		121,
		true
	},
	meta_shop_exchange_limit_2_tip = {
		866470,
		143,
		true
	},
	charge_tip_crusing_label = {
		866613,
		101,
		true
	},
	mktea_1 = {
		866714,
		144,
		true
	},
	mktea_2 = {
		866858,
		155,
		true
	},
	mktea_3 = {
		867013,
		159,
		true
	},
	mktea_4 = {
		867172,
		233,
		true
	},
	mktea_5 = {
		867405,
		222,
		true
	},
	random_skin_list_item_desc_label = {
		867627,
		99,
		true
	},
	notice_input_desc = {
		867726,
		99,
		true
	},
	notice_label_send = {
		867825,
		85,
		true
	},
	notice_label_room = {
		867910,
		88,
		true
	},
	notice_label_recv = {
		867998,
		90,
		true
	},
	notice_label_tip = {
		868088,
		123,
		true
	},
	littleTaihou_npc = {
		868211,
		1771,
		true
	},
	disassemble_selected = {
		869982,
		92,
		true
	},
	disassemble_available = {
		870074,
		95,
		true
	},
	ship_formationUI_fleetName_challenge = {
		870169,
		115,
		true
	},
	ship_formationUI_fleetName_challenge_sub = {
		870284,
		119,
		true
	},
	word_status_activity = {
		870403,
		92,
		true
	},
	word_status_challenge = {
		870495,
		97,
		true
	},
	shipmodechange_reject_inactivity = {
		870592,
		188,
		true
	},
	shipmodechange_reject_inchallenge = {
		870780,
		192,
		true
	},
	battle_result_total_time = {
		870972,
		99,
		true
	},
	charge_game_room_coin_tip = {
		871071,
		193,
		true
	},
	game_room_shooting_tip = {
		871264,
		100,
		true
	},
	mini_game_shop_ticked_not_enough = {
		871364,
		154,
		true
	},
	game_ticket_current_month = {
		871518,
		103,
		true
	},
	game_icon_max_full = {
		871621,
		138,
		true
	},
	pre_combat_consume = {
		871759,
		87,
		true
	},
	file_down_msgbox = {
		871846,
		191,
		true
	},
	file_down_mgr_title = {
		872037,
		114,
		true
	},
	file_down_mgr_progress = {
		872151,
		91,
		true
	},
	file_down_mgr_error = {
		872242,
		157,
		true
	},
	last_building_not_shown = {
		872399,
		119,
		true
	},
	setting_group_prefs_tip = {
		872518,
		122,
		true
	},
	group_prefs_switch_tip = {
		872640,
		159,
		true
	},
	main_group_msgbox_content = {
		872799,
		184,
		true
	},
	word_maingroup_checking = {
		872983,
		98,
		true
	},
	word_maingroup_checktoupdate = {
		873081,
		107,
		true
	},
	word_maingroup_checkfailure = {
		873188,
		122,
		true
	},
	word_maingroup_updating = {
		873310,
		98,
		true
	},
	word_maingroup_updatesuccess = {
		873408,
		108,
		true
	},
	word_maingroup_updatefailure = {
		873516,
		125,
		true
	},
	group_download_tip = {
		873641,
		156,
		true
	},
	word_manga_checking = {
		873797,
		94,
		true
	},
	word_manga_checktoupdate = {
		873891,
		103,
		true
	},
	word_manga_checkfailure = {
		873994,
		118,
		true
	},
	word_manga_updating = {
		874112,
		98,
		true
	},
	word_manga_updatesuccess = {
		874210,
		104,
		true
	},
	word_manga_updatefailure = {
		874314,
		121,
		true
	},
	cryptolalia_lock_res = {
		874435,
		102,
		true
	},
	cryptolalia_not_download_res = {
		874537,
		113,
		true
	},
	cryptolalia_timelimie = {
		874650,
		92,
		true
	},
	cryptolalia_label_downloading = {
		874742,
		114,
		true
	},
	cryptolalia_delete_res = {
		874856,
		104,
		true
	},
	cryptolalia_delete_res_tip = {
		874960,
		133,
		true
	},
	cryptolalia_delete_res_title = {
		875093,
		107,
		true
	},
	cryptolalia_use_gem_title = {
		875200,
		105,
		true
	},
	cryptolalia_use_ticket_title = {
		875305,
		111,
		true
	},
	cryptolalia_exchange = {
		875416,
		94,
		true
	},
	cryptolalia_exchange_success = {
		875510,
		107,
		true
	},
	cryptolalia_list_title = {
		875617,
		93,
		true
	},
	cryptolalia_list_subtitle = {
		875710,
		100,
		true
	},
	cryptolalia_download_done = {
		875810,
		106,
		true
	},
	cryptolalia_coming_soom = {
		875916,
		101,
		true
	},
	cryptolalia_unopen = {
		876017,
		88,
		true
	},
	cryptolalia_no_ticket = {
		876105,
		164,
		true
	},
	cryptolalia_entrance_coming_soom = {
		876269,
		118,
		true
	},
	ship_formationUI_fleetName_sp = {
		876387,
		111,
		true
	},
	ship_formationUI_fleetName_sp_ss = {
		876498,
		118,
		true
	},
	activityboss_sp_all_buff = {
		876616,
		98,
		true
	},
	activityboss_sp_best_score = {
		876714,
		101,
		true
	},
	activityboss_sp_display_reward = {
		876815,
		106,
		true
	},
	activityboss_sp_score_bonus = {
		876921,
		103,
		true
	},
	activityboss_sp_active_buff = {
		877024,
		99,
		true
	},
	activityboss_sp_window_best_score = {
		877123,
		114,
		true
	},
	activityboss_sp_score_target = {
		877237,
		105,
		true
	},
	activityboss_sp_score = {
		877342,
		95,
		true
	},
	activityboss_sp_score_update = {
		877437,
		106,
		true
	},
	activityboss_sp_score_not_update = {
		877543,
		118,
		true
	},
	collect_page_got = {
		877661,
		89,
		true
	},
	charge_menu_month_tip = {
		877750,
		178,
		true
	},
	activity_shop_title = {
		877928,
		88,
		true
	},
	street_shop_title = {
		878016,
		85,
		true
	},
	military_shop_title = {
		878101,
		88,
		true
	},
	quota_shop_title1 = {
		878189,
		92,
		true
	},
	sham_shop_title = {
		878281,
		89,
		true
	},
	fragment_shop_title = {
		878370,
		88,
		true
	},
	guild_shop_title = {
		878458,
		85,
		true
	},
	medal_shop_title = {
		878543,
		85,
		true
	},
	meta_shop_title = {
		878628,
		83,
		true
	},
	mini_game_shop_title = {
		878711,
		89,
		true
	},
	metaskill_up = {
		878800,
		187,
		true
	},
	metaskill_overflow_tip = {
		878987,
		163,
		true
	},
	msgbox_repair_cipher = {
		879150,
		103,
		true
	},
	msgbox_repair_title = {
		879253,
		89,
		true
	},
	equip_skin_detail_count = {
		879342,
		93,
		true
	},
	faest_nothing_to_get = {
		879435,
		105,
		true
	},
	feast_click_to_close = {
		879540,
		98,
		true
	},
	feast_invitation_btn_label = {
		879638,
		108,
		true
	},
	feast_task_btn_label = {
		879746,
		96,
		true
	},
	feast_task_pt_label = {
		879842,
		91,
		true
	},
	feast_task_pt_level = {
		879933,
		89,
		true
	},
	feast_task_pt_get = {
		880022,
		91,
		true
	},
	feast_task_pt_got = {
		880113,
		89,
		true
	},
	feast_task_tag_daily = {
		880202,
		89,
		true
	},
	feast_task_tag_activity = {
		880291,
		94,
		true
	},
	feast_label_make_invitation = {
		880385,
		106,
		true
	},
	feast_no_invitation = {
		880491,
		108,
		true
	},
	feast_no_gift = {
		880599,
		96,
		true
	},
	feast_label_give_invitation = {
		880695,
		106,
		true
	},
	feast_label_give_invitation_finish = {
		880801,
		113,
		true
	},
	feast_label_give_gift = {
		880914,
		94,
		true
	},
	feast_label_give_gift_finish = {
		881008,
		101,
		true
	},
	feast_label_make_ticket_tip = {
		881109,
		151,
		true
	},
	feast_label_make_ticket_click_tip = {
		881260,
		118,
		true
	},
	feast_label_make_ticket_failed_tip = {
		881378,
		153,
		true
	},
	feast_res_window_title = {
		881531,
		93,
		true
	},
	feast_res_window_go_label = {
		881624,
		91,
		true
	},
	feast_tip = {
		881715,
		422,
		true
	},
	feast_invitation_part1 = {
		882137,
		134,
		true
	},
	feast_invitation_part2 = {
		882271,
		260,
		true
	},
	feast_invitation_part3 = {
		882531,
		278,
		true
	},
	feast_invitation_part4 = {
		882809,
		218,
		true
	},
	uscastle2023_help = {
		883027,
		1519,
		true
	},
	feast_cant_give_gift_tip = {
		884546,
		154,
		true
	},
	uscastle2023_minigame_help = {
		884700,
		367,
		true
	},
	feast_drag_invitation_tip = {
		885067,
		143,
		true
	},
	feast_drag_gift_tip = {
		885210,
		131,
		true
	},
	shoot_preview = {
		885341,
		91,
		true
	},
	hit_preview = {
		885432,
		90,
		true
	},
	story_label_skip = {
		885522,
		84,
		true
	},
	story_label_auto = {
		885606,
		84,
		true
	},
	launch_ball_skill_desc = {
		885690,
		93,
		true
	},
	launch_ball_hatsuduki_skill_1 = {
		885783,
		114,
		true
	},
	launch_ball_hatsuduki_skill_1_desc = {
		885897,
		172,
		true
	},
	launch_ball_hatsuduki_skill_2 = {
		886069,
		127,
		true
	},
	launch_ball_hatsuduki_skill_2_desc = {
		886196,
		334,
		true
	},
	launch_ball_shinano_skill_1 = {
		886530,
		113,
		true
	},
	launch_ball_shinano_skill_1_desc = {
		886643,
		193,
		true
	},
	launch_ball_shinano_skill_2 = {
		886836,
		121,
		true
	},
	launch_ball_shinano_skill_2_desc = {
		886957,
		257,
		true
	},
	launch_ball_yura_skill_1 = {
		887214,
		111,
		true
	},
	launch_ball_yura_skill_1_desc = {
		887325,
		169,
		true
	},
	launch_ball_yura_skill_2 = {
		887494,
		120,
		true
	},
	launch_ball_yura_skill_2_desc = {
		887614,
		206,
		true
	},
	launch_ball_shimakaze_skill_1 = {
		887820,
		124,
		true
	},
	launch_ball_shimakaze_skill_1_desc = {
		887944,
		225,
		true
	},
	launch_ball_shimakaze_skill_2 = {
		888169,
		121,
		true
	},
	launch_ball_shimakaze_skill_2_desc = {
		888290,
		202,
		true
	},
	jp6th_spring_tip1 = {
		888492,
		172,
		true
	},
	jp6th_spring_tip2 = {
		888664,
		104,
		true
	},
	jp6th_biaohoushan_help = {
		888768,
		1312,
		true
	},
	jp6th_lihoushan_help = {
		890080,
		2540,
		true
	},
	jp6th_lihoushan_time = {
		892620,
		125,
		true
	},
	jp6th_lihoushan_order = {
		892745,
		138,
		true
	},
	jp6th_lihoushan_pt1 = {
		892883,
		98,
		true
	},
	launchball_minigame_help = {
		892981,
		357,
		true
	},
	launchball_minigame_select = {
		893338,
		106,
		true
	},
	launchball_minigame_un_select = {
		893444,
		122,
		true
	},
	launchball_minigame_shop = {
		893566,
		106,
		true
	},
	launchball_lock_Shinano = {
		893672,
		172,
		true
	},
	launchball_lock_Yura = {
		893844,
		166,
		true
	},
	launchball_lock_Shimakaze = {
		894010,
		176,
		true
	},
	launchball_spilt_series = {
		894186,
		162,
		true
	},
	launchball_spilt_mix = {
		894348,
		311,
		true
	},
	launchball_spilt_over = {
		894659,
		224,
		true
	},
	launchball_spilt_many = {
		894883,
		152,
		true
	},
	luckybag_skin_isani = {
		895035,
		90,
		true
	},
	luckybag_skin_islive2d = {
		895125,
		93,
		true
	},
	SkinMagazinePage2_tip = {
		895218,
		92,
		true
	},
	racing_cost = {
		895310,
		86,
		true
	},
	racing_rank_top_text = {
		895396,
		98,
		true
	},
	racing_rank_half_h = {
		895494,
		102,
		true
	},
	racing_rank_no_data = {
		895596,
		101,
		true
	},
	racing_minigame_help = {
		895697,
		357,
		true
	},
	child_msg_title_detail = {
		896054,
		93,
		true
	},
	child_msg_title_tip = {
		896147,
		87,
		true
	},
	child_msg_owned = {
		896234,
		88,
		true
	},
	child_polaroid_get_tip = {
		896322,
		135,
		true
	},
	child_close_tip = {
		896457,
		101,
		true
	},
	word_month = {
		896558,
		79,
		true
	},
	word_which_month = {
		896637,
		88,
		true
	},
	word_which_week = {
		896725,
		86,
		true
	},
	word_in_one_week = {
		896811,
		89,
		true
	},
	word_week_title = {
		896900,
		82,
		true
	},
	word_harbour = {
		896982,
		80,
		true
	},
	child_btn_target = {
		897062,
		85,
		true
	},
	child_btn_collect = {
		897147,
		89,
		true
	},
	child_btn_mind = {
		897236,
		86,
		true
	},
	child_btn_bag = {
		897322,
		82,
		true
	},
	child_btn_news = {
		897404,
		90,
		true
	},
	child_main_help = {
		897494,
		526,
		true
	},
	child_archive_name = {
		898020,
		86,
		true
	},
	child_news_import_title = {
		898106,
		99,
		true
	},
	child_news_other_title = {
		898205,
		101,
		true
	},
	child_favor_progress = {
		898306,
		96,
		true
	},
	child_favor_lock1 = {
		898402,
		96,
		true
	},
	child_favor_lock2 = {
		898498,
		96,
		true
	},
	child_target_lock_tip = {
		898594,
		136,
		true
	},
	child_target_progress = {
		898730,
		96,
		true
	},
	child_target_finish_tip = {
		898826,
		117,
		true
	},
	child_target_time_title = {
		898943,
		97,
		true
	},
	child_target_title1 = {
		899040,
		92,
		true
	},
	child_target_title2 = {
		899132,
		94,
		true
	},
	child_item_type0 = {
		899226,
		83,
		true
	},
	child_item_type1 = {
		899309,
		85,
		true
	},
	child_item_type2 = {
		899394,
		91,
		true
	},
	child_item_type3 = {
		899485,
		85,
		true
	},
	child_item_type4 = {
		899570,
		85,
		true
	},
	child_mind_empty_tip = {
		899655,
		124,
		true
	},
	child_mind_finish_title = {
		899779,
		96,
		true
	},
	child_mind_processing_title = {
		899875,
		102,
		true
	},
	child_mind_time_title = {
		899977,
		95,
		true
	},
	child_collect_lock = {
		900072,
		88,
		true
	},
	child_nature_title = {
		900160,
		94,
		true
	},
	child_btn_review = {
		900254,
		87,
		true
	},
	child_schedule_empty_tip = {
		900341,
		132,
		true
	},
	child_schedule_event_tip = {
		900473,
		136,
		true
	},
	child_schedule_sure_tip = {
		900609,
		189,
		true
	},
	child_schedule_sure_tip2 = {
		900798,
		146,
		true
	},
	child_plan_check_tip1 = {
		900944,
		152,
		true
	},
	child_plan_check_tip2 = {
		901096,
		141,
		true
	},
	child_plan_check_tip3 = {
		901237,
		166,
		true
	},
	child_plan_check_tip4 = {
		901403,
		132,
		true
	},
	child_plan_check_tip5 = {
		901535,
		133,
		true
	},
	child_plan_event = {
		901668,
		96,
		true
	},
	child_btn_home = {
		901764,
		85,
		true
	},
	child_option_limit = {
		901849,
		89,
		true
	},
	child_shop_tip1 = {
		901938,
		117,
		true
	},
	child_shop_tip2 = {
		902055,
		112,
		true
	},
	child_filter_title = {
		902167,
		88,
		true
	},
	child_filter_type1 = {
		902255,
		95,
		true
	},
	child_filter_type2 = {
		902350,
		93,
		true
	},
	child_filter_type3 = {
		902443,
		91,
		true
	},
	child_plan_type1 = {
		902534,
		86,
		true
	},
	child_plan_type2 = {
		902620,
		87,
		true
	},
	child_plan_type3 = {
		902707,
		95,
		true
	},
	child_plan_type4 = {
		902802,
		89,
		true
	},
	child_filter_award_res = {
		902891,
		91,
		true
	},
	child_filter_award_nature = {
		902982,
		100,
		true
	},
	child_filter_award_attr1 = {
		903082,
		93,
		true
	},
	child_filter_award_attr2 = {
		903175,
		97,
		true
	},
	child_mood_desc1 = {
		903272,
		149,
		true
	},
	child_mood_desc2 = {
		903421,
		143,
		true
	},
	child_mood_desc3 = {
		903564,
		145,
		true
	},
	child_mood_desc4 = {
		903709,
		145,
		true
	},
	child_mood_desc5 = {
		903854,
		145,
		true
	},
	child_stage_desc1 = {
		903999,
		95,
		true
	},
	child_stage_desc2 = {
		904094,
		95,
		true
	},
	child_stage_desc3 = {
		904189,
		95,
		true
	},
	child_default_callname = {
		904284,
		95,
		true
	},
	flagship_display_mode_1 = {
		904379,
		118,
		true
	},
	flagship_display_mode_2 = {
		904497,
		117,
		true
	},
	flagship_display_mode_3 = {
		904614,
		95,
		true
	},
	flagship_educate_slot_lock_tip = {
		904709,
		199,
		true
	},
	child_story_name = {
		904908,
		89,
		true
	},
	secretary_special_name = {
		904997,
		88,
		true
	},
	secretary_special_lock_tip = {
		905085,
		101,
		true
	},
	secretary_special_title_age = {
		905186,
		109,
		true
	},
	secretary_special_title_physiognomy = {
		905295,
		117,
		true
	},
	child_plan_skip = {
		905412,
		93,
		true
	},
	child_attr_name1 = {
		905505,
		85,
		true
	},
	child_attr_name2 = {
		905590,
		89,
		true
	},
	child_task_system_type2 = {
		905679,
		93,
		true
	},
	child_task_system_type3 = {
		905772,
		91,
		true
	},
	child_plan_perform_title = {
		905863,
		104,
		true
	},
	child_date_text1 = {
		905967,
		93,
		true
	},
	child_date_text2 = {
		906060,
		96,
		true
	},
	child_date_text3 = {
		906156,
		94,
		true
	},
	child_date_text4 = {
		906250,
		93,
		true
	},
	child_upgrade_sure_tip = {
		906343,
		231,
		true
	},
	child_school_sure_tip = {
		906574,
		212,
		true
	},
	child_extraAttr_sure_tip = {
		906786,
		140,
		true
	},
	child_reset_sure_tip = {
		906926,
		172,
		true
	},
	child_end_sure_tip = {
		907098,
		104,
		true
	},
	child_buff_name = {
		907202,
		85,
		true
	},
	child_unlock_tip = {
		907287,
		86,
		true
	},
	child_unlock_out = {
		907373,
		90,
		true
	},
	child_unlock_memory = {
		907463,
		91,
		true
	},
	child_unlock_polaroid = {
		907554,
		92,
		true
	},
	child_unlock_ending = {
		907646,
		90,
		true
	},
	child_unlock_intimacy = {
		907736,
		94,
		true
	},
	child_unlock_buff = {
		907830,
		87,
		true
	},
	child_unlock_attr2 = {
		907917,
		93,
		true
	},
	child_unlock_attr3 = {
		908010,
		91,
		true
	},
	child_unlock_bag = {
		908101,
		85,
		true
	},
	child_shop_empty_tip = {
		908186,
		101,
		true
	},
	child_bag_empty_tip = {
		908287,
		101,
		true
	},
	levelscene_deploy_submarine = {
		908388,
		105,
		true
	},
	levelscene_deploy_submarine_cancel = {
		908493,
		104,
		true
	},
	levelscene_airexpel_cancel = {
		908597,
		96,
		true
	},
	levelscene_airexpel_select_enemy = {
		908693,
		131,
		true
	},
	levelscene_airexpel_outrange = {
		908824,
		137,
		true
	},
	levelscene_airexpel_select_boss = {
		908961,
		141,
		true
	},
	levelscene_airexpel_select_battle = {
		909102,
		154,
		true
	},
	levelscene_airexpel_select_confirm_left = {
		909256,
		204,
		true
	},
	levelscene_airexpel_select_confirm_right = {
		909460,
		206,
		true
	},
	levelscene_airexpel_select_confirm_up = {
		909666,
		193,
		true
	},
	levelscene_airexpel_select_confirm_down = {
		909859,
		197,
		true
	},
	shipyard_phase_1 = {
		910056,
		971,
		true
	},
	shipyard_phase_2 = {
		911027,
		86,
		true
	},
	shipyard_button_1 = {
		911113,
		91,
		true
	},
	shipyard_button_2 = {
		911204,
		153,
		true
	},
	shipyard_introduce = {
		911357,
		212,
		true
	},
	help_supportfleet = {
		911569,
		358,
		true
	},
	word_status_inSupportFleet = {
		911927,
		106,
		true
	},
	ship_formationMediator_request_replace_support = {
		912033,
		203,
		true
	},
	courtyard_label_train = {
		912236,
		90,
		true
	},
	courtyard_label_rest = {
		912326,
		88,
		true
	},
	courtyard_label_capacity = {
		912414,
		96,
		true
	},
	courtyard_label_share = {
		912510,
		90,
		true
	},
	courtyard_label_shop = {
		912600,
		88,
		true
	},
	courtyard_label_decoration = {
		912688,
		94,
		true
	},
	courtyard_label_template = {
		912782,
		94,
		true
	},
	courtyard_label_floor = {
		912876,
		91,
		true
	},
	courtyard_label_exp_addition = {
		912967,
		101,
		true
	},
	courtyard_label_total_exp_addition = {
		913068,
		114,
		true
	},
	courtyard_label_comfortable_addition = {
		913182,
		116,
		true
	},
	courtyard_label_placed_furniture = {
		913298,
		112,
		true
	},
	courtyard_label_shop_1 = {
		913410,
		90,
		true
	},
	courtyard_label_clear = {
		913500,
		90,
		true
	},
	courtyard_label_save = {
		913590,
		88,
		true
	},
	courtyard_label_save_theme = {
		913678,
		100,
		true
	},
	courtyard_label_using = {
		913778,
		103,
		true
	},
	courtyard_label_search_holder = {
		913881,
		105,
		true
	},
	courtyard_label_filter = {
		913986,
		92,
		true
	},
	courtyard_label_time = {
		914078,
		88,
		true
	},
	courtyard_label_week = {
		914166,
		93,
		true
	},
	courtyard_label_month = {
		914259,
		94,
		true
	},
	courtyard_label_year = {
		914353,
		93,
		true
	},
	courtyard_label_putlist_title = {
		914446,
		114,
		true
	},
	courtyard_label_custom_theme = {
		914560,
		102,
		true
	},
	courtyard_label_system_theme = {
		914662,
		99,
		true
	},
	courtyard_tip_furniture_not_in_layer = {
		914761,
		142,
		true
	},
	courtyard_label_detail = {
		914903,
		93,
		true
	},
	courtyard_label_place_pnekey = {
		914996,
		103,
		true
	},
	courtyard_label_delete = {
		915099,
		92,
		true
	},
	courtyard_label_cancel_share = {
		915191,
		104,
		true
	},
	courtyard_label_empty_template_list = {
		915295,
		139,
		true
	},
	courtyard_label_empty_custom_template_list = {
		915434,
		195,
		true
	},
	courtyard_label_empty_collection_list = {
		915629,
		135,
		true
	},
	courtyard_label_go = {
		915764,
		89,
		true
	},
	mot_class_t_level_1 = {
		915853,
		97,
		true
	},
	mot_class_t_level_2 = {
		915950,
		98,
		true
	},
	equip_share_label_1 = {
		916048,
		99,
		true
	},
	equip_share_label_2 = {
		916147,
		100,
		true
	},
	equip_share_label_3 = {
		916247,
		99,
		true
	},
	equip_share_label_4 = {
		916346,
		96,
		true
	},
	equip_share_label_5 = {
		916442,
		95,
		true
	},
	equip_share_label_6 = {
		916537,
		99,
		true
	},
	equip_share_label_7 = {
		916636,
		87,
		true
	},
	equip_share_label_8 = {
		916723,
		90,
		true
	},
	equip_share_label_9 = {
		916813,
		87,
		true
	},
	equipcode_input = {
		916900,
		104,
		true
	},
	equipcode_slot_unmatch = {
		917004,
		153,
		true
	},
	equipcode_share_nolabel = {
		917157,
		132,
		true
	},
	equipcode_share_exceedlimit = {
		917289,
		124,
		true
	},
	equipcode_illegal = {
		917413,
		116,
		true
	},
	equipcode_confirm_doublecheck = {
		917529,
		137,
		true
	},
	equipcode_import_success = {
		917666,
		132,
		true
	},
	equipcode_share_success = {
		917798,
		128,
		true
	},
	equipcode_like_limited = {
		917926,
		138,
		true
	},
	equipcode_like_success = {
		918064,
		102,
		true
	},
	equipcode_dislike_success = {
		918166,
		115,
		true
	},
	equipcode_report_type_1 = {
		918281,
		118,
		true
	},
	equipcode_report_type_2 = {
		918399,
		110,
		true
	},
	equipcode_report_warning = {
		918509,
		150,
		true
	},
	equipcode_level_unmatched = {
		918659,
		100,
		true
	},
	equipcode_equipment_unowned = {
		918759,
		103,
		true
	},
	equipcode_diff_selected = {
		918862,
		101,
		true
	},
	equipcode_export_success = {
		918963,
		105,
		true
	},
	equipcode_unsaved_tips = {
		919068,
		154,
		true
	},
	equipcode_share_ruletips = {
		919222,
		139,
		true
	},
	equipcode_share_errorcode7 = {
		919361,
		146,
		true
	},
	equipcode_share_errorcode44 = {
		919507,
		137,
		true
	},
	equipcode_share_title = {
		919644,
		93,
		true
	},
	equipcode_share_titleeng = {
		919737,
		96,
		true
	},
	equipcode_share_listempty = {
		919833,
		115,
		true
	},
	equipcode_equip_occupied = {
		919948,
		94,
		true
	},
	sail_boat_equip_tip_1 = {
		920042,
		206,
		true
	},
	sail_boat_equip_tip_2 = {
		920248,
		215,
		true
	},
	sail_boat_equip_tip_3 = {
		920463,
		218,
		true
	},
	sail_boat_equip_tip_4 = {
		920681,
		210,
		true
	},
	sail_boat_equip_tip_5 = {
		920891,
		191,
		true
	},
	sail_boat_minigame_help = {
		921082,
		356,
		true
	},
	pirate_wanted_help = {
		921438,
		448,
		true
	},
	harbor_backhill_help = {
		921886,
		1172,
		true
	},
	cryptolalia_download_task_already_exists = {
		923058,
		135,
		true
	},
	charge_scene_buy_confirm_backyard = {
		923193,
		168,
		true
	},
	roll_room1 = {
		923361,
		88,
		true
	},
	roll_room2 = {
		923449,
		88,
		true
	},
	roll_room3 = {
		923537,
		84,
		true
	},
	roll_room4 = {
		923621,
		83,
		true
	},
	roll_room5 = {
		923704,
		85,
		true
	},
	roll_room6 = {
		923789,
		92,
		true
	},
	roll_room7 = {
		923881,
		85,
		true
	},
	roll_room8 = {
		923966,
		81,
		true
	},
	roll_room9 = {
		924047,
		86,
		true
	},
	roll_room10 = {
		924133,
		91,
		true
	},
	roll_room11 = {
		924224,
		89,
		true
	},
	roll_room12 = {
		924313,
		90,
		true
	},
	roll_room13 = {
		924403,
		89,
		true
	},
	roll_room14 = {
		924492,
		87,
		true
	},
	roll_room15 = {
		924579,
		80,
		true
	},
	roll_room16 = {
		924659,
		86,
		true
	},
	roll_room17 = {
		924745,
		81,
		true
	},
	roll_attr_list = {
		924826,
		693,
		true
	},
	roll_notimes = {
		925519,
		142,
		true
	},
	roll_tip2 = {
		925661,
		137,
		true
	},
	roll_reward_word1 = {
		925798,
		89,
		true
	},
	roll_reward_word2 = {
		925887,
		90,
		true
	},
	roll_reward_word3 = {
		925977,
		90,
		true
	},
	roll_reward_word4 = {
		926067,
		90,
		true
	},
	roll_reward_word5 = {
		926157,
		90,
		true
	},
	roll_reward_word6 = {
		926247,
		90,
		true
	},
	roll_reward_word7 = {
		926337,
		90,
		true
	},
	roll_reward_word8 = {
		926427,
		87,
		true
	},
	roll_reward_tip = {
		926514,
		94,
		true
	},
	roll_unlock = {
		926608,
		126,
		true
	},
	roll_noname = {
		926734,
		116,
		true
	},
	roll_card_info = {
		926850,
		85,
		true
	},
	roll_card_attr = {
		926935,
		83,
		true
	},
	roll_card_skill = {
		927018,
		85,
		true
	},
	roll_times_left = {
		927103,
		93,
		true
	},
	roll_room_unexplored = {
		927196,
		87,
		true
	},
	roll_reward_got = {
		927283,
		86,
		true
	},
	roll_gametip = {
		927369,
		1639,
		true
	},
	roll_ending_tip1 = {
		929008,
		157,
		true
	},
	roll_ending_tip2 = {
		929165,
		141,
		true
	},
	commandercat_label_raw_name = {
		929306,
		104,
		true
	},
	commandercat_label_custom_name = {
		929410,
		105,
		true
	},
	commandercat_label_display_name = {
		929515,
		106,
		true
	},
	commander_selected_max = {
		929621,
		127,
		true
	},
	word_talent = {
		929748,
		81,
		true
	},
	word_click_to_close = {
		929829,
		95,
		true
	},
	commander_subtile_ablity = {
		929924,
		104,
		true
	},
	commander_subtile_talent = {
		930028,
		102,
		true
	},
	commander_confirm_tip = {
		930130,
		130,
		true
	},
	commander_level_up_tip = {
		930260,
		122,
		true
	},
	commander_skill_effect = {
		930382,
		99,
		true
	},
	commander_choice_talent_1 = {
		930481,
		127,
		true
	},
	commander_choice_talent_2 = {
		930608,
		106,
		true
	},
	commander_choice_talent_3 = {
		930714,
		132,
		true
	},
	commander_get_box_tip_1 = {
		930846,
		102,
		true
	},
	commander_get_box_tip = {
		930948,
		113,
		true
	},
	commander_total_gold = {
		931061,
		95,
		true
	},
	commander_use_box_tip = {
		931156,
		101,
		true
	},
	commander_use_box_queue = {
		931257,
		95,
		true
	},
	commander_command_ability = {
		931352,
		99,
		true
	},
	commander_logistics_ability = {
		931451,
		100,
		true
	},
	commander_tactical_ability = {
		931551,
		97,
		true
	},
	commander_choice_talent_4 = {
		931648,
		147,
		true
	},
	commander_rename_tip = {
		931795,
		145,
		true
	},
	commander_home_level_label = {
		931940,
		103,
		true
	},
	commander_get_commander_coptyright = {
		932043,
		117,
		true
	},
	commander_choice_talent_reset = {
		932160,
		236,
		true
	},
	commander_lock_setting_title = {
		932396,
		180,
		true
	},
	skin_exchange_confirm = {
		932576,
		162,
		true
	},
	skin_purchase_confirm = {
		932738,
		238,
		true
	},
	blackfriday_pack_lock = {
		932976,
		126,
		true
	},
	skin_exchange_title = {
		933102,
		99,
		true
	},
	blackfriday_pack_select_skinall = {
		933201,
		257,
		true
	},
	skin_discount_desc = {
		933458,
		137,
		true
	},
	skin_exchange_timelimit = {
		933595,
		198,
		true
	},
	blackfriday_pack_purchased = {
		933793,
		99,
		true
	},
	commander_unsel_lock_flag_tip = {
		933892,
		200,
		true
	},
	skin_discount_timelimit = {
		934092,
		175,
		true
	},
	shan_luan_task_progress_tip = {
		934267,
		104,
		true
	},
	shan_luan_task_level_tip = {
		934371,
		104,
		true
	},
	shan_luan_task_help = {
		934475,
		876,
		true
	},
	shan_luan_task_buff_default = {
		935351,
		94,
		true
	},
	senran_pt_consume_tip = {
		935445,
		228,
		true
	},
	senran_pt_not_enough = {
		935673,
		139,
		true
	},
	senran_pt_help = {
		935812,
		595,
		true
	},
	senran_pt_rank = {
		936407,
		101,
		true
	},
	senran_pt_words_feiniao = {
		936508,
		420,
		true
	},
	senran_pt_words_banjiu = {
		936928,
		524,
		true
	},
	senran_pt_words_yan = {
		937452,
		419,
		true
	},
	senran_pt_words_xuequan = {
		937871,
		453,
		true
	},
	senran_pt_words_xuebugui = {
		938324,
		433,
		true
	},
	senran_pt_words_zi = {
		938757,
		394,
		true
	},
	senran_pt_words_xishao = {
		939151,
		392,
		true
	},
	senrankagura_backhill_help = {
		939543,
		1252,
		true
	},
	vote_lable_not_start = {
		940795,
		90,
		true
	},
	vote_lable_voting = {
		940885,
		92,
		true
	},
	vote_lable_title = {
		940977,
		173,
		true
	},
	vote_lable_acc_title_1 = {
		941150,
		97,
		true
	},
	vote_lable_acc_title_2 = {
		941247,
		98,
		true
	},
	vote_lable_curr_title_1 = {
		941345,
		103,
		true
	},
	vote_lable_curr_title_2 = {
		941448,
		104,
		true
	},
	vote_lable_window_title = {
		941552,
		94,
		true
	},
	vote_lable_rearch = {
		941646,
		90,
		true
	},
	vote_lable_daily_task_title = {
		941736,
		98,
		true
	},
	vote_lable_daily_task_tip = {
		941834,
		138,
		true
	},
	vote_lable_task_title = {
		941972,
		96,
		true
	},
	vote_lable_task_list_is_empty = {
		942068,
		124,
		true
	},
	vote_lable_ship_votes = {
		942192,
		95,
		true
	},
	vote_help_2023 = {
		942287,
		5208,
		true
	},
	vote_tip_level_limit = {
		947495,
		139,
		true
	},
	vote_label_rank = {
		947634,
		83,
		true
	},
	vote_label_rank_fresh_time_tip = {
		947717,
		135,
		true
	},
	vote_tip_area_closed = {
		947852,
		102,
		true
	},
	commander_skill_ui_info = {
		947954,
		91,
		true
	},
	commander_skill_ui_confirm = {
		948045,
		97,
		true
	},
	commander_formation_prefab_fleet = {
		948142,
		102,
		true
	},
	rect_ship_card_tpl_add = {
		948244,
		96,
		true
	},
	newyear2024_backhill_help = {
		948340,
		1024,
		true
	},
	last_times_sign = {
		949364,
		100,
		true
	},
	skin_page_sign = {
		949464,
		83,
		true
	},
	skin_page_desc = {
		949547,
		178,
		true
	},
	live2d_reset_desc = {
		949725,
		110,
		true
	},
	skin_exchange_usetip = {
		949835,
		138,
		true
	},
	blackfriday_pack_select_skinall_dialog = {
		949973,
		211,
		true
	},
	not_use_ticket_to_buy_skin = {
		950184,
		113,
		true
	},
	skin_purchase_over_price = {
		950297,
		337,
		true
	},
	help_chunjie2024 = {
		950634,
		1357,
		true
	},
	child_random_polaroid_drop = {
		951991,
		97,
		true
	},
	child_random_ops_drop = {
		952088,
		99,
		true
	},
	child_refresh_sure_tip = {
		952187,
		118,
		true
	},
	child_target_set_sure_tip = {
		952305,
		225,
		true
	},
	child_polaroid_lock_tip = {
		952530,
		128,
		true
	},
	child_task_finish_all = {
		952658,
		115,
		true
	},
	child_unlock_new_secretary = {
		952773,
		197,
		true
	},
	child_no_resource = {
		952970,
		103,
		true
	},
	child_target_set_empty = {
		953073,
		110,
		true
	},
	child_target_set_skip = {
		953183,
		132,
		true
	},
	child_news_import_empty = {
		953315,
		130,
		true
	},
	child_news_other_empty = {
		953445,
		116,
		true
	},
	word_week_day1 = {
		953561,
		84,
		true
	},
	word_week_day2 = {
		953645,
		85,
		true
	},
	word_week_day3 = {
		953730,
		87,
		true
	},
	word_week_day4 = {
		953817,
		86,
		true
	},
	word_week_day5 = {
		953903,
		84,
		true
	},
	word_week_day6 = {
		953987,
		86,
		true
	},
	word_week_day7 = {
		954073,
		84,
		true
	},
	child_shop_price_title = {
		954157,
		92,
		true
	},
	child_callname_tip = {
		954249,
		104,
		true
	},
	child_plan_no_cost = {
		954353,
		93,
		true
	},
	word_emoji_unlock = {
		954446,
		102,
		true
	},
	word_get_emoji = {
		954548,
		86,
		true
	},
	word_show_extra_reward_at_fudai_dialog = {
		954634,
		136,
		true
	},
	skin_shop_buy_confirm = {
		954770,
		166,
		true
	},
	activity_victory = {
		954936,
		106,
		true
	},
	other_world_temple_toggle_1 = {
		955042,
		106,
		true
	},
	other_world_temple_toggle_2 = {
		955148,
		108,
		true
	},
	other_world_temple_toggle_3 = {
		955256,
		107,
		true
	},
	other_world_temple_char = {
		955363,
		96,
		true
	},
	other_world_temple_award = {
		955459,
		101,
		true
	},
	other_world_temple_got = {
		955560,
		93,
		true
	},
	other_world_temple_progress = {
		955653,
		136,
		true
	},
	other_world_temple_char_title = {
		955789,
		102,
		true
	},
	other_world_temple_award_last = {
		955891,
		108,
		true
	},
	other_world_temple_award_title_1 = {
		955999,
		122,
		true
	},
	other_world_temple_award_title_2 = {
		956121,
		124,
		true
	},
	other_world_temple_award_title_3 = {
		956245,
		123,
		true
	},
	other_world_temple_lottery_all = {
		956368,
		123,
		true
	},
	other_world_temple_award_desc = {
		956491,
		163,
		true
	},
	temple_consume_not_enough = {
		956654,
		111,
		true
	},
	other_world_temple_pay = {
		956765,
		101,
		true
	},
	other_world_task_type_daily = {
		956866,
		96,
		true
	},
	other_world_task_type_main = {
		956962,
		94,
		true
	},
	other_world_task_type_repeat = {
		957056,
		106,
		true
	},
	other_world_task_title = {
		957162,
		100,
		true
	},
	other_world_task_get_all = {
		957262,
		97,
		true
	},
	other_world_task_go = {
		957359,
		90,
		true
	},
	other_world_task_got = {
		957449,
		91,
		true
	},
	other_world_task_get = {
		957540,
		89,
		true
	},
	other_world_task_tag_main = {
		957629,
		93,
		true
	},
	other_world_task_tag_daily = {
		957722,
		95,
		true
	},
	other_world_task_tag_all = {
		957817,
		91,
		true
	},
	terminal_personal_title = {
		957908,
		101,
		true
	},
	terminal_adventure_title = {
		958009,
		102,
		true
	},
	terminal_guardian_title = {
		958111,
		96,
		true
	},
	personal_info_title = {
		958207,
		93,
		true
	},
	personal_property_title = {
		958300,
		92,
		true
	},
	personal_ability_title = {
		958392,
		92,
		true
	},
	adventure_award_title = {
		958484,
		108,
		true
	},
	adventure_progress_title = {
		958592,
		102,
		true
	},
	adventure_lv_title = {
		958694,
		99,
		true
	},
	adventure_record_title = {
		958793,
		99,
		true
	},
	adventure_record_grade_title = {
		958892,
		108,
		true
	},
	adventure_award_end_tip = {
		959000,
		125,
		true
	},
	guardian_select_title = {
		959125,
		100,
		true
	},
	guardian_sure_btn = {
		959225,
		85,
		true
	},
	guardian_cancel_btn = {
		959310,
		89,
		true
	},
	guardian_active_tip = {
		959399,
		89,
		true
	},
	personal_random = {
		959488,
		94,
		true
	},
	adventure_get_all = {
		959582,
		90,
		true
	},
	Announcements_Event_Notice = {
		959672,
		95,
		true
	},
	Announcements_System_Notice = {
		959767,
		97,
		true
	},
	Announcements_News = {
		959864,
		86,
		true
	},
	Announcements_Donotshow = {
		959950,
		109,
		true
	},
	adventure_unlock_tip = {
		960059,
		170,
		true
	},
	personal_random_tip = {
		960229,
		139,
		true
	},
	guardian_sure_limit_tip = {
		960368,
		123,
		true
	},
	other_world_temple_tip = {
		960491,
		533,
		true
	},
	otherworld_map_help = {
		961024,
		530,
		true
	},
	otherworld_backhill_help = {
		961554,
		535,
		true
	},
	otherworld_terminal_help = {
		962089,
		535,
		true
	},
	vote_2023_reward_word_1 = {
		962624,
		207,
		true
	},
	vote_2023_reward_word_2 = {
		962831,
		357,
		true
	},
	vote_2023_reward_word_3 = {
		963188,
		354,
		true
	},
	voting_page_reward = {
		963542,
		87,
		true
	},
	backyard_shipAddInimacy_ships_ok = {
		963629,
		177,
		true
	},
	backyard_shipAddMoney_ships_ok = {
		963806,
		201,
		true
	},
	idol3rd_houshan = {
		964007,
		1145,
		true
	},
	idol3rd_collection = {
		965152,
		800,
		true
	},
	idol3rd_practice = {
		965952,
		944,
		true
	},
	main_silent_tip_1 = {
		966896,
		109,
		true
	},
	main_silent_tip_2 = {
		967005,
		110,
		true
	},
	main_silent_tip_3 = {
		967115,
		110,
		true
	},
	main_silent_tip_4 = {
		967225,
		115,
		true
	},
	commission_label_go = {
		967340,
		90,
		true
	},
	commission_label_finish = {
		967430,
		95,
		true
	},
	commission_label_go_mellow = {
		967525,
		97,
		true
	},
	commission_label_finish_mellow = {
		967622,
		102,
		true
	},
	commission_label_unlock_event_tip = {
		967724,
		126,
		true
	},
	commission_label_unlock_tech_tip = {
		967850,
		125,
		true
	},
	specialshipyard_tip = {
		967975,
		165,
		true
	},
	specialshipyard_name = {
		968140,
		97,
		true
	},
	liner_sign_cnt_tip = {
		968237,
		103,
		true
	},
	liner_sign_unlock_tip = {
		968340,
		100,
		true
	},
	liner_target_type1 = {
		968440,
		93,
		true
	},
	liner_target_type2 = {
		968533,
		91,
		true
	},
	liner_target_type3 = {
		968624,
		98,
		true
	},
	liner_target_type4 = {
		968722,
		97,
		true
	},
	liner_target_type5 = {
		968819,
		112,
		true
	},
	liner_log_schedule_title = {
		968931,
		103,
		true
	},
	liner_log_room_title = {
		969034,
		109,
		true
	},
	liner_log_event_title = {
		969143,
		101,
		true
	},
	liner_schedule_award_tip1 = {
		969244,
		113,
		true
	},
	liner_schedule_award_tip2 = {
		969357,
		113,
		true
	},
	liner_room_award_tip = {
		969470,
		109,
		true
	},
	liner_event_award_tip1 = {
		969579,
		152,
		true
	},
	liner_log_event_group_title1 = {
		969731,
		102,
		true
	},
	liner_log_event_group_title2 = {
		969833,
		102,
		true
	},
	liner_log_event_group_title3 = {
		969935,
		102,
		true
	},
	liner_log_event_group_title4 = {
		970037,
		102,
		true
	},
	liner_event_award_tip2 = {
		970139,
		115,
		true
	},
	liner_event_reasoning_title = {
		970254,
		107,
		true
	},
	["7th_main_tip"] = {
		970361,
		850,
		true
	},
	pipe_minigame_help = {
		971211,
		294,
		true
	},
	pipe_minigame_rank = {
		971505,
		114,
		true
	},
	liner_event_award_tip3 = {
		971619,
		128,
		true
	},
	liner_room_get_tip = {
		971747,
		110,
		true
	},
	liner_event_get_tip = {
		971857,
		101,
		true
	},
	liner_event_lock = {
		971958,
		132,
		true
	},
	liner_event_title1 = {
		972090,
		88,
		true
	},
	liner_event_title2 = {
		972178,
		88,
		true
	},
	liner_event_title3 = {
		972266,
		88,
		true
	},
	liner_help = {
		972354,
		282,
		true
	},
	liner_activity_lock = {
		972636,
		135,
		true
	},
	liner_name_modify = {
		972771,
		122,
		true
	},
	UrExchange_Pt_NotEnough = {
		972893,
		125,
		true
	},
	UrExchange_Pt_charges = {
		973018,
		105,
		true
	},
	UrExchange_Pt_help = {
		973123,
		335,
		true
	}
}
