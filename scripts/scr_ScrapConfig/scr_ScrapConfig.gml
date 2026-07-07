function scr_ScrapMaxForRoom(_room) {
	switch (_room) {
		case puqi_village: return 12;
		case forest:       return 5;
		default:           return 0;
	}
}