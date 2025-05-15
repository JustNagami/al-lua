local var_0_0 = class("IslandTaskType")

var_0_0.MAIN = 1
var_0_0.BRANCH = 2
var_0_0.DAILY = 3
var_0_0.WEEKLY = 4
var_0_0.ACTIVITY_BRANCH = 5
var_0_0.ACTIVITY_DAILY = 6
var_0_0.ACTIVITY_WEEKLY = 7
var_0_0.SHOW_ALL = 0
var_0_0.SHOW_MAIN = 1
var_0_0.SHOW_BRANCH = 2
var_0_0.SHOW_DAILY = 3
var_0_0.SHOW_WEEKLY = 4
var_0_0.SHOW_ACTIVITY = 5
var_0_0.Type2ShowType = {
	[var_0_0.MAIN] = var_0_0.SHOW_MAIN,
	[var_0_0.BRANCH] = var_0_0.SHOW_BRANCH,
	[var_0_0.DAILY] = var_0_0.SHOW_DAILY,
	[var_0_0.WEEKLY] = var_0_0.SHOW_WEEKLY,
	[var_0_0.ACTIVITY_BRANCH] = var_0_0.SHOW_ACTIVITY,
	[var_0_0.ACTIVITY_DAILY] = var_0_0.SHOW_ACTIVITY,
	[var_0_0.ACTIVITY_WEEKLY] = var_0_0.SHOW_ACTIVITY
}
var_0_0.ShowTypeFields = {
	[var_0_0.SHOW_MAIN] = "main",
	[var_0_0.SHOW_BRANCH] = "branch",
	[var_0_0.SHOW_DAILY] = "daily",
	[var_0_0.SHOW_WEEKLY] = "weekly",
	[var_0_0.SHOW_ACTIVITY] = "activity"
}
var_0_0.ShowTypeNames = {
	[var_0_0.SHOW_ALL] = i18n1("全部"),
	[var_0_0.SHOW_MAIN] = i18n1("主线"),
	[var_0_0.SHOW_BRANCH] = i18n1("支线"),
	[var_0_0.SHOW_DAILY] = i18n1("每日"),
	[var_0_0.SHOW_WEEKLY] = i18n1("每周"),
	[var_0_0.SHOW_ACTIVITY] = i18n1("活动")
}
var_0_0.ShowTypeColors = {
	[var_0_0.SHOW_MAIN] = "#36bdff",
	[var_0_0.SHOW_BRANCH] = "#f775ff",
	[var_0_0.SHOW_DAILY] = "#a891ff",
	[var_0_0.SHOW_WEEKLY] = "#46cd92",
	[var_0_0.SHOW_ACTIVITY] = "#ffc561"
}

function var_0_0.GetPermanentTypes()
	return {
		var_0_0.MAIN,
		var_0_0.BRANCH,
		var_0_0.ACTIVITY_BRANCH
	}
end

return var_0_0
