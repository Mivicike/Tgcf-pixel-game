global.dialogues =
{
	names : {
		shi_qingxuan : "Shi Qingxuan",
		xie_lian : "Xie Lian",
		shop_owner : "Shop Owner",
		flower_lady : "Flower Lady",
		hua_cheng : "Hua Cheng",
        lantern_seller : "Lantern Seller"
	},
	colors : {
		"Shi Qingxuan": c_black,
		"Xie Lian": c_black,
		"Shop Owner": c_dkgrey,
		"Flower Lady": c_dkgrey,
		"Hua Cheng": c_black,
        "Lantern Seller": c_dkgrey
	},
}

// Example dialogue data
global.dialogues.first_dialogue = new DialogueData(
    "first_dialogue",
    [
        new DialogueLine(global.dialogues.names.shi_qingxuan, "Well I'm here now", Spr_expression_ShiQX_Happy),
        new DialogueLine(global.dialogues.names.shi_qingxuan, "So let's go", Spr_expression_ShiQX_Default),
        new DialogueLine(global.dialogues.names.xie_lian, "Sorry, but I can't", Spr_Expression_XieLian_EyesClosed),
        new DialogueLine(global.dialogues.names.shi_qingxuan, "Why's that?", Spr_expression_ShiQX_Angry),
        new DialogueLine(global.dialogues.names.xie_lian, "I'm waiting for someone", Spr_Expression_XieLian_Talking),
        new DialogueLine(global.dialogues.names.shi_qingxuan, "??? You're waiting for me", Spr_expression_ShiQX_Talking),
        new DialogueLine(global.dialogues.names.xie_lian, "No... I'm waiting for the-", Spr_Expression_XieLian_Question),
        new DialogueLine(global.dialogues.names.xie_lian, "WIND MASTER!?", Spr_Expression_XieLian_Flusterd),
        new DialogueLine(global.dialogues.names.shi_qingxuan, "That's what I said", Spr_expression_ShiQX_Happy),
        new DialogueLine(global.dialogues.names.shi_qingxuan, "Come on now", Spr_expression_ShiQX_BlingBling),
        new DialogueLine(global.dialogues.names.shi_qingxuan, "Stop being so coy", Spr_expression_ShiQX_Default),
        new DialogueLine(global.dialogues.names.xie_lian, "Don't you recognize THE Wind Master Qingxuan?", Spr_expression_ShiQX_BlingBling),
    ]
);

// Flower Lady
global.dialogues.flower_lady_dialogue1 = new DialogueData(
    "flower_lady_dialogue1",
    [
        new DialogueLine(global.dialogues.names.flower_lady, "Hello there young man"),
        new DialogueLine(global.dialogues.names.xie_lian, "Hello miss, what pretty flowers you have here", Spr_Expression_XieLian_Talking),
        new DialogueLine(global.dialogues.names.flower_lady, "Thank you dear.They sure are pretty, the cats love them"),
        new DialogueLine(global.dialogues.names.xie_lian, "Cats?", Spr_Expression_XieLian_Question),
        new DialogueLine(global.dialogues.names.flower_lady, "yes.. oh that's right... I only have one cat here now. Unfortunatley the other two ran away.."),
        new DialogueLine(global.dialogues.names.flower_lady, "They have been gone for 3 days now..."),
    ]
);

// Example dialogue data
global.dialogues.test_dialogue = new DialogueData(
    "test_dialogue",
    [
        new DialogueLine(global.dialogues.names.shop_owner, "This is a test dialogue.", undefined),
        new DialogueLine(global.dialogues.names.shop_owner, "It has multiple messages.", undefined),
        new DialogueLine(global.dialogues.names.shop_owner, "And different expressions.", undefined),
    ],
    global.shop_data.basic_shop
)

global.dialogues.lantern_seller_dialogue = new DialogueData(
    "lantern_seller_dialogue",
    [
        new DialogueLine(global.dialogues.names.lantern_seller, "Welcome to my shop!", undefined),
        new DialogueLine(global.dialogues.names.lantern_seller, "Feel free to browse around and buy something if you like!", undefined),
    ],
    global.shop_data.landmark_shop
)