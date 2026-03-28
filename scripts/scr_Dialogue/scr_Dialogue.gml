function create_dialog(_messages){
	if (instance_exists(obj_Dialogue)) return;
	
	var _inst = instance_create_depth(0, 0, 0, obj_Dialogue);
	_inst.messages = _messages;
	_inst.current_message = 0;
}

char_colors = {
	"Xie Lian": c_black,
	"Store Owner": c_dkgrey,
	"Flower Lady": c_dkgrey,
	"Hua Cheng": c_black,
	"Shi Qingxuan": c_black
}

first_dialog = [
{
	name: "Shi Qingxuan",
	msg: "Well I'm here now",
	expression: "Spr_expression_ShiQX_Happy"
},

{
	name: "Shi Qingxuan",
	msg: "So let's go",
	expression: "Spr_expression_ShiQX_Default"
},
{
	name: "Xie Lian",
	msg: "Sorry, but I can't",
	expression: "Spr_Expression_XieLian_EyesClosed"
},

{
	name: "Shi Qingxuan",
	msg: "Why's that?",
	expression: "Spr_expression_ShiQX_Angry"
},
{
	name: "Xie Lian",
	msg: "I'm waiting for someone",
	expression: "Spr_Expression_XieLian_Talking"
},
{
	name: "Shi Qingxuan",
	msg: "??? You're waiting for me",
	expression: "Spr_expression_ShiQX_Talking"
},
{
	name: "Xie Lian",
	msg: "No... I'm waiting for the-",
	expression: "Spr_Expression_XieLian_Question"
},
{
	name: "Xie Lian",
	msg: "WIND MASTER!?",
	expression: "Spr_Expression_XieLian_Flusterd"
},
{
	name: "Shi Qingxuan",
	msg: "That's what I said",
	expression: "Spr_expression_ShiQX_Happy"
},
{
	name: "Shi Qingxuan",
	msg: "Come on now",
	expression: "Spr_expression_ShiQX_BlingBling"
},
{
	name: "Shi Qingxuan",
	msg: "Stop being so coy",
	expression: "Spr_expression_ShiQX_Default"
},
{
	name: "Shi Qingxuan",
	msg: "Don't you recognize THE Wind Master Qingxuan?",
	expression: "Spr_expression_ShiQX_BlingBling"
},
]

FloweLady_Dialog1 = [
{
	name: "Flower Lady",
	msg: "Hello there young man",
},

{
	name: "Xie Lian",
	msg: "Hello miss, what pretty flowers you have here",
	expression: "Spr_Expression_XieLian_Talking"
},

{
	name: "Flower Lady",
	msg: "Thank you dear.They sure are pretty, the cats love them",
},
{
	name: "Xie Lian",
	msg: "Cats?",
	expression: "Spr_Expression_XieLian_Question"
},
{
	name: "Flower Lady",
	msg: "yes.. oh that's right... I only have one cat here now. Unfortunatley the other two ran away..",
},
{
	name: "Flower Lady",
	msg: "They have been gone for 3 days now...",
},
]