slot0 = class("MainCompatibleDataSequence")

slot0.Execute = function(slot0, slot1)
	seriesAsync({
		function (slot0)
			getProxy(IslandProxy):CheckAndRequest(slot0)
		end
	}, slot1)
end

return slot0
