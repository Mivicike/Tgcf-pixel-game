function scr_SanLang_UpdateSprite() {
    var _new_sprite;

    if (is_attacking) {
        _new_sprite = (facing == 1) ? spr_SanLangAttack_Right : spr_SanLangAttack_Left;
    }
    else if (state == SANLANG_STATE.WALK) {
        if (moving_up) {
            _new_sprite = spr_SanLangWalk_Up;
        } else {
            _new_sprite = (facing == 1) ? spr_SanLangWalk_Right : spr_SanLangWalk_Left;
        }
    }
    else {
        _new_sprite = (facing == 1) ? spr_SanLangIdle_Right : spr_SanLangIdle_Left;
    }

    if (sprite_index != _new_sprite) {
        sprite_index = _new_sprite;
        image_index = 0;
    }
}