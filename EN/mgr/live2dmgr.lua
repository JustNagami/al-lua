pg = pg or {}
pg.Live2DMgr = singletonClass("Live2DMgr")
slot0 = pg.Live2DMgr

function slot0.Ctor(slot0)
	slot0.loader = AutoLoader.New()
end

function slot0.GetLive2DModelAsync(slot0, slot1, slot2)
	return slot0.loader:LoadLive2D(slot1, slot2)
end

function slot0.StopLoadingLive2d(slot0, slot1)
	slot0.loader:ClearRequest(slot1)
end
