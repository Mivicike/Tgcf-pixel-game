// Trigger game fade in whenever a room is loaded
switch(room)
{
	case menu:
		// No fade in for menu
		break;
	default:
		fade_alpha  = 1;
		fade_target = 1;
		alarm[0] = 8;
		break;
}