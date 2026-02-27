// Strike and StrikeHB sprites seem to be connected, so let's use a function to always call them together
function SpritePair(_base, _hurt_box) constructor {
    base = _base;
    hurt_box = _hurt_box;
}

// define the order in wich we save the attack sprites
enum attack_direction {
	DOWN,
	RIGHT,
	LEFT,
	UP
}

// we will define all attack sprites: each line is a different direction for a total of 4 directions
#macro ATTACK_SPRITE_MATRIX [ \
    [new SpritePair(spr_XieLian_StrikeDown, spr_XieLian_StrikeDownHB), new SpritePair(spr_XieLian_Combo1_Down, spr_XieLian_Combo1_DownHB), new SpritePair(spr_XieLian_Combo2_Down, spr_XieLian_Combo2_DownHB)], \
    [new SpritePair(spr_XieLian_StrikeRight, spr_XieLian_StrikeRightHB), new SpritePair(spr_XieLian_Combo1_Right, spr_XieLian_Combo1_RightHB), new SpritePair(spr_XieLian_Combo2_Right, spr_XieLian_Combo2_RightHB)], \
    [new SpritePair(spr_XieLian_StrikeLeft, spr_XieLian_StrikeLeftHB), new SpritePair(spr_XieLian_Combo1_Left, spr_XieLian_Combo1_LeftHB), new SpritePair(spr_XieLian_Combo2_Left, spr_XieLian_Combo2_LeftHB)], \
    [new SpritePair(spr_XieLian_StrikeUp, spr_XieLian_StrikeUpHB), new SpritePair(spr_XieLian_Combo1_Up, spr_XieLian_Combo1_UpHB), new SpritePair(spr_XieLian_Combo2_Up, spr_XieLian_Combo2_UpHB)] \
]
