local var_0_0 = class("IslandShipAttr")

var_0_0.ATTRS = {
	"farming",
	"collect",
	"catch",
	"manufacture",
	"cooking"
}
var_0_0.ATTRS_CH = {
	i18n1("农牧"),
	i18n1("收集"),
	i18n1("水产"),
	i18n1("手工"),
	i18n1("厨艺")
}

function var_0_0.ToChinese(arg_1_0)
	local var_1_0 = table.indexof(var_0_0.ATTRS, arg_1_0)

	return var_0_0.ATTRS_CH[var_1_0]
end

return var_0_0
