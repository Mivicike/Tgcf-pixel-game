if (global.yuan >= 10) {
    global.yuan -= 10;
    audio_play_sound(snd_Bought, 1, false);
    instance_create_depth(0, 0, -10010, obj_WishTextInput);
    instance_destroy(owner_popup);
} else {
    var _popup = instance_create_depth(0, 0, -10002, obj_FeedWarningPopup); 
    _popup.text = "You do not have enough money.";
    _popup.color = c_red;
}