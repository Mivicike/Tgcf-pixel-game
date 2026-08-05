global.dialogues =
{
	names : {
		shi_qingxuan : "Shi Qingxuan",
		xie_lian : "Xie Lian",
		shop_owner : "Shop Owner",
		flower_lady : "Flower Lady",
		hua_cheng : "Hua Cheng",
		lantern_seller : "Lantern Seller",
		painting : "Painting",
		basket : "Basket",
		cart_driver : "Carriage Driver",
		who : "???",
		san_lang : "San Lang",
		carriage : "Carriage",
		mivicike : "Mivicike",
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
        new DialogueLine(global.dialogues.names.flower_lady, "There sure seem to be fewer people around..."),
        new DialogueLine(global.dialogues.names.xie_lian, "Hello miss, what pretty flowers you have here", Spr_Expression_XieLian_Talking),
        new DialogueLine(global.dialogues.names.flower_lady, "Oh, Hello there! Yes, they sure are pretty. Would you like to buy?"),
        new DialogueLine(global.dialogues.names.xie_lian, "Sure! I'll take a look.", Spr_Expression_XieLian_EyesClosed),
    ],
	    global.shop_data.flower_shop
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
        new DialogueLine(global.dialogues.names.painting, "A painting of the crown prince of Xian Le, XieLian."),
        new DialogueLine(global.dialogues.names.painting, "The painting is very well made, every stroke is perfectly placed."),
      
    ],
	)
	
	global.dialogues.StaleBread = new DialogueData(
    "Basket",
    [
        new DialogueLine(global.dialogues.names.basket, "A basket with stale bread."),
        new DialogueLine(global.dialogues.names.basket, "You tried baking but accidentaly dropped in too much salt an not enough water so they've just been sitting in this basket ever since..."),
    ],
	)
	global.dialogues.xie_lian_fell_dialogue = new DialogueData(
	"XieLianFellDialogue", 
	[
	new DialogueLine(global.dialogues.names.xie_lian, "Ouch, that hurt"),
	new DialogueLine(global.dialogues.names.xie_lian, "I had nothing better to do so I decided to return to the mortal realm..."),
	new DialogueLine(global.dialogues.names.xie_lian, "Because I have no worshippers I might as well worship myself."),
	new DialogueLine(global.dialogues.names.xie_lian, "To be honest, collecting scrap isn't any better than acending."),
	new DialogueLine(global.dialogues.names.xie_lian, "I can gain merits this way at least."),
	]
	)
	global.dialogues.CartDriver1 = new DialogueData(
    "CartDriver_dialogue_1",
    [
        new DialogueLine(global.dialogues.names.xie_lian, "Hello sir! Where are you headed?", Spr_Expression_XieLian_Talking),
        new DialogueLine(global.dialogues.names.cart_driver, "Woah, hello there. Where did you come from?", undefined),
		 new DialogueLine(global.dialogues.names.cart_driver, "I am heading to Puqi Village, why?", undefined),
		new DialogueLine(global.dialogues.names.xie_lian, "That't great, would you mind me tagging along?", Spr_Expression_XieLian_EyesClosed),
		new DialogueLine(global.dialogues.names.cart_driver, "Oh, sure. Make yourself comfortable in the back.", undefined),
		new DialogueLine(global.dialogues.names.xie_lian, "Thank you so much sir. May the Gods bless you.", Spr_Expression_XieLian_EyesClosed),	
		new DialogueLine(global.dialogues.names.cart_driver, "Don't mention it.", undefined),
    ],
)
global.dialogues.cart_hualian = new DialogueData("cart_hualian", [
	new DialogueLine(global.dialogues.names.xie_lian, "Hello there. I didn't see you when I got on."),
	new DialogueLine(global.dialogues.names.who, "Hello."),
	new DialogueLine(global.dialogues.names.who, "What are you reading?"),
	new DialogueLine(global.dialogues.names.xie_lian, "Catalogue of 100 Gods. It's just something I found during my travels."),
	new DialogueLine(global.dialogues.names.who, "Really? What's it about?"),
	new DialogueLine(global.dialogues.names.xie_lian, "..."),
	new DialogueLine(global.dialogues.names.xie_lian, "Gods... It says here that the Crown Prince of Xian Le is a trash god..."),
	new DialogueLine(global.dialogues.names.who, "Is that so? I don't think he's a trash god. He's quite astonishing."),
	new DialogueLine(global.dialogues.names.xie_lian, "Oh, really!? You know about the Crown Prince of Xian Le, Xie Lian?"),
	new DialogueLine(global.dialogues.names.who, "Of course I do."),
	new DialogueLine(global.dialogues.names.xie_lian, "Sadly, not many people know about him these days."),
	new DialogueLine(global.dialogues.names.xie_lian, "You seem to know so much, yet you're so young."),
	new DialogueLine(global.dialogues.names.who, "It's just something I learned about in my free time."),
	new DialogueLine(global.dialogues.names.xie_lian, "Do you know anything about ghosts?"),
	new DialogueLine(global.dialogues.names.who, "Which ones? There are many."),
	new DialogueLine(global.dialogues.names.xie_lian, "What do you know about the Crimson Rain Sought Flower?"),
	new DialogueLine(global.dialogues.names.who, "..."),
	new DialogueLine(global.dialogues.names.who, "Why him specifically?"),
	new DialogueLine(global.dialogues.names.xie_lian, "Just curious."),
	new DialogueLine(global.dialogues.names.who, "... What do you want to know about him?"),
	new DialogueLine(global.dialogues.names.xie_lian, "Hmm..."),
	new DialogueLine(global.dialogues.names.xie_lian, "What did he look like?"),
	new DialogueLine(global.dialogues.names.who, "... What do you think he looked like?"),
	new DialogueLine(global.dialogues.names.xie_lian, "I assume he has many forms. As a teenager, he probably looked something like you."),
	new DialogueLine(global.dialogues.names.who, "You can't be sure, though. He's blind in his right eye."),
	new DialogueLine(global.dialogues.names.xie_lian, "Oh, that's right."),
	new DialogueLine(global.dialogues.names.xie_lian, "By the way, I haven't asked your name."),
	new DialogueLine(global.dialogues.names.san_lang, "I'm the third-born son, so everyone calls me San Lang."),
	new DialogueLine(global.dialogues.names.xie_lian, "Where are you headed?"),
	new DialogueLine(global.dialogues.names.san_lang, "Honestly, I have no idea. I'm just wandering around."),
	new DialogueLine(global.dialogues.names.san_lang, "THUD", undefined, snd_Thud),
	new DialogueLine(global.dialogues.names.xie_lian, "What happened? Are you alright?"),
	new DialogueLine(global.dialogues.names.cart_driver, "I don't know! There seem to be GHOSTS!"),
	]
)
// San Lang Dialogues
global.dialogues.SanLang_Generic_Default = new DialogueData("SanLang_Generic_Default",
	[
		new DialogueLine(global.dialogues.names.san_lang, "...", spr_SanLang_Expression_Default)
	]
	
);
global.dialogues.SanLang_AgreeToFollow = new DialogueData("SanLang_AgreeToFollow",
	[
		new DialogueLine(global.dialogues.names.san_lang, "Oh of course, where are we headed?", spr_SanLang_Expression_ClosedEyes)
	]
);

global.dialogues.SanLang_AgreeToStay = new DialogueData("SanLang_AgreeToStay",
    [
        new DialogueLine(global.dialogues.names.san_lang, "Ohh... Alright, I will stay here then...", spr_SanLang_Expression_LittleSad)
    ]
);

global.dialogues.SanLang_WhatAreYouUpTo = [
    new DialogueData("SanLang_WhatAreYouUpTo1", [
        new DialogueLine(global.dialogues.names.san_lang, "Nothing much. Does gege want something?", spr_SanLang_Expression_Default)
    ]),
    new DialogueData("SanLang_WhatAreYouUpTo2", [
        new DialogueLine(global.dialogues.names.san_lang, "I was just thinking about you Gege!", spr_SanLang_Expression_Happy)
    ]),
    new DialogueData("SanLang_WhatAreYouUpTo3", [
        new DialogueLine(global.dialogues.names.san_lang, "Admiring you.", spr_SanLang_Expression_Love)
    ])
];

global.dialogues.SanLang_ItemGifts_Default = new DialogueData("SanLang_ItemGifts_Default",
    [
        new DialogueLine(global.dialogues.names.san_lang, "AAAA THANK YOU SO MUCH GEGE I LOVE IT!", spr_SanLang_Expression_Happy)
    ]
);

global.dialogues.SanLang_ItemGifts = {
"Ghost Fire": new DialogueData("SanLang_Gift_GhostFire", [
new DialogueLine(global.dialogues.names.san_lang, "...", spr_SanLang_Expression_LittleSad),
])

}
global.dialogues.CarriageDriver_GhostArrival = new DialogueData("Carriage Driver Arrival", [
	new DialogueLine(global.dialogues.names.cart_driver, "I- I... What should I do!?"),
	new DialogueLine(global.dialogues.names.xie_lian, "Please do not worry.")
])

global.dialogues.puqi_arrival = new DialogueData(
	"puqi_arrival",
	[
		new DialogueLine(global.dialogues.names.cart_driver, "We've arrived."),
		new DialogueLine(global.dialogues.names.xie_lian, "Thank you so much!", Spr_Expression_XieLian_EyesClosed),
		new DialogueLine(global.dialogues.names.cart_driver, "Don't mention it! I should be the one thanking you!"),
		new DialogueLine(global.dialogues.names.cart_driver, "I don't know what I would've done back there."),
		new DialogueLine(global.dialogues.names.xie_lian, "It's the least I could do.", Spr_Expression_XieLian_Talking),
		new DialogueLine(global.dialogues.names.xie_lian, "By the way, San Lang. You mentioned that you are just wandering around, do you have a place to stay?", Spr_Expression_XieLian_Question),
		new DialogueLine(global.dialogues.names.san_lang, "Well... Sadly I do not. I can just sleep on the steet..", spr_SanLang_Expression_Hihi),
		new DialogueLine(global.dialogues.names.xie_lian, "Then... Why don't you stay at my place?", Spr_Expression_XieLian_EyesClosed),
		new DialogueLine(global.dialogues.names.san_lang, "Really!?", spr_SanLang_Expression_Happy),
		new DialogueLine(global.dialogues.names.xie_lian, "Of course. It's not my shrine to begin with, aaand It's quite dirty...", Spr_Expression_XieLian_Drop),
		new DialogueLine(global.dialogues.names.san_lang, "What are we waiting for? Let's go!", spr_SanLang_Expression_ClosedEyes),
	]
);

global.dialogues.sanlang_hungry = new DialogueData(
	"sanlang_hungry",
	[
		new DialogueLine(global.dialogues.names.xie_lian, "Sorry it is not the most comfortable place but it is all I have.", Spr_Expression_XieLian_Flusterd),
		new DialogueLine(global.dialogues.names.san_lang, "Beats the steet though.", spr_SanLang_Expression_ClosedEyes),
		new DialogueLine(global.dialogues.names.xie_lian, "I guess it does. Are you hungry? ", Spr_Expression_XieLian_Drop),
			new DialogueLine(global.dialogues.names.san_lang, "A little maybe", spr_SanLang_Expression_Hihi),
		new DialogueLine(global.dialogues.names.xie_lian, "Okay, I'll go buy some food and make something.", Spr_Expression_XieLian_EyesClosed)
	]
);

global.dialogues.sanlang_fed_dialogue = new DialogueData(
	"sanlang_fed_dialogue",
	[
		new DialogueLine(global.dialogues.names.san_lang, "Mm... it's delicious. Thank you gege."),
		new DialogueLine(global.dialogues.names.xie_lian, "I'm glad you liked it.")
	]
)
global.dialogues.Terminator = new DialogueData(
	"Terminator",
	[
		new DialogueLine(global.dialogues.names.mivicike, "Memorial for the rooster called Terminator."),
		new DialogueLine(global.dialogues.names.mivicike, "We will remember you in our hearts."),
		new DialogueLine(global.dialogues.names.mivicike, "Rest in peace Terminator. 2025.02.25", spr_RealTerminator)
	])
global.dialogues.hualian_bed_scene = new DialogueData("hualian_bed_scene", [
	new DialogueLine(global.dialogues.names.xie_lian, "You're still awake?"),
	new DialogueLine(global.dialogues.names.san_lang, "I can't sleep."),
	new DialogueLine(global.dialogues.names.xie_lian, "I don't know what to write here..."),
]);
global.dialogues.NanFeng_GreenGhostReport = new DialogueData("NanFeng_GreenGhostReport", [
		new DialogueLine(global.dialogues.names.xie_lian, "... Who are you guys?", Spr_Expression_XieLian_Question),
		new DialogueLine(global.dialogues.names.fu_yao, "Fu Yao. Subordinate of general Xuan Zhen, Mu Qing", spr_FuYao_expr_Default),
		new DialogueLine(global.dialogues.names.nan_feng, "Nan Feng. Subordinate of general Nan Yang, Fen Xin", spr_NanFeng_expr_Default),
		new DialogueLine(global.dialogues.names.xie_lian, "(Nan Feng sounds oddly similar...)", Spr_Expression_XieLian_Drop),
		new DialogueLine(global.dialogues.names.xie_lian, "Did your generals send you here?", Spr_Expression_XieLian_Question),
		new DialogueLine(global.dialogues.names.fu_yao, "No, our generals don't know wer're here.", spr_FuYao_expr_Talking),
		new DialogueLine(global.dialogues.names.xie_lian, "So then, do you know who I am?", Spr_Expression_XieLian_Question),
		new DialogueLine(global.dialogues.names.fu_yao, "You are the right path for the human world and the heart of this world.", spr_FuYao_expr_EyeRoll),
		new DialogueLine(global.dialogues.names.nan_feng, "You're His Highness the Crown Prince.", spr_NanFeng_expr_Default),
		new DialogueLine(global.dialogues.names.xie_lian, "Did he just roll his eyes?", Spr_Expression_XieLian_Drop),
		new DialogueLine(global.dialogues.names.nan_feng, "Yes, please ignore him.", spr_NanFeng_expr_Scoff),
		new DialogueLine(global.dialogues.names.nan_feng, "Anyway, we came to report about a green ghost that has been spotted a few times in these areas.", spr_NanFeng_expr_Default),
		new DialogueLine(global.dialogues.names.fu_yao, "Villagers have gone missing recently and it's getting out of hand.", spr_FuYao_expr_Default),
])
global.dialogues.wwx = new DialogueData(
	"WWX",
	[
		new DialogueLine(global.dialogues.names.who, "Little apple would love this."),
		new DialogueLine(global.dialogues.names.xie_lian, "Who's little apple?", Spr_Expression_XieLian_EyesClosed),
		new DialogueLine(global.dialogues.names.who, "..."),
		new DialogueLine(global.dialogues.names.who, "My pet donkey."),
		new DialogueLine(global.dialogues.names.xie_lian, "Okay, I haven't seen you here before where are you from?", Spr_Expression_XieLian_Question),
		new DialogueLine(global.dialogues.names.who, "Uhhh... You wouldn't know the place.",),
		new DialogueLine(global.dialogues.names.xie_lian, "Oh, alright. Have a nice day then.", Spr_Expression_XieLian_Talking),
	])
;
