local var_0_0 = class("IslandItemKind")

function var_0_0.Type2TagName(arg_1_0)
	if not var_0_0.TagNames then
		var_0_0.TagNames = {
			i18n1("材料"),
			i18n1("道具"),
			i18n1("特殊道具")
		}
	end

	return var_0_0.TagNames[arg_1_0]
end

return var_0_0
