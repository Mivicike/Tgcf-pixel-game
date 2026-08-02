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
		Carriage : "Carriage",
		Mivicike : "Mivicike",
		nan_feng : "Nan Feng",
		fu_yao	: "Fu Yao",
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
		"Carriage": c_dkgrey,
		"Mivicike": c_red,
		"Nan Feng": c_black,
		"Fu Yao": c_black,
	},
}

// Example dialogue data
global.dialogues.first_dialogue = new DialogueData(
    "first_dialogue",
    [
        new DialogueLine(global.dialogues.names.shi_qingxuan, "Hello there Xie Lian!", Spr_expression_ShiQX_Happy),
        new DialogueLine(global.dialogues.names.xie_lian, "Hello Wind Master!", Spr_Expression_XieLian_EyesClosed),
        new DialogueLine(global.dialogues.names.shi_qingxuan, "Just call me Qingxuan.", Spr_expression_ShiQX_Angry),
        new DialogueLine(global.dialogues.names.xie_lian, "No no Wind Master.", Spr_Expression_XieLian_Talking),
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
	new DialogueLine("Xie Lian", "Hello there. I didn't see you when I got on."),
	new DialogueLine("???", "Hello."),
	new DialogueLine("???", "What are you reading?"),
	new DialogueLine("Xie Lian", "Catalogue of 100 Gods. It's just something I found during my travels."),
	new DialogueLine("???", "Really? What's it about?"),
	new DialogueLine("Xie Lian", "..."),
	new DialogueLine("Xie Lian", "Gods... It says here that the Crown Prince of Xian Le is a trash god..."),
	new DialogueLine("???", "Is that so? I don't think he's a trash god. He's quite astonishing."),
	new DialogueLine("Xie Lian", "Oh, really!? You know about the Crown Prince of Xian Le, Xie Lian?"),
	new DialogueLine("???", "Of course I do."),
	new DialogueLine("Xie Lian", "Sadly, not many people know about him these days."),
	new DialogueLine("Xie Lian", "You seem to know so much, yet you're so young."),
	new DialogueLine("???", "It's just something I learned about in my free time."),
	new DialogueLine("Xie Lian", "Do you know anything about ghosts?"),
	new DialogueLine("???", "Which ones? There are many."),
	new DialogueLine("Xie Lian", "What do you know about the Crimson Rain Sought Flower?"),
	new DialogueLine("???", "..."),
	new DialogueLine("???", "Why him specifically?"),
	new DialogueLine("Xie Lian", "Just curious."),
	new DialogueLine("???", "... What do you want to know about him?"),
	new DialogueLine("Xie Lian", "Hmm..."),
	new DialogueLine("Xie Lian", "What did he look like?"),
	new DialogueLine("???", "... What do you think he looked like?"),
	new DialogueLine("Xie Lian", "I assume he has many forms. As a teenager, he probably looked something like you."),
	new DialogueLine("???", "You can't be sure, though. He's blind in his right eye."),
	new DialogueLine("Xie Lian", "Oh, that's right."),
	new DialogueLine("Xie Lian", "By the way, I haven't asked your name."),
	new DialogueLine("San Lang", "I'm the third-born son, so everyone calls me San Lang."),
	new DialogueLine("Xie Lian", "Where are you headed?"),
	new DialogueLine("San Lang", "Honestly, I have no idea. I'm just wandering around."),
	new DialogueLine("San Lang", "THUD", undefined, snd_Thud),
	new DialogueLine("Xie Lian", "What happened? Are you alright?"),
	new DialogueLine("Carriage Driver", "I don't know! There seem to be GHOSTS!"),
	]
)
// San Lang Dialogues
global.dialogues.SanLang_AgreeToFollow = new DialogueData("SanLang_AgreeToFollow",
	[
		new DialogueLine("San Lang", "Oh of course, where are we headed?", spr_SanLang_Expression_ClosedEyes)
	]
);

global.dialogues.SanLang_PuqiVillage_Default = new DialogueData("SanLang_PuqiVillage_Default",
	[
		new DialogueLine("San Lang", "Hello Gege!", spr_SanLang_Expression_Happy)
    ]
);

global.dialogues.SanLang_Forest_Default = new DialogueData("SanLang_Forest_Default",
	[
		new DialogueLine("San Lang", "Stay close in the forest, gege.")
	]
);

global.dialogues.SanLang_Generic_Default = new DialogueData("SanLang_Generic_Default",
	[
		new DialogueLine("San Lang", "...")
	]
)
global.dialogues.SanLang_AgreeToStay = new DialogueData("SanLang_AgreeToStay",
    [
        new DialogueLine("San Lang", "Ohh... Alright, I will stay here then...", spr_SanLang_Expression_LittleSad)
    ]
);

global.dialogues.SanLang_WhatAreYouUpTo = [
    new DialogueData("SanLang_WhatAreYouUpTo1", [
        new DialogueLine("San Lang", "Nothing much. Does gege want something?", spr_SanLang_Expression_Default)
    ]),
    new DialogueData("SanLang_WhatAreYouUpTo2", [
        new DialogueLine("San Lang", "I was just thinking about you Gege!", spr_SanLang_Expression_Happy)
    ]),
    new DialogueData("SanLang_WhatAreYouUpTo3", [
        new DialogueLine("San Lang", "Admiring you.", spr_SanLang_Expression_Love)
    ])
];

global.dialogues.SanLang_ItemGifts_Default = new DialogueData("SanLang_ItemGifts_Default",
    [
        new DialogueLine("San Lang", "AAAA THANK YOU SO MUCH GEGE I LOVE IT!", spr_SanLang_Expression_Happy)
    ]
);

global.dialogues.SanLang_ItemGifts = {
"Ghost Fire": new DialogueData("SanLang_Gift_GhostFire", [
new DialogueLine("San Lang", "...", spr_SanLang_Expression_LittleSad),
])

}
global.dialogues.CarriageDriver_GhostArrival = new DialogueData("Carriage Driver Arrival", [
	new DialogueLine(global.dialogues.names.CartDriver, "I- I... What should I do!?"),
	new DialogueLine(global.dialogues.names.xie_lian, "Please do not worry.")
])

global.dialogues.puqi_arrival = new DialogueData(
	"puqi_arrival",
	[
		new DialogueLine(global.dialogues.names.xie_lian, "We finally arrived."),
		new DialogueLine(global.dialogues.names.San_Lang, "Thank you, bye bye.")
	]
);

global.dialogues.sanlang_hungry = new DialogueData(
	"sanlang_hungry",
	[
		new DialogueLine(global.dialogues.names.xie_lian, "Sorry it is not the most comfortable place but it is all I have.", Spr_Expression_XieLian_Flusterd),
		new DialogueLine(global.dialogues.names.San_Lang, "Beats the steet though.", spr_SanLang_Expression_ClosedEyes),
		new DialogueLine(global.dialogues.names.xie_lian, "I guess it does. Are you hungry? ", Spr_Expression_XieLian_Drop),
			new DialogueLine(global.dialogues.names.San_Lang, "A little maybe", spr_SanLang_Expression_Hihi),
		new DialogueLine(global.dialogues.names.xie_lian, "Okay, I'll go buy some food and make something.", Spr_Expression_XieLian_EyesClosed)
	]
);

global.dialogues.sanlang_fed_dialogue = new DialogueData(
	"sanlang_fed_dialogue",
	[
		new DialogueLine(global.dialogues.names.San_Lang, "Mm... it's delicious. Thank you gege."),
		new DialogueLine(global.dialogues.names.xie_lian, "I'm glad you liked it.")
	]
)
global.dialogues.Terminator = new DialogueData(
	"Terminator",
	[
		new DialogueLine(global.dialogues.names.Mivicike, "Memorial for the rooster called Terminator."),
		new DialogueLine(global.dialogues.names.Mivicike, "We will remember you in our hearts."),
		new DialogueLine(global.dialogues.names.Mivicike, "Rest in peace Terminator. 2025.02.25", spr_RealTerminator)
	])
global.dialogues.hualian_bed_scene = new DialogueData("hualian_bed_scene", [
	new DialogueLine("Xie Lian", "You're still awake?"),
	new DialogueLine("San Lang", "I can't sleep.")
]);
global.dialogues.NanFeng_GreenGhostReport = new DialogueData("NanFeng_GreenGhostReport", [
		new DialogueLine("Xie Lian", "... Who are you guys?", Spr_Expression_XieLian_Question),
		new DialogueLine("Fu Yao", "Fu Yao. Subordinate of general Xuan Zhen, Mu Qing", spr_FuYao_expr_Default),
		new DialogueLine("Nan Feng", "Nan Feng. Subordinate of general Nan Yang, Fen Xin", spr_NanFeng_expr_Default),
		new DialogueLine("Xie Lian", "(Nan Feng sounds oddly similar...)", Spr_Expression_XieLian_Drop),
		new DialogueLine("Xie Lian", "Did your generals send you here?", Spr_Expression_XieLian_Question),
		new DialogueLine("Fu Yao", "No, our generals don't know wer're here.", spr_FuYao_expr_Talking),
		new DialogueLine("Xie Lian", "So then, do you know who I am?", Spr_Expression_XieLian_Question),
		new DialogueLine("Fu Yao", "You are the right path for the human world and the heart of this world.", spr_FuYao_expr_EyeRoll),
		new DialogueLine("Nan Feng", "You're His Highness the Crown Prince.", spr_NanFeng_expr_Default),
		new DialogueLine("Xie Lian", "Did he just roll his eyes?", Spr_Expression_XieLian_Drop),
		new DialogueLine("Nan Feng", "Yes, please ignore him.", spr_NanFeng_expr_Scoff),
		new DialogueLine("Nan Feng", "Anyway, we came to report about a green ghost that has been spotted a few times in these areas.", spr_NanFeng_expr_Default),
		new DialogueLine("Fu Yao", "Villagers have gone missing recently and it's getting out of hand.", spr_FuYao_expr_Default),
])
;
