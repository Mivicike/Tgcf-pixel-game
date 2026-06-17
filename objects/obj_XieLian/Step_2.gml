with(obj_hurt_box){
	x = other.x + x_offset;
	y = other.y + y_offset;
}

with(all){
	depth = -bbox_bottom;
}

switch (room){
	case puqi_village:
		x = clamp(x, -272, room_width);
		y = clamp(y, -272, room_height);
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