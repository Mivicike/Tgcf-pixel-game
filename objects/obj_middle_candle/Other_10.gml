if (!scr_SaveData_GetFlag("candles_unlocked", false)) {
	exit;
}

is_lit = true;
scr_SaveData_SetObjectState(id, { is_lit: true });