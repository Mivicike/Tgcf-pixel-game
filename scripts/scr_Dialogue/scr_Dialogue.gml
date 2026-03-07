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
	msg: "Hello there Scrap Collector, nice to see you!"
},

{
	name: "Xie Lian",
	msg: "Hello! Nice to see you too. I will try to see how this font spell out other letters. Åå, Ää, Öö, Áá, íí, 谢怜, Üü.I hope it can write other letters"
},

{
	name: "Store Owner",
	msg: "Did it work?"
},
]

FloweLady_Dialog1 = [
{
	name: "Flower Lady",
	msg: "Hello there young man"
},

{
	name: "Xie Lian",
	msg: "Hello miss, what pretty flowers you have here"
},

{
	name: "Flower Lady",
	msg: "Thank you dear.They sure are pretty, the cats love them"
},
{
	name: "Xie Lian",
	msg: "Cats?"
},
{
	name: "Flower Lady",
	msg: "yes.. oh that's right... I only have one cat here now. Unfortunatley the other two ran away.."
},
{
	name: "Flower Lady",
	msg: "They have been gone for 3 days now..."
},
]