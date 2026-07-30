function scr_Kitchen_SpiceColor(_type) {
	switch (_type) {
		case KITCHEN_SPICE.CHILI:
		case KITCHEN_SPICE.RED:
			return "Red";
		case KITCHEN_SPICE.PAKCHOI:
		case KITCHEN_SPICE.GREEN:
			return "Green";
		case KITCHEN_SPICE.YELLOW:
			return "Yellow";
	}
	return "";
}