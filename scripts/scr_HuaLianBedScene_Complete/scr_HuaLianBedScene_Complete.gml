function scr_HuaLianBedScene_Complete() {
	scr_SaveData_SetFlag("hualian_bed_scene_done", true);
	scr_SaveData_SetFlag("sanlang_gone", true);
	if (instance_exists(obj_SanLang)) {
		instance_destroy(obj_SanLang);
	}
	scr_SpawnPersistentCharacter(obj_HuaCheng, QirongCave, 2990, 1110);
	scr_SpawnPersistentCharacter(obj_NanFeng, puqi_village, 980, 250);
	scr_SpawnPersistentCharacter(obj_FuYao, puqi_village, 1010, 250);
	if (instance_exists(obj_XieLian)) {
		obj_XieLian.movement_locked = false;
		global.suppress_room_music = false;
	}
	instance_destroy();
}