GAME_CAMERA.center_then_apply(false, false);

switch(room)
{
    case puqi_village:
        if (state == PLAYERSTATE.DEATH) {
            // If the player is dead, we want to move the camera to the respawn location instead of the player's position
            x = obj_PlayerRespawnLocation.x;
            y = obj_PlayerRespawnLocation.y;

            // Reset the state and other properties of the player
            state = PLAYERSTATE.FREE;
            sprite_index = spr_XieLian_WalkDown;
            hspd = 0;
            vspd = 0;
            image_index = 0;
            hp = liv; // Reset health to max
        }
        break;
    default:
        // Handle other room loads if needed
        break;
}