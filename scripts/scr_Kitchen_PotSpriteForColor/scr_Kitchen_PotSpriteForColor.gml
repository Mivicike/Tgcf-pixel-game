function scr_Kitchen_PotSpriteForColor(_color) {
	switch (_color) {
		case "Red":    return spr_KitchenPot_Red;
		case "Green":  return spr_KitchenPot_Green;
		case "Yellow": return spr_KitchenPot_Yellow;
		case "Failed": return spr_KitchenPot_Failed;
	}
	return -1;
}