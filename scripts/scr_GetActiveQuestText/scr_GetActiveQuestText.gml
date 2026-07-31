function scr_GetActiveQuestText() {
	if (scr_SaveData_GetFlag("sanlang_quest_active", false) && !scr_SaveData_GetFlag("sanlang_fed", false)) {
		return "Cook something for San Lang";
	}
	return "";
}