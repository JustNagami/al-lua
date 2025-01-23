local var_0_0 = class("NewEducateCollectEntranceLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "NewEducateCollectEntranceUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.anim = arg_2_0._tf:Find("anim_root"):GetComponent(typeof(Animation))
	arg_2_0.animEvent = arg_2_0._tf:Find("anim_root"):GetComponent(typeof(DftAniEvent))

	arg_2_0.animEvent:SetEndEvent(function()
		arg_2_0:emit(var_0_0.ON_CLOSE)
	end)

	arg_2_0.contentTF = arg_2_0._tf:Find("anim_root/content")
	arg_2_0.contentTF.offsetMin = Vector2(arg_2_0.contextData.isSelect and 208 or 0, 0)
	arg_2_0.contentTF.offsetMax = Vector2(0, 0)
	arg_2_0.memoryBtn = arg_2_0.contentTF:Find("memory_btn")
	arg_2_0.polaroidBtn = arg_2_0.contentTF:Find("polaroid_btn")
	arg_2_0.endingBtn = arg_2_0.contentTF:Find("ending_btn")
	arg_2_0.reviewBtn = arg_2_0.contentTF:Find("review_btn")
	arg_2_0.leftTF = arg_2_0._tf:Find("anim_root/left")
	arg_2_0.togglesTF = arg_2_0.leftTF:Find("toggles")
	arg_2_0.ids = {
		0
	}
	arg_2_0.ids = table.mergeArray(arg_2_0.ids, pg.child2_data.all)
	arg_2_0.toggleList = UIItemList.New(arg_2_0.togglesTF, arg_2_0.togglesTF:Find("tpl"))
end

function var_0_0.didEnter(arg_4_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf, false, {
		weight = LayerWeightConst.SECOND_LAYER
	})
	onButton(arg_4_0, arg_4_0._tf, function()
		arg_4_0:_close()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.memoryBtn, function()
		if arg_4_0.contextData.id == 0 then
			arg_4_0:emit(NewEducateCollectEntranceMediator.GO_SUBLAYER, Context.New({
				mediator = EducateCollectMediatorTemplate,
				viewComponent = EducateMemoryLayer
			}))
		else
			arg_4_0:emit(NewEducateCollectEntranceMediator.GO_SUBLAYER, Context.New({
				mediator = NewEducateCollectMediatorTemplate,
				viewComponent = NewEducateMemoryLayer,
				data = {
					permanentData = arg_4_0.permanentData
				}
			}))
		end
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.polaroidBtn, function()
		if arg_4_0.contextData.id == 0 then
			if isActive(arg_4_0.polaroidBtn:Find("lock")) then
				return
			end

			arg_4_0:emit(NewEducateCollectEntranceMediator.GO_SUBLAYER, Context.New({
				mediator = EducateCollectMediatorTemplate,
				viewComponent = EducatePolaroidLayer
			}))
			setActive(arg_4_0.polaroidBtn:Find("new"), false)
		else
			arg_4_0:emit(NewEducateCollectEntranceMediator.GO_SUBLAYER, Context.New({
				mediator = NewEducateCollectMediatorTemplate,
				viewComponent = NewEducatePolaroidLayer,
				data = {
					permanentData = arg_4_0.permanentData
				}
			}))
		end
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.endingBtn:Find("unlock"), function()
		if arg_4_0.contextData.id == 0 then
			if isActive(arg_4_0.endingBtn:Find("lock")) then
				return
			end

			arg_4_0:emit(NewEducateCollectEntranceMediator.GO_SUBLAYER, Context.New({
				mediator = EducateCollectMediatorTemplate,
				viewComponent = EducateEndingLayer
			}))
		else
			arg_4_0:emit(NewEducateCollectEntranceMediator.GO_SUBLAYER, Context.New({
				mediator = NewEducateCollectMediatorTemplate,
				viewComponent = NewEducateEndingLayer,
				data = {
					permanentData = arg_4_0.permanentData
				}
			}))
		end
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.reviewBtn, function()
		if arg_4_0.contextData.id == 0 then
			arg_4_0:emit(var_0_0.ON_CLOSE)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.WORLD_COLLECTION, {
				page = WorldMediaCollectionScene.PAGE_MEMORTY,
				memoryGroup = EducateConst.REVIEW_GROUP_ID
			})
		else
			local var_9_0 = pg.child2_data[arg_4_0.contextData.id].memory_group

			arg_4_0:emit(var_0_0.ON_CLOSE)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.WORLD_COLLECTION, {
				page = WorldMediaCollectionScene.PAGE_MEMORTY,
				memoryGroup = var_9_0
			})
		end
	end, SFX_PANEL)
	arg_4_0.toggleList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventInit then
			local var_10_0 = arg_4_0.ids[arg_10_1 + 1]

			arg_10_2.name = var_10_0

			local var_10_1 = var_10_0 == 0 and "linghangyuan1_1" or pg.child2_data[var_10_0].head

			LoadImageSpriteAsync("qicon/" .. var_10_1, arg_10_2:Find("icon"))
			onToggle(arg_4_0, arg_10_2, function(arg_11_0)
				if arg_11_0 then
					arg_4_0.contextData.id = var_10_0

					if arg_4_0.contextData.id == 0 then
						arg_4_0:FlushTBView()
					else
						arg_4_0:FlushView(arg_4_0.contextData.id)
					end
				end
			end, SFX_PANEL)
		end
	end)
	arg_4_0.toggleList:align(#arg_4_0.ids)
	setActive(arg_4_0.leftTF, arg_4_0.contextData.isSelect)

	if arg_4_0.contextData.isSelect then
		triggerToggle(arg_4_0.togglesTF:Find(tostring(arg_4_0.contextData.id)), true)
	else
		arg_4_0:FlushView(arg_4_0.contextData.id)
	end
end

function var_0_0.FlushView(arg_12_0, arg_12_1)
	arg_12_0.permanentData = getProxy(NewEducateProxy):GetChar(arg_12_1):GetPermanentData()

	local var_12_0 = #arg_12_0.permanentData:GetUnlockMemoryIds()
	local var_12_1 = #arg_12_0.permanentData:GetAllMemoryIds()

	setText(arg_12_0.memoryBtn:Find("Text"), var_12_0 .. "/" .. var_12_1)
	setActive(arg_12_0.memoryBtn:Find("new"), false)

	local var_12_2 = #arg_12_0.permanentData:GetUnlockPolaroidGroups()
	local var_12_3 = #arg_12_0.permanentData:GetAllPolaroidGroups()

	setActive(arg_12_0.polaroidBtn:Find("lock"), false)
	setText(arg_12_0.polaroidBtn:Find("Text"), var_12_2 .. "/" .. var_12_3)
	setActive(arg_12_0.polaroidBtn:Find("new"), false)

	local var_12_4 = #arg_12_0.permanentData:GetActivatedEndings()
	local var_12_5 = #arg_12_0.permanentData:GetAllEndingIds()

	setText(arg_12_0.endingBtn:Find("unlock/Text"), var_12_4 .. "/" .. var_12_5)

	local var_12_6 = NewEducateConst.LOCK_ENDING and arg_12_0.permanentData:GetGameCnt()

	setActive(arg_12_0.endingBtn:Find("unlock"), not var_12_6)
	setActive(arg_12_0.endingBtn:Find("lock"), var_12_6)
end

function var_0_0.FlushTBView(arg_13_0)
	local var_13_0 = getProxy(EducateProxy)
	local var_13_1 = var_13_0:GetMemories()
	local var_13_2 = var_13_0:GetFinishEndings()
	local var_13_3 = #pg.child_memory.all

	setText(arg_13_0.memoryBtn:Find("Text"), #var_13_1 .. "/" .. var_13_3)
	arg_13_0:UpdateMemoryTip()

	local var_13_4, var_13_5 = var_13_0:GetPolaroidGroupCnt()

	setText(arg_13_0.polaroidBtn:Find("Text"), var_13_4 .. "/" .. var_13_5)
	setActive(arg_13_0.polaroidBtn:Find("lock"), not EducateHelper.IsSystemUnlock(EducateConst.SYSTEM_POLAROID))
	setActive(arg_13_0.polaroidBtn:Find("new"), EducateTipHelper.IsShowNewTip(EducateTipHelper.NEW_POLAROID))

	local var_13_6 = #pg.child_ending.all

	setText(arg_13_0.endingBtn:Find("unlock/Text"), #var_13_2 .. "/" .. var_13_6)

	local var_13_7 = EducateHelper.IsSystemUnlock(EducateConst.SYSTEM_ENDING) or #var_13_2 > 0

	setActive(arg_13_0.endingBtn:Find("unlock"), var_13_7)
	setActive(arg_13_0.endingBtn:Find("lock"), not var_13_7)
end

function var_0_0.UpdateMemoryTip(arg_14_0)
	local var_14_0 = underscore.any(pg.child_memory.all, function(arg_15_0)
		return EducateTipHelper.IsShowNewTip(EducateTipHelper.NEW_MEMORY, arg_15_0)
	end)

	setActive(arg_14_0.memoryBtn:Find("new"), var_14_0)
end

function var_0_0._close(arg_16_0)
	arg_16_0.anim:Play("anim_educate_collectentrance_out")
end

function var_0_0.onBackPressed(arg_17_0)
	arg_17_0:_close()
end

function var_0_0.willExit(arg_18_0)
	arg_18_0.animEvent:SetEndEvent(nil)
	pg.UIMgr.GetInstance():UnblurPanel(arg_18_0._tf)
end

return var_0_0
