function scr_Kitchen_SpiceGrabSprite(_type) {
	switch (_type) {
		case KITCHEN_SPICE.CHILI:
		case KITCHEN_SPICE.RED:
			return spr_KitchenGrab_Red;
		case KITCHEN_SPICE.PAKCHOI:
		case KITCHEN_SPICE.GREEN:
			return spr_KitchenGrab_Green;
		case KITCHEN_SPICE.YELLOW:
			return spr_KitchenGrab_Yellow;
		case KITCHEN_SPICE.SALT:
			return spr_KitchenGrab_Salt;
	}
	return -1;
}