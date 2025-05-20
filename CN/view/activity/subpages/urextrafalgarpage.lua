local var_0_0 = class("UrExTrafalgarPage", import(".TemplatePage.UrExchangeTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.taskTypeDic = setmetatable({
		[var_0_0.MINI_GAME] = function(arg_2_0, arg_2_1)
			local var_2_0 = arg_2_1[1]
			local var_2_1 = getProxy(MiniGameProxy):GetHubByGameId(var_2_0).count == 0

			local function var_2_2()
				if var_2_0 == 76 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("challenge_minigame_unlock"))

					return
				end

				arg_2_0:emit(ActivityMediator.GO_MINI_GAME, var_2_0)
			end

			return var_2_1 and "1/1" or "0/1", not var_2_1 and var_2_2 or nil
		end
	}, {
		__index = arg_1_0.taskTypeDic
	})
end

return var_0_0
