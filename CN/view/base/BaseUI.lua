local var_0_0 = class("BaseUI", import("view.base.BaseEventLogic"))

var_0_0.LOADED = "BaseUI:LOADED"
var_0_0.DID_ENTER = "BaseUI:DID_ENTER"
var_0_0.AVALIBLE = "BaseUI:AVALIBLE"
var_0_0.DID_EXIT = "BaseUI:DID_EXIT"
var_0_0.ON_BACK = "BaseUI:ON_BACK"
var_0_0.ON_RETURN = "BaseUI:ON_RETURN"
var_0_0.ON_HOME = "BaseUI:ON_HOME"
var_0_0.ON_CLOSE = "BaseUI:ON_CLOSE"
var_0_0.ON_DROP = "BaseUI.ON_DROP"
var_0_0.ON_DROP_LIST = "BaseUI.ON_DROP_LIST"
var_0_0.ON_DROP_LIST_OWN = "BaseUI.ON_DROP_LIST_OWN"
var_0_0.ON_NEW_DROP = "BaseUI.ON_NEW_DROP"
var_0_0.ON_ITEM = "BaseUI:ON_ITEM"
var_0_0.ON_ITEM_EXTRA = "BaseUI.ON_ITEM_EXTRA"
var_0_0.ON_SHIP = "BaseUI:ON_SHIP"
var_0_0.ON_AWARD = "BaseUI:ON_AWARD"
var_0_0.ON_ACHIEVE = "BaseUI:ON_ACHIEVE"
var_0_0.ON_ACHIEVE_AUTO = "BaseUI:ON_ACHIEVE_AUTO"
var_0_0.ON_WORLD_ACHIEVE = "BaseUI:ON_WORLD_ACHIEVE"
var_0_0.ON_EQUIPMENT = "BaseUI:ON_EQUIPMENT"
var_0_0.ON_SPWEAPON = "BaseUI:ON_SPWEAPON"
var_0_0.ON_SHIP_EXP = "BaseUI.ON_SHIP_EXP"
var_0_0.ON_BACK_PRESSED = "BaseUI:ON_BACK_PRESS"

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0._isLoaded = false
	arg_1_0._go = nil
	arg_1_0._tf = nil
	arg_1_0._isCachedView = false
end

function var_0_0.setContextData(arg_2_0, arg_2_1)
	arg_2_0.contextData = arg_2_1
end

function var_0_0.getUIName(arg_3_0)
	return nil
end

function var_0_0.needCache(arg_4_0)
	return false
end

function var_0_0.forceGC(arg_5_0)
	return false
end

function var_0_0.loadingQueue(arg_6_0)
	return false
end

function var_0_0.lowerAdpter(arg_7_0)
	return false
end

function var_0_0.tempCache(arg_8_0)
	return false
end

function var_0_0.getGroupName(arg_9_0)
	return nil
end

function var_0_0.getLayerWeight(arg_10_0)
	return LayerWeightConst.BASE_LAYER
end

function var_0_0.preload(arg_11_0, arg_11_1)
	arg_11_1()
end

function var_0_0.loadUISync(arg_12_0, arg_12_1)
	local var_12_0 = LoadAndInstantiateSync("UI", arg_12_1, true, false)
	local var_12_1 = pg.UIMgr.GetInstance().UIMain

	var_12_0.transform:SetParent(var_12_1.transform, false)

	return var_12_0
end

function var_0_0.load(arg_13_0)
	local var_13_0
	local var_13_1 = Time.realtimeSinceStartup
	local var_13_2 = arg_13_0:getUIName()

	seriesAsync({
		function(arg_14_0)
			arg_13_0:preload(arg_14_0)
		end,
		function(arg_15_0)
			arg_13_0:LoadUIFromPool(var_13_2, function(arg_16_0)
				print("Loaded " .. var_13_2)

				var_13_0 = arg_16_0

				arg_15_0()
			end)
		end
	}, function()
		originalPrint("load " .. var_13_0.name .. " time cost: " .. Time.realtimeSinceStartup - var_13_1)

		local var_17_0 = pg.UIMgr.GetInstance().UIMain

		var_13_0.transform:SetParent(var_17_0.transform, false)

		if arg_13_0:tempCache() then
			PoolMgr.GetInstance():AddTempCache(var_13_2)
		end

		arg_13_0:onUILoaded(var_13_0)
	end)
end

function var_0_0.LoadUIFromPool(arg_18_0, arg_18_1, arg_18_2)
	PoolMgr.GetInstance():GetUI(arg_18_1, true, arg_18_2)
end

function var_0_0.getBGM(arg_19_0, arg_19_1)
	return getBgm(arg_19_1 or arg_19_0.__cname)
end

function var_0_0.PlayBGM(arg_20_0)
	local var_20_0 = arg_20_0:getBGM()

	if var_20_0 then
		pg.BgmMgr.GetInstance():Push(arg_20_0.__cname, var_20_0)
	end
end

function var_0_0.StopBgm(arg_21_0)
	if not arg_21_0.contextData then
		return
	end

	if arg_21_0.contextData.isLayer then
		pg.BgmMgr.GetInstance():Pop(arg_21_0.__cname)
	else
		pg.BgmMgr.GetInstance():Clear()
	end
end

function var_0_0.SwitchToDefaultBGM(arg_22_0)
	local var_22_0 = arg_22_0:getBGM()

	if not var_22_0 then
		if pg.CriMgr.GetInstance():IsDefaultBGM() then
			var_22_0 = pg.voice_bgm.NewMainScene.default_bgm
		else
			var_22_0 = pg.voice_bgm.NewMainScene.bgm
		end
	end

	pg.BgmMgr.GetInstance():Push(arg_22_0.__cname, var_22_0)
end

function var_0_0.isLoaded(arg_23_0)
	return arg_23_0._isLoaded
end

function var_0_0.getGroupNameFromData(arg_24_0)
	local var_24_0

	if arg_24_0.contextData ~= nil and arg_24_0.contextData.LayerWeightMgr_groupName then
		var_24_0 = arg_24_0.contextData.LayerWeightMgr_groupName
	else
		var_24_0 = arg_24_0:getGroupName()
	end

	return var_24_0
end

function var_0_0.getWeightFromData(arg_25_0)
	local var_25_0

	if arg_25_0.contextData ~= nil and arg_25_0.contextData.LayerWeightMgr_weight then
		var_25_0 = arg_25_0.contextData.LayerWeightMgr_weight
	else
		var_25_0 = arg_25_0:getLayerWeight()
	end

	return var_25_0
end

function var_0_0.isLayer(arg_26_0)
	return arg_26_0.contextData ~= nil and arg_26_0.contextData.isLayer
end

function var_0_0.addToLayerMgr(arg_27_0)
	local var_27_0 = arg_27_0:getGroupNameFromData()
	local var_27_1 = arg_27_0:getWeightFromData()

	pg.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_SYSTEM, arg_27_0._tf, {
		globalBlur = false,
		groupName = var_27_0,
		weight = var_27_1
	})
end

var_0_0.optionsPath = {
	"option",
	"top/option",
	"top/left_top/option",
	"blur_container/top/title/option",
	"blur_container/top/option",
	"top/top/option",
	"common/top/option",
	"blur_panel/top/option",
	"blurPanel/top/option",
	"blur_container/top/option",
	"top/title/option",
	"blur_panel/adapt/top/option",
	"mainPanel/top/option",
	"bg/top/option",
	"blur_container/adapt/top/title/option",
	"blur_container/adapt/top/option",
	"ForNorth/top/option",
	"top/top_chapter/option",
	"Main/blur_panel/adapt/top/option"
}

function var_0_0.onUILoaded(arg_28_0, arg_28_1)
	arg_28_0._go = arg_28_1
	arg_28_0._tf = arg_28_1 and arg_28_1.transform

	if arg_28_0:isLayer() then
		arg_28_0:addToLayerMgr()
	end

	pg.SeriesGuideMgr.GetInstance():dispatch({
		view = arg_28_0.__cname
	})
	pg.NewStoryMgr.GetInstance():OnSceneEnter({
		view = arg_28_0.__cname
	})

	arg_28_0._isLoaded = true

	pg.DelegateInfo.New(arg_28_0)

	arg_28_0.optionBtns = {}

	for iter_28_0, iter_28_1 in ipairs(arg_28_0.optionsPath) do
		table.insert(arg_28_0.optionBtns, arg_28_0:findTF(iter_28_1))
	end

	setActiveViaLayer(arg_28_0._tf, true)
	arg_28_0:init()
	arg_28_0:emit(var_0_0.LOADED)
end

function var_0_0.ResUISettings(arg_29_0)
	return nil
end

function var_0_0.ShowOrHideResUI(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0:ResUISettings()

	if not var_30_0 then
		return
	end

	if var_30_0 == true then
		var_30_0 = {
			anim = true,
			showType = PlayerResUI.TYPE_ALL
		}
	end

	pg.playerResUI:SetActive(setmetatable({
		active = arg_30_1,
		clear = not arg_30_1 and not arg_30_0:isLayer(),
		weight = var_30_0.weight or arg_30_0:getWeightFromData(),
		groupName = var_30_0.groupName or arg_30_0:getGroupNameFromData(),
		canvasOrder = var_30_0.order or false
	}, {
		__index = var_30_0
	}))
end

function var_0_0.onUIAnimEnd(arg_31_0, arg_31_1)
	arg_31_1()
end

function var_0_0.init(arg_32_0)
	return
end

function var_0_0.quickExitFunc(arg_33_0)
	arg_33_0:emit(var_0_0.ON_HOME)
end

function var_0_0.quickExit(arg_34_0)
	for iter_34_0, iter_34_1 in ipairs(arg_34_0.optionBtns) do
		onButton(arg_34_0, iter_34_1, function()
			arg_34_0:quickExitFunc()
		end, SFX_PANEL)
	end
end

function var_0_0.enter(arg_36_0)
	arg_36_0:quickExit()
	arg_36_0:PlayBGM()

	local function var_36_0()
		arg_36_0:emit(var_0_0.DID_ENTER)

		if arg_36_0:lowerAdpter() then
			setActive(pg.CameraFixMgr.GetInstance().adpterTr, false)
		end

		if not arg_36_0._isCachedView then
			arg_36_0:didEnter()
			arg_36_0:ShowOrHideResUI(true)
		end

		if tobool(arg_36_0:loadingQueue()) and arg_36_0.contextData.resumeCallback then
			local var_37_0 = arg_36_0.contextData.resumeCallback

			arg_36_0.contextData.resumeCallback = nil

			var_37_0()
		end

		arg_36_0:emit(var_0_0.AVALIBLE)
		arg_36_0:onUIAnimEnd(function()
			pg.SeriesGuideMgr.GetInstance():start({
				view = arg_36_0.__cname,
				code = {
					pg.SeriesGuideMgr.CODES.MAINUI
				}
			})
			pg.NewGuideMgr.GetInstance():OnSceneEnter({
				view = arg_36_0.__cname
			})
		end)
	end

	arg_36_0:inOutAnim(true, var_36_0)
end

function var_0_0.closeView(arg_39_0)
	if arg_39_0.contextData.isLayer then
		arg_39_0:emit(var_0_0.ON_CLOSE)
	else
		arg_39_0:emit(var_0_0.ON_BACK)
	end
end

function var_0_0.didEnter(arg_40_0)
	return
end

function var_0_0.willExit(arg_41_0)
	return
end

function var_0_0.exit(arg_42_0)
	arg_42_0.exited = true

	arg_42_0:StopBgm()
	pg.DelegateInfo.Dispose(arg_42_0)

	local function var_42_0()
		arg_42_0:willExit()
		arg_42_0:ShowOrHideResUI(false)
		arg_42_0:detach()

		if arg_42_0:lowerAdpter() then
			setActive(pg.CameraFixMgr.GetInstance().adpterTr, true)
		end

		pg.NewGuideMgr.GetInstance():OnSceneExit({
			view = arg_42_0.__cname
		})
		pg.NewStoryMgr.GetInstance():OnSceneExit({
			view = arg_42_0.__cname
		})
		arg_42_0:emit(var_0_0.DID_EXIT)
	end

	arg_42_0:inOutAnim(false, var_42_0)
end

function var_0_0.inOutAnim(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = false

	if arg_44_1 then
		if not IsNil(arg_44_0._tf:GetComponent(typeof(Animation))) then
			arg_44_0.animTF = arg_44_0._tf
		else
			arg_44_0.animTF = arg_44_0:findTF("blur_panel")
		end

		if arg_44_0.animTF ~= nil then
			local var_44_1 = arg_44_0.animTF:GetComponent(typeof(Animation))
			local var_44_2 = arg_44_0.animTF:GetComponent(typeof(UIEventTrigger))

			if var_44_1 ~= nil and var_44_2 ~= nil then
				if var_44_1:get_Item("enter") == nil then
					originalPrint("cound not found enter animation")
				else
					var_44_1:Play("enter")
				end
			elseif var_44_1 ~= nil then
				originalPrint("cound not found [UIEventTrigger] component")
			elseif var_44_2 ~= nil then
				originalPrint("cound not found [Animation] component")
			end
		end
	end

	if not var_44_0 then
		arg_44_2()
	end
end

function var_0_0.PlayExitAnimation(arg_45_0, arg_45_1)
	local var_45_0 = arg_45_0._tf:GetComponent(typeof(Animation))
	local var_45_1 = arg_45_0._tf:GetComponent(typeof(UIEventTrigger))

	var_45_1.didExit:RemoveAllListeners()
	var_45_1.didExit:AddListener(function()
		var_45_1.didExit:RemoveAllListeners()
		arg_45_1()
	end)
	var_45_0:Play("exit")
end

function var_0_0.attach(arg_47_0, arg_47_1)
	return
end

function var_0_0.ClearTweens(arg_48_0, arg_48_1)
	arg_48_0:cleanManagedTween(arg_48_1)
end

function var_0_0.RemoveTempCache(arg_49_0)
	local var_49_0 = arg_49_0:getUIName()

	PoolMgr.GetInstance():DelTempCache(var_49_0)
end

function var_0_0.detach(arg_50_0, arg_50_1)
	arg_50_0._isLoaded = false

	pg.LayerWeightMgr.GetInstance():DelFromOverlay(arg_50_0._tf)
	pg.DynamicBgMgr.GetInstance():ClearBg(arg_50_0:getUIName())
	arg_50_0:disposeEvent()
	arg_50_0:ClearTweens(false)

	arg_50_0._tf = nil

	local var_50_0 = PoolMgr.GetInstance()
	local var_50_1 = arg_50_0:getUIName()

	if arg_50_0._go ~= nil and var_50_1 then
		var_50_0:ReturnUI(var_50_1, arg_50_0._go)

		arg_50_0._go = nil
	end
end

function var_0_0.findGO(arg_51_0, arg_51_1, arg_51_2)
	assert(arg_51_0._go, "game object should exist")

	return findGO(arg_51_2 or arg_51_0._go, arg_51_1)
end

function var_0_0.findTF(arg_52_0, arg_52_1, arg_52_2)
	assert(arg_52_0._tf, "transform should exist")

	return findTF(arg_52_2 or arg_52_0._tf, arg_52_1)
end

function var_0_0.getTpl(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = arg_53_0:findTF(arg_53_1, arg_53_2)

	var_53_0:SetParent(arg_53_0._tf, false)
	SetActive(var_53_0, false)

	return var_53_0
end

function var_0_0.setSpriteTo(arg_54_0, arg_54_1, arg_54_2, arg_54_3)
	local var_54_0 = arg_54_2:GetComponent(typeof(Image))

	var_54_0.sprite = arg_54_0:findTF(arg_54_1):GetComponent(typeof(Image)).sprite

	if arg_54_3 then
		var_54_0:SetNativeSize()
	end
end

function var_0_0.setImageAmount(arg_55_0, arg_55_1, arg_55_2)
	arg_55_1:GetComponent(typeof(Image)).fillAmount = arg_55_2
end

function var_0_0.setVisible(arg_56_0, arg_56_1)
	arg_56_0:ShowOrHideResUI(arg_56_1)

	if arg_56_1 then
		arg_56_0:OnVisible()
	else
		arg_56_0:OnDisVisible()
	end

	setActiveViaLayer(arg_56_0._tf, arg_56_1)
end

function var_0_0.OnVisible(arg_57_0)
	return
end

function var_0_0.OnDisVisible(arg_58_0)
	return
end

function var_0_0.onBackPressed(arg_59_0)
	arg_59_0:emit(var_0_0.ON_BACK_PRESSED)
end

return var_0_0
