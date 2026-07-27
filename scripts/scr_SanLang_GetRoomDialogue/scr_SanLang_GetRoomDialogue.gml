function scr_SanLang_GetRoomDialogue(_room) {
    switch (_room) {
        case puqi_village: return global.dialogues.SanLang_PuqiVillage_Default;
        case forest:       return global.dialogues.SanLang_Forest_Default;
        default:           return global.dialogues.SanLang_Generic_Default;
    }
}