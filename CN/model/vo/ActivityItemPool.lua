slot0 = class("ActivityItemPool", import(".BaseVO"))
slot1 = pg.activity_random_award_item

slot0.Ctor = function(slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.awards = slot1.awards or {}
	slot0.prevId = slot1.prevId
	slot0.index = slot1.index
end

slot0.bindConfigTable = function(slot0)
	return pg.activity_random_award_template
end

slot0.getComsume = function(slot0)
	return {
		type = slot0:getConfig("resource_category"),
		id = slot0:getConfig("resource_type"),
		count = slot0:getConfig("resource_num")
	}
end

slot0.enoughResForUsage = function(slot0, slot1)
	if slot0:getComsume().type == DROP_TYPE_RESOURCE then
		if getProxy(PlayerProxy):getData():getResById(slot2.id) < slot2.count * slot1 then
			return false
		end
	elseif slot2.type == DROP_TYPE_ITEM and getProxy(BagProxy):getItemCountById(slot2.id) < slot2.count * slot1 then
		return false
	end

	return true
end

slot0.getItemCount = function(slot0)
	return _.reduce(slot0:getConfig("item_list"), 0, function (slot0, slot1)
		return slot0 + slot1[2]
	end)
end

slot0.getleftItemCount = function(slot0)
	return slot0:getItemCount() - slot0:getFetchCount()
end

slot0.getFetchCount = function(slot0)
	return _.reduce(_.values(slot0.awards), 0, function (slot0, slot1)
		return slot0 + slot1
	end)
end

slot0.getMainItems = function(slot0)
	return slot0:filterItems(true)
end

slot0.filterItems = function(slot0, slot1)
	slot2 = slot0:getConfig("main_item")

	return _.map(_.select(slot0:getConfig("item_list"), function (slot0)
		if uv0 then
			return table.contains(uv1, slot0[1])
		else
			return not table.contains(uv1, slot0[1])
		end
	end), function (slot0)
		slot1 = uv0[slot0[1]]

		return {
			id = slot1.commodity_id,
			type = slot1.resource_category,
			count = slot1.num,
			surplus = slot0[2] - (uv1.awards[slot0[1]] or 0),
			total = slot0[2]
		}
	end)
end

slot0.getItems = function(slot0)
	return slot0:filterItems(true), slot0:filterItems(false)
end

slot0.canOpenNext = function(slot0)
	return _.all(slot0:getMainItems(), function (slot0)
		return slot0.surplus == 0
	end)
end

return slot0
