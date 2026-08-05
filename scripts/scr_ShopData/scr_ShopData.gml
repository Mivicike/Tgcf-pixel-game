global.items = {
    apple : new ItemData("Apple", 8, Spr_ItemApple, 1),
    bao_bun : new ItemData("Bao Bun", 15, Spr_ItemBaoBun, 2),
    apple_juice : new ItemData("Apple Juice", 18, Spr_ItemAppleJuice,),
    apple_mash : new ItemData("Apple Mash", 12, Spr_ItemAppleMash,),
    ghost_fire_red : new ItemData("Ghost Fire Red", 25, Spr_GhostFire_Red),
    ghost_fire_blue : new ItemData("Ghost Fire Blue", 25, Spr_GhostFire_Blue),
    ghost_fire_black : new ItemData("Ghost Fire Black", 25, Spr_GhostFire_Black),
    ghost_fire_green : new ItemData("Ghost Fire Green", 25, Spr_GhostFire_Green),
    ghost_fire_purple : new ItemData("Ghost Fire Purple", 25, Spr_GhostFire_Purple),
    ghost_fire_orange : new ItemData("Ghost Fire Orange", 25, Spr_GhostFire_Orange),
	peony_flower : new ItemData("Peony", 6, Spr_ItemPeony),
	chrysanthemum : new ItemData("Chrysanthemum", 4, Spr_ItemChrysanthemum),
	rose : new ItemData("Rose", 5, Spr_ItemRose),
	strange_food : new ItemData("Strange Food", 0, "spr_StrangeFood", -2),
}
global.shop_data = {
    basic_shop : new ShopData([
        global.items.apple,
        global.items.bao_bun,
        global.items.apple_juice,
        global.items.apple_mash,
    ]),
    lantern_shop : new ShopData([
        global.items.ghost_fire_red,
        global.items.ghost_fire_blue,
        global.items.ghost_fire_black,
        global.items.ghost_fire_green,
        global.items.ghost_fire_purple,
        global.items.ghost_fire_orange,
    ]),
	 flower_shop : new ShopData([
        global.items.peony_flower,
        global.items.chrysanthemum,
        global.items.rose
    ]),
}//;