function create_dialog(_messages){
	if (instance_exists(Obj_Dialogue)) return;
	
	var _inst = instance_create_depth(0, 0, 0, Obj_Dialogue);
	_inst.messages = _messages;
	_inst.current_message = 0;
}

char_colors = {
	"Xie Lian": c_orange,
	"Store Owner": c_fuchsia
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