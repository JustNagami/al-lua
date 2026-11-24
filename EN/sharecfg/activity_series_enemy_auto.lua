pg = pg or {}
pg.activity_series_enemy_auto = rawget(pg, "activity_series_enemy_auto") or setmetatable({
	__name = "activity_series_enemy_auto"
}, confNEO)
pg.activity_series_enemy_auto.all = {}
pg.base = pg.base or {}
pg.base.activity_series_enemy_auto = {}
