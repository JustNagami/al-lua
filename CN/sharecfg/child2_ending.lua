pg = pg or {}
pg.child2_ending = {
	{
		pic = "bg_project_oceana_cg23",
		name = "继续升学",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA32",
		id = 1,
		pic_preview = "oceana_ending1",
		condition_desc = {
			{
				{
					300041
				},
				"完成养成计划"
			}
		},
		condition = {
			"&&",
			{
				300041
			}
		}
	},
	{
		pic = "bg_project_oceana_cg24",
		name = "甜品能手",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA33",
		id = 2,
		pic_preview = "oceana_ending2",
		condition_desc = {
			{
				{
					300001
				},
				"总属性>2000"
			},
			{
				{
					300002
				},
				"性格-乖巧"
			}
		},
		condition = {
			"&&",
			{
				300001,
				300002
			}
		}
	},
	{
		pic = "bg_project_oceana_cg25",
		name = "调酒师",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA34",
		id = 3,
		pic_preview = "oceana_ending3",
		condition_desc = {
			{
				{
					300001
				},
				"总属性>2000"
			},
			{
				{
					300003
				},
				"性格-叛逆"
			}
		},
		condition = {
			"&&",
			{
				300001,
				300003
			}
		}
	},
	{
		pic = "bg_project_oceana_cg26",
		name = "自然摄影",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA35",
		id = 4,
		pic_preview = "oceana_ending4",
		condition_desc = {
			{
				{
					300004
				},
				"性格-乖巧>80"
			}
		},
		condition = {
			"&&",
			{
				300004
			}
		}
	},
	{
		pic = "bg_project_oceana_cg27",
		name = "爆破大师",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA36",
		id = 5,
		pic_preview = "oceana_ending5",
		condition_desc = {
			{
				{
					300005
				},
				"性格-叛逆>80"
			}
		},
		condition = {
			"&&",
			{
				300005
			}
		}
	},
	{
		pic = "bg_project_oceana_cg28",
		name = "心理咨询师",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA37",
		id = 6,
		pic_preview = "oceana_ending6",
		condition_desc = {
			{
				{
					300027
				},
				"知识>6000"
			},
			{
				{
					300023
				},
				"完成特殊结局事件"
			}
		},
		condition = {
			"&&",
			{
				300027,
				300023
			}
		}
	},
	{
		pic = "bg_project_oceana_cg29",
		name = "安全专家",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA38",
		id = 7,
		pic_preview = "oceana_ending7",
		condition_desc = {
			{
				{
					300028
				},
				"实践>7200"
			}
		},
		condition = {
			"&&",
			{
				300028
			}
		}
	},
	{
		pic = "bg_project_oceana_cg30",
		name = "露营指导",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA39",
		id = 8,
		pic_preview = "oceana_ending8",
		condition_desc = {
			{
				{
					300029
				},
				"感知>6000"
			},
			{
				{
					300024
				},
				"外出旅游次数>=20"
			}
		},
		condition = {
			"&&",
			{
				300029,
				300024
			}
		}
	},
	{
		pic = "bg_project_oceana_cg31",
		name = "摩托骑士",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA40",
		id = 9,
		pic_preview = "oceana_ending9",
		condition_desc = {
			{
				{
					300030
				},
				"体能>6000"
			},
			{
				{
					300022
				},
				"完成特殊结局事件"
			}
		},
		condition = {
			"&&",
			{
				300030,
				300022
			}
		}
	},
	{
		pic = "bg_project_oceana_cg32",
		name = "宠物医生",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA41",
		id = 10,
		pic_preview = "oceana_ending10",
		condition_desc = {
			{
				{
					300033
				},
				"知识>4000"
			},
			{
				{
					300031
				},
				"总属性>10000"
			}
		},
		condition = {
			"&&",
			{
				300033,
				300031
			}
		}
	},
	{
		pic = "bg_project_oceana_cg33",
		name = "摇滚歌手",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA42",
		id = 11,
		pic_preview = "oceana_ending11",
		condition_desc = {
			{
				{
					300034
				},
				"体能>4000"
			},
			{
				{
					300031
				},
				"总属性>10000"
			}
		},
		condition = {
			"&&",
			{
				300034,
				300031
			}
		}
	},
	{
		pic = "bg_project_oceana_cg34",
		name = "闪耀明星",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA43",
		id = 12,
		pic_preview = "oceana_ending12",
		condition_desc = {
			{
				{
					300035
				},
				"感知>4000"
			},
			{
				{
					300031
				},
				"总属性>10000"
			}
		},
		condition = {
			"&&",
			{
				300035,
				300031
			}
		}
	},
	{
		pic = "bg_project_oceana_cg35",
		name = "见习护士",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA44",
		id = 13,
		pic_preview = "oceana_ending13",
		condition_desc = {
			{
				{
					300036
				},
				"实践>1600"
			},
			{
				{
					300032
				},
				"总属性>4000"
			},
			{
				{
					300003
				},
				"性格-叛逆"
			}
		},
		condition = {
			"&&",
			{
				300036,
				300032,
				300003
			}
		}
	},
	{
		pic = "bg_project_oceana_cg36",
		name = "动物园园长",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA45",
		id = 14,
		pic_preview = "oceana_ending14",
		condition_desc = {
			{
				{
					300037
				},
				"感知>1600"
			},
			{
				{
					300032
				},
				"总属性>4000"
			}
		},
		condition = {
			"&&",
			{
				300037,
				300032
			}
		}
	},
	{
		pic = "bg_project_oceana_cg37",
		name = "修理达人",
		character = 1,
		performance = "LINGYANGZHEYANGCHENGJIHUA46",
		id = 15,
		pic_preview = "oceana_ending15",
		condition_desc = {
			{
				{
					300038
				},
				"体能>1600"
			},
			{
				{
					300032
				},
				"总属性>4000"
			}
		},
		condition = {
			"&&",
			{
				300038,
				300032
			}
		}
	},
	get_id_list_by_character = {
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
			15
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
		15
	}
}
