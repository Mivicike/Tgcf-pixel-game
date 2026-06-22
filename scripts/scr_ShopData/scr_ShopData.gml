global.items = {
    apple: new ItemData("Apple", 5, Spr_ItemApple),
    baobun: new ItemData("Bao Bun", 8, Spr_ItemBaoBun),
    apple_juice: new ItemData("Apple Juice", 10, Spr_ItemAppleJuice),
    apple_mash: new ItemData("Apple Mash", 6, Spr_ItemAppleMash),
    red_fire: new ItemData("Red Fire", 6, Spr_GhostFire_Red),
    blue_fire: new ItemData("Blue Fire", 6, Spr_GhostFire_Blue),
    ghost_fire: new ItemData("Ghost Fire", 6, Spr_GhostFire)
}

global.shop_data = {
    basic_shop :
    [
        global.items.apple,
        global.items.baobun,
        global.items.apple_juice,
        global.items.apple_mash
    ],
    lantern_seller :
    [
        global.items.red_fire,
        global.items.blue_fire,
        global.items.ghost_fire
    ]
}