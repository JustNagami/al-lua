pg = pg or {}
pg.Live2DMgr = singletonClass("Live2DMgr")
this = pg.Live2DMgr

this.Ctor = function(slot0)
	slot0.loader = AutoLoader.New()
end

this.GetLive2DModelAsync = function(slot0, slot1, slot2)
	return slot0.loader:LoadLive2D(slot1, slot2)
end

this.StopLoadingLive2d = function(slot0, slot1)
	slot0.loader:ClearRequest(slot1)
end
