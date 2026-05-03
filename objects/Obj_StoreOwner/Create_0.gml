event_inherited(); // from Obj_Npc_Parent

// Override the dialogue from parent
dialogue = [
    { name: "Store Owner", msg: "hellu there I will test the shop system here hehe" },
    { name: "Store Owner", msg: "After pressing Z once more move around a little then the shop should appear" },
];

// Flag so shop opens after dialogue ends
open_shop_after_dialogue = true;