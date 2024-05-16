/// Assuming obj_character is the character object
//var character_depth = layer_get_depth(obj_XieLian.layer);
//show_debug_message(character_depth)
//show_debug_message(depth)

if instance_exists(obj_XieLian) && obj_XieLian.y >= self.y
{
show_debug_message("hello")
depth = 1
}

if instance_exists(obj_XieLian) && obj_XieLian.y <= self.y
{
	show_debug_message("hii")
depth = -1
}