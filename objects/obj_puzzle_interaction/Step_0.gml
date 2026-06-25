var instance = instance_place(x, y, obj_XieLian);
interacted_with = instance != noone;

if (interacted_with && inventory_contains_item(required_item)) {
    if (keyboard_check_pressed(input_key)) {
        //Trigger the interaction event
        event_user(0);
    }
}