local var_0_0 = class("SkinAtlasCard")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0.usingTr = findTF(arg_1_0._tf, "using")
	arg_1_0.unavailableTr = findTF(arg_1_0._tf, "unavailable")
	arg_1_0.icon = findTF(arg_1_0._tf, "mask/icon"):GetComponent(typeof(Image))
	arg_1_0.name = findTF(arg_1_0._tf, "name/Text"):GetComponent(typeof(Text))
	arg_1_0.tags = {
		findTF(arg_1_0._tf, "tags/icon")
	}
	arg_1_0.changeSkinUI = findTF(arg_1_0._tf, "changeSkin")
	arg_1_0.changeSkinToggle = nil
end

function var_0_0.Update(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.index = arg_2_2
	arg_2_0.skin = arg_2_1

	LoadSpriteAtlasAsync("shipYardIcon/" .. arg_2_1:getConfig("painting"), "", function(arg_3_0)
		if arg_2_0.exited then
			return
		end

		arg_2_0.icon.sprite = arg_3_0
	end)

	local var_2_0 = arg_2_1:getConfig("ship_group")
	local var_2_1 = getProxy(BayProxy):findShipsByGroup(var_2_0)
	local var_2_2 = _.any(var_2_1, function(arg_4_0)
		return ShipGroup.IsSameChangeSkinGroup(arg_4_0.skinId, arg_2_1.id) or arg_4_0.skinId == arg_2_1.id
	end)

	setActive(arg_2_0.usingTr, #var_2_1 > 0 and var_2_2)

	local var_2_3 = getProxy(CollectionProxy).shipGroups[var_2_0] == nil

	setActive(arg_2_0.unavailableTr, #var_2_1 == 0 or var_2_3)

	local var_2_4 = arg_2_1:getConfig("name")

	arg_2_0.name.text = shortenString(var_2_4, 7)

	local var_2_5 = ShipGroup.GetChangeSkinData(arg_2_0.skin.id)

	setActive(arg_2_0.changeSkinUI, var_2_5 and true or false)

	if var_2_5 then
		if not arg_2_0.changeSkinToggle then
			arg_2_0.changeSkinToggle = ChangeSkinToggle.New(findTF(arg_2_0.changeSkinUI, "ChangeSkinToggleUI"))
		end

		arg_2_0.changeSkinToggle:setSkinData(arg_2_0.skin.id)
	end

	arg_2_0:FlushTags(arg_2_1:getConfig("tag"))
end

function var_0_0.changeSkinNext(arg_5_0)
	if ShipGroup.GetChangeSkinData(arg_5_0.skin.id) then
		local var_5_0 = ShipGroup.GetChangeSkinNextId(arg_5_0.skin.id)
		local var_5_1 = ShipSkin.New({
			id = var_5_0
		})

		arg_5_0:Update(var_5_1, arg_5_0.index)
	end
end

function var_0_0.FlushTags(arg_6_0, arg_6_1)
	local var_6_0 = -10
	local var_6_1 = arg_6_0.tags[1]

	for iter_6_0 = #arg_6_0.tags + 1, #arg_6_1 do
		local var_6_2 = Object.Instantiate(var_6_1, var_6_1.parent)

		arg_6_0.tags[iter_6_0] = var_6_2
	end

	for iter_6_1 = 1, #arg_6_1 do
		local var_6_3 = arg_6_0.tags[iter_6_1]

		setActive(var_6_3, true)
		LoadSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(arg_6_1[iter_6_1]), function(arg_7_0)
			if arg_6_0.exited then
				return
			end

			var_6_3:GetComponent(typeof(Image)).sprite = arg_7_0
		end)

		local var_6_4 = var_6_1.localPosition.y - (iter_6_1 - 1) * (var_6_1.sizeDelta.x + var_6_0)

		var_6_3.localPosition = Vector3(var_6_3.localPosition.x, var_6_4, 0)
	end

	for iter_6_2 = #arg_6_1 + 1, #arg_6_0.tags do
		setActive(arg_6_0.tags[iter_6_2], false)
	end
end

function var_0_0.Dispose(arg_8_0)
	arg_8_0.exited = true
end

return var_0_0
