event_inherited();

if (!scr_SaveData_GetFlag("candles_unlocked", false)) {
	has_item_message = "Maybe it is not the right time to do this.";
	missing_item_message = "Maybe it is not the right time to do this.";
} else {
	has_item_message = "Light candle!";
	missing_item_message = "I have no way to light this.";
}