with(obj_hurt_box){
	x = other.x + x_offset;
	y = other.y + y_offset;
}

with(all){
	depth = -bbox_bottom;
}

// Clamp the player's position to stay within the room boundaries based on the current room
// To prevent the need to place collision objects around the edges of the scene.
switch (room){
	case puqi_village:
		x = clamp(x, 0, room_width);
		y = clamp(y, 0, room_height);
		break;
	case forest:
		x = clamp(x, -423, room_width);
		y = clamp(y, 131, room_height);
		break;
			case Room_PuqiShrine:
		x = clamp(x, 0, room_width);
		y = clamp(y, 0, room_height);
		break;
			case Room_PuqiRestaurat:
		x = clamp(x, 255, room_width);
		y = clamp(y, 131, room_height);
		break;
}