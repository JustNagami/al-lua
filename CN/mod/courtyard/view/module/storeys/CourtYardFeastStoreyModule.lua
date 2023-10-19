slot0 = class("CourtYardFeastStoreyModule", import(".CourtYardStoreyModule"))

slot0.InitPedestalModule = function(slot0)
	slot0.pedestalModule = CourtYardFeastPedestalModule.New(slot0.data, slot0.bg)
end

return slot0
