function create_dialog(_messages){
	if (instance_exists(obj_Dialogue)) return;
	
	var _inst = instance_create_depth(0, 0, 0, obj_Dialogue);
	_inst.messages = _messages;
	_inst.current_message = 0;
}

char_colors = {
	"Xie Lian": c_black,
	"Store Owner": c_dkgrey,
	"Flower Lady": c_dkgrey
}

first_dialog = [
{
	name: "Store Owner",
	msg: "Hello there Scrap Collector, nice to see you!",
	expression: "Spr_Expression_XieLian_EyesClosed"
},

{
	name: "Xie Lian",
	msg: "Hello! Nice to see you too.",
	expression: "Spr_Expression_XieLian_Talking"
},

{
	name: "Store Owner",
	msg: "Did it work?",
	expression: "Spr_Expression_XieLian_EyesClosed"
},
]

FloweLady_Dialog1 = [
{
	name: "Flower Lady",
	msg: "Hello there young man",
	expression: "Spr_Expression_XieLian_EyesClosed"
},

{
	name: "Xie Lian",
	msg: "Hello miss, what pretty flowers you have here",
	expression: "Spr_Expression_XieLian_Talking"
},

{
	name: "Flower Lady",
	msg: "Thank you dear.They sure are pretty, the cats love them",
	expression: "Spr_Expression_XieLian_EyesClosed"
},
{
	name: "Xie Lian",
	msg: "Cats?",
	expression: "Spr_Expression_XieLian_Talking"
},
{
	name: "Flower Lady",
	msg: "yes.. oh that's right... I only have one cat here now. Unfortunatley the other two ran away..",
	expression: "Spr_Expression_XieLian_EyesClosed"
},
{
	name: "Flower Lady",
	msg: "They have been gone for 3 days now...",
	expression: "Spr_Expression_XieLian_EyesClosed"
},
]