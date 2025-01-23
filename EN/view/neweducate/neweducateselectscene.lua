local var_0_0 = class("NewEducateSelectScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "NewEducateSelectUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.rootTF = arg_2_0._tf:Find("root")
	arg_2_0.bgTF = arg_2_0.rootTF:Find("bg")
	arg_2_0.sureBtn = arg_2_0.rootTF:Find("window/sure_btn")

	setText(arg_2_0.sureBtn:Find("Text"), i18n("child2_enter"))

	local var_2_0 = arg_2_0.rootTF:Find("window/info")

	arg_2_0.nameTF = var_2_0:Find("name")
	arg_2_0.progressTF = var_2_0:Find("progress")
	arg_2_0.gameTF = var_2_0:Find("game")
	arg_2_0.topTF = arg_2_0.rootTF:Find("top")
	arg_2_0.contentTF = arg_2_0.rootTF:Find("window/view/content")

	eachChild(arg_2_0.contentTF, function(arg_3_0)
		onToggle(arg_2_0, arg_3_0, function(arg_4_0)
			local var_4_0 = tonumber(arg_3_0.name)

			if arg_4_0 then
				PlayerPrefs.SetInt(arg_2_0:GetSelectedLocalKey(), var_4_0)

				arg_2_0.selectedId = var_4_0

				arg_2_0:UpdataInfo()
				arg_3_0:SetAsLastSibling()
			end
		end, SFX_PANEL)
	end)
end

function var_0_0.InitData(arg_5_0)
	arg_5_0.infos = {}
	arg_5_0.infos[0] = getProxy(EducateProxy):GetSelectInfo()

	local var_5_0 = getProxy(NewEducateProxy)

	for iter_5_0, iter_5_1 in ipairs(pg.child2_data.all) do
		arg_5_0.infos[iter_5_1] = var_5_0:GetChar(iter_5_1):GetSelectInfo()
	end

	arg_5_0.playerID = getProxy(PlayerProxy):getRawData().id

	if NewEducateHelper.IsShowNewChildTip() then
		arg_5_0.newId = pg.child2_data.all[#pg.child2_data.all]

		NewEducateHelper.ClearShowNewChildTip()
	end
end

function var_0_0.didEnter(arg_6_0)
	onButton(arg_6_0, arg_6_0.topTF:Find("return_btn"), function()
		arg_6_0:emit(NewEducateBaseUI.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.topTF:Find("btns/collect"), function()
		arg_6_0:emit(NewEducateSelectMediator.GO_SUBLAYER, Context.New({
			mediator = NewEducateCollectEntranceMediator,
			viewComponent = NewEducateCollectEntranceLayer,
			data = {
				isSelect = true,
				id = arg_6_0.selectedId
			}
		}))
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.sureBtn, function()
		if arg_6_0.selectedId == 0 then
			arg_6_0:emit(NewEducateSelectMediator.GO_SCENE, SCENE.EDUCATE, {
				isMainEnter = true
			})
		else
			arg_6_0:emit(NewEducateSelectMediator.GO_SCENE, SCENE.NEW_EDUCATE, {
				isMainEnter = true,
				id = arg_6_0.selectedId
			})
		end
	end, SFX_PANEL)
	arg_6_0:InitData()

	local var_6_0 = arg_6_0.newId or PlayerPrefs.GetInt(arg_6_0:GetSelectedLocalKey()) or 0

	triggerToggle(arg_6_0.contentTF:Find(tostring(var_6_0)), true)
end

function var_0_0.GetSelectedLocalKey(arg_10_0)
	return NewEducateConst.NEW_EDUCATE_SELECT_ID .. "_" .. arg_10_0.playerID
end

function var_0_0.UpdataInfo(arg_11_0)
	local var_11_0 = arg_11_0.infos[arg_11_0.selectedId]

	setText(arg_11_0.nameTF, var_11_0.name)
	setText(arg_11_0.progressTF, i18n("child2_game_cnt", var_11_0.gameCnt))
	setText(arg_11_0.gameTF, var_11_0.progressStr)
	setImageSprite(arg_11_0.bgTF, LoadSprite("bg/" .. var_11_0.bg), false)
end

function var_0_0.onBackPressed(arg_12_0)
	arg_12_0:emit(NewEducateBaseUI.ON_HOME)
end

return var_0_0
