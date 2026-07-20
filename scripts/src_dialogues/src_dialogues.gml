global.dialogues =
{
	names : {
		shi_qingxuan : "Shi Qingxuan",
		xie_lian : "Xie Lian",
		shop_owner : "Shop Owner",
		flower_lady : "Flower Lady",
		hua_cheng : "Hua Cheng",
		lantern_seller : "Lantern Seller",
		Painting : "Painting",
		Basket : "Basket",
		CartDriver : "Carriage Driver",
		Who : "???",
		San_Lang : "San Lang",
		Carriage : "Carriage"
	},
	colors : {
		"Shi Qingxuan": c_black,
		"Xie Lian": c_black,
		"Shop Owner": c_dkgrey,
		"Flower Lady": c_dkgrey,
		"Hua Cheng": c_black,
		"Lantern Seller": c_dkgrey,
		"Painting": c_navy,
		"Basket": c_navy,
		"Carriage Driver": c_dkgrey,
		"???": c_black,
		"San Lang": c_black,
		"Carriage": c_dkgrey
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
        new DialogueLine(global.dialogues.names.shop_owner, "Hello Shrine Keeper, welcome to my shop.", undefined),
    ],
    global.shop_data.basic_shop
)

global.dialogues.lantern_seller_dialogue = new DialogueData(
    "lantern_seller_dialogue",
    [
        new DialogueLine(global.dialogues.names.lantern_seller, ". . . Hello there priest..", undefined),
        new DialogueLine(global.dialogues.names.lantern_seller, "Do you want to buy this rare lantern? These are not like the ordinary ones, these are guaranteed to make any wish come true.", undefined),
		 new DialogueLine(global.dialogues.names.lantern_seller, "...", undefined),
    ],
    global.shop_data.lantern_shop
)
global.dialogues.CrownPrinceXieLian = new DialogueData(
    "CrownPrinceXieLian",
    [
        new DialogueLine(global.dialogues.names.Painting, "A painting of the crown prince of Xian Le, XieLian."),
        new DialogueLine(global.dialogues.names.Painting, "The painting is very well made, every stroke is perfectly placed."),
      
    ],
	)
	
	global.dialogues.StaleBread = new DialogueData(
    "Basket",
    [
        new DialogueLine(global.dialogues.names.Basket, "A basket with stale bread."),
        new DialogueLine(global.dialogues.names.Basket, "You tried baking but accidentaly dropped in too much salt an not enough water so they've just been sitting in this basket ever since..."),
    ],
	)
	global.dialogues.xie_lian_fell_dialogue = new DialogueData(
	"XieLianFellDialogue", 
	[
	new DialogueLine("Xie Lian", "Ouch, that hurt"),
	new DialogueLine("Xie Lian", "I had nothing better to do so I decided to return to the mortal realm..."),
	new DialogueLine("Xie Lian", "Because I have no worshippers I might as well worship myself."),
	new DialogueLine("Xie Lian", "To be honest, collecting scrap isn't any better than acending."),
	new DialogueLine("Xie Lian", "I can gain merits this way at least."),
	]
	)
	global.dialogues.CartDriver1 = new DialogueData(
    "CartDriver_dialogue_1",
    [
        new DialogueLine(global.dialogues.names.xie_lian, "Hello sir! Where are you headed?", Spr_Expression_XieLian_Talking),
        new DialogueLine(global.dialogues.names.CartDriver, "Woah, hello there. Where did you come from?", undefined),
		 new DialogueLine(global.dialogues.names.CartDriver, "I am heading to Puqi Village, why?", undefined),
		new DialogueLine(global.dialogues.names.xie_lian, "That't great, would you mind me tagging along?", Spr_Expression_XieLian_EyesClosed),
		new DialogueLine(global.dialogues.names.CartDriver, "Oh, sure. Make yourself comfortable in the back.", undefined),
		new DialogueLine(global.dialogues.names.xie_lian, "Thank you so much sir. May the Gods bless you.", Spr_Expression_XieLian_EyesClosed),	
		new DialogueLine(global.dialogues.names.CartDriver, "Don't mention it.", undefined),
    ],
)
global.dialogues.cart_hualian = new DialogueData("cart_hualian", [
	new DialogueLine("Xie Lian", "Hello."),
	new DialogueLine("???", "Hi."),
	new DialogueLine("???", "What is that you are reading?"),
	new DialogueLine("Xie Lian", "Ehh, Catalogue of 100 Gods. It says that Crown prince of Xian Le is a scrap God."),
	new DialogueLine("Xie Lian", "But honestly, all Gods are born equally so it's not that big of a difference..."),
	new DialogueLine("???", "If that was true then no Gods would exist, right?"),
	new DialogueLine("Xie Lian", "You have a point..."),
	new DialogueLine("Xie Lian", "Shi Wudu is the water God. If he is a water God then why is he also in charge of fortunes?"),
	new DialogueLine("???", "Because merchants and buisness men almost always travel via water routs. He has the power to determine weather a boat can cross or not."),
	new DialogueLine("???", "This carrige driver is actually going to cross Water town on his way to Puqi Village"),
	new DialogueLine("Xie Lian", "You are so young yet you know so much. What do you know about ghosts?"),
	new DialogueLine("???", "Which ones?"),
	new DialogueLine("Xie Lian", "What do you know about the Crimson Rain Sought Flower, Hua Cheng?"),
	new DialogueLine("???", "..."),
	new DialogueLine("???", "What do you want to know about him?"),
	new DialogueLine("Xie Lian", "What was he like as a person?"),
	new DialogueLine("???", "He definitley couldn't have been a good person."),
	new DialogueLine("Xie Lian", "oh... What did he look like?"),
	new DialogueLine("???", "... What do you think he looked like?"),
	new DialogueLine("Xie Lian", "..."),
	new DialogueLine("Xie Lian", "I assume he has many forms. As a teenager he probably looked something like yourself."),
	new DialogueLine("???", "You can't be sure though. He is blind in his right eye."),
	new DialogueLine("Xie Lian", "Oh that's right. By the way, I haven't asked you your name. "),
	new DialogueLine("San Lang", "I am third born so everyone calls me San (3) Lang."),
	new DialogueLine("Xie Lian", "I am Xie Lian. Where are you headed?"),
	new DialogueLine("San Lang", "No clue actually, I am just wandering around."),
	new DialogueLine("Carriage", "THUD..."),
	new DialogueLine("Xie Lian", "What happend are you alright?"),
	new DialogueLine("Carriage Driver", "I dont know! There seem to be GHOSTS!"),
	
]
)
;