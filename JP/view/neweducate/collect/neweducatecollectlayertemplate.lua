local var_0_0 = class("EducateCollectLayerTemplate", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	assert(nil, "getUIName方法必须由子类实现")
end

function var_0_0.initConfig(arg_2_0)
	assert(nil, "initConfig方法必须由子类实现")
end

function var_0_0.init(arg_3_0)
	arg_3_0.anim = arg_3_0:findTF("anim_root"):GetComponent(typeof(Animation))
	arg_3_0.animEvent = arg_3_0:findTF("anim_root"):GetComponent(typeof(DftAniEvent))

	arg_3_0.animEvent:SetEndEvent(function()
		arg_3_0:emit(var_0_0.ON_CLOSE)
	end)

	arg_3_0.closeBtn = arg_3_0:findTF("anim_root/bg")
	arg_3_0.windowTF = arg_3_0:findTF("anim_root/window")
	arg_3_0.curCntTF = arg_3_0:findTF("collect/cur", arg_3_0.windowTF)
	arg_3_0.allCntTF = arg_3_0:findTF("collect/all", arg_3_0.windowTF)
	arg_3_0.pageTF = arg_3_0:findTF("page", arg_3_0.windowTF)
	arg_3_0.nextBtn = arg_3_0:findTF("next_btn", arg_3_0.windowTF)
	arg_3_0.lastBtn = arg_3_0:findTF("last_btn", arg_3_0.windowTF)
	arg_3_0.paginationTF = arg_3_0:findTF("pagination", arg_3_0.windowTF)
	arg_3_0.performTF = arg_3_0:findTF("anim_root/perform")

	setActive(arg_3_0.performTF, false)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:PlayAnimClose()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.nextBtn, function()
		arg_3_0:PlayAnimChange()

		arg_3_0.curPageIndex = arg_3_0.curPageIndex + 1

		arg_3_0:UpdatePage()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.lastBtn, function()
		arg_3_0:PlayAnimChange()

		arg_3_0.curPageIndex = arg_3_0.curPageIndex - 1

		arg_3_0:UpdatePage()
	end, SFX_PANEL)
	pg.UIMgr.GetInstance():OverlayPanel(arg_3_0._tf, {
		groupName = arg_3_0:getGroupNameFromData(),
		weight = LayerWeightConst.SECOND_LAYER + 2
	})
end

function var_0_0.InitPageInfo(arg_8_0)
	arg_8_0:initConfig()

	arg_8_0.onePageCnt = arg_8_0.pageTF.childCount
	arg_8_0.pages = math.ceil(#arg_8_0.allIds / arg_8_0.onePageCnt)
	arg_8_0.curPageIndex = 1
end

function var_0_0.UpdatePage(arg_9_0)
	setActive(arg_9_0.nextBtn, arg_9_0.pages ~= 1 and arg_9_0.curPageIndex < arg_9_0.pages)
	setActive(arg_9_0.lastBtn, arg_9_0.pages ~= 1 and arg_9_0.curPageIndex > 1)
	setText(arg_9_0.paginationTF, arg_9_0.curPageIndex .. "/" .. arg_9_0.pages)

	local var_9_0 = (arg_9_0.curPageIndex - 1) * arg_9_0.onePageCnt

	for iter_9_0 = 1, arg_9_0.onePageCnt do
		local var_9_1 = arg_9_0:findTF("frame_" .. iter_9_0, arg_9_0.pageTF)
		local var_9_2 = arg_9_0.allIds[var_9_0 + iter_9_0]

		if var_9_2 then
			setActive(var_9_1, true)
			arg_9_0:UpdateItem(var_9_2, var_9_1)
		else
			setActive(var_9_1, false)
		end
	end
end

function var_0_0.UpdateItem(arg_10_0, arg_10_1, arg_10_2)
	assert(nil, "updateItem方法必须由子类实现")
end

function var_0_0.PlayAnimChange(arg_11_0)
	assert(nil, "playAnimClose方法必须由子类实现")
end

function var_0_0.onBackPressed(arg_12_0)
	arg_12_0:PlayAnimClose()
end

function var_0_0.willExit(arg_13_0)
	arg_13_0.animEvent:SetEndEvent(nil)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_13_0._tf)
end

return var_0_0
