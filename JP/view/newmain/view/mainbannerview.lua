local var_0_0 = class("MainBannerView", import("view.base.BaseEventLogic"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_2)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0._tf = arg_1_1
	arg_1_0._go = arg_1_1.gameObject
	arg_1_0.event = arg_1_2
	arg_1_0.scrollSnap = BannerScrollRect.New(findTF(arg_1_1, "mask/content"), findTF(arg_1_1, "dots"))
end

function var_0_0.Init(arg_2_0)
	local var_2_0 = getProxy(ActivityProxy):getBannerDisplays()

	arg_2_0:UpdateItems(var_2_0)

	arg_2_0.banners = var_2_0
end

function var_0_0.Refresh(arg_3_0)
	local var_3_0 = getProxy(ActivityProxy):getBannerDisplays()

	if #arg_3_0.banners ~= #var_3_0 then
		arg_3_0:Clear()
		arg_3_0:Init()
	else
		arg_3_0.scrollSnap:Resume()
	end
end

function var_0_0.UpdateItems(arg_4_0, arg_4_1)
	for iter_4_0 = 0, #arg_4_1 - 1 do
		local var_4_0 = arg_4_1[iter_4_0 + 1]
		local var_4_1 = arg_4_0.scrollSnap:AddChild()

		LoadImageSpriteAsync("activitybanner/" .. var_4_0.pic, var_4_1)

		local var_4_2 = var_4_0.type == 3 and tonumber(var_4_0.param) == nil and getProxy(ActivityProxy):readyToAchieveByType(ActivityConst.ACTIVITY_TYPE_LEVELAWARD)

		setActive(findTF(var_4_1, "red"), var_4_2)
		onButton(arg_4_0, var_4_1, function()
			MainBaseActivityBtn.Skip(arg_4_0, var_4_0)
		end, SFX_MAIN)
	end

	arg_4_0.scrollSnap:SetUp()
end

function var_0_0.Fold(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.lposX = arg_6_0.lposX or arg_6_0._tf.localPosition.x

	local var_6_0 = arg_6_1 and arg_6_0.lposX + 1200 or arg_6_0.lposX

	if arg_6_2 == 0 then
		local var_6_1 = arg_6_0._go.transform.localPosition

		arg_6_0._go.transform.localPosition = Vector3(var_6_0, var_6_1.y, 0)
	else
		LeanTween.moveLocalX(arg_6_0._go, var_6_0, arg_6_2):setEase(LeanTweenType.easeInOutExpo)
	end
end

function var_0_0.Disable(arg_7_0)
	arg_7_0.scrollSnap:Puase()

	arg_7_0.lposX = nil
end

function var_0_0.Clear(arg_8_0)
	arg_8_0.scrollSnap:Reset()
end

function var_0_0.Dispose(arg_9_0)
	arg_9_0:disposeEvent()
	pg.DelegateInfo.Dispose(arg_9_0)
	arg_9_0:Clear()
	arg_9_0.scrollSnap:Dispose()

	arg_9_0.scrollSnap = nil
end

return var_0_0
