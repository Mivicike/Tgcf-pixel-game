draw_self();

if (can_talk && !instance_exists(obj_Dialogue))
{
	draw_sprite(Spr_Interact, 0, x + 136 , y + 5 );
}
