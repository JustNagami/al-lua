local var_0_0 = class("IslandTechBelong")

var_0_0.CENTRE = 1
var_0_0.TECH = 2
var_0_0.COOK = 3
var_0_0.FEED = 4
var_0_0.PLANT = 5
var_0_0.MECHINE = 6
var_0_0.Fields = {
	[var_0_0.CENTRE] = "centre",
	[var_0_0.TECH] = "tech",
	[var_0_0.COOK] = "cook",
	[var_0_0.FEED] = "feed",
	[var_0_0.PLANT] = "plant",
	[var_0_0.MECHINE] = "mechine"
}
var_0_0.Names = {
	[var_0_0.CENTRE] = i18n1("岛屿中枢"),
	[var_0_0.TECH] = i18n1("科研"),
	[var_0_0.COOK] = i18n1("烹调"),
	[var_0_0.FEED] = i18n1("养护"),
	[var_0_0.PLANT] = i18n1("种植"),
	[var_0_0.MECHINE] = i18n1("机械")
}
var_0_0.SPECIAL_SHOW_TYPE = var_0_0.CENTRE
var_0_0.COMMON_SHOW_TYPES = {
	var_0_0.TECH,
	var_0_0.COOK,
	var_0_0.FEED,
	var_0_0.PLANT,
	var_0_0.MECHINE
}

return var_0_0
