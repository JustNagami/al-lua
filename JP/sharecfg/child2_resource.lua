pg = pg or {}
pg.child2_resource = rawget(pg, "child2_resource") or setmetatable({
	__name = "child2_resource"
}, confNEO)
pg.child2_resource.all = {
	1,
	2,
	3,
	4,
	301,
	302,
	303,
	304,
	305,
	306
}
pg.child2_resource.get_id_list_by_character = {
	{
		1,
		2,
		3,
		4
	},
	{
		301,
		302,
		303,
		304,
		305,
		306
	}
}
pg.base = pg.base or {}
pg.base.child2_resource = {}

;(function()
	pg.base.child2_resource[1] = {
		default_value = 50,
		name = "財貨",
		icon = "res_jinqian",
		type = 1,
		max_value = 99999,
		min_value = 0,
		desc = "「育成」の様々な場面で使用されるお金",
		character = 1,
		id = 1,
		item_icon = "res_jinqian2"
	}
	pg.base.child2_resource[2] = {
		default_value = 50,
		name = "気分",
		icon = "res_xinqing",
		type = 2,
		max_value = 100,
		min_value = 0,
		desc = "$1\n気分は各種パラメータ・財貨の獲得数に影響する\n0~19:絶不調 獲得-40%\n20~39:不調 獲得-20%\n40~59:普通 獲得+0%\n60~100:好調 獲得+40%",
		character = 1,
		id = 2,
		item_icon = "res_xinqing2"
	}
	pg.base.child2_resource[3] = {
		default_value = 3,
		name = "行動力",
		icon = "res_xingdongli",
		type = 3,
		max_value = 3,
		min_value = 0,
		desc = "おでかけ時に行動をする際に消費され、毎ターン回復します。",
		character = 1,
		id = 3,
		item_icon = "res_xingdongli2"
	}
	pg.base.child2_resource[4] = {
		default_value = 50,
		name = "好感度",
		icon = "res_haogandu",
		type = 4,
		max_value = 500,
		min_value = 0,
		desc = "メイン画面の会話イベントをこなすと好感度を上昇させることができます。\nまた、好感度報酬を受け取ることができます",
		character = 1,
		id = 4,
		item_icon = "res_haogandu2"
	}
	pg.base.child2_resource[301] = {
		default_value = 50,
		name = "財貨",
		icon = "res_jinqian",
		type = 1,
		max_value = 99999,
		min_value = 0,
		desc = "「育成」の様々な場面で使用されるお金",
		character = 2,
		id = 301,
		item_icon = "res_jinqian2"
	}
	pg.base.child2_resource[302] = {
		default_value = 50,
		name = "気分",
		icon = "res_xinqing",
		type = 2,
		max_value = 100,
		min_value = 0,
		desc = "$1\n気分は各種パラメータ・財貨の獲得数に影響する\n0~19:絶不調 獲得-40%\n20~39:不調 獲得-20%\n40~59:普通 獲得+0%\n60~100:好調 獲得+40%",
		character = 2,
		id = 302,
		item_icon = "res_xinqing2"
	}
	pg.base.child2_resource[303] = {
		default_value = 3,
		name = "行動力",
		icon = "res_xingdongli",
		type = 3,
		max_value = 99,
		min_value = 0,
		desc = "おでかけ時に行動をする際に消費され、毎ターン回復します。",
		character = 2,
		id = 303,
		item_icon = "res_xingdongli2"
	}
	pg.base.child2_resource[304] = {
		default_value = 50,
		name = "好感度",
		icon = "res_haogandu",
		type = 4,
		max_value = 500,
		min_value = 0,
		desc = "メイン画面の会話イベントをこなすと好感度を上昇させることができます。\nまた、好感度報酬を受け取ることができます",
		character = 2,
		id = 304,
		item_icon = "res_haogandu2"
	}
	pg.base.child2_resource[305] = {
		default_value = 0,
		name = "更新回数",
		icon = "res_refresh1",
		type = 5,
		max_value = 3,
		min_value = 0,
		desc = "占い屋で更新回数を消費することでラインナップを変更可能",
		character = 2,
		id = 305,
		item_icon = "res_refresh1"
	}
	pg.base.child2_resource[306] = {
		default_value = 5,
		name = "引き直し回数",
		icon = "res_refresh2",
		type = 6,
		max_value = 500,
		min_value = 0,
		desc = "選択画面で引き直し回数を消費することでタロットと解釈を変更可能",
		character = 2,
		id = 306,
		item_icon = "res_refresh2"
	}
end)()
